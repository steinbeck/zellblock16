// ═══════════════════════════════════════════════════════════════════
//  Zellblock 16 — Konturen
//
//  Die Außenkontur ist die Vereinigungsmenge dreier
//  Kraftpaket-Grundrisse. Sie passt damit per Konstruktion in den
//  Schacht, und die Einbuchtungen an den ehemaligen Trennebenen
//  nehmen die Führungsrippen auf, ohne dass am Fahrzeug gefräst wird.
// ═══════════════════════════════════════════════════════════════════

include <parameter.scad>

// Ein Originalfach: Rechteck fach_b × bauraum_t mit gerundeten
// Vertikalkanten.
module fach_2d(r = eckradius) {
    translate([r, r])
        offset(r = r)
            square([fach_b - 2*r, bauraum_t - 2*r]);
}

// Außenkontur: drei Fächer nebeneinander.
//
// Wo zwei Fächer aneinanderstoßen, treffen sich an Vorder- und
// Rückkante zwei Viertelrundungen. Dazwischen bleibt eine linsenförmige
// Einbuchtung von 2·r Breite und r Tiefe stehen — das ist die
// Zwickelnut, in die die Führungsrippe greift. Sie entsteht von selbst
// aus der Vereinigung; sie wird nicht konstruiert.
module aussen_2d() {
    union()
        for (i = [0 : 2])
            translate([i * fach_b, 0])
                fach_2d();
}

// Innenkontur: schlichtes Rechteck. Die Zwickel gehören nach außen,
// innen soll der Raum durchgehend und glatt sein.
module innen_2d(r = 3) {
    translate([wand_seite + r, wand_stirn + r])
        offset(r = r)
            square([innen_b - 2*r, innen_t - 2*r]);
}

// Wandquerschnitt als Ring.
module wand_2d() {
    difference() {
        aussen_2d();
        innen_2d();
    }
}

// Grundriss einer Zellebene, für Passungsprüfungen und spätere Teile.
// Der Zellblock wird in der Breite mittig gesetzt, in der Tiefe an die
// hintere Endplatte geschoben.
module zellen_2d(tol = 0) {
    x0 = (bauraum_b - zellblock_b) / 2;
    y0 = wand_stirn + endplatte_dicke;
    for (i = [0 : zellen_je_reihe - 1])
        for (j = [0 : zellen_je_stapel - 1])
            translate([x0 + i * zelle_l - tol,
                       y0 + j * zelle_t - tol])
                square([zelle_l + 2*tol, zelle_t + 2*tol]);
}

// Polpositionen einer Zellebene. Jede Zelle trägt zwei Pole im Abstand
// zelle_polabst, mittig auf ihrer Oberseite. Daraus ergibt sich ein
// Raster von 4 Spalten × 4 Reihen = 16 Polen je Etage.
module pol_positionen() {
    x0 = (bauraum_b - zellblock_b) / 2;
    y0 = wand_stirn + endplatte_dicke;
    for (i = [0 : zellen_je_reihe - 1])
        for (j = [0 : zellen_je_stapel - 1])
            for (s = [-1, 1])
                translate([x0 + i*zelle_l + zelle_l/2 + s*zelle_polabst/2,
                           y0 + j*zelle_t + zelle_t/2])
                    children();
}

// Die x-Lagen der vier Polspalten, für die Busbarkanäle.
function pol_spalten() = [
    for (i = [0 : zellen_je_reihe - 1], s = [-1, 1])
        (bauraum_b - zellblock_b)/2 + i*zelle_l + zelle_l/2
        + s*zelle_polabst/2
];
