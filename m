Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D97B9C8C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 12:43:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1BC6C6C835;
	Thu,  5 Oct 2023 10:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C16FC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 10:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696502587; x=1728038587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GqKe2kbO3tMy/0EgmQO31nknlkfPS8TEimBu+0qpdrE=;
 b=XsGAfGLiaGte5NQPjfx8rpAtROJETuWlevxwFgR7VoclFEUVvy06pnIA
 za4PWH2lVHbxn6zAKptQsqG9KDG4jtwpfkUaO7+XXDfmqNpNiUHbS8fK6
 /mCieL86stkN/Esyeeday8SrQm3a13lSXsMF0lTmTfC4fX6HAfY2h7Ari
 eLIei4woUvY9TaCXu1jURl9w4Ama/RyrL8zHnXNBYowtP+QzLaEeTPARl
 0xUs8wDdTcXSO/QrXXtD6UmzZ40eW3O9UH81s/1tRpTX5pczLWzPGvrWY
 pxe7lnbVcIUcz7w0wrKS307ICLReyGGNIbKfjEDbSg+MEHMM4F+sEjUdB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380743624"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="380743624"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786921899"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="786921899"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 03:42:54 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qoLoi-000LJS-2I;
 Thu, 05 Oct 2023 10:42:52 +0000
Date: Thu, 5 Oct 2023 18:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <202310051811.Rltsgr8J-lkp@intel.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, oe-kbuild-all@lists.linux.dev,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-imx: request high
	frequency mode
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

Hi Shenwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/net-stmmac-dwmac-imx-request-high-frequency-mode/20231005-035606
base:   net/main
patch link:    https://lore.kernel.org/r/20231004195442.414766-1-shenwei.wang%40nxp.com
patch subject: [PATCH net] net: stmmac: dwmac-imx: request high frequency mode
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051811.Rltsgr8J-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051811.Rltsgr8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051811.Rltsgr8J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:9:10: fatal error: linux/busfreq-imx.h: No such file or directory
       9 | #include <linux/busfreq-imx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

   > 9	#include <linux/busfreq-imx.h>
    10	#include <linux/clk.h>
    11	#include <linux/gpio/consumer.h>
    12	#include <linux/kernel.h>
    13	#include <linux/mfd/syscon.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/of_net.h>
    17	#include <linux/phy.h>
    18	#include <linux/platform_device.h>
    19	#include <linux/pm_wakeirq.h>
    20	#include <linux/regmap.h>
    21	#include <linux/slab.h>
    22	#include <linux/stmmac.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
