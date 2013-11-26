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
    'fonts-international',
  ]
  package { $pp_packages: ensure => installed }

  $pdf2html_packages = [
    'libpng12-0',
    'libjpeg62',
    'libopenjpeg2',
    'fontconfig',
    'poppler-data',
    'libcairo2',
    'libfreetype6',
  ]
  package { $pdf2html_packages: ensure => installed }

  # Download and unpack pdf2html archive
  archive { 'pdf2html':
    ensure        => present,
    url           => 'https://s3.amazonaws.com/oae-releases/pdf2html/pdf2html-0.10-bin.tar.gz',
    target        => '/',
    digest_string => '062196f5ef8f818502f17ef448d3e162',
    digest_type   => 'md5',
    extension     => 'tar.gz'
  }
}
