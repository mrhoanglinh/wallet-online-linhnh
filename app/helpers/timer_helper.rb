module TimerHelper

	MONTHS_NAMES = {
      :'1' => 'January',
      :'2' => 'February',
      :'3' => 'March',
      :'4' => 'April',
      :'5' => 'May',
      :'6' => 'June',
      :'7' => 'July',
      :'8' => 'August',
      :'9' => 'September',
      :'10' => 'October',
      :'11' => 'November',
      :'12' => 'December'
  }

  def months_until_now
    current_month = Time.now.month

    (1..current_month).to_a.map { |mn| MONTHS_NAMES[:"#{mn}"]}
  end
end