Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D277F77A1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 16:24:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6804CC6B47A;
	Fri, 24 Nov 2023 15:24:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A7A5C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700839438; x=1732375438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hjHUasbUvdZyid1X5HvgmpQL0hPNRyInjUAbKjnNwBA=;
 b=gd6Xc/HAC54llMsVBFQWJ0EH27j23mx6utLS23gRFIXJKsBB/P8AxIav
 jCtt7a2rR8f5wUK+jCHqAO1+NXT4dobv9KHs3BRESk6sk0KGHFfFo2sP2
 j1jciGkuBWK/1VAeWrG7EZspW2A5Jm36nHQu/D68rLYIRBh+uhU2pI7FX
 ZZioriW9ItCSf6OwG4a1duOf4a22K4MJ2V/N+vGUtEIc92O4ukb8W8DSt
 /vTuSRZ3QBVJlShwdUrTB14vti9z9Qt88g3NjXppAOZrXVANwSm8FAMON
 6oRu5mQrVmHQchkmw/CfA37AL5FER9zfnSXpWjO3lZlYIzYp/kHjFblwY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781786"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="456781786"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935597"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="1014935597"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6Y20-0002wK-0N;
 Fri, 24 Nov 2023 15:23:48 +0000
Date: Fri, 24 Nov 2023 23:23:30 +0800
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
Message-ID: <202311241629.yh1clHno-lkp@intel.com>
References: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>
Cc: netdev@vger.kernel.org, kernel@quicinc.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] arm64: dts: qcom:
 sa8775p: enable Fault IRQ
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

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-fault-IRQ-for-sa8775p/20231123-202252
base:   net-next/main
patch link:    https://lore.kernel.org/r/66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault IRQ
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241629.yh1clHno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241629.yh1clHno-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sa8775p.dtsi:2344.10-11 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
