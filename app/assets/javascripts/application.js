// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery.jposta
//= require_tree .

$(document).on("turbolinks:load", function(){
	// admin/items#new,editでの画像プレビュー
	function readURL(input) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#img_prev').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#item_image").change(function(){
		readURL(this);
	});
	// public/orders#confirmでの確認ダイアログ
	$('.submit_to_create_order').on('click', function(){
			var result = window.confirm('OKを押すと、注文が確定します。');
			if(!result){
				return false;
			}
	});
});

$(document).on('turbolinks:load', function () {
	$('.jpostal_code').jpostal({
			postcode: ['.jpostal_code'],
			address: {
				'.jpostal_address': '%3%4%5',
			},
		})
});