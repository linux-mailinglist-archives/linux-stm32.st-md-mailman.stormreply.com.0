Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F36798EC0
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Sep 2023 21:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 481C5C6B468;
	Fri,  8 Sep 2023 19:10:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02F9AC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 19:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694200245; x=1725736245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ySPdpojXv3pYoGATgCEGL+4UQycRD8t21NYMrxVzrrI=;
 b=e9bs8Nzc0XMwC+5czPfvApA3pMTWSKFQ+q8FfpN6Xjk0pear/dYrT4ze
 64jwG06ezzaxM8v1+gik4bP1GL0fWM3j6XoOoRKFTlhUXf6Mtdxq2nC7c
 Mm1c0+SB/2ETTEjjlHx32UpAYWs5oFFPydA8hk0b/uCE/bsShNsYqkr1i
 pYKeTN/Dlid+v2t8sJ1aFqSbeYX+VbphyA4ewKquAzjmCR56R/trQel7z
 6j2MNNt4km046ry8xyDTtYTtGEHKRJkO0qa9jzVXLAVpkzq44VK6h7gRQ
 c/m9o55FeHLiOh4qDDDe5torJsYKRys4D2lzmZUO9MrfiPf5x3Qs5QpIK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377636106"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="377636106"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 12:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742609214"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="742609214"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 12:10:24 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qegs1-0002XK-36;
 Fri, 08 Sep 2023 19:10:21 +0000
Date: Sat, 9 Sep 2023 03:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202309090255.4Ttcm8zy-lkp@intel.com>
References: <20230908165120.730867-10-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230908165120.730867-10-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/10] hwrng: stm32 - rework power
	management sequences
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

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next herbert-crypto-2.6/master herbert-cryptodev-2.6/master linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-rng-introduce-new-compatible-for-STM32MP13x/20230909-005611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20230908165120.730867-10-gatien.chevallier%40foss.st.com
patch subject: [PATCH 09/10] hwrng: stm32 - rework power management sequences
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309090255.4Ttcm8zy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090255.4Ttcm8zy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090255.4Ttcm8zy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/stm32-rng.c:403:12: warning: 'stm32_rng_runtime_resume' defined but not used [-Wunused-function]
     403 | static int stm32_rng_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/stm32-rng.c:371:12: warning: 'stm32_rng_runtime_suspend' defined but not used [-Wunused-function]
     371 | static int stm32_rng_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/stm32_rng_runtime_resume +403 drivers/char/hw_random/stm32-rng.c

af0d4442dd6813 Lionel Debieve    2019-04-01  370  
c6a97c42e399ad Daniel Thompson   2015-10-12 @371  static int stm32_rng_runtime_suspend(struct device *dev)
c6a97c42e399ad Daniel Thompson   2015-10-12  372  {
d6ba06b8b9a947 Daniel Thompson   2015-10-14  373  	struct stm32_rng_private *priv = dev_get_drvdata(dev);
f81a08733f43ae Gatien Chevallier 2023-09-08  374  	u32 reg;
c6a97c42e399ad Daniel Thompson   2015-10-12  375  
d9494cfe524b05 Gatien Chevallier 2023-09-08  376  	reg = readl_relaxed(priv->base + RNG_CR);
d9494cfe524b05 Gatien Chevallier 2023-09-08  377  	reg &= ~RNG_CR_RNGEN;
d9494cfe524b05 Gatien Chevallier 2023-09-08  378  	writel_relaxed(reg, priv->base + RNG_CR);
d9494cfe524b05 Gatien Chevallier 2023-09-08  379  	clk_disable_unprepare(priv->clk);
c6a97c42e399ad Daniel Thompson   2015-10-12  380  
c6a97c42e399ad Daniel Thompson   2015-10-12  381  	return 0;
c6a97c42e399ad Daniel Thompson   2015-10-12  382  }
c6a97c42e399ad Daniel Thompson   2015-10-12  383  
f81a08733f43ae Gatien Chevallier 2023-09-08  384  static int __maybe_unused stm32_rng_suspend(struct device *dev)
f81a08733f43ae Gatien Chevallier 2023-09-08  385  {
f81a08733f43ae Gatien Chevallier 2023-09-08  386  	struct stm32_rng_private *priv = dev_get_drvdata(dev);
f81a08733f43ae Gatien Chevallier 2023-09-08  387  
f81a08733f43ae Gatien Chevallier 2023-09-08  388  	if (priv->data->has_cond_reset) {
f81a08733f43ae Gatien Chevallier 2023-09-08  389  		priv->pm_conf.nscr = readl_relaxed(priv->base + RNG_NSCR);
f81a08733f43ae Gatien Chevallier 2023-09-08  390  		priv->pm_conf.htcr = readl_relaxed(priv->base + RNG_HTCR);
f81a08733f43ae Gatien Chevallier 2023-09-08  391  	}
f81a08733f43ae Gatien Chevallier 2023-09-08  392  
f81a08733f43ae Gatien Chevallier 2023-09-08  393  	/* Do not save that RNG is enabled as it will be handled at resume */
f81a08733f43ae Gatien Chevallier 2023-09-08  394  	priv->pm_conf.cr = readl_relaxed(priv->base + RNG_CR) & ~RNG_CR_RNGEN;
f81a08733f43ae Gatien Chevallier 2023-09-08  395  
f81a08733f43ae Gatien Chevallier 2023-09-08  396  	writel_relaxed(priv->pm_conf.cr, priv->base + RNG_CR);
f81a08733f43ae Gatien Chevallier 2023-09-08  397  
f81a08733f43ae Gatien Chevallier 2023-09-08  398  	clk_disable_unprepare(priv->clk);
f81a08733f43ae Gatien Chevallier 2023-09-08  399  
f81a08733f43ae Gatien Chevallier 2023-09-08  400  	return 0;
f81a08733f43ae Gatien Chevallier 2023-09-08  401  }
f81a08733f43ae Gatien Chevallier 2023-09-08  402  
c6a97c42e399ad Daniel Thompson   2015-10-12 @403  static int stm32_rng_runtime_resume(struct device *dev)
c6a97c42e399ad Daniel Thompson   2015-10-12  404  {
f81a08733f43ae Gatien Chevallier 2023-09-08  405  	struct stm32_rng_private *priv = dev_get_drvdata(dev);
f81a08733f43ae Gatien Chevallier 2023-09-08  406  	int err;
d9494cfe524b05 Gatien Chevallier 2023-09-08  407  	u32 reg;
f81a08733f43ae Gatien Chevallier 2023-09-08  408  
f81a08733f43ae Gatien Chevallier 2023-09-08  409  	err = clk_prepare_enable(priv->clk);
f81a08733f43ae Gatien Chevallier 2023-09-08  410  	if (err)
f81a08733f43ae Gatien Chevallier 2023-09-08  411  		return err;
f81a08733f43ae Gatien Chevallier 2023-09-08  412  
f81a08733f43ae Gatien Chevallier 2023-09-08  413  	/* Clean error indications */
f81a08733f43ae Gatien Chevallier 2023-09-08  414  	writel_relaxed(0, priv->base + RNG_SR);
f81a08733f43ae Gatien Chevallier 2023-09-08  415  
f81a08733f43ae Gatien Chevallier 2023-09-08  416  	reg = readl_relaxed(priv->base + RNG_CR);
f81a08733f43ae Gatien Chevallier 2023-09-08  417  	reg |= RNG_CR_RNGEN;
f81a08733f43ae Gatien Chevallier 2023-09-08  418  	writel_relaxed(reg, priv->base + RNG_CR);
f81a08733f43ae Gatien Chevallier 2023-09-08  419  
f81a08733f43ae Gatien Chevallier 2023-09-08  420  	return 0;
f81a08733f43ae Gatien Chevallier 2023-09-08  421  }
f81a08733f43ae Gatien Chevallier 2023-09-08  422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
