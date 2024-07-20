Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F5393FA0B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BB21C78F7B;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47CAAC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Jul 2024 04:00:48 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70b07bdbfbcso1132430b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2024 21:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721448047; x=1722052847;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4LEaw+AqpH2JFLGxA4n+vH2QKdcct4eQZVeSkv6l4ts=;
 b=NzSN0IGgEQpEFSkzF50FWRvET8oa2bLObn+vfieje/lP9iWYH9hHLoyMUew9IAyG9e
 LSNB7XvxYl1ShF2fFP/tOF+OPtQEZjFE235IjhBfdapMMQ2lKU8F4+UiTulzxAy0x9As
 q8Qt/Pud4LWOnx2n4CJhPOpxB6nEhFRTPeUzEgjiuGDS97Y7ejyUGvOM5jqPBlRc/r53
 dp8Z+fTqR2Q42BJkjb943g2quospyrqHWuonh20VXGrSD4hMpcUlIDpFWoIVqKJbcU0E
 MLlHYS3zLD+dx++SZZQhgphjjdadPS/V+YZov8Fb7bgxfwuy4JahcegQ9tLXtJ0b0F3c
 Oe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721448047; x=1722052847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4LEaw+AqpH2JFLGxA4n+vH2QKdcct4eQZVeSkv6l4ts=;
 b=DjETPCqUu1MJwWKcchMN58JNtKv2iHWg43L5z9OfXAQyZPQoOj9LLNyxSupzYMfiia
 jKBkmaG66PN0TT/UPq6yqnQj+UsPvfkXjdcwq7z800n+vXsLPNzvnz0yWOcKV1mbq9SC
 eA1HAfkkkQ0VyyR5RD9sEeR5Al/BY42GNCRP/9Lzvw6wyrksU/CK/DaT00/X0qx/+UFw
 8M9DPcnGhkSOgDg/IyPGfWMeEUozLELIim0p6ehoZPeXNd8kHqQMBiqu4f/pQ1OC8hsN
 6MZ15VdUBmPLUl0NEO/leCOGhSEwKqPlfQantoweOzCTdor1K6RKZKVU2WHBcu25zC+0
 Y4ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2DMdKR/kxbGhkTWfoQfwklb1Wa/lQJ8ymW45B9PptY1m8Trr7SbOrkX73qaPWfmulnn+xsyKS2Dli33jkZL7aUUZ1O//HhohjQ+8FWroGH9qjvnsfR36O
X-Gm-Message-State: AOJu0YwPf0eN/TjBaG8DGVg6yAqvUdgE9SPf+O/W1CT4n1LFVNl0p2n0
 GuW86tFfZvXrDRPSz9xG79gsTLwdDy6hMqBMAnhMEpc8NCCUHfCY
X-Google-Smtp-Source: AGHT+IGjA01k09HWKzmc4ybFCGHr482A/uCJKVK6xKRbZl0Y+RhKZRBXXVtMBlWarDEr2prSOEdXGQ==
X-Received: by 2002:a05:6a21:320b:b0:1c2:8a69:338f with SMTP id
 adf61e73a8af0-1c423ac8ca6mr2497856637.12.1721448046768; 
 Fri, 19 Jul 2024 21:00:46 -0700 (PDT)
Received: from localhost.localdomain (140-211-169-189-openstack.osuosl.org.
 [140.211.169.189]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff55275bsm1901517b3a.128.2024.07.19.21.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 21:00:46 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, linus.walleij@linaro.org,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 20 Jul 2024 04:00:27 +0000
Message-Id: <20240720040027.734420-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: "zhili.liu" <zhili.liu@ucas.com.cn>,
 wangzhiqiang <zhiqiangwang@ucas.com.cn>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: fix the mistake of the device
	tree property string of reset gpio in stmmac_mdio_reset
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

From: "zhili.liu" <zhili.liu@ucas.com.cn>

According to Documentation/devicetree/bindings/net/snps,dwmac.yaml,
the device tree property of PHY Reset GPIO should be "snps,reset-gpio".

Use string "snps,reset-gpio" instead of "snps,reset" in stmmac_mdio_reset
when invoking devm_gpiod_get_optional.

Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_reset")

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Signed-off-by: wangzhiqiang <zhiqiangwang@ucas.com.cn>
Signed-off-by: zhili.liu <zhili.liu@ucas.com.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 03f90676b3ad..b052222458b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -462,7 +462,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		u32 delays[3] = { 0, 0, 0 };
 
 		reset_gpio = devm_gpiod_get_optional(priv->device,
-						     "snps,reset",
+						     "snps,reset-gpio",
 						     GPIOD_OUT_LOW);
 		if (IS_ERR(reset_gpio))
 			return PTR_ERR(reset_gpio);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
