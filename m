Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6969A7CCD1
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 06:59:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64FDEC78F89;
	Sun,  6 Apr 2025 04:59:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A2C1C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Apr 2025 04:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743915578; x=1775451578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jZis5iEY4tCqO7K5vNNJgbuHf7Bs+RX9cH+CAloWBw4=;
 b=J6Yo7pOFYh2fWUv/OM3ecRzWOri2gwVnr5OlhjZEqlgMpIhWz5YVhlsb
 wmqDmO5H9tYg9k3aoZsGM3xPj9FIxZUFW+519CWpnbqimw3A8MiN97HnU
 1QkGFHkPmWGVkWSYWo74aKo759fZVT1oAkP0e7uT1/bSP9Pu+HVbbFLSp
 fPPcFYcqsC8114Z7XGt5masqOPw7KgyQDn+jp6X1gLUvt7t1x7sb+5Vaw
 hG6yacbhJjVjmiix5Wp7Lbx/u8i1x+Yu+ipgI0lrofU7dBsn91Q34dGPb
 3j3JVfK/QqIE1Ub8fVHdSHkRSBTpfG69fDF3E+9W4GbHQXVArCeK8yknF w==;
X-CSE-ConnectionGUID: hO0thw0dSci02HWuaD1Paw==
X-CSE-MsgGUID: iraAlsiAQlihwvAF/bKGPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="32920572"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="32920572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 21:59:36 -0700
X-CSE-ConnectionGUID: XcWY63J2Sva7cCOgaeGbMg==
X-CSE-MsgGUID: 6LxQWgP9QB2dhRy8soqyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="127630024"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 21:59:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u1I6W-0002Rr-06;
 Sun, 06 Apr 2025 04:59:32 +0000
Date: Sun, 6 Apr 2025 12:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
Message-ID: <202504061207.97zbNPvV-lkp@intel.com>
References: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] pwm: stm32: Emit debug output also
 for corner cases of the rounding callbacks
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

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on e48e99b6edf41c69c5528aa7ffb2daf3c59ee105]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/pwm-Let-pwm_set_waveform-succeed-even-if-lowlevel-driver-rounded-up/20250405-173024
base:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
patch link:    https://lore.kernel.org/r/fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases of the rounding callbacks
config: x86_64-buildonly-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061207.97zbNPvV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061207.97zbNPvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061207.97zbNPvV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-stm32.c:246:60: error: use of undeclared identifier 'rate'
     246 |                 pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                                          ^
   1 error generated.


vim +/rate +246 drivers/pwm/pwm-stm32.c

   208	
   209	static int stm32_pwm_round_waveform_fromhw(struct pwm_chip *chip,
   210						   struct pwm_device *pwm,
   211						   const void *_wfhw,
   212						   struct pwm_waveform *wf)
   213	{
   214		const struct stm32_pwm_waveform *wfhw = _wfhw;
   215		struct stm32_pwm *priv = to_stm32_pwm_dev(chip);
   216		unsigned int ch = pwm->hwpwm;
   217	
   218		if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
   219			unsigned long rate = clk_get_rate(priv->clk);
   220			u64 ccr_ns;
   221	
   222			/* The result doesn't overflow for rate >= 15259 */
   223			wf->period_length_ns = stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * (wfhw->arr + 1),
   224										     NSEC_PER_SEC, rate);
   225	
   226			ccr_ns = stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * wfhw->ccr,
   227								       NSEC_PER_SEC, rate);
   228	
   229			if (wfhw->ccer & TIM_CCER_CCxP(ch + 1)) {
   230				wf->duty_length_ns =
   231					stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * (wfhw->arr + 1 - wfhw->ccr),
   232									      NSEC_PER_SEC, rate);
   233	
   234				wf->duty_offset_ns = ccr_ns;
   235			} else {
   236				wf->duty_length_ns = ccr_ns;
   237				wf->duty_offset_ns = 0;
   238			}
   239		} else {
   240			*wf = (struct pwm_waveform){
   241				.period_length_ns = 0,
   242			};
   243		}
   244	
   245		dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
 > 246			pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
   247			wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
