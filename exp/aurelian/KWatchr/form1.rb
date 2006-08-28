#
# $Id$
#

require 'Qt'

require 'rubygems'
require_gem 'tzinfo'

include TZInfo


class WorldWatcher < Qt::Widget

    attr_reader :gb_sydney
    attr_reader :tl_sydney
    attr_reader :gb_tokyo
    attr_reader :tl_tokyo
    attr_reader :gb_bucharest
    attr_reader :tl_bucharest
    attr_reader :gb_london
    attr_reader :tl_london
    attr_reader :gb_new_york
    attr_reader :tl_new_york

    def initialize(parent = nil, name = nil, fl = 0)
        super

        if name.nil?
        	setName("WorldWatcher")
        end

        @gb_sydney = Qt::GroupBox.new(self, "gb_sydney")
        @gb_sydney.setGeometry( Qt::Rect.new(10, 10, 140, 90) )

        @tl_sydney = Qt::Label.new(@gb_sydney, "tl_sydney")
        @tl_sydney.setGeometry( Qt::Rect.new(10, 15, 100, 60) )

        @gb_tokyo = Qt::GroupBox.new(self, "gb_tokyo")
        @gb_tokyo.setGeometry( Qt::Rect.new(160, 10, 140, 90) )

        @tl_tokyo = Qt::Label.new(@gb_tokyo, "tl_tokyo")
        @tl_tokyo.setGeometry( Qt::Rect.new(10, 15, 100, 60) )

        @gb_bucharest = Qt::GroupBox.new(self, "gb_bucharest")
        @gb_bucharest.setGeometry( Qt::Rect.new(310, 10, 140, 90) )

        @tl_bucharest = Qt::Label.new(@gb_bucharest, "tl_bucharest")
        @tl_bucharest.setGeometry( Qt::Rect.new(10, 15, 100, 60) )

        @gb_london = Qt::GroupBox.new(self, "gb_london")
        @gb_london.setGeometry( Qt::Rect.new(460, 10, 140, 90) )

        @tl_london = Qt::Label.new(@gb_london, "tl_london")
        @tl_london.setGeometry( Qt::Rect.new(10, 15, 100, 60) )

        @gb_new_york = Qt::GroupBox.new(self, "gb_new_york")
        @gb_new_york.setGeometry( Qt::Rect.new(610, 10, 140, 90) )

        @tl_new_york = Qt::Label.new(@gb_new_york, "tl_new_york")
        @tl_new_york.setGeometry( Qt::Rect.new(10, 15, 100, 60) )
        languageChange()
        resize( Qt::Size.new(760, 121).expandedTo(minimumSizeHint()) )
        clearWState( WState_Polished )
    end

    #
    #  Sets the strings of the subwidgets using the current
    #  language.
    #
    def languageChange()
        setCaption(trUtf8("World Watcher"))

	      tzone= { 
          "new_york"  => Timezone.get('America/New_York'),
          "tokyo"     => Timezone.get('Asia/Tokyo'),
	        "london"    => Timezone.get('Europe/London'), 
          "sydney"    => Timezone.get('Australia/Sydney'),
	        "bucharest" => Timezone.get('Europe/Bucharest')}
        
        format = "%d/%m/%Y\n%H:%M:%S"

        @gb_sydney.setTitle( "Sydney" )
        #@tl_sydney.setText( tzone["sydney"].now.to_s )
        @tl_sydney.setText( tzone["sydney"].strftime(format) )

        @gb_tokyo.setTitle( trUtf8("Tokyo") )
        @tl_tokyo.setText( tzone["tokyo"].strftime(format) )

        @gb_bucharest.setTitle( "Bucharest" )
        @tl_bucharest.setText( tzone["bucharest"].strftime(format) )

        @gb_london.setTitle( "London" )
        @tl_london.setText( tzone["london"].strftime(format) )

        @gb_new_york.setTitle( "New York" )
        @tl_new_york.setText( tzone["new_york"].strftime(format) )

    end

    protected :languageChange

end

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    w = WorldWatcher.new
    a.mainWidget = w
    w.show
    a.exec
end
