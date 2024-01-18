Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18C83132E
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jan 2024 08:38:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E7A6C6DD6E;
	Thu, 18 Jan 2024 07:38:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A89DBC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jan 2024 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705563516; x=1737099516;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oEgWvrslnSM4xcNArZv/SqPbZt3JAcjMLGKjSG+iUmE=;
 b=DMLnF2sqFKZPQqNQ6WJzu7kNTN2GlTHHhJhwXk11/dn8g2Fulgfe13Hm
 X/tA0Gl8soElHDsxfTAuv+9jDuA/uE4y7kmVPT4E87deqPkTsHP7vgZ1N
 n/FvWo0lIG0+sJ4Ddf5fSpnED0e/t8lTgrOPYA3MUX/I8A/sWn+4KJ8YQ
 TUskBoeukNnsUHA3EPV5ZcM6LektvRxovyvMIlZHGO/zMPhRydMsKNgv5
 fBogxg4gUzTWkBVRGQAUtLAo7CfHyZ/e9d6LKx2/0VXkEQR0L32WPkCIo
 ppsvc59Z2AwDmObjcmQPu7bKmY0z/WnpaZbEJMKVdK9otEg7mrEoSiu35 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7744987"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7744987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 23:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="329433"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 17 Jan 2024 23:38:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rQMyp-0002lY-0Q;
 Thu, 18 Jan 2024 07:38:27 +0000
Date: Thu, 18 Jan 2024 15:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202401181522.bvg4EMU4-lkp@intel.com>
References: <20240115135249.296822-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115135249.296822-5-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] remoteproc: stm32: Add support of an
 OP-TEE TA to load the firmware
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

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on linus/master v6.7 next-20240117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-Add-TEE-support/20240115-215613
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240115135249.296822-5-arnaud.pouliquen%40foss.st.com
patch subject: [PATCH 4/4] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
config: arm64-randconfig-r081-20240118 (https://download.01.org/0day-ci/archive/20240118/202401181522.bvg4EMU4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401181522.bvg4EMU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401181522.bvg4EMU4-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_load_fw':
>> tee_remoteproc.c:(.text+0x138): undefined reference to `tee_shm_register_kernel_buf'
>> tee_remoteproc.c:(.text+0x138): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_shm_register_kernel_buf'
>> aarch64-linux-ld: tee_remoteproc.c:(.text+0x18c): undefined reference to `tee_client_invoke_func'
>> tee_remoteproc.c:(.text+0x18c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_invoke_func'
>> aarch64-linux-ld: tee_remoteproc.c:(.text+0x1ac): undefined reference to `tee_shm_free'
>> tee_remoteproc.c:(.text+0x1ac): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_shm_free'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_start':
>> tee_remoteproc.c:(.text+0x240): undefined reference to `tee_client_invoke_func'
   tee_remoteproc.c:(.text+0x240): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_invoke_func'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `rproc_tee_get_rsc_table':
   tee_remoteproc.c:(.text+0x2dc): undefined reference to `tee_client_invoke_func'
   tee_remoteproc.c:(.text+0x2dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_invoke_func'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_stop':
   tee_remoteproc.c:(.text+0x408): undefined reference to `tee_client_invoke_func'
   tee_remoteproc.c:(.text+0x408): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_invoke_func'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_register':
>> tee_remoteproc.c:(.text+0x51c): undefined reference to `tee_client_open_session'
>> tee_remoteproc.c:(.text+0x51c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_open_session'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_unregister':
>> tee_remoteproc.c:(.text+0x624): undefined reference to `tee_client_close_session'
>> tee_remoteproc.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_close_session'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_probe':
>> tee_remoteproc.c:(.text+0x6b0): undefined reference to `tee_client_open_context'
>> tee_remoteproc.c:(.text+0x6b0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_open_context'
>> aarch64-linux-ld: tee_remoteproc.c:(.text+0x6e0): undefined reference to `tee_client_close_context'
>> tee_remoteproc.c:(.text+0x6e0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tee_client_close_context'
   aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o: in function `tee_rproc_remove':
   tee_remoteproc.c:(.text+0x78c): undefined reference to `tee_client_close_session'
   tee_remoteproc.c:(.text+0x78c): additional relocation overflows omitted from the output
   aarch64-linux-ld: tee_remoteproc.c:(.text+0x7dc): undefined reference to `tee_client_close_context'
>> aarch64-linux-ld: drivers/remoteproc/tee_remoteproc.o:(.data+0x10): undefined reference to `tee_bus_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TEE_REMOTEPROC
   Depends on [m]: REMOTEPROC [=y] && OPTEE [=m]
   Selected by [y]:
   - STM32_RPROC [=y] && (ARCH_STM32 [=y] || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
