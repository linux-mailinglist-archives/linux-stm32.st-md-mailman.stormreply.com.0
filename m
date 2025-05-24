Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E091AC2E47
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 10:43:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9F17C78F7B;
	Sat, 24 May 2025 08:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5B18CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 08:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748076223; x=1779612223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=21TpRITYx8gCPyYtnS7+VMQMKDMX408Ws2PCZEAHMeo=;
 b=KGCJz+uG/QDxZ5XDnRuL0YVj4y85b4ZtxeWXsSYyJJAv1n7fT9HDEiCw
 4eJj1ubY7+fZAhhppEymoLvbLmbi0ElxvSsYYmCd+5NoXv6LWedNjTNfN
 3meoVelfgZ7GAvb2uzfemQO8CevxVdZOO56DV9L856d5Uj3aR/uabJbId
 q2efzZXVPU0sjHWrc5oW5zkR7WMKa2U8wFAOCMNACax3qnZ68ZlIB5Vez
 jHr/m9ghCm6/BJdpr2nuVPDjO89s6bzAktenNepMa0jjSnp5Z5HO088S8
 bGTyuObYNbvsdtUAUVrf5ef4tmtPWBXnmYd9pfO9BOXEangV0J9LYG0h1 A==;
X-CSE-ConnectionGUID: G48Wvsy7SAG81D0mIJe/Hw==
X-CSE-MsgGUID: Kg34QbPlQ7yteOH2OzTJBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50273659"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50273659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 01:43:40 -0700
X-CSE-ConnectionGUID: 7Kqi4AGlTmisIlrL2d3T2Q==
X-CSE-MsgGUID: J3rguEQXTV68vf3OENoThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="141403969"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 24 May 2025 01:43:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIkTd-000R3w-2R;
 Sat, 24 May 2025 08:43:33 +0000
Date: Sat, 24 May 2025 16:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202505241618.qJrsEs8c-lkp@intel.com>
References: <20250523203339.1993685-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523203339.1993685-6-sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Daniel Golle <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
 Christian Marangi <ansuelsmth@gmail.com>, Lei Wei <quic_leiwei@quicinc.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v5 05/10] net: pcs: lynx: Convert
 to an MDIO driver
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250524-043901
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250523203339.1993685-6-sean.anderson%40linux.dev
patch subject: [net-next PATCH v5 05/10] net: pcs: lynx: Convert to an MDIO driver
config: x86_64-randconfig-074-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241618.qJrsEs8c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241618.qJrsEs8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241618.qJrsEs8c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-lynx.c:374:34: warning: 'lynx_pcs_of_match' defined but not used [-Wunused-const-variable=]
     374 | static const struct of_device_id lynx_pcs_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/lynx_pcs_of_match +374 drivers/net/pcs/pcs-lynx.c

   373	
 > 374	static const struct of_device_id lynx_pcs_of_match[] = {
   375		{ .compatible = "fsl,lynx-pcs" },
   376		{ },
   377	};
   378	MODULE_DEVICE_TABLE(of, lynx_pcs_of_match);
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
