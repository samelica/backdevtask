

{if $rows}
<div id="ltype">
<p></p>
{include file="CRM/common/pager.tpl" location="top"}
{include file="CRM/common/pagerAToZ.tpl"}
{include file="CRM/common/jsortable.tpl"}
{strip}
<table id="options" class="display">
  <thead>
    <tr>
    <th>{ts}Page Title{/ts}</th>
    <th>{ts}Status{/ts}</th>
    <th>{ts}Contribution Page{/ts}</th>
    <th>{ts}No. Contributions{/ts}</th>
    <th>{ts}Amount Raised{/ts}</th>
    <th>{ts}Target Amount{/ts}</th>
    <th></th>
    </tr>
  </thead>
  <tbody>
  {foreach from=$rows item=row}
  <tr>
    <td>

<a href="{crmURL p='civicrm/pcp/info' q="reset=1&id=`$row.id`" fe='true'}" title="{ts}View Personal Campaign Page{/ts}" target="_blank">{$row.title}</a>
    </td>
   <!-- /<td><a href="{$row.page_url}" title="{ts}View page{/ts}" target="_blank">{$row.page_title}</td> -->
    <td>{if $row.status_id == 2} Approved {else} Waiting Review {/if}</td>
    <td>{$row.cptitle}</td>
    <td>{$row.count}</td>
    <td>{$row.total_amount}</td>
    <td>{$row.goal_amount}</td>
    <td>
      <a href="{crmURL p='civicrm/pcp/info' q="action=update&reset=1&id=`$row.id`&context=dashboard"}" title="{ts}Edit Personal Campaign Page{/ts}" target="_blank">Edit</a>
    </td>    
  </tr>
  {/foreach}
  </tbody>
</table>
{/strip}

</div>
{/if}
