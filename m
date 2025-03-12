Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 980AEA5D32A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 00:35:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DF8C7802C;
	Tue, 11 Mar 2025 23:35:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB0A5C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741736118; x=1773272118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=elqNsF85TWhSgJAwnZme8MoszZ89P0pZ9HDqIv+k/+4=;
 b=fAb0zmf+TVzjMH7erkPU7QQ0y3xnBZoJj1VNgWi6wPGQmQDE9IIXLAZh
 cwK7WBHvmfkv/GdYTAefgcL6Kk7qqrBU3NcrXQnhBWR3LHT6CSTrZj8eY
 aRkYX8TWFfekBXQBYFO3oXlkVdv1VHOQSIXE0k502P80XTuQfZtGWOGZk
 /tDkZlZHnRAJNLvhz57/4IYyaeJdQWI0mmIB9HKxlpety04jVXERuSr5O
 kon2ayGvEMeE5J3iQhwrcxwsITIoe9LXT1gMLXI5bVfvWHIkfOShLw7jk
 P2kup++rw4JqiqWvgU1OCMpa8KGILrSbo8oTa8LT4S/3AugPn/JrSEui5 g==;
X-CSE-ConnectionGUID: 9AOljhe6ToC8yruDOqqIWg==
X-CSE-MsgGUID: l8N9qyTITvGWJRicy+Uo8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54169633"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="54169633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 16:35:15 -0700
X-CSE-ConnectionGUID: CF1404RcSfuQSV8CuiITiw==
X-CSE-MsgGUID: Jur65i+1S0GENA6ydQlL3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="125361340"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 11 Mar 2025 16:35:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ts97r-0007wm-1B;
 Tue, 11 Mar 2025 23:35:07 +0000
Date: Wed, 12 Mar 2025 07:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202503120741.lpX5066n-lkp@intel.com>
References: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
Cc: llvm@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: remove
	of_get_phy_mode()
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

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-of_get_phy_mode/20250311-001446
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1trbxk-005qYA-Up%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 3/9] net: stmmac: remove of_get_phy_mode()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120741.lpX5066n-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120741.lpX5066n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120741.lpX5066n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:11:
   In file included from include/linux/of_net.h:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:94:4: warning: variable 'phy_mode' is uninitialized when used here [-Wuninitialized]
      94 |                         phy_mode);
         |                         ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c:67:2: note: variable 'phy_mode' is declared here
      67 |         phy_interface_t phy_mode;
         |         ^
   4 warnings generated.


vim +/phy_mode +94 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c

2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   61  
41b984be408c088 Russell King (Oracle  2025-03-10   62) static struct anarion_gmac *
41b984be408c088 Russell King (Oracle  2025-03-10   63) anarion_config_dt(struct platform_device *pdev,
41b984be408c088 Russell King (Oracle  2025-03-10   64) 		  struct plat_stmmacenet_data *plat_dat)
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   65  {
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   66  	struct anarion_gmac *gmac;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   67  	phy_interface_t phy_mode;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   68  	void __iomem *ctl_block;
0c65b2b90d13c1d Andrew Lunn           2019-11-04   69  	int err;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   70  
ad124aa34e51439 YueHaibing            2019-08-21   71  	ctl_block = devm_platform_ioremap_resource(pdev, 1);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   72  	if (IS_ERR(ctl_block)) {
51fe084b17e795f Simon Horman          2023-04-06   73  		err = PTR_ERR(ctl_block);
51fe084b17e795f Simon Horman          2023-04-06   74  		dev_err(&pdev->dev, "Cannot get reset region (%d)!\n", err);
51fe084b17e795f Simon Horman          2023-04-06   75  		return ERR_PTR(err);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   76  	}
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   77  
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   78  	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   79  	if (!gmac)
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   80  		return ERR_PTR(-ENOMEM);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   81  
9f12541d684b925 Simon Horman          2023-04-06   82  	gmac->ctl_block = ctl_block;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   83  
41b984be408c088 Russell King (Oracle  2025-03-10   84) 	switch (plat_dat->phy_interface) {
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   85  	case PHY_INTERFACE_MODE_RGMII:
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   86  		fallthrough;
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   87  	case PHY_INTERFACE_MODE_RGMII_ID:
df561f6688fef77 Gustavo A. R. Silva   2020-08-23   88  	case PHY_INTERFACE_MODE_RGMII_RXID:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   89  	case PHY_INTERFACE_MODE_RGMII_TXID:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   90  		gmac->phy_intf_sel = GMAC_CONFIG_INTF_RGMII;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   91  		break;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   92  	default:
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   93  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n",
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04  @94  			phy_mode);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   95  		return ERR_PTR(-ENOTSUPP);
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   96  	}
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   97  
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   98  	return gmac;
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04   99  }
2d1611aff3f22a5 Alexandru Gagniuc     2017-08-04  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
