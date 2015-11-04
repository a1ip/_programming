(PROGN
  (CCL::%DEFUN 
   (CCL:NFUNCTION NAME 
		  (LAMBDA (ARG1 ARG2) 
		    (DECLARE (CCL::GLOBAL-FUNCTION-NAME NAME)) 
		    (BLOCK NAME BODY))) 
   'NIL) 
  'NAME)

(PROGN 
  (EVAL-WHEN (:COMPILE-TOPLEVEL) 
    (CCL::DEFINE-COMPILE-TIME-MACRO 'NAME 
	'(LAMBDA (#:WHOLE0 #:ENVIRONMENT1) 
	  (DECLARE (IGNORABLE #:WHOLE0 #:ENVIRONMENT1)) 
	  (BLOCK NAME 
	    (LET* ((#:ARGS2 (CCL::MAKE-DESTRUCTURE-STATE (CDR #:WHOLE0) #:WHOLE0 '(ARG1 ARG2)))
		   (ARG1 (CCL::%POP-REQUIRED-ARG-PTR #:ARGS2)) 
		   (ARG2 (PROG1 
			     (CCL::%POP-REQUIRED-ARG-PTR #:ARGS2) 
			   (CCL::%CHECK-EXTRA-ARGUMENTS #:ARGS2)))) 
	      (DECLARE (DYNAMIC-EXTENT #:ARGS2)) 
	      BODY))) 
      'NIL)) 
  (EVAL-WHEN (:LOAD-TOPLEVEL :EXECUTE) 
    (CCL::%MACRO 
     (CCL:NFUNCTION NAME 
		    (LAMBDA (#:WHOLE0 #:ENVIRONMENT1) 
		      (DECLARE (IGNORABLE #:WHOLE0 #:ENVIRONMENT1)) 
		      (BLOCK NAME 
			(LET* ((#:ARGS2 (CCL::MAKE-DESTRUCTURE-STATE 
					 (CDR #:WHOLE0) #:WHOLE0 '(ARG1 ARG2))) 
			       (ARG1 (CCL::%POP-REQUIRED-ARG-PTR #:ARGS2)) 
			       (ARG2 (PROG1 
					 (CCL::%POP-REQUIRED-ARG-PTR #:ARGS2) 
				       (CCL::%CHECK-EXTRA-ARGUMENTS #:ARGS2)))) 
			  (DECLARE (DYNAMIC-EXTENT #:ARGS2)) 
			  BODY)))) 
     '(NIL NIL . "(ARG1 ARG2)")) 
    'NAME))

(PROGN 
  (EVAL-WHEN (:COMPILE-TOPLEVEL) 
    (CCL::NOTE-VARIABLE-INFO 'VAR T NIL)) 
  (CCL::%DEFVAR-INIT VAR VALUE "doc") 
  'VAR)

(PROGN 
  (EVAL-WHEN (:COMPILE-TOPLEVEL) 
    (CCL::NOTE-VARIABLE-INFO 'VAR T NIL)) 
  (CCL::%DEFPARAMETER 'VAR VALUE "doc"))

(PROGN 
  (EVAL-WHEN (:COMPILE-TOPLEVEL) 
    (CCL::DEFINE-COMPILE-TIME-CONSTANT 'VAR 'VALUE NIL)) 
  (EVAL-WHEN (:LOAD-TOPLEVEL :EXECUTE) 
    (CCL::%DEFCONSTANT 'VAR VALUE "doc")))

