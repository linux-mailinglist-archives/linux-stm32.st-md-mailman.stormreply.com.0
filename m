Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D59944DB
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 11:56:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECD7C6C841;
	Tue,  8 Oct 2024 09:56:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59A8CC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728381360; x=1759917360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LvfAntT0wXbH5X1IhTvf7CykMVcP9BvX/yjWZiYGSvg=;
 b=gDobOAOHamrZM3p2KJo2VnT/wnkVTwrxn1YUlfXv78oKXqCN6zGngEj4
 PtFjl/CejyegtzcyPUJsfdphtGBznxF3B1i1OwmpEpLj5/mLxFu+QQ6kh
 A7Auc4a/T8ERkPlqTRASOsPh9QHByYGZXRXZfg99BGoutbbv02inwGcUg
 KfxYdBgwjvOhA8nJB7UXiEcZpmUI1bFnoY4J/Fz7lIbT8RuX69VhMiL9F
 T/q1eXoR3Zx2trkOSvVfG7gdRtNT0k5f5MqL0e9FLN50ElHOdxCXd6h6e
 LQoYUQR6UOv7mFOfCXh7dudgtkYS+dhkmd+Na0zBWw+rlMk5FrYo9wrLT w==;
X-CSE-ConnectionGUID: HmgBL4GrQA24yBBK+r8g8Q==
X-CSE-MsgGUID: U12ygSt0Sq6lOjHygf2xNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27442864"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27442864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:55:52 -0700
X-CSE-ConnectionGUID: Aq0MOba5SQyEs6fMt25THw==
X-CSE-MsgGUID: 1A0DACjuQ1yLc+P0ti9lQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75755815"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 08 Oct 2024 02:55:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sy6wU-0006Du-2F;
 Tue, 08 Oct 2024 09:55:46 +0000
Date: Tue, 8 Oct 2024 17:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202410081704.Zo2k0SZQ-lkp@intel.com>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 7/7] remoteproc: stm32: Add support of
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

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: parisc-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081704.Zo2k0SZQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081704.Zo2k0SZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081704.Zo2k0SZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_load_fw':
>> (.text+0xa8): undefined reference to `tee_shm_register_kernel_buf'
>> hppa-linux-ld: (.text+0x160): undefined reference to `tee_client_invoke_func'
>> hppa-linux-ld: (.text+0x178): undefined reference to `tee_shm_free'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_register':
>> (.text+0x2f4): undefined reference to `tee_client_open_session'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_unregister':
>> (.text+0x3d4): undefined reference to `tee_client_close_session'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_probe':
>> (.text+0x478): undefined reference to `tee_client_open_context'
>> hppa-linux-ld: (.text+0x4f8): undefined reference to `tee_client_close_context'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_remove':
   (.text+0x558): undefined reference to `tee_client_close_session'
   hppa-linux-ld: (.text+0x59c): undefined reference to `tee_client_close_context'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_start':
>> (.text+0x68c): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_stop':
   (.text+0x7c8): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_get_loaded_rsc_table':
   (.text+0x92c): undefined reference to `tee_client_invoke_func'
   hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o: in function `tee_rproc_release_fw':
   (.text+0xb18): undefined reference to `tee_client_invoke_func'
>> hppa-linux-ld: drivers/remoteproc/remoteproc_tee.o:(.data+0x8): undefined reference to `tee_bus_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
   Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
   Selected by [y]:
   - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
