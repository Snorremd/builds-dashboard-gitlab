const path = require("path");
const webpack = require('webpack');
const autoprefixer = require('autoprefixer');

module.exports = {
  entry: {
    app: [
      'tether',
      'bootstrap-loader',
      './src/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  plugins: [
      new webpack.ProvidePlugin({
      "window.Tether": "tether"
    })
  ],

  module: {
    loaders: [
      { test: /\.css$/, loaders: [ 'style', 'css', 'postcss' ] },
      { test: /\.scss$/, loaders: [ 'style', 'css', 'postcss', 'sass' ] },
      {
        test: /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url?limit=10000"
      },
      {
        test: /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
        loader: 'file'
      },
      { test: /bootstrap\/dist\/js\/umd\//, loader: 'imports?jQuery=jquery' },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  'file?name=[name].[ext]',
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-webpack',
      }
    ],

    noParse: /\.elm$/,
  },

  postcss: [ autoprefixer ],

  devServer: {
    inline: true,
    stats: { colors: true },
  },

};