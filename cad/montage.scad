// SPDX-License-Identifier: CERN-OHL-S-2.0
//
// Copyright 2026 Christoph Steinbeck
//
// This source describes Open Hardware and is licensed under the CERN-OHL-S v2.
// You may redistribute and modify this source and make products using it under
// the terms of the CERN-OHL-S v2 (https://ohwr.org/cern_ohl_s_v2.txt).
// This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING
// OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE.
// Please see the CERN-OHL-S v2 for applicable conditions.

// ═══════════════════════════════════════════════════════════════════
//  Zellblock 16 — Gesamtaufbau
//
//  Dient der Anschauung und den Bildern in der Dokumentation. Die
//  Zellen und das Aluskelett sind hier vereinfacht dargestellt; sie
//  werden nicht gefertigt, sondern gekauft.
//
//    openscad -D 'ansicht="schnitt"'   -o ../docs/img/schnitt.png ...
//    openscad -D 'ansicht="explosion"' -o ../docs/img/explosion.png ...
// ═══════════════════════════════════════════════════════════════════

include <parameter.scad>
use <kontur.scad>
use <gehaeuse.scad>
use <platten.scad>

ansicht = "schnitt";   // "zusammen" | "schnitt" | "explosion"
ex = (ansicht == "explosion") ? 1 : 0;   // Explosionsfaktor

C_GEHAEUSE = [0.82, 0.84, 0.86];
C_ZELLE    = [0.16, 0.20, 0.28];
C_POL      = [0.72, 0.55, 0.28];
C_ALU      = [0.62, 0.65, 0.68];
C_STAHL    = [0.35, 0.37, 0.40];
C_PLATTE   = [0.74, 0.76, 0.78];

// ── Zelle: EVE LF105 ───────────────────────────────────────────────
module zelle() {
    color(C_ZELLE) cube([zelle_l, zelle_t, zelle_h2]);
    color(C_POL)
        for (s = [-1, 1])
            translate([zelle_l/2 + s*zelle_polabst/2 - 9,
                       zelle_t/2 - 9, zelle_h2])
                cube([18, 18, zelle_h1 - zelle_h2]);
}

module zellebene(z) {
    x0 = (bauraum_b - zellblock_b) / 2;
    y0 = wand_stirn + endplatte_dicke;
    for (i = [0 : zellen_je_reihe - 1])
        for (j = [0 : zellen_je_stapel - 1])
            translate([x0 + i*zelle_l, y0 + j*zelle_t, z])
                zelle();
}

// ── Aluskelett ─────────────────────────────────────────────────────
module endplatten() {
    color(C_ALU)
        for (y = [platte_hinten_y, platte_vorn_y])
            translate([(bauraum_b - endplatte_b)/2, y, boden_dicke])
                cube([endplatte_b, endplatte_dicke, endplatte_h]);
}

module zugstangen() {
    color(C_STAHL)
        for (z = [boden_dicke + 55, boden_dicke + 150,
                  boden_dicke + 250, boden_dicke + 345])
            for (x = [bauraum_b/2 - 95, bauraum_b/2 + 95])
                translate([x, platte_hinten_y - 6, z])
                    rotate([-90, 0, 0])
                        cylinder(d = zugstange_d,
                                 h = platte_vorn_y - platte_hinten_y
                                     + endplatte_dicke + 12);
}

// ── Aufbau ─────────────────────────────────────────────────────────
module aufbau() {
    color(C_GEHAEUSE) segment_unten();
    translate([0, 0, fuge_z + ex*250]) color(C_GEHAEUSE) segment_oben();

    translate([0, 0, ex*60]) endplatten();
    translate([0, ex*90, 0]) zugstangen();

    translate([0, 0, boden_dicke + ex*45]) zellebene(0);

    translate([0, 0, boden_dicke + zelle_h2 + ex*180])
        color(C_PLATTE)
            translate([wand_seite + 0.5, wand_stirn + 0.5, 0])
                zwischenplatte_teil();

    translate([0, 0, boden_dicke + zelle_h2 + zwischenplatte + ex*470])
        zellebene(0);

    translate([0, 0, hoehe_belegt - deckel_dicke + ex*640])
        color(C_PLATTE)
            translate([auflage_b + wand_seite - 0.6,
                       auflage_b + wand_stirn - 0.6, 0])
                deckel_teil();
}

// Schnitt in der Tiefe, mitten durch den Zellstapel: So werden beide
// Etagen, die Zwischenplatte mit ihren Busbarkanälen und die hintere
// Endplatte auf einmal sichtbar. Ein Schnitt in der Breite zeigte nur
// die Aluplatte von der Seite.
schnitt_y = wand_stirn + endplatte_dicke + 2*zelle_t;

if (ansicht == "schnitt")
    difference() {
        aufbau();
        translate([-10, schnitt_y, -10])
            cube([bauraum_b + 20, bauraum_t, bauraum_h + 20]);
    }
else
    aufbau();
