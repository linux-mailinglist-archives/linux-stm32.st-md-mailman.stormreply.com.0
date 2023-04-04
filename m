Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C246D57AB
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 06:49:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9263FC6A612;
	Tue,  4 Apr 2023 04:49:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EEABC6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680583740; x=1712119740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=atNBv19nqFsJx7Jsp8sn5eYxALmhvo0gO3LFEzJDCZc=;
 b=AB/wviijvdjQ4qOb1VqG8pJVm9vM0LY8pxldZZSi0uMPVKHpVmDrisXC
 hoaeV525Q/2WJ12mOZnTq5eci40NsQgNMizEDkYbsgF3BEf3Uzd3qG8fb
 hy/LrfqtzjZ3PsHcWjs7RDdV+jgfJ17lcRC/R//EHxtULgb3rMnmovck7
 M8y345gKlwViTRqiAMpxz0jZiliJql+1bZm2NthTxtZ71nFy65Cu/pO5u
 3Y2shlNIoPpO2pR+ARKZVyUaIdZ8aIdefrDx3GpE4QjU+dGmz5ZxhmELq
 ajwZnLcibDXasexVV8LLVxfr5+ZnA0StvkGojSCuRXDxTwHHOA4oqdVg0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321742185"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="321742185"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 21:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775496240"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="775496240"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2023 21:48:54 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Date: Tue,  4 Apr 2023 12:48:23 +0800
Message-Id: <20230404044823.3226144-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: Add queue reset into
	stmmac_xdp_open() function
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

Queue reset was moved out from __init_dma_rx_desc_rings() and
__init_dma_tx_desc_rings() functions. Thus, the driver fails to transmit
and receive packet after XDP prog setup.

This commit adds the missing queue reset into stmmac_xdp_open() function.

Fixes: f9ec5723c3db ("net: ethernet: stmicro: stmmac: move queue reset to dedicated functions")
Cc: <stable@vger.kernel.org> # 6.0+
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3e5bbfe3c41b..e4c27eb17bd2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6630,6 +6630,8 @@ int stmmac_xdp_open(struct net_device *dev)
 		goto init_error;
 	}
 
+	stmmac_reset_queues_param(priv);
+
 	/* DMA CSR Channel configuration */
 	for (chan = 0; chan < dma_csr_ch; chan++) {
 		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
