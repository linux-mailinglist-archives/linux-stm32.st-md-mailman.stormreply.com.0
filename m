Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647CAB3081
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A63C78F91;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4820AC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 03:34:05 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22e8461d872so6076155ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 20:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746675244; x=1747280044;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnqWMDDLX0zek73pfxqndK/i6Uy2ZObuxOwIQcQSRF8=;
 b=dI77e1p4dmRaYZLrrHSfIv23LX7lzOiruzT0nsmCrdVy5n1KLBFhf0PU6AfptL2Vlo
 we04AdpjKynJ15AoHzDHLLQS4+QkE1uGWarR404101zU58myIbc+Ga38cV9DthGvGd3r
 1Ct3zt0vJx303btWRw4ZyedOFKNRN5FbCHXqMCAjVKyP9ry4ad8J1STQhY9vn6XyWGav
 R6EuQoEp2aG51kEIEmVLW8ICksXgUHmVb5VBnpqfofbfsdHHE9u+MqRBPaZqsDED/qxl
 1fZGxAAYzvkebi6xP/3J9LrDKhIEoJWT3JATs6yBPJo3+Bkk33lnkyCKSaq5Qp5LwmwX
 gxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746675244; x=1747280044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnqWMDDLX0zek73pfxqndK/i6Uy2ZObuxOwIQcQSRF8=;
 b=L29JEzb1FYM60nLrutunmbbjc87A7JNw2KAnhbBwR0N2LMK9jfMnyuqWDcG0cW7GKj
 JItVg09z6d0/lbw+vSAMttFBNvvmeDLNbmb6xQC1Wcm6OsMdcxFrIA8k4fvfSOVdFRWI
 xCnyWp2CBB9hyPKDRQxmESrIp4ll/SrL0VgH7c7sFIc9DzWnmIrctqYfywWhwK72thgF
 wNBt+UVIiuPGtrfDu0GNjcSo0PmF1zp4AduBffdmmdp2WwJhXYbKUjEkzPqD8Vk3B9lP
 xBop53HCz1PZ3FbLpIvBXLULreA9pr4nTMQ0ybO4S9p3ovEHfgBy8VM040hNyVzXpFSm
 O9zw==
X-Gm-Message-State: AOJu0YxTRDd5IbMgBThxotrgJqSp9HoOkj8shkdrK2Pw6fHVoy6hjjz2
 FyHXAfR122H8/DQV//nt7ziPkAYL3OMY5Ny7QVX6aHKMY7u/ouOs
X-Gm-Gg: ASbGncvM3UmW44ih/pqQBbT4ss4ljGpzNCt00xWLbUyRcZOsePWB8yd4Ifx4hX9Yb5i
 asp4HjtBn5aqjpyamwOXAIpxEZt5YRfh2hXSNXAaGQFMpZvXkpPj1CCclEmVKhAaHNoZEpBVs7G
 EiUGMmscxqVfH+FlDWsguxY63hm7/WxIwU8sSh/f9RjZNObwtjeicJBQ9hmrVpDFjPXSYJOszii
 8wQ338djvaJbhWGhpY59kfS9pJHPKSdoGDC+DsPcvCtARNEIiTQKQR+/UxKXi1wo9QEXoWSVv5w
 qpsTZW27gUfjctXp7Ab6DzGdmvYKjzT6YYNdJm7+8ymjt1AEnSY5kAet44fc7xPSPXQf/9zzokn
 8Kb1pNhT5itv3
X-Google-Smtp-Source: AGHT+IHYy+mhyOHuKt40kiRvSHcNeUMG5kIZxit9o8bCQPyY6xTpD5PZVHoUSN9mxt07Kxvd/al06g==
X-Received: by 2002:a17:903:252:b0:224:1001:6787 with SMTP id
 d9443c01a7336-22e8560cf2bmr29009925ad.4.1746675243855; 
 Wed, 07 May 2025 20:34:03 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 20:34:03 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com,
 ayush.sawal@chelsio.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 willemb@google.com
Date: Thu,  8 May 2025 11:33:28 +0800
Message-Id: <20250508033328.12507-5-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
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

Signed-off-by: Jason Xing <kernelxing@tencent.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 502670718104..e030f23e5145 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
 		}
 	}
 
-	skb_tx_timestamp(skb);
 	skb_push(skb, IFH_LEN_BYTES);
 	memcpy(skb->data, ifh, IFH_LEN_BYTES);
 	skb_put(skb, 4);
@@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
 		next_dcb_buf->ptp = true;
 
 	/* Start the transmission */
+	skb_tx_timestamp(skb);
 	lan966x_fdma_tx_start(tx);
 
 	return NETDEV_TX_OK;
-- 
2.43.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
