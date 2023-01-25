Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A267A77B
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 01:23:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F0AC6507E;
	Wed, 25 Jan 2023 00:23:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2754C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:23:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id qx13so43412927ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9qmjL5YE1HyeJVsvTfsUWFKz+T/3Ixilqwo6/hu6Qzo=;
 b=ehG+o2447r6Td9RR2+nlur6qkPp25WNZ5VRULzjwSQnqXWt2MCg7k78WBPyeu45jwG
 NOdpFnBuzpDSS1OdTfsIl3z3WdQ15/+Y3RR4TPn2qjpDBQXWqz+0SJlGzXcdKhYVYFYV
 f+b9LPEusuXHwVWllUUPlJJiAnus4nITRAsSN2iBT5ACFqsfC/xiJ/m/2set+UOC4dIR
 vHtEv9QW7w8O3v7pcBGdyUd+cTZZPxPcoJg+YkGVVfzvnvhgqGJqzHk5dew4FSyJEmP3
 0HenwMS/nh+xF7VYGNpLE7wxnRKlybsHnHVvw7WRcJfHkOuune3yXsNkiSSUXA5z2CCT
 HOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qmjL5YE1HyeJVsvTfsUWFKz+T/3Ixilqwo6/hu6Qzo=;
 b=LgzD7DWy4aJco/IjNAyS27UWw5p+PSkMFnJSLbEcgW5z7oL1ow9QNNV91yIR1WBe2Z
 mQ2i+HxWKTKYJ7YsmQL2Gq9+Anq2Iaf5X9AwnztGG7JRZaILT9PKbBRkgbLmuqtaowuM
 gCWQ7ZUmaVPgy0BFrtuarEGd+S0Et/boS0HUezkdQ9zIPpFaBMY7GGue44i23/VWbBFp
 sNKFeEnctJTzDs4smXc4YFffeFTTU2txMx+SxSUXHXe1s+FE8VD5cVULy0h6NwR6odPl
 xByCN2ALmkHuRdQp/+rLdIpqsUt0+36+7P63RlTuGMxyeCr7PF0edzPCP9CTeW5QLGPS
 t0Ew==
X-Gm-Message-State: AFqh2krAnk5eM1wDFmuVs2YDERJtf3p5ugrPW34PRbDnsJFXFRErP60I
 r8kw32XegN8uobGDmnbgV4Xshg==
X-Google-Smtp-Source: AMrXdXsDD/LQk4PBY7vHxwupmEw2Zbk2BgwZl6oR9qqIRyEiY3CjmumNBHn7lMrPc11U8zqCl8ppjg==
X-Received: by 2002:a17:906:cd1f:b0:84d:4a2b:73b9 with SMTP id
 oz31-20020a170906cd1f00b0084d4a2b73b9mr32449420ejb.59.1674606198366; 
 Tue, 24 Jan 2023 16:23:18 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 if10-20020a170906df4a00b00738795e7d9bsm1584606ejc.2.2023.01.24.16.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 16:23:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 01:23:06 +0100
Message-Id: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGt20GMC/4WOwQ6CMBBEf4X07JqyraCe/A/joZSFNlFK2kogh
 H+XohcvetlkNjNvZmaBvKXAztnMPA02WNetQuwypo3qWgJbr5ohR8wRS3iOB84hxIdAMCoYOBFh
 cRQST9iwNVapQFB51WmTgm9/pBA/Ie2nPvl6T40dt+rrbdXGhuj8tC0Z8vT9UTrkwKEqRKm01LX
 i+eVuO+Xd3vmWJdqA/wiYCFpKkY5W8ouwLMsL/cdYQBsBAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
X-Mailer: b4 0.11.1
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/6] crypto: stm32 hash - reuse for Ux500
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
Changes in v3:
- Allocate the synchronous fallback algorithm in .cra_init()
  and free it in .cra_exit().
- Pick up some review tags.
- Link to v2: https://lore.kernel.org/r/20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org

Changes in v2:
- Use an else-clause in the DT bindings.
- Fix up issues pointed out by Lionel in the driver extension.
- Dropped the patch converting dma_mode to a bool after
  Lionel explained how this works.
- Link to v1: https://lore.kernel.org/r/20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org

---
Linus Walleij (6):
      dt-bindings: crypto: Let STM32 define Ux500 HASH
      crypto: stm32/hash: Simplify code
      crypto: stm32/hash: Use existing busy poll function
      crypto: stm32/hash: Wait for idle before final CPU xmit
      crypto: stm32/hash: Support Ux500 hash
      crypto: ux500/hash - delete driver

 .../devicetree/bindings/crypto/st,stm32-hash.yaml  |   23 +-
 drivers/crypto/Kconfig                             |   10 -
 drivers/crypto/Makefile                            |    1 -
 drivers/crypto/stm32/stm32-hash.c                  |  266 ++-
 drivers/crypto/ux500/Kconfig                       |   22 -
 drivers/crypto/ux500/Makefile                      |    7 -
 drivers/crypto/ux500/hash/Makefile                 |   11 -
 drivers/crypto/ux500/hash/hash_alg.h               |  398 ----
 drivers/crypto/ux500/hash/hash_core.c              | 1966 --------------------
 9 files changed, 249 insertions(+), 2455 deletions(-)
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
