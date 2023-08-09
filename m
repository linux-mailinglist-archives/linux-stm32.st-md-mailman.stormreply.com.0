Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325F776532
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 18:36:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F24AC6B472;
	Wed,  9 Aug 2023 16:36:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CC13C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691599006; x=1723135006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ydBCJtj9u/y8x/TfM7kTDDFzhiR7ELo5gtwHLbTMVBw=;
 b=ljVcTEVOMSRscUpLknsq+BN0Z4145q/dneGLKAZywQDM23kh1Lv1KtIa
 W6mKpTOrBm6lT486oHZwpvXrVp47YrR794rk+UAGmIMZcfXRuGqyh02hy
 9ueV+CZpKKQNWxQDDQYHNJZDtZEWrKMEuw5Tj1ZHjm5oEplR66rv8e/R4
 tYEo2I5VoYMtZXFc9YRyg9VfuzfIFxprS786A85CaryFYjwtDYJjc/N1J
 2N0G15Aso5q1oT5ppWkHv9NmFuKDVw8jDBMJ8/pXmKaUSUvA/5ke5w5/k
 sf5R/RTSJ4dPGhPXMUte+0q1SFfjUEi2cMmRgIABsJb5sW8wyAJ6eHLyh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="371160775"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="371160775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 09:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062540094"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062540094"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 09:36:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qTmAp-0006GG-0Q;
 Wed, 09 Aug 2023 16:36:39 +0000
Date: Thu, 10 Aug 2023 00:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <202308100045.WeVD1ttk-lkp@intel.com>
References: <20230801105932.3738430-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801105932.3738430-1-arnd@kernel.org>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on atorgue-stm32/stm32-next soc/for-next linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/rtc-stm32-remove-incorrect-ifdef-check/20230801-190951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230801105932.3738430-1-arnd%40kernel.org
patch subject: [PATCH] rtc: stm32: remove incorrect #ifdef check
config: x86_64-buildonly-randconfig-r003-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100045.WeVD1ttk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100045.WeVD1ttk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100045.WeVD1ttk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-stm32.c:903:12: warning: 'stm32_rtc_resume' defined but not used [-Wunused-function]
     903 | static int stm32_rtc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-stm32.c:893:12: warning: 'stm32_rtc_suspend' defined but not used [-Wunused-function]
     893 | static int stm32_rtc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/stm32_rtc_resume +903 drivers/rtc/rtc-stm32.c

4e64350f42e2ce Amelie Delaunay 2017-01-11  892  
4e64350f42e2ce Amelie Delaunay 2017-01-11 @893  static int stm32_rtc_suspend(struct device *dev)
4e64350f42e2ce Amelie Delaunay 2017-01-11  894  {
4e64350f42e2ce Amelie Delaunay 2017-01-11  895  	struct stm32_rtc *rtc = dev_get_drvdata(dev);
4e64350f42e2ce Amelie Delaunay 2017-01-11  896  
9a6757eadc14f0 Amelie Delaunay 2017-07-06  897  	if (rtc->data->has_pclk)
9a6757eadc14f0 Amelie Delaunay 2017-07-06  898  		clk_disable_unprepare(rtc->pclk);
9a6757eadc14f0 Amelie Delaunay 2017-07-06  899  
4e64350f42e2ce Amelie Delaunay 2017-01-11  900  	return 0;
4e64350f42e2ce Amelie Delaunay 2017-01-11  901  }
4e64350f42e2ce Amelie Delaunay 2017-01-11  902  
4e64350f42e2ce Amelie Delaunay 2017-01-11 @903  static int stm32_rtc_resume(struct device *dev)
4e64350f42e2ce Amelie Delaunay 2017-01-11  904  {
4e64350f42e2ce Amelie Delaunay 2017-01-11  905  	struct stm32_rtc *rtc = dev_get_drvdata(dev);
4e64350f42e2ce Amelie Delaunay 2017-01-11  906  	int ret = 0;
4e64350f42e2ce Amelie Delaunay 2017-01-11  907  
9a6757eadc14f0 Amelie Delaunay 2017-07-06  908  	if (rtc->data->has_pclk) {
9a6757eadc14f0 Amelie Delaunay 2017-07-06  909  		ret = clk_prepare_enable(rtc->pclk);
9a6757eadc14f0 Amelie Delaunay 2017-07-06  910  		if (ret)
9a6757eadc14f0 Amelie Delaunay 2017-07-06  911  			return ret;
9a6757eadc14f0 Amelie Delaunay 2017-07-06  912  	}
9a6757eadc14f0 Amelie Delaunay 2017-07-06  913  
4e64350f42e2ce Amelie Delaunay 2017-01-11  914  	ret = stm32_rtc_wait_sync(rtc);
cf33e911f500f6 Chuhong Yuan    2019-12-06  915  	if (ret < 0) {
cf33e911f500f6 Chuhong Yuan    2019-12-06  916  		if (rtc->data->has_pclk)
cf33e911f500f6 Chuhong Yuan    2019-12-06  917  			clk_disable_unprepare(rtc->pclk);
4e64350f42e2ce Amelie Delaunay 2017-01-11  918  		return ret;
cf33e911f500f6 Chuhong Yuan    2019-12-06  919  	}
4e64350f42e2ce Amelie Delaunay 2017-01-11  920  
4e64350f42e2ce Amelie Delaunay 2017-01-11  921  	return ret;
4e64350f42e2ce Amelie Delaunay 2017-01-11  922  }
4e64350f42e2ce Amelie Delaunay 2017-01-11  923  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
