Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11542AC2FDF
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 15:35:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9694C78F7F;
	Sat, 24 May 2025 13:35:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963D3C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748093706; x=1779629706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qcL491bXMJZ+O+gsTZNeVomr5uwF83cd6pWDzZAReO4=;
 b=EQSrekxdGFqGDue5UuHlvpPS6XafXMr4e7Xc/0Y9tyz8GqjWmkRCvl9D
 qaXbKay7P8M5pqXUkH9lY5dtUPzJYdl+zQWhfciAPa4GNE/pe9+FPxb1c
 SuME5tK4PDI7VimhjHcGaPfpCUXltTiKWAzfPPp+Q3Uwx3+vXds3FnjjK
 rYd49V3bN3ZZQWYbAZ9YzlI8tzunMoS3zf9QivE4s3vk5qnOf88EAs6zb
 96FTAkJb8HnMdXEQadpb/mC8mCigUaRr/Ma5+bGGeHS+3UySLL9LWbSXr
 9cCE6Te6pIr9AwSPzLbBUMWGfJ3Co7T7c1XX4sVaUQ6kl2HlZVFBaDk2y w==;
X-CSE-ConnectionGUID: NuZtY03EQgu7pm130+jn7A==
X-CSE-MsgGUID: I6juDNxkTam9+AVquQd4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50290710"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="50290710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2025 06:35:04 -0700
X-CSE-ConnectionGUID: Hm0pHqY8QqeFxidCs1ibYg==
X-CSE-MsgGUID: DQo3Dxt/SMuMBg2vQW1Svg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; d="scan'208";a="146431096"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 24 May 2025 06:34:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uIp1c-000RDw-1k;
 Sat, 24 May 2025 13:34:56 +0000
Date: Sat, 24 May 2025 21:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <202505242145.RKJGzoHX-lkp@intel.com>
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
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242145.RKJGzoHX-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-lynx.c: linux/phylink.h is included more than once.

vim +8 drivers/net/pcs/pcs-lynx.c

   > 8	#include <linux/phylink.h>
     9	#include <linux/of.h>
    10	#include <linux/pcs.h>
    11	#include <linux/pcs-lynx.h>
  > 12	#include <linux/phylink.h>
    13	#include <linux/property.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
