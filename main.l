%option noyywrap

#include <main.tab.h>

%s status_left status_right window_status_current_format_left window_status_current_format_right begin

%%

"#{status-left:"                        {return T_STATUS_LEFT; BEGIN(status_left);} /*}*/
"#{status-right:"                       {return T_STATUS_RIGHT; BEGIN(status_right);} /*}*/
"#{window-status-current-format-left:"  {return T_WINDOW_STATUS_CURRENT_FORMAT_LEFT; BEGIN(window_status_current_format_left);} /*}*/
"#{window-status-current-format-right:" {return T_WINDOW_STATUS_CURRENT_FORMAT_RIGHT; BEGIN(window_status_current_format_right);} /*}*/
"#{"                                    {return T_BEGIN; BEGIN(begin);}
"}"                                     {return T_END; BEGIN{INITIAL}}
";"                                     return T_SEMICOLON;
<begin>[^#]                             return T_IDENTIFY;
<<EOF>>                                 return T_EOF;
