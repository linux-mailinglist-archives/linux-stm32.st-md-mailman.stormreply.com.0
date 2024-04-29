Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B84968B64C8
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 23:45:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61FD8C71285;
	Mon, 29 Apr 2024 21:45:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6013AC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714427117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QdU3RyAhhNJtPcn7BJGK9yJoXLvf1QCQv7HYg0QISNs=;
 b=Cm2Ku0LMTIP4wcu8EcadsUpb3qzRBQDEQlBSYa4453jP7+gkMlTjWDe4M/lxo6nHlX70hG
 aJHFlw9eUPDY0tMJtebzYBNQP3Gp1yxH/WKEfPF61Ixj5gtRfk8SuEUdmNIkCOFP35RsHs
 RDfI/K/b8uFV40/ft1/J1RhAskPTC3c=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-qwAnnF8QOry3y3jCtiGGYg-1; Mon, 29 Apr 2024 17:45:09 -0400
X-MC-Unique: qwAnnF8QOry3y3jCtiGGYg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1e63ff880f5so62265545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 14:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714427109; x=1715031909;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QdU3RyAhhNJtPcn7BJGK9yJoXLvf1QCQv7HYg0QISNs=;
 b=SqYI01QtNmBau3eKEle9kC9awdEuCBrRVY+t1sxSPn7xOfhMRYh1bRnA15AbtSatSy
 GIuqi5Gi5quE5xYJSOV0Fa4XlWq7RY97sHr0q4M88MmPufgSV7RCT16UNSe2NLv5NHYQ
 x9Hi0Au82QavSCBS0gYa+QKOHt4aH3iGpyUjpPC4Or+MpaOEDNOwzIZNGfe91rmX1Goe
 WErgYLmyuJ85fHQdKAtOrh/jQRUyQtBmw10ksG3a/XTMdol0RGi3J43y5VFo4l5xpXNz
 8U6/RYYUnu0OSaFJBpIkucKv/kSMQylps3QhHGXEnG66X7ym5JTw9ComB/bjOnVGQzZb
 6uQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7IueSWvhYLv/p82hcly2lf3LsbP/fuH7VUFjyb8v7FBUxSbj/idBHCDKDCLcGjRWKxHZefq54k09P32PCXuP/8Y+azRT/u1mnwp45z1RqNqxAunvTVWA3
X-Gm-Message-State: AOJu0Yy4H1Y0sF8EjjMn5GIrz/dl24srjTgeuj7kWgfDm53k6ql4genb
 kRJntUH8LRU7fTb8T0PoMj5eW26F7voTdW2vtyDN/PabY/qiRb5lXjKRXXzAEMm/Mt6D1QF67UP
 9FWrArVS+lLHHbrIhIttEYShzW+vnx5Ckf2UfdfO12WkZ3i5jxmHoJbw+2wn++QWRkK/6/ewrUZ
 iCFQ==
X-Received: by 2002:a17:902:ce87:b0:1eb:7285:d6fe with SMTP id
 f7-20020a170902ce8700b001eb7285d6femr9045682plg.23.1714427108698; 
 Mon, 29 Apr 2024 14:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGRQ9LT7NJkVOb6GUEq9lwThklv0tGP954t0tZVLJEW83PPF8uBigHzkBa6EHJUPWcRTTkqQ==
X-Received: by 2002:a17:902:ce87:b0:1eb:7285:d6fe with SMTP id
 f7-20020a170902ce8700b001eb7285d6femr9045663plg.23.1714427108354; 
 Mon, 29 Apr 2024 14:45:08 -0700 (PDT)
Received: from [192.168.1.111] ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902bd8500b001db8145a1a2sm20731655pls.274.2024.04.29.14.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 14:45:07 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 29 Apr 2024 16:45:05 -0500
MIME-Version: 1.0
Message-Id: <20240429-stmmac-no-ethtool-begin-v1-1-04c629c1c142@redhat.com>
X-B4-Tracking: v=1; b=H4sIAOAUMGYC/x2MsQqDMBBAfyXc3MMYg0PXgh8g3YqD1Yse1EtJj
 iKI/27o8IY3vHdApsSU4W4OSPTjzFGK1DcD0zrKQshzcXDWeeudx6zbNk4oEUlXjfGDb1pYMDS
 2DS7UBQ+l/iYKvP/PL+i7R9V3TyOkKLQrDOd5AQ+jaCR7AAAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Abhishek Chauhan <quic_abchauha@quicinc.com>, 
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH RFC/RFT net-next] net: stmmac: drop the
 ethtool begin() callback
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

This callback doesn't seem to serve much purpose, and prevents things
like:

    - systemd.link files from disabling autonegotiation
    - carrier detection in NetworkManager

prior to userspace bringing the link up.

The only fear I can think of is accessing unclocked resources due to
pm_runtime, but ethtool ioctls handle that as of commit
f32a21376573 ("ethtool: runtime-resume netdev parent before ethtool ioctl ops")

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 542e2633a6f5..c2e2723f7c6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -438,13 +438,6 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
 
 }
 
-static int stmmac_check_if_running(struct net_device *dev)
-{
-	if (!netif_running(dev))
-		return -EBUSY;
-	return 0;
-}
-
 static int stmmac_ethtool_get_regs_len(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -1273,7 +1266,6 @@ static int stmmac_set_tunable(struct net_device *dev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
-	.begin = stmmac_check_if_running,
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,

---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240424-stmmac-no-ethtool-begin-f306f2f1f2f4

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
