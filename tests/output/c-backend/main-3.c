#define LDV_MIN(X,Y) ((X) < (Y) ? (X) : (Y))
#define LDV_MAX(X,Y) ((X) > (Y) ? (X) : (Y))
#define LDV_ABS(X) ((X) < 0 ? -(X) : (X))
#define LDV_LROTATE(X,Y) (((X) << (Y)) | ((X) >> (__CHAR_BIT__ * sizeof (X) - Y)))
#define LDV_RROTATE(X,Y) (((X) >> (Y)) | ((X) << (__CHAR_BIT__ * sizeof (X) - Y)))
typedef struct __va_list_tag __va_list_tag;
#line 1 "input/c-backend/main-3.c"
int main(void)
{
  {
#line 3 "input/c-backend/main-3.c"
    if (1)
    {
#line 4 "input/c-backend/main-3.c"
      return 0;
    }
    else
#line 6 "input/c-backend/main-3.c"
      return 1;
  }
#line 0 "<built-in>"
  return 0;
}
