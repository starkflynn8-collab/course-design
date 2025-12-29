<template>
  <div>
    <div style="padding-bottom: 20px">
      <el-input
        placeholder="搜索商品名"
        v-model="gName"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索商品价格"
        v-model="gPrice"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索商品描述"
        v-model="gContent"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-button type="primary" @click="search">搜索</el-button>
    </div>
    <div>
      <el-button type="primary" size="small" @click="addGoods">添加</el-button>
      <el-button type="danger" size="small" @click="deleteIds"
        >批量删除</el-button
      >
    </div>
    <el-table
      ref="multipleTable"
      :data="goods"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column prop="gId" label="商品ID" width="120" sortable></el-table-column>
      <el-table-column prop="gName" label="商品名" width="120"></el-table-column>
      <el-table-column prop="gCount" label="商品数量" width="120" sortable></el-table-column>
      <el-table-column prop="gPrice" label="商品价格" width="120" sortable></el-table-column>
      <el-table-column prop="gContent" label="商品描述" show-overflow-tooltip></el-table-column>

      <el-table-column prop="gLevel" label="商品评价" width="120" sortable></el-table-column>
      <el-table-column prop="uId" label="卖家ID" width="120" sortable></el-table-column>
      <el-table-column
          prop="gContact"
          label="联系方式"
          width="150"
          show-overflow-tooltip
      ></el-table-column>

      <el-table-column label="商品图片" width="120" align="center">
        <template slot-scope="scope">
          <img
              v-if="scope.row.gImage"
              :src="getImageUrl(scope.row.gImage)"
              style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px; border: 1px solid #eee;"
              @error="handleImgError($event)"
          />
          <span v-else style="color: #999;">无图片</span>
        </template>
      </el-table-column>



      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >编辑</el-button
          >
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="pageLimits"
      :page-size="limit"
      layout="total, sizes, prev, pager, next, jumper"
      :total="itemTotal"
    >
    </el-pagination>

    <el-drawer
      title="编辑商品"
      :visible.sync="drawerEdit"
      direction="rtl"
      :before-close="handleClose"
    >
      <div style="margin: 10px">
        <el-form label-position="left" label-width="80px" :model="goodsItem">
          <el-form-item label="商品名称:">
            <el-input
              v-model="goodsItem.gName"
              :placeholder="goodsItem.gName"
            ></el-input>
          </el-form-item>
          <el-form-item label="所属学院" prop="college"
                        :rules="[{ required: true, message: '请选择学院' }]">
            <el-select v-model="goodsItem.college" placeholder="请选择学院">
              <el-option label="工学" value="工学"/>
              <el-option label="理学" value="理学"/>
              <el-option label="经济管理" value="经管"/>
              <el-option label="人文社科" value="人文"/>
              <el-option label="医学" value="医学"/>
              <el-option label="艺术" value="艺术"/>
            </el-select>
          </el-form-item>

          <el-form-item label="校区" prop="campus"
                        :rules="[{ required: true, message: '请选择校区' }]">
            <el-select v-model="goodsItem.campus" placeholder="请选择校区">
              <el-option label="九龙湖校区" value="九龙湖"/>
              <el-option label="四牌楼校区" value="四牌楼"/>
              <el-option label="丁家桥校区" value="丁家桥"/>
            </el-select>
          </el-form-item>

          <el-form-item label="课程类别" prop="subject">
            <el-radio-group v-model="goodsItem.subject">
              <el-radio label="通识基础课"/>
              <el-radio label="专业课"/>
            </el-radio-group>
          </el-form-item>

          <el-form-item label="书籍类型" prop="type">
            <el-select v-model="goodsItem.type">
              <el-option label="教材" value="教材"/>
              <el-option label="参考书" value="参考书"/>
              <el-option label="考研资料" value="考研"/>
              <el-option label="其他" value="其他"/>
            </el-select>
          </el-form-item>

          <el-form-item label="商品价格:">
            <el-input
              v-model="goodsItem.gPrice"
              :placeholder="goodsItem.gPrice"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品数量:">
            <el-input
              v-model="goodsItem.gCount"
              :placeholder="goodsItem.gCount"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品图片">
            <el-upload
                action="#"
                list-type="picture-card"
                :auto-upload="false"
                :limit="1"
                :on-preview="handlePreview"
                :on-remove="handleRemove"
                :on-change="handleFileChange"
                :file-list="fileList"
                accept="image/*"
            >
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="previewVisible" append-to-body>
              <img width="100%" :src="previewUrl" alt="" />
            </el-dialog>
          </el-form-item>

          <el-form-item label="商品描述:">
            <el-input
              v-model="goodsItem.gContent"
              type="textarea"
              :placeholder="goodsItem.gContent"
            ></el-input>
          </el-form-item>
          <el-form-item
              label="商家联系方式"
              prop="gContact"
              :rules="[{ required: true, message: '请输入联系方式' }]"
          >
            <el-input
                v-model="goodsItem.gContact"
                placeholder="请输入手机号 / 微信号 / QQ"
            ></el-input>
          </el-form-item>

          <el-form-item style="display: flex; justify-content: center">
            <el-button type="primary" @click="submitEdit">修改</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>

    <el-drawer title="添加商品" :visible.sync="drawerAdd" direction="rtl" size="50%">
      <div style="padding: 20px">
        <el-form label-position="top" :model="goodsItem" ref="addForm">
          <el-form-item label="商品名称" prop="gName" :rules="[{ required: true, message: '请输入商品名称' }]">
            <el-input v-model="goodsItem.gName" placeholder="请输入商品名称（如：高等数学 第7版）"></el-input>
          </el-form-item>
          <el-form-item label="所属学院" prop="college"
                        :rules="[{ required: true, message: '请选择学院' }]">
            <el-select v-model="goodsItem.college" placeholder="请选择学院">
              <el-option label="工学" value="工学"/>
              <el-option label="理学" value="理学"/>
              <el-option label="经管" value="经管"/>
              <el-option label="人文" value="人文"/>
              <el-option label="医学" value="医学"/>
              <el-option label="艺术" value="艺术"/>
            </el-select>
          </el-form-item>

          <el-form-item label="校区" prop="campus"
                        :rules="[{ required: true, message: '请选择校区' }]">
            <el-select v-model="goodsItem.campus" placeholder="请选择校区">
              <el-option label="九龙湖校区" value="九龙湖"/>
              <el-option label="四牌楼校区" value="四牌楼"/>
              <el-option label="丁家桥校区" value="丁家桥"/>
            </el-select>
          </el-form-item>

          <el-form-item label="课程类别" prop="subject">
            <el-radio-group v-model="goodsItem.subject">
              <el-radio label="通识基础课"/>
              <el-radio label="专业课"/>
            </el-radio-group>
          </el-form-item>

          <el-form-item label="书籍类型" prop="type">
            <el-select v-model="goodsItem.type">
              <el-option label="教材" value="教材"/>
              <el-option label="参考书" value="参考书"/>
              <el-option label="考研资料" value="考研"/>
              <el-option label="其他" value="其他"/>
            </el-select>
          </el-form-item>

          <el-form-item label="商品价格（元）" prop="gPrice" :rules="[{ required: true, message: '请输入价格' }]">
            <el-input v-model.number="goodsItem.gPrice" placeholder="例如：25.00"></el-input>
          </el-form-item>

          <el-form-item label="商品数量" prop="gCount" :rules="[{ required: true, message: '请输入数量' }]">
            <el-input v-model.number="goodsItem.gCount" placeholder="库存数量"></el-input>
          </el-form-item>

          <el-form-item label="商品成色" prop="gLevel">
            <el-rate v-model="goodsItem.gLevel" :texts="['很差', '较差', '一般', '良好', '全新']" show-text></el-rate>
          </el-form-item>

          <el-form-item label="商品描述" prop="gContent">
            <el-input
                v-model="goodsItem.gContent"
                type="textarea"
                :rows="4"
                placeholder="描述书籍版本、划线情况、使用痕迹等，越详细越好"
            ></el-input>
          </el-form-item>
          <el-form-item label="联系方式:">
            <el-input
                v-model="goodsItem.gContact"
                placeholder="请输入联系方式"
            ></el-input>
          </el-form-item>

          <el-form-item label="上传商品图片（最多1张）">
            <el-upload
                action="#"
                list-type="picture-card"
                :auto-upload="false"
                :limit="1"
                :on-preview="handlePreview"
                :on-remove="handleRemove"
                :on-change="handleFileChange"
                :file-list="fileList"
                accept="image/*"
            >
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="previewVisible" append-to-body>
              <img width="100%" :src="previewUrl" alt="" />
            </el-dialog>
          </el-form-item>

          <el-form-item style="text-align: center; margin-top: 30px">
            <el-button @click="drawerAdd = false">取消</el-button>
            <el-button type="primary" @click="submitAdd" :loading="adding">发布商品</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name: "Goods",
  data() {
    return {
      currUser: JSON.parse(localStorage.getItem("currUser")),
      uId: JSON.parse(localStorage.getItem("currUser"))?.uid || null,
      drawerEdit: false,
      drawerAdd: false,
      adding: false,              // 提交时加载状态
      fileList: [],              // 上传组件的文件列表
      uploadFile: null,          // 当前选择的图片文件
      previewVisible: false,     // 预览弹窗
      goodsItem: {
        gName: '',
        gPrice: null,
        gCount: null,
        gContent: '',
        gLevel: 4,
        gContact: '',
        college: '',
        campus: '',
        subject: '',
        type: ''
      },
      previewUrl: '',
      token: localStorage.getItem("token"),
      gName: null,
      gPrice: null,
      gContent: null,
      currentPage: 1,
      pageLimits: [10, 20, 30, 40],
      limit: 10,
      ids: [],
      itemTotal: 10,
      goods: [],
      apiBase: 'http://localhost:8888',
    };
  },
  created() {
    this.getGoods(); // 页面加载时显示当前用户商品
  },

  methods: {
    getImageUrl(gimage) {
      if (!gimage) return '';
      if (gimage.startsWith('http')) return gimage;
      return this.apiBase + gimage;
    },
    handleImgError(e) {
      e.target.src = this.apiBase + '/upload/default-book.jpg';
    },
    handleClose(done) {
      this.goodsItem = {};
      done();
    },
    handleSelectionChange(val) {
      this.ids.length = 0;
      val.forEach((item) => {
        this.ids.push(item.gId);
      });
    },
    getGoods() {
      console.log('强制重新请求商品数据');  // 加这行
      this.axios
          .get("http://localhost:8888/goods/search", {
            params: {
              gName: this.gName,
              gPrice: this.gPrice,
              gContent: this.gContent,
              uId: this.uId,

              page: this.currentPage,
              limit: this.limit,
              t: new Date().getTime()  // 加这行！强制不缓存
            },
          })
          .then((resp) => {
            console.log('后端返回数据:', resp.data);  // 加这行！打印真实数据
            if (resp.data.message === "ok" || resp.data.code === 200) {
              this.itemTotal = resp.data.data.total || resp.data.data.totalRecords;
              this.goods = resp.data.data.records.map(item => ({
                gId: item.gid || item.gId,
                gName: item.gname || item.gName,
                gPrice: item.gprice || item.gPrice,
                gCount: item.gcount || item.gCount,
                gContent: item.gcontent || item.gContent,
                gLevel: item.glevel || item.gLevel,
                gContact: item.gcontact || item.gContact,
                uId: item.uid || item.uId,
                gImage: item.gimage || item.gImage,
                college: item.college,
                campus: item.campus,
                subject: item.subject,
                type: item.type
              }));



            }
          })
          .catch((error) => {
            console.log(error);
          });
    },
    handleSizeChange(limit) {
      this.limit = limit;
      this.currentPage = 1;
      this.getGoods();
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getGoods();
    },
    search() {
      this.currentPage = 1;
      this.getGoods();
    },
    handleEdit(index, row) {
      this.goodsItem = {...row};

      // 初始化上传组件
      this.fileList = [];
      this.uploadFile = null;

      if (row.gImage) {
        this.fileList = [
          {
            name: '原图片',
            url: this.getImageUrl(row.gImage),
            status: 'finished',  // 标记已上传
            gImage: row.gImage   // 保留原图片地址
          }
        ];
      }

      this.drawerEdit = true;
    },


    handleDelete(index, row) {
      this.goodsItem = row;
      this.$confirm("删除商品后不可恢复, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
          .then(() => {
            const params = new URLSearchParams();
            params.append("token", this.token);
            params.append("gId", this.goodsItem.gId);

            this.axios
                .post("http://localhost:8888/goods/delete", params, {
                  headers: {"Content-Type": "application/x-www-form-urlencoded"},
                })
                .then((resp) => {
                  this.$message.success(resp.data.message || "删除成功");
                  this.getGoods();
                })
                .catch((error) => {
                  console.error(error);
                  this.$message.error("删除失败");
                });
          })
          .catch(() => {
            this.$message.info("已取消删除");
          });
    },
    submitEdit() {
      // 基础校验
      if (!this.goodsItem.gName || this.goodsItem.gPrice === null || this.goodsItem.gCount === null) {
        this.$message.error("请填写商品名称、价格和数量");
        return;
      }

      const formData = new FormData();
      formData.append("token", this.token);
      formData.append("gId", this.goodsItem.gId);
      formData.append("gName", this.goodsItem.gName);
      formData.append("gPrice", this.goodsItem.gPrice);
      formData.append("gCount", this.goodsItem.gCount);
      formData.append("gContent", this.goodsItem.gContent || "");
      formData.append("gLevel", this.goodsItem.gLevel || 0);
      formData.append("gContact", this.goodsItem.gContact || "");
      formData.append("college", this.goodsItem.college);
      formData.append("campus", this.goodsItem.campus);
      formData.append("subject", this.goodsItem.subject);
      formData.append("type", this.goodsItem.type);
      formData.append("uId", this.goodsItem.uId);

      if (this.uploadFile) {
        formData.append("gImageFile", this.uploadFile);  // 新图片
      } else if (this.fileList.length && this.fileList[0].gImage) {
        formData.append("gImage", this.fileList[0].gImage);  // 保留原图
      }

      this.axios
          .post("http://localhost:8888/goods/update", formData, {
            headers: {"Content-Type": "multipart/form-data"},
          })
          .then((resp) => {
            this.$message.success(resp.data.message || "修改成功");
            this.drawerEdit = false;
            this.getGoods();
          })
          .catch((error) => {
            console.error(error);
            this.$message.error("修改失败");
          })
          .finally(() => {
            this.goodsItem = {};
            this.uploadFile = null;
            this.fileList = [];
          });
    },


    addGoods() {
      // 重置表单和上传状态
      this.goodsItem = {
        gName: "",
        gPrice: null,
        gCount: null,
        gContent: "",
        gLevel: 4,
        gContact: "",
        college: "",
        campus: "",
        subject: "",
        type: ""
      };

      this.fileList = [];
      this.uploadFile = null;
      this.drawerAdd = true;
    },
    // el-upload 相关方法
    handleFileChange(file, fileList) {
      this.uploadFile = file.raw || null;             // 保存原始文件对象
      this.fileList = fileList.slice(-1);        // 限制只保留最后一张（最多1张）
    },
    handleRemove() {
      this.uploadFile = null;
      this.fileList = [];
    },
    handlePreview(file) {
      this.previewUrl = file.url;
      this.previewVisible = true;
    },
    submitAdd() {
      // 基础校验
      if (!this.goodsItem.gName || this.goodsItem.gPrice === null || this.goodsItem.gCount === null) {
        this.$message.error("请填写商品名称、价格和数量");
        return;
      }


      this.adding = true;

      const formData = new FormData();
      formData.append("token", this.token);
      formData.append("gName", this.goodsItem.gName);
      formData.append("gPrice", this.goodsItem.gPrice);
      formData.append("gCount", this.goodsItem.gCount);
      formData.append("gContent", this.goodsItem.gContent || "");
      formData.append("gLevel", this.goodsItem.gLevel || 4);
      formData.append("gContact", this.goodsItem.gContact);
      formData.append("college", this.goodsItem.college);
      formData.append("campus", this.goodsItem.campus);
      formData.append("subject", this.goodsItem.subject);
      formData.append("type", this.goodsItem.type);


      if (this.uploadFile) {
        formData.append("gImageFile", this.uploadFile);
      }

      this.axios
          .post("http://localhost:8888/goods/add", formData, {
            headers: {"Content-Type": "multipart/form-data"},
          })
          .then((resp) => {
            if (resp.data.code === 200 || resp.data.message.includes("成功")) {
              this.$message.success("商品发布成功！");
              this.drawerAdd = false;
              this.getGoods();
            } else {
              this.$message.error(resp.data.message || "发布失败");
            }
          })
          .catch((error) => {
            console.error(error);
            this.$message.error("上传失败，请检查网络或图片大小");
          })
          .finally(() => {
            this.adding = false;
            this.goodsItem = {};
          });
    },
    deleteIds() {
      if (this.ids.length === 0) {
        this.$message.error("请先选择要删除的商品");
        return;
      }

      this.$confirm(`确定批量删除这 ${this.ids.length} 件商品吗？`, "提示", {
        type: "warning",
      })
          .then(() => {
            const params = new URLSearchParams();
            params.append("token", this.token);
            this.ids.forEach((id) => params.append("listId", id));

            this.axios
                .post("http://localhost:8888/goods/deleteById", params, {
                  headers: {"Content-Type": "application/x-www-form-urlencoded"},
                })
                .then((resp) => {
                  this.$message.success(resp.data.message || "批量删除成功");
                  this.getGoods();
                })
                .catch((error) => {
                  console.error(error);
                  this.$message.error("批量删除失败");
                });
          })
          .catch(() => {
            this.$message.info("已取消批量删除");
          });
    },
  },
};
</script>

<style>
</style>