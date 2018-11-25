module.exports = {
  entry: './src/App.imba',
  resolve: {
    extensions: ['.imba']
  },
  output: {
    path: __dirname,
    filename: "dist/app.js"
  },
  module: {
    rules: [
      {
        test: /\.imba$/, // include .js files
        //exclude: /node_modules/, // exclude any and all files in the node_modules folder
        use: [
          {
            loader: "imba/loader"
          }
        ]
      }
    ]
  }
};