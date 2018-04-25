module Users
  module Formating
    extend ActiveSupport::Concern

    def pick (a,b)
      (a..b).to_a.sample.to_i
    end

    # ------------------------
    # --    PROTECTED      ---
    # ------------------------
    protected

      def phone_number_format
        self.cell_phone_nr = format_by_two(cell_phone_nr) unless (cell_phone_nr.nil?)
      end

    # ------------------------
    # --    PRIVATE        ---
    # ------------------------
    private
      def format_by_two (nr)
        nr = nr.sub( '+33' , '0').tr '^0-9', ''

        reg2 = /(\d{2})(\d{2})(\d{2})(\d{2})(\d+)/
        my_match = reg2.match(nr)
        return nr if my_match == nil || nr.length < 10
        my_match.captures.compact.join(' ')
      end

      def to_hex_color(nr)
        incomplete_nr = nr.to_s(16)
        complete_nr= "0" * (6 - incomplete_nr.length) + incomplete_nr
      end


      def h_random(i)
        gold = (1 + Math.sqrt(5))/2
        perso = gold * i.to_i
        nr = (perso - perso.floor)
        ((nr * 90) + 340).modulo(360).floor
      end

      def to_hsl(h,s,l)
        "hsl(#{h}, #{s}%, #{l}%)"
      end
  end
end