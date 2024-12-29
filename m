Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F49FDD16
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 02:39:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F85C78032;
	Sun, 29 Dec 2024 01:39:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1926BC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2024 01:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735436385; x=1766972385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rFQfnH8g9qnvAm/orX7H7+JRj5OpvCxqGxR6Qhq2ETY=;
 b=aCpeDwtpExwyA1LSGQW89gZ1BSCJdRUPqORH6Dgs8xBXPiB5Asuo4G5F
 oJp6I2ukktW7UF7V8/ZGgikDrUTVZmeCI1h+tzprC5CSEj8h7cbnr0CMN
 xpdJhm7sEYf2La4oggowqYv6hZaCwoiIzwbSzvqlee8+TEQh47QWlHzTx
 ZJwP4o7DCzfrrnYdf61Xvuy2v9IUOb1+yUKzRgU6xDkyQjUq+J3P+ZEHX
 NiRXdsbazPF6O4hGIwSgJJz1uwUPI+2K6gtrRDr2HMIJIZHgVsQbJ09Kh
 XHsLU4pRbSmXQ2Y/3uKvVqjZaApdXDpxqp+aobQC9bBdYg0QIusLnIvIJ A==;
X-CSE-ConnectionGUID: Q+1GBx+TR/qVFo9h2YfrXQ==
X-CSE-MsgGUID: IUSqkC3NTwi5JcdYAuSMwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35802052"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; d="scan'208";a="35802052"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2024 17:39:37 -0800
X-CSE-ConnectionGUID: Oy4svG45T4qIdA2Vlwx06g==
X-CSE-MsgGUID: xNOqO8z6T+WhcD2uqXjGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100302592"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 28 Dec 2024 17:39:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tRiHA-0004QO-0J;
 Sun, 29 Dec 2024 01:39:28 +0000
Date: Sun, 29 Dec 2024 09:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mark Brown <broonie@kernel.org>
Message-ID: <202412290939.43oNt9t6-lkp@intel.com>
References: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229-update_pm_macro-v1-2-c7d4c4856336@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] mmc: sdhci-st: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

Hi Raphael,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/usb-dwc3-st-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20241229-073700
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241229-update_pm_macro-v1-2-c7d4c4856336%40gmail.com
patch subject: [PATCH 2/6] mmc: sdhci-st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: hexagon-randconfig-001-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290939.43oNt9t6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 319b89197348b7cad1215e235bdc7b5ec8f9b72c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290939.43oNt9t6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290939.43oNt9t6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-st.c:460:8: error: call to undeclared function 'sdhci_suspend_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     460 |         ret = sdhci_suspend_host(host);
         |               ^
>> drivers/mmc/host/sdhci-st.c:494:9: error: call to undeclared function 'sdhci_resume_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |         return sdhci_resume_host(host);
         |                ^
   drivers/mmc/host/sdhci-st.c:494:9: note: did you mean 'sdhci_remove_host'?
   drivers/mmc/host/sdhci.h:827:6: note: 'sdhci_remove_host' declared here
     827 | void sdhci_remove_host(struct sdhci_host *host, int dead);
         |      ^
   2 errors generated.


vim +/sdhci_suspend_host +460 drivers/mmc/host/sdhci-st.c

f52d9c4f459bda Peter Griffin 2014-07-09  449  
f52d9c4f459bda Peter Griffin 2014-07-09  450  static int sdhci_st_suspend(struct device *dev)
f52d9c4f459bda Peter Griffin 2014-07-09  451  {
f52d9c4f459bda Peter Griffin 2014-07-09  452  	struct sdhci_host *host = dev_get_drvdata(dev);
f52d9c4f459bda Peter Griffin 2014-07-09  453  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
1531675269c833 Jisheng Zhang 2016-02-16  454  	struct st_mmc_platform_data *pdata = sdhci_pltfm_priv(pltfm_host);
d38dcad4e7b48f Adrian Hunter 2017-03-20  455  	int ret;
d38dcad4e7b48f Adrian Hunter 2017-03-20  456  
d38dcad4e7b48f Adrian Hunter 2017-03-20  457  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter 2017-03-20  458  		mmc_retune_needed(host->mmc);
f52d9c4f459bda Peter Griffin 2014-07-09  459  
d38dcad4e7b48f Adrian Hunter 2017-03-20 @460  	ret = sdhci_suspend_host(host);
f52d9c4f459bda Peter Griffin 2014-07-09  461  	if (ret)
f52d9c4f459bda Peter Griffin 2014-07-09  462  		goto out;
f52d9c4f459bda Peter Griffin 2014-07-09  463  
406c24310a7bd7 Peter Griffin 2015-04-10  464  	reset_control_assert(pdata->rstc);
406c24310a7bd7 Peter Griffin 2015-04-10  465  
3ae50f4512ce83 Lee Jones     2016-09-08  466  	clk_disable_unprepare(pdata->icnclk);
f52d9c4f459bda Peter Griffin 2014-07-09  467  	clk_disable_unprepare(pltfm_host->clk);
f52d9c4f459bda Peter Griffin 2014-07-09  468  out:
f52d9c4f459bda Peter Griffin 2014-07-09  469  	return ret;
f52d9c4f459bda Peter Griffin 2014-07-09  470  }
f52d9c4f459bda Peter Griffin 2014-07-09  471  
f52d9c4f459bda Peter Griffin 2014-07-09  472  static int sdhci_st_resume(struct device *dev)
f52d9c4f459bda Peter Griffin 2014-07-09  473  {
f52d9c4f459bda Peter Griffin 2014-07-09  474  	struct sdhci_host *host = dev_get_drvdata(dev);
f52d9c4f459bda Peter Griffin 2014-07-09  475  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
1531675269c833 Jisheng Zhang 2016-02-16  476  	struct st_mmc_platform_data *pdata = sdhci_pltfm_priv(pltfm_host);
2053812f6e1af0 Peter Griffin 2015-04-10  477  	struct device_node *np = dev->of_node;
7f55eb101d4a75 Arvind Yadav  2017-06-20  478  	int ret;
f52d9c4f459bda Peter Griffin 2014-07-09  479  
7f55eb101d4a75 Arvind Yadav  2017-06-20  480  	ret = clk_prepare_enable(pltfm_host->clk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  481  	if (ret)
7f55eb101d4a75 Arvind Yadav  2017-06-20  482  		return ret;
7f55eb101d4a75 Arvind Yadav  2017-06-20  483  
7f55eb101d4a75 Arvind Yadav  2017-06-20  484  	ret = clk_prepare_enable(pdata->icnclk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  485  	if (ret) {
7f55eb101d4a75 Arvind Yadav  2017-06-20  486  		clk_disable_unprepare(pltfm_host->clk);
7f55eb101d4a75 Arvind Yadav  2017-06-20  487  		return ret;
7f55eb101d4a75 Arvind Yadav  2017-06-20  488  	}
f52d9c4f459bda Peter Griffin 2014-07-09  489  
406c24310a7bd7 Peter Griffin 2015-04-10  490  	reset_control_deassert(pdata->rstc);
406c24310a7bd7 Peter Griffin 2015-04-10  491  
2053812f6e1af0 Peter Griffin 2015-04-10  492  	st_mmcss_cconfig(np, host);
2053812f6e1af0 Peter Griffin 2015-04-10  493  
f52d9c4f459bda Peter Griffin 2014-07-09 @494  	return sdhci_resume_host(host);
f52d9c4f459bda Peter Griffin 2014-07-09  495  }
f52d9c4f459bda Peter Griffin 2014-07-09  496  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
