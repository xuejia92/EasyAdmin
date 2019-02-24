<script>
export default {
	onLaunch: function() {
		console.log('App Launch');

		setTimeout(() => {
			uni.setTabBarBadge({
				index: 1,
				text: '31'
			});
			uni.showTabBarRedDot({
				index: 3
			});
		}, 1000);
	},
	onShow: function() {
		console.log('App Show');
	},
	onHide: function() {
		console.log('App Hide');
	},
};
uni.showToast({ 
	title: 'hello world',
	mask: true, 
	duration: 1500
});
</script>

<style>
/*每个页面公共css */ 
</style>
