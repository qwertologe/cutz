#!/usr/bin/env ruby

$cmd='../bin/cutz'

def test_cutz(params,assertExitstatus,assertText=nil)
  resultText=`#{$cmd} #{params} test_cutz.txt 2>&1`
  resultExitstatus = $?.exitstatus
  failed=false
  if (assertExitstatus and resultExitstatus != 0) or (!assertExitstatus and resultExitstatus == 0)
    failinfo="assertExitstatus: #{assertExitstatus}\nresultExitstatus: #{resultExitstatus}"
    failed=true
  end
  if (assertText and assertText != resultText)
    failinfo="### assertText:\n#{assertText}\n### resultText:\n#{resultText}"
    failed=true
  end
  fail "failed with params: #{params}\n#{failinfo}" if failed
end

test_cutz '-abcde',false
test_cutz '-f-1,1',true,'789 123
c a

1234567890 1234567890
'

test_cutz '-f-1..-2 -o:',true,'789:456
c:b


'

test_cutz '-c-1..1',true,'987  654 321
c    b   a

0987654321
'

test_cutz '-c-1,5..7,1 -t',true,'9 456 1
c b   a
       
0 567 1
'

test_cutz '-f2 -ha',true,'<thead>
<tr><th>456</th></tr>
</thead>
<tbody>
<tr><td>b</td></tr>
<tr><td></td></tr>
</tbody>
<tfoot>
<tr><td></td></tr>
</tfoot>
'

test_cutz '-f2 -h --th id=abc',true,'<thead id=abc>
<tr><th>456</th></tr>
</thead>
<tbody>
<tr><td>b</td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
</tbody>
'



