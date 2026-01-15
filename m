Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFDD23EB6
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 11:24:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64BE5C8F282;
	Thu, 15 Jan 2026 10:24:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31140C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768472645; x=1800008645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p9miV0nNryyvHyd1FyrzdZUkZX6TLv1ioe/BqF8c1NU=;
 b=jRjRqbcwrVvgD4v2swy7XNyecUwR5mCapexxWS0KLD/0ePG523r74JxF
 ZXNdz7qygSeCj3IYjrNffeOK3pWl36lmlDc8Q50USe3KxiM2KF4t0S+nt
 p28WW1DQOp9GHDG+Lo78U8qDCtByKjtTL4bfsWL7byJY4EVNZuWkbRKgP
 Pj8T0lMNpaFAZzoGTzjXWRU3GzBvIoHOb0/qJ76Du8NKPOEbbG6epPvP6
 XCfOJ97D7h+CvlDQCLisfwyca/sHwrDkkghxJts9QPgjByKeWKkn1MQ31
 DOwlRVqfZl/xqPR0eYQvG+dxqRHTPl/yOHNZ1t5J81QESy6T/um0XNyUR Q==;
X-CSE-ConnectionGUID: fLUeimOmRP+TSCbQFyFpnA==
X-CSE-MsgGUID: IL/tDl3KR3eTo/iyEohnEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68787902"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="68787902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:24:02 -0800
X-CSE-ConnectionGUID: 1DP/q8OUSOaiDbgrzWpjsw==
X-CSE-MsgGUID: +4l+nVOsSCmGCnreoNkZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209393799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 15 Jan 2026 02:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vgKWB-00000000HqG-0nOs;
 Thu, 15 Jan 2026 10:23:55 +0000
Date: Thu, 15 Jan 2026 18:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202601151700.IjgxseKd-lkp@intel.com>
References: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] phy: qcom-sgmii-eth: add
 .set_mode() and .validate() methods
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

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260115-054728
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vg4vs-00000003SFt-1Fje%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
config: powerpc-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151700.IjgxseKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151700.IjgxseKd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_SGMII'
     294 |         if (submode == PHY_INTERFACE_MODE_SGMII ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:295:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_1000BASEX'
     295 |             submode == PHY_INTERFACE_MODE_1000BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:298:17: error: use of undeclared identifier 'PHY_INTERFACE_MODE_2500BASEX'
     298 |         if (submode == PHY_INTERFACE_MODE_2500BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/PHY_INTERFACE_MODE_SGMII +294 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

   288	
   289	static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
   290	{
   291		if (mode != PHY_MODE_ETHERNET)
   292			return -EINVAL;
   293	
 > 294		if (submode == PHY_INTERFACE_MODE_SGMII ||
 > 295		    submode == PHY_INTERFACE_MODE_1000BASEX)
   296			return SPEED_1000;
   297	
 > 298		if (submode == PHY_INTERFACE_MODE_2500BASEX)
   299			return SPEED_2500;
   300	
   301		return -EINVAL;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
