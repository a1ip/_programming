#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
//#include <uchar.h>
#include <locale.h>
#include <string.h>

/*
<locale.h>
char * setlocale(int category, const char * locale)
  "C" - minimal; "" - environment \; NULL - вернуть установленную

<stdlib.h>
int    mblen    (                const    char *  pmb, size_t max)
int    mbtowc   ( wchar_t * pwc, const    char *  pmb, size_t max)
int    wctomb   (    char * pmb,        wchar_t   wc )
size_t mbstowcs ( wchar_t * dst, const    char *  src, size_t max)
size_t wcstombs (    char * dst, const wchar_t *  src, size_t max)

<wchar.h>
  r - restartable
int    mbsinit(const mbstate_t * ps)
size_t mbrlen   (                const    char *  pmb, size_t max, mbstate_t * ps)
size_t mbrtowc  ( wchar_t * pwc, const    char *  pmb, size_t max, mbstate_t * ps)
size_t wcrtomb  (    char * pmb,         wchar_t  wc      ,        mbstate_t * ps)
size_t mbsrtowcs( wchar_t * dst, const    char ** src, size_t max, mbstate_t * ps)
size_t wcsrtombs(    char * dst, const wchar_t ** src, size_t max, mbstate_t * ps)

<uchar.h>
size_t mbrtoc16 (char16_t * pwc, const    char *  pmb, size_t max, mbstate_t * ps)
size_t 16crtomb (    char * pmb,        char16_t  wc      ,        mbstate_t * ps)
size_t mbrtoc32 (char32_t * pwc, const    char *  pmb, size_t max, mbstate_t * ps)
size_t 32crtomb (    char * pmb,        char32_t  wc      ,        mbstate_t * ps)
*/

char teststr[]="english and русский text";
wchar_t testwstr[]=L"english and русский wtext";

void printbuffer_mblen(const char * pt, size_t max)
{
  //return;
  int len;
  char buf[MB_CUR_MAX+1];
  while(max>0){
    len=mblen(pt,max);
    if(len<1) break;
    char * pb=buf;
    for(int i=0; i<len; i++, pb++, pt++) *pb=*pt;
    *pb=0;
    printf("[%s]-%d",buf,len);
    max-=len;
  }
  printf("\n");
  if(len)printf("after cycle len = %d; max = %d\n",len,max);
  printf("--- printbuffer_mblen ends ---\n");
}
void test_mblen()
{
  printf("wether mbchar use a state depending encoding = %d\n",mblen(NULL,0));
  printbuffer_mblen(teststr,17);
  printbuffer_mblen(teststr+17,sizeof(teststr)-17);
}

void printbuffer_mbrlen(const char * pt, size_t max, mbstate_t * ps)
{
  //return;
  size_t len;
  char buf[MB_CUR_MAX+1];
  while(max>0){
    len=mbrlen(pt,max,ps);
    if(len<1 || len>MB_CUR_MAX) break;
    char * pb=buf;
    for(int i=0; i<len; i++, pb++, pt++) *pb=*pt;
    *pb=0;
    printf("[%s]-%d",buf,len);
    max-=len;
  }
  printf("\n");
  if(len)printf("after cycle len = %d; max = %d\n",len,max);
  printf("--- printbuffer_mbrlen ends ---\n");
}
void test_mbrlen()
{
  mbstate_t mbs;
  mbrlen(NULL,0,&mbs);
  printbuffer_mbrlen(teststr   ,17                ,&mbs);
  printbuffer_mbrlen(teststr+17,sizeof(teststr)-17,&mbs);
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
}

void printbuffer_mbrtowc(const char * pt, size_t max, mbstate_t * ps)
{
  //return;
  size_t len;
  wchar_t wc;
  while(max>0){
    len=mbrtowc(&wc,pt,max,ps);
    if(len<1 || len>MB_CUR_MAX) break;
    pt+=len;
    printf("[%lc]-%d",wc,len);
    max-=len;
  }
  printf("\n");
  if(len)printf("after cycle len = %d; max = %d\n",len,max);
  printf("--- printbuffer_mbrtowc ends ---\n");
}
void test_mbrtowc()
{
  mbstate_t mbs;
  mbrlen(NULL,0,&mbs);
  printbuffer_mbrtowc(teststr   ,17                ,&mbs);
  printbuffer_mbrtowc(teststr+17,sizeof(teststr)-17,&mbs);
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
}

void test_mbsrtowcs()
{
  mbstate_t mbs;
  mbrlen(NULL,0,&mbs);
  printbuffer_mbrlen(teststr   ,17                ,&mbs);
  mbstate_t tmp=mbs;
  const char * pmb=teststr+17;
  size_t len=mbsrtowcs(0,&pmb,0,&tmp);
  if(len==(size_t)-1) {  printf("mbsrtowcs: string contain invalid sequence; return\n"); return;  }
  printf("other length = %d\n",len);
  wchar_t * pwc=new wchar_t[len+1];
  pmb=teststr+17;
  size_t len2=mbsrtowcs(pwc,&pmb,4,&mbs);
  if(len2!=4) {  printf("mbsrtowcs: len != 4 ; return\n");  return;  }
  len2=mbsrtowcs(pwc+4,&pmb,len+1-4,&mbs);
  if(len2==(size_t)-1) {  printf("mbsrtowcs: string contain invalid sequence; return\n"); return;  }
  printf("len2 must be eq %d and len2 eq %d\n",len-4,len2);
  printf("converted string is: '%ls'\n",pwc);
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
  delete [] pwc;
}

void test_wcsrtombs()
{
  mbstate_t mbs;
  mbrlen(NULL,0,&mbs);
  const wchar_t * pws=testwstr;
  size_t len=wcsrtombs(NULL,&pws,0,&mbs);
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
  printf("length of neded mbstring eq %d\n",len);
  char * str=new char[len+1];
  memset(str,1,len+1);
  pws=testwstr;
  size_t len2 = wcsrtombs(str,&pws,17,&mbs);
  if(mbsinit(&mbs)) printf("end state is initial\n");
  if(len2!=17){
    printf("len2!=17\n");
    char * p = (char*)memchr(str,0,17);
    if(!p){
      printf("null character absent\n");
      delete [] str;
      return;
    }
  }
  len2= wcsrtombs(str+17,&pws,len+1-17,&mbs);
  printf("len2 must be eq %d and len2 eq %d\n",len-17,len2);
  printf("converted string is '%s'\n",str);
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
  delete [] str;
}
void test2_wcsrtombs()
{
  mbstate_t mbs;
  mbrlen(NULL,0,&mbs);
  const wchar_t * pws=testwstr;
  char * str=new char[16];
  pws=testwstr;
  size_t len2 = wcsrtombs(str,&pws,16,&mbs);
  printf("len2 must be eq 16 and len2 eq %d\n",len2);
  char * p = (char*)memchr(str,0,16);
  if(p) printf("converted string is '%s'\n",str);
  else  printf("null character absent\n");
  if(!mbsinit(&mbs)) printf("end state is not initial\n");
  delete [] str;
}

void test_printf()
{
  printf("enlish  string, length=15 :'%-15s'\n","english");
  printf("russian string, length=15 :'%-15s'\n","русский");
}

int main(int argc, char * argv[])
{
  printf("MB_CUR_MAX = %d\n",MB_CUR_MAX);
  setlocale(LC_ALL,"");
  printf("current locale set to '%s'\n",setlocale(LC_ALL,NULL));
  printf("MB_CUR_MAX = %d\n",MB_CUR_MAX);
  //test_mblen();
  //test_mbrlen();
  //test_mbrtowc();
  //test_mbsrtowcs();
  test_wcsrtombs();
  //test2_wcsrtombs();
  //test_printf();
}
