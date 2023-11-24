Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2317F74BD
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 14:20:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3586C6B47A;
	Fri, 24 Nov 2023 13:20:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43CA8C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700832026; x=1732368026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/5khxxfaWaDrp+7xzbywroUSqPLt6PgF7RJxWSypS1M=;
 b=bO8WJXsdaDGPpXR0rhzHbvaDF1WjBt2s+zVyJM8LNwnwW/IYGGt9RCBL
 fVOkP9Sr06lB+mTQQiPXPQ2KStySJT0NxMSnwB8N8t9P7Dnqoiu0h+Bak
 GbgWQSfcujQYqfENZgka+zgJR99XkeD7ekOKxn9MFXvXwkQACf63Znb44
 8e8spR/u82effalvsLkrtueSt/iuE0xjRUewYHco2n3Kze1ezxRH7wph6
 kM/Zm4CZ2WzPiVTuJwjIhtp2apLdwumk8rKGRnlLfsPDQPSdn7REeRqpQ
 GW2/5gcg/Ijx5HPs2NORlqFJwrl4Q7gUPmCGQsNpwdeQihdvpFrmjNxQk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382823497"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="382823497"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885274546"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="885274546"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 05:20:19 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6W6T-0002nk-2M;
 Fri, 24 Nov 2023 13:20:17 +0000
Date: Fri, 24 Nov 2023 21:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>
Message-ID: <202311241444.wkNnpI5Q-lkp@intel.com>
References: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
Cc: netdev@vger.kernel.org, kernel@quicinc.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add driver
 support for DWMAC5 fault IRQ Support
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

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-fault-IRQ-for-sa8775p/20231123-202252
base:   net-next/main
patch link:    https://lore.kernel.org/r/62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v3 3/3] net: stmmac: Add driver support for DWMAC5 fault IRQ Support
config: csky-randconfig-r081-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241444.wkNnpI5Q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241444.wkNnpI5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241444.wkNnpI5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:693:5: warning: no previous prototype for 'stmmac_get_fault_intr_config' [-Wmissing-prototypes]
     693 | int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/stmmac_get_fault_intr_config +693 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

   692	
 > 693	int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
   694	{
   695		int ret = 0;
   696	
   697		res->safety_common_intr = platform_get_irq_byname(pdev, "safety");
   698	
   699		if (res->safety_common_intr < 0) {
   700			if (res->safety_common_intr != -EPROBE_DEFER)
   701				dev_err(&pdev->dev, "safety IRQ configuration information not found\n");
   702			ret = 1;
   703		}
   704	
   705		return ret;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
