<?php

require_once 'CRM/Core/Page.php';

class CRM_Campages_Page_Campages extends CRM_Core_Page {
  public function run() {

    CRM_Utils_System::setTitle(ts('Campages'));

    $this->assign('cid',CRM_Utils_Request::retrieve('cid', 'Positive', $this, TRUE));
    $cid = CRM_Utils_Request::retrieve('cid', 'Positive', $this, TRUE);

    $result = civicrm_api3('PCP', 'get', array(
	  'contact_id' => $cid,
	));
	
    $rows = array();
	foreach ($result['values'] as $key => $r) {
		$query = "SELECT title FROM civicrm_contribution_page WHERE id=" . $r['page_id'];
    	$p = CRM_Core_DAO::executeQuery($query);
    	while ($p->fetch()) {
			$r['cptitle'] = $p->title;
			
    	}

    	$query = "SELECT count(*) as count, SUM(`total_amount`) as total FROM `civicrm_contribution` WHERE `contribution_page_id` = " . $r['page_id'];
    	$p = CRM_Core_DAO::executeQuery($query);
    	while ($p->fetch()) {
			$r['count'] = $p->count;
			$r['total_amount'] = $p->total;
			 
    	}
    	$rows[] = $r;
	}

	$this->assign('rows', $rows);
	

    parent::run();
  }
}
