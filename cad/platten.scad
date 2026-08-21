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
//  Zellblock 16 — Zwischenplatte und Deckel
//
//  Die Zwischenplatte ist das Bauteil, an dem die Höhenbilanz hängt.
//  Sie sitzt auf den Zellgehäusen der unteren Etage auf (195,5 mm) und
//  nimmt deren 5 mm überstehende Pole samt Busbars und Muttern in
//  Kanälen auf, statt sie obendrauf zu addieren. Ohne diesen Kunstgriff
//  käme der Aufbau auf 436 statt 425 mm und wäre gescheitert.
//
//  Ausgabe:
//    openscad -D 'teil="zwischen"' -o zwischenplatte.stl platten.scad
//    openscad -D 'teil="deckel"'   -o deckel.stl         platten.scad
// ═══════════════════════════════════════════════════════════════════

include <parameter.scad>
use <kontur.scad>

teil = "zwischen";   // "zwischen" | "deckel" | "beide"

plattenspiel = 0.5;    // je Seite gegen die Gehäusewand
kanal_b      = 28;     // Breite der Busbarkanäle
kanal_t      = 9;      // Tiefe: Pol 5 mm + Busbar 3 mm + Luft
rest_dicke   = zwischenplatte - kanal_t;   // 3 mm über den Kanälen

module platte_2d(spiel = plattenspiel) {
    offset(delta = -spiel) innen_2d();
}

// ── Zwischenplatte ─────────────────────────────────────────────────
module zwischenplatte_teil() {
    difference() {
        linear_extrude(height = zwischenplatte) platte_2d();

        // Vier Längskanäle von unten, je einer über einer Polspalte.
        // Zwischen ihnen bleiben 35–39 mm massives Material stehen, die
        // Platte wird also nicht in Streifen zerlegt.
        for (x = pol_spalten())
            translate([x - kanal_b/2, wand_stirn - 1, -1])
                cube([kanal_b, bauraum_t, kanal_t + 1]);

        // Durchführung für die Etagenverbindung und die Balancerkabel,
        // im hinteren Bereich beim BMS, wo keine Zelle darauf steht.
        translate([bauraum_b/2, platte_vorn_y + endplatte_dicke + 12,
                   -1])
            cylinder(d = 22, h = zwischenplatte + 2);

        kennzeichnung("ZW-01");
    }
}

// ── Deckel ─────────────────────────────────────────────────────────
module deckel_teil() {
    difference() {
        linear_extrude(height = deckel_dicke)
            offset(delta = -auflage_b + 0.6) innen_2d();
        lueftungsfeld();
        deckelschrauben();
        kennzeichnung("DE-01");
    }
}

// Großzügige Lüftung: Hier ist Fläche vorhanden, anders als in den
// Stirnwänden des Kopfraums, wo nur 216 mm² zusammenkamen.
module lueftungsfeld() {
    schlitz_b = 5;
    schlitz_l = 34;
    nx = 7; ny = 3;
    flaeche = nx * ny * schlitz_b * schlitz_l;
    for (i = [0 : nx - 1])
        for (j = [0 : ny - 1])
            translate([bauraum_b*(i + 0.5)/nx - schlitz_b/2,
                       bauraum_t*(j + 0.5)/ny - schlitz_l/2, -1])
                cube([schlitz_b, schlitz_l, deckel_dicke + 2]);
    echo(str("Deckel-Lüftungsfläche ", flaeche, " mm²"));
}

module deckelschrauben() {
    for (x = [ fach_b/2, bauraum_b - fach_b/2 ])
        for (y = [ wand_stirn + 7, bauraum_t - wand_stirn - 7 ])
            translate([x, y, -1]) {
                cylinder(d = 3.4, h = deckel_dicke + 2);
                translate([0, 0, deckel_dicke - 1.8 + 1])
                    cylinder(d1 = 3.4, d2 = 6.6, h = 1.9);
            }
}

module kennzeichnung(txt) {
    translate([bauraum_b/2, wand_stirn + 22, -0.01])
        linear_extrude(height = 0.9)
            text(txt, size = 9, halign = "center", valign = "center",
                 font = "Helvetica:style=Bold");
}

// ── Ausgabe ────────────────────────────────────────────────────────
if (teil == "zwischen")    zwischenplatte_teil();
else if (teil == "deckel") deckel_teil();
else {
    zwischenplatte_teil();
    translate([0, bauraum_t + 40, 0]) deckel_teil();
}

assert(rest_dicke >= 3,
  "Über den Busbarkanälen bleiben weniger als 3 mm Material.");
echo(str("Zwischenplatte ", zwischenplatte, " mm, davon ", kanal_t,
         " mm Kanal, ", rest_dicke, " mm tragend"));
