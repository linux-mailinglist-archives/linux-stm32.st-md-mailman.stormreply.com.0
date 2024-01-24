Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14783A5B1
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 10:41:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6102EC6DD6C;
	Wed, 24 Jan 2024 09:41:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC671C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706089265; x=1737625265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+lkuKTCv3wUHbUhaYST2gExklAngKX84H00lKlFUXx4=;
 b=Y3Y5K5pnM0HtIaJLR7C4GBPTCYBbF1WRRTNBY3bB6D6bhH3lyLcUOOeH
 JSqYFoXwquduiz2LThMrif1mRSn//LjUCnpEXyFrQhtvsv+35d97NF/Ia
 jhTr6aZpPvSI1DJCGDczjER6eZ6Y1zc8EctCpDkLAuqktAL67XX+RCBwm
 15+GSOWry0eTD5E/tRVsQrk8xubRVOnluRjtRaO8mi7bcz13miN532Pzq
 RFhNiB8gwr1ecseZXyuY9XhatNL30Y0m4+2wu4XHel6ExeJmSurik49qL
 bc9adMcPGqtaWNVk5JakqJgB2hWH0CpRJyp7oX9w2B/URI0YBTT5CJnVK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="693419"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="693419"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735868699"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="735868699"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 01:40:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rSZke-00081p-13;
 Wed, 24 Jan 2024 09:40:56 +0000
Date: Wed, 24 Jan 2024 17:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyang Huang <hzyitc@outlook.com>, mcoquelin.stm32@gmail.com
Message-ID: <202401241733.H4p1Af19-lkp@intel.com>
References: <TYZPR01MB5556B8833322A83632709631C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556B8833322A83632709631C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ziyang Huang <hzyitc@outlook.com>, p.zabel@pengutronix.de,
 oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 3/8] net: stmmac: Introduce Qualcomm
	IPQ50xx DWMAC driver
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
[also build test ERROR on clk/clk-next pza/reset/next linus/master v6.8-rc1 next-20240123]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyang-Huang/net-phy-Introduce-Qualcomm-IPQ5018-internal-PHY-driver/20240121-204840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/TYZPR01MB5556B8833322A83632709631C9762%40TYZPR01MB5556.apcprd01.prod.exchangelabs.com
patch subject: [PATCH 3/8] net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240124/202401241733.H4p1Af19-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241733.H4p1Af19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241733.H4p1Af19-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c: In function 'ipq50xx_gmac_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c:94:20: error: implicit declaration of function 'stmmac_probe_config_dt'; did you mean 'devm_stmmac_probe_config_dt'? [-Werror=implicit-function-declaration]
      94 |         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
         |                    ^~~~~~~~~~~~~~~~~~~~~~
         |                    devm_stmmac_probe_config_dt
>> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c:94:18: warning: assignment to 'struct plat_stmmacenet_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      94 |         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
         |                  ^
   cc1: some warnings being treated as errors


vim +94 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq50xx.c

    80	
    81	static int ipq50xx_gmac_probe(struct platform_device *pdev)
    82	{
    83		struct device *dev = &pdev->dev;
    84		struct stmmac_resources stmmac_res;
    85		struct plat_stmmacenet_data *plat_dat;
    86		struct ipq50xx_gmac *gmac;
    87		int ret;
    88	
    89		ret = stmmac_get_platform_resources(pdev, &stmmac_res);
    90		if (ret)
    91			return dev_err_probe(dev, ret,
    92					     "failed to get stmmac platform resources\n");
    93	
  > 94		plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
    95		if (IS_ERR_OR_NULL(plat_dat))
    96			return dev_err_probe(dev, PTR_ERR(plat_dat),
    97					     "failed to parse stmmac dt parameters\n");
    98	
    99		gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
   100		if (!gmac)
   101			return dev_err_probe(dev, -ENOMEM,
   102					     "failed to allocate priv\n");
   103	
   104		gmac->dev = dev;
   105	
   106		memcpy(gmac->clks, ipq50xx_gmac_clks, sizeof(gmac->clks));
   107		ret = devm_clk_bulk_get_optional(dev, ARRAY_SIZE(gmac->clks), gmac->clks);
   108		if (ret)
   109			return dev_err_probe(dev, ret,
   110					     "failed to acquire clocks\n");
   111	
   112		ret = clk_bulk_prepare_enable(ARRAY_SIZE(gmac->clks), gmac->clks);
   113		if (ret)
   114			return dev_err_probe(dev, ret,
   115					     "failed to enable clocks\n");
   116	
   117		gmac->rst = devm_reset_control_array_get_exclusive(dev);
   118		if (IS_ERR_OR_NULL(gmac->rst))
   119			return dev_err_probe(dev, PTR_ERR(gmac->rst),
   120					     "failed to acquire reset\n");
   121	
   122		ret = reset_control_reset(gmac->rst);
   123		if (ret)
   124			return dev_err_probe(dev, ret,
   125					     "failed to reset\n");
   126	
   127		gmac->uniphy = devm_phy_optional_get(dev, "uniphy");
   128		if (IS_ERR(gmac->uniphy))
   129			return dev_err_probe(dev, PTR_ERR(gmac->uniphy),
   130					     "failed to acquire uniphy\n");
   131	
   132		plat_dat->bsp_priv = gmac;
   133		plat_dat->serdes_powerup = ipq50xx_gmac_powerup;
   134		plat_dat->fix_mac_speed = ipq50xx_gmac_fix_speed;
   135	
   136		return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
