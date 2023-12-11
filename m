Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F380DD21
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 22:31:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E3FFC6B458;
	Mon, 11 Dec 2023 21:31:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7C42C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702330302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3m2lRSq/x6O1AvE2D5Tmo4LBWE3DJjeKHdxsqLlOX9k=;
 b=Zkc0KHvLEUUI6nvYBJvQ6QokKoomILx9Fu6yOHGqyRH04z9asUFgZx7lNyyfmAvrb34uum
 ryZup9QQQCdJ3Dfa51hfgKoKi6xxgVlBr5wJsLIC0RBk3ssM58TsrbAleIC0s+ZX7Nn9Nb
 9e01GYKXi5CT5NhECzoWHNEIPft7Eo8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-TgoFYJfFMkWMzOD53YC4vg-1; Mon, 11 Dec 2023 16:31:40 -0500
X-MC-Unique: TgoFYJfFMkWMzOD53YC4vg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-67ad6e6c0a0so70686936d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 13:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702330299; x=1702935099;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3m2lRSq/x6O1AvE2D5Tmo4LBWE3DJjeKHdxsqLlOX9k=;
 b=g2B1w4jgMwRSGxebXASPkhoXnsbo3rt0cP0XJDuFgEIPYlQ5FvFyewMatrys1k5cdz
 gOhbWHkxhoa2X0RZI6jextsEUpF1/poGDh3LNDDKjDWxmukm1cGsWmGGBH+frA83rP3y
 KQW9+IIKJt6ytjV0KDaBD3eWLbFu9SKKoVkZcEyK7DkyFDOh2Rq7MN2QYXwqeeRJ6b9u
 CRmItZhSxN6epv/0cfxxh9l+gI+qXHHWS7SMwV9I4cfpwT5lQ4qB42mLtWEcIL01HH3y
 9kcJ+KcN/6h/tlblsq8imTn8za4WD+nrxXVEo6H4Vdsr+ab4bZZh9o5PnV4jGewP4XLz
 +TfQ==
X-Gm-Message-State: AOJu0Yy/3ZaSP0jpJo6T4pNnIrQsomIi+qCnq1I90F3ivTkLdbl3GokU
 GUD4mPkdleYHjSTQzFBhb6GhE5xPyEjtYSES3ozKCN471fWsLanycSWRTYoCEZgxqBgPsdyqixI
 BGu6eoPqD+dWYYc27drmq8bL4v5X4KGTCIWKFYaLN
X-Received: by 2002:a0c:fb42:0:b0:67a:98bc:4b45 with SMTP id
 b2-20020a0cfb42000000b0067a98bc4b45mr6325901qvq.25.1702330299797; 
 Mon, 11 Dec 2023 13:31:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfOr5Qchzr/j+FGRg3RKaC+dHzH5m7JUsZDA1GvPXcQq/y9SyQGFh3KmV3W0rrIbwNAaai2g==
X-Received: by 2002:a0c:fb42:0:b0:67a:98bc:4b45 with SMTP id
 b2-20020a0cfb42000000b0067a98bc4b45mr6325895qvq.25.1702330299614; 
 Mon, 11 Dec 2023 13:31:39 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05621405d200b00677a12f11bcsm3579945qvz.24.2023.12.11.13.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 13:31:39 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 11 Dec 2023 15:31:17 -0600
MIME-Version: 1.0
Message-Id: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
X-B4-Tracking: v=1; b=H4sIAKR/d2UC/x3MQQrCMBBG4auUWTvgxBKCVxEXMfOrAyaRpJRC6
 d0NLj8evJ06mqHTddqpYbVutQzIaaL0juUFNh0md3YXcSL8mLkvOcfEI+sHnNUqo1TFysGJDwo
 fko80Ft+Gp23//Y0KFrofxw8QHoykcwAAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net] net: stmmac: Handle disabled MDIO busses
 from devicetree
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

Many hardware configurations have the MDIO bus disabled, and are instead
using some other MDIO bus to talk to the MAC's phy.

of_mdiobus_register() returns -ENODEV in this case. Let's handle it
gracefully instead of failing to probe the MAC.

Fixes: 47dd7a540b8a (net: add support for STMicroelectronics Ethernet controllers.")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index fa9e7e7040b9..a39be15d41a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -591,7 +591,13 @@ int stmmac_mdio_register(struct net_device *ndev)
 	new_bus->parent = priv->device;
 
 	err = of_mdiobus_register(new_bus, mdio_node);
-	if (err != 0) {
+	if (err) {
+		if (err == -ENODEV) {
+			/* The bus is disabled in the devicetree, that's ok */
+			mdiobus_free(new_bus);
+			return 0;
+		}
+
 		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
 		goto bus_register_fail;
 	}

---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231211-b4-stmmac-handle-mdio-enodev-82168de68c6a

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
