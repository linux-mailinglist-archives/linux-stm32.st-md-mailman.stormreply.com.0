Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4858BBEE
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Aug 2022 19:13:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A59FC04001;
	Sun,  7 Aug 2022 17:13:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71ED4C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Aug 2022 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659892427; x=1691428427;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NElEcQw9ZRxqyFgN5yMpPdXrJCyEfJVYIuIlecHucOo=;
 b=TdhLNsttUzv8B95/ht57QHalkLxmkDfKibKj6H+TOYBikkPCtk70JUhh
 G7rRblCPx6nb+2R38XVAJIpouVE5kJkRgKzcWkInKenyXbgYFCcxSymn0
 b+bXlDgejRiPMMBq9fQbXdPM7ZUOpJEHqumKZJ23eYF7QR1IU0VG4UFr9
 PriPm/hYKubzLgMD6UTBb4RucqS1Rfz+bm01WOVyUcXsFQ+PZjpCZJBME
 RMDbUqjwm6y5p3uf0rmHmZ8h5weeKfPP6g2FT+ACqxkfuIqdSnAE7U6HP
 FzoAo4HO1kgpplgL5BsgkqGHAuRt/Ai/ts/+IqqkMXOpbFz4EfJiWj2qk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="270837839"
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; d="scan'208";a="270837839"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 10:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; d="scan'208";a="672213150"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 07 Aug 2022 10:13:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oKjqQ-000LVV-2V;
 Sun, 07 Aug 2022 17:13:42 +0000
Date: Mon, 8 Aug 2022 01:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>
Message-ID: <202208080127.BXcJl3Wk-lkp@intel.com>
References: <20220807145247.46107-27-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220807145247.46107-27-paul@crapouillou.net>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 26/28] mfd: stmpe: Remove #ifdef guards
 for PM related functions
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

Hi Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.19]
[cannot apply to lee-mfd/for-mfd-next linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220808/202208080127.BXcJl3Wk-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e94df3ff809e588320625b95a2ef6485965ddc02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Cercueil/mfd-Remove-ifdef-guards-for-PM-functions/20220807-225947
        git checkout e94df3ff809e588320625b95a2ef6485965ddc02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mfd/stmpe.c:1531:7: warning: duplicate 'const' declaration specifier [-Wduplicate-decl-specifier]
   const EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
         ^
   include/linux/pm.h:404:2: note: expanded from macro 'EXPORT_GPL_SIMPLE_DEV_PM_OPS'
           _EXPORT_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL, "_gpl", "")
           ^
   include/linux/pm.h:380:2: note: expanded from macro '_EXPORT_DEV_PM_OPS'
           _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, runtime_suspend_fn, \
           ^
   include/linux/pm.h:371:55: note: expanded from macro '_DEFINE_DEV_PM_OPS'
                              runtime_suspend_fn, runtime_resume_fn, idle_fn) \
                                                                              ^
   1 warning generated.


vim +/const +1531 drivers/mfd/stmpe.c

  1530	
> 1531	const EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
