class oaeservice::deps::pp {
  include oaeservice::deps::common
  include oaeservice::deps::ppa::oae
  include oaeservice::deps::ppa::pdf2htmlex

  # Necessary packages for the preview processor
  $pp_packages = [
    'libreoffice',
    'pdftk',
    'chrpath',
    'libfontconfig1-dev',
    'fonts-international'
  ]
  package { $pp_packages: ensure => installed }

  # Download and unpack pdf2html archive
  archive { 'pdf2html':
    ensure        => present,
    url           => 'https://s3.amazonaws.com/oae-releases/pdf2html/pdf2html-0.10-bin.tar',
    target        => '/',
    digest_string => 'dc2899f18fe6d14ac8a6c05dbb047df5',
    digest_type   => 'md5',
    extension     => 'tar'
  }
}
