Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9E96BB43
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 13:51:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FDA1C78011;
	Wed,  4 Sep 2024 11:51:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4610C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725450682; x=1756986682;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mhvDv83fUvlG0cQcDPPbM7mplZGVm4T7Ax6vDiwUhj4=;
 b=fw1G3TRr3aCwRQnR/UTANx9vjc4VZsaG3vi6ge8o5gR0vMRCQKqJgYzm
 JxVlCkjXgm4OQsiU7sVEjky/61xqLX8Exfj+4OA5x03wwZH2WU5PTt2kn
 A3XUTESvD9hZeOnnC5kayzE9pSJRAY3Nd25hKYXyCoPUeFDBsJp5QcOwG
 ENxI65TB0iQh6J2Wc1wWyTo184jz6ZCQy8MzqFiAMRBjLyrqfPLM6h6wm
 ozkVWdL8brHBC4RLNQ0z6LsVq11kp51hSytsHCfZSP8B3yDIR74fZ6yid
 XTtpU3KteVz9Ly/K9yf3xA6ajV7SbFlzCVJJktCkRtFGkGLgc7Y9lQ0gG g==;
X-CSE-ConnectionGUID: 5dsUu14/TTafljjh20mqLg==
X-CSE-MsgGUID: /3Tv5sVuRP6iJNnH4ld5fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35466291"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35466291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 04:51:14 -0700
X-CSE-ConnectionGUID: 18+KqW5IQcqJSNRThSKdLw==
X-CSE-MsgGUID: CpGFRzsKQFyyGQGoWy5zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95976479"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 04 Sep 2024 04:51:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sloXU-0007vj-2R;
 Wed, 04 Sep 2024 11:51:08 +0000
Date: Wed, 4 Sep 2024 19:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de
Message-ID: <202409041913.v0xzfcJ2-lkp@intel.com>
References: <20240903121303.2953150-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903121303.2953150-3-christian.bruel@foss.st.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/5] phy: stm32: Add support for
	STM32MP25 COMBOPHY.
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

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc6 next-20240904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-phy-Add-STM32MP25-COMBOPHY-bindings/20240903-201737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20240903121303.2953150-3-christian.bruel%40foss.st.com
patch subject: [PATCH v5 2/5] phy: stm32: Add support for STM32MP25 COMBOPHY.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409041913.v0xzfcJ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041913.v0xzfcJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041913.v0xzfcJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/st/phy-stm32-combophy.c:524:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     524 |                 return ret;
         |                        ^~~
   drivers/phy/st/phy-stm32-combophy.c:509:9: note: initialize the variable 'ret' to silence this warning
     509 |         int ret, irq;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +524 drivers/phy/st/phy-stm32-combophy.c

   503	
   504	static int stm32_combophy_probe(struct platform_device *pdev)
   505	{
   506		struct stm32_combophy *combophy;
   507		struct device *dev = &pdev->dev;
   508		struct phy_provider *phy_provider;
   509		int ret, irq;
   510	
   511		combophy = devm_kzalloc(dev, sizeof(*combophy), GFP_KERNEL);
   512		if (!combophy)
   513			return -ENOMEM;
   514	
   515		combophy->dev = dev;
   516	
   517		dev_set_drvdata(dev, combophy);
   518	
   519		combophy->base = devm_platform_ioremap_resource(pdev, 0);
   520		if (IS_ERR(combophy->base))
   521			return PTR_ERR(combophy->base);
   522	
   523		if (stm32_combophy_get_clocks(combophy))
 > 524			return ret;
   525	
   526		combophy->phy_reset = devm_reset_control_get(dev, "phy");
   527		if (IS_ERR(combophy->phy_reset))
   528			return dev_err_probe(dev, PTR_ERR(combophy->phy_reset),
   529					     "Failed to get PHY reset\n");
   530	
   531		combophy->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
   532		if (IS_ERR(combophy->regmap))
   533			return dev_err_probe(dev, PTR_ERR(combophy->regmap),
   534					     "No syscfg specified\n");
   535	
   536		combophy->phy = devm_phy_create(dev, NULL, &stm32_combophy_phy_data);
   537		if (IS_ERR(combophy->phy))
   538			return dev_err_probe(dev, PTR_ERR(combophy->phy),
   539					     "failed to create PCIe/USB3 ComboPHY\n");
   540	
   541		if (device_property_read_bool(dev, "wakeup-source")) {
   542			irq = platform_get_irq(pdev, 0);
   543			if (irq < 0)
   544				return dev_err_probe(dev, irq, "failed to get IRQ\n");
   545			combophy->irq_wakeup = irq;
   546	
   547			ret = devm_request_threaded_irq(dev, combophy->irq_wakeup, NULL,
   548							stm32_combophy_irq_wakeup_handler, IRQF_ONESHOT,
   549							NULL, NULL);
   550			if (ret)
   551				return dev_err_probe(dev, ret, "unable to request wake IRQ %d\n",
   552							 combophy->irq_wakeup);
   553		}
   554	
   555		ret = devm_pm_runtime_enable(dev);
   556		if (ret)
   557			return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
   558	
   559		phy_set_drvdata(combophy->phy, combophy);
   560	
   561		phy_provider = devm_of_phy_provider_register(dev, stm32_combophy_xlate);
   562	
   563		return PTR_ERR_OR_ZERO(phy_provider);
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
