Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B8AC2EDD
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 12:28:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13561C78F80;
	Sat, 24 May 2025 10:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E8FBC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748082531; x=1779618531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=psdi4796Sb+q+ePNVBR6xRLzzJYOhgE+dtwY5fCMdYo=;
 b=D0aHMq9X8Mcfj/MoVuVayMhuu41FgW99uX6Ow5ESnH+xvnx+pYoYTbq6
 cUG/nTlywcP/9IiD6E4RcDOciQB58Rj0kFhbZ2Z9DYp9d6I912Xhg7vLt
 iM2M0UB1aFbc4LS5UtjskvxtwRIjvz8F18GlgheTPiih/7CJlNr5hzqY1
 G47bd7sEFbevhqqnxei1QiCYGYdlFmDuVGz+ehm+1RAjWjN+PvSg0E5j3
 5X0igs4Vomf7UZmsm193sgQ5nLCmY5MrHVJK2aW2PsuLH69t8VQHSCraI
 swRQ+5aAphEgSwFG96euOODYoyiWUHq6KU/8yqoJLbr/i7o3qLdmcRxsz Q==;
X-CSE-ConnectionGUID: QNwJ+QAxSlCFrU2ofC+qJQ==
X-CSE-MsgGUID: ZXQBBwEXRWm8U2KRVoovNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49380018"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="49380018"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 03:28:49 -0700
X-CSE-ConnectionGUID: eWF/ujWEQS+zyKJZ6wq/dA==
X-CSE-MsgGUID: Ja1jVy7xQqW7Dr0Hl6XBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="141381290"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 24 May 2025 03:28:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIm7N-000R7C-22;
 Sat, 24 May 2025 10:28:41 +0000
Date: Sat, 24 May 2025 18:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202505241840.ILpzEabZ-lkp@intel.com>
References: <20250523203339.1993685-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523203339.1993685-6-sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Sean Anderson <sean.anderson@linux.dev>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Daniel Golle <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <horms@kernel.org>, oe-kbuild-all@lists.linux.dev,
 imx@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>,
 Lei Wei <quic_leiwei@quicinc.com>, Heiner Kallweit <hkallweit1@gmail.com>
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
config: x86_64-kismet-CONFIG_OF_DYNAMIC-CONFIG_FSL_FMAN-0-0 (https://download.01.org/0day-ci/archive/20250524/202505241840.ILpzEabZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505241840.ILpzEabZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241840.ILpzEabZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by FSL_FMAN
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - FSL_FMAN [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y] && (FSL_SOC || ARCH_LAYERSCAPE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
