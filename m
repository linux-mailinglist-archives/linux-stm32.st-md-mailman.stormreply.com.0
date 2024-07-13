Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC293030C
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jul 2024 03:39:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F93C6DD6B;
	Sat, 13 Jul 2024 01:39:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E07ABC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720834748; x=1752370748;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WFoMEnzTETrjQMD90rMoI4syPE64SpiNnX2O5Zarsdo=;
 b=NHPDs0/Pum3wRU54dDaLSGITVC5H1GUWa0bAzxwL1KFGiq+oJ5CWW3CF
 PmsdSuERkc2oP0pqTy09EUPKZCxVWkQKVWSZSUGozZ4RvZqnWFHMa+Exj
 mfxfgU6jI9SxEOyj94WB1kaWFjPzB18yoLIkzY3eQu/Im4zr4jfhkwQ0S
 yECRSmLuljazRCDgyp17E6hqNazvkkssMTFYtf25QfbQGbgpmB+wDQ+ju
 j/RGySjb281uLFkvA7O3appcKVbslkExqxvRxj0Cs50avJQHnyut+s/l5
 1zAcRvZ0iT0Y2nnhGtI9l9HcxXko3Ei4wDp6uuOJuBLYqG382NoGoc+ar g==;
X-CSE-ConnectionGUID: BPXn05nmTYqOyO0Pk20mJQ==
X-CSE-MsgGUID: fCqQHOP0TXS0JoeTrZAtcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18138900"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="18138900"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 18:39:00 -0700
X-CSE-ConnectionGUID: QXUKavKzR9iBG3VWeemIKQ==
X-CSE-MsgGUID: SgItW86wTn6IMnsyYgT4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="49072484"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 12 Jul 2024 18:38:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sSRix-000bX4-0N;
 Sat, 13 Jul 2024 01:38:55 +0000
Date: Sat, 13 Jul 2024 09:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202407130943.ie6n2Orh-lkp@intel.com>
References: <20240711140843.3201530-3-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-3-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] rtc: stm32: add pinctrl and pinmux
	interfaces
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

Hi Valentin,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.10-rc7 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240711-233937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240711140843.3201530-3-valentin.caron%40foss.st.com
patch subject: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: i386-buildonly-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130943.ie6n2Orh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130943.ie6n2Orh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130943.ie6n2Orh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_pinctrl_register_and_init
   >>> referenced by rtc-stm32.c
   >>>               drivers/rtc/rtc-stm32.o:(stm32_rtc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: pinctrl_enable
   >>> referenced by rtc-stm32.c
   >>>               drivers/rtc/rtc-stm32.o:(stm32_rtc_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
