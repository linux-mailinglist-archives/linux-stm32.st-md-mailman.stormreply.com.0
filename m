Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F2529BFE
	for <lists+linux-stm32@lfdr.de>; Tue, 17 May 2022 10:16:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99EDAC03FDB;
	Tue, 17 May 2022 08:16:11 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88298C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 08:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1652775370;
 x=1684311370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QLbnCx3HBW2+UtwoL1AvPcfRbpxQXJtdAP9UdNVlnlw=;
 b=N7U7cKdP04WYrgSQTRMgQPwFuzF1VoQW9Yk+r7ih6IVqOUAmJQvGKNyh
 sosjyb4OsExc9n06f8RIcmiRoGpjjHNltDWmH9rEoGYjgxtZXzbkQRAgx
 jT4lVwkpR7/1su0KmfXuWq647oWx1gDAzmhWM77D4aFgoPQHXMki8n01s
 DfvXW4C4EAJIx3D0vpu3HIfzd384J1L8xpdlV4twnNroszR80ocz9Z9eX
 rQ43N73f9UKvwAgdPU4RwDYog6nlBqhZQDVkMKxJJz1QrTNTa8Xopdyd+
 bHbkRyNPIC5DXwlxqewCh2F2tYScKw+U0V47fL6O0PgWrKdOnH9R8iJhr g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Date: Tue, 17 May 2022 10:16:01 +0200
Message-ID: <20220517081602.1826154-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: remove unused
	get_addr() callback
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

The last caller of the stmmac_desc_ops::get_addr() callback was removed
a while ago, so remove the unused callback.

Note that the callback also only gets half the descriptor address on
systems with 64-bit descriptor addresses, so that should be fixed if it
needs to be resurrected later.

Fixes: ec222003bd948de8f3 ("net: stmmac: Prepare to add Split Header support")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 4 ----
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index d3b4765c1a5b..8cc80b1db4cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -462,11 +462,6 @@ static void dwmac4_set_mss_ctxt(struct dma_desc *p, unsigned int mss)
 	p->des3 = cpu_to_le32(TDES3_CONTEXT_TYPE | TDES3_CTXT_TCMSSV);
 }
 
-static void dwmac4_get_addr(struct dma_desc *p, unsigned int *addr)
-{
-	*addr = le32_to_cpu(p->des0);
-}
-
 static void dwmac4_set_addr(struct dma_desc *p, dma_addr_t addr)
 {
 	p->des0 = cpu_to_le32(lower_32_bits(addr));
@@ -575,7 +570,6 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.init_tx_desc = dwmac4_rd_init_tx_desc,
 	.display_ring = dwmac4_display_ring,
 	.set_mss = dwmac4_set_mss_ctxt,
-	.get_addr = dwmac4_get_addr,
 	.set_addr = dwmac4_set_addr,
 	.clear = dwmac4_clear,
 	.set_sarc = dwmac4_set_sarc,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index ccfb0102dde4..b1f0c3984a09 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -239,11 +239,6 @@ static void dwxgmac2_set_mss(struct dma_desc *p, unsigned int mss)
 	p->des3 = cpu_to_le32(XGMAC_TDES3_CTXT | XGMAC_TDES3_TCMSSV);
 }
 
-static void dwxgmac2_get_addr(struct dma_desc *p, unsigned int *addr)
-{
-	*addr = le32_to_cpu(p->des0);
-}
-
 static void dwxgmac2_set_addr(struct dma_desc *p, dma_addr_t addr)
 {
 	p->des0 = cpu_to_le32(lower_32_bits(addr));
@@ -366,7 +361,6 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.init_rx_desc = dwxgmac2_init_rx_desc,
 	.init_tx_desc = dwxgmac2_init_tx_desc,
 	.set_mss = dwxgmac2_set_mss,
-	.get_addr = dwxgmac2_get_addr,
 	.set_addr = dwxgmac2_set_addr,
 	.clear = dwxgmac2_clear,
 	.get_rx_hash = dwxgmac2_get_rx_hash,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 6650edfab5bc..1bcbbd724fb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -440,11 +440,6 @@ static void enh_desc_display_ring(void *head, unsigned int size, bool rx,
 	pr_info("\n");
 }
 
-static void enh_desc_get_addr(struct dma_desc *p, unsigned int *addr)
-{
-	*addr = le32_to_cpu(p->des2);
-}
-
 static void enh_desc_set_addr(struct dma_desc *p, dma_addr_t addr)
 {
 	p->des2 = cpu_to_le32(addr);
@@ -475,7 +470,6 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.get_timestamp = enh_desc_get_timestamp,
 	.get_rx_timestamp_status = enh_desc_get_rx_timestamp_status,
 	.display_ring = enh_desc_display_ring,
-	.get_addr = enh_desc_get_addr,
 	.set_addr = enh_desc_set_addr,
 	.clear = enh_desc_clear,
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index f7dc447f05a0..592b4067f9b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -82,8 +82,6 @@ struct stmmac_desc_ops {
 			     dma_addr_t dma_rx_phy, unsigned int desc_size);
 	/* set MSS via context descriptor */
 	void (*set_mss)(struct dma_desc *p, unsigned int mss);
-	/* get descriptor skbuff address */
-	void (*get_addr)(struct dma_desc *p, unsigned int *addr);
 	/* set descriptor skbuff address */
 	void (*set_addr)(struct dma_desc *p, dma_addr_t addr);
 	/* clear descriptor */
@@ -142,8 +140,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, display_ring, __args)
 #define stmmac_set_mss(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_mss, __args)
-#define stmmac_get_desc_addr(__priv, __args...) \
-	stmmac_do_void_callback(__priv, desc, get_addr, __args)
 #define stmmac_set_desc_addr(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_addr, __args)
 #define stmmac_clear_desc(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 98ef43f35802..e3da4da242ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -292,11 +292,6 @@ static void ndesc_display_ring(void *head, unsigned int size, bool rx,
 	pr_info("\n");
 }
 
-static void ndesc_get_addr(struct dma_desc *p, unsigned int *addr)
-{
-	*addr = le32_to_cpu(p->des2);
-}
-
 static void ndesc_set_addr(struct dma_desc *p, dma_addr_t addr)
 {
 	p->des2 = cpu_to_le32(addr);
@@ -326,7 +321,6 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.get_timestamp = ndesc_get_timestamp,
 	.get_rx_timestamp_status = ndesc_get_rx_timestamp_status,
 	.display_ring = ndesc_display_ring,
-	.get_addr = ndesc_get_addr,
 	.set_addr = ndesc_set_addr,
 	.clear = ndesc_clear,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
