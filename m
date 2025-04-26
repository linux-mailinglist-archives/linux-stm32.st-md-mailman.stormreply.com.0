Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABDA9D8EA
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Apr 2025 09:01:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E20C78F8C;
	Sat, 26 Apr 2025 07:01:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35F0C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Apr 2025 07:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745650908; x=1777186908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GP0K1Rv9ZXdHQPB5bmi50oLNLtVvYZGG8O2PcVpf/mg=;
 b=DPqbtsDtMn7mG+NxpSi9JMY39AkSC9D+syVF6INuYFtVkMdWrHluSkNq
 n+pNKd/K1toLu9pgxpp9W+4oHzgV9LOAPGqsUGXHKEE7fsCg/OD0ufG+W
 3/WwzzJzEQEV4C/vDOgqMMAnbjMvGqYGv+MISwUAjZXJb6BCSAyTqmN8d
 doyW1IKxNZUHbXaZFu/bh5LKHTMNhG+Kx0uL1djUQrf5NgNhSmxL2W/qE
 B4yw0VHN9N46it3wJjU7IzLipm4Uze0BdS8+xekjJNK9NgtY60R2osWsK
 IbCmxH1fjn6mppeP/sd3cyHKZhwAE6SfUf5/kUScPYbt1tV6NuFhno6BR A==;
X-CSE-ConnectionGUID: cGWI/kpeSxi8r36rLhsHLQ==
X-CSE-MsgGUID: /ED+hkY6RdOmcWG89k+Xfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51112567"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="51112567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 00:01:46 -0700
X-CSE-ConnectionGUID: UB3CB3T6QZWK5LSf3Zj6Ag==
X-CSE-MsgGUID: ALlMkpTIRLKP8WKzX6udoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; d="scan'208";a="138238692"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 26 Apr 2025 00:01:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u8ZXe-0005lJ-18;
 Sat, 26 Apr 2025 07:01:38 +0000
Date: Sat, 26 Apr 2025 15:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, lee@kernel.org,
 alexandre.torgue@foss.st.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Message-ID: <202504261456.aCATBoYN-lkp@intel.com>
References: <20250425124755.166193-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250425124755.166193-4-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 krzk+dt@kernel.org, will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 3/7] clocksource: stm32-lptimer: add
 support for stm32mp25
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

Hi Fabrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.15-rc3 next-20250424]
[cannot apply to atorgue-stm32/stm32-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/dt-bindings-mfd-stm32-lptimer-add-support-for-stm32mp25/20250425-210409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250425124755.166193-4-fabrice.gasnier%40foss.st.com
patch subject: [PATCH v5 3/7] clocksource: stm32-lptimer: add support for stm32mp25
config: arm-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261456.aCATBoYN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261456.aCATBoYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-stm32-lp.c:57:6: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^    ~
   drivers/clocksource/timer-stm32-lp.c:57:6: note: add parentheses after the '!' to evaluate the bitwise operator first
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^                        
         |              (                       )
   drivers/clocksource/timer-stm32-lp.c:57:6: note: add parentheses around left hand side expression to silence this warning
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^
         |             (   )
   1 warning generated.


vim +57 drivers/clocksource/timer-stm32-lp.c

    50	
    51	static int stm32mp25_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
    52	{
    53		int ret;
    54		u32 val;
    55	
    56		regmap_read(priv->reg, STM32_LPTIM_CR, &val);
  > 57		if (!val & STM32_LPTIM_ENABLE) {
    58			/* Enable LPTIMER to be able to write into IER and ARR registers */
    59			regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
    60			/*
    61			 * After setting the ENABLE bit, a delay of two counter clock cycles is needed
    62			 * before the LPTIM is actually enabled. For 32KHz rate, this makes approximately
    63			 * 62.5 micro-seconds, round it up.
    64			 */
    65			udelay(63);
    66		}
    67		/* set next event counter */
    68		regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
    69		/* enable ARR interrupt */
    70		regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
    71	
    72		/* Poll DIEROK and ARROK to ensure register access has completed */
    73		ret = regmap_read_poll_timeout_atomic(priv->reg, STM32_LPTIM_ISR, val,
    74						      (val & STM32_LPTIM_DIEROK_ARROK) ==
    75						      STM32_LPTIM_DIEROK_ARROK,
    76						      10, 500);
    77		if (ret) {
    78			dev_err(priv->dev, "access to LPTIM timed out\n");
    79			/* Disable LPTIMER */
    80			regmap_write(priv->reg, STM32_LPTIM_CR, 0);
    81			return ret;
    82		}
    83		/* Clear DIEROK and ARROK flags */
    84		regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_DIEROKCF_ARROKCF);
    85	
    86		return 0;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
