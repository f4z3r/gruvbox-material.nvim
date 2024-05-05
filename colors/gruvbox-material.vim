lua << EOF
-- do not reload packages that have no impact on coloring

package.loaded['gruvbox-material'] = nil
-- package.loaded['gruvbox-material.colors'] = nil
package.loaded['gruvbox-material.groups'] = nil
-- package.loaded['gruvbox-material.utils'] = nil
-- package.loaded['gruvbox-material.highlighter'] = nil

require('gruvbox-material').setup()
EOF
