Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C69A2D42C
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Feb 2025 06:48:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2249C78F8B;
	Sat,  8 Feb 2025 05:48:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 726B4C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Feb 2025 05:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738993702; x=1770529702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wA0BmDz21/8I4MOZeMPRdJ8DIn6Tlt/iSbPznwlMASM=;
 b=Uz05S7h3V/9OtquxLBfuH5UG2tkB7Qw7x+qarnwwfhw6V7B2Dcf7+hs6
 8EUPYIVdzL7xfQTdLs0/7hiSJFJgdbCPEEXqklNNcszdzce7C7ezBE+rH
 /a04qve5BIKo3ZH0Nx9Njc9/E/LyMjenhGRl39s/tdyEtgLvc7NNdwjug
 4rPdIi5MQ/Uy+6fSv61QFXjgVYf8v2CGzubVDVBq/YKNSaNhb7iJZmdh8
 DK03q/8JpW2Wy/PmDC4Hg+ij/f30YBzwRBFXjrUW+du3s703qdLEzs1OQ
 p/MlnihGXBLHTuqY1fnfb7XrVQORT4ywM45dxaft4CcNAnt/mykNpcFod Q==;
X-CSE-ConnectionGUID: QKF17ZymTmCHQUvLLUWD9w==
X-CSE-MsgGUID: DQU+veHrTE+Q3bU+uvk4PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51028446"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; d="scan'208";a="51028446"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 21:48:13 -0800
X-CSE-ConnectionGUID: HWU+sQIMQp6QzNwU1gmo2w==
X-CSE-MsgGUID: IxhBp/1ZRTuYG0obpJ0Qcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134955066"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 21:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tgdhF-000zbT-0b;
 Sat, 08 Feb 2025 05:48:05 +0000
Date: Sat, 8 Feb 2025 13:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Message-ID: <202502081313.JqJlff9y-lkp@intel.com>
References: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, oe-kbuild-all@lists.linux.dev,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 4/7] Coresight: Introduce a new struct
	coresight_path
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

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on atorgue-stm32/stm32-next linus/master v6.14-rc1 next-20250207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/Coresight-Add-support-for-new-APB-clock-name/20250207-144657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250207064213.2314482-5-quic_jiegan%40quicinc.com
patch subject: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
config: arm-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081313.JqJlff9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081313.JqJlff9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-core.c:659: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Links or sources will read their existing or alloc a trace ID, if their ID
   drivers/hwtracing/coresight/coresight-core.c:676: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Call this after creating the path and before enabling it. This leaves


vim +659 drivers/hwtracing/coresight/coresight-core.c

   657	
   658	/**
 > 659	 * Links or sources will read their existing or alloc a trace ID, if their ID
   660	 * callback is set.
   661	 */
   662	static int coresight_get_trace_id(struct coresight_device *csdev,
   663					  enum cs_mode mode,
   664					  struct coresight_device *sink)
   665	{
   666		if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
   667			return link_ops(csdev)->trace_id(csdev, mode, sink);
   668	
   669		if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
   670			return source_ops(csdev)->trace_id(csdev, mode, sink);
   671	
   672		return 0;
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
