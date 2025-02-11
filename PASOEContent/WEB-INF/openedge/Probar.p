
/*------------------------------------------------------------------------
    File        : Probar.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : bsantiago
    Created     : Tue Feb 11 14:15:04 BOT 2025
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */


DEFINE VARIABLE ObjCategoryFilterItem AS CLASS CategoryFilterItem NO-UNDO.

ASSIGN ObjCategoryFilterItem = NEW CategoryFilterItem().

DEFINE VARIABLE opiTotalRecords AS INTEGER NO-UNDO.
DEFINE VARIABLE opiStatusCode AS INTEGER NO-UNDO.
DEFINE VARIABLE opcError AS CHARACTER NO-UNDO.
DEFINE VARIABLE oplcSearchData AS LONGCHAR NO-UNDO.


ObjCategoryFilterItem:freeformProductSearch ("F000001",
                                       "Ace",
                                       "F",
                                       1,
                                       "1",
                                       OUTPUT opiTotalRecords,
                                           OUTPUT opiStatusCode,
                                           OUTPUT opcError,
                                           OUTPUT oplcSearchData).
                                           
   //COPY-LOB FROM oplcSearchData TO FILE "C:\Users\bsantiago\Desktop\BKP\Contenido.txt" APPEND.
                                       
                                       
                                       