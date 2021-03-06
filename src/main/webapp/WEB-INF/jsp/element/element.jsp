<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@next/lib/theme-default/index.css">
    <link rel="stylesheet" href="https:////unpkg.com/element-ui@1.4.4/lib/theme-default/index.css">
    <style>
        .form{
            width: 100%;
            margin-top: 20px;
            float: left;
        }

        .f_right{
            float: left;
            margin-left: 100px;
        }

    </style>
</head>
<body>
<div id="app">
<%--面包屑--%>
    <el-breadcrumb separator="/">
        <el-breadcrumb-item>首页</el-breadcrumb-item>
        <el-breadcrumb-item>element+vue</el-breadcrumb-item>
    </el-breadcrumb>

    <%--tab页标签--%>
    <template>
        <el-tabs v-model="activeName" style="margin-top: 10px;margin-left: 500px;">
            <el-tab-pane label="表格" name="table">
                <!--列表顶部搜索和工具条-->
                <el-row>
                    <el-form :inline="true" :model="searchForm" class="demo-form-inline">
                        <el-form-item label="ID">
                            <el-input v-model="searchForm.id" placeholder="ID"></el-input>
                        </el-form-item>
                        <el-form-item label="名称">
                            <el-input v-model="searchForm.name" placeholder="名称"></el-input>
                        </el-form-item>
                        <el-form-item label="状态">
                            <el-select v-model="searchForm.state" placeholder="状态">
                                <el-option label="区域一" value="shanghai"></el-option>
                                <el-option label="区域二" value="beijing"></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" icon="search" @click="searchClick">查询</el-button>
                            <el-button type="success" icon="plus" @click="addClick">新增</el-button>
                        </el-form-item>
                    </el-form>
                </el-row>

                <template>
                    <el-table
                            :data="tableData"
                            v-loading.body="loading"
                            border
                            @selection-change="selectionChange"
                            :default-sort = "{prop: 'birth', order: 'descending'}"
                            style="width: 100%">
                        <el-table-column
                                type="selection"
                                width="55">
                        </el-table-column>
                        <el-table-column
                                sortable
                                prop="birth"
                                label="日期"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="80">
                        </el-table-column>
                        <el-table-column
                                prop="province"
                                label="省份"
                                width="80">
                        </el-table-column>
                        <el-table-column
                                prop="city"
                                label="市区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                width="300">
                        </el-table-column>
                        <el-table-column
                                prop="zip"
                                label="邮编"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                label="操作" width="220">
                            <template scope="scope">
                                <el-button :plain="true" type="success" size="small" icon="edit" @click="editClick(scope.row)">编辑</el-button>
                                <el-button :plain="true" type="danger" size="small" icon="delete" @click="deleteClick(scope.row)">删除</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

                <!--编辑界面-->
                <el-dialog title="编辑" v-model="editFormVisible" :close-on-click-modal="false">
                    <el-form :model="editForm" label-width="80px" :rules="editFormRules" ref="editForm">
                        <el-form-item label="姓名" prop="name">
                            <el-input v-model="editForm.name" auto-complete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="性别">
                            <el-radio-group v-model="editForm.sex">
                                <el-radio class="radio" name="sex" :label="1">男</el-radio>
                                <el-radio class="radio" name="sex" :label="0">女</el-radio>
                            </el-radio-group>
                        </el-form-item>
                        <el-form-item label="年龄">
                            <el-input-number v-model="editForm.age" :min="0" :max="200"></el-input-number>
                        </el-form-item>
                        <el-form-item label="生日">
                            <el-date-picker type="date" placeholder="选择日期" v-model="editForm.birth"></el-date-picker>
                        </el-form-item>
                        <el-form-item label="地址">
                            <el-input type="textarea" v-model="editForm.address"></el-input>
                        </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                        <el-button @click.native="editFormVisible = false">取消</el-button>
                        <el-button type="primary" @click.native="editSubmit" :loading="editLoading">提交</el-button>
                    </div>
                </el-dialog>


                <!--列表底部工具条和分页符-->
                <el-row style="margin-top: 20px" type="flex" justify="end">
                    <el-col :span="6" >
                        <el-button :plain="true" type="danger" size="small" icon="delete" @click="removeSelection">删除所选</el-button>
                    </el-col>
                    <el-col :span="18" >
                        <el-pagination
                                style="float: right"
                                @size-change="pageSizeChange"
                                @current-change="currentPageChange"
                                :current-page="currentPage"
                                :page-sizes="[10, 20, 30, 50]"
                                :page-size="pageSize"
                                layout="total, sizes, prev, pager, next, jumper"
                                :total="total">
                        </el-pagination>
                    </el-col>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="表单" name="form">
                <%--表单--%>
                <el-row class="form">
                    <el-form rel="form" :model="form" label-width="80px">
                        <el-form-item label="姓名">
                            <el-input v-model="form.name"></el-input>
                        </el-form-item>

                        <el-form-item label="出生日期">
                            <el-date-picker type="date" placeholder="选择出生日期" v-model="form.birth"></el-date-picker>
                        </el-form-item>

                        <el-form-item label="学历">
                            <el-select v-model="form.edu" placeholder="请选择学历">
                                <el-option labe="本科" value="bk"></el-option>
                                <el-option labe="博士" value="bos"></el-option>
                                <el-option labe="专科" value="zk"></el-option>
                                <el-option labe="硕士" value="so"></el-option>
                            </el-select>
                        </el-form-item>

                        <el-form-item label="兴趣爱好">
                            <el-checkbox-group v-model="form.love">
                                <el-checkbox label="篮球" name="type"></el-checkbox>
                                <el-checkbox label="游泳" name="type"></el-checkbox>
                                <el-checkbox label="看书" name="type"></el-checkbox>
                            </el-checkbox-group>
                        </el-form-item>

                        <el-form-item>
                            <el-button type="primary" @click="onSubmit" :disabled="true">立即创建</el-button>
                            <el-button>取消</el-button>
                        </el-form-item>
                    </el-form>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="穿梭框" name="transfer">
                <el-row class="f_right">
                    <el-transfer
                            :titles="['备选','已选']"
                            v-model="value2"
                            :data="data2">
                    </el-transfer>
                </el-row>
            </el-tab-pane>
            <el-tab-pane label="计数器" name="number">
                <%--计数器--%>
                <template>
                    <el-input-number v-model="num1" size="small" :min="1" :max="100"></el-input-number>
                </template>

            </el-tab-pane>
            <el-tab-pane label="走马灯" name="carousel">
                <div class="block">
                    <span class="demonstration">Click 指示器触发</span>
                    <el-carousel trigger="click" height="150px">
                        <el-carousel-item v-for="item in 4" :key="item">
                            <img src="/css/img/xwolf.jpg">
                        </el-carousel-item>
                    </el-carousel>
                </div>
            </el-tab-pane>
            <el-tab-pane label="走马灯2" name="carousel2">
                <div class="block" style="width: 1000px;">
                    <el-carousel type="card" :interval="4000" height="200px">
                        <el-carousel-item v-for="item in imgs" :key="item">
                            <img :src="item">
                        </el-carousel-item>
                    </el-carousel>
                </div>
            </el-tab-pane>
            <el-tab-pane label="菜单树" name="tree">
                <el-tree
                        :data="treeData"
                        show-checkbox
                        node-key="id"
                        :default-expanded-keys="[2, 3]"
                        :default-checked-keys="[5]"
                        :props="defaultProps">
                </el-tree>
            </el-tab-pane>
            <el-tab-pane label="级联选择器" name="cascadeSelector">
                <div class="block">
                    <span class="demonstration">hover 触发子菜单</span>
                    <el-cascader
                            expand-trigger="hover"
                            :options="options"
                            v-model="selectedOptions"
                            change-on-select
                            filterable
                            @change="handleChange">
                    </el-cascader>
                </div>
            </el-tab-pane>
        </el-tabs>
    </template>

</div>




</body>
</html>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui@1.4.4/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: {
            //下拉框数据
            selectData:[{
                value:'apple',
                label:'苹果'
            },{
                value:'water',
                label:'水'
            },{
                value:'pear',
                label:'梨子'
            }],
            fruit:'',
            //列表数据
            tableData: [{
                birth: '2016-05-03',
                name: '王小虎',
                province: '上海',
                city: '普陀区',
                address: '上海市普陀区金沙江路 1518 弄',
                zip: 200333
            }, {
                birth: '2016-05-02',
                name: '王小虎',
                province: '上海',
                city: '普陀区',
                address: '上海市普陀区金沙江路 1518 弄',
                zip: 200333
            }, {
                birth: '2016-05-04',
                name: '王小虎',
                province: '上海',
                city: '普陀区',
                address: '上海市普陀区金沙江路 1518 弄',
                zip: 200333
            }, {
                birth: '2016-05-01',
                name: '王小虎',
                province: '上海',
                city: '普陀区',
                address: '上海市普陀区金沙江路 1518 弄',
                zip: 200333
            }],
            //显示加载中样式
            loading:false,
            //搜索表单
            searchForm: {
                id: '',
                name: '',
                state: ''
            },
            //多选值
            multipleSelection: [],
            //当前页
            currentPage:1,
            //分页大小
            pageSize:1,
            //总记录数
            total:4,
            //删除的弹出框
            deleteVisible:false,
            //编辑界面是否显示
            editFormVisible: false,
            editLoading: false,
            editFormRules: {
                name: [
                    { required: true, message: '请输入姓名', trigger: 'blur' }
                ]
            },
            //编辑界面数据
            editForm: {
                id: 0,
                name: '',
                sex: '1',
                age: 0,
                birth: '',
                address: ''
            },
            form:{//form表单
                name:"123",
                birth:"",
                love:[],
                edu:"bk"
            },
            //穿梭框
            data2:[{key:1,label:"看书"},{key:2,label:"篮球"},{key:3,label:"游泳",disabled:true}],
            value2:[],
            num1:15,
            activeName:'table',
            imgs:['/css/img/xwolf1.jpg','/css/img/xwolf2.jpg','/css/img/xwolf3.jpg'],
            treeData:[
                {
                    id:1,
                    label:'一级1',
                    children:[{
                        id:4,
                        label:'一级1-1',
                        children:[]
                    }]
                },
                {
                    id:2,
                    label:'二级1',
                    children:[{
                        id:5,
                        label:'二级1-1',
                        children:[]
                    },{
                        id:6,
                        label:'二级1-2',
                        children:[]
                    }]
                },
                {
                    id:3,
                    label:'三级1',
                    children:[]
                }
            ],
            defaultProps: {
                children: 'children',
                label: 'label'
            },
            options:[{
                value:"fruit",
                label:"水果",
                children:[{
                    value:"red",
                    label:"红色",
                    children:[{
                        value:"apple",
                        label:"苹果"
                    },{
                        value:"peach",
                        label:"桃子"
                    }]
                },{
                    value:"white",
                    label:"白色",
                    children:[{
                        value:"pear",
                        label:"水晶梨"
                    },{
                        value:"Muskmelon",
                        label:"香瓜"
                    }]
                },{
                    value:"green",
                    label:"绿色",
                    children:[{
                        value:"orange",
                        label:"橘子"
                    },{
                        value:"watermelon",
                        label:"西瓜"
                    }]
                }]
            },{
                value:"ball",
                label:"球类",
                children:[{
                    value:"circle",
                    label:"圆形",
                    children:[{
                        value:"basketball",
                        label:"篮球"
                    },{
                        value:"football",
                        label:"足球"
                    }]
                },{
                    value:"small",
                    label:"小球",
                    children:[{
                        value:"pingpong",
                        label:"乒乓球"
                    },{
                        value:"Billiards",
                        label:"台球"
                    }]
                },{
                    value:"big",
                    label:"大球",
                    children:[{
                        value:"Rugby",
                        label:"橄榄球"
                    },{
                        value:"bowling",
                        label:"保龄球"
                    }]
                }]
            }],
            selectedOptions:[]
        },

        methods:{
            //表格重新加载数据
            loadingData:function() {
                var _self = this;
                _self.loading = true;
                setTimeout(function(){
                    console.info("加载数据成功");
                    _self.loading = false;
                },300);
            },
            //表格编辑事件
            editClick:function(row) {
                this.editFormVisible = true;
                this.editForm = Object.assign({}, row);
            },
            //表格删除事件
            deleteClick:function(row) {
                var _self = this;
                this.$confirm('确认删除' + row.name +'吗?', '提示', {
                    type: 'warning'
                }).then(function(){
                    _self.$message({
                        message: row.name + '删除成功',
                        type: 'success'
                    });
                    _self.loadingData();//重新加载数据
                }).catch(function(e){
                    if(e != "cancel")
                        console.log("出现错误：" + e);
                });
            },
            //新建事件
            addClick:function() {
                var _self = this;
                this.editFormVisible = true;
                //_self.loadingData();//重新加载数据
            },
            //表格查询事件
            searchClick:function() {
                alert("搜索");
                var _self = this;
                _self.loadingData();//重新加载数据
            },
            //表格勾选事件
            selectionChange:function(val) {
                for(var i=0;i<val.length;i++) {
                    var row = val[i];
                }
                this.multipleSelection = val;
                console.info(val);
            },
            //删除所选，批量删除
            removeSelection:function() {
                var _self = this;
                var multipleSelection = this.multipleSelection;
                if(multipleSelection.length < 1) {
                    _self.$message({
                        message: '请至少选中一条记录',
                        type: 'error'
                    });
                    return;
                }
                var ids = "";
                for(var i=0;i<multipleSelection.length;i++) {
                    var row = multipleSelection[i];
                    ids += row.name + ","
                }
                this.$confirm('确认删除' + ids +'吗?', '提示', {
                    type: 'warning'
                }).then(function(){
                    _self.$message({
                        message: ids + '删除成功',
                        type: 'success'
                    });
                    _self.loadingData();//重新加载数据
                }).catch(function(e){
                    if(e != "cancel")
                        console.log("出现错误：" + e);
                });
            },
            //分页大小修改事件
            pageSizeChange:function(val) {
                console.log('每页 ' + val +' 条');
                this.pageSize = val;
                var _self = this;
                _self.loadingData();//重新加载数据
            },
            //当前页修改事件
            currentPageChange:function(val) {
                this.currentPage = val;
                console.log('当前页: ' + val);
                var _self = this;
                _self.loadingData();//重新加载数据
            },
            //保存点击事件
            editSubmit:function(){
                console.info(this.editForm);
            },
            onSubmit:function () {
                console.log(this.form);
            },
            handleChange:function (value) {
                console.log("当前选择的是："+value);
                console.log("当前选择的是："+this.selectedOptions);
            }
        }
    });


</script>