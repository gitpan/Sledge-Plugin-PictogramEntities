use inc::Module::Install;
name 'Sledge-Plugin-PictogramEntities';
all_from 'lib/Sledge/Plugin/PictogramEntities.pm';

requires $_ for (qw/
    HTML::Entities::ConvertPictogramMobileJp
/);

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
