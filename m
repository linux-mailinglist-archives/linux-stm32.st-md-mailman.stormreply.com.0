Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE746570A2
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:03:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E70C65068;
	Tue, 27 Dec 2022 23:03:43 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84E4AC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:03:41 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id i19so2155750ljg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gFNJ64ei6f6JXBXMe7Y3Zh4KDe6QIvYh6U+4hGCC6FQ=;
 b=fIhOFsQRiydhb2CCWZQCwv/VGzgvAH1Ekd94GUmxxTxucjdqiOe4BLy42SsbjHtmV/
 DW4wzE0jz6ZM1MRt+u10XXlGbv/NHvf5FboIU0qZ7sT4gMmxogOFCcClfUcQOJ04UIbL
 jCviVGiPhgDpecsycZqBSIFHn0LPrmOEYNal3XpGRK4Wp+mBkKF63gyA5zlfNUI/YafI
 jG2gxpAxtJibCqukuwW0opA8ZrynF4K6kx3xBC0IdCfZoI7HcxLwwI3c6IEN2db1pDWp
 KLXrlVG52HpxYAkZYZZIL4iAXx9YG4+9EcehmUj9SOkK2YGGu/EZQH6nhsJQPncjnJoV
 jX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gFNJ64ei6f6JXBXMe7Y3Zh4KDe6QIvYh6U+4hGCC6FQ=;
 b=CkqLH6K2WKSveWv+S8/BotpqEVI/hETLIPbO2HStJE+gqhzbRPzI3VoPeygmwq4LMV
 rIst8QkWDi7McCHN2+o6EohxUGBTAlXHS1ywTRtOhrHCboA5R0N+5GujST9AK4TuZBjW
 b0EjxDwluy+an0E8fq3QngVavDhcEPGQMtvFWhGQx2lFfRb7jvzVlXQs+AUbUXNv0O/7
 wi25T+Y/n8RJwi+ajGpmxoSivuvtxiv1xS22uIw+SvNk/E+yP1JAcgU7UJOlxf22ahgN
 wRq8n7i16d03mhGU+LpBEQk2qg/G37R8wsUysWvEHblbGY1EmhXBDOFKrKrB3rZQAfmT
 sKvA==
X-Gm-Message-State: AFqh2kq3E6e/QO8rX1A89umlRceHW+Kz6oxgf1sAp8fy/JRTp+H1hiV8
 3gWIh0U8c6HA8av01sSMLYEhFw==
X-Google-Smtp-Source: AMrXdXsrl25KodHWZtqtUoAPjW154aVte57f4s+nAKl/36NjXoVykDg94a/092ij58D2CqGeYhKzrA==
X-Received: by 2002:a05:651c:148:b0:27f:c391:5a72 with SMTP id
 c8-20020a05651c014800b0027fc3915a72mr1761055ljd.50.1672182220783; 
 Tue, 27 Dec 2022 15:03:40 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:03:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:33 +0100
Message-Id: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMV5q2MC/y2Nyw6CMBAAf4Xs2U3Kgg/8FeOh1MXuwUp2q4EQ/
 t2iHieZySxgrMIG52oB5beYPFOBeldBiD7dGeVWGMgR1URHfE1759DyoyGM3iJ2zHQ4NS11NEDJ
 em+MvfoU4hb+/MyW/1HQedy8UXmQ6bu+XNf1A28Y85OKAAAA
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] crypto: stm32 hash - reuse for Ux500
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

By taking some small portions of the Ux500 HASH driver and
adding to the STM32 driver, it turns out we can support both
platforms with the more modern STM32 driver.

The STM32 driver is more modern and compact thanks to using
things like the crypto engine.

We add a polled mode since the Ux500 does not have any
interrupt. Incidentally, this could perhaps be re-used to
implement synchronous mode, if this is desireable.

To: Herbert Xu <herbert@gondor.apana.org.au>
To: "David S. Miller" <davem@davemloft.net>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

---
Linus Walleij (7):
      dt-bindings: crypto: Let STM32 define Ux500 HASH
      crypto: stm32/hash: Simplify code
      crypto: stm32/hash: Use existing busy poll function
      crypto: stm32/hash: Make dma_mode a bool
      crypto: stm32/hash: Wait for idle before final CPU xmit
      crypto: stm32/hash: Support Ux500 hash
      crypto: ux500/hash - delete driver

 .../devicetree/bindings/crypto/st,stm32-hash.yaml  |   30 +-
 drivers/crypto/Kconfig                             |   10 -
 drivers/crypto/Makefile                            |    1 -
 drivers/crypto/stm32/stm32-hash.c                  |  253 ++-
 drivers/crypto/ux500/Kconfig                       |   22 -
 drivers/crypto/ux500/Makefile                      |    7 -
 drivers/crypto/ux500/hash/Makefile                 |   11 -
 drivers/crypto/ux500/hash/hash_alg.h               |  398 ----
 drivers/crypto/ux500/hash/hash_core.c              | 1966 --------------------
 9 files changed, 239 insertions(+), 2459 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20221227-ux500-stm32-hash-9ee26834292f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
