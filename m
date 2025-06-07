Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20259AD0CF0
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Jun 2025 13:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9A00C36B29;
	Sat,  7 Jun 2025 11:01:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51568C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749294107; x=1780830107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oXRpziViexH8/fIeHAWT0i0ImnFtdOkJs/7hpOj+v+k=;
 b=kkGQuFOZakGLgTvi+DZV2UravKf7+01lGiVI/KFYQ+amWlxMWMz+x9Jr
 bzmcQM7WmhjfVElBC4+s2zOrws6N8DsgsfZ13DTuBVfSqeyiD0S7fsrvH
 zoscguA08k5+bo6Fl9FrXz2o7kwPvyDmrpz4PRPtTQJ0pHSVLZq3mUhE7
 5UiRpCsQ/Yjln/rf34PXOwYcrAXu3IoSmhVbdTeYCFRb57EMSyDJrW1yv
 U0KaKQmX1hp7PZQjnc8ragRVIklrRfLCTxKioBbkJibm5AKIVLDvpIoZt
 QTSw3kL+oJ0topHhcYCQBvy6QxVR41A4A7t/tiPAln7LQlsBW/T9ciXx1 g==;
X-CSE-ConnectionGUID: yynQvsIxTZSYguz9Dqgokg==
X-CSE-MsgGUID: cigXyvGSRZW4sfWIF0/HcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54062164"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; d="scan'208";a="54062164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2025 04:01:45 -0700
X-CSE-ConnectionGUID: GadTKGbxQgOwAieMHe6U0A==
X-CSE-MsgGUID: 9PPzAVzYRGWL7j+VBDs/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; d="scan'208";a="176950060"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2025 04:01:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNrIw-0005k1-1j;
 Sat, 07 Jun 2025 11:01:38 +0000
Date: Sat, 7 Jun 2025 19:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org,
 manivannan.sadhasivam@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
 quic_schintav@quicinc.com, shradha.t@samsung.com, cassel@kernel.org,
 thippeswamy.havalige@amd.com
Message-ID: <202506071838.C54p5js2-lkp@intel.com>
References: <20250606120403.2964857-5-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606120403.2964857-5-christian.bruel@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 4/9] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 911483b25612c8bc32a706ba940738cc43299496]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-PCI-Add-STM32MP25-PCIe-Root-Complex-bindings/20250606-201204
base:   911483b25612c8bc32a706ba940738cc43299496
patch link:    https://lore.kernel.org/r/20250606120403.2964857-5-christian.bruel%40foss.st.com
patch subject: [PATCH v11 4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250607/202506071838.C54p5js2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071838.C54p5js2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071838.C54p5js2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-stm32-ep.c: In function 'stm32_pcie_probe':
>> drivers/pci/controller/dwc/pcie-stm32-ep.c:339:79: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     339 |                 return dev_err_probe(dev, ret, "Failed to request PERST IRQ: %d\n");
         |                                                                              ~^
         |                                                                               |
         |                                                                               int


vim +339 drivers/pci/controller/dwc/pcie-stm32-ep.c

   275	
   276	static int stm32_pcie_probe(struct platform_device *pdev)
   277	{
   278		struct stm32_pcie *stm32_pcie;
   279		struct device *dev = &pdev->dev;
   280		int ret;
   281	
   282		stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
   283		if (!stm32_pcie)
   284			return -ENOMEM;
   285	
   286		stm32_pcie->pci.dev = dev;
   287		stm32_pcie->pci.ops = &dw_pcie_ops;
   288	
   289		stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
   290		if (IS_ERR(stm32_pcie->regmap))
   291			return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
   292					     "No syscfg specified\n");
   293	
   294		stm32_pcie->phy = devm_phy_get(dev, NULL);
   295		if (IS_ERR(stm32_pcie->phy))
   296			return dev_err_probe(dev, PTR_ERR(stm32_pcie->phy),
   297					     "failed to get pcie-phy\n");
   298	
   299		stm32_pcie->clk = devm_clk_get(dev, NULL);
   300		if (IS_ERR(stm32_pcie->clk))
   301			return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
   302					     "Failed to get PCIe clock source\n");
   303	
   304		stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
   305		if (IS_ERR(stm32_pcie->rst))
   306			return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
   307					     "Failed to get PCIe reset\n");
   308	
   309		stm32_pcie->perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
   310		if (IS_ERR(stm32_pcie->perst_gpio))
   311			return dev_err_probe(dev, PTR_ERR(stm32_pcie->perst_gpio),
   312					     "Failed to get reset GPIO\n");
   313	
   314		ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
   315		if (ret)
   316			return ret;
   317	
   318		platform_set_drvdata(pdev, stm32_pcie);
   319	
   320		pm_runtime_get_noresume(dev);
   321	
   322		ret = devm_pm_runtime_enable(dev);
   323		if (ret < 0) {
   324			pm_runtime_put_noidle(&pdev->dev);
   325			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
   326		}
   327	
   328		stm32_pcie->perst_irq = gpiod_to_irq(stm32_pcie->perst_gpio);
   329	
   330		/* Will be enabled in start_link when device is initialized. */
   331		irq_set_status_flags(stm32_pcie->perst_irq, IRQ_NOAUTOEN);
   332	
   333		ret = devm_request_threaded_irq(dev, stm32_pcie->perst_irq, NULL,
   334						stm32_pcie_ep_perst_irq_thread,
   335						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
   336						"perst_irq", stm32_pcie);
   337		if (ret) {
   338			pm_runtime_put_noidle(&pdev->dev);
 > 339			return dev_err_probe(dev, ret, "Failed to request PERST IRQ: %d\n");
   340		}
   341	
   342		ret = stm32_add_pcie_ep(stm32_pcie, pdev);
   343		if (ret)
   344			pm_runtime_put_noidle(&pdev->dev);
   345	
   346		return ret;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
