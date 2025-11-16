# GDD-Auszug: Tileset-Design "Flüsterwald"

Dieses Dokument beschreibt das Design des Tilesets für das Biom "Flüsterwald", basierend auf der Art Style Bible in Phase P1.3.

## 1. Visuelle Philosophie

- **Stimmung:** Der Wald soll sich magisch, uralt und einladend anfühlen. Er ist ein Ort der Entdeckung, nicht der Gefahr. Die Beleuchtung spielt eine große Rolle, mit Sonnenstrahlen ("God Rays"), die durch ein dichtes Blätterdach fallen.
- **Stil:** Detaillierte 32x32 Pixel-Art-Kacheln. Der Stil orientiert sich an *Stardew Valley*, legt aber einen stärkeren Fokus auf weiche Kanten und organische Formen.
- **Farbpalette:** Nutzt primär die Olivgrün-, Braun- und Ocker-Töne aus der `palette.gpl`. Akzente werden mit Lavendel und Creme für magische Elemente (z.B. leuchtende Pilze) gesetzt.

## 2. Tileset-Komponenten

Das Tileset muss modular sein, um abwechslungsreiche und natürlich wirkende Karten zu ermöglichen.

### Bodentexturen:

1.  **Gras (Basis):**
    - Ein sattes, leicht unregelmäßiges Olivgrün.
    - Variationen mit kleinen Blumen, Klee oder Moosflecken.
2.  **Erdpfad:**
    - Ein Trampelpfad aus festgestampfter Erde (Ocker- und Brauntöne).
    - Übergangs-Kacheln (Auto-Tiling), die weich in das Gras übergehen.
3.  **Akzent-Boden:**
    - Bereiche mit Laub, kleinen Kieselsteinen oder freiliegenden Wurzeln.

### Vegetation:

1.  **Bäume:**
    - **Laubbäume:** Große, ausladende Kronen, die Schatten werfen. Die Stämme sind dick und mit Moos bewachsen. (Mehrere Kacheln hoch).
    - **Nadelbäume:** Dunklere, schlankere Silhouetten.
    - **Blätterdach:** Separate Kacheln für das Blätterdach, die über den Spieler gezeichnet werden können, um ein Gefühl von Tiefe zu erzeugen.
2.  **Büsche & Sträucher:**
    - Verschiedene Formen und Größen. Einige tragen Beeren (je nach Jahreszeit).
3.  **Pflanzen & Blumen:**
    - Farne, Wildblumen (in Akzentfarben), Pilzgruppen (einige davon könnten schwach leuchten).

### Objekte & Dekoration:

1.  **Felsen & Steine:**
    - Große, moosbewachsene Felsen.
    - Kleine Kieselsteine zur Dekoration von Pfaden.
2.  **Totholz:**
    - Umgefallene Baumstämme (die der Spieler überqueren kann).
    - Baumstümpfe.
3.  **Wasser:**
    - Ein kleiner Bach oder Teich mit klarem, blauem Wasser.
    - Sanfte Ufer-Kacheln mit Schilf oder Steinen.

### Strukturelle Elemente:

1.  **Klippen & Abhänge:**
    - Erdige oder felsige Klippen, um Höhenunterschiede darzustellen.
    - Inklusive Kanten und Ecken für flexible Level-Gestaltung.

## 3. Platzhalter-Datei

Dies ist eine textuelle Beschreibung. Die eigentliche Tileset-Datei (z.B. `forest_tileset.png`) wird hier erwartet: `assets/art/tilesets/forest_tileset.png`.
