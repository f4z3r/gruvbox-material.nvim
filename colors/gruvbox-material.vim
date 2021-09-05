lua << EOF
package.loaded['gruvbox-material'] = nil
package.loaded['gruvbox-material.colors'] = nil
package.loaded['gruvbox-material.highlights'] = nil
package.loaded['gruvbox-material.utils'] = nil

require('gruvbox-material').setup()
EOF
