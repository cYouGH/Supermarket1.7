package cn.dc.supermarket.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.entity.ProductCategory;
import cn.dc.supermarket.service.ProductCategoryService;
import cn.dc.supermarket.service.ProductService;
import cn.dc.supermarket.utils.QueryPage;

public class ProductAction extends ActionSupport implements ModelDriven<Product> {

	/**
	 * 作者：丁川
	 */

	private ProductService productService;
	private ProductCategoryService productCategoryService;
	private Product product = new Product();
	private int page = 1;
	private String idArr;
	private File upload;
	private String uploadFileName;
	private String uploadFilePath;
	private String uploadContentType;

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setProductCategoryService(ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String findAllByPage() {
		int limit = 8;
		QueryPage<Product> qp = productService.findAllByPage(page, limit);
		ActionContext.getContext().getSession().put("productPageBean", qp);
		return "listPage";
	}

	public String add() throws IOException {

		if (upload != null) {
			// 将商品图片上传到服务器上.
			// 获得上传图片的服务器端路径.
			String storagePath = ServletActionContext.getServletContext().getRealPath("/uploadImages");
			// 创建文件类型对象:
			File diskFile = new File(storagePath + "//" + uploadFileName);
			System.out.println(storagePath);
			// 文件上传:
			FileUtils.copyFile(upload, diskFile);
			// 设置商品图片路径
			product.setImgPath("uploadImages/" + uploadFileName);
		}
		// 设置进货时间
		product.setInTime(new Date());
		productService.add(product);
		return "addSuccess";
	}

	public String addPage() {
		List<ProductCategory> pcList = productCategoryService.findAll();
		ActionContext.getContext().getValueStack().set("pcList", pcList);
		return "addPage";
	}

	public String delete() {
		Product productDel = productService.findById(product.getPid());
		//删除图片
		deleteImage(productDel);
		productService.delete(productDel);
		return "deleteSuccess";
	}

	private void deleteImage(Product productDel) {
		String filePath = ServletActionContext.getServletContext().getRealPath("/" + productDel.getImgPath());
		File fileDel = new File(filePath);
		fileDel.delete();
	}

	public String deleteChecked() {

		String[] chkboxArr = idArr.split(",");

		for (int i = 0; i < chkboxArr.length; i++) {
			int deleteId = Integer.parseInt(chkboxArr[i].trim());
			Product productDel = productService.findById(deleteId);
			deleteImage(productDel);
			productService.delete(productDel);
		}
		return "deleteSuccess";
	}

	public String update() {
		if (upload != null) {
			// 将商品图片上传到服务器上.
			// 获得上传图片的服务器端路径.
			String path = ServletActionContext.getServletContext().getRealPath("/uploadImages");
			// 创建文件类型对象:
			File diskFile = new File(path + "//" + uploadFileName);
			System.out.println(path);
			// 文件上传:
			try {
				FileUtils.copyFile(upload, diskFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			product.setImgPath("uploadImages/" + uploadFileName);
		} else {
			product.setImgPath(uploadFilePath);
		}
		productService.update(product);
		return "updateSuccess";
	}

	public String findById() {
		product = productService.findById(product.getPid());
		if (product == null) {
			return "listPage";
		}
		return "findSuccess";
	}

	// *****************纯页面跳转*****************
	public String sellIndex() {

		return "sellIndex";
	}

	public String sellPage() {
		if (product.getPid() != null) {
			product = productService.findById(product.getPid());
		}
		return "sellPage";
	}

	public String updatePage() {
		product = productService.findById(product.getPid());
		List<ProductCategory> list = productCategoryService.findAll();
		ActionContext.getContext().getValueStack().set("pcList", list);
		return "updatePage";
	}

	public void setIdArr(String idArr) {
		this.idArr = idArr;
	}

	@Override
	public Product getModel() {
		return this.product;
	}

}
