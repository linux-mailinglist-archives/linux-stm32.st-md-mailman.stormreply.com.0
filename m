Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 633049C6E73
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 12:59:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC83C78F88;
	Wed, 13 Nov 2024 11:59:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1757CC7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 11:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731499160; x=1763035160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S2yXI+RpE/4Z6IIWIoXWreQT7e9SUd1QZeV3E85aBM8=;
 b=OgXHwEMud61wk7R3pJUn550iwHJ530Ts7KQOac2cVFd1UGxnhP3242dB
 nXilBxn/5mBdFXT4TtOMv0uR2PlLxjGrsDylKMxq2078QeX6ufSy7pLr8
 a+wbpH/tcgorjJLEvtagm7eTgousNNNCx0ZIoWpIE4hf50JxpNQXwx33e
 52jejEWLlwS/gr3B1GzDO7my28b5qSPMAnPL6f3eEX+VDIGZSmZaFf3Sx
 8pv4mNIb5ikYgag+qmx9HIqUV5gF+hIWFiBD8Nk5zvTRDLCjwNtYZSkvT
 KvtvGlZsVCLyp1ESNbL5laCGoSLKZRUEdRCmguZKiql5wU3jE0yAZNyn7 Q==;
X-CSE-ConnectionGUID: 59MMTDdoTcmkrg1m0agVhQ==
X-CSE-MsgGUID: Lfr/aNYBQ828DJZFzulGDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35314460"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="35314460"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:59:11 -0800
X-CSE-ConnectionGUID: mbuIIPKWTsC2Zo2OOWA+8Q==
X-CSE-MsgGUID: Drm0ljxqRt6tHanbqPmqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87842391"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 03:59:05 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tBC1X-0000Kv-0X;
 Wed, 13 Nov 2024 11:59:03 +0000
Date: Wed, 13 Nov 2024 19:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Message-ID: <202411131946.ozq1D0f2-lkp@intel.com>
References: <20241113051857.12732-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113051857.12732-4-a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 oe-kbuild-all@lists.linux.dev, schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac support for MA35 family
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

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-4-a0987203069%40gmail.com
patch subject: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131946.ozq1D0f2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c:20: warning: expecting prototype for dwmac(). Prototype was for PATHDLY_DEC() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +20 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

    19	
  > 20	#define PATHDLY_DEC         134
    21	#define TXDLY_OFST          16
    22	#define TXDLY_MSK           GENMASK(19, 16)
    23	#define RXDLY_OFST          20
    24	#define RXDLY_MSK           GENMASK(23, 20)
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
