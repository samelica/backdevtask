# backdevtask


CONTENTS OF THIS FILE
---------------------

 * CiviCRM extension which shows a new CiviCRM contact tab which displays a list of the personal campaign pages that a contact has created.

ABOUT THE EXTENSION
------------

It contains a simple API to get the personal campaign pages of a contact and a simple unit test class.

CONFIGURATION
-------------

In order to see the extension result add:

//custom contact tab
    $url = CRM_Utils_System::url( 'civicrm/campages',
           "reset=1&snippet=1&force=1&cid=$this->_contactId" );
    $allTabs[] = array( 'id'    => 'personal_campaign_pages',
            'url'   => $url,
            'title' => 'Personal Campaign Pages',
            'weight' => 300 );

To the view() function in the file:
/sites/all/modules/civicrm/CRM/Contact/Page/View/Summary.php
