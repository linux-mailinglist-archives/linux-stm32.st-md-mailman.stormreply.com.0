Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64027B48D2
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Oct 2023 19:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F8FEC6B460;
	Sun,  1 Oct 2023 17:21:56 +0000 (UTC)
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85529C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Oct 2023 17:21:55 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 6AC07100092; Sun,  1 Oct 2023 18:21:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1696180914; bh=fmmbBcKFOGuzoHOa2DXFF4bJYUXHzDbTMg4QwhNR9/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lf5hY5+iOE0ePrLTAj1raG3VeaKenQpZ4y1toKOxf4a+wxUW/K6lyp1W5qX4czCeg
 2WUiacdaqdef9XjlBlvLraa6gYtvycdPM7oCM8j111y1mNHTmEapQsWz0cvEvfK+0f
 RCJk5Xhnd0ONZvBalMt7zuVja88EHL92lHsPCJcJM0C0xX9zXrPcGxZ2lU0Kyq37RB
 04rMcZCwhODjLsW7F1gBuIoeXzysulxOBxoEDbMNWcure0ghIvjMvKy3sJDvgFethQ
 2K63Mwb4NZVmLkj4oip8jxh5L5Yp1+9mDS9L9EjuAlJMX+5Onp7H8s4KyzKanFhjc5
 Ehed2s+3JgOlA==
Date: Sun, 1 Oct 2023 18:21:54 +0100
From: Sean Young <sean@mess.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <ZRmqsl+ZyVEtlPbF@gofer.mess.org>
References: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <202310012348.puyNjoMk-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202310012348.puyNjoMk-lkp@intel.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
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

On Mon, Oct 02, 2023 at 12:07:58AM +0800, kernel test robot wrote:
> Hi Sean,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on thierry-reding-pwm/for-next]
> [also build test ERROR on shawnguo/for-next atorgue-stm32/stm32-next media-tree/master linus/master v6.6-rc3 next-20230929]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

There are indeed some configs in which there are build errors if
CONFIG_PWM is disabled, I'll fix it in the next version.

In the mean time it would be great to have some feedback on this patch,
and see if there is any other rework needed.

Thanks
Sean

> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Young/media-pwm-ir-tx-trigger-edges-from-hrtimer-interrupt-context/20231001-194056
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git for-next
> patch link:    https://lore.kernel.org/r/1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean%40mess.org
> patch subject: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic context
> config: i386-buildonly-randconfig-004-20231001 (https://download.01.org/0day-ci/archive/20231001/202310012348.puyNjoMk-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310012348.puyNjoMk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310012348.puyNjoMk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/percpu.h:27:0,
>                     from arch/x86/include/asm/current.h:10,
>                     from include/linux/sched.h:12,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from include/linux/backlight.h:12,
>                     from drivers/video/fbdev/ssd1307fb.c:8:
>    include/linux/pwm.h: In function 'pwm_apply_state':
>    include/linux/pwm.h:428:17: error: implicit declaration of function 'pwm_can_sleep'; did you mean 'gpiod_cansleep'? [-Werror=implicit-function-declaration]
>      might_sleep_if(pwm_can_sleep(pwm));
>                     ^
>    include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
>     #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
>                                           ^~~~
>    In file included from drivers/video/fbdev/ssd1307fb.c:16:0:
>    include/linux/pwm.h: At top level:
> >> include/linux/pwm.h:455:20: error: conflicting types for 'pwm_can_sleep'
>     static inline bool pwm_can_sleep(struct pwm_device *pwm)
>                        ^~~~~~~~~~~~~
>    In file included from arch/x86/include/asm/percpu.h:27:0,
>                     from arch/x86/include/asm/current.h:10,
>                     from include/linux/sched.h:12,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from include/linux/backlight.h:12,
>                     from drivers/video/fbdev/ssd1307fb.c:8:
>    include/linux/pwm.h:428:17: note: previous implicit declaration of 'pwm_can_sleep' was here
>      might_sleep_if(pwm_can_sleep(pwm));
>                     ^
>    include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
>     #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
>                                           ^~~~
>    cc1: some warnings being treated as errors
> --
>    In file included from arch/x86/include/asm/percpu.h:27:0,
>                     from arch/x86/include/asm/preempt.h:6,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/slab.h:16,
>                     from include/linux/resource_ext.h:11,
>                     from include/linux/acpi.h:13,
>                     from include/linux/i2c.h:13,
>                     from drivers/mfd/intel_soc_pmic_crc.c:11:
>    include/linux/pwm.h: In function 'pwm_apply_state':
>    include/linux/pwm.h:428:17: error: implicit declaration of function 'pwm_can_sleep'; did you mean 'cant_sleep'? [-Werror=implicit-function-declaration]
>      might_sleep_if(pwm_can_sleep(pwm));
>                     ^
>    include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
>     #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
>                                           ^~~~
>    In file included from drivers/mfd/intel_soc_pmic_crc.c:18:0:
>    include/linux/pwm.h: At top level:
> >> include/linux/pwm.h:455:20: error: conflicting types for 'pwm_can_sleep'
>     static inline bool pwm_can_sleep(struct pwm_device *pwm)
>                        ^~~~~~~~~~~~~
>    In file included from arch/x86/include/asm/percpu.h:27:0,
>                     from arch/x86/include/asm/preempt.h:6,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/slab.h:16,
>                     from include/linux/resource_ext.h:11,
>                     from include/linux/acpi.h:13,
>                     from include/linux/i2c.h:13,
>                     from drivers/mfd/intel_soc_pmic_crc.c:11:
>    include/linux/pwm.h:428:17: note: previous implicit declaration of 'pwm_can_sleep' was here
>      might_sleep_if(pwm_can_sleep(pwm));
>                     ^
>    include/linux/kernel.h:194:39: note: in definition of macro 'might_sleep_if'
>     #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
>                                           ^~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +/pwm_can_sleep +455 include/linux/pwm.h
> 
>    454	
>  > 455	static inline bool pwm_can_sleep(struct pwm_device *pwm)
>    456	{
>    457		return true;
>    458	}
>    459	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
