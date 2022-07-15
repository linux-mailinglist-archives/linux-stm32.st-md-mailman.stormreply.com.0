Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD857667E
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 20:01:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E93FC5A4FD;
	Fri, 15 Jul 2022 18:01:46 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57D87C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657908105; x=1689444105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2oOfC55LrtmXB2jCaFUlj9F/z3nDDWKlHIARcSj/KtA=;
 b=YdtltKU89TQ8MxVhzFbC9bjj7UwDm69/He7/S+tJVGZN2SZLQH6i2JUV
 oLO2r11AIoXUbR230dwZ6a4r2qA66XJnBXZnmSGlAmt8dfLBMHmxYLavq
 43ZzDLYK+dzL5FzJlXkylUbt5kv7xW2Tuf9Brcth1xG0MemFd1EX4rjFm
 YrdIdDNH8Kpp/s7BEHOH53Fbq2YWngKa9lcLgJH7OwJki+px9yu8q2tVB
 7yLCzeZf4FQo08//uyseqt3bsKt+1V8lmFwxjsr94IrNY58kpT4786l8j
 FDhDUwKheDIujgBsiic0H1KLtZmCtYHbo6r4zIk/6s3vLohMqIpBMxn6C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347550678"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="347550678"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 11:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="546742759"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2022 11:01:40 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCPdD-0000c6-GP;
 Fri, 15 Jul 2022 18:01:39 +0000
Date: Sat, 16 Jul 2022 02:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202207160125.oxFFO8ZQ-lkp@intel.com>
References: <20220713142148.239253-4-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713142148.239253-4-amelie.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, kbuild-all@lists.01.org,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dmaengine: stm32-dma: add support
 to trigger STM32 MDMA
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

Hi Amelie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on lwn-2.6/docs-next vkoul-dmaengine/next linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amelie-Delaunay/STM32-DMA-MDMA-chaining-feature/20220713-222358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
config: hexagon-buildonly-randconfig-r004-20220715 (https://download.01.org/0day-ci/archive/20220716/202207160125.oxFFO8ZQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1f4515659df0475a1e4d6dafd8559771c2b49b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Amelie-Delaunay/STM32-DMA-MDMA-chaining-feature/20220713-222358
        git checkout e1f4515659df0475a1e4d6dafd8559771c2b49b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma/ drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/dma/stm32-dma.c:211: warning: expecting prototype for struct stm32_dma_mdma_cfg. Prototype was for struct stm32_dma_mdma_config instead


vim +211 drivers/dma/stm32-dma.c

   199	
   200	/**
   201	 * struct stm32_dma_mdma_cfg - STM32 DMA MDMA configuration
   202	 * @stream_id: DMA request to trigger STM32 MDMA transfer
   203	 * @ifcr: DMA interrupt flag clear register address,
   204	 *        used by STM32 MDMA to clear DMA Transfer Complete flag
   205	 * @tcf: DMA Transfer Complete flag
   206	 */
   207	struct stm32_dma_mdma_config {
   208		u32 stream_id;
   209		u32 ifcr;
   210		u32 tcf;
 > 211	};
   212	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
