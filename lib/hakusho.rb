require "hakusho/version"
require "securerandom"

class Hakusho
  FORMAT = /\A(\h{8})-(\h{4})-([1-5]\h{3})-(\h{4})-(\h{12})\Z/i
  VERSIONS = [1, 2, 3, 4, 5]

  attr_reader :raw

  def initialize(bytes)
    @raw = bytes
  end

  def version
    @raw.getbyte(6) >> 4
  end

  def variant
    byte = @raw.getbyte(8)
    return "Reserved"  if byte & 0x80 == 0x00
    return "RFC4122"   if byte & 0xc0 == 0x80
    return "Microsoft" if byte & 0xe0 == 0xc0
    return "Future"    if byte & 0xe0 == 0xe0
  end

  def valid?
    VERSIONS.include?(version) && variant
  end

  def to_s
    @raw.unpack('H8H4H4H4H12').join(?-)
  end

  def self.parse(str)
    if FORMAT =~ str
      self.new([
        str.byteslice(0, 8),
        str.byteslice(9, 4),
        str.byteslice(14, 4),
        str.byteslice(19, 4),
        str.byteslice(24, 12),
      ].pack('H8H4H4H4H12'))
    end
  end

  def self.create_md5(ns, str)
    create_hash(Digest::MD5, ns, str, 0x30)
  end

  def self.create_random
    create(SecureRandom.random_bytes(16), 0x40)
  end

  def self.create_sha1(ns, str)
    create_hash(Digest::SHA1, ns, str, 0x50)
  end

  private

  def self.create_hash(klass, ns, str, version)
    create(klass.digest("#{ns.raw}#{str}").byteslice(0, 16), version)
  end

  def self.create(bytes, version)
    bytes.setbyte(6, (bytes.getbyte(6) & 0x0f) | version)
    bytes.setbyte(8, (bytes.getbyte(8) & 0x3f) | 0x80)
    self.new(bytes)
  end
end
