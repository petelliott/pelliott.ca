
((scheme-mode
  . ((eval . (progn
               (put 'element 'scheme-indent-function 1)
               (put 'void-element 'scheme-indent-function 1)
               (put 'define-element 'scheme-indent-function 1)
               (put 'define-void-element 'scheme-indent-function 1)
               (dolist (sym '(;; void elements
                              <area> <base> <br> <col> <embed> <hr> <img>
                              <input> <link> <meta> <source> <track> <wbr>
                              ;; non-void elements
                              <a> <abbr> <address> <article> <aside> <audio>
                              <b> <bdi> <bdo> <blockquote> <body> <button>
                              <canvas> <caption> <cite> <code> <colgroup>
                              <data> <datalist> <dd> <del> <details> <dfn>
                              <dialog> <div> <dl> <dt> <em> <fieldset>
                              <figcaption> <figure> <footer> <form> <h1> <h2>
                              <h3> <h4> <h5> <h6> <head> <header> <hgroup>
                              <html> <i> <iframe> <ins> <kbd> <label> <legend>
                              <li> <main> <map> <mark> <menu> <meter> <nav>
                              <noscript> <object> <ol> <optgroup> <option>
                              <output> <p> <picture> <pre> <progress> <q> <rp>
                              <rt> <ruby> <s> <samp> <script> <search> <section>
                              <select> <slot> <small> <span> <strong> <style>
                              <sub> <summary> <sup> <table> <tbody> <td>
                              <template> <textarea> <tfoot> <th> <thead> <time>
                              <title> <tr> <u> <ul> <var> <video>
                              ;; svg elements (shared a/script/style/title
                              ;; already listed above)
                              <svg> <g> <defs> <symbol> <use> <image> <switch>
                              <foreignObject> <view> <desc> <metadata> <path>
                              <rect> <circle> <ellipse> <line> <polyline>
                              <polygon> <text> <tspan> <textPath> <marker>
                              <linearGradient> <radialGradient> <stop> <pattern>
                              <clipPath> <mask> <filter> <feBlend> <feColorMatrix>
                              <feComponentTransfer> <feComposite>
                              <feConvolveMatrix> <feDiffuseLighting>
                              <feDisplacementMap> <feDistantLight> <feDropShadow>
                              <feFlood> <feFuncA> <feFuncB> <feFuncG> <feFuncR>
                              <feGaussianBlur> <feImage> <feMerge> <feMergeNode>
                              <feMorphology> <feOffset> <fePointLight>
                              <feSpecularLighting> <feSpotLight> <feTile>
                              <feTurbulence> <animate> <animateMotion>
                              <animateTransform> <set> <mpath>))
                 (put sym 'scheme-indent-function 1)))))))
