/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int incremental = 0;                 /* -r  option; if 1, outputs text each time a key is pressed     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Tamzen:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#ebdbb2", "#282828" },
	[SchemeSel] =  { "#282828", "#458588" },
	[SchemeOut] =  { "#000000", "#00ffff" },
};
static unsigned int lines      = 0; /* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lineheight = 27; /* -h option; minimum line height */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
