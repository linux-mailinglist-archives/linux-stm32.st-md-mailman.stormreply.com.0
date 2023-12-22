Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2EB822AB0
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 10:57:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 044B6C6DD75;
	Wed,  3 Jan 2024 09:57:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB2CC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703223958; x=1734759958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CjRK6L+3YHfQxLdgqWH6wzL66WcY3RprmAfaaHBD6ss=;
 b=Mm9DoUrmkK9wJtCGEhOWDjnEoIpVKpQuyTummY1P5LSVqkIfs9nKMZKv
 ZoICoCdYd8gk31swCKaahE9Rz3K48T6FTQK36PIK0jmcnTQUIuWC+AvMs
 WsYqyiu+JJiOssLtxVV75BcFDIpECTUM05ViLgZWvum2OcDlc2PRSYusb
 QXWs9hKojE8sBNy2FDU4PTndBKpIGLshIZhnuHSOpFr9+kYZJvP6VVS++
 7rOjy98xxx6NkJe80eaW3FSOIn0UgRQt4Ug2t0BAcSCaKmIGdaW9BQkKE
 csMgu96y6Z5LqeQTsMR1e08d+9aFtbhE6VQGRry6vg3r/TyueEBZcbJ7+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9470503"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9470503"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 21:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900324167"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="900324167"
Received: from pg-esw-build.png.intel.com ([10.226.214.57])
 by orsmga004.jf.intel.com with ESMTP; 21 Dec 2023 21:45:39 -0800
From: Leong Ching Swee <leong.ching.swee@intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Dec 2023 13:44:47 +0800
Message-Id: <20231222054451.2683242-1-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:57:54 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Swee Leong Ching <leong.ching.swee@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 0/4] net: stmmac: Enable Per DMA
	Channel interrupt
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

From: Swee Leong Ching <leong.ching.swee@intel.com>

Hi,
Add Per DMA Channel interrupt feature for DWXGMAC IP.
 
Patchset (link below) contains per DMA channel interrupt, But it was 
achieved.
https://lore.kernel.org/lkml/20230821203328.GA2197059-
robh@kernel.org/t/#m849b529a642e1bff89c05a07efc25d6a94c8bfb4
 
Some of the changes in this patchset are based on reviewer comment on 
patchset mentioned beforehand.

Swee Leong Ching (4):
  dt-bindings: net: snps,dwmac: per channel irq
  net: stmmac: Make MSI interrupt routine generic
  net: stmmac: Add support for TX/RX channel interrupt
  net: stmmac: Use interrupt mode INTM=1 for per channel irq

 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 32 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++--------
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 24 ++++++++++++++
 include/linux/stmmac.h                        |  4 +--
 8 files changed, 84 insertions(+), 38 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
