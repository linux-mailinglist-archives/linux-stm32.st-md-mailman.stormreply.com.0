Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56DAB3080
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26655C7A82B;
	Mon, 12 May 2025 07:29:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBCA8C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 03:34:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so599873b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746675239; x=1747280039;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STwC2IS6exLI0zzWU7M54ip6dOGrQ7MtK7OABGaeWUU=;
 b=kGKeQ8ocH7Sk00nFzrwNGpibKD7G4TL6rEz7auryjzQ4/9nZsSHmNeD9aZVTUbWZuS
 aO7xUE1+xBqI/SdHgpBkBlvngMJ/c+X434mvCRn1VT5Fes0koMHtPUBz+eCfcW2v5RJp
 lNuq2hUrkuzGIhAc7kOXiAWWrimJlEp/Vm2fH8WtvMjkH0UWw4KGPoJwp/navnAoZVmh
 p8Y4vbbqEyvBx3lvWMoaXSEexEu6wyRQZCOHrIET8GktWdb0SWXn766aRriHb8RqJqJ6
 BEAURThwrEqv0L2hyei0C75CJCZ/88kC1xTFHNC6Evdp8Bfh1Qja7A2j7m91Lne7YS+F
 BCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746675239; x=1747280039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STwC2IS6exLI0zzWU7M54ip6dOGrQ7MtK7OABGaeWUU=;
 b=cSuv8USlmnnB1mJPwyL++1iQYPraPEjsv/Isk/uJv0EHJky+oaBG8wmT+HxHNmbGrz
 S3/NX9XVL/cWYaWj4Yra1pee0uYbpind3lu94Jqq2TWqI58wguEB0/C9t8IOHOOwD2Hz
 qK+UtDK7A9fjRNabzbYA8fdhGA/76BBBP41RRs6Xh8A5aJymzEigl9TNT1KrWRQxEttk
 wHrgS1B8MKaNUF1GhmEwnU6uUC3aMeSdj6Tek8li5DRuWNYOZxhn137SuPEqE6mjLuVT
 Fgvypb9TPfnYztJ3WNw+6Glkrjhlmi+fxh8fKh3A0A/FEA16bvn3CuiRSppR6MeNyg8Q
 Wm4g==
X-Gm-Message-State: AOJu0Yzb81sQEqpAs2f5Rpgin3fDeOM4qxaiSK6at/s87r+oB2ycpL8Y
 IetqNVWDGtl4ohPyeTFJJjoU/GUYPmj2kyKRrSPwwFZOPm8ep1rO
X-Gm-Gg: ASbGncsbn4Js+ZchI9gZ9G6Sret6zn3GDU3cSNrElTRzg+129rHKZnnGdA7hTNdHqAu
 ymDbAUAdD9+DzRbTGQzsbbLsUbWjmN1d/dKHK91+6x9yuMte0tzKExXwMYEhuSHgVOgdyOAN+K7
 8lm0ERajU1NaNvNJNMeGu7rhEaFrtX/3x/le3HCn/XlEIsKea3So2HsNqnFVKbqSnIbQ2AQ6lhl
 j4+xzt0ehpyYDVRUVE1h3h1ZJiRxNgbSa5gzMiChhSSLq3kNXOIG/ctv5o7PefcCiASJJIp1zZo
 GcML0j9CuydMLgxRNs0veTYlt+IfBJeiJz94B6HacjMT5ZaYHOG4aOaLC5FMdixIa8NpTQylPrY
 zgY/PqJ+La6Yw
X-Google-Smtp-Source: AGHT+IFNBu+spPs6hHuGIkVh1YINLq4WHn7KOys95hSNq9ZK93KPikPLdTAtOZWgFL0dDvNhanikHA==
X-Received: by 2002:a17:902:ecc6:b0:224:1d1c:8837 with SMTP id
 d9443c01a7336-22e5ea3b7c4mr96108705ad.19.1746675239438; 
 Wed, 07 May 2025 20:33:59 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 20:33:59 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com,
 ayush.sawal@chelsio.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 willemb@google.com
Date: Thu,  8 May 2025 11:33:27 +0800
Message-Id: <20250508033328.12507-4-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next v1 3/4] net: stmmac: generate
	software timestamp just before the doorbell
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

In stmmac_tso_xmit(), adjust the order of setting SKBTX_IN_PROGRESS and
generating software timestamp so that without SOF_TIMESTAMPING_OPT_TX_SWHW
being set the software and hardware timestamps will not appear at the
same time (Please see __skb_tstamp_tx()).

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 28b62bd73e23..e7266e517edb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4497,8 +4497,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
-	skb_tx_timestamp(skb);
-
 	if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
 		     priv->hwts_tx_en)) {
 		/* declare that device is doing timestamping */
@@ -4531,6 +4529,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
+	skb_tx_timestamp(skb);
 
 	stmmac_flush_tx_descriptors(priv, queue);
 	stmmac_tx_timer_arm(priv, queue);
@@ -4774,8 +4773,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first, priv->sarc_type);
 
-	skb_tx_timestamp(skb);
-
 	/* Ready to fill the first descriptor and set the OWN bit w/o any
 	 * problems because all the descriptors are actually ready to be
 	 * passed to the DMA engine.
@@ -4820,6 +4817,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	stmmac_set_tx_owner(priv, first);
 
 	netdev_tx_sent_queue(netdev_get_tx_queue(dev, queue), skb->len);
+	skb_tx_timestamp(skb);
 
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
 
-- 
2.43.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
