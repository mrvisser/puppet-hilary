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
    url           => 'https://s3.amazonaws.com/oae-releases/pdf2html/pdf2html-0.10-bin.tar.gz',
    target        => '/',
    digest_string => 'ba033d8576291be5d671cc694b639836',
    digest_type   => 'md5',
    extension     => 'tar.gz'
  }
}
