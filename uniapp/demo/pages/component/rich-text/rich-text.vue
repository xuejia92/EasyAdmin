<template>
	<view class="content">
		<page-head :title="title"></page-head>
		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				数组类型
				<text>\nnodes属性为Array</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20upx;">
				<rich-text :nodes="nodes1"></rich-text>
			</view>
			<view class="uni-title uni-common-mt">
				字符串类型
				<text>\nnodes属性为String</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20upx;">
				<rich-text :nodes="strings"></rich-text>
			</view>
		</view>
	</view>
</template>
<script>
	export default {
		data() {
			return {
				title: 'rich-text',
				nodes1: [{
					name: 'div',
					attrs: {
						class: 'div-class',
						style: 'line-height: 60px; color: red; text-align:center;'
					},
					children: [{
						type: 'text',
						text: '<div style="text-align:center;"><img src="https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/uni@2x.png"/></div>'
					},{
						type:'img',
						text:'<a :href="www.baidu.com">百度</a>'
					}]
				}],
				strings: '<div style="text-align:center;"><img src="https://img-cdn-qiniu.dcloud.net.cn/uniapp/images/uni@2x.png"/></div>'
			}
		}
	}
</script>
