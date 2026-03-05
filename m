Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M76M8M6qWkd3QAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 09:11:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4E20D3C6
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 09:11:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1023EC8F26C;
	Thu,  5 Mar 2026 08:11:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90BBEC87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698304; x=1804234304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c2OeupWlyxOBHDjwK27ZWns2H39A64Z/l1mt16Tsh1o=;
 b=OzW5iJ0cMI2j9l48rWIEQ50bQbTtmmKjeVa/czO9oRTDqCKaObz9EmFk
 dp3A8EIheMlSGeNABCATK2dTwS7TGIpdldooqY4PphcIt7+HuTJhv4fqO
 hCZShvCqUt50+xcL8VV33Q4O1xD0kGFPPhjLAZm9YCE6fWnpaZIZhdxLC
 SzbweRyWBM73mKTrAGNd5wm6bkXoEuEquS7R/6mqneF3tbTwaoOjuy/iz
 2w2X/DdjVVor+F1yRa9svUvIWrSJDLSzL1ldfKPdYvKXrCMIBHu5CDLtr
 /wo+ynpclp6WNHW4eEY6N+CYwNQ+t7iL7ptj6f5qUAnXFoC0vsmq5eTIS A==;
X-CSE-ConnectionGUID: FtcH8sLCT7q5NxugeizDSg==
X-CSE-MsgGUID: nLkhAoPdS8O75+m4qMJfzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77621869"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77621869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:11:42 -0800
X-CSE-ConnectionGUID: I2lMTBllR9aUsEoqVrkuFg==
X-CSE-MsgGUID: DP7NclihStmIZM3qvKQwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216418397"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 00:11:35 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vy3nv-000000000Gq-3bdf;
 Thu, 05 Mar 2026 08:11:31 +0000
Date: Thu, 5 Mar 2026 16:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202603051549.4Mb0ZZjM-lkp@intel.com>
References: <20260303061711.895-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303061711.895-1-lizhi2@eswincomputing.com>
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com, llvm@lists.linux.dev,
 pritesh.patel@einfochips.com, Zhi Li <lizhi2@eswincomputing.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: eic7700:
 enable clocks before syscon access and correct RX sampling timing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 6AE4E20D3C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:llvm@lists.linux.dev,m:pritesh.patel@einfochips.com,m:oe-kbuild-all@lists.linux.dev,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_TO(0.00)[eswincomputing.com,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	NEURAL_SPAM(0.00)[0.761];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhi2-eswincomputing-com/dt-bindings-ethernet-eswin-add-clock-sampling-control/20260303-142311
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260303061711.895-1-lizhi2%40eswincomputing.com
patch subject: [PATCH net-next v3 2/3] net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051549.4Mb0ZZjM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051549.4Mb0ZZjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051549.4Mb0ZZjM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c:290:26: error: incompatible function pointer types assigning to 'void (*)(void *, phy_interface_t, int, unsigned int)' from 'void (void *, int, unsigned int)' [-Wincompatible-function-pointer-types]
     290 |         plat_dat->fix_mac_speed = eic7700_dwmac_fix_speed;
         |                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +290 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

   149	
   150	static int eic7700_dwmac_probe(struct platform_device *pdev)
   151	{
   152		const struct eic7700_dwmac_data *data;
   153		struct plat_stmmacenet_data *plat_dat;
   154		struct stmmac_resources stmmac_res;
   155		struct eic7700_qos_priv *dwc_priv;
   156		u32 delay_ps, val;
   157		int i, ret;
   158	
   159		ret = stmmac_get_platform_resources(pdev, &stmmac_res);
   160		if (ret)
   161			return dev_err_probe(&pdev->dev, ret,
   162					"failed to get resources\n");
   163	
   164		plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
   165		if (IS_ERR(plat_dat))
   166			return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
   167					"dt configuration failed\n");
   168	
   169		dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
   170		if (!dwc_priv)
   171			return -ENOMEM;
   172	
   173		dwc_priv->dev = &pdev->dev;
   174	
   175		data = device_get_match_data(&pdev->dev);
   176		if (!data)
   177			return dev_err_probe(&pdev->dev,
   178					     -EINVAL, "no match data found\n");
   179	
   180		dwc_priv->eth_rx_clk_inv = data->rgmii_rx_clk_invert;
   181	
   182		/* Read rx-internal-delay-ps and update rx_clk delay */
   183		if (!of_property_read_u32(pdev->dev.of_node,
   184					  "rx-internal-delay-ps", &delay_ps)) {
   185			if (delay_ps % EIC7700_DELAY_STEP_PS)
   186				return dev_err_probe(&pdev->dev, -EINVAL,
   187					"rx delay must be multiple of %dps\n",
   188					EIC7700_DELAY_STEP_PS);
   189	
   190			if (delay_ps > EIC7700_MAX_DELAY_PS)
   191				return dev_err_probe(&pdev->dev, -EINVAL,
   192					"rx delay out of range\n");
   193	
   194			val = delay_ps / EIC7700_DELAY_STEP_PS;
   195	
   196			dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
   197			dwc_priv->eth_clk_dly_param |=
   198					 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
   199		}
   200	
   201		/* Read tx-internal-delay-ps and update tx_clk delay */
   202		if (!of_property_read_u32(pdev->dev.of_node,
   203					  "tx-internal-delay-ps", &delay_ps)) {
   204			if (delay_ps % EIC7700_DELAY_STEP_PS)
   205				return dev_err_probe(&pdev->dev, -EINVAL,
   206					"tx delay must be multiple of %dps\n",
   207					EIC7700_DELAY_STEP_PS);
   208	
   209			if (delay_ps > EIC7700_MAX_DELAY_PS)
   210				return dev_err_probe(&pdev->dev, -EINVAL,
   211					"tx delay out of range\n");
   212	
   213			val = delay_ps / EIC7700_DELAY_STEP_PS;
   214	
   215			dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
   216			dwc_priv->eth_clk_dly_param |=
   217					 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
   218		}
   219	
   220		dwc_priv->eic7700_hsp_regmap =
   221				syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
   222								"eswin,hsp-sp-csr");
   223		if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
   224			return dev_err_probe(&pdev->dev,
   225					PTR_ERR(dwc_priv->eic7700_hsp_regmap),
   226					"Failed to get hsp-sp-csr regmap\n");
   227	
   228		ret = of_property_read_u32_index(pdev->dev.of_node,
   229						 "eswin,hsp-sp-csr",
   230						 1, &dwc_priv->eth_phy_ctrl_offset);
   231		if (ret)
   232			return dev_err_probe(&pdev->dev, ret,
   233					     "can't get eth_phy_ctrl_offset\n");
   234	
   235		ret = of_property_read_u32_index(pdev->dev.of_node,
   236						 "eswin,hsp-sp-csr",
   237						 2, &dwc_priv->eth_axi_lp_ctrl_offset);
   238		if (ret)
   239			return dev_err_probe(&pdev->dev, ret,
   240					     "can't get eth_axi_lp_ctrl_offset\n");
   241	
   242		ret = of_property_read_u32_index(pdev->dev.of_node,
   243						 "eswin,hsp-sp-csr",
   244						 3, &dwc_priv->eth_txd_offset);
   245		if (ret)
   246			return dev_err_probe(&pdev->dev, ret,
   247					     "can't get eth_txd_offset\n");
   248	
   249		ret = of_property_read_u32_index(pdev->dev.of_node,
   250						 "eswin,hsp-sp-csr",
   251						 4, &dwc_priv->eth_clk_offset);
   252		if (ret)
   253			return dev_err_probe(&pdev->dev, ret,
   254					     "can't get eth_clk_offset\n");
   255	
   256		ret = of_property_read_u32_index(pdev->dev.of_node,
   257						 "eswin,hsp-sp-csr",
   258						 5, &dwc_priv->eth_rxd_offset);
   259		if (ret)
   260			return dev_err_probe(&pdev->dev, ret,
   261					     "can't get eth_rxd_offset\n");
   262	
   263		plat_dat->num_clks = ARRAY_SIZE(eic7700_clk_names);
   264		plat_dat->clks = devm_kcalloc(&pdev->dev,
   265					      plat_dat->num_clks,
   266					      sizeof(*plat_dat->clks),
   267					      GFP_KERNEL);
   268		if (!plat_dat->clks)
   269			return -ENOMEM;
   270	
   271		for (i = 0; i < ARRAY_SIZE(eic7700_clk_names); i++)
   272			plat_dat->clks[i].id = eic7700_clk_names[i];
   273	
   274		ret = devm_clk_bulk_get_optional(&pdev->dev,
   275						 plat_dat->num_clks,
   276						 plat_dat->clks);
   277		if (ret)
   278			return dev_err_probe(&pdev->dev, ret,
   279					     "Failed to get clocks\n");
   280	
   281		plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
   282		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
   283		plat_dat->clks_config = eic7700_clks_config;
   284		plat_dat->bsp_priv = dwc_priv;
   285		dwc_priv->plat_dat = plat_dat;
   286		plat_dat->init = eic7700_dwmac_init;
   287		plat_dat->exit = eic7700_dwmac_exit;
   288		plat_dat->suspend = eic7700_dwmac_suspend;
   289		plat_dat->resume = eic7700_dwmac_resume;
 > 290		plat_dat->fix_mac_speed = eic7700_dwmac_fix_speed;
   291	
   292		return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
