Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5368EAB307E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049B0C78F93;
	Mon, 12 May 2025 07:29:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A372CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 03:33:52 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22c33677183so5896915ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 20:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746675231; x=1747280031;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGvbCVQtorwpWG15UFM2tqk4BSvFGG2eWntXtTW2Lrg=;
 b=awH0OZQjDciU9fshf/zq8KMWFIje+f+57GUioyEKiNxBS64bhw8KaDBVV2/6HW6fZ5
 2fuBF2TPchgQuJWmg2VIJIFOdnJINmSidYB2IR0E38HeH+0EitbzTIdSYbWNxLn/X0YM
 PfcYmMX5izwY6m53U/yRoY1G9wltJJseNacSlvEIwi8FB97A5Nglm7I0ZPloSJyzS3Hm
 xQSHLN7kxiZno+KetNRkllwcuanPUjUUEIJ4G0ow6bLZBPZwdiFb5sMqVBCAH7wfMwi5
 K3Hvr1vY5lKrOihcw4WEKM8DKnkb3kr7Krk5PgJ2Hn6R1x5bK4zXL1Ff5JHKS1ngwhbn
 AIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746675231; x=1747280031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGvbCVQtorwpWG15UFM2tqk4BSvFGG2eWntXtTW2Lrg=;
 b=s4kcc4upJa/1QHttZ/q+hbyXPtyM3TSDP7luuh9tpJziUjfuqRiVfeikK7seCMwGUb
 SK113BptqGQiSXqouANsJE6oJgCnT6LlvmMZ+MryOJ7lxGIaQEopykaepwDufQKCEPyA
 RTtfeK4YYvphpAndaiAw7dN9gT8eJoxvNiUk6FF9N+WlnFFz5CjI8hVGTJDKL0SqMOmT
 u+5NMHtMkhfxQDDY4eY5eOh1s25uBfmS/tCcfsZfug1sTfA9rG6vJ+TEr+HCNbg54jt9
 +A7JGvYO4rA6gcNv8nGwfeL2MeCEl5jvHUgAGeiSOxzva56DmPEiHqvezmOqInEcShvn
 Qq7Q==
X-Gm-Message-State: AOJu0YynBPvvq+DVBA2VlF7bwwH7F+XDkcXty6bCBYVneSwwiA0NpVme
 u2AE5fsOC0TiXh/DQF5vqbPir/CoxzjDU7XwKM/2EWZ5Rd7EXpMe
X-Gm-Gg: ASbGncvHgawW7RvapbHLgp5QBioSNfjSvCOhysoTGZJb/3CJL5abWGLT/baF0QsHTru
 2YVSJz+Z17l6YsYAfpdTZmyvBBK27cDOnwjZIxzcCzeOb8Iyj4Gj2ageFvyjbKpns/ZvQ+uX4g+
 MlSUgAsWz+1Fasx/D8++GllPSM9NbDRpqXOB6EY/G/Q72frqPo2EMqwFYS4J9KsZcrTV+GjaLta
 snUX+qZne4u3YNyRH00zZG8BEjSNG53QpLz+l72+v6hVARliXlDC7Y/3lV600xenVS/YY9NSopd
 M15pXLqgCMbpUiHzymu6MSLni5mo1NwtEuOF5FyYMIRxclgKdNaytHVxKlLx42gL/bh3RA12/gV
 eVhg0D7MrYPBDQKcJTbOsoVU=
X-Google-Smtp-Source: AGHT+IGM1d3vMyoJVzz7bHiOOLFntriOtcga4Tmp07QYCN7v6+1I5ai0Z52Kyi4KuEEHu9Zu2ZDSHg==
X-Received: by 2002:a17:902:ca89:b0:22e:7971:4d30 with SMTP id
 d9443c01a7336-22e79714f4bmr32012585ad.39.1746675230673; 
 Wed, 07 May 2025 20:33:50 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 20:33:50 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com,
 ayush.sawal@chelsio.com, horatiu.vultur@microchip.com,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sgoutham@marvell.com,
 willemb@google.com
Date: Thu,  8 May 2025 11:33:25 +0800
Message-Id: <20250508033328.12507-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250508033328.12507-1-kerneljasonxing@gmail.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net-next v1 1/4] net: atlantic: generate
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
 drivers/net/ethernet/aquantia/atlantic/aq_main.c | 1 -
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_main.c b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
index c1d1673c5749..b565189e5913 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_main.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
@@ -123,7 +123,6 @@ static netdev_tx_t aq_ndev_start_xmit(struct sk_buff *skb, struct net_device *nd
 	}
 #endif
 
-	skb_tx_timestamp(skb);
 	return aq_nic_xmit(aq_nic, skb);
 }
 
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
index bf3aa46887a1..e71cd10e4e1f 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_nic.c
@@ -898,6 +898,8 @@ int aq_nic_xmit(struct aq_nic_s *self, struct sk_buff *skb)
 
 	frags = aq_nic_map_skb(self, skb, ring);
 
+	skb_tx_timestamp(skb);
+
 	if (likely(frags)) {
 		err = self->aq_hw_ops->hw_ring_tx_xmit(self->aq_hw,
 						       ring, frags);
-- 
2.43.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
