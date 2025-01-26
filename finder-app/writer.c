#include <stdio.h>
#include <syslog.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[])
{
  openlog("Logging writer.c ...", 0, LOG_USER); // sets the attributes for the subsequent calls to syslog()

  // abandon if two arguments are not passed
  if (argc != 3)
  {
    printf("Failed: Please pass in two arguments!\n");
    syslog(LOG_ERR, "Error! Not enough arguments passed!\n");
    return 1;
  }

  char const *writefile = argv[1];  // full path to a file (including filename) on the filesystem
  char const *writestr  = argv[2];  // text string which will be written within this file

  FILE *file = fopen(argv[1], "a"); // create the file
  if (file == NULL)
  {
    syslog(LOG_ERR, "Error opening %s: %s\n", writefile, strerror(errno));
    closelog();
    return 1;
  }
  else // file opened / created
  {
    int const num_items = 1;
    if (fwrite(writestr, strlen(writestr), num_items, file) < num_items) // try to write to the file
    {
      syslog(LOG_ERR, "Write error encountered when writing to %s: %s\n", writefile, strerror(errno));
      fclose(file);
      closelog();
      return 1;
    }
    else
    {
      syslog(LOG_DEBUG, "Writing %s to %s\n", writestr, writefile); // success
    }
    fclose(file);
  }
  closelog();
  return 0;
}
