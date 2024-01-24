Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEE839DBC
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 01:53:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29073C6DD6D;
	Wed, 24 Jan 2024 00:53:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81E29C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 00:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706057626; x=1737593626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yU9VsaBUrWtQtZ+GU86aDxwFo8ytu1/OKjeCrxQZZw8=;
 b=kiqvywg0QEgWWqu1p/pfXkyeu9eQlTZgE/h4TsOGozzNbFoHwJt4FuF+
 Gw6v/tXWnmluV6bErjs5axGyyTLFR+gN8oNJb4tawd6GKvp98y8tv2uor
 GBGvmr7opSmY99PMkjAKZwqa+kNpnC9GPhyOqqSJ08HTyw/Yf01Mef7Cf
 w9349wnp/Gaudjo8ArCSEqxKiC/LuKlW6bvuHSGBaGEJcSEb1SajYWEg0
 a+XsTBUD+TJ2D0fOtvmtAyCuNoTTMuJQgRfa6HbISVjPCuNjQMkgVa4CA
 ggDh9nNweujvcU0B3Ps3vv9Eg018yTqPS6VhEirN7l6yICBUm70gMjoAd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405454539"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="405454539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 16:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929509990"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929509990"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2024 16:53:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rSRWM-0007lN-0F;
 Wed, 24 Jan 2024 00:53:38 +0000
Date: Wed, 24 Jan 2024 08:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyang Huang <hzyitc@outlook.com>, mcoquelin.stm32@gmail.com
Message-ID: <202401240841.gfbyp3Lz-lkp@intel.com>
References: <TYZPR01MB5556D3E73D7F7242F810F915C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556D3E73D7F7242F810F915C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ziyang Huang <hzyitc@outlook.com>, p.zabel@pengutronix.de,
 oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 8/8] arm64: dts: qcom: ipq5018-rdp432-c2:
 enable ethernet support
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

Hi Ziyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on clk/clk-next pza/reset/next]
[cannot apply to linus/master pza/imx-drm/next v6.8-rc1 next-20240123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyang-Huang/net-phy-Introduce-Qualcomm-IPQ5018-internal-PHY-driver/20240121-204840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/TYZPR01MB5556D3E73D7F7242F810F915C9762%40TYZPR01MB5556.apcprd01.prod.exchangelabs.com
patch subject: [PATCH 8/8] arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet support
config: arm64-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240841.gfbyp3Lz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240841.gfbyp3Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240841.gfbyp3Lz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts:102.26-27 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
