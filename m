Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F17909782
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Jun 2024 11:56:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29441C712A1;
	Sat, 15 Jun 2024 09:56:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE702C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jun 2024 09:56:25 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-703ed15b273so2284519b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jun 2024 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718445384; x=1719050184;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tg5u5ShuykptgMBL5I5DS/hZACOm+i1CYfL5BzH1+bY=;
 b=PqTnsa2f5YfwVFymUd6yfe2N1NAbd73VtBgWPChS+U/N8oJCP8pYFddhtlHrhh2w4H
 dA97UDBxNoqhSCVcYr3VWH0nR0GAXx4eq46qBzM4PCO205UDLAuzEK+LW7hX54E+AQD9
 8wC8f+Lbbtay/x6d89Ns5Ve3xF7V3CbgWl5W7Qwu/Ku0zxTbMPrNewsqGy6PZYNPdSTB
 jki5+FAkHFeNypBVLyaVmqXWFwozFpv/e/maP3AiwHO1qEMLXmLjkyge6t3bCmW9TxY5
 /uUipiq82zxl6IAyuZilUwhDWYHFmkxds/UlrMn2WS8BlAtYJ/E76oRmjPxH6aGgmm//
 Zl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718445384; x=1719050184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tg5u5ShuykptgMBL5I5DS/hZACOm+i1CYfL5BzH1+bY=;
 b=RjoKVStpKxVeuz/a6MJKtpuSk1Iqt8vzKzYM/LiXS+qRJT3aNXRVTSnFKB/dPT7DCu
 ivjJszSfeVXpuW/TxmzwwxCLhc93WKrfz0COq7wFvwSGd2tgdmT1bc6XYSJbGoVjFNPR
 PMx15HYNVw3HJyiz9Kkynn/Iej65izBXs0R2Sp1dtOFMVyNioJBpK75RSaCXbIFD5gg9
 FdJSuBvgdlFCTT8Okluo8RlxKKuLwHcLJsFGC7Toav9XWtO6z4qXuL1xwTogHMJG/qMW
 NtjR8eiq1GAc0UsnNYqLNsfHo+LLG8LFTLWSDgImrhwkIt+cv4mwkMFhh/RxjAcACvcW
 87dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWobQxcIMyl7vGFEk0MRpeAqqpoOVDjhBe/NuQ+3/dkEbEFAwpPmHuYfA0LB7Ut1tf+FX1e6RnbHvgGjwu02ebxj+F4qvSxQBx87DCNg8mj8H19zQruX2dC
X-Gm-Message-State: AOJu0Yxk7bhQkU5Ifuge7hLf6EI850yik3qkfYvMQE1XXGQ8uR3vhqR2
 1S6K4gm0k9Ir+zb9ROui6hrujsrO/8sHn2ffZTn5hNYOHWV7GY1h
X-Google-Smtp-Source: AGHT+IEDUVaqWTyE5K7lkt2gzZ4FztGsgWD9JDp9eG7o9DJF60GqM8BDrnujcRy+GpHK8csEE5ZSVA==
X-Received: by 2002:aa7:8b94:0:b0:702:65de:19e5 with SMTP id
 d2e1a72fcca58-705d722b7a3mr5165325b3a.33.1718445384256; 
 Sat, 15 Jun 2024 02:56:24 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-705ccb71715sm4531309b3a.175.2024.06.15.02.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 02:56:23 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Corinna Vinschen <vinschen@redhat.com>
Date: Sat, 15 Jun 2024 17:56:11 +0800
Message-Id: <20240615095611.517323-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4] net: stmmac: Enable TSO on VLANs
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

The TSO engine works well when the frames are not VLAN Tagged.
But it will produce broken segments when frames are VLAN Tagged.

The first segment is all good, while the second segment to the
last segment are broken, they lack of required VLAN tag.

An example here:
========
// 1st segment of a VLAN Tagged TSO frame, nothing wrong.
MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1518: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [.], seq 1:1449

// 2nd to last segments of a VLAN Tagged TSO frame, VLAN tag is missing.
MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 1449:2897
MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 2897:4345
MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [.], seq 4345:5793
MacSrc > MacDst, ethertype IPv4 (0x0800), length 1514: HostA:42643 > HostB:5201: Flags [P.], seq 5793:7241

// normal VLAN Tagged non-TSO frame, nothing wrong.
MacSrc > MacDst, ethertype 802.1Q (0x8100), length 1022: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [P.], seq 7241:8193
MacSrc > MacDst, ethertype 802.1Q (0x8100), length 70: vlan 100, p 1, ethertype IPv4 (0x0800), HostA:42643 > HostB:5201: Flags [F.], seq 8193
========

When transmitting VLAN Tagged TSO frames, never insert VLAN tag by HW,
always insert VLAN tag to SKB payload, then TSO works well on VLANs for
all MAC cores.

Tested on DWMAC CORE 5.10a, DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
  Changes in v4:
    - Re-arrange variables to keep reverse x-mas tree order.

  Changes in v3:
    - Drop packet and increase stats counter when vlan tag insert fails.

  Changes in v2:
    - Use __vlan_hwaccel_push_inside() to insert vlan tag to the payload.
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5ddbb0d44373..83b654b7a9fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4237,18 +4237,32 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int nfrags = skb_shinfo(skb)->nr_frags;
-	u32 queue = skb_get_queue_mapping(skb);
+	int tmp_pay_len = 0, first_tx, nfrags;
 	unsigned int first_entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
-	int tmp_pay_len = 0, first_tx;
 	struct stmmac_tx_queue *tx_q;
-	bool has_vlan, set_ic;
+	u32 pay_len, mss, queue;
 	u8 proto_hdr_len, hdr;
-	u32 pay_len, mss;
 	dma_addr_t des;
+	bool set_ic;
 	int i;
 
+	/* Always insert VLAN tag to SKB payload for TSO frames.
+	 *
+	 * Never insert VLAN tag by HW, since segments splited by
+	 * TSO engine will be un-tagged by mistake.
+	 */
+	if (skb_vlan_tag_present(skb)) {
+		skb = __vlan_hwaccel_push_inside(skb);
+		if (unlikely(!skb)) {
+			priv->xstats.tx_dropped++;
+			return NETDEV_TX_OK;
+		}
+	}
+
+	nfrags = skb_shinfo(skb)->nr_frags;
+	queue = skb_get_queue_mapping(skb);
+
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
 	first_tx = tx_q->cur_tx;
@@ -4301,9 +4315,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			skb->data_len);
 	}
 
-	/* Check if VLAN can be inserted by HW */
-	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
-
 	first_entry = tx_q->cur_tx;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
@@ -4313,9 +4324,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		desc = &tx_q->dma_tx[first_entry];
 	first = desc;
 
-	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
-
 	/* first descriptor: fill Headers on Buf1 */
 	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
@@ -7682,8 +7690,6 @@ int stmmac_dvr_probe(struct device *device,
 		ndev->features |= NETIF_F_RXHASH;
 
 	ndev->vlan_features |= ndev->features;
-	/* TSO doesn't work on VLANs yet */
-	ndev->vlan_features &= ~NETIF_F_TSO;
 
 	/* MTU range: 46 - hw-specific max */
 	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
