
/*------------------------------------------------------------------------
    File        : Batch.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : NectarMind Software
    Created     : Wed Aug 24 09:21:13 BOT 2022
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */
RUN getCustomer.

PROCEDURE getCustomer:
  
DEFINE VARIABLE ObjWrapper          AS  CLASS     WrapperClass NO-UNDO.
DEFINE VARIABLE opcMessage          AS CHARACTER   NO-UNDO.
DEFINE VARIABLE opcAppToken         AS CHARACTER   NO-UNDO.
DEFINE VARIABLE opiStatusCode       AS INTEGER     NO-UNDO.
DEFINE VARIABLE oplcSalespersonData AS LONGCHAR NO-UNDO.
DEFINE VARIABLE oplcSuggestionListData AS LONGCHAR NO-UNDO.

ObjWrapper = NEW WrapperClass().

FOR EACH CSAMS WHERE CSAMS.SALES-REP-ID = "I35" NO-LOCK:
    
    objwrapper:fetchCustomers("BATCH",
                              "0", 
                              CSAMS.SALES-REP-ID,
                              "*",
                              0,
                              opcMessage, 
                              opcAppToken, 
                              opiStatusCode, 
                              oplcSalespersonData).
                              
    objwrapper:fetchCustomerSuggestionsList("Batch",
                                            "0", 
                                            CSAMS.SALES-REP-ID, 
                                            opcMessage, 
                                            opcAppToken, 
                                            opiStatusCode, 
                                            oplcSuggestionListData).                          
END.    

END PROCEDURE.

/* ***************************  Main Block  *************************** */
