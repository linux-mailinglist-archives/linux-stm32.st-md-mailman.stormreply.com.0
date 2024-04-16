Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE828A77FA
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 00:46:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB2EC6B45B;
	Tue, 16 Apr 2024 22:46:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A33B7C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 22:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713307580; x=1744843580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ruPLZtboEM5XulxQNfwB0Bs5ITsVQhPBESRc6EcWqdU=;
 b=VENK6twIcAgx+zeGbEDbkbV9x/1t2qsFitZr4UyhC3jshHh+NXSe/RPb
 28JwPCAUn3XteYA8HOEClOLtzJVLxryow7sXHjQEyuRN2KextBQDOpiUb
 QVZYzhCK2q3C2tReFUzkRdN2oCj/Oi68kC3hzVjpikxqR3jug1hKlbmFv
 pXx//+ja41bs570LauaRTIifZC2aFNExs9iYauzoBvWzAQXuZ/LnvsYFG
 5CKP4pxxRkBuSwGTEfsRZ4Jtx2mEsvtx2VyB1/BQALZcoiDcENavrHTpo
 3X0W/JohytaHA3mT+0Gp0/reDYdxlUzQla35ieQWwApszTPxptKuMdXIZ Q==;
X-CSE-ConnectionGUID: E1IEKwYETDWSoYuF9CKL/g==
X-CSE-MsgGUID: Qsx32L6WQMu87of4h027dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19336458"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="19336458"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:46:17 -0700
X-CSE-ConnectionGUID: XGtGOWL5S2adDgWQ0szi3g==
X-CSE-MsgGUID: ljDqj6luS4yibYyUZCSvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="53381544"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 16 Apr 2024 15:46:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rwrZ5-0005nw-0D;
 Tue, 16 Apr 2024 22:46:11 +0000
Date: Wed, 17 Apr 2024 06:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202404170656.LoL9eBYs-lkp@intel.com>
References: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: rtc: google,
 goldfish-rtc: move to trivial-rtc
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

Hi Javier,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fec50db7033ea478773b159e0e2efb135270e3b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/dt-bindings-rtc-orion-rtc-move-to-trivial-rtc/20240408-235612
base:   fec50db7033ea478773b159e0e2efb135270e3b7
patch link:    https://lore.kernel.org/r/20240408-rtc_dtschema-v1-2-c447542fc362%40gmail.com
patch subject: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170656.LoL9eBYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170656.LoL9eBYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
