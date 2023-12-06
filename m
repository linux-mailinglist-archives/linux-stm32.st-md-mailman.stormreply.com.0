Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A7E8070E1
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 14:27:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C8D6C6C85F;
	Wed,  6 Dec 2023 13:27:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7FF9C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701869264; x=1733405264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XUkNikLFxkRI2x0E4jzYEYV2cFpsJJkbcOTQSt8BVn8=;
 b=aclm0dluExDFJZQoCs9EeS0EL8+kvu3K0L9xey4msiXrnttNEPupDsaz
 mcUtaNWixmu2YiBss22zaYf+hzpefBCaOP4IZmorQdKEd9bv8aRj3CTR1
 aVb0lEeonTCzbCz/XP8WbLyoOz3nMU5p/CLK6ArEHZtHeFGALOR9l3owv
 XzpL3Pz0d5JFNJT1FhFM95WEGeIU8g1J22hn6oTNaHYmJxFtzP38eC+n0
 HE/P400VeOuJPPM+UgvfzbeXLh8b9TqFEslsei2FsjZbpe7EOB13i7VTM
 t65E5vVFmIxAxpIDoN4fwqMhs14y7B66+LUMqLqNY3wLORSqEI2xB1Sd4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="930981"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="930981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721084909"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="721084909"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 06 Dec 2023 05:27:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rArw8-000Apo-2W;
 Wed, 06 Dec 2023 13:27:36 +0000
Date: Wed, 6 Dec 2023 21:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: gabriel.fernandez@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Message-ID: <202312062107.FZNn2b0i-lkp@intel.com>
References: <20231128164851.588315-5-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128164851.588315-5-gabriel.fernandez@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 4/5] clk: stm32: introduce clocks for
 STM32MP257 platform
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gabriel-fernandez-foss-st-com/clk-stm32mp1-move-stm32mp1-clock-driver-into-stm32-directory/20231129-005157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231128164851.588315-5-gabriel.fernandez%40foss.st.com
patch subject: [PATCH v4 4/5] clk: stm32: introduce clocks for STM32MP257 platform
config: arm-randconfig-r132-20231201 (https://download.01.org/0day-ci/archive/20231206/202312062107.FZNn2b0i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062107.FZNn2b0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062107.FZNn2b0i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/stm32/clk-stm32mp25.c:1003:5: sparse: sparse: symbol 'stm32mp25_cpt_gate' was not declared. Should it be static?
>> drivers/clk/stm32/clk-stm32mp25.c:1005:29: sparse: sparse: symbol 'stm32mp25_clock_data' was not declared. Should it be static?
>> drivers/clk/stm32/clk-stm32mp25.c:1011:29: sparse: sparse: symbol 'stm32mp25_reset_data' was not declared. Should it be static?

vim +/stm32mp25_cpt_gate +1003 drivers/clk/stm32/clk-stm32mp25.c

  1002	
> 1003	u16 stm32mp25_cpt_gate[GATE_NB];
  1004	
> 1005	struct clk_stm32_clock_data stm32mp25_clock_data = {
  1006		.gate_cpt	= stm32mp25_cpt_gate,
  1007		.gates		= stm32mp25_gates,
  1008		.muxes		= stm32mp25_muxes,
  1009	};
  1010	
> 1011	struct clk_stm32_reset_data stm32mp25_reset_data = {
  1012		.reset_lines	= stm32mp25_reset_cfg,
  1013		.nr_lines	= ARRAY_SIZE(stm32mp25_reset_cfg),
  1014	};
  1015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
