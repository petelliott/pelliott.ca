(require "html.scm")


;; I did AI generate this tbh
(define-elements
  ;; structure / containers
  (<svg> svg) (<g> g) (<defs> defs) (<symbol> symbol) (<use> use)
  (<image> image) (<switch> switch) (<foreignObject> foreignObject)
  (<view> view) (<desc> desc) (<metadata> metadata)

  ;; basic shapes
  (<path> path) (<rect> rect) (<circle> circle) (<ellipse> ellipse)
  (<line> line) (<polyline> polyline) (<polygon> polygon)

  ;; text
  (<text> text) (<tspan> tspan) (<textPath> textPath)

  ;; painting / references
  (<marker> marker) (<linearGradient> linearGradient)
  (<radialGradient> radialGradient) (<stop> stop) (<pattern> pattern)
  (<clipPath> clipPath) (<mask> mask) (<filter> filter)

  ;; filter primitives
  (<feBlend> feBlend) (<feColorMatrix> feColorMatrix)
  (<feComponentTransfer> feComponentTransfer) (<feComposite> feComposite)
  (<feConvolveMatrix> feConvolveMatrix) (<feDiffuseLighting> feDiffuseLighting)
  (<feDisplacementMap> feDisplacementMap) (<feDistantLight> feDistantLight)
  (<feDropShadow> feDropShadow) (<feFlood> feFlood) (<feFuncA> feFuncA)
  (<feFuncB> feFuncB) (<feFuncG> feFuncG) (<feFuncR> feFuncR)
  (<feGaussianBlur> feGaussianBlur) (<feImage> feImage) (<feMerge> feMerge)
  (<feMergeNode> feMergeNode) (<feMorphology> feMorphology) (<feOffset> feOffset)
  (<fePointLight> fePointLight) (<feSpecularLighting> feSpecularLighting)
  (<feSpotLight> feSpotLight) (<feTile> feTile) (<feTurbulence> feTurbulence)

  ;; animation
  (<animate> animate) (<animateMotion> animateMotion)
  (<animateTransform> animateTransform) (<set> set) (<mpath> mpath))
