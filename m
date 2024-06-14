Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BB908424
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 09:02:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD0BFC6C83A;
	Fri, 14 Jun 2024 07:02:44 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D5B7C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 07:02:37 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3d23db75f5cso1041738b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718348556; x=1718953356;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=By4P0vcgLroOQCJskwfGLQoINqqC43myu7beQ18KDt0=;
 b=jY/wUuwVexP7+HgTxmVVrfqQWFkkw4NkGEuPHnfo8MsiH23vrLN1YvJVIaxFeoJ6dZ
 CLd//cr0XUjGToHjTgt3KdiW/MF6MXo8RVIhpGPQ7F8FOQSrdGh681CaXnvFd4VDXmKI
 DALUSQs31UHNOymcuSi50WlbAvW5tnoe8Ki4HXExCvQHqT44x+wpjJJf9d4ghHMcKzI5
 D414zFtlhVQTrjKCtU00wmgqtWq92PK00+sUcgZrh2f85BtXR/LrFVrOcs9KQaBDhJlj
 PnsDYAeX9k7NlkFEaORCOj1A+rXYkEMiihZpSiwieEAtQ01XkodziIjwqsfgAFxrUMym
 Q/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718348556; x=1718953356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=By4P0vcgLroOQCJskwfGLQoINqqC43myu7beQ18KDt0=;
 b=K9zdIJdt6I+7Qa08hztbcClhE6ZgL7t04Hp7VVaxY05kejYI1zCgCGX6KMbNnAEuTa
 zEIf6XLTaV8kBE3/Dhuir8sTvLNShaujYbR2oISJxTFMTfu41m1YaClvD1ElW2UqJitQ
 bEFOgndRLrm1AteqaZ+AUNCvxc6HBL9HOIuZwXSWsdReCN8biMyVuZtkyclgbFbUN1ov
 JqcaBnXk6Rd4LTEe25Gr8KLu9QFQUNaZBQFan13QXI7LPagc0yHB4tIVAU+STXnXjaaZ
 eMt6wfPE550BP0t8da+ru45vdzaT31wXqO8xBniKi7E1nz4oQNixjMwZUrcJxn0INwZY
 byqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4QDJq3FbfqIW9zgdhe0rPGEUpRjygwWGb/DnyyzZIeqw/bMDRUT2Zp2sCZyn3WdPJxeXHHGpcr7R1Ne8orP+l3gMQTJMPdQ0BL80KRhhASsiqOK73GV8q
X-Gm-Message-State: AOJu0Yxzt2O/vfZaIXDatNUbkQx4CiZoBiMscCly30xYs1wejzZbBMac
 iuW4Hxhv2lp7MxvZuBhTSdgrBkj3dNwPk1lTjAvgQpDLFXwKH+Uv
X-Google-Smtp-Source: AGHT+IFIcoEGF1ujGsaAknACmdVAzRUo/ikVN155rUrAwKruOrjOfcAV7bcoaC10WeY7S6jOQeHj6w==
X-Received: by 2002:a05:6358:7184:b0:19f:5631:97cd with SMTP id
 e5c5f4694b2df-19fa9e5c312mr252970455d.15.1718348555911; 
 Fri, 14 Jun 2024 00:02:35 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-6fede354612sm2072893a12.35.2024.06.14.00.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:02:35 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Corinna Vinschen <vinschen@redhat.com>
Date: Fri, 14 Jun 2024 15:02:06 +0800
Message-Id: <20240614070206.506999-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3] net: stmmac: Enable TSO on VLANs
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
  Changes in v3:
    - Drop packet and increase stats counter when vlan tag insert fails.

  Changes in v2:
    - Use __vlan_hwaccel_push_inside() to insert vlan tag to the payload.
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bbedf2a8c60f..87aa3528cc0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4233,18 +4233,32 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4297,9 +4311,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			skb->data_len);
 	}
 
-	/* Check if VLAN can be inserted by HW */
-	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
-
 	first_entry = tx_q->cur_tx;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
@@ -4309,9 +4320,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		desc = &tx_q->dma_tx[first_entry];
 	first = desc;
 
-	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
-
 	/* first descriptor: fill Headers on Buf1 */
 	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
@@ -7678,8 +7686,6 @@ int stmmac_dvr_probe(struct device *device,
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
