module.exports = {
  entry: './src/App.imba',
  resolve: {
    extensions: ['.imba']
  },
  module: {
    rules: [
			{
				test: /\.imba$/,
				loader: 'imba/loader',
				options: {es6: true}
			}
    ]
  }
};