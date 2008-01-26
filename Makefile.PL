use inc::Module::Install;
name 'Sledge-Plugin-PictogramEntities';
all_from 'lib/Sledge/Plugin/PictogramEntities.pm';

requires 'HTML::Entities::ConvertPictogramMobileJp' => 0.03;

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
