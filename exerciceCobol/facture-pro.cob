IDENTIFICATION DIVISION.
       PROGRAM-ID. FACTURE-PRO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FACTURE-FILE ASSIGN TO "facture.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FACTURE-FILE.
       01  FACTURE-RECORD     PIC X(80).

       WORKING-STORAGE SECTION.
       01  ARTICLE-NAME       PIC X(20).
       01  QUANTITY           PIC 9(3).
       01  UNIT-PRICE         PIC 9(5)V99.
       01  LINE-TOTAL         PIC 9(7)V99.
       01  TOTAL-HT           PIC 9(9)V99 VALUE 0.
       01  TVA-RATE           PIC 9V99 VALUE 0.20.
       01  TVA-AMOUNT         PIC 9(9)V99.
       01  TOTAL-TTC          PIC 9(9)V99.
       01  MORE-ITEMS         PIC X VALUE "O".
       01  WORK-LINE          PIC X(80).

       01  LINE-FORMAT.
           05 F-ART  PIC X(20).
           05 FILLER PIC X(1) VALUE SPACE.
           05 F-QTE  PIC ZZ9.
           05 FILLER PIC X(6) VALUE SPACES.
           05 F-PU   PIC ZZ,ZZ9.99.
           05 FILLER PIC X(3) VALUE SPACES.
           05 F-TOT  PIC ZZ,ZZ9.99.

       01  DISPLAY-FORMATS.
           05 TOTAL-HT-DISPLAY    PIC ZZZ,ZZZ,ZZ9.99.
           05 TVA-AMOUNT-DISPLAY  PIC ZZZ,ZZZ,ZZ9.99.
           05 TOTAL-TTC-DISPLAY   PIC ZZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT FACTURE-FILE

           MOVE "=========== FACTURE ===========" TO WORK-LINE
           WRITE FACTURE-RECORD FROM WORK-LINE
           
           MOVE "Article              Qte      PU       Total" TO WORK-LINE
           WRITE FACTURE-RECORD FROM WORK-LINE
           
           MOVE "-----------------------------------------------" TO WORK-LINE
           WRITE FACTURE-RECORD FROM WORK-LINE

           PERFORM UNTIL MORE-ITEMS NOT = "O"
              DISPLAY "Nom de l'article : "
              ACCEPT ARTICLE-NAME

              DISPLAY "Quantite : "
              ACCEPT QUANTITY

              DISPLAY "Prix unitaire (ex: 12.50) : "
              ACCEPT UNIT-PRICE

              COMPUTE LINE-TOTAL = QUANTITY * UNIT-PRICE
              COMPUTE TOTAL-HT = TOTAL-HT + LINE-TOTAL

              MOVE ARTICLE-NAME TO F-ART
              MOVE QUANTITY     TO F-QTE
              MOVE UNIT-PRICE   TO F-PU
              MOVE LINE-TOTAL   TO F-TOT

              WRITE FACTURE-RECORD FROM LINE-FORMAT

              DISPLAY "Ajouter un autre article ? (O/N)"
              ACCEPT MORE-ITEMS
              MOVE FUNCTION UPPER-CASE(MORE-ITEMS) TO MORE-ITEMS
           END-PERFORM

           COMPUTE TVA-AMOUNT = TOTAL-HT * TVA-RATE
           COMPUTE TOTAL-TTC = TOTAL-HT + TVA-AMOUNT

           MOVE "-----------------------------------------------" TO WORK-LINE
           WRITE FACTURE-RECORD FROM WORK-LINE

           MOVE TOTAL-HT TO TOTAL-HT-DISPLAY
           STRING "TOTAL HT   : " DELIMITED BY SIZE
                  TOTAL-HT-DISPLAY DELIMITED BY SIZE
                  INTO WORK-LINE
           END-STRING
           WRITE FACTURE-RECORD FROM WORK-LINE

           MOVE TVA-AMOUNT TO TVA-AMOUNT-DISPLAY
           STRING "TVA (20%)  : " DELIMITED BY SIZE
                  TVA-AMOUNT-DISPLAY DELIMITED BY SIZE
                  INTO WORK-LINE
           END-STRING
           WRITE FACTURE-RECORD FROM WORK-LINE

           MOVE TOTAL-TTC TO TOTAL-TTC-DISPLAY
           STRING "TOTAL TTC  : " DELIMITED BY SIZE
                  TOTAL-TTC-DISPLAY DELIMITED BY SIZE
                  INTO WORK-LINE
           END-STRING
           WRITE FACTURE-RECORD FROM WORK-LINE

           MOVE "=========== FIN FACTURE ===========" TO WORK-LINE
           WRITE FACTURE-RECORD FROM WORK-LINE

           CLOSE FACTURE-FILE
           DISPLAY "Facture generee dans 'facture.txt'."
           STOP RUN.
           
           