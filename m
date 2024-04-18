Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E38A9283
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 07:40:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 655C1C6DD66;
	Thu, 18 Apr 2024 05:40:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E630C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713418821; x=1744954821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bTjx8rndt/PSO/6dNSTUflavw32jLsFtA0qjmagKIOI=;
 b=n486ZoSIwZyK5fjOX1+LqTIRiHRyMclHRqHiRvgz992AdIXozbRPViyf
 n7l6HpYslut0fqaR3Q9z5kuCEIYdjvxXYiS6H5Ka8ZGTR5uwaaz2+i0OB
 xvI4aSrLS7xF6qJFY55khxgPVHtZo2LIN1Eks7gdTaSVumRM9hvF7ZqQq
 hJzCvbBQI8VW8bHqP7NEz64wnxGo9JPAcHu5HFtjiRov1q605oRJta56r
 CtiesicXSDf6cqkAOZdf1p7a5R1OH2/H3ufl/l8p0cTix8xMhZ5pKHKQs
 HThsqR2S5zTPUpKOp3vTgz1zayH5GekM2wbT3XNOvrrdCxI8CfP6EtOWh A==;
X-CSE-ConnectionGUID: EF9z4jlQS96L8dIC4cZ+jg==
X-CSE-MsgGUID: AoF8Rt6tRV+3HWJLfWtafg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19549968"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="19549968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 22:40:19 -0700
X-CSE-ConnectionGUID: ofsmR+8sRcG/x+ClL/kPeQ==
X-CSE-MsgGUID: QhL2448uQ9S0pi825yf5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="22958156"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2024 22:40:14 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rxKVF-0007Ls-1r;
 Thu, 18 Apr 2024 05:40:10 +0000
Date: Thu, 18 Apr 2024 13:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Arun Ramadoss <arun.ramadoss@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202404181340.89g7TIG1-lkp@intel.com>
References: <20240417164316.1755299-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417164316.1755299-4-o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Oleksij Rempel <o.rempel@pengutronix.de>,
 kernel@pengutronix.de, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/4] net: phy: realtek:
 provide TimeSync data path delays for RTL8211E
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

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-phy-Add-TimeSync-delay-query-support-to-PHYlib-API/20240418-004607
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240417164316.1755299-4-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v1 3/4] net: phy: realtek: provide TimeSync data path delays for RTL8211E
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240418/202404181340.89g7TIG1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181340.89g7TIG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181340.89g7TIG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/realtek.c:278:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/net/phy/realtek.c:278:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +278 drivers/net/phy/realtek.c

   245	
   246	static int rtl8211e_get_timesync_data_path_delays(struct phy_device *phydev,
   247							  struct phy_timesync_delay *tsd)
   248	{
   249		phydev_warn(phydev, "Time stamping is not supported\n");
   250	
   251		switch (phydev->interface) {
   252		case PHY_INTERFACE_MODE_RGMII:
   253		case PHY_INTERFACE_MODE_RGMII_RXID:
   254		case PHY_INTERFACE_MODE_RGMII_TXID:
   255		case PHY_INTERFACE_MODE_RGMII_ID:
   256			/* The values are measured with RTL8211E and LAN8841 as link
   257			 * partners and confirmed with i211 to be in sane range.
   258			 */
   259			if (phydev->speed == SPEED_1000) {
   260				tsd->tx_min_delay_ns = 326;
   261				tsd->rx_min_delay_ns = 406;
   262				return 0;
   263			} else if (phydev->speed == SPEED_100) {
   264				tsd->tx_min_delay_ns = 703;
   265				tsd->rx_min_delay_ns = 621;
   266				return 0;
   267			} else if (phydev->speed == SPEED_10) {
   268				/* This value is suspiciously big, with atypical
   269				 * shift to Egress side. This value is confirmed
   270				 * by measuring RGMII-PHY-PHY-RGMII path delay.
   271				 * Similar results are confirmed with LAN8841 and i211
   272				 * as link partners.
   273				 */
   274				tsd->tx_min_delay_ns = 920231;
   275				tsd->rx_min_delay_ns = 1674;
   276				return 0;
   277			}
 > 278		default:
   279			break;
   280		}
   281	
   282		phydev_warn(phydev, "Not tested or not supported modes for path delay values\n");
   283	
   284		return -EOPNOTSUPP;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
