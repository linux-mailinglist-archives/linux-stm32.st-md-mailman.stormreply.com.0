Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82A350C44
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 04:07:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9386EC57B60;
	Thu,  1 Apr 2021 02:07:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 461F1C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 02:07:55 +0000 (UTC)
IronPort-SDR: N6tsZyhxQGQfFTOOEvecDDwLDDgIfFNdHBDKcplyX/ajFRTaDgUkAxqEMBFzyrGwoqDES5F2ri
 68rM0gKQBoIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="256117451"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="256117451"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 19:07:52 -0700
IronPort-SDR: nbGoBPcLLGTjmaCEl0zzbCgZoGVn1aKC9AVezmMzl1gtBtCGJTaz/QIQaOEVYI1330cvG7qhvQ
 I3oIQJrSr+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; d="scan'208";a="528004218"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga004.jf.intel.com with ESMTP; 31 Mar 2021 19:07:40 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Thu,  1 Apr 2021 10:11:13 +0800
Message-Id: <20210401021117.13360-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401021117.13360-1-boon.leong.ong@intel.com>
References: <20210401021117.13360-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 2/6] net: stmmac: make SPH
	enable/disable to be configurable
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

SPH functionality splits header and payload according to split mode and
offsef fields (SPLM and SPLOFST). It is beneficials for Linux network
stack RX processing however it adds a lot of complexity in XDP
processing.

So, this patch makes the split-header (SPH) capability of the controller
is stored in "priv->sph_cap" and the enabling/disabling of SPH is decided
by "priv->sph".

This is to prepare initial XDP enabling for stmmac to disable the use of
SPH whenever XDP is enabled.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 9966f6f10905..e293423f98c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -160,6 +160,7 @@ struct stmmac_priv {
 	bool tx_path_in_lpi_mode;
 	bool tso;
 	int sph;
+	int sph_cap;
 	u32 sarc_type;
 
 	unsigned int dma_buf_sz;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9d63e8c365ae..18e34a1e2367 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2858,6 +2858,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	bool sph_en;
 	u32 chan;
 	int ret;
 
@@ -2952,10 +2953,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	}
 
 	/* Enable Split Header */
-	if (priv->sph && priv->hw->rx_csum) {
-		for (chan = 0; chan < rx_cnt; chan++)
-			stmmac_enable_sph(priv, priv->ioaddr, 1, chan);
-	}
+	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
+	for (chan = 0; chan < rx_cnt; chan++)
+		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
+
 
 	/* VLAN Tag Insertion */
 	if (priv->dma_cap.vlins)
@@ -5708,7 +5709,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	if (priv->dma_cap.sphen) {
 		ndev->hw_features |= NETIF_F_GRO;
-		priv->sph = true;
+		priv->sph_cap = true;
+		priv->sph = priv->sph_cap;
 		dev_info(priv->device, "SPH feature enabled\n");
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
