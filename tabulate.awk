
BEGIN {

OFS="\t";

# Compose the html file with the Header, Body ( Data ) and Footer

print "<!DOCTYPE html>"
print "<html>"
print "<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" charset=\"ISO-8859-1\">"
print "<title>"MY_TITLE"</title>"
print "<script>\nfunction myFunction(){\n  // Declare variables \n  var input, filter, table, tr, td, i;\n  input = document.getElementById(\"myInput\");\n  filter = input.value.toUpperCase();\n  table = document.getElementById(\"myTable\");\n  tr = table.getElementsByTagName(\"tr\");\n // Loop through all table rows, and hide those who do not match the search query\n  for (i = 1; i < tr.length; i++) {\n    td = tr[i].getElementsByTagName(\"td\") ; \n    for(j=0 ; j<td.length ; j++)\n    {\n      var tdata = td[j] ;\n      if (tdata) {\n        if (tdata.innerHTML.toUpperCase().indexOf(filter) > -1) {\n          tr[i].style.display = \"\";\n          break ; \n        } else {\n          tr[i].style.display = \"none\";\n        }\n      } \n    }\n  }\n}\n</script>"

print "\n"        

print "<style type=\"text/css\">\ntable, th, td {\nborder: 1px solid black;  // changing-colors\n// word-wrap: break-word;\n}\ntr:first-child {\n  font-weight: bold;\n}\ntr:nth-child(even) {background: #eef}  // changing-colors\ntr:nth-child(odd) {background: #fee}   // changing-colors\n* {\n  box-sizing: border-box;\n}\n#myInput {\n  background-image: url(\"search.png\");\n  background-position: left center;\n  background-repeat: no-repeat;\n  width: 94%;\n  font-size: 16px;\n  padding: 8px 20px 8px 40px;\n  border:2px solid Tomato;  // changing-colors\n  margin-bottom: 18px;\n}\n#myTable {\n  border-collapse: collapse;\n  border: 1px solid #ddd;  // changing-colors\n  width: 100%;\n  margin-top: 18px;\n  // Remove the // in front of the below two lines, to get fixed-width\n  // table-layout: fixed;\n  // word-wrap: break-word;\n  // font-size: 18px;\n}\n#myTable th, #myTable td {\n  text-align: left;\n  padding: 12px;\n}\n#myTable tr {\n  border-bottom: 1px solid #ddd;  // changing-colors\n}\n#myTable tr:first-child:hover, #myTable tr:hover {\n  background-color: DarkKhaki;    // changing-colors\n}\n#myTable tr:first-child {\n  background-color: DarkKhaki;    // changing-colors\n  font-weight: bold;\n}\n</style>"

       print "</head>"

       print "<body>"

       # changing-colors

       print "<h2 style=\"text-align:center;background-color:DodgerBlue;color:White;\">"MY_HEADER"</h2>"

	   print "<input type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search in all Fields....\" title=\"Type in a Search String\" autofocus=\"autofocus\">"       

       print "<table id=\"myTable\">"
	   
# the following lines are commented by way of the # character. Please remove this character to get fixed-width of columns. Also, adjust the number of col lines and their values, to suit yur input data.
# --MULTILINE-COMMENT--
#       print "<col width=\"164\" />\n             <col width=\"236\" />\n             <col width=\"130\" />\n             <col width=\"191\" />\n             <col width=\"115\" />\n             <col width=\"87\" />\n             <col width=\"145\" />             \n             <col width=\"126\" />"
# --MULTILINE-COMMENT--

# the following 13 lines are commented by way of the # character. Please remove this character to get customized table header lines. Also, adjust the number of header lines and header data, to suit your input.
# --MULTILINE-COMMENT--
#       print "<tr class=\"header\">"
#       print "<th>Title</th>"
#       print "<th>Description</th>"
#       print "<th>Version</th>"
#       # print "<th>Author</th>"
#       print "<th>Original-site</th>"
#       print "<th>License</th>"
#       print "<th>Size</th>"
#       print "<th>Extension_by</th>"
#       print "<th>Tags</th>"
#       print "</tr>"
#--MULTILINE-COMMENT--

}

# Read the standard input data file contents into an Array, Check for URLs to Create Hyperlinks and
# Also Substitute html sensitive characters with proper syntax

{
        # gsub(/</, "\\&lt;")
        # gsub(/>/, "\\&gt;")
        # gsub(/&/, "\\&gt;")
        print "\t<tr>"
        for(f = 1; f <=NF; f++)  {
                if(NR == 1 && header) {
                        printf "\t\t<th>%s</th>\n", $f
                }
                else printf "\t\t<td>%s</td>\n", $f
        }
        print "\t</tr>"
}

END {
        print "</table></body></html>"
}
