module Orkut
  class Version

    def self.major
      0
    end

    def self.minor
      0
    end

    def self.patch
      0
    end

    def self.pre
      34 #nil
    end

    def self.to_s
      [major, minor, patch, pre].compact.join('.')
    end

  end
end
