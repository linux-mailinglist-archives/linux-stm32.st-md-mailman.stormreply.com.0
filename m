Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6DC6D2A23
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37FDC69069;
	Fri, 31 Mar 2023 21:46:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E7EBC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7NPphVXuuo2sRVT4OizlVk+OtH9uOngEwDv1ZDpQUE=;
 b=UhAOTNI5OKijJmVdGSZBcASmVAwRIBmA9KaBUS4Mxcw08ub0WUjq60XavcRxXlsE/xyLts
 V7qqtrvvjDt6h/WTtaOzVnNVhe8ChwEU6hB6/KePvQsjrdtYVPcCQspoqf7Ii9+n97bAZq
 8yM/KPoZsxCYmyWaIC0Z6syOEpQ1rxY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-E7eQH01aPY-6T2JrIy5Huw-1; Fri, 31 Mar 2023 17:46:37 -0400
X-MC-Unique: E7eQH01aPY-6T2JrIy5Huw-1
Received: by mail-ot1-f69.google.com with SMTP id
 f23-20020a056830205700b006a1d2e5b085so1820782otp.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7NPphVXuuo2sRVT4OizlVk+OtH9uOngEwDv1ZDpQUE=;
 b=i7mguPxmMfylzCI68MqWdIlOItO8uL2GQNvg+DvWWslU3JGboobRuGTv3sTc7gInef
 W9e4wh8uUnkQ3GiiylStCdNesp+pHfpJ7aRCq0IHFNMu8s/F2ko+zmTNFJBs+oaNH/ku
 M14Al1acId3w7xMtG6RfGeJiuc3VNs6ltOTzEI9zXdLHCbIs6eHGtimrhJNP/DyUCw83
 05msO7fyM3/0CURZV4U/VMS4GlLZppZRHbUrIceA6wB/M9t/pk8orGKtR37/hxJLO4gs
 0U0O5Mzvx6WAa/sFvf6ysy7XaUwL16VsUdMi/PiD9nVvGRoKMoj4yba/E3nJCR3LpQd6
 69hw==
X-Gm-Message-State: AO0yUKXehBVoua4u6surfeGdXNuQq4f41Xz3k/D2xxJXOjmZ3TiYEDyt
 MFgfmpGJ833z/rPZkduG07OpQx/2i40mmyN4r0XdHF8amgf50fOfvNALT4tLmljUufPwbc5BVrZ
 XUHmsOeQ1gwy9REiOBT0hSORP9bj8O56GyNy1absQ
X-Received: by 2002:aca:2b0a:0:b0:384:374c:43c7 with SMTP id
 i10-20020aca2b0a000000b00384374c43c7mr11028720oik.25.1680299196274; 
 Fri, 31 Mar 2023 14:46:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set8JAXLdJ9pZGTld4eVBbzaYtdI5QMMeORq1d+3pmcUbhDJNZAQlUGcOKs1/jpyvpKckYitGNg==
X-Received: by 2002:aca:2b0a:0:b0:384:374c:43c7 with SMTP id
 i10-20020aca2b0a000000b00384374c43c7mr11028697oik.25.1680299195874; 
 Fri, 31 Mar 2023 14:46:35 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:35 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:44 -0500
Message-Id: <20230331214549.756660-8-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331214549.756660-1-ahalaney@redhat.com>
References: <20230331214549.756660-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 07/12] net: stmmac: Remove some
	unnecessary void pointers
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

There's a few spots in the hardware interface where a void pointer is
used, but what's passed in and later cast out is always the same type.

Just use the proper type directly.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v2:
    * New patch. In later patches refactoring hwif.h I touched these in
      their first form (which was later dropped) and changed this as
      part of that. But I thought the change was still good overall,
      so I left this improvement in the series.

 .../net/ethernet/stmicro/stmmac/chain_mode.c  | 10 +++----
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |  4 +--
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  8 ++---
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  6 ++--
 .../net/ethernet/stmicro/stmmac/enh_desc.c    | 11 +++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 30 ++++++++++++-------
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  8 ++---
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 10 +++----
 8 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index 2e8744ac6b91..fb55efd52240 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -14,9 +14,9 @@
 
 #include "stmmac.h"
 
-static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
+static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+		     int csum)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)p;
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
@@ -125,9 +125,8 @@ static void init_dma_chain(void *des, dma_addr_t phy_addr,
 	}
 }
 
-static void refill_desc3(void *priv_ptr, struct dma_desc *p)
+static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
 {
-	struct stmmac_rx_queue *rx_q = (struct stmmac_rx_queue *)priv_ptr;
 	struct stmmac_priv *priv = rx_q->priv_data;
 
 	if (priv->hwts_rx_en && !priv->extend_desc)
@@ -141,9 +140,8 @@ static void refill_desc3(void *priv_ptr, struct dma_desc *p)
 				      sizeof(struct dma_desc)));
 }
 
-static void clean_desc3(void *priv_ptr, struct dma_desc *p)
+static void clean_desc3(struct stmmac_tx_queue *tx_q, struct dma_desc *p)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)priv_ptr;
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->dirty_tx;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
index 8f0d9bc7cab5..f6abc7bfd29d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
@@ -80,10 +80,10 @@ static void dwmac100_dump_dma_regs(void __iomem *ioaddr, u32 *reg_space)
 }
 
 /* DMA controller has two counters to track the number of the missed frames. */
-static void dwmac100_dma_diagnostic_fr(void *data, struct stmmac_extra_stats *x,
+static void dwmac100_dma_diagnostic_fr(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	u32 csr8 = readl(ioaddr + DMA_MISSED_FRAME_CTR);
 
 	if (unlikely(csr8)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 8cc80b1db4cb..6a011d8633e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -13,11 +13,11 @@
 #include "dwmac4.h"
 #include "dwmac4_descs.h"
 
-static int dwmac4_wrback_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int dwmac4_wrback_get_tx_status(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       struct dma_desc *p,
 				       void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes3;
 	int ret = tx_done;
 
@@ -73,10 +73,10 @@ static int dwmac4_wrback_get_tx_status(void *data, struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int dwmac4_wrback_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int dwmac4_wrback_get_rx_status(struct net_device_stats *stats,
+				       struct stmmac_extra_stats *x,
 				       struct dma_desc *p)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int rdes1 = le32_to_cpu(p->des1);
 	unsigned int rdes2 = le32_to_cpu(p->des2);
 	unsigned int rdes3 = le32_to_cpu(p->des3);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b1f0c3984a09..13c347ee8be9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -8,7 +8,8 @@
 #include "common.h"
 #include "dwxgmac2.h"
 
-static int dwxgmac2_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int dwxgmac2_get_tx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
 	unsigned int tdes3 = le32_to_cpu(p->des3);
@@ -22,7 +23,8 @@ static int dwxgmac2_get_tx_status(void *data, struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int dwxgmac2_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int dwxgmac2_get_rx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
 	unsigned int rdes3 = le32_to_cpu(p->des3);
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 1bcbbd724fb5..a91d8f13a931 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -12,10 +12,10 @@
 #include "common.h"
 #include "descs_com.h"
 
-static int enh_desc_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int enh_desc_get_tx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes0 = le32_to_cpu(p->des0);
 	int ret = tx_done;
 
@@ -117,7 +117,8 @@ static int enh_desc_coe_rdes0(int ipc_err, int type, int payload_err)
 	return ret;
 }
 
-static void enh_desc_get_ext_status(void *data, struct stmmac_extra_stats *x,
+static void enh_desc_get_ext_status(struct net_device_stats *stats,
+				    struct stmmac_extra_stats *x,
 				    struct dma_extended_desc *p)
 {
 	unsigned int rdes0 = le32_to_cpu(p->basic.des0);
@@ -181,10 +182,10 @@ static void enh_desc_get_ext_status(void *data, struct stmmac_extra_stats *x,
 	}
 }
 
-static int enh_desc_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int enh_desc_get_rx_status(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int rdes0 = le32_to_cpu(p->des0);
 	int ret = good_frame;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 16a7421715cb..4572d9a059b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -56,8 +56,9 @@ struct stmmac_desc_ops {
 	/* Last tx segment reports the transmit status */
 	int (*get_tx_ls)(struct dma_desc *p);
 	/* Return the transmit status looking at the TDES1 */
-	int (*tx_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_desc *p, void __iomem *ioaddr);
+	int (*tx_status)(struct net_device_stats *stats,
+			 struct stmmac_extra_stats *x,
+			 struct dma_desc *p, void __iomem *ioaddr);
 	/* Get the buffer size from the descriptor */
 	int (*get_tx_len)(struct dma_desc *p);
 	/* Handle extra events on specific interrupts hw dependent */
@@ -65,10 +66,12 @@ struct stmmac_desc_ops {
 	/* Get the receive frame size */
 	int (*get_rx_frame_len)(struct dma_desc *p, int rx_coe_type);
 	/* Return the reception status looking at the RDES1 */
-	int (*rx_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_desc *p);
-	void (*rx_extended_status)(void *data, struct stmmac_extra_stats *x,
-			struct dma_extended_desc *p);
+	int (*rx_status)(struct net_device_stats *stats,
+			 struct stmmac_extra_stats *x,
+			 struct dma_desc *p);
+	void (*rx_extended_status)(struct net_device_stats *stats,
+				   struct stmmac_extra_stats *x,
+				   struct dma_extended_desc *p);
 	/* Set tx timestamp enable bit */
 	void (*enable_tx_timestamp) (struct dma_desc *p);
 	/* get tx timestamp status */
@@ -185,8 +188,9 @@ struct stmmac_dma_ops {
 	void (*dma_tx_mode)(void __iomem *ioaddr, int mode, u32 channel,
 			    int fifosz, u8 qmode);
 	/* To track extra statistic (if supported) */
-	void (*dma_diagnostic_fr) (void *data, struct stmmac_extra_stats *x,
-				   void __iomem *ioaddr);
+	void (*dma_diagnostic_fr)(struct net_device_stats *stats,
+				  struct stmmac_extra_stats *x,
+				  void __iomem *ioaddr);
 	void (*enable_dma_transmission) (void __iomem *ioaddr);
 	void (*enable_dma_irq)(void __iomem *ioaddr, u32 chan,
 			       bool rx, bool tx);
@@ -535,16 +539,20 @@ struct stmmac_hwtimestamp {
 #define stmmac_timestamp_interrupt(__priv, __args...) \
 	stmmac_do_void_callback(__priv, ptp, timestamp_interrupt, __args)
 
+struct stmmac_tx_queue;
+struct stmmac_rx_queue;
+
 /* Helpers to manage the descriptors for chain and ring modes */
 struct stmmac_mode_ops {
 	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
 		      unsigned int extend_desc);
 	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
-	int (*jumbo_frm)(void *priv, struct sk_buff *skb, int csum);
+	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+			 int csum);
 	int (*set_16kib_bfsize)(int mtu);
 	void (*init_desc3)(struct dma_desc *p);
-	void (*refill_desc3) (void *priv, struct dma_desc *p);
-	void (*clean_desc3) (void *priv, struct dma_desc *p);
+	void (*refill_desc3)(struct stmmac_rx_queue *rx_q, struct dma_desc *p);
+	void (*clean_desc3)(struct stmmac_tx_queue *tx_q, struct dma_desc *p);
 };
 
 #define stmmac_mode_init(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index e3da4da242ee..350e6670a576 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -12,10 +12,10 @@
 #include "common.h"
 #include "descs_com.h"
 
-static int ndesc_get_tx_status(void *data, struct stmmac_extra_stats *x,
+static int ndesc_get_tx_status(struct net_device_stats *stats,
+			       struct stmmac_extra_stats *x,
 			       struct dma_desc *p, void __iomem *ioaddr)
 {
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 	unsigned int tdes0 = le32_to_cpu(p->des0);
 	unsigned int tdes1 = le32_to_cpu(p->des1);
 	int ret = tx_done;
@@ -70,12 +70,12 @@ static int ndesc_get_tx_len(struct dma_desc *p)
  * and, if required, updates the multicast statistics.
  * In case of success, it returns good_frame because the GMAC device
  * is supposed to be able to compute the csum in HW. */
-static int ndesc_get_rx_status(void *data, struct stmmac_extra_stats *x,
+static int ndesc_get_rx_status(struct net_device_stats *stats,
+			       struct stmmac_extra_stats *x,
 			       struct dma_desc *p)
 {
 	int ret = good_frame;
 	unsigned int rdes0 = le32_to_cpu(p->des0);
-	struct net_device_stats *stats = (struct net_device_stats *)data;
 
 	if (unlikely(rdes0 & RDES0_OWN))
 		return dma_own;
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 2b5b17d8b8a0..d218412ca832 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -14,9 +14,9 @@
 
 #include "stmmac.h"
 
-static int jumbo_frm(void *p, struct sk_buff *skb, int csum)
+static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
+		     int csum)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)p;
 	unsigned int nopaged_len = skb_headlen(skb);
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->cur_tx;
@@ -101,9 +101,8 @@ static unsigned int is_jumbo_frm(int len, int enh_desc)
 	return ret;
 }
 
-static void refill_desc3(void *priv_ptr, struct dma_desc *p)
+static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
 {
-	struct stmmac_rx_queue *rx_q = priv_ptr;
 	struct stmmac_priv *priv = rx_q->priv_data;
 
 	/* Fill DES3 in case of RING mode */
@@ -117,9 +116,8 @@ static void init_desc3(struct dma_desc *p)
 	p->des3 = cpu_to_le32(le32_to_cpu(p->des2) + BUF_SIZE_8KiB);
 }
 
-static void clean_desc3(void *priv_ptr, struct dma_desc *p)
+static void clean_desc3(struct stmmac_tx_queue *tx_q, struct dma_desc *p)
 {
-	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)priv_ptr;
 	struct stmmac_priv *priv = tx_q->priv_data;
 	unsigned int entry = tx_q->dirty_tx;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
