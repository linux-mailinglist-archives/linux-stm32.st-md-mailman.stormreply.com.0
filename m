Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 395F078D3AE
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 09:41:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC702C6A613;
	Wed, 30 Aug 2023 07:41:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3518C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693381277; x=1724917277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5QX2utJhe//XqFa+InE4SbM4WETASb0Mj1a/b7o6gis=;
 b=PKAO1sL7fzsIf+3huGliMFswI2hox5Zfbm+RazCgef7ymsjJWErXj32a
 JPhymOrJQOh7SJtasAVAW95fM53OneHMJEdnu4R/Lz74soZbHPemi7F93
 Vjd8ARq+klEYHl/ZQjVJbNst85X4GVLiIZ1N95aCUjwAAfKE2oViNgpmX
 acvoTZrWZfxzz6DtAV+T1r/vpmuJPC0Vhq+2RgZ41cc9KGI7sykKZUGui
 KQQ02whercrr/rBVLWX0W+WjYyBjfpxgPnlFFoo8D559fsY+LW/uAZ1Xw
 70mHVGJyrHHdNJiZzsNSONmAMryUeVZnnQqv13EFhDCAb8MduWLjLSjXY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374479608"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="374479608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 00:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069745573"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="1069745573"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 00:40:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qbFoa-0009Zd-0z;
 Wed, 30 Aug 2023 07:40:36 +0000
Date: Wed, 30 Aug 2023 15:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, william.gray@linaro.org,
 lee@kernel.org
Message-ID: <202308301541.ZqWpJdto-lkp@intel.com>
References: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
[also build test WARNING on v6.5 next-20230830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/counter-chrdev-fix-getting-array-extensions/20230829-230111
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829134029.2402868-9-fabrice.gasnier%40foss.st.com
patch subject: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
config: arm-randconfig-001-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301541.ZqWpJdto-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301541.ZqWpJdto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301541.ZqWpJdto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/counter/stm32-timer-cnt.c:528:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
   drivers/counter/stm32-timer-cnt.c:528:2: note: insert '__attribute__((fallthrough));' to silence this warning
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/counter/stm32-timer-cnt.c:528:2: note: insert 'break;' to avoid fall-through
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
         |         break; 
   1 warning generated.


vim +528 drivers/counter/stm32-timer-cnt.c

   516	
   517	static int stm32_count_watch_validate(struct counter_device *counter,
   518					      const struct counter_watch *watch)
   519	{
   520		struct stm32_timer_cnt *const priv = counter_priv(counter);
   521	
   522		switch (watch->event) {
   523		case COUNTER_EVENT_CAPTURE:
   524			if (watch->channel >= priv->nchannels) {
   525				dev_err(counter->parent, "Invalid channel %d\n", watch->channel);
   526				return -EINVAL;
   527			}
 > 528		case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
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
