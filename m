Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E546930235
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jul 2024 00:46:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B95E2C6DD9D;
	Fri, 12 Jul 2024 22:46:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0085C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2024 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720824363; x=1752360363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Qv0tnuJtuXSWEWqZay3RBPKpl8dK30QovUrNJ0WvZs=;
 b=BZzvSCAAMcszaN8SsE54Rokn6WTC1+OrRX0bLBGmQjR4zf+MVr4jick9
 4AFiptjYYlmHfRpnm2BuRhY/K4l+t6ZR6YDeTIF7qAhzLJF3uOugf3A2D
 wDMa6yYme/FAx40i4btq/28zxNRT8SKCenG6nxmx5ofF/xPG5qCG/2fQK
 3hnecYCXzHw3vk4ICObEROYLt8Hz0Db4zTUiKuz46s9vtMAFcLeDOrms+
 uHIsCqO2riGV80W1arxpAbfzr8xCeKOjC26ET1TurMvjXef/zskMtN4sR
 Lyj7bhxx8lLvtv+FITMppMHPOru/v2bos1TooEAAJNzBnA1N6aNrval0U w==;
X-CSE-ConnectionGUID: NIQAQknZQxe0Dibd/xo/GQ==
X-CSE-MsgGUID: 34OorxS9Tbm8kqVurv4Vxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22152408"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="22152408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:45:55 -0700
X-CSE-ConnectionGUID: B8eCIzbxR0uO3P7A3qK0sQ==
X-CSE-MsgGUID: Yc3RkAqHQUi71V6hAhxzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53875232"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 15:45:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sSP1Q-000bOc-37;
 Fri, 12 Jul 2024 22:45:48 +0000
Date: Sat, 13 Jul 2024 06:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202407130612.OEicZbNE-lkp@intel.com>
References: <20240711140843.3201530-3-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-3-valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on atorgue-stm32/stm32-next robh/for-next linus/master v6.10-rc7 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240711-233937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240711140843.3201530-3-valentin.caron%40foss.st.com
patch subject: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: hexagon-randconfig-r132-20240712 (https://download.01.org/0day-ci/archive/20240713/202407130612.OEicZbNE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240713/202407130612.OEicZbNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130612.OEicZbNE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-stm32.c:192:31: sparse: sparse: symbol 'stm32_rtc_pinctrl_pins' was not declared. Should it be static?

vim +/stm32_rtc_pinctrl_pins +192 drivers/rtc/rtc-stm32.c

   191	
 > 192	const struct pinctrl_pin_desc stm32_rtc_pinctrl_pins[] = {
   193		PINCTRL_PIN(OUT1, "out1"),
   194		PINCTRL_PIN(OUT2, "out2"),
   195		PINCTRL_PIN(OUT2_RMP, "out2_rmp"),
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
