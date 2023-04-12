Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6386DF0C1
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 11:43:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8987C69066;
	Wed, 12 Apr 2023 09:43:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99CDDC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681292628; x=1712828628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LwEHEzc7bD+80SZfiRcNMHZOLAyRIwPq6TVR/GpsF7s=;
 b=R9bKUSVncbKyIb+s7EvW1hC/LjnE1Zt9xvfe+9QSouvo3JUtobuwuzWD
 27LBY72Hv3RCXRhpo71aB1++/i2BgLbwMzbYMY/GJSyr8kp2gc11vnSgE
 3IhCF9L7Mwq896oy46AtXu8m6FqfEIKNHKAkJmLzg/MgVPikPQ64KAU1c
 816oUkCYnWAAEbWcgvMEuK+p3ScvJ9vecKR/uK7iaqU5kX8XrYW0Givap
 xrTj1xkgsUIdhzt4eWwRKZTgD9K/u53csH/mKrF9mn1KHPhCfvUEB3lim
 WLURfDz4mPNUrFvRYs8ormhT5D68XWBrwIr4jdUkqXaJ1M4tbblSeR1Yz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346526476"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="346526476"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 02:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682430970"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="682430970"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 02:43:38 -0700
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
Date: Wed, 12 Apr 2023 17:42:35 +0800
Message-Id: <20230412094235.589089-5-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412094235.589089-1-yoong.siang.song@intel.com>
References: <20230412094235.589089-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 4/4] net: stmmac: add Rx HWTS
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
index ed660927b628..1c4dbac90717 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1611,6 +1611,12 @@ static int stmmac_alloc_rx_buffers_zc(struct stmmac_priv *priv,
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
@@ -4999,6 +5005,16 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
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
@@ -5028,6 +5044,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	}
 	while (count < limit) {
 		struct stmmac_rx_buffer *buf;
+		struct stmmac_xdp_buff *ctx;
 		unsigned int buf1_len = 0;
 		struct dma_desc *np, *p;
 		int entry;
@@ -5113,6 +5130,11 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
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
