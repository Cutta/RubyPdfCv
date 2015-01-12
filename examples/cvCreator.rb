# See http://prawn.majesticseacreature.com/manual.pdf
# Attn: Notice the pdf is should be closed when you run your pdf generator ruby code
require 'prawn'
require 'date'

pdf = Prawn::Document.new

pdf.font "Helvetica"

# Defining the grid 
pdf.define_grid(:columns => 5, :rows => 8, :gutter => 10) 

pdf.grid([0,0], [1,1]).bounding_box do 
  pdf.text  "Cuneyt Carikci", :size => 20
  pdf.text "Enjoyneering", :align => :left
  pdf.text "Date: #{Date.today.to_s}", :align => :left
  pdf.move_down 10
  # move_down 10 mean about 1 line space
  pdf.text "Company Name: Hard Soft"
  pdf.text "Tel No: +90 555 444 33 22"
  pdf.text "Mail : cuneyt.carikci@gmail.com"
end

pdf.grid([0,3.6], [1,4]).bounding_box do 
  # Assign the path to your file name first to a local variable.
  logo_path = File.expand_path('../../image/profile.jpg', __FILE__)
  # Displays the image in your PDF. Dimensions are optional.
  pdf.image logo_path, :width => 60, :height => 60, :position => :left

  # Company address
  pdf.move_down 10
  pdf.text "Atapark Mah.", :align => :left
  pdf.text "Kuyubasi sok.", :align => :left
  pdf.text "no: 4", :align => :left
  pdf.text "San Francisco", :align => :left
  pdf.text "California", :align => :left
  pdf.text "Tel No: +90 312 555 44 33", :align => :left
end
#You can change style of text like this line
pdf.text "Details of CV", :style => :bold_italic
pdf.stroke_horizontal_rule#for line ______________

pdf.move_down 40#blablabla...
pdf.text "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
pdf.text "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
pdf.text "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
pdf.text "Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor."
pdf.move_down 40
pdf.text "ITALIC:  Curabitur pretium tincidunt lacus. Nulla gravida orci a odio.", :style => :italic

pdf.move_down 20
pdf.text "..............................."
pdf.text "........................."
pdf.text "......................."
pdf.text "All you need is to understand: \"This man is perfect according to this CV:)\""

pdf.move_down 10
pdf.stroke_horizontal_rule

#for page count
pdf.bounding_box([pdf.bounds.right - 50, pdf.bounds.bottom], :width => 60, :height => 20) do
  pagecount = pdf.page_count
  pdf.text "Page #{pagecount}"
end
# after all steps our pdf create in examples file
pdf.render_file "CV.pdf"