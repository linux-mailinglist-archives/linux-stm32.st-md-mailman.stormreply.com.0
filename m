Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F89E8A5D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 05:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1845C78021;
	Mon,  9 Dec 2024 04:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB987C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 04:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733718935; x=1765254935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/byX0QN7l6evzZM3VWd51MOOZPsopsId3NhdI4oXh+w=;
 b=FBQMrgcSVhr5orgAWDHxLgji8T8hKXcoXgPpBgPkMjonwOaK+BfqhJBL
 IWwItLpYihLbKhvk3hdZqA0I1LieIpckDSy5Z4J75D1jNcp/UUhdh3Amv
 4/UGA7ZmDOR2rxBWIGWborGaWfB5LIc0oiuR41s/OZmmypaGWWWjnNc7K
 huhzf5sqz5Ka9j2v3qLF1n8BblUGTkIBX7qaVbejqHdNTQx0czAOgXNGU
 7r4WDOlUQF1wYSGZhJgRAt8S9qHTen89tf3Dhs7KYpR7IOvuuBXNNb85S
 BIpol2ptyHKy2dF7KvgWC+lWtbHaD3SMLImBYIB16koDwJ5zFASKmwF9U Q==;
X-CSE-ConnectionGUID: 25Itq5IHR3mkw8J1RvNqRQ==
X-CSE-MsgGUID: gO9VyktATKKvZ6lSE6U4Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34237108"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="34237108"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2024 20:35:27 -0800
X-CSE-ConnectionGUID: +CUXQ3szQaSyFv/p6es35w==
X-CSE-MsgGUID: /NYIfnVgRFyE8+IfO0CAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="125844583"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:35:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tKVUO-0003sb-08;
 Mon, 09 Dec 2024 04:35:20 +0000
Date: Mon, 9 Dec 2024 12:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, lpieralisi@kernel.org,
 kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 p.zabel@pengutronix.de, cassel@kernel.org,
 quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com
Message-ID: <202412080849.1SXhxzpi-lkp@intel.com>
References: <20241126155119.1574564-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-3-christian.bruel@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] PCI: stm32: Add PCIe host support
	for STM32MP25
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-PCI-Add-STM32MP25-PCIe-root-complex-bindings/20241128-101958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241126155119.1574564-3-christian.bruel%40foss.st.com
patch subject: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
config: openrisc-randconfig-r072-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080849.1SXhxzpi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080849.1SXhxzpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080849.1SXhxzpi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_suspend_noirq':
>> drivers/pci/controller/dwc/pcie-stm32.c:101:16: error: implicit declaration of function 'pinctrl_pm_select_sleep_state' [-Wimplicit-function-declaration]
     101 |         return pinctrl_pm_select_sleep_state(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_resume_noirq':
>> drivers/pci/controller/dwc/pcie-stm32.c:114:24: error: 'struct device' has no member named 'pins'
     114 |         if (!IS_ERR(dev->pins->init_state))
         |                        ^~
>> drivers/pci/controller/dwc/pcie-stm32.c:115:23: error: implicit declaration of function 'pinctrl_select_state' [-Wimplicit-function-declaration]
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c:115:47: error: 'struct device' has no member named 'pins'
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                                               ^~
   drivers/pci/controller/dwc/pcie-stm32.c:115:61: error: 'struct device' has no member named 'pins'
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                                                             ^~
>> drivers/pci/controller/dwc/pcie-stm32.c:117:23: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Wimplicit-function-declaration]
     117 |                 ret = pinctrl_pm_select_default_state(dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_probe':
   drivers/pci/controller/dwc/pcie-stm32.c:243:29: warning: unused variable 'np' [-Wunused-variable]
     243 |         struct device_node *np = pdev->dev.of_node;
         |                             ^~


vim +/pinctrl_pm_select_sleep_state +101 drivers/pci/controller/dwc/pcie-stm32.c

    88	
    89	static int stm32_pcie_suspend_noirq(struct device *dev)
    90	{
    91		struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
    92	
    93		stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
    94	
    95		stm32_pcie_stop_link(stm32_pcie->pci);
    96		clk_disable_unprepare(stm32_pcie->clk);
    97	
    98		if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
    99			phy_exit(stm32_pcie->phy);
   100	
 > 101		return pinctrl_pm_select_sleep_state(dev);
   102	}
   103	
   104	static int stm32_pcie_resume_noirq(struct device *dev)
   105	{
   106		struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
   107		struct dw_pcie *pci = stm32_pcie->pci;
   108		struct dw_pcie_rp *pp = &pci->pp;
   109		int ret;
   110	
   111		/* init_state must be called first to force clk_req# gpio when no
   112		 * device is plugged.
   113		 */
 > 114		if (!IS_ERR(dev->pins->init_state))
 > 115			ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
   116		else
 > 117			ret = pinctrl_pm_select_default_state(dev);
   118	
   119		if (ret) {
   120			dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
   121			return ret;
   122		}
   123	
   124		if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
   125			ret = phy_init(stm32_pcie->phy);
   126			if (ret) {
   127				pinctrl_pm_select_default_state(dev);
   128				return ret;
   129			}
   130		}
   131	
   132		ret = clk_prepare_enable(stm32_pcie->clk);
   133		if (ret)
   134			goto clk_err;
   135	
   136		ret = dw_pcie_setup_rc(pp);
   137		if (ret)
   138			goto pcie_err;
   139	
   140		if (stm32_pcie->link_is_up) {
   141			ret = stm32_pcie_start_link(stm32_pcie->pci);
   142			if (ret)
   143				goto pcie_err;
   144	
   145			/* Ignore errors, the link may come up later */
   146			dw_pcie_wait_for_link(stm32_pcie->pci);
   147		}
   148	
   149		pinctrl_pm_select_default_state(dev);
   150	
   151		return 0;
   152	
   153	pcie_err:
   154		dw_pcie_host_deinit(pp);
   155		clk_disable_unprepare(stm32_pcie->clk);
   156	clk_err:
   157		phy_exit(stm32_pcie->phy);
   158		pinctrl_pm_select_default_state(dev);
   159	
   160		return ret;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
