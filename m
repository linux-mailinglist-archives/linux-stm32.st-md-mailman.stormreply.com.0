Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 190899FDD0E
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 02:28:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE1FC78030;
	Sun, 29 Dec 2024 01:28:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B105AC7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2024 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735435723; x=1766971723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I7rXsmUoa6ixHAofeE9KHj410C9nn2O2m/lr/aX7Ty4=;
 b=n0D2qs7GIyAnYJJjWHfGoBna+CguhzdVrsTkx8joUG34GKDBfYzt6V9i
 +f1VvF+dXxjuafGBw+RRwL3adqEm3f381ck/Rg9AhBFp2A9zJJGdGVGUK
 +G3/P7FpMmerQL8yXpOtSV9UGmFKIf1OtGekTq7ifd6bFXEM2ohx/U/Ra
 98AUSJwDP/5aQUNwYP97Gte0IgmPfdIR8DQXNNdLR4wzONIDZiNvAk3vR
 WITzI4zy9qF9w2rkg7WsFC8s65ToUSK6a5pGoDi4t82qg74jEsKiATM/A
 mWvtwptkaAv1DN7tSlxR1QF7l0Zd+y75bwRKYKduB70Z8Bq9oNBb4lF/f A==;
X-CSE-ConnectionGUID: tLgq9fftTXKxxPus2rTsXw==
X-CSE-MsgGUID: h+1x+6M+QF2pXsi0HO9clA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="58237967"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; d="scan'208";a="58237967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2024 17:28:35 -0800
X-CSE-ConnectionGUID: UtSp2+6xTi6Ye3XqQpKEYQ==
X-CSE-MsgGUID: VJly6oYLR4iFsqiALXM9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; d="scan'208";a="100840450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2024 17:28:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tRi6V-0004Pw-0a;
 Sun, 29 Dec 2024 01:28:27 +0000
Date: Sun, 29 Dec 2024 09:28:17 +0800
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
Message-ID: <202412290921.tY3nJMjm-lkp@intel.com>
References: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/usb-dwc3-st-Switch-from-CONFIG_PM_SLEEP-guards-to-pm_sleep_ptr/20241229-073700
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241229-update_pm_macro-v1-6-c7d4c4856336%40gmail.com
patch subject: [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
config: arm-randconfig-002-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290921.tY3nJMjm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290921.tY3nJMjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290921.tY3nJMjm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-st-ssc4.c:418:12: warning: 'spi_st_resume' defined but not used [-Wunused-function]
     418 | static int spi_st_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/spi/spi-st-ssc4.c:406:12: warning: 'spi_st_suspend' defined but not used [-Wunused-function]
     406 | static int spi_st_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/spi_st_resume +418 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones      2014-12-09  405  
9e862375c5420a Lee Jones      2014-12-09 @406  static int spi_st_suspend(struct device *dev)
9e862375c5420a Lee Jones      2014-12-09  407  {
e6b7e64cb11966 Yang Yingliang 2023-11-28  408  	struct spi_controller *host = dev_get_drvdata(dev);
9e862375c5420a Lee Jones      2014-12-09  409  	int ret;
9e862375c5420a Lee Jones      2014-12-09  410  
e6b7e64cb11966 Yang Yingliang 2023-11-28  411  	ret = spi_controller_suspend(host);
9e862375c5420a Lee Jones      2014-12-09  412  	if (ret)
9e862375c5420a Lee Jones      2014-12-09  413  		return ret;
9e862375c5420a Lee Jones      2014-12-09  414  
9e862375c5420a Lee Jones      2014-12-09  415  	return pm_runtime_force_suspend(dev);
9e862375c5420a Lee Jones      2014-12-09  416  }
9e862375c5420a Lee Jones      2014-12-09  417  
9e862375c5420a Lee Jones      2014-12-09 @418  static int spi_st_resume(struct device *dev)
9e862375c5420a Lee Jones      2014-12-09  419  {
e6b7e64cb11966 Yang Yingliang 2023-11-28  420  	struct spi_controller *host = dev_get_drvdata(dev);
9e862375c5420a Lee Jones      2014-12-09  421  	int ret;
9e862375c5420a Lee Jones      2014-12-09  422  
e6b7e64cb11966 Yang Yingliang 2023-11-28  423  	ret = spi_controller_resume(host);
9e862375c5420a Lee Jones      2014-12-09  424  	if (ret)
9e862375c5420a Lee Jones      2014-12-09  425  		return ret;
9e862375c5420a Lee Jones      2014-12-09  426  
9e862375c5420a Lee Jones      2014-12-09  427  	return pm_runtime_force_resume(dev);
9e862375c5420a Lee Jones      2014-12-09  428  }
9e862375c5420a Lee Jones      2014-12-09  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
