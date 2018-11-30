module.exports = {
  entry: './src/App.imba',
  resolve: {
    extensions: ['.imba']
  },
  module: {
    rules: [
      {
        test: /\.imba$/,
        use: [
          {
            loader: "imba/loader"
          }
        ]
      }
    ]
  }
};