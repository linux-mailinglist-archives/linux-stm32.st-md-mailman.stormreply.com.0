Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C88908382
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 08:04:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95736C6C83A;
	Fri, 14 Jun 2024 06:04:59 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44CFC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 06:04:52 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-24c9f91242dso726018fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718345091; x=1718949891;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2lo12y0h1JrbPiWnZp57B9V/XXZzRLcsfqmffBDHVNA=;
 b=cAJ5Wb1xOn0IgoY/VmOzI65i4DA27OryS9yobitSp6eXz3SBj6a3zj9SkBEf8pyTQp
 J67aZy6pB66UQJegUc2S0lMf9GT0FQpD6AJ+wZnhfa3nKwUEFJmqcHom0N8/9sJ0heoY
 WX+55HudrqZKIphVQKz6Q6GPcnwlyfEJQIDxJ4WK/9Zgte6rkTiSdXEjQP9WEH0PI0dY
 111NaZlhI5bg1WppxcKdlJaOQgavRmk8A5OLse2f0Qesg4xbD9zzETXWuQL64IPY2aKs
 XpnvvFf9f5C3nk6TuYsatkLEYYhYkdvOSSXniGhX/RxzC760yKHu1RXn5AjXgVtBNA23
 i3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718345091; x=1718949891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2lo12y0h1JrbPiWnZp57B9V/XXZzRLcsfqmffBDHVNA=;
 b=QPghanM83+BXyG7AwD8p1KfT3sOd6tlK7Fv1Rm8PjzVYIO7s9o6ftgD8JE8bQGCO3b
 NUI+0XOWomZK4Nt1yabp+PcpWVeZGl8/Br1HQ12YJgl0MCDuUtyL6tnQcRICu7/Gg7/+
 Q1jHCqLO0G+nO07dKkzyIGboPj4Xz71oLhx4IRcxFevSSbORrc8eFejH5773DTl5ScCP
 7MXi31biafBbVZqaIaBSIHHyX5qJOPIUYeaNKSX4MJnt0TDnpK2rRBcUtjA3IHmPpdPw
 29Z8fzru2yEkEmaA2Ul6BRw2VYXalIa5tZRqS2ylovlB7Ke5H/+rSUTeQiwpDwBGPxg+
 +coA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+/PXsZkVh3txUYRZdEfT9qHaQxQ/v0ztoSgBZ7OWi7nAKs9Y6xFKv3yH6ztZAtNTGklxS1GxFpa2ytebiLRhDOcD47sdUwKrGy0QBvqt2SViwLeljSoO
X-Gm-Message-State: AOJu0YwNjetMte1Opf9iMQMWrqIX4SnpJeJpLoOiH9E8sV5PMy2O97XQ
 AbQ/Am0hkLykFrzYDJkohRBezC1X2D1Hd1FL9lzwKvR0vo5ts2Qy
X-Google-Smtp-Source: AGHT+IHd6Af/QURKSaUQ0MKuVRMqC3GMrW5NEG8Y0fvRhKF5F4mHn374tTiHmP39jrSgym0Wc2WhmQ==
X-Received: by 2002:a05:6870:2251:b0:258:456f:2f91 with SMTP id
 586e51a60fabf-258456f3325mr1445965fac.4.1718345091473; 
 Thu, 13 Jun 2024 23:04:51 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-6fee2d36622sm1969337a12.60.2024.06.13.23.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 23:04:50 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Corinna Vinschen <vinschen@redhat.com>
Date: Fri, 14 Jun 2024 14:03:49 +0800
Message-Id: <20240614060349.498414-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: Enable TSO on VLANs
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
  Changes in v2:
    - Use __vlan_hwaccel_push_inside() to insert vlan tag to the payload.
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bbedf2a8c60f..e8cbfada63ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4233,18 +4233,27 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int nfrags = skb_shinfo(skb)->nr_frags;
-	u32 queue = skb_get_queue_mapping(skb);
 	unsigned int first_entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
-	int tmp_pay_len = 0, first_tx;
+	int tmp_pay_len = 0, first_tx, nfrags;
 	struct stmmac_tx_queue *tx_q;
-	bool has_vlan, set_ic;
+	bool set_ic;
 	u8 proto_hdr_len, hdr;
-	u32 pay_len, mss;
+	u32 pay_len, mss, queue;
 	dma_addr_t des;
 	int i;
 
+	/* Always insert VLAN tag to SKB payload for TSO frames.
+	 *
+	 * Never insert VLAN tag by HW, since segments splited by
+	 * TSO engine will be un-tagged by mistake.
+	 */
+	if (skb_vlan_tag_present(skb))
+		skb = __vlan_hwaccel_push_inside(skb);
+
+	nfrags = skb_shinfo(skb)->nr_frags;
+	queue = skb_get_queue_mapping(skb);
+
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
 	first_tx = tx_q->cur_tx;
@@ -4297,9 +4306,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			skb->data_len);
 	}
 
-	/* Check if VLAN can be inserted by HW */
-	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
-
 	first_entry = tx_q->cur_tx;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
@@ -4309,9 +4315,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		desc = &tx_q->dma_tx[first_entry];
 	first = desc;
 
-	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
-
 	/* first descriptor: fill Headers on Buf1 */
 	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
@@ -7678,8 +7681,6 @@ int stmmac_dvr_probe(struct device *device,
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
