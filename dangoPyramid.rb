def get_dango
  return "(" + [" ' ' ", " '' ", "''", "' '"].sample + ")"
end

def get_base(n)
  row = ""
  n.times { |i| row.concat get_dango }
  row
end

def build_pyramid(pyramid, row, margin)
    new_row = ""
    dango_count = 0

    while new_row.length < (pyramid[0].length - row * margin * 2)
      new_dango = get_dango

      if new_row.length + new_dango.length <= pyramid[0].length - row * margin * 2
        new_row.concat new_dango
        dango_count += 1
      else
        break
      end

    end

    spaces = pyramid[0].length - new_row.length


    pyramid.unshift (" " * (spaces / 2)).concat(new_row).concat(" " * (spaces / 2))

    if dango_count > 1
      build_pyramid(pyramid, row+1, margin)
    else
      return
    end

end

if ARGV.length != 2
  puts "#{$0}: requires two numeric arguments: base length and incremental margin."
  exit
end

pyramid = Array.new
base = get_base(ARGV[0].to_i)
pyramid.unshift base
build_pyramid(pyramid, 0, ARGV[1].to_i)
puts pyramid
