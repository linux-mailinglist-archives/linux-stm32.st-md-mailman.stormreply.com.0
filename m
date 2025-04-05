Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B9A7CC1A
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 00:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C701C78F88;
	Sat,  5 Apr 2025 22:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4234CC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Apr 2025 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743891368; x=1775427368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xXUS4GgMNiPbO1jwMYGA+GWr2ekyWvBCCBz0RyIJHDM=;
 b=IdTUfIDaERIc4PkgcuDYdc5f+y/RkZJQ25fmwxVoeTRgz6KzNZHo+m6T
 JUUOx0gPWcbp+CiW095TMehRnxLSyaOwxddHqlucsljqXZkCr+Hj5EgGT
 rZdmuVU0nZfQUa+ZksjaFUSzKyB3jCaOijvxd504xAS0A/68Hstb2yJ+R
 m2FYcunpiII2LiJsanLOBGHKVSNC/XeA2WYIJTrpRE76iE1d1Uz/IyBYL
 igS96OmxKwuX+vmWdabXjkodZoXz1fcjNBY6zshE1HlQv3juzYzsZ2PPz
 81ssRRb6wZueIzRkUe4R7tyZxU8ojiRvZmQjkPwCSh8kSVpoBOlx+ymor g==;
X-CSE-ConnectionGUID: UmXclE7uS0ySOi7qfnn9UA==
X-CSE-MsgGUID: 3H17jUZ4SRORYgrdT02uVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48018099"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="48018099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 15:16:06 -0700
X-CSE-ConnectionGUID: g4MEpJ50TTiUgcuNLPmOSw==
X-CSE-MsgGUID: C0wrrevxTpKJWYkd9AmLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="128116775"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 05 Apr 2025 15:16:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u1Bo2-0002Jz-06;
 Sat, 05 Apr 2025 22:16:02 +0000
Date: Sun, 6 Apr 2025 06:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
Message-ID: <202504060517.dHXuUANs-lkp@intel.com>
References: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
config: arm-randconfig-004-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060517.dHXuUANs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060517.dHXuUANs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060517.dHXuUANs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from include/linux/mfd/stm32-timers.h:11,
                    from drivers/pwm/pwm-stm32.c:12:
   drivers/pwm/pwm-stm32.c: In function 'stm32_pwm_round_waveform_fromhw':
>> drivers/pwm/pwm-stm32.c:246:60: error: 'rate' undeclared (first use in this function)
     246 |   pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                            ^~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   drivers/pwm/pwm-stm32.c:245:2: note: in expansion of macro 'dev_dbg'
     245 |  dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
         |  ^~~~~~~
   drivers/pwm/pwm-stm32.c:246:60: note: each undeclared identifier is reported only once for each function it appears in
     246 |   pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                            ^~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   drivers/pwm/pwm-stm32.c:245:2: note: in expansion of macro 'dev_dbg'
     245 |  dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
         |  ^~~~~~~


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
