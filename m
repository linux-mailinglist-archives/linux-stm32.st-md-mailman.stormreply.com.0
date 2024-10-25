Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEF9B0C2C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 19:52:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E957AC78021;
	Fri, 25 Oct 2024 17:52:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D663C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729878754; x=1761414754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UtYL6tEz9hl+CXKoYPC2/xOLlz0ZwZXSI2NVSNsyDNo=;
 b=kux5B7dV/UZIhWfAoiQIXipH4W9Psox4/3hohPVZJmqdpgD5XJ/sVLIa
 e1kDYAUDjDb0aNqQvBhV0SE+4Dmi89ks+PficxhWF4XxiGcbeN8tAX8O9
 DH/iGfcD9SfdHmRk1akDndsocPOlK2eQt5itLf6MC9zKE19+5lSZkYKZA
 eSgqv8Ne5UH1AjuHVYLv3Rz+qgK1N3RstYNxhzKgMaT7TvAEhWRxISwSx
 S4LLDvfBn6wfTeCz1WvZl89LXNjpl6k6QHWXbeTRsx68nRs2vtOlEzgMF
 pFYSAkp7vXhl23K296FiSaU8ObbuGF4BQBkawckYcHub+O4p3/yJla/lx w==;
X-CSE-ConnectionGUID: k2iy80txTX2urzO9WrMN4g==
X-CSE-MsgGUID: UnAqPKTuS76ydYlqmWxaLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52110104"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52110104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:52:25 -0700
X-CSE-ConnectionGUID: Gs8fPh/5Qa2QeLM9/DlmTQ==
X-CSE-MsgGUID: ec3pH9vCSLGfxnnHMxOYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81405415"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 25 Oct 2024 10:52:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4OTy-000YhM-1w;
 Fri, 25 Oct 2024 17:52:18 +0000
Date: Sat, 26 Oct 2024 01:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <202410260107.eXOai3Uw-lkp@intel.com>
References: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Furong Xu <0x1207@gmail.com>, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

Hi Furong,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Furong-Xu/net-stmmac-Introduce-separate-files-for-FPE-implementation/20241024-163526
base:   net-next/main
patch link:    https://lore.kernel.org/r/cfc647f0d031517f9ec9095235a574aad9dc2c95.1729757625.git.0x1207%40gmail.com
patch subject: [PATCH net-next v4 3/6] net: stmmac: Refactor FPE functions to generic version
config: arm-sunxi_defconfig (https://download.01.org/0day-ci/archive/20241026/202410260107.eXOai3Uw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260107.eXOai3Uw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260107.eXOai3Uw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.o: in function `stmmac_fpe_configure':
>> stmmac_fpe.c:(.text+0x140): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
