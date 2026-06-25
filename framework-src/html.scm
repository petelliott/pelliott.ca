(define (escape-attribute-value obj)
  (if (string? obj)
      obj
      (object->string obj)))

(define (write-attributes attrs)
  (unless (null? attrs)
    (display " ")
    (display (caar attrs))
    (display "=")
    (write (escape-attribute-value (cdar attrs)))
    (write-attributes (cdr attrs))))

(define (void-element-proc name attrs)
  (display "<")
  (display name)
  (write-attributes attrs)
  (display ">"))

(define (element-proc name attrs bodyproc)
  (void-element-proc name attrs)
  (newline)
  (if bodyproc
      (bodyproc))
  (display "</")
  (display name)
  (display ">")
  (newline))

(define-syntax attribute-list
  (syntax-rules ()
    ((_ ((k v) ...))
     (list (cons (quote k) v) ...))))

(define-syntax element
  (syntax-rules ()
    ((_ name)
     (element-proc 'name '() #f))
    ((_ name attrs)
     (element-proc 'name (attribute-list attrs) #f))
    ((_ name attrs . body)
     (element-proc 'name (attribute-list attrs) (lambda () . body)))))

(define-syntax define-element
  (syntax-rules ()
    ((_ name tagname)
     (define-syntax name
       (syntax-rules ()
         ((_) (element tagname))
         ((_ attrs . body)
          (element tagname attrs . body)))))))

(define-syntax define-elements
  (syntax-rules ()
    ((_ (name tagname) ...)
     (begin (define-element name tagname) ...))))

(define-syntax void-element
  (syntax-rules ()
    ((_ name)
     (void-element-proc 'name '()))
    ((_ name attrs)
     (void-element-proc 'name (attribute-list attrs)))))

(define-syntax define-void-element
  (syntax-rules ()
    ((_ name tagname)
     (define-syntax name
       (syntax-rules ()
         ((_) (void-element tagname))
         ((_ attrs) (void-element tagname attrs)))))))

(define-syntax define-void-elements
  (syntax-rules ()
    ((_ (name tagname) ...)
     (begin (define-void-element name tagname) ...))))

(define-void-elements
   (<area> area) (<base> base) (<br> br) (<col> col) (<embed> embed) (<hr> hr)
   (<img> img) (<input> input) (<link> link) (<meta> meta) (<source> source)
   (<track> track) (<wbr> wbr))

(define-elements
  (<a> a) (<abbr> abbr) (<address> address) (<article> article) (<aside> aside)
  (<audio> audio) (<b> b) (<bdi> bdi) (<bdo> bdo) (<blockquote> blockquote)
  (<body> body) (<button> button) (<canvas> canvas) (<caption> caption)
  (<cite> cite) (<code> code) (<colgroup> colgroup) (<data> data)
  (<datalist> datalist) (<dd> dd) (<del> del) (<details> details) (<dfn> dfn)
  (<dialog> dialog) (<div> div) (<dl> dl) (<dt> dt) (<em> em)
  (<fieldset> fieldset) (<figcaption> figcaption) (<figure> figure)
  (<footer> footer) (<form> form) (<h1> h1) (<h2> h2) (<h3> h3) (<h4> h4)
  (<h5> h5) (<h6> h6) (<head> head) (<header> header) (<hgroup> hgroup)
  (<html> html) (<i> i) (<iframe> iframe) (<ins> ins) (<kbd> kbd)
  (<label> label) (<legend> legend) (<li> li) (<main> main) (<map> map)
  (<mark> mark) (<menu> menu) (<meter> meter) (<nav> nav) (<noscript> noscript)
  (<object> object) (<ol> ol) (<optgroup> optgroup) (<option> option)
  (<output> output) (<p> p) (<picture> picture) (<pre> pre)
  (<progress> progress) (<q> q) (<rp> rp) (<rt> rt) (<ruby> ruby) (<s> s)
  (<samp> samp) (<script> script) (<search> search) (<section> section)
  (<select> select) (<slot> slot) (<small> small) (<span> span)
  (<strong> strong) (<style> style) (<sub> sub) (<summary> summary) (<sup> sup)
  (<table> table) (<tbody> tbody) (<td> td) (<template> template)
  (<textarea> textarea) (<tfoot> tfoot) (<th> th) (<thead> thead)
  (<time> time) (<title> title) (<tr> tr) (<u> u) (<ul> ul) (<var> var)
  (<video> video))

(define (!DOCTYPE type)
  (display "<!DOCTYPE ")
  (display type)
  (display ">")
  (newline))

(write (current-filename))

;(define args (cdr (command-line)))
;(if (null? args)
(newline)
