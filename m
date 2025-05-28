Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5CAC7110
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 20:38:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBBC4C36B3C;
	Wed, 28 May 2025 18:38:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E2DBC36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748457527; x=1779993527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vn+l1DcNxMcoVSXL76f6dSgWCLSq/i+dJade3bSRVhs=;
 b=UbqnZaVYiYF5PmQ1wFkbGm5i+bFLFiEr8mN3Brr3TBG1oKdj6D2i3/Wg
 PYIBYvaywErkHIkPTAEMEpgR61IiScLDIsWRRNqkvr1TRE97rZwh8n/QN
 B/L7vWrw3Cvg1YqZyBh+ukfQ/Igjqc0z9HDqRMIFVGXG1OIVVwnVq8Yxf
 mqCF5UhgPA2c4F623oAPBoTmMuktV6eQKhRQCSmJ1h07Jk4mWj8qswwQy
 UAp/HIAh9RqHGDmazaQXxSaKwhLPGIPwvKVudf30oPxMwyvezbdolKId3
 06X2nkRIWp9V36g9EaDiuHyXMfY3g6xSUNAvCFtsokRuDM8yMg57XfmU2 Q==;
X-CSE-ConnectionGUID: PoBtZEgiTWqOhwAgMlKufw==
X-CSE-MsgGUID: NzpZifaRRxyG6xB18zRjDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38124537"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="38124537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 11:38:45 -0700
X-CSE-ConnectionGUID: Wo7OZEVJQ0m05nyK9tmk7A==
X-CSE-MsgGUID: vUbiPWboRQ+rWcII18U+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143317327"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 11:38:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKLfg-000VyW-1O;
 Wed, 28 May 2025 18:38:36 +0000
Date: Thu, 29 May 2025 02:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
 0x1207@gmail.com, boon.khai.ng@altera.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <202505290202.daQ8Q8Xq-lkp@intel.com>
References: <20250528041634.912-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528041634.912-1-weishangjuan@eswincomputing.com>
Cc: Shangjuan Wei <weishangjuan@eswincomputing.com>, linmin@eswincomputing.com,
 ningyu@eswincomputing.com, llvm@lists.linux.dev, lizhi2@eswincomputing.com,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v2_2/2=5D_ethernet=3A=A0esw?=
 =?iso-8859-1?q?in=3A=A0Add=A0eic7700=A0ethernet=A0driver?=
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.15 next-=
20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/weishangjuan-eswinco=
mputing-com/dt-bindings-ethernet-eswin-Document-for-EIC7700-SoC/20250528-12=
1947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20250528041634.912-1-weishangjuan%=
40eswincomputing.com
patch subject: [PATCH v2 2/2] ethernet:=A0eswin:=A0Add=A0eic7700=A0ethernet=
=A0driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/202505=
29/202505290202.daQ8Q8Xq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0e=
f89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250529/202505290202.daQ8Q8Xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290202.daQ8Q8Xq-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:210:6: warning: unus=
ed variable 'err' [-Wunused-variable]
     210 |         int err;
         |             ^~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:369:6: warning: vari=
able 'ret' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
     369 |         if (data->probe)
         |             ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:371:6: note: uniniti=
alized use occurs here
     371 |         if (ret < 0) {
         |             ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:369:2: note: remove =
the 'if' if its condition is always true
     369 |         if (data->probe)
         |         ^~~~~~~~~~~~~~~~
     370 |                 ret =3D data->probe(pdev, plat_dat, &stmmac_res);
   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:343:9: note: initial=
ize the variable 'ret' to silence this warning
     343 |         int ret;
         |                ^
         |                 =3D 0
   drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:153:12: warning: unu=
sed function 'dwc_qos_probe' [-Wunused-function]
     153 | static int dwc_qos_probe(struct platform_device *pdev,
         |            ^~~~~~~~~~~~~
   3 warnings generated.


vim +/err +210 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

   196	=

   197	static int eswin_qos_probe(struct platform_device *pdev,
   198				   struct plat_stmmacenet_data *plat_dat,
   199				   struct stmmac_resources *stmmac_res)
   200	{
   201		struct eswin_qos_priv *dwc_priv;
   202		u32 hsp_aclk_ctrl_offset;
   203		u32 hsp_aclk_ctrl_regset;
   204		u32 hsp_cfg_ctrl_offset;
   205		u32 eth_axi_lp_ctrl_offset;
   206		u32 eth_phy_ctrl_offset;
   207		u32 eth_phy_ctrl_regset;
   208		struct clk *clk_app;
   209		int ret;
 > 210		int err;
   211	=

   212		dwc_priv =3D devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL=
);
   213		if (!dwc_priv)
   214			return -ENOMEM;
   215	=

   216		if (device_property_read_u32(&pdev->dev, "id", &dwc_priv->dev_id))
   217			return dev_err_probe(&pdev->dev, -EINVAL,
   218					"Can not read device id!\n");
   219	=

   220		dwc_priv->dev =3D &pdev->dev;
   221	=

   222		ret =3D of_property_read_u32_index(pdev->dev.of_node, "eswin,phyadd=
r", 0,
   223						 &dwc_priv->phyaddr);
   224		if (ret)
   225			dev_warn(&pdev->dev, "can't get phyaddr (%d)\n", ret);
   226	=

   227		ret =3D of_property_read_variable_u32_array(pdev->dev.of_node, "esw=
in,dly_hsp_reg",
   228							  &dwc_priv->dly_hsp_reg[0], 3, 0);
   229		if (ret !=3D 3) {
   230			dev_err(&pdev->dev, "can't get delay hsp reg.ret(%d)\n", ret);
   231			return ret;
   232		}
   233	=

   234		ret =3D of_property_read_variable_u32_array(pdev->dev.of_node, "dly=
-param-1000m",
   235							  &dwc_priv->dly_param_1000m[0], 3, 0);
   236		if (ret !=3D 3) {
   237			dev_err(&pdev->dev, "can't get delay param for 1Gbps mode (%d)\n",=
 ret);
   238			return ret;
   239		}
   240	=

   241		ret =3D of_property_read_variable_u32_array(pdev->dev.of_node, "dly=
-param-100m",
   242							  &dwc_priv->dly_param_100m[0], 3, 0);
   243		if (ret !=3D 3) {
   244			dev_err(&pdev->dev, "can't get delay param for 100Mbps mode (%d)\n=
", ret);
   245			return ret;
   246		}
   247	=

   248		ret =3D of_property_read_variable_u32_array(pdev->dev.of_node, "dly=
-param-10m",
   249							  &dwc_priv->dly_param_10m[0], 3, 0);
   250		if (ret !=3D 3) {
   251			dev_err(&pdev->dev, "can't get delay param for 10Mbps mode (%d)\n"=
, ret);
   252			return ret;
   253		}
   254	=

   255		dwc_priv->crg_regmap =3D syscon_regmap_lookup_by_phandle(pdev->dev.=
of_node,
   256								       "eswin,syscrg_csr");
   257		if (IS_ERR(dwc_priv->crg_regmap)) {
   258			dev_dbg(&pdev->dev, "No syscrg_csr phandle specified\n");
   259			return 0;
   260		}
   261	=

   262		ret =3D of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg=
_csr", 1,
   263						 &hsp_aclk_ctrl_offset);
   264		if (ret)
   265			return dev_err_probe(&pdev->dev, ret, "can't get syscrg_csr 1\n");
   266	=

   267		regmap_read(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, &hsp_aclk_c=
trl_regset);
   268		hsp_aclk_ctrl_regset |=3D (HSP_ACLK_CLKEN | HSP_ACLK_DIVSOR);
   269		regmap_write(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, hsp_aclk_c=
trl_regset);
   270	=

   271		ret =3D of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg=
_csr", 2,
   272						 &hsp_cfg_ctrl_offset);
   273		if (ret)
   274			return dev_err_probe(&pdev->dev, ret, "can't get syscrg_csr 2\n");
   275	=

   276		regmap_write(dwc_priv->crg_regmap, hsp_cfg_ctrl_offset, HSP_CFG_CTR=
L_REGSET);
   277	=

   278		dwc_priv->hsp_regmap =3D syscon_regmap_lookup_by_phandle(pdev->dev.=
of_node,
   279								       "eswin,hsp_sp_csr");
   280		if (IS_ERR(dwc_priv->hsp_regmap)) {
   281			dev_dbg(&pdev->dev, "No hsp_sp_csr phandle specified\n");
   282			return 0;
   283		}
   284	=

   285		ret =3D of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp=
_csr", 2,
   286						 &eth_phy_ctrl_offset);
   287		if (ret)
   288			return dev_err_probe(&pdev->dev, ret, "can't get hsp_sp_csr 2\n");
   289	=

   290		regmap_read(dwc_priv->hsp_regmap,
   291			    eth_phy_ctrl_offset,
   292			    &eth_phy_ctrl_regset);
   293		eth_phy_ctrl_regset |=3D (ETH_TX_CLK_SEL | ETH_PHY_INTF_SELI);
   294		regmap_write(dwc_priv->hsp_regmap,
   295			     eth_phy_ctrl_offset,
   296			     eth_phy_ctrl_regset);
   297	=

   298		ret =3D of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp=
_csr", 3,
   299						 &eth_axi_lp_ctrl_offset);
   300		if (ret)
   301			return dev_err_probe(&pdev->dev, ret,
   302					"can't get hsp_sp_csr 3\n");
   303	=

   304		regmap_write(dwc_priv->hsp_regmap,
   305			     eth_axi_lp_ctrl_offset,
   306			     ETH_CSYSREQ_VAL);
   307	=

   308		clk_app =3D devm_clk_get_enabled(&pdev->dev, "app");
   309		if (IS_ERR(clk_app))
   310			return dev_err_probe(&pdev->dev, PTR_ERR(clk_app),
   311					"error getting app clock\n");
   312	=

   313		plat_dat->clk_tx_i =3D devm_clk_get_enabled(&pdev->dev, "tx");
   314		if (IS_ERR(plat_dat->clk_tx_i))
   315			return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
   316					"error getting tx clock\n");
   317	=

   318		plat_dat->fix_mac_speed =3D eswin_qos_fix_speed;
   319		plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
   320		plat_dat->bsp_priv =3D dwc_priv;
   321		plat_dat->phy_addr =3D PHY_ADDR;
   322	=

   323		return 0;
   324	}
   325	=

   326	struct dwc_eth_dwmac_data {
   327		int (*probe)(struct platform_device *pdev,
   328			     struct plat_stmmacenet_data *plat_dat,
   329			     struct stmmac_resources *res);
   330		const char *stmmac_clk_name;
   331	};
   332	=

   333	static const struct dwc_eth_dwmac_data eswin_qos_data =3D {
   334		.probe =3D eswin_qos_probe,
   335		.stmmac_clk_name =3D "stmmaceth",
   336	};
   337	=

   338	static int dwc_eth_dwmac_probe(struct platform_device *pdev)
   339	{
   340		const struct dwc_eth_dwmac_data *data;
   341		struct plat_stmmacenet_data *plat_dat;
   342		struct stmmac_resources stmmac_res;
   343		int ret;
   344	=

   345		data =3D device_get_match_data(&pdev->dev);
   346	=

   347		memset(&stmmac_res, 0, sizeof(struct stmmac_resources));
   348	=

   349		/**
   350		 * Since stmmac_platform supports name IRQ only, basic platform
   351		 * resource initialization is done in the glue logic.
   352		 */
   353		stmmac_res.irq =3D platform_get_irq(pdev, 0);
   354		if (stmmac_res.irq < 0)
   355			return stmmac_res.irq;
   356		stmmac_res.wol_irq =3D stmmac_res.irq;
   357	=

   358		stmmac_res.addr =3D devm_platform_ioremap_resource(pdev, 0);
   359		if (IS_ERR(stmmac_res.addr))
   360			return PTR_ERR(stmmac_res.addr);
   361	=

   362		plat_dat =3D devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
   363		if (IS_ERR(plat_dat))
   364			return PTR_ERR(plat_dat);
   365	=

   366		plat_dat->stmmac_clk =3D dwc_eth_find_clk(plat_dat,
   367							data->stmmac_clk_name);
   368	=

 > 369		if (data->probe)
   370			ret =3D data->probe(pdev, plat_dat, &stmmac_res);
   371		if (ret < 0) {
   372			return dev_err_probe(&pdev->dev, ret,
   373					"failed to probe subdriver\n");
   374		}
   375	=

   376		ret =3D dwc_eth_dwmac_config_dt(pdev, plat_dat);
   377		if (ret)
   378			return dev_err_probe(&pdev->dev, ret,
   379					"Failed to config dt\n");
   380	=

   381		ret =3D stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
   382		if (ret)
   383			return dev_err_probe(&pdev->dev, ret,
   384					"Failed to driver probe\n");
   385	=

   386		return ret;
   387	}
   388	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
