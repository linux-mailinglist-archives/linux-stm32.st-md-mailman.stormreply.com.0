Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E98AD8BD2
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 14:12:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3D71C36B3C;
	Fri, 13 Jun 2025 12:12:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 210CEC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749816758; x=1781352758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q8gbfUYNETamHMlqMO9QOqlu77JO0RYCF9BXmbQkWK8=;
 b=T9TNu/WlFcpRob/qkn/u2TzcmduPEvQDPXxXmmTOxPySVoKVX53/bOyB
 3lUqkEnFmpx96B3JTE4suuVuj4s6CtEnZES4SBoN64mAehjWpwx45fh2R
 yqxIL38KLQoP0Kvb3cvvcAw6WJjtVV6AzIv58Slp30jzedBAJOijh1sQU
 JpsLRBfkR7OAh11KwgZD41YuTipT7M787uifkBSZFLPKcpeJDMCb9ceRD
 eieTgHBm7i/IJ2kO5jC0djnepWINVua/kqXtBdWh0tb3cOV++TlJKGS17
 mmTGWXhGkyh95qbb4kj7QqhaV2Injvns0L5diiq5vl2KI6OFzAqE7HDhG g==;
X-CSE-ConnectionGUID: 7wIdhXEURTm0xpH99u97DA==
X-CSE-MsgGUID: HXSzBUu4SfGLDvlZLnCpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52012645"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52012645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:12:36 -0700
X-CSE-ConnectionGUID: Kd6ix5V9Q0OrAW95lrLS1w==
X-CSE-MsgGUID: OJffvJHpS2u3WKMrqEw+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="185055534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 13 Jun 2025 05:12:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uQ3Gm-000CZu-2y;
 Fri, 13 Jun 2025 12:12:28 +0000
Date: Fri, 13 Jun 2025 20:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <202506131908.dH1ks6AW-lkp@intel.com>
References: <20250612221630.45198-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612221630.45198-1-matthew.gerlach@altera.com>
Cc: Mun Yew Tham <mun.yew.tham@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v5] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Gerlach/dt-bindings-net-Convert-socfpga-dwmac-bindings-to-yaml/20250613-062051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612221630.45198-1-matthew.gerlach%40altera.com
patch subject: [PATCH v5] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
reproduce: (https://download.01.org/0day-ci/archive/20250613/202506131908.dH1ks6AW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131908.dH1ks6AW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/altr,gmii-to-sgmii.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
