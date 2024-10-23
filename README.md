# OrderBy und GroupBy - Indexoptimierung

## Ausgangssituation

Gegeben ist eine Tabelle ``orders`` mit folgender Struktur:

```sql
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    status VARCHAR2(20),
    order_value NUMBER(10,2)
);
```

### Aufgabe 1: Optimierung einer ORDER BY Abfrage

1. Schreiben Sie eine SELECT-Abfrage
Schreiben Sie eine Abfrage, die alle Bestellungen eines bestimmten Kunden (``customer_id`` = 1234) nach dem Bestelldatum absteigend sortiert ausgibt.
2. Analyse des Ausführungsplans

Analysieren Sie den Ausführungsplan Ihrer Abfrage:

```sql
EXPLAIN PLAN FOR
-- Ihre Abfrage hier einfügen

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

* Erstellen Sie einen geeigneten Index, der die Abfrage beschleunigt.
* Vergleichen Sie den Ausführungsplan mit und ohne Index.

### Aufgabe 2: Optimierung einer GROUP BY Abfrage

1. Schreiben Sie eine Analyse-Abfrage
Erstellen Sie eine Abfrage, die für einen bestimmten Kunden (``customer_id`` = 1234):
   * Die Gesamtsumme der Bestellwerte pro Status berechnet
   * Nach Status gruppiert

1. Analyse und Vergleich

Erstellen Sie einen geeigneten Index, der die Abfrage beschleunigt.
Vergleichen Sie den Ausführungsplan mit und ohne Index.
