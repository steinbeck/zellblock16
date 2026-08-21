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
//  Zellblock 16 — Testring T-01
//
//  Musterstück vor der Vollausführung. konstruktion.md §11.1
//
//  Prüft in einem Zug:
//    1. Passung der Außenkontur in den Akkuschacht
//    2. Eingriff der Führungsrippen in die Zwickelnuten
//    3. Innenmaß gegen zwei echte Zellen nebeneinander
//
//  Der Schritt ist nicht verhandelbar: In der Breite bleiben
//  1,7 mm Spiel je Seite bei einer erwarteten Drucktoleranz von
//  ±0,4 mm. Ein Fehldruck des Vollteils kostet 3 kg Material und
//  über 30 Stunden.
//
//  Ausgabe:  openscad -o testring.stl testring.scad
// ═══════════════════════════════════════════════════════════════════

include <parameter.scad>
use <kontur.scad>

ring_h    = 40;   // Höhe des Musterstücks
marke_t   =  0.8; // Tiefe der eingeprägten Beschriftung
version   = "T-01";

module beschriftung() {
    // Von außen in die Vorderwand eingeprägt, damit auf mehreren
    // Testdrucken erkennbar bleibt, welcher Stand in der Hand liegt.
    // rotate([90,0,0]) kippt die Extrusionsrichtung von +z nach -y,
    // die Vertiefung läuft also von y = marke_t nach y = 0.
    translate([bauraum_b/2, marke_t + 0.01, ring_h/2])
        rotate([90, 0, 0])
            linear_extrude(height = marke_t + 0.02)
                text(str("ZB16 ", version, "  ",
                         innen_b, "x", innen_t),
                     size = 5.5, halign = "center", valign = "center",
                     font = "Helvetica:style=Bold");
}

module hoehenmarken() {
    // Alle 10 mm eine Kerbe an der linken Außenwand. Wenn der Ring im
    // Schacht klemmt, lässt sich daran ablesen, wie tief er kam.
    for (z = [10 : 10 : ring_h - 10])
        translate([-0.5, bauraum_t/2 - 12, z - 0.6])
            cube([1.6, 24, 1.2]);
}

module zellmarken() {
    // Zwei 2 mm hohe Stege markieren innen, wo der Zellblock steht.
    // Damit lässt sich das Innenmaß gegen zwei echte Zellen prüfen,
    // ohne nachzumessen: passen sie zwischen die Stege, stimmt es.
    x0 = (bauraum_b - zellblock_b) / 2;
    for (x = [x0 - 1.5, x0 + zellblock_b + 0.5])
        translate([x, wand_stirn, 0])
            cube([1.0, 18, 2]);
}

module testring() {
    difference() {
        // Unterseite bleibt plan: nur so lässt sich mit einer
        // Fühlerlehre prüfen, ob der Ring wirklich auf dem
        // Schachtboden aufsitzt und nicht irgendwo hängt.
        union() {
            linear_extrude(height = ring_h) wand_2d();
            zellmarken();
        }
        beschriftung();
        hoehenmarken();
    }
}

testring();

// Kontrollausgabe
echo(str("Testring ", version, ": Aussen ", bauraum_b, " × ", bauraum_t,
         ", Innen ", innen_b, " × ", innen_t, ", Höhe ", ring_h));
