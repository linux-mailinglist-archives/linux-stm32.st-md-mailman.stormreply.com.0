Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E747A900F90
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jun 2024 06:45:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94F44C712A2;
	Sat,  8 Jun 2024 04:45:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A9DC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jun 2024 04:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717821919; x=1749357919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NwIBSgN012cg278cQekaAqgO/G/C8N0xznx9WA+9OAE=;
 b=DLh5IWndLLp5GLlSkUMAwptWUt5T1taFmGs46mOKyGHqGfZd7Z6vNBUF
 htGZhYVbv+wVix60XT7NPuYaYI2tsnUuo6hOR8UFpvI4kkH3V1ZvfIE+r
 7RN4jI/Zn69KJSPnNHKPeMzlmmAy3I1cS3JUUkwNJWyTTsUJ0//exjjfg
 MDM8080MjL6N0VmrJawbH3vE855w5YnoGq618w/o4q1eACAb3Te/b1P8/
 SRbsgcejyJE7Rl1bhfR9clYj7EZpB0LPIMD8XHqUWNMdg8ZKCtEO3WWt4
 o6zJsMwo6go768X2ITJNZtIv5t7Yvckb0y/ZuD1gE1itq3lUTvZBc5+7s A==;
X-CSE-ConnectionGUID: fgddPz8pT4GZLx9IZp9KDA==
X-CSE-MsgGUID: +nq2orUiSuCvWZ5TwNgOug==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32048700"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="32048700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 21:45:11 -0700
X-CSE-ConnectionGUID: oFNwwNMPRs+Vl995yiH1qA==
X-CSE-MsgGUID: SVmaGNLQRFij+Ekypuz7+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="42963533"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 21:45:08 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sFnwv-00011O-2R;
 Sat, 08 Jun 2024 04:45:05 +0000
Date: Sat, 8 Jun 2024 12:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202406081214.qFAil90A-lkp@intel.com>
References: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 5/5] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

Hi Arnaud,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20240607-183305
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240607093326.369090-6-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v6 5/5] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240608/202406081214.qFAil90A-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081214.qFAil90A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081214.qFAil90A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/stm32_rproc.c:9:
>> arch/s390/include/asm/bug.h:53:21: error: expected declaration specifiers or '...' before '{' token
      53 | #define WARN_ON(x) ({                                   \
         |                     ^
   include/linux/tee_remoteproc.h:94:9: note: in expansion of macro 'WARN_ON'
      94 |         WARN_ON(1);
         |         ^~~~~~~
   In file included from drivers/remoteproc/stm32_rproc.c:23:
   include/linux/tee_remoteproc.h:96:9: error: expected identifier or '(' before 'return'
      96 |         return NULL;
         |         ^~~~~~
   include/linux/tee_remoteproc.h:97:1: error: expected identifier or '(' before '}' token
      97 | }
         | ^
   drivers/remoteproc/stm32_rproc.c:717:34: error: 'tee_rproc_find_loaded_rsc_table' undeclared here (not in a function); did you mean 'rproc_find_loaded_rsc_table'?
     717 |         .find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  rproc_find_loaded_rsc_table


vim +53 arch/s390/include/asm/bug.h

a9df8e325d0de5 arch/s390/include/asm/bug.h Heiko Carstens 2010-01-13  52  
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27 @53  #define WARN_ON(x) ({					\
fd0cbdd378258f include/asm-s390/bug.h      Heiko Carstens 2007-08-02  54  	int __ret_warn_on = !!(x);			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  55  	if (__builtin_constant_p(__ret_warn_on)) {	\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  56  		if (__ret_warn_on)			\
b2be05273a1744 arch/s390/include/asm/bug.h Ben Hutchings  2010-04-03  57  			__WARN();			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  58  	} else {					\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  59  		if (unlikely(__ret_warn_on))		\
b2be05273a1744 arch/s390/include/asm/bug.h Ben Hutchings  2010-04-03  60  			__WARN();			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  61  	}						\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  62  	unlikely(__ret_warn_on);			\
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  63  })
c0007f1a65762e include/asm-s390/bug.h      Heiko Carstens 2007-04-27  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
