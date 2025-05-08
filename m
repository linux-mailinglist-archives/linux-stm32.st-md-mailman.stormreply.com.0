Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B65AB307F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 158D5C7A827;
	Mon, 12 May 2025 07:29:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B7D9C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 03:33:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2241053582dso9922705ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746675235; x=1747280035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1u3Ux0aEuDRPRfhGSL7KiSmBbe98RsbxmilJJ1kRyE=;
 b=HMDMZ6LrVXqfmJaB6WhOT0i5eKQIm+2HiCDrbS/rGvpNyEYoT8DnoXCgOyZEOmRHlx
 iNcCZVAxZEJtp7npnDpVbnTUUvHNiXAxljJwWauiiW2g+TDxp7rAmkUJojqwPtsyQbaW
 SpKaQMNJUCHCfkjZ/QJ68E3mLy2NpzmO1u4/7p6eSwCt+DmD+Qr7F/fVI663SG5RyKL1
 GWzOwm4aw5aVqWvLWv7nJdUt9+NlNiSflC6oOqDb/lWPA61UTphqt9zu1hqAawCulCL7
 owJD5bcxHr3RUzw3Ixq+wm6KzZieopE4VDGK/j2zIKn8GXyXHZ6VrzZ14UturJF0XAwG
 VVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746675235; x=1747280035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1u3Ux0aEuDRPRfhGSL7KiSmBbe98RsbxmilJJ1kRyE=;
 b=a1p6OwOAQn/ptLzISpV7COxjpSROvrE2vKXUQkMtoU9DRlkpaATp//GwhU3RYyUrJH
 wZio2mdcqtwZ94ACcxsb1LQOtTuJ+6CN2kTQPXmyKvnfQLFJVmro6EjTbNO/mIMFUZXt
 kn175fbooeU4kC1WuOjSw8yYTbNDdOXbv0fuppnu9lMJVbTX6d4vPdjujZ4B2yMTp8NI
 h+IGtGE0W4NTitE/8sk6Ej/GJBo5tsFLwhQ+bqUHS963YoQmnUQIS/ImKBejmVusrx8J
 mCsFceQ1SwdGgHZDFoeKn9qYq3u9KKtPJgyv/ERWywBjMvXIzMy0L2FEgcaZS0IR1qXU
 hoXQ==
X-Gm-Message-State: AOJu0Yzqp7G3hU1pLj1vBX8a5hUP+1Z4+pua0fT5v3vyNNdSTJWz2LmY
 9SyR6Y7XbakITlRJiUlMVMIjljxmZ6IHAet51XUTsscavVR7N9J5
X-Gm-Gg: ASbGnctaQWGTQW67JIIMJdgXIfSUcew1xyG2rkCLx4kSWkOlnDFXoACc5qyj1v1z/Mo
 2Nmm9V29ZKrjtJ1t7eEs8eYKuoxKN8k8I3lAfgv7ppXAG6MYnK1c0/klYJsaZ7IASIoZ8r6yT5u
 Q0jwb4BcU6QtRt3RYAJNahEuwkuaaBLmrn7Fq6MJVZKLIpmnoGLb6xvSeMvNo5evDNPxkoWeJfU
 LpSIMg4mE+Fh6ugMuaJnxGW34pJ1jO5bM8Cztz8bvBf9dZTVzLOWCt87oUZfZ/1Lq00lWoRw5V8
 X9SeXlu8fnkPCxHxh2y14u4Y1vK4oOi/GEptaU9/vTwOU8sh009MSaH4Ut33CKPp6O0dOqNpGK3
 yH6JdsN0TXPyU
X-Google-Smtp-Source: AGHT+IFm+mP1uGj09z6Vf18f5gYApeZ0IE75maU9iP8Ml38OuYBrOos4wiBaafguyI66pVfIF9OMTQ==
X-Received: by 2002:a17:902:c94c:b0:224:de2:7fd6 with SMTP id
 d9443c01a7336-22e5ecc39demr85915235ad.25.1746675235094; 
 Wed, 07 May 2025 20:33:55 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 20:33:54 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com,
 ayush.sawal@chelsio.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 willemb@google.com
Date: Thu,  8 May 2025 11:33:26 +0800
Message-Id: <20250508033328.12507-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next v1 2/4] net: cxgb4: generate software
	timestamp just before the doorbell
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

From: Jason Xing <kernelxing@tencent.com>

Make sure the call of skb_tx_timestamp as close to the doorbell.

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/chelsio/cxgb4/sge.c                     | 5 ++---
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index f991a28a71c3..ee5075b252fd 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -1533,7 +1533,6 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		q = &adap->sge.ethtxq[qidx + pi->first_qset];
 	}
-	skb_tx_timestamp(skb);
 
 	reclaim_completed_tx(adap, &q->q, -1, true);
 	cntrl = TXPKT_L4CSUM_DIS_F | TXPKT_IPCSUM_DIS_F;
@@ -1717,7 +1716,7 @@ static netdev_tx_t cxgb4_eth_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	txq_advance(&q->q, ndesc);
-
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(adap, &q->q, ndesc);
 	return NETDEV_TX_OK;
 
@@ -2268,7 +2267,6 @@ static int ethofld_hard_xmit(struct net_device *dev,
 
 	d = &eosw_txq->desc[eosw_txq->last_pidx];
 	skb = d->skb;
-	skb_tx_timestamp(skb);
 
 	wr = (struct fw_eth_tx_eo_wr *)&eohw_txq->q.desc[eohw_txq->q.pidx];
 	if (unlikely(eosw_txq->state != CXGB4_EO_STATE_ACTIVE &&
@@ -2373,6 +2371,7 @@ static int ethofld_hard_xmit(struct net_device *dev,
 		eohw_txq->vlan_ins++;
 
 	txq_advance(&eohw_txq->q, ndesc);
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(adap, &eohw_txq->q, ndesc);
 	eosw_txq_advance_index(&eosw_txq->last_pidx, 1, eosw_txq->ndesc);
 
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index e8e460a92e0e..4e2096e49684 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
@@ -1640,6 +1640,7 @@ static int chcr_ktls_tunnel_pkt(struct chcr_ktls_info *tx_info,
 	cxgb4_write_sgl(skb, &q->q, pos, end, 0, sgl_sdesc->addr);
 	sgl_sdesc->skb = skb;
 	chcr_txq_advance(&q->q, ndesc);
+	skb_tx_timestamp(skb);
 	cxgb4_ring_tx_db(tx_info->adap, &q->q, ndesc);
 	return 0;
 }
@@ -1903,7 +1904,6 @@ static int chcr_ktls_sw_fallback(struct sk_buff *skb,
 	th = tcp_hdr(nskb);
 	skb_offset = skb_tcp_all_headers(nskb);
 	data_len = nskb->len - skb_offset;
-	skb_tx_timestamp(nskb);
 
 	if (chcr_ktls_tunnel_pkt(tx_info, nskb, q))
 		goto out;
-- 
2.43.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
