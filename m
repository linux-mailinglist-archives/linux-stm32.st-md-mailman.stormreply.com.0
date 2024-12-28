Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A849FD900
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 06:12:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 511E2C78030;
	Sat, 28 Dec 2024 05:12:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BBEFC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 05:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735362766; x=1766898766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ioBF6btaLkebkM4HUjVJqFMRdhQwf4/nTJIficbpk6U=;
 b=ZtNe2EtvFwdOhu1O4Y7RQieK6+/FTt4JXDhCzODEcrywbxvVtinfAf/d
 hK1wgTHTcFyRAbq5tcrhkaojwBxzmPe8bHvrBUA2RMPoiF9UGfM75iVyj
 G8H2OXtevH8PP+zNo223VbWr51ydN3SQ0DzKsjtY+2WXQkfenV40LZ0tG
 txGzzwQiKJSXxxgwgdfrX88c4MDjGQMV/iANUzISGMiRGQnq2t19CWZXc
 AZ5u9akIERWgplM1gM+EQWfqiMBw3tKGPdCzh3OCnwBvnKsSg/vQqztJj
 6FT6izvkSs/nQoKrgZiRfzzPz4kzt6iNSB/gVn60DnydJVIjJlgSI4zts A==;
X-CSE-ConnectionGUID: j8zZV0AlSaCrAEH97wWAaw==
X-CSE-MsgGUID: p6f5HYoPRwSs5p8q+7DcBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35886912"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; d="scan'208";a="35886912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 21:12:38 -0800
X-CSE-ConnectionGUID: h4uyA0ddSTuuZ4tzLd9DvQ==
X-CSE-MsgGUID: Go8sLyvHTGyzRo44j8EaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131267180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 21:12:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tRP7m-0003rw-0r;
 Sat, 28 Dec 2024 05:12:30 +0000
Date: Sat, 28 Dec 2024 13:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Message-ID: <202412281211.h6tPLOqJ-lkp@intel.com>
References: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>
Cc: linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-input@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/12] input: keyboard: omap4_keypad: Use
 devm_pm_set_wake_irq
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

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/PM-sleep-wakeirq-Introduce-device-managed-variant-of-dev_pm_set_wake_irq/20241228-091859
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241228-wake_irq-v1-3-09cfca77cd47%40nxp.com
patch subject: [PATCH 03/12] input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
config: i386-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281211.h6tPLOqJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "devm_pm_set_wake_irq" [drivers/input/keyboard/omap4-keypad.ko] undefined!
WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
