# GDD-Auszug: Spielercharakter-Design

Dieses Dokument beschreibt das Design des Spielercharakters für "Projekt Sonnenwende-Gefährten", basierend auf der Art Style Bible in Phase P1.3.

## 1. Visuelle Philosophie

- **Stil:** Weiche, freundliche Pixel-Art, die zur "Cozy"-Ästhetik passt. Die Proportionen sind leicht "chibi"-haft, um den Charakter sympathisch und weniger einschüchternd wirken zu lassen (ähnlich wie in *Stardew Valley* oder *Eastward*).
- **Anpassbarkeit:** Der Basis-Charakter ist absichtlich androgyn und einfach gehalten, um als Leinwand für die spätere, tiefgreifende Charakteranpassung (Frisuren, Hautfarben, Kleidung) zu dienen.
- **Farbpalette:** Hält sich strikt an die definierte `palette.gpl`.

## 2. Basis-Charakter Beschreibung

- **Größe:** ca. 32x48 Pixel. Dies bietet genug Detail für Ausdruck, ohne überladen zu wirken.
- **Körperbau:** Schlank, mit leicht übergroßem Kopf und großen, ausdrucksstarken Augen.
- **Standard-Kleidung:** Eine einfache Leinentunika (in einem neutralen Creme-Ton), eine robuste Hose (in einem sanften Braun) und einfache Stiefel. Dieses Outfit ist praktisch für die Arbeit im Refugium und die Erkundung der Welt.

## 3. Sprite-Sheet Anforderungen (für Prototyp P1.4)

Für den ersten Prototyp benötigen wir ein Sprite-Sheet, das die folgenden grundlegenden Animationen in 4 Richtungen (Oben, Unten, Links, Rechts) abdeckt.

### Animationen:

1.  **Idle (Stillstand):**
    - Eine subtile Animation, bei der der Charakter leicht auf und ab "atmet".
    - Eventuell ein Blinzeln alle paar Sekunden.
    - *Frames:* 2-4 Frames pro Richtung.

2.  **Walk (Laufen):**
    - Eine flüssige Laufanimation. Arme und Beine schwingen leicht mit.
    - Der Kopf bewegt sich leicht auf und ab.
    - *Frames:* 6-8 Frames pro Richtung.

3.  **Interact (Interagieren):**
    - Eine einfache Animation, bei der der Charakter einen Arm nach vorne streckt, um ein Objekt aufzuheben oder mit einem NPC zu sprechen.
    - Kann für den Prototyp eine einzelne Frame-Pose sein.
    - *Frames:* 1-2 Frames pro Richtung.

## 4. Platzhalter-Datei

Dies ist eine textuelle Beschreibung. Die eigentliche Sprite-Sheet-Datei (z.B. `player_character.png`) wird hier erwartet: `assets/art/sprites/player_character.png`. Für den Prototyp kann ein einfacher, einfarbiger Kasten als Platzhalter dienen, bis die finalen Grafiken erstellt sind.
