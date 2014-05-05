require 'formula'

# Copied from
# https://github.com/sweenzor/homebrew-formulae/blob/0cf1d83de25997876bbe8bf198c98aa7df9eb220/arcanist.rb
class Arcanist < Formula
  homepage 'http://phabricator.org/'
  url 'https://github.com/facebook/arcanist.git'
  version 'head'

  def install

    # clone arcanist
    system 'git', 'clone', url

    # clone libphutil into arcanist's includes
    cd 'arcanist/externals/includes' do
      system 'git', 'clone', 'git://github.com/facebook/libphutil.git'
    end

    # copy the whole cloned dir (including includes) to Cellar
    prefix.install 'arcanist'

    # symlink arc's bin to where homebrew expects a bin
    bin.install_symlink prefix + 'arcanist/bin/arc'

  end

end
