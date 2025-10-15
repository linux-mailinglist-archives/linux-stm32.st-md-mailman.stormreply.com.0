Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC21BE10D9
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 01:43:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDA6EC57181;
	Wed, 15 Oct 2025 23:43:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D0EC5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 23:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760571834; x=1792107834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0xdTqDw9WUR1MHTE6JTRUHIGJ2mKZvvcYBTUUih42x4=;
 b=TZe1NVgsvxiJFmoIge7On71OnU8ei7JrH2sd/X9YKgrJgq7amhV86sCT
 nFDpbvPIvta7i8y+SXw3u4xDWMgquQl0uRYFYIKtL7EGOSLCH4ovnUUy0
 Msq17WFu1R/R0wx0Rq4nNju5Z8OCn621Eng/ZRGF8k6MeOtcQZrJ5UU7o
 wTYy8ksTCV05uZxXftpz7pLYgsFuOvJwt5vxYkiMgO1QCFLWNUwMSMPPX
 hD2kDnTrQM02BGaYCrq4qLvfPnr1aL/dfnfogW0EV7x6b/+cxgDi9TRcY
 ifYA6JjMXa1sadYQZQGayR48hbgiZYtgyX6OkQy33UlEhl2PUJhO5ppBH g==;
X-CSE-ConnectionGUID: uKvs7yx1SgyGHLXJBsNSmQ==
X-CSE-MsgGUID: 2q5zTULDTtaMCL5v4fMlCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74204111"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="74204111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:43:52 -0700
X-CSE-ConnectionGUID: Hso+wECATpWtOfTbPJ+EBQ==
X-CSE-MsgGUID: NhZgz1k0SL+mUJXovZND2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="181853552"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 15 Oct 2025 16:43:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v9B9g-0004Id-38;
 Wed, 15 Oct 2025 23:43:42 +0000
Date: Thu, 16 Oct 2025 07:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhe <sensor1010@163.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, jonas@kwiboo.se,
 chaoyi.chen@rock-chips.com, david.wu@rock-chips.com
Message-ID: <202510160726.OejMgsW0-lkp@intel.com>
References: <20251015040847.6421-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
Cc: netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Lizhe <sensor1010@163.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: dwmac-rk: No need to check
 the return value of the phy_power_on()
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

Hi Lizhe,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhe/net-dwmac-rk-No-need-to-check-the-return-value-of-the-phy_power_on/20251015-121214
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251015040847.6421-1-sensor1010%40163.com
patch subject: [PATCH net-next] net: dwmac-rk: No need to check the return value of the phy_power_on()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510160726.OejMgsW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160726.OejMgsW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160726.OejMgsW0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk_gmac_powerdown':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1670:9: error: implicit declaration of function 'phy_power_on'; did you mean 'rk_phy_power_on'? [-Wimplicit-function-declaration]
    1670 |         phy_power_on(gmac, false);
         |         ^~~~~~~~~~~~
         |         rk_phy_power_on


vim +1670 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

7ad269ea1a2b7d Roger Chen            2014-12-29  1662  
229666c14c75ae Vincent Palatin       2016-06-15  1663  static void rk_gmac_powerdown(struct rk_priv_data *gmac)
7ad269ea1a2b7d Roger Chen            2014-12-29  1664  {
32c7bc0747bbd8 Jonas Karlman         2025-03-19  1665  	if (gmac->integrated_phy && gmac->ops->integrated_phy_powerdown)
32c7bc0747bbd8 Jonas Karlman         2025-03-19  1666  		gmac->ops->integrated_phy_powerdown(gmac);
fecd4d7eef8b21 David Wu              2017-08-10  1667  
8f6503993911f0 Russell King (Oracle  2025-06-16  1668) 	pm_runtime_put_sync(gmac->dev);
aec3f415f7244b Punit Agrawal         2021-09-29  1669  
7ad269ea1a2b7d Roger Chen            2014-12-29 @1670  	phy_power_on(gmac, false);
7ad269ea1a2b7d Roger Chen            2014-12-29  1671  	gmac_clk_enable(gmac, false);
7ad269ea1a2b7d Roger Chen            2014-12-29  1672  }
7ad269ea1a2b7d Roger Chen            2014-12-29  1673  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
