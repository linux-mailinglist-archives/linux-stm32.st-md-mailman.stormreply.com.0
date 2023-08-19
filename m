Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB337816AA
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Aug 2023 04:32:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BB93C6B460;
	Sat, 19 Aug 2023 02:32:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDB20C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Aug 2023 02:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692412328; x=1723948328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUZv+nrGlmsYxLObqUMCZH8MhclgX6iZzIWxMKxHHho=;
 b=Qs9FNDPXj4RkyxzxkKcOUdNitrhFXtYPOsawwFuKseFNdBwPjQD8tQnf
 H/+B1LQOnMn5y0uhdENIteSD9VTjrPkbVrqJ8QtXdcWMqviyxhgxd21OG
 ik5ZKGxN2wrYqgsbl6iI0PJ54GV+H5UcfSUWWpBgC6/IKRx0nDGPL/wu3
 S/r1RcGvFCHdQtV4aeO80hXxRASOyyDHwueQcCNpW6h3h+dysRTRLMT2s
 XcNcMJWa5dZENtxB2W+MfyjW96zh4v1XfQ9Ec58naDMaRaKZ9MDRE9QxG
 fIJfIULVTcdHGCSgpaKl1YVq3U69wJe7PI0JRMN0wFRkRkjNwYd82sa9x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439629380"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="439629380"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 19:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="800660777"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="800660777"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 19:31:35 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat, 19 Aug 2023 10:31:30 +0800
Message-Id: <20230819023132.23082-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/2] net: stmmac: Tx coe sw
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

changelog v5:
* As rightly suggested by Serge, reworked redundant code.

changelog v4: 
* Replaced tx_q_coe_lmt with bit flag.

changelog v3: 
* Resend with complete email list.

changelog v2: 
* Reformed binding description.
* Minor grammatical corrections in comments and commit messages.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Tx queues with coe
  net: stmmac: Tx coe sw fallback

 .../devicetree/bindings/net/snps,dwmac.yaml    |  3 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c  |  4 ++++
 include/linux/stmmac.h                         |  1 +
 4 files changed, 26 insertions(+)

-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
