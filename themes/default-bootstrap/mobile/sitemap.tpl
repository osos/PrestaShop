{*
* 2007-2011 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2011 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div id="hook_mobile_top_site_map">
{hook h="displayMobileTopSiteMap"}
</div>
<hr/>
{if isset($categoriesTree.children)}
	<h2>{l s='Our offers'}</h2>

	<ul data-role="listview" data-inset="true">
		{for $i=0 to 4}
			{if isset($categoriesTree.children.$i)}
				{if isset($categoriesTree.children.$i.children) && ($categoriesTree.children.$i.children|@count > 0)}
						{include file="./category-tree-branch.tpl" node=$categoriesTree.children.$i}
				{else}
				<li data-icon="arrow-d">
					<a href="{$categoriesTree.children.$i.link|escape:'html':'UTF-8'}" title="{$categoriesTree.children.$i.desc|escape:'html':'UTF-8'}">
						{$categoriesTree.children.$i.name|escape:'html':'UTF-8'}
					</a>
				</li>
				{/if}
			{/if}
		{/for}
		<li>
			{l s='All categories'}
			<ul data-role="listview" data-inset="true">
				{foreach $categoriesTree.children as $child}
					{include file="./category-tree-branch.tpl" node=$child last='true'}
				{/foreach}
			</ul>
		</li>
	</ul>
{/if}

<hr/>
<h2>{l s='Sitemap'}</h2>
<ul data-role="listview" data-inset="true" id="category">
	{if $controller_name != 'index'}<li><a href="{$link->getPageLink('index', true)|escape:'html'}">{l s='Home'}</a></li>{/if}
	<li>{l s='Our offers'}
		<ul data-role="listview" data-inset="true">
			<li><a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='New products'}">{l s='New products'}</a></li>
			{if !$PS_CATALOG_MODE}
			<li><a href="{$link->getPageLink('prices-drop')|escape:'html'}" title="{l s='Price drop'}">{l s='Price drop'}</a></li>
			<li><a href="{$link->getPageLink('best-sales', true)|escape:'html'}" title="{l s='Best sellers'}">{l s='Best sellers'}</a></li>
			{/if}
			{if $display_manufacturer_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('manufacturer')|escape:'html'}">{l s='Manufacturers:'}</a></li>{/if}
			{if $display_supplier_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('supplier')|escape:'html'}">{l s='Suppliers:'}</a></li>{/if}
		</ul>
	</li>
	<li>{l s='Your Account'}
		<ul data-role="listview" data-inset="true">
			<li><a href="{$link->getPageLink('my-account', true)|escape:'html'}">{l s='Your Account'}</a></li>
			<li><a href="{$link->getPageLink('identity', true)|escape:'html'}">{l s='Personal information'}</a></li>
			<li><a href="{$link->getPageLink('addresses', true)|escape:'html'}">{l s='Addresses'}</a></li>
			{if $voucherAllowed}<li><a href="{$link->getPageLink('discount', true)|escape:'html'}">{l s='Discounts'}</a></li>{/if}
			<li><a href="{$link->getPageLink('history', true)|escape:'html'}">{l s='Order history'}</a></li>
		</ul>
	</li>
	<li>{l s='Pages'}
		<ul data-role="listview" data-inset="true">
			{if isset($categoriescmsTree.children)}
				{foreach $categoriescmsTree.children as $child}
					{if (isset($child.children) && $child.children|@count > 0) || $child.cms|@count > 0}
						{include file="./category-cms-tree-branch.tpl" node=$child}
					{/if}
				{/foreach}
			{/if}
			{foreach from=$categoriescmsTree.cms item=cms name=cmsTree}
				<li><a href="{$cms.link|escape:'html':'UTF-8'}" title="{$cms.meta_title|escape:'html':'UTF-8'}">{$cms.meta_title|escape:'html':'UTF-8'}</a></li>
			{/foreach}
			<li><a href="{$link->getPageLink('contact', true)|escape:'html'}" title="{l s='Contact'}">{l s='Contact'}</a></li>
			{if $display_store}<li><a href="{$link->getPageLink('stores')|escape:'html'}" title="{l s='Our stores'}">{l s='Our stores'}</a></li>{/if}
		</ul>
	</li>
</ul>
