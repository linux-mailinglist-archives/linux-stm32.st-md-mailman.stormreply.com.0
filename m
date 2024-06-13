Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95330906208
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 04:39:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A590C712A3;
	Thu, 13 Jun 2024 02:39:08 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A15A8C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 02:39:00 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6f8edde24b3so296045a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718246339; x=1718851139;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FgbGeC4i3nOuWMYoPUlXHb+7fSmu0PqN2K8q/uuqHSs=;
 b=jXlZgd2PtoxbgBuuqfhgEbEqAkDO5dfZYntDR70wfMsxCBriKgzcU7JeqjsKnNMLB3
 Df4yBD3vVtlKKC8xKJHFT//+HSOysmYj0tMzu+t7OjRu4MCJpngPpk4nKM3MnpbE5DmW
 Gkonn/4IJfdPp18NRbEkFQoTzWTG/db2W77CkWHtepNvbU1HD2RlWYtaBKfah0Bvo7Mz
 N16ODV8mvtMynWMeXS+99NbN73V/Sg/yRwmlGZb57ioqi0WAu5f8h7J8qcseZhXtr91g
 oqh2HhxXbJ4Vag6mfJ+/GKaED2d3OUiXXJlQssEfXhCZ3NnKXDkoh03jKsUL2sr8Oln+
 i6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718246339; x=1718851139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgbGeC4i3nOuWMYoPUlXHb+7fSmu0PqN2K8q/uuqHSs=;
 b=ew4TrFw6/lIWheqg8ctx/DhlAqBMgRMosK3DJgwY6UTMnurbkxctSZIOsZzEB0w+j2
 wD7gj9l5bAQ8Ur2sAMuY9aH2vqvsoVHHZOtJKwYy1IKJWEBa4iexs077g7O8E8x7rDnl
 Mu+gB3IsQQFJjBUDhMW0nNcWJEcPsiLbGO1srm0Kdo9QTOy9ngXjMU/J4zQapZ+yD87k
 siBJRHVzscxdK+NOfMazxokRgEMPNeS+1cXQUmqCj8MP7sowB75QYt5iKq8jV/DhEJks
 ska4oeLq74hcPYqgOG49qyVQhXZULhPgkmfnpxsO+70EnQlQnayy4O6ebgUtF1pRVH8c
 PJ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ItcSovtHRgmsUPTG0enfX2QYpdKpQWBOY9g3gchIlURFyr0Dm2QHSFuCo4VuXrzLLVcQ/m2rXpfvIg7IfiWiKJp3T7alaB+K6Pe4ofgWnVhl6+R+HB5f
X-Gm-Message-State: AOJu0YzqF6slS9znDDKbvttGZ+81ALdzBMkkGpHZdZtLMm3EA2WMSRyI
 S/a3kgx+6SUgKbti0+TXOezNwSc+YqEUqWOJ/p3U9UVuTAY/qX5T
X-Google-Smtp-Source: AGHT+IGNr5kdsBRA2T5pp3GrUSQlJ23/IcNXqRpmruBsCoKYpEqhh2PB3TfnlgZj0Ys2t9iz3+YC0w==
X-Received: by 2002:a05:6830:264a:b0:6f9:944a:254f with SMTP id
 46e09a7af769-6fa1b942179mr4011182a34.0.1718246339340; 
 Wed, 12 Jun 2024 19:38:59 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-6fee2d36622sm177556a12.60.2024.06.12.19.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 19:38:58 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Corinna Vinschen <vinschen@redhat.com>
Date: Thu, 13 Jun 2024 10:38:08 +0800
Message-Id: <20240613023808.448495-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Enable TSO on VLANs
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bbedf2a8c60f..d2d09edf5476 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4239,16 +4239,32 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_txq_stats *txq_stats;
 	int tmp_pay_len = 0, first_tx;
 	struct stmmac_tx_queue *tx_q;
-	bool has_vlan, set_ic;
+	bool set_ic;
 	u8 proto_hdr_len, hdr;
 	u32 pay_len, mss;
 	dma_addr_t des;
 	int i;
+	struct vlan_ethhdr *veth;
 
 	tx_q = &priv->dma_conf.tx_queue[queue];
 	txq_stats = &priv->xstats.txq_stats[queue];
 	first_tx = tx_q->cur_tx;
 
+	if (skb_vlan_tag_present(skb)) {
+		/* Always insert VLAN tag to SKB payload for TSO frames.
+		 *
+		 * Never insert VLAN tag by HW, since segments splited by
+		 * TSO engine will be un-tagged by mistake.
+		 */
+		skb_push(skb, VLAN_HLEN);
+		memmove(skb->data, skb->data + VLAN_HLEN, ETH_ALEN * 2);
+
+		veth = skb_vlan_eth_hdr(skb);
+		veth->h_vlan_proto = skb->vlan_proto;
+		veth->h_vlan_TCI = htons(skb_vlan_tag_get(skb));
+		__vlan_hwaccel_clear_tag(skb);
+	}
+
 	/* Compute header lengths */
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4) {
 		proto_hdr_len = skb_transport_offset(skb) + sizeof(struct udphdr);
@@ -4297,9 +4313,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			skb->data_len);
 	}
 
-	/* Check if VLAN can be inserted by HW */
-	has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
-
 	first_entry = tx_q->cur_tx;
 	WARN_ON(tx_q->tx_skbuff[first_entry]);
 
@@ -4309,9 +4322,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		desc = &tx_q->dma_tx[first_entry];
 	first = desc;
 
-	if (has_vlan)
-		stmmac_set_desc_vlan(priv, first, STMMAC_VLAN_INSERT);
-
 	/* first descriptor: fill Headers on Buf1 */
 	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
@@ -7678,8 +7688,6 @@ int stmmac_dvr_probe(struct device *device,
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
