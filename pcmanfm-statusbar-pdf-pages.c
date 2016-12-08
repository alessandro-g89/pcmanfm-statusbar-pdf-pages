#include <string.h>
#include <pcmanfm-modules.h>
#include <poppler/glib/poppler-document.h>

FM_DEFINE_MODULE( tab_page_status, pdf-num-pages )

static char *_sel_message( FmFileInfoList *files, gint n_files )
{
	FmFileInfo *fi;
	char* mimetype;
	char* filename;
	PopplerDocument* document;
	GError *error = NULL;
	int num_pages;

	if( n_files > 1 ){
		return NULL;
	}

	fi = fm_file_info_list_peek_head( files );
	mimetype = fm_mime_type_get_type( fm_file_info_get_mime_type( fi ) );
	if( strcmp( mimetype, "application/pdf" ) != 0 ){
		return NULL;
	}
	
	filename = fm_path_to_uri( fm_file_info_get_path( fi ) );
	document = poppler_document_new_from_file( filename, NULL, &error );
	if( document == NULL ){
		return NULL;
	}

	num_pages = poppler_document_get_n_pages( document );
	return g_strdup_printf( " (%i pages)", num_pages );
}

FmTabPageStatusInit fm_module_init_tab_page_status = {
  NULL,
  NULL,
  _sel_message
};
