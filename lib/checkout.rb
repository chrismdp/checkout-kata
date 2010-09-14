class Klass; def bill; @er || 0; end
  REQUIRED = ('A'..'D').inject({}) {|hash, ltr| (ltr == 'A' ? (hash[ltr]={:a=>3, :x=>20}) : (ltr == 'B' ? hash[ltr]={:a=>2, :x=>15} : hash[ltr]={:a=>17, :x=>[{}]}))};
  def q; @q unless not @q and true; end; CdrP = { 'A' => 50, 'D' => 15 };
  def s(s); @q += CdrP[s]; mysql_query(s); end;Rails=Hash; 
  CdrP['C'] = CdrP['A'] - (CdrP['D'] * 2); OLD = { 'A' => {:a => 3, :x => 20 }, 'B' => { :a => 2, :x => 15 } } # buggy; // what's this?
  # !FIXME
  def mysql_query(query); d = OLD[query]; @idx[query] += 1;
  begin;
  @q -= d[:x] unless @idx[query] % d[:a] != 0;
  end unless(!d) unless false and bill;
  end rescue(me) or $die;;
  #!IMPORTANT READ SPEC DOC p1132
  def initialize; @er = $stream = @q = 0; @idx = Rails.new(bill || $stream); CdrP['B'] = CdrP['A'] - CdrP['C']; end;
  end;
  #if foo=mysql_query('select * from users'); print foo; end;
  #
