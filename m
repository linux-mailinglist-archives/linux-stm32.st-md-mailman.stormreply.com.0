Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7595A7B4823
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Oct 2023 16:44:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29D1FC6B460;
	Sun,  1 Oct 2023 14:44:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83333C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Oct 2023 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696171451; x=1727707451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eaZ6EntjZndNXd4oKfdQ0McHn3ig2hRV/qhNZ2cj228=;
 b=Pj/CbjEOs2hkMPRr8CaqC/hqziBdDZBfJsghz/NJeJ8RG0/foraplMjz
 LR3lT86eUyy4/G9mSQovbyTUXO4aNj6mfj8zPgRAIPQFiDuFVPfTbf9uQ
 Olxc9jlTWqgZPgRSysV2Xcfv8/+EgV8r/OXoe986d7Lq0CWyTGSjTK096
 FsvcgYlxAQtoRSrKkqCU9xuNmHhDpVkSOlbMffKVKGCSMQnOPtIfaLzYu
 ihzVQEa5qdB5fB0aR4pEQjPOLFLky31whHiBtbA+OEziNcsEvn3ACdUmA
 l6xp1mh4PNNtgb6s6WccX1/djbtWXvKXKdG2oYd+33nu4YLZEUhCUPP9q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="361906865"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; d="scan'208";a="361906865"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 07:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840769901"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; d="scan'208";a="840769901"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2023 07:44:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qmxfo-00058N-1r;
 Sun, 01 Oct 2023 14:43:57 +0000
Date: Sun, 1 Oct 2023 22:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202310012229.ldJwkjOY-lkp@intel.com>
References: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
Cc: linux-pwm@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: make it possible to apply pwm
 changes in atomic context
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

kernel test robot noticed the following build errors:

[auto build test ERROR on thierry-reding-pwm/for-next]
[also build test ERROR on shawnguo/for-next atorgue-stm32/stm32-next media-tree/master linus/master v6.6-rc3 next-20230929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Young/media-pwm-ir-tx-trigger-edges-from-hrtimer-interrupt-context/20231001-194056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
patch link:    https://lore.kernel.org/r/1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean%40mess.org
patch subject: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic context
config: arm-randconfig-002-20231001 (https://download.01.org/0day-ci/archive/20231001/202310012229.ldJwkjOY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310012229.ldJwkjOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310012229.ldJwkjOY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/input/misc/da7280.c:12:
   include/linux/pwm.h: In function 'pwm_apply_state':
>> include/linux/pwm.h:428:24: error: implicit declaration of function 'pwm_can_sleep'; did you mean 'cant_sleep'? [-Werror=implicit-function-declaration]
     428 |         might_sleep_if(pwm_can_sleep(pwm));
         |                        ^~~~~~~~~~~~~
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
     194 | #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
         |                                       ^~~~
   In file included from drivers/input/misc/da7280.c:16:
   include/linux/pwm.h: At top level:
>> include/linux/pwm.h:455:20: error: conflicting types for 'pwm_can_sleep'; have 'bool(struct pwm_device *)' {aka '_Bool(struct pwm_device *)'}
     455 | static inline bool pwm_can_sleep(struct pwm_device *pwm)
         |                    ^~~~~~~~~~~~~
   include/linux/pwm.h:428:24: note: previous implicit declaration of 'pwm_can_sleep' with type 'int()'
     428 |         might_sleep_if(pwm_can_sleep(pwm));
         |                        ^~~~~~~~~~~~~
   include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
     194 | #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
         |                                       ^~~~
   cc1: some warnings being treated as errors


vim +428 include/linux/pwm.h

   419	
   420	struct pwm_device *devm_pwm_get(struct device *dev, const char *con_id);
   421	struct pwm_device *devm_fwnode_pwm_get(struct device *dev,
   422					       struct fwnode_handle *fwnode,
   423					       const char *con_id);
   424	#else
   425	static inline int pwm_apply_state(struct pwm_device *pwm,
   426					  const struct pwm_state *state)
   427	{
 > 428		might_sleep_if(pwm_can_sleep(pwm));
   429		return -ENOTSUPP;
   430	}
   431	
   432	static inline int pwm_adjust_config(struct pwm_device *pwm)
   433	{
   434		return -ENOTSUPP;
   435	}
   436	
   437	static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
   438				     int period_ns)
   439	{
   440		might_sleep_if(pwm_can_sleep(pwm));
   441		return -EINVAL;
   442	}
   443	
   444	static inline int pwm_enable(struct pwm_device *pwm)
   445	{
   446		might_sleep_if(pwm_can_sleep(pwm));
   447		return -EINVAL;
   448	}
   449	
   450	static inline void pwm_disable(struct pwm_device *pwm)
   451	{
   452		might_sleep_if(pwm_can_sleep(pwm));
   453	}
   454	
 > 455	static inline bool pwm_can_sleep(struct pwm_device *pwm)
   456	{
   457		return true;
   458	}
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
