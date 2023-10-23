#!/usr/bin/env ruby
# args = ARGF.argv
args = ARGV

# Check if file is first arg
if args.length <= 1 || args[0] !~ /^.+\..+$/
    puts "Missing required arguments"
    return
end

file = args.shift()
w_op = false
p_op = false
v_op = false
c_op = false
m_op = false
while args.length > 1
    arg = args.shift()
    if arg == '-w'
        w_op = true
    elsif arg == '-p'
        p_op = true
    elsif arg == '-v'
        v_op = true
    elsif arg == '-c'
        c_op = true
    elsif arg == '-m'
        m_op = true
    else
        puts "Invalid option"
        return
    end
end
pattern = args.shift()
if pattern[0] == '-'
    puts "Invalid option"
    return
end

# Default option if no other options are set
if !w_op && !p_op && !v_op
    p_op = true
end

# Check for invalid combinations
if c_op && m_op
    puts "Invalid combination of options"
    return
end
if m_op && v_op
    puts "Invalid combination of options"
    return
end

line_count = 0
#Read file and search for pattern
File.open(file, "r").each_line do |line|
    if w_op
        if line.match('(^|\s)'+pattern+'($|\s)')
            if c_op
                line_count += 1
            elsif m_op
                puts pattern
            else
                puts line
            end 
        end
    end
    if p_op
        if line.match(pattern)
            if c_op
                line_count += 1
            elsif m_op
                puts line.match(pattern)
            else
                puts line
            end
        end
    end
    if v_op
        if !line.match(pattern)
            if c_op
                line_count += 1
            else
                puts line
            end
        end
    end
end
if c_op
    puts line_count
end

