Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78877BAEE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 16:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5318C6B472;
	Mon, 14 Aug 2023 14:06:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55636C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692022010; x=1723558010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CDzK91hrFBu3C3eQWjdbTzk2hWA6gCmI/7dZQVWE7PE=;
 b=WN3pp2hSluwLk60+xKx3cQmrEUc1XP346/bwdjwyGjdPqLGKvr9vCMo6
 rd1XodmxSpLDuht6ISpYrdQ/KitYAiLHBk9Jc2qbNodi4+SvvjsQw7QyJ
 CcV5bETyg9/tlf+/B3VHHRhDqjEn2WGr0/gnjtOXezqzO5WMOnhA3Goyh
 FOyypuxryAlBEd62vQ45NRqN811LngrVaI20/s4kOkhxpnjLyAEjN6eRM
 GuqDq32sj5DEjoMPSkIRkfoMpjviiKczWBaepsvYLXNFl7LHxoMYxjgpr
 BPeRGRJA1/enrFB+9rOmY0Ahwy9+HFObp2/nCcI20HN2qgCxOISVBP8hh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438377171"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="438377171"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683317889"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="683317889"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by orsmga003.jf.intel.com with ESMTP; 14 Aug 2023 07:06:43 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 14 Aug 2023 22:06:35 +0800
Message-Id: <20230814140637.27629-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: Tx coe sw
	fallback
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

Hi,
Some DWMAC IPs support tx coe only for a few initial tx queues,
starting from tx queue 0. This patchset adds support for tx coe sw
fallback for those queues that don't support tx coe. Also, add binding
for snps,tx-queues-with-coe property.

changelog v3:
* Resend with complete email list

changelog v2: 
* Reformed binding description.
* Minor grammatical corrections in comments and commit messages.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Tx queues with coe
  net: stmmac: Tx coe sw fallback

 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 ++++
 include/linux/stmmac.h                        |  1 +
 5 files changed, 29 insertions(+)

-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
