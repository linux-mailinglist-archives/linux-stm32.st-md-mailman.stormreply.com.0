Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC84900F55
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jun 2024 05:31:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20872C712A1;
	Sat,  8 Jun 2024 03:31:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03B1DC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jun 2024 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717817474; x=1749353474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/sX6sFjxJG1dDPpY4Isus+wzeR8BUHZdaJGCCe58Hjg=;
 b=bRO6YejgBx9zuNqzVuwqbTwlYkhJ1VYdlkWS8xGLM4vnKf/+q0GbP1cr
 bESOO2yPO43LB6NdrqlMGYxi6hV2bzYDC0HXRBcsPuzraQ+hG/fChMUGF
 tlRpa8WEvMCHj/jzy7WttTcRzsrdZaQ22Jv/CwM2Vq+rTeoUo/7lgC/Vt
 lQUItqmOQ39oJAlvWYHux8ymAlWcLyhM9w13Oi+54c5eI9Bxti+Dy368F
 gQBgCg9xflvcBIY5T5/oWuD6fNo+BReGsKPVsKeV6ftalyEp7e1L1IXVF
 1zYXZnd5Hnj7Id074nzRMZupDuuoua+l1dnNuZijkuvvtI5NEyRuklAR7 Q==;
X-CSE-ConnectionGUID: 4XD3Q3vbQlyvB7rFDxmU9g==
X-CSE-MsgGUID: isTHpU8nTS2sktP4bM5Nsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14436255"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="14436255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 20:31:05 -0700
X-CSE-ConnectionGUID: KauwOKdARrOh7dsnIQJUCw==
X-CSE-MsgGUID: ecCI/N7VQMOA9VeHuekkXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="38611823"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2024 20:31:02 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sFmnE-0000uQ-0W;
 Sat, 08 Jun 2024 03:31:00 +0000
Date: Sat, 8 Jun 2024 11:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202406081159.KM501g5C-lkp@intel.com>
References: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
config: i386-buildonly-randconfig-002-20240608 (https://download.01.org/0day-ci/archive/20240608/202406081159.KM501g5C-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081159.KM501g5C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081159.KM501g5C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:94:2: error: expected parameter declarator
      94 |         WARN_ON(1);
         |         ^
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                             ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:94:2: error: expected ')'
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                             ^
   include/linux/tee_remoteproc.h:94:2: note: to match this '('
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:92:32: error: function cannot return function type 'struct resource_table *()'
      92 | tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
         |                                ^
>> include/linux/tee_remoteproc.h:94:2: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      94 |         WARN_ON(1);
         |         ^
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^
   In file included from drivers/remoteproc/stm32_rproc.c:23:
>> include/linux/tee_remoteproc.h:96:2: error: expected identifier or '('
      96 |         return NULL;
         |         ^
>> include/linux/tee_remoteproc.h:97:1: error: extraneous closing brace ('}')
      97 | }
         | ^
   6 errors generated.


vim +94 include/linux/tee_remoteproc.h

5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  90  
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  91  static inline struct resource_table *
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @92  tee_rproc_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  93  	/* This shouldn't be possible */
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @94  	WARN_ON(1);
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07  95  
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @96  	return NULL;
5c0eb7b2737b6e Arnaud Pouliquen 2024-06-07 @97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
