Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA649824EF1
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 08:09:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C81FC6C83C;
	Fri,  5 Jan 2024 07:09:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 788E6C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704438586; x=1735974586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yKUXbdD8qpgSi58w2LiSPZgWQ2PW44f2VTnKYrF/+3I=;
 b=mXTrdr7wRTSkorphepkW1LxfgxNupPBNKzASE5wgRaD0jGXkLaXKHOQP
 gUb3Ifrk19q0sZpNGrvvhMjRt1fM7DkAMwU3dBfgjEWhs9h3apCmsaxre
 Jj06Xy+n8aFageqIcdyEw2b6EndxHJY0UFLPkfUS5f/wQaAiPEqDWDndh
 UpJiEEkZCiVkEmCdLrHGYCrNcZdYD4oQnR+XVPAEltLLt2ChJg+bPySQJ
 0VOCCQ2owHobKSt+EenfJZMwA/ScIReDKRAZnUNNuI4bMSl+ahCPATdgO
 YwrSLGchLiwWt+4xjwGy+KL6Jv2++wJK0kICBCL66URZxpzM94fGYBjmY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463845810"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="463845810"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 23:09:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871167246"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="871167246"
Received: from pg-esw-build.png.intel.com ([10.226.214.65])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2024 23:09:39 -0800
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
Date: Fri,  5 Jan 2024 15:09:21 +0800
Message-Id: <20240105070925.2948871-1-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Swee Leong Ching <leong.ching.swee@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: Enable Per DMA
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

changelog v2:
*extend irq_name array to 9
*add empty line after int i
*avoid polluting rx_irq/tx_irq array with temporary variable
*move tx/rx IRQ loop to bottom of stmmac_get_platform_resource()
*rename stmmac_xx_queue_interrupt() to stmmac_dma_xx_interrupt()
*fix error message in stmmac_request_irq_multi()
*move STMMAC_FLAG_MULTI_IRQ_EN handling to glue driver 

Swee Leong Ching (4):
  dt-bindings: net: snps,dwmac: per channel irq
  net: stmmac: Make MSI interrupt routine generic
  net: stmmac: Add support for TX/RX channel interrupt
  net: stmmac: Use interrupt mode INTM=1 for per channel irq

 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  3 ++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 32 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++---------
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++++++++
 include/linux/stmmac.h                        |  4 +--
 9 files changed, 90 insertions(+), 40 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
