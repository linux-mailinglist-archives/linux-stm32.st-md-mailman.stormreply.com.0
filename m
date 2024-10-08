Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10C995687
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 20:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA7EC7128F;
	Tue,  8 Oct 2024 18:28:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A85C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412094; x=1759948094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xlYFgGi0wb7POCCV6CbKHjLYkCkFi7yoTDhc9WV7/JI=;
 b=EyLOFCThLOBCZkiZKZHymmeuvQ/ZNP4tCLx0T4QZz0UM0RM+iW4zHMZF
 ubdkFe5YuhOfPozofd9tos2uODWx1MNsTOC6pdI1l9TLw+g3khKJYK/KZ
 V9pQAQZaLjYVadq/uCB2J1jYB437Ig1XYiaBLG0yHM/j+A5Dk26w4Z0Ya
 WMx971KAE0Oj/CQk8CFJUfjkm6uiT2NW9EzOOs+OHxy3xaEWuh+hwAbua
 6bpJtT/BT5KrAmaUEbqFToRerIbd88w7NuqpXx/EPTFRxz/DWGmGlAm1l
 BqtEK74hD1q/xsu6eZy2EiinZoLlRAW66MzZAkrkktLTAGpTMzgJy/T8y w==;
X-CSE-ConnectionGUID: OOn6lN+JTGSSo82jM8TB9A==
X-CSE-MsgGUID: egefT6G7QZKCaEgaA6NJtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38233044"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38233044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:28:06 -0700
X-CSE-ConnectionGUID: niWdaALuTIqI+ypDhf6wHA==
X-CSE-MsgGUID: mKZwdRX2QBCUtwJ+k70tYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76194737"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 11:28:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1syEwC-0008FI-2N;
 Tue, 08 Oct 2024 18:28:00 +0000
Date: Wed, 9 Oct 2024 02:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <202410090225.d3bZaaqk-lkp@intel.com>
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
config: arm-randconfig-r054-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090225.d3bZaaqk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090225.d3bZaaqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090225.d3bZaaqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tee_client_invoke_func
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_release_fw) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_parse_fw) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: tee_shm_register_kernel_buf
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_shm_free
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_load_fw) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_open_session
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_register) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_close_session
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_unregister) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_open_context
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_client_close_context
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_probe) in archive vmlinux.a
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tee_bus_type
   >>> referenced by remoteproc_tee.c
   >>>               drivers/remoteproc/remoteproc_tee.o:(tee_rproc_fw_driver) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
   Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
   Selected by [y]:
   - STM32_RPROC [=y] && (ARCH_STM32 [=n] || COMPILE_TEST [=y]) && REMOTEPROC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
