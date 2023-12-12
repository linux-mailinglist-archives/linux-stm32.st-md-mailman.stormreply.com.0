Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F080FA1E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 23:18:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2508C6C85B;
	Tue, 12 Dec 2023 22:18:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2769C6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 22:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702419527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=niWso/AgTSlNDKs+hLJfqSanWTgF91oEfLP5s9hKVlo=;
 b=NkiDe0X3oLh53daKOMINJ+6VWJoFuV0ETyQqXCM2fnFgyPHpirjp6GAOE/k85NIlQtdgK+
 NUkLaWrX/9plDYCYs8EslKxZwcco1/tSbNqumsC0kixSGmJjAVY2wq5XKPJaUz2Cl8q6UX
 xBq7fAOneSH7MxvQ5wdJbPLUDrFS6wE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-U-BhuAeRM9-XTtqvKbAEgA-1; Tue, 12 Dec 2023 17:18:45 -0500
X-MC-Unique: U-BhuAeRM9-XTtqvKbAEgA-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-679ff96b259so84135066d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 14:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702419524; x=1703024324;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=niWso/AgTSlNDKs+hLJfqSanWTgF91oEfLP5s9hKVlo=;
 b=o4xtq2sPLZxVd8r4yQzvQ39QsKofApYXmfc+AWgQLvDMkrdRUtozzbCqCvFKGPv+/a
 Eh9GaGP8JWDvB1XBhVgxKoqYP7zOFZJ8TD5MzeOQpFKAYAaHwyKGX598WfWBVJUKpvMS
 yLGnYz7mzPw3kdrBLrvYirs8qirYDEnRduV3ZbDu+smqwWw0QlsRx5jDZmc+wWUjOuYu
 CQPZk6BYsjTdUJm49eu4EZNmPSR0UvlBf0zJ4NKBs6Q2OJDA3d0NeUnlVwBAMJTxNX26
 D9SesS0xXSl6eqCcRz3gn2cm0k771PPqXzVjDmq0INGppoXKAxr3z5UTPonCfjcc+BGP
 FW7w==
X-Gm-Message-State: AOJu0YzMcLcj9jX6KzOcjlAerlrQHFzhn///llC8lQHnDaPF+otLmow2
 LVL8zT9BoWttP/Dj62m6R+xr7rdyse5K9lOzfokE03ulJlcFkUWH5S4mvO1eLtrP/+D4IetIJ8a
 fjCLVbEdNechf9PP4S0bNqjVv4IUyu46H50wLYP02
X-Received: by 2002:a0c:c210:0:b0:67e:f58a:d6b0 with SMTP id
 l16-20020a0cc210000000b0067ef58ad6b0mr226809qvh.27.1702419524253; 
 Tue, 12 Dec 2023 14:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXwgdCMDLzfi+fVcHm7+1qcErjuVF1ZgVVAksnjigHixsYAtg0Q68ahZCHFpj/G+kad1CZTA==
X-Received: by 2002:a0c:c210:0:b0:67e:f58a:d6b0 with SMTP id
 l16-20020a0cc210000000b0067ef58ad6b0mr226790qvh.27.1702419524008; 
 Tue, 12 Dec 2023 14:18:44 -0800 (PST)
Received: from [192.168.1.163] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 uw2-20020a05620a4d8200b0077f103c8ad6sm4050578qkn.82.2023.12.12.14.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 14:18:43 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Tue, 12 Dec 2023 16:18:33 -0600
MIME-Version: 1.0
Message-Id: <20231212-b4-stmmac-handle-mdio-enodev-v2-1-600171acf79f@redhat.com>
X-B4-Tracking: v=1; b=H4sIADjceGUC/42NQQrDIBBFrxJm3SnRBCtd9R4lC+tMGqFqUZGW4
 N0rOUGX7z94f4fMyXGG67BD4uqyi6GDPA1gNxOejI46gxzlJKQQ+JgxF++Nxa7pxejJReQQiSt
 qKZQmVtoqAz3xTry6z5G/Q+ACSx83l0tM3+OyikP9V68CBV4mK0c7z6smdUtMmylnGz0srbUfm
 X3voM4AAAA=
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
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: Handle disabled MDIO
 busses from devicetree
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

Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Changes in v2:
- Improve error handling code (Serge)
- Fix malformed Fixes tag (Simon)
- Link to v1: https://lore.kernel.org/r/20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index fa9e7e7040b9..0542cfd1817e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -591,7 +591,11 @@ int stmmac_mdio_register(struct net_device *ndev)
 	new_bus->parent = priv->device;
 
 	err = of_mdiobus_register(new_bus, mdio_node);
-	if (err != 0) {
+	if (err == -ENODEV) {
+		err = 0;
+		dev_info(dev, "MDIO bus is disabled\n");
+		goto bus_register_fail;
+	} else if (err) {
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
