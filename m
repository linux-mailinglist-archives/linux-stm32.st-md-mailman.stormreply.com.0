Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B29737E0
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 14:49:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1944C712A2;
	Tue, 10 Sep 2024 12:49:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C323AC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 12:49:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A3mWQs012504;
 Tue, 10 Sep 2024 12:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QLxu6xuI7/T7WoWyBPd/0v1krzM5A9Tib1ZVe5b9ybc=; b=HAQ4RDquDCGHj0Tm
 JbYRE5GXW/sG/U0/k3aDiSS4w4KXQVoZ/nGPpRkLLE5fGE9k1yMvlol9mKNn7qVA
 pPVzwTYerGJdNiK1fs8mmEr0jKK6WUWjYW8dLlcpWca2dijxkV/Zmsqyw08b05VX
 rw2QE6ZDzHeQdCxoAd4zmjhvLDVTqfjWcqg12G8lXq33bAjMLlmH8+WMN+k0AO0u
 9D01rL1kDMXVVvPI40g1m5aLer59O7U1tSmmVVvmME0O/d95sX9KxmqcBFwdA47I
 +2IRiCEpcenKzYXfzsIWpM6vqw84rLenq4gAliIZ0OsggqqY1go7heaH6e7iFXC5
 YACMuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy8nwxhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 12:49:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ACn4aD015158
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 12:49:04 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 05:48:57 -0700
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
Date: Tue, 10 Sep 2024 18:18:41 +0530
Message-ID: <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
References: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ynw6_U9wJATRC4XEURlu8QaulYYyNNvS
X-Proofpoint-ORIG-GUID: Ynw6_U9wJATRC4XEURlu8QaulYYyNNvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100095
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH v2] net: stmmac: allocate separate page for
	buffer
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

Currently for TSO page is mapped with dma_map_single()
and then resulting dma address is referenced (and offset)
by multiple descriptors until the whole region is
programmed into the descriptors.
This makes it possible for stmmac_tx_clean() to dma_unmap()
the first of the already processed descriptors, while the
rest are still being processed by the DMA engine. This leads
to an iommu fault due to the DMA engine using unmapped memory
as seen below:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
iova=0xfc401000, fsynr=0x60003, cbfrsynra=0x121, cb=38

Descriptor content:
     TDES0       TDES1   TDES2   TDES3
317: 0xfc400800  0x0     0x36    0xa02c0b68
318: 0xfc400836  0x0     0xb68   0x90000000

As we can see above descriptor 317 holding a page address
and 318 holding the buffer address by adding offset to page
addess. Now if 317 descritor is cleaned as part of tx_clean()
then we will get SMMU fault if 318 descriptor is getting accessed.

To fix this, let's map each descriptor's memory reference individually.
This way there's no risk of unmapping a region that's still being
referenced by the DMA engine in a later descriptor.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
---

Changes since v2:
- Update commit text with more details.
- fixed Reverse xmas tree order issue.


Changes since v1:
- Fixed function description 
- Fixed handling of return value.


 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 ++++++++++++-------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 83b654b7a9fd..98d5a4b64cac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4136,21 +4136,25 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
 /**
  *  stmmac_tso_allocator - close entry point of the driver
  *  @priv: driver private structure
- *  @des: buffer start address
+ *  @addr: Contains either skb frag address or skb->data address
  *  @total_len: total length to fill in descriptors
  *  @last_segment: condition for the last descriptor
  *  @queue: TX queue index
+ * @is_skb_frag: condition to check whether skb data is part of fragment or not
  *  Description:
  *  This function fills descriptor and request new descriptors according to
  *  buffer length to fill
+ *  This function returns 0 on success else -ERRNO on fail
  */
-static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
-				 int total_len, bool last_segment, u32 queue)
+static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
+				int total_len, bool last_segment, u32 queue, bool is_skb_frag)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct dma_desc *desc;
 	u32 buff_size;
 	int tmp_len;
+	unsigned char *data = addr;
+	unsigned int offset = 0;
 
 	tmp_len = total_len;
 
@@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 						priv->dma_conf.dma_tx_size);
 		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
 
+		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ? TSO_MAX_BUFF_SIZE : tmp_len;
+
 		if (tx_q->tbs & STMMAC_TBS_AVAIL)
 			desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
 		else
 			desc = &tx_q->dma_tx[tx_q->cur_tx];
 
-		curr_addr = des + (total_len - tmp_len);
+		offset = total_len - tmp_len;
+		if (!is_skb_frag) {
+			curr_addr = dma_map_single(priv->device, data + offset, buff_size,
+						   DMA_TO_DEVICE);
+
+			if (dma_mapping_error(priv->device, curr_addr))
+				return -ENOMEM;
+
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+		} else {
+			curr_addr = skb_frag_dma_map(priv->device, addr, offset,
+						     buff_size,
+						     DMA_TO_DEVICE);
+
+			if (dma_mapping_error(priv->device, curr_addr))
+				return -ENOMEM;
+
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
+			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+		}
+
 		if (priv->dma_cap.addr64 <= 32)
 			desc->des0 = cpu_to_le32(curr_addr);
 		else
 			stmmac_set_desc_addr(priv, desc, curr_addr);
 
-		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
-			    TSO_MAX_BUFF_SIZE : tmp_len;
-
 		stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
 				0, 1,
 				(last_segment) && (tmp_len <= TSO_MAX_BUFF_SIZE),
@@ -4182,6 +4210,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 
 		tmp_len -= TSO_MAX_BUFF_SIZE;
 	}
+	return 0;
 }
 
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
@@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		pay_len = 0;
 	}
 
-	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
+	if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
+				 tmp_pay_len, nfrags == 0, queue, false))
+		goto dma_map_err;
 
 	/* Prepare fragments */
 	for (i = 0; i < nfrags; i++) {
-		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 
-		des = skb_frag_dma_map(priv->device, frag, 0,
-				       skb_frag_size(frag),
-				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		if (stmmac_tso_allocator(priv, frag, skb_frag_size(frag),
+					 (i == nfrags - 1), queue, true))
 			goto dma_map_err;
-
-		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
-				     (i == nfrags - 1), queue);
-
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
-		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
 	}
 
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
