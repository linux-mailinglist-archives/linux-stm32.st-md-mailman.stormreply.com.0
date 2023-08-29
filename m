Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D381678CB9C
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 20:00:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B03C6A60C;
	Tue, 29 Aug 2023 18:00:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74133C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693332051; x=1724868051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Li1t9Xs9+ZlNzSrfJujiGlWo959VLxYmazSAAODNF44=;
 b=H1YLJlQ2Vg6WsZkZon4DXCQOZ5/brOLC6KvJr89RB8xLr6ZFbnF0V7X6
 8fMrIe1mTfWmcWmDwaoVJ1jLs9zI5L9oGz72Ez48gCVjbWrh+spJUqCLi
 Btjh/3s7W+bZPGdZAtOIa1zzYmltBxCFCVkLzgznbnQeic9iy+6yXHxus
 rxSYSZDbKyiiXrQF7k4FhTxioOzmkNNOsQjlmLgyrSHWu2FJXK9Br8UFa
 nUFEd7PTKdTGYG/61i/CPRehQb57rBoszRDIhV+uhz7Q+W/gl0Qsz0/h7
 O00a5u49Jifk2M4bt3OYX4eDQclXur/0Dhh8gd+r4L9NdalxSCLNNhPlb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461819603"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="461819603"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 11:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853381425"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="853381425"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2023 11:00:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qb31C-0008yp-1F;
 Tue, 29 Aug 2023 18:00:46 +0000
Date: Wed, 30 Aug 2023 02:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, william.gray@linaro.org,
 lee@kernel.org
Message-ID: <202308300133.jtLeSGia-lkp@intel.com>
References: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 8/8] counter: stm32-timer-cnt: add support
	for events
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

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/counter-chrdev-fix-getting-array-extensions/20230829-230111
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829134029.2402868-9-fabrice.gasnier%40foss.st.com
patch subject: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300133.jtLeSGia-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300133.jtLeSGia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300133.jtLeSGia-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/counter/stm32-timer-cnt.c: In function 'stm32_count_watch_validate':
>> drivers/counter/stm32-timer-cnt.c:524:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     524 |                 if (watch->channel >= priv->nchannels) {
         |                    ^
   drivers/counter/stm32-timer-cnt.c:528:9: note: here
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^~~~


vim +524 drivers/counter/stm32-timer-cnt.c

   516	
   517	static int stm32_count_watch_validate(struct counter_device *counter,
   518					      const struct counter_watch *watch)
   519	{
   520		struct stm32_timer_cnt *const priv = counter_priv(counter);
   521	
   522		switch (watch->event) {
   523		case COUNTER_EVENT_CAPTURE:
 > 524			if (watch->channel >= priv->nchannels) {
   525				dev_err(counter->parent, "Invalid channel %d\n", watch->channel);
   526				return -EINVAL;
   527			}
   528		case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
   529			return 0;
   530		default:
   531			return -EINVAL;
   532		}
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
