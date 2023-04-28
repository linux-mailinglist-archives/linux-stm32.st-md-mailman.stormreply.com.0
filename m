Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 153406F10D0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Apr 2023 05:21:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893F4C6A5E6;
	Fri, 28 Apr 2023 03:21:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48B3FC69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Apr 2023 03:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682652090; x=1714188090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4R43bx9gM2wJSRgR+/lm2js0NqBwBMtOMTj3g9bM1to=;
 b=Q2k+IJeba3lBDtlEZ2Dvg3ysjYFgrRE03UCUDe5WlCwfrGvx6SVEJvtR
 eiR7EDxvMuZh4A12OI4c21IXHeD+9YBsSlYWPYUi0tfixZN7fjw7FmNvg
 CGlolKLpLHnMWlyqqDIb5pk4+GRk60BFxB4w+ZIozfbrhXGd4PDEr4CMf
 L8mDxnRxJV5at3mv4Og8jI6R71RkJO0D6JbJUH7qGhGTi042cSJYi21q1
 eeq+niLQAj8qcByhV74jWqFxfBdG5iuR5iISVzCQLQintRpokLiWzHnVN
 QfxieBETcZdHNn8crqKZ1lS8rnhvRtelPkD0F0HTwH0rnoR+BXOUp37W2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346394252"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346394252"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 20:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806215105"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="806215105"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 20:21:15 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1psEfc-00004D-0l;
 Fri, 28 Apr 2023 03:21:16 +0000
Date: Fri, 28 Apr 2023 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Message-ID: <202304281111.wSsZVm5t-lkp@intel.com>
References: <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] ARM: dts: stm32: add CAN support
	on stm32f746
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

Hi Dario,

kernel test robot noticed the following build errors:

[auto build test ERROR on mkl-can-next/testing]
[also build test ERROR on net-next/main net/main linus/master next-20230427]
[cannot apply to atorgue-stm32/stm32-next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-net-can-add-st-can-secondary-property/20230428-044723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git testing
patch link:    https://lore.kernel.org/r/20230427204540.3126234-6-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v2 5/5] ARM: dts: stm32: add CAN support on stm32f746
config: arm-randconfig-r011-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281111.wSsZVm5t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/efdb48d32dc845ff8f52bfe8c7345b61c9671940
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dario-Binacchi/dt-bindings-net-can-add-st-can-secondary-property/20230428-044723
        git checkout efdb48d32dc845ff8f52bfe8c7345b61c9671940
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281111.wSsZVm5t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
