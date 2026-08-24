((title . "colophon"))

# colophon

this website was launched in 2026. you can read the source code
[here](https://github.com/petelliott/pelliott.ca).

## technologies

this site was built using [schingle](https://github.com/petelliott/schingle), a
hybrid web framework and static site generator i wrote in
[guile](https://www.gnu.org/software/guile/). markdown is rendered by
[pandoc](https://pandoc.org/).

## hosting

[nginx](https://nginx.org/) serves this site's static content, and acts as a
reverse proxy to the rarely-needed dynamic backend. this site is running on an
[azure](https://azure.microsoft.com/) virtual machine. it's probably a bit
over-provisioned, but i get free azure credits from work.


### virtual machine specs

- **region**: canadacentral (toronto 🇨🇦, not exactly "central")
- **OS**: Ubuntu 24.04 noble numbat
- **CPU**: AMD EPYC 7763 64-Core @ 2x 3.244GHz
- **RAM**: 8gb

## AI

all content and code is written by hand by peter elliott, however generative AI
is consulted on occasion. purely on technical matters, never on content.

## Sustainability

<div id="wcb" class="carbonbadge" style="text-align:left"></div>
<script src="https://unpkg.com/website-carbon-badges@1.1.3/b.min.js" defer></script>
