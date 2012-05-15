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


  def completed_orders
   Order.completed.group('date(created_at)').select("date(created_at) as created_at, sum(total_price) as total_price").order(:created_at)
  end

  def in_progress_orders
   Order.in_progress.group('date(created_at)').select("date(created_at) as created_at, sum(total_price) as total_price").order(:created_at)
  end

  def orders_by_date(type = :completed)
    mas = []
    if type.eql?(:completed)
      orders = completed_orders
    elsif type.eql?(:in_progress)
     orders = in_progress_orders
    end
    orders.each do |order|
      mas << [order.created_at.to_i * 1000, order.total_price.to_i]
    end
    return mas
  end
end
