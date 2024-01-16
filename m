Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E582F801
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 21:35:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3FC1C6B476;
	Tue, 16 Jan 2024 20:35:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05F46C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 20:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705437337; x=1736973337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9PpIhVPT+ja3jI9uPpGTzGflBYIHLpQFQiw2CXoF3f8=;
 b=RHvIDnXLEDeoxPfbY4pXIQlrt10p5t42IMESGxlDKxpiw/Xi207tifDc
 FAT6mgJbL+AvG2P/rZ9hH6qKLiZjObzMwitrsAhh8pXTGUvYblZsKjzj8
 LPxGmPp+EdRNihtjB8WhqoMm32BaZqcwShUHITMe0ouS56UCnu27DCaat
 V92fF55QaV1lmDrmAaoyj+OeOs6mdl3PXsQ7XbtmPDwnsbtPwo9IGCS+Q
 kT/UA3sMQQcrQCGoHF1hcD/ef8gpajGfbGCRW2IGoJDTZzRRlWZ+iLsvo
 eeOPUZgC7MHz7KKJEr6ie2gae9D8epKnF/8nfLM+h45AhnU5tZSOsytwe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397137946"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397137946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="25935828"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 12:35:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rPq9f-0001Ck-1k;
 Tue, 16 Jan 2024 20:35:27 +0000
Date: Wed, 17 Jan 2024 04:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Message-ID: <202401170445.7STzlFcl-lkp@intel.com>
References: <20240115164252.26510-3-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115164252.26510-3-quic_jinlmao@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mao Jinlong <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, oe-kbuild-all@lists.linux.dev,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: arm: Add device-name
 in the coresight components
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

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/coresight-core-Add-device-name-support/20240116-004557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240115164252.26510-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/2] dt-bindings: arm: Add device-name in the coresight components
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240117/202401170445.7STzlFcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170445.7STzlFcl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
