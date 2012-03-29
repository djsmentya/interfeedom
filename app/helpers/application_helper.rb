# -*- encoding : utf-8 -*-
module ApplicationHelper
  def ajaxful_rating_script
    if protect_against_forgery?
      authenticity_script = %{
      csrf_param = "authenticity_token";
      csrf_token = #{form_authenticity_token.inspect};

      // Always send the authenticity_token with ajax
      $(document).ajaxSend(function(event, request, settings) {
        if ( settings.type == 'post' ) {
          settings.data = (settings.data ? settings.data + "&" : "")
            + encodeURIComponent( csrf_param ) + "=" + encodeURIComponent( csrf_token );
        }
      });
      }
    end

    %{<script>
      #{authenticity_script}

    $(document).ready(function(){
      $('.ajaxful-rating a').bind('click',function(event){
        event.preventDefault();
        $.ajax({
          type: $(this).attr('data-method'),
          url: $(this).attr('href'),
          data: {
                  stars: $(this).attr('data-stars'),
                  dimension: $(this).attr('data-dimension'),
                  size: $(this).attr('data-size'),
                  show_user_rating: $(this).attr('data-show_user_rating')
                },
          success: function(response){
            $('#' + response.id + ' .show-value').css('width', response.width + '%');
          }
        });
      });
    });
  </script>}
  end

  def additional_price_for(product)
    Setting.preferences[:price_ratio].to_f * product.price + product.price
  end
end
