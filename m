Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BBD99BCAC
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2024 00:59:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 243ACC78013;
	Sun, 13 Oct 2024 22:59:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF18AC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Oct 2024 22:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728860368; x=1760396368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8LAUeJ4R3jubOnCceuAIhJvpehd+iDtP+KzTUvVwx48=;
 b=DLGbjDItHm4bhEhMrHkOmtrSNG3OIRWIiCqSxqpkRmqExWMmgb9M90As
 IW0BEDde1/8Oqck99XqacDJjYHVkOuP4uNDdDnTihTYh/YTA9YIGr+hTA
 mINB6+PrONgD1VjkxZg1lStW4AcYxVoy5sMv+Nxk0iqzBEJZq5sZ8yrM+
 VSgI3ZALm/FPDGcwE1jpJlaP1S9JWrJa7Imlp00UCClpO24Zk79MVuccl
 1LWmyj79Z0ydxSyF5ow+5unCluBjT4wn02GQBScKO+YCXSba9CWSKSgFK
 i3mljpHgxZwktbXrRiT55M6P1XjeBlEm2E9y4r0L1XoX6W+3wJ9VvHrta A==;
X-CSE-ConnectionGUID: IcQLg05IRCOEs64oUNInyQ==
X-CSE-MsgGUID: ACeOhnTfQiqaT8w8Hdmejg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15825979"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="15825979"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 15:59:19 -0700
X-CSE-ConnectionGUID: qQQqyOQ3Skq0oOodnvCNlw==
X-CSE-MsgGUID: 0jrlo2tbQH+OEi9joAcbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="77329015"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 13 Oct 2024 15:59:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t07YM-000El9-04;
 Sun, 13 Oct 2024 22:59:10 +0000
Date: Mon, 14 Oct 2024 06:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <202410140609.ErjSS58O-lkp@intel.com>
References: <20241013-upstream_s32cc_gmac-v3-15-d84b5a67b930@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-15-d84b5a67b930@oss.nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v3 15/16] MAINTAINERS: Add Jan Petrous as
 the NXP S32G/R DWMAC driver maintainer
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

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 18ba6034468e7949a9e2c2cf28e2e123b4fe7a50]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Petrous-via-B4-Relay/net-driver-stmmac-Fix-CSR-divider-comment/20241014-053027
base:   18ba6034468e7949a9e2c2cf28e2e123b4fe7a50
patch link:    https://lore.kernel.org/r/20241013-upstream_s32cc_gmac-v3-15-d84b5a67b930%40oss.nxp.com
patch subject: [PATCH v3 15/16] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
reproduce: (https://download.01.org/0day-ci/archive/20241014/202410140609.ErjSS58O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140609.ErjSS58O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/nxp,dwmac-s32.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
