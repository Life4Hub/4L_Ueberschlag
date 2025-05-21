# 4L_Überschlag

Ein kleines aber wirkungsvolles FiveM-Skript, das automatisch erkennt, wenn sich ein Fahrzeug überschlägt – inklusive Kameraeffekt, Systembenachrichtigung und Fahrunfähigkeit des Wagens.

Erstellt von **Life4Tune** für **4Life RP**.

---

## ✨ Features

- Erkennung von Fahrzeugüberschlägen (Flip Detection)
- Kamerawackeleffekt bei Unfall
- Benachrichtigung via Advanced Notification
- Fahrzeug wird fahruntüchtig (Motor wird deaktiviert)
- Unterstützt ausgewählte Fahrzeugklassen (Autos, Motorräder etc.)

---

## ⚙️ Installation

1. Lege den Ordner in `resources/[local]/4L_Überschlag`
2. Füge in deiner `server.cfg` hinzu:

   ```plaintext
   ensure 4L_Überschlag
   ```

3. Starte den Server neu oder nutze `refresh` + `start 4L_Überschlag` in der Serverkonsole.

---

## 🔍 Funktionsweise

Das Skript prüft jede Sekunde:

- Ob du in einem Fahrzeug sitzt
- Ob sich dein Fahrzeug überschlagen hat (`Roll > 87°`)
- Wird ein Überschlag erkannt:
  - Kamerawackeln (`SMALL_EXPLOSION_SHAKE`)
  - Notification: „Fahrzeug hat sich überschlagen! Ruf ein Krankenwagen.“
  - Motor wird auf 200.0 gesetzt und deaktiviert (`SetVehicleUndriveable`)

Wenn dein Fahrzeug sich wieder normal hinstellt (`Roll zwischen -20° und 20°`), kann ein neuer Unfall wieder erkannt werden.

---

## 📦 Anforderungen

- Keine externen Ressourcen notwendig.
- Läuft komplett clientseitig.

---

## 🧑‍💻 Erstellt von

**Life4Tune**  
Für **4Life RP**  
Website: [https://www.4-life.net](https://www.4-life.net)
