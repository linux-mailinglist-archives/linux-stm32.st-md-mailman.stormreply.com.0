Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC7762742
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 01:24:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81900C6A61A;
	Tue, 25 Jul 2023 23:24:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6EFDC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690327487; x=1721863487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p47ozaRPxRfd7xjJ3KOYaPYCsYx6E4f8EMoQSRJfMcM=;
 b=Y6jbHowdvozijxb3VwxrcukUmzVlRNC5xipp9skQggOOgcJ6f7at+TZn
 HiOYAFY56SDDUdUCkF7hW1AcGY/6xPBANUj84OnFrq4v0qs+vzuEkXh8E
 hcmBvgogLAYQUuIALzdmoBk9RGGycxUof4FKE/zpKppSUI4puRbicj0lp
 Skotk2wsWX9cMbEQ5hJ0JwIwOfmVxKVuh1hfiesAMM0NDN3+3ZAYiU/xI
 DLysmmdcheP44I4rTPKA9acqX7bIPW7hyJnDszC4dCCZ+MY/4Npl2uGXn
 3Ww7VKJoAP6Z/NdgroDfZxVy94aqsZlobx8dU87SUrYa/LD1FJnB4EUO3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371476292"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="371476292"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 16:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726271867"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="726271867"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 16:24:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qOROQ-0000QR-0C;
 Tue, 25 Jul 2023 23:24:38 +0000
Date: Wed, 26 Jul 2023 07:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shenwei Wang <shenwei.wang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202307260736.EE13gy3b-lkp@intel.com>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725194931.1989102-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, oe-kbuild-all@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: pause the TXC
	clock in fixed-link
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.5-rc3 next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/net-stmmac-dwmac-imx-pause-the-TXC-clock-in-fixed-link/20230726-035218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230725194931.1989102-1-shenwei.wang%40nxp.com
patch subject: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307260736.EE13gy3b-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260736.EE13gy3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260736.EE13gy3b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c: In function 'imx_dwmac_fix_speed_mx93':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:240:38: warning: variable 'plat_dat' set but not used [-Wunused-but-set-variable]
     240 |         struct plat_stmmacenet_data *plat_dat;
         |                                      ^~~~~~~~


vim +/plat_dat +240 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

   237	
   238	static void imx_dwmac_fix_speed_mx93(void *priv, unsigned int speed)
   239	{
 > 240		struct plat_stmmacenet_data *plat_dat;
   241		struct imx_priv_data *dwmac = priv;
   242		int val, ctrl, old_ctrl;
   243	
   244		imx_dwmac_fix_speed(priv, speed);
   245	
   246		old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
   247		plat_dat = dwmac->plat_dat;
   248		ctrl = old_ctrl & ~CTRL_SPEED_MASK;
   249	
   250		/* by default ctrl will be SPEED_1000 */
   251		if (speed == SPEED_100)
   252			ctrl |= RMII_RESET_SPEED;
   253		if (speed == SPEED_10)
   254			ctrl |= TEN_BASET_RESET_SPEED;
   255	
   256		if (imx_dwmac_is_fixed_link(dwmac)) {
   257			writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);
   258	
   259			/* Ensure the settings for CTRL are applied */
   260			wmb();
   261	
   262			val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII;
   263			regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
   264					   MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
   265			usleep_range(50, 100);
   266			val = MX93_GPR_ENET_QOS_INTF_SEL_RGMII | MX93_GPR_ENET_QOS_CLK_GEN_EN;
   267			regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
   268					   MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
   269	
   270			writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
   271		}
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
