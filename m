Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED16E1BB1
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 07:28:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8586DC69066;
	Fri, 14 Apr 2023 05:28:01 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27243C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 05:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681450080; x=1712986080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iHZ3pySy0Mry1kT1bLKTKmQEXlQGTOhTLuIriclyu7A=;
 b=h35/n8cVlI2Db3GnahIpa5vZDAzwXrgn5PzbOdnlBFHBR/52qYjB7Bx1
 lfrMaIdDYDdg8wji0ujWfgBTBh+E4CmVJQDwUsVqp+DEYwnl6V/n4HVhQ
 Yal8UAgkp/y33+66XkHh1U2FGE3+YuR/hKMrs+KD3MGex3c2WNI/bH/nO
 tBs9vEu8Zk91yg76TW2iaUbWbAAtntMX1jTFucSquSe6mUrXWj+/XXfl5
 RGXy8mww7hXr5jyErxbuc/pb3ezA05CQs6ujV+zZeoAIYySW/aPf/MvIo
 0AquBVEy3W5raeSPn4ZRJg9Au6oIBjVT1cYQ2UD5uGhTtYXU2YUPj21z6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333152755"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="333152755"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 22:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692234171"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="692234171"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2023 22:27:52 -0700
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
Date: Fri, 14 Apr 2023 13:26:51 +0800
Message-Id: <20230414052651.1871424-4-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414052651.1871424-1-yoong.siang.song@intel.com>
References: <20230414052651.1871424-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: add Rx HWTS
	metadata to XDP ZC receive pkt
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

Add receive hardware timestamp metadata support via kfunc to XDP Zero Copy
receive packets.

Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 74f78e5537a3..f3b8eae0846e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1614,6 +1614,12 @@ static int stmmac_alloc_rx_buffers_zc(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* struct stmmac_xdp_buff is using cb field (maximum size of 24 bytes)
+	 * in struct xdp_buff_xsk to stash driver specific information. Thus,
+	 * use this macro to make sure no size violations.
+	 */
+	XSK_CHECK_PRIV_TYPE(struct stmmac_xdp_buff);
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		struct stmmac_rx_buffer *buf;
 		dma_addr_t dma_addr;
@@ -4998,6 +5004,16 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 	return ret;
 }
 
+static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
+{
+	/* In XDP zero copy data path, xdp field in struct xdp_buff_xsk is used
+	 * to represent incoming packet, whereas cb field in the same structure
+	 * is used to store driver specific info. Thus, struct stmmac_xdp_buff
+	 * is laid on top of xdp and cb fields of struct xdp_buff_xsk.
+	 */
+	return (struct stmmac_xdp_buff *)xdp;
+}
+
 static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
@@ -5027,6 +5043,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	}
 	while (count < limit) {
 		struct stmmac_rx_buffer *buf;
+		struct stmmac_xdp_buff *ctx;
 		unsigned int buf1_len = 0;
 		struct dma_desc *np, *p;
 		int entry;
@@ -5112,6 +5129,11 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			goto read_again;
 		}
 
+		ctx = xsk_buff_to_stmmac_ctx(buf->xdp);
+		ctx->priv = priv;
+		ctx->p = p;
+		ctx->np = np;
+
 		/* XDP ZC Frame only support primary buffers for now */
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
