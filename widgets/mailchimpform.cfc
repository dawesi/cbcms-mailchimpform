/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic Mailchimp Form for ContentBox
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	mailchimpform function init(){
		// Widget Properties
		setName( "Mailchimp Form" );
		setVersion( "1.0" );
		setDescription( "Mailchimp Form" );
		setAuthor( "Ortus Solutions" );
		setAuthorURL( "http://www.ortussolutions.com" );
		setIcon( "commenting" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The main commenting form widget
	* @mailchimpAccountName.hint The mailChimp Username
	* @mailchimpListID.hint The mailChimp List ID
	*/
	any function renderIt( string mailchimpAccountName, string mailchimpListID ){
		var event 		= getRequestContext();
		var cbSettings 	= event.getValue(name="cbSettings",private=true);
		var commentForm = "";
		

		// generate comment form
		saveContent variable="commentForm"{
			writeOutput('
				<!-- Begin MailChimp Signup Form -->
				<link href="//cdn-images.mailchimp.com/embedcode/classic-10_7.css" rel="stylesheet" type="text/css">
				<style type="text/css">
					##mc_embed_signup{background:##fff; clear:left; font:14px Helvetica,Arial,sans-serif; }
					/* Add your own MailChimp form style overrides in your site stylesheet or in this style block.
					   We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
				</style>
				<div id="mc_embed_signup">
				<form action="//#arguments.mailchimpAccountName#.us10.list-manage.com/subscribe/post?u=28a2772b5c2ec1cf1bfdf42d8&amp;id=#arguments.mailchimpListID#" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
				    <div id="mc_embed_signup_scroll">
					<h2>Subscribe to our mailing list</h2>
				<div class="indicates-required"><span class="asterisk">*</span> indicates required</div>
				<div class="mc-field-group">
					<label for="mce-EMAIL">Email Address  <span class="asterisk">*</span>
				</label>
					<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL">
				</div>
				<div class="mc-field-group">
					<label for="mce-FNAME">First Name </label>
					<input type="text" value="" name="FNAME" class="" id="mce-FNAME">
				</div>
				<div class="mc-field-group">
					<label for="mce-LNAME">Last Name </label>
					<input type="text" value="" name="LNAME" class="" id="mce-LNAME">
				</div>
					<div id="mce-responses" class="clear">
						<div class="response" id="mce-error-response" style="display:none"></div>
						<div class="response" id="mce-success-response" style="display:none"></div>
					</div>    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
				    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_28a2772b5c2ec1cf1bfdf42d8_#arguments.mailchimpListID#" tabindex="-1" value=""></div>
				    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
				    </div>
				</form>
				</div>
				
				<!--End mc_embed_signup-->
			');
			
			//html.addAsset( '//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js' );
			//html.addJSContent( 'function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]="EMAIL";ftypes[0]="email";fnames[1]="FNAME";ftypes[1]="text";fnames[2]="LNAME";ftypes[2]="text";}(jQuery));var $mcj = jQuery.noConflict(true);' );
			
		}

			
		return commentForm;
	}

}
