# README

Tool Library is an app to help you track your tools when you loan them to borrowers. Tool Library also lets you see other tools loaned from the tool library community. 

Installation
Clone or download the repository from here: https://github.com/P0rtk3y/tool_library

In your terminal, navigate to the app's directory and execute:

$ bundle install  #to install dependencies.

$ rails db:migrate #to create the database and its attributes, and establish a join table  

$ rails db:seed #to seed any test objects

Launch a console to experiment with object relationships by executing:

$ rails c

Launch a local server by executing:

$ rails s

and then visit http://localhost:3000in your browser to access the YCC site.

To end the server session, type ctrl-c.


Usage



Once logged in, the Library will be greeted. An index of the Library's tools is displayed using the "My Tools" link.

From the Tool Index page, the Library can:

-Create a new tool by clicking "Add a Tool".
-Edit a tool by clicking each tool's name. Editing the tool can include updating the tool's "in library" status
-Delete a tool

By visiting the "All Loans" Index page, the Library can:

-View a history of all loans made by borrowers in the community of libraries.  
-Click on each tool to view its description, check its "in library" status, edit the tool, or return to the Tool Index page.  

By visiting the "All Borrowers" Index page, the Library can:

-Add a loan to an existing borrower by clicking the borrower's name.
-View the borrower's history of tool loans by clicking the tool(s) link.
-Add a Borrower

By visiting the "Add a Loan" page, the Library can:

-Create a Loan which allows the library to loan a tool from the library to an existing borrower and update the tool's in-library status
-Create a Loan by adding a new borrower and update the tool's in-library status


Clicking Logout from anywhere in the app ends the Library's session.


License
The gem is available as open source under the terms of the MIT License.
