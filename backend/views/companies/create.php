<?php
use yii\helpers\Html;
use  yii\widgets\Pjax;

$this->title = 'Create New Company';
$this->params['breadcrumbs'][] = ['label' => 'Companies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<h1><?= Html::encode($this->title) ?></h1>
<br>
	<div class="row company-create">
		<div class="col-md-8 col-lg-8 col-sm-12" >
                
		<?=Html::beginForm(['companies/savenew'],'post');?> 
			<div class="panel panel-default">
				<div class="panel-heading">Company</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Company Name*</label>
						<div class="col-md-9">
							<?= Html::input( 'text', 'name', $newcompany['name'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
					</div>
                                    <div class="form-group">
						<label class="widget-textinputlabel col-md-3">Company No*</label>
						<div class="col-md-9">
							<?= Html::input( 'text', 'orgnr', $newcompany['orgnr'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
					</div>
				</div>
			</div>		
			<div class="panel panel-default">
				<div class="panel-heading">Visiting Address</div>
				<div class="panel-body">	
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Address</label>
						<div class="col-md-9">
							<?= Html::input( 'text', 'address_visit', $newcompany['address_visit'], ['class'=>'form-control'] ); ?>
						</div>
					</div>
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Zip</label>
						<div class="col-md-2">
							<?= Html::input( 'text', 'zip_visit', $newcompany['zip_visit'], ['class'=>'form-control'] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-2">State</label>
						<div class="col-md-5">
							<?= Html::input( 'text', 'place_visit', $newcompany['place_visit'], ['class'=>'form-control'] ); ?>
						</div>
					</div>
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Land</label>
						<div class="col-md-9">
						 <?= Html::dropDownList('country_visit',$newcompany['country_visit'],['no'=>'Norway','dk'=>'Denmark','se'=>'Sweden'],['class'=>'dropdown form-control',])?>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Post Address</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Post Address</label>
						<div class="col-md-9">
							<?= Html::input( 'text', 'address_post', $newcompany['address_post'], ['class'=>'form-control']); ?>
						</div>
					</div>
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Postcode</label>
						<div class="col-md-2">
							<?= Html::input( 'text', 'zip_post',  $newcompany['zip_post'], ['class'=>'form-control'] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-3">Location</label>
						<div class="col-md-4">
							<?= Html::input( 'text', 'place_post', $newcompany['place_post'], ['class'=>'form-control'] ); ?>
						</div>
					</div>
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Country</label>
						<div class="col-md-9">
						<?= Html::dropDownList('country_post',$newcompany['country_post'],['no'=>'Norway','dk'=>'Denmark','se'=>'Sweden'],['class'=>'dropdown form-control',])?>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Phone / E-post / Web</div>
				<div class="panel-body">
					<div class="form-group">	
						<label class="widget-textinputlabel col-md-3">Phone*</label>
						<div class="col-md-3">
							<?= Html::input( 'text', 'phone', $newcompany['phone'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-3">Fax</label>
						<div class="col-md-3">
							<?= Html::input( 'text', 'fax', $newcompany['fax'], ['class'=>'form-control'] ); ?>
						</div>
					</div>
					<div class="form-group">	
						<label class="widget-textinputlabel col-md-3">Email*</label>
						<div class="col-md-3">
							<?= Html::input( 'email', 'email', $newcompany['email'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-3">System Email (from)*</label>
						<div class="col-md-3">
							<?= Html::input( 'email', 'system_email', $newcompany['system_email'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
					</div>
					<div class="form-group">	
						<label class="widget-textinputlabel col-md-3">Notification Email*</label>
						<div class="col-md-3">
							<?= Html::input( 'email', 'notify_email', $newcompany['notify_email'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-3">Receive Email*</label>
						<div class="col-md-3">
							<?= Html::input( 'email', 'receive_email', $newcompany['receive_email'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
					</div>
					<div class="form-group">	
						<label class="widget-textinputlabel col-md-3">Web url</label>
						<div class="col-md-3">
							<?= Html::input( 'text', 'web', $newcompany['web'], ['class'=>'form-control'] ); ?>
						</div>
						<label class="widget-textinputlabel col-md-3">Base url*</label>
						<div class="col-md-3">
							<?= Html::input( 'text', 'base_url', $newcompany['base_url'], ['class'=>'form-control','required'=>''] ); ?>
						</div>
					</div>
													
				</div></div>
				<div class="panel panel-default">
					<div class="panel-heading">Bank information</div>
					<div class="panel-body">
					<div class="form-group">	
					<label class="widget-textinputlabel col-md-3">Bank Account</label>
					<div class="col-md-9">
						<?= Html::input( 'text', 'bank_account',  $newcompany['bank_account'], ['class'=>'form-control'] ); ?>
					</div>
				</div>
				<div class="form-group">	
					<label class="widget-textinputlabel col-md-3">Swift</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'swift', $newcompany['swift'], ['class'=>'form-control'] ); ?>
					</div>
					<label class="widget-textinputlabel col-md-3">Iban</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'iban', $newcompany['iban'], ['class'=>'form-control'] ); ?>
					</div>
				</div>
				</div>
				</div>
				<div class="panel panel-default">
				<div class="panel-heading">Smtp / Email</div>
				<div class="panel-body">
				<div class="form-group">	
					<label class="widget-textinputlabel col-md-3">Smtp server*</label>
					<div class="col-md-9">
						<?= Html::input( 'text', 'smtp_server', 'test', ['class'=>'form-control','required'=>''] ); ?>
					</div>
				</div>
				
				<div class="form-group">
					<label class="widget-textinputlabel col-md-3">Smtp username*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'smtp_username', 'test', ['class'=>'form-control','required'=>''] ); ?>
					</div>
					<label class="widget-textinputlabel col-md-3">Smtp password*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'smtp_password', 'test', ['class'=>'form-control','required'=>''] ); ?>
					</div>
				</div>
				</div></div>
				
				<div class="panel panel-default">
				<div class="panel-heading">Driver License</div>
				<div class="panel-body">
				<div class="form-group">	
					<label class="widget-textinputlabel col-md-3">Kjørel. trekk pda lisens:</label>
					<div class="col-md-9">
						<?= Html::dropDownList('kjoreliste_pdalisens',$newcompany['kjoreliste_pdalisens'],['Y'=>'Yes','N'=>'No'],['class'=>'dropdown form-control',])?>
					</div>
				</div>				
				
				</div></div>
				
				<div class="panel panel-default">
				<div class="panel-heading">Dispatch reload settings (Milisec)</div>
				<div class="panel-body">
				<div class="form-group">	
					<label class="widget-textinputlabel col-md-3">Order list*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'orderlistreload', $newcompany['orderlistreload'], ['class'=>'form-control','required'=>''] ); ?>
					</div>
					<label class="widget-textinputlabel col-md-3">Driver status*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'driverstatusreload', $newcompany['driverstatusreload'], ['class'=>'form-control','required'=>''] ); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="widget-textinputlabel col-md-3">Active orders*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'activeorderlistreload', $newcompany['activeorderlistreload'], ['class'=>'form-control','required'=>''] ); ?>
					</div>
					<label class="widget-textinputlabel col-md-3">Driver messages*</label>
					<div class="col-md-3">
						<?= Html::input( 'text', 'drivermessagesreload', $newcompany['drivermessagesreload'], ['class'=>'form-control','required'=>''] ); ?>
					</div>
				</div>
				</div></div>
				<div class="panel panel-default">
				<div class="panel-heading">Map</div>
				<div class="panel-body">
				<div class="form-group">
					<label class="widget-textinputlabel col-md-3">Map reload (Milisec)*</label>
					<div class="col-md-9">
						<?= Html::input( 'text', 'mapreload', $newcompany['mapreload'], ['class'=>'form-control','required'=>''] ); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="widget-textinputlabel col-md-3">Map lat</label>
					<div class="col-md-9">
						<?= Html::input( 'text', 'map_lat', $newcompany['map_lat'], ['class'=>'form-control'] ); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="widget-textinputlabel col-md-3">Map lng</label>
					<div class="col-md-9">
						<?= Html::input( 'text', 'map_lng', $newcompany['map_lng'], ['class'=>'form-control'] ); ?>
					</div>
				</div>
				</div></div>
				<div class="panel panel-default">
					<div class="panel-heading">Cweb (Customerweb)</div>
					<div class="panel-body">
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Ordertype</label>
						<div class="col-md-9">
							<?= Html::dropDownList('cwebordertype',$newcompany['cwebordertype'],['1'=>'1 old type (select service)','2'=>'2 new type (calculate)'],['class'=>'dropdown form-control'])?>
						</div>
					</div>
					</div>
				</div>				
				<div class="panel panel-default">
					<div class="panel-heading">DIV</div>
					<div class="panel-body">
					<div class="form-group">
						<label class="widget-textinputlabel col-md-3">Max kolliweight (kg)*</label>
						<div class="col-md-9">
							<?= Html::input( 'text', 'maxkolliweight', $newcompany['maxkolliweight'], ['class'=>'form-control','required'=>''] ); ?>
							<p><small>Used for setting the maximum allowed kolliweight before we have to choose a truck with lift.</small></p>
						</div>
					</div>
					</div>
				</div>				
				<div class="panel panel-default">
					<div class="panel-heading">KEYS</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Google Api key</label>
							<div class="col-md-9">
								<?= Html::input( 'text', 'googleapikey', $newcompany['googleapikey'], ['class'=>'form-control'] ); ?>
							</div>
						</div>
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Stripe secret key</label>
							<div class="col-md-9">
								<?= Html::input( 'password', 'Stripe_secret_key', '', ['class'=>'form-control'] ); ?>
							</div>
						</div>
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Stripe publishable key</label>
							<div class="col-md-9">
								<?= Html::input( 'text', 'Stripe_publishable_key', '', ['class'=>'form-control'] ); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Export accounting settings</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Acc. exportformat</label>
							<div class="col-md-9">
								<?= Html::dropDownList('accexportformat', $newcompany['accexportformat'],['1'=>'Visma global','2'=>'Di systems'],['class'=>'dropdown form-control'])?>
							</div>
						</div>
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Invoice Export Email*</label>
							<div class="col-md-9">
							<?= Html::input( 'text', 'invoice_export_email', $newcompany['invoice_export_email'], ['class'=>'form-control','required'=>''] ); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Invoice</div>
					<div class="panel-body">
						
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Text in invoice email</label>
							<div class="col-md-9">
								<?= Html::textarea( 'text_invoice', $newcompany['text_invoice'],   ['class'=>'form-control'] ); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Create Admin</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Client ID (New Db Name)*</label>
							<div class="col-md-9">
								<?= Html::input( 'text', 'dbname', '', ['class'=>'form-control','required'=>''] ); ?>
							</div>
						</div>
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Admin Username*</label>
							<div class="col-md-9">
								<?= Html::input( 'text','admin_username', $newcompany['admin_username'],   ['class'=>'form-control','required'=>''] ); ?>
							</div>
						</div>
						<div class="form-group">
							<label class="widget-textinputlabel col-md-3">Admin Password*</label>
							<div class="col-md-9">
								<?= Html::input( 'text','admin_password', '',   ['class'=>'form-control','required'=>''] ); ?>
							</div>
						</div>
                                                <div class="form-group">
							<label class="widget-textinputlabel col-md-3">Admin email*</label>
							<div class="col-md-9">
								<?= Html::input( 'email','admin_email', $newcompany['admin_email'],   ['class'=>'form-control','required'=>''] ); ?>
							</div>
						</div>
						
					</div>
				</div>
					
 
   
	<?=Html::submitButton('Create Company', ['class' => 'btn btn-info',]);?>
	<?= Html::endForm();?>
                    
</div>
</div>
