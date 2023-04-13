Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F76E052A
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 05:26:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 943BDC69063;
	Thu, 13 Apr 2023 03:26:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CABFC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 03:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681356392; x=1712892392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TbjWbgkXZyRJmhXzWEr6PAioc/rwjJEJL/AlqKlt9RE=;
 b=DwXoVv1hko7RanfGdQYVZ0hIbnJL88xty1PMAH4wJKPl+/3pDrxLqVke
 8qgbnwy4mUQ6Q9xWQ6OBzisqB1AbDK7EQ3aR/peV3iWVDb89y/6+d86i8
 PkkU6h/4N0jHzp8OpztvrdEiCh72Q9Up5bysJOZpnQ6BAv033hpeVEUb8
 iZ0jxGliEEBkSEczHrvjTbFg0jYmOFJUpyRa+69sTIV+8lBlFsvtqvyqO
 5B0ayKarfrOzMlzOSGyoaBBhWxsaPtW88K+1qE0DZpO8ILsixyZYjq3yx
 ffDUM6pnZkiIbDAgZSkTBy3Qh0Iw3c+xMxBIFO0383bkb43bjtBnW9AgH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332781682"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332781682"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 20:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800597050"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800597050"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 20:26:25 -0700
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
 Stanislav Fomichev <sdf@google.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Thu, 13 Apr 2023 11:25:40 +0800
Message-Id: <20230413032541.885238-3-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413032541.885238-1-yoong.siang.song@intel.com>
References: <20230413032541.885238-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 2/3] net: stmmac: add Rx HWTS
	metadata to XDP receive pkt
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

Add receive hardware timestamp metadata support via kfunc to XDP receive
packets.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index ac8ccf851708..826ac0ec88c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
 
 struct stmmac_xdp_buff {
 	struct xdp_buff xdp;
+	struct stmmac_priv *priv;
+	struct dma_desc *p;
+	struct dma_desc *np;
 };
 
 struct stmmac_rx_queue {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6ffce52ca837..831a3e22e0d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5313,10 +5313,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-					 buf->page_offset, buf1_len, false);
+					 buf->page_offset, buf1_len, true);
 
 			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
 				  buf->page_offset;
+
+			ctx.priv = priv;
+			ctx.p = p;
+			ctx.np = np;
+
 			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
 			/* Due xdp_adjust_tail: DMA sync for_device
 			 * cover max len CPU touch
@@ -7060,6 +7065,37 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
 	}
 }
 
+static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
+{
+	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
+	struct stmmac_priv *priv = ctx->priv;
+	struct dma_desc *desc = ctx->p;
+	struct dma_desc *np = ctx->np;
+	struct dma_desc *p = ctx->p;
+	u64 ns = 0;
+
+	if (!priv->hwts_rx_en)
+		return -ENODATA;
+
+	/* For GMAC4, the valid timestamp is from CTX next desc. */
+	if (priv->plat->has_gmac4 || priv->plat->has_xgmac)
+		desc = np;
+
+	/* Check if timestamp is available */
+	if (stmmac_get_rx_timestamp_status(priv, p, np, priv->adv_ts)) {
+		stmmac_get_timestamp(priv, desc, priv->adv_ts, &ns);
+		ns -= priv->plat->cdc_error_adj;
+		*timestamp = ns_to_ktime(ns);
+		return 0;
+	}
+
+	return -ENODATA;
+}
+
+static const struct xdp_metadata_ops stmmac_xdp_metadata_ops = {
+	.xmo_rx_timestamp		= stmmac_xdp_rx_timestamp,
+};
+
 /**
  * stmmac_dvr_probe
  * @device: device pointer
@@ -7167,6 +7203,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	ndev->netdev_ops = &stmmac_netdev_ops;
 
+	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
+
 	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
 			    NETIF_F_RXCSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
