Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1D6E2F57
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 08:45:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE99C6A611;
	Sat, 15 Apr 2023 06:45:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A58CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 06:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681541155; x=1713077155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZl572e0Aj7Ti4/ah2gEM5fYLre/3GyIiGhM4yJzXzc=;
 b=YtUZIu4OuM1sHH8LBTS9DuszkPOS5k59oV8DHdz31Y5E3Q4zdvRzqAr4
 lleJ5jCUObHm1SO1Hyesj0cxNAIGWttiVnq/lc7n8uSY97nkFMDd/Ypuc
 Y1f5Xd9ihY92k6oi7NSbr0Ny3Rv59B1mCQzsyd/WERYilS+JXJkX2Hbne
 VtlvEG1hfpaDhjvQdiluADa5e/+bc1q/ZxZNH4FaowY8ojdBxNi/XRLOz
 UKEh/bbE+yohrquyCYfX7ycLM59VUBkCnFlLeXTk2qGRUhNg7vLJN1jUM
 vXw8SUklcn7h8KmTCMDAM9tBoybVwxzsC+mN9+YyxD6pzErYdeeWCk7+j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343379296"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="343379296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 23:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754727557"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="754727557"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 23:45:48 -0700
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
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Date: Sat, 15 Apr 2023 14:45:02 +0800
Message-Id: <20230415064503.3225835-3-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415064503.3225835-1-yoong.siang.song@intel.com>
References: <20230415064503.3225835-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/3] net: stmmac: add Rx HWTS
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
Acked-by: Stanislav Fomichev <sdf@google.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index ac8ccf851708..07ea5ab0a60b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
 
 struct stmmac_xdp_buff {
 	struct xdp_buff xdp;
+	struct stmmac_priv *priv;
+	struct dma_desc *desc;
+	struct dma_desc *ndesc;
 };
 
 struct stmmac_rx_queue {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 10b9f8912bb2..2bfcc5347d6a 100644
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
+			ctx.desc = p;
+			ctx.ndesc = np;
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
+	struct dma_desc *desc_contains_ts = ctx->desc;
+	struct stmmac_priv *priv = ctx->priv;
+	struct dma_desc *ndesc = ctx->ndesc;
+	struct dma_desc *desc = ctx->desc;
+	u64 ns = 0;
+
+	if (!priv->hwts_rx_en)
+		return -ENODATA;
+
+	/* For GMAC4, the valid timestamp is from CTX next desc. */
+	if (priv->plat->has_gmac4 || priv->plat->has_xgmac)
+		desc_contains_ts = ndesc;
+
+	/* Check if timestamp is available */
+	if (stmmac_get_rx_timestamp_status(priv, desc, ndesc, priv->adv_ts)) {
+		stmmac_get_timestamp(priv, desc_contains_ts, priv->adv_ts, &ns);
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
