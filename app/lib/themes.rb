# frozen_string_literal: true

require 'singleton'
require 'yaml'

class Themes
  include Singleton

  def initialize

    core = YAML.load_file(Rails.root.join('app', 'javascript', 'core', 'theme.yml'))
    core['pack'] = Hash.new unless core['pack']

    result = Hash.new
    Dir.glob(Rails.root.join('app', 'javascript', 'flavours', '*', 'theme.yml')) do |path|
      data = YAML.load_file(path)
      next unless data['pack']

      dir = File.dirname(path)
      name = File.basename(dir)
      locales = []
      screenshots = []

      if data['locales']
        Dir.glob(File.join(dir, data['locales'], '*.{js,json}')) do |locale|
          localeName = File.basename(locale, File.extname(locale))
          locales.push(localeName) unless localeName.match(/defaultMessages|whitelist|index/)
        end
      end

      if data['screenshot']
        if data['screenshot'].is_a? Array
          screenshots = data['screenshot']
        else
          screenshots.push(data['screenshot'])
        end
      end

      data['name'] = name
      data['locales'] = locales
      data['screenshot'] = screenshots
      data['skin'] = { 'default' => [] }
      result[name] = data
    end

    Dir.glob(Rails.root.join('app', 'javascript', 'skins', '*', '*')) do |path|
      ext = File.extname(path)
      skin = File.basename(path)
      name = File.basename(File.dirname(path))
      next unless result[name]

      if File.directory?(path)
        pack = []
        Dir.glob(File.join(path, '*.{css,scss}')) do |sheet|
          pack.push(File.basename(sheet, File.extname(sheet)))
        end
      elsif ext.match(/^\.s?css$/i)
        skin = File.basename(path, ext)
        pack = ['common']
      end

      if skin != 'default'
        result[name]['skin'][skin] = pack
      end
    end

    @core = core
    @conf = result
  end

  def core
    @core
  end

  def flavour(name)
    @conf[name]
  end

  def flavours
    @conf.keys
  end

  def skins_for(name)
    default_keys = ["default", "light"]
    mastodon_regex = /^mastodon-(?:dark|high-contrast|light)$/

    @conf[name]['skin'].keys.sort do |a, b|
      case
      when default_keys.include?(a) && !default_keys.include?(b)
        -1
      when !default_keys.include?(a) && default_keys.include?(b)
        1
      when mastodon_regex.match?(a) && !mastodon_regex.match?(b)
        -1
      when !mastodon_regex.match?(a) && mastodon_regex.match?(b)
        1
      else
        a <=> b
      end
    end
  end

  def flavours_and_skins
    flavours.map do |flavour|
      [flavour, skins_for(flavour).map{ |skin| [flavour, skin] }]
    end
  end
end
