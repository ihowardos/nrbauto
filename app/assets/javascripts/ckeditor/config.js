// CKEDITOR.editorConfig = function (config) {
//   config.toolbar_mini = [
//     ["Bold",  "Italic",  "Underline",  "Strike"],
//   ];
//
//   config.removePlugins = 'elementspath';
//   config.toolbar = "mini";
// }
CKEDITOR.editorConfig = function( config )
{
config.toolbarCanCollapse = false;
config.resize_enabled = false;
config.readOnly = false;
config.removePlugins = 'elementspath';

config.toolbar_Forum =
[
	{ name: 'riga1',  	items : ['Bold','Italic','Underline','-','TextColor','-',
								 'NumberedList','BulletedList','-',
								 'HorizontalRule','SpecialChar','-','Link','Unlink','-',
 								 'Undo','Redo'] },
	'/',
	{ name: 'riga2',  	items : ['Outdent','Indent','-','Cut','Copy','Paste','PasteText','-','Maximize'] }
];

config.toolbar = 'Forum';

};
