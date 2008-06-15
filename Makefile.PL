use inc::Module::Install;
name 'Sledge-Plugin-PictogramEntities';
all_from 'lib/Sledge/Plugin/PictogramEntities.pm';

requires 'HTML::Entities::ConvertPictogramMobileJp' => '0.06';
requires 'HTTP::MobileAgent' => 0.27;

build_requires 'Test::More';
author_tests 'xt';
use_test_base;
auto_include;
WriteAll;
