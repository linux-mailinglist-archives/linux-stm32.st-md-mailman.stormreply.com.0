Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02492739597
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 04:49:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A68E3C65E4F;
	Thu, 22 Jun 2023 02:49:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 666FAC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 02:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687402167; x=1718938167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tt3wX80eeUJQMUKZ5re8uDuyu//FG7twtLDZz+jjnVo=;
 b=YVfFJERgAztL3OX7hBwzlN/gjQKobN3VQ1JXBhDdqi5beeTxt/0kFTD9
 Dgxft6UcBk4GxFNKsVxyvHBBYrSPMmXiWEUtiCV2CkXVUJoZN5fiXX718
 EzDJE7qdIdRGukLJtWF+uw+b27Mjqi5kRn/5pYo/PxV/y1rAG999d02GW
 iCi7j+znIf+4byZZsXDcaVNpxvfmxFiCxz4oHv+zO8Woz2EAKXWUPnF4j
 LwzPflzvNZ6WqR6zoslSk2SoR3pLPWQt/r59lr5UGCOlV+si2Op0klm+C
 3i3GuLmKHLSZyq1xKj4tqt2CfeU66n2yzVBj+chykgGXQoxsg2Iyo51BB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="446747563"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="446747563"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 19:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744432432"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="744432432"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 21 Jun 2023 19:48:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCAN0-0007HO-2b;
 Thu, 22 Jun 2023 02:48:26 +0000
Date: Thu, 22 Jun 2023 10:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Message-ID: <202306221025.K6fKRmj7-lkp@intel.com>
References: <20230621153650.440350-9-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621153650.440350-9-brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: platform:
 provide devm_stmmac_probe_config_dt()
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

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/net-stmmac-platform-provide-stmmac_pltfr_init/20230621-234133
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230621153650.440350-9-brgl%40bgdev.pl
patch subject: [PATCH net-next 08/11] net: stmmac: platform: provide devm_stmmac_probe_config_dt()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230622/202306221025.K6fKRmj7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221025.K6fKRmj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221025.K6fKRmj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__ksymtab_devm_stmmac_probe_config_dt':
>> stmmac_platform.c:(___ksymtab_gpl+devm_stmmac_probe_config_dt+0x0): undefined reference to `devm_stmmac_probe_config_dt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
