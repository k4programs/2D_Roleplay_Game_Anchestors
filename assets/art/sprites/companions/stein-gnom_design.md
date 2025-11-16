# GDD-Auszug: Gefährten-Design "Stein-Gnom"

Dieses Dokument beschreibt das Design des Gefährten "Stein-Gnom" für "Projekt Sonnenwende-Gefährten".

## 1. Visuelles Design & Philosophie

- **Konzept:** Ein kleiner, robuster und etwas mürrischer, aber gutmütiger Erdgeist. Er ist mit den Mineralien und Höhlen der Welt verbunden und ein geborener Handwerker.
- **Stil:** Kompakt und erdig. Klobige, stabile Formen. Hält sich an die `palette.gpl`, mit Fokus auf Grau-, Braun- und Terracotta-Tönen.
- **Größe:** Klein, aber breit, ca. 28x28 Pixel.
- **Aussehen:**
    - **Körper:** Besteht aus abgerundeten, steinähnlichen Segmenten. Die Textur wirkt wie glatter, moosbewachsener Fels.
    - **Besonderheit:** Anstelle von Haaren hat er einen Kristall-Cluster auf dem Kopf (z.B. in Bernstein- oder Lavendelfarben). Seine Augen leuchten schwach aus dem steinernen Gesicht.
    - **Arme & Beine:** Kurze, stämmige Gliedmaßen.

## 2. Gameplay-Informationen (gemäß GDD)

- **Biom:** **Kristallhöhlen**. Man findet ihn oft in der Nähe von Erz-Adern, wo er mit einem kleinen Hammer auf Steine klopft.
- **Verhalten in der Wildnis:** Er ist stur und territorial. Er blockiert einen schmalen Durchgang in den Höhlen und lässt niemanden vorbei. Er brummt nur, wenn man ihn anspricht.
- **Methode zum Anfreunden (Vertrauensaufbau):**
    1.  **Entdeckung:** Der Spieler trifft auf den Stein-Gnom, der einen Pfad blockiert. Ein Dialog-Fenster zeigt nur ein mürrisches "GRMPF... HUNGER..." an.
    2.  **Rätsel:** Der Spieler muss herausfinden, was der Gnom essen möchte. Ein Hinweis könnte in einem alten Buch in der Dorfbibliothek oder durch einen Gesprächsfetzen mit einem anderen NPC gefunden werden ("Diese Stein-Geister lieben alles, was salzig ist!").
    3.  **Lösung:** Der Spieler muss einen **Salzkristall** finden (ein sammelbares Mineral in den oberen Ebenen der Höhle) und ihn dem Stein-Gnom geben.
    4.  **Einladung:** Der Gnom isst den Kristall mit einem lauten Knirschen, rückt zufrieden zur Seite und gibt den Weg frei. Er schaut den Spieler dankbar an und kann nun ins Refugium eingeladen werden.
- **Lieblingsessen:** **Gegrillter Edelstein-Salat**. Ein absurdes, aber von ihm geliebtes Gericht. Benötigt Salzkristalle und andere seltene Mineralien.

## 3. Entwicklung (Metamorphose)

- **Entwickelt sich zu:** **Schmiede-Meister**.
- **Bedingungen (Beispiel aus GDD):**
    1.  Erreicht ein hohes Level (z.B. 35).
    2.  Der Spieler hat die Dorfschmiede aufgerüstet.
    3.  Der Stein-Gnom entwickelt sich, wenn er einen **Perfekten Eisenbarren** (ein seltenes Crafting-Ergebnis) im Inventar des Spielers hält, während dieser an der Dorfschmiede vorbeigeht.
- **Aussehen der Entwicklung:** Der "Schmiede-Meister" ist größer, hat einen kunstvoll geformten Bart aus Metallfäden und trägt einen kleinen Schmiedehammer. Der Kristall auf seinem Kopf leuchtet heller.

## 4. Platzhalter-Datei

Die Sprite-Sheet-Datei (`stein-gnom.png`) wird hier erwartet: `assets/art/sprites/companions/stein-gnom.png`.
