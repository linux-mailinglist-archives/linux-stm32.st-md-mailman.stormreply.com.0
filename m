Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D777751D
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDA43C6B472;
	Thu, 10 Aug 2023 09:59:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E31AC6B471
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-3fe4b95c371so3882595e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661542; x=1692266342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zekv1qUTHsXZMS52D/bblKYQ9yuAb3K5khsXk7JIads=;
 b=Hsk6a635P0uAUW2FI8CFKpCkorA724IY5XNrKigMaVTe/XyKck9fs2A+yBzzHij0M0
 1qvAV8izKdrfUxYxu/93N605HJJ2hYYenHqzHQ3SO88mUlm/eJsuLphnT2WcfyRCGr+B
 OcG0uJNM9uVqWzAts3ZaJhhp4nkc0eksQF4tFOlvlot8gdUmd9SxDrfZbTSgN6yVJabE
 QDznRHzUux8migZ8J8W86WYwetjShJ+e0HordOTY9j3Bbo9ijueh498qxo6sVf/R6rKC
 ugpF4xt/BXsFr7Rcq7ITQOCppE5QX6rkKvq7rAC9kJcTFB5YJ8lJf9+OxHknho83FEdB
 la7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661542; x=1692266342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zekv1qUTHsXZMS52D/bblKYQ9yuAb3K5khsXk7JIads=;
 b=I0QRVvaVjLWAZ4kfdugUTe/ndiSjuq8YLQLbRPnT5G4cwPGgrdk9oR95tSvn/t5O4N
 b10W8uSguGW+rD2dyRMpgFIjaPHEGgQLeyp3k6v6EeOln0vYLEVmTOkmo3Plxec/SeK8
 7g/gaWAC3XZOjBgOogTk4YMpo8CpgJDKxlW7kMmRaIQggjhx4X5amImpU1xjusjVHg2t
 24I6aTuHOgJstfcjgAlt1bAFaVevm8VbuUn4+39bFOncKMMjgL0ISWr1lT/v6d3p0xqv
 zbdofh/pxf15kqtzP2JGGVAcL+6ddPlm8dsqCzqS444EWxSIvZ3qx4XAWV0N0oeAlUwq
 fh0w==
X-Gm-Message-State: AOJu0Yz+8VTg8Sbe0XjtnS+2cBI07XX9qWpI2Ic7m/+sHzu9G8EuXTHZ
 n2HNxFcbuJ6wDH4ai6regn0BKg==
X-Google-Smtp-Source: AGHT+IGPHL6/KxDf4b9fFexyz/4oHkLvUgzvOtzHyP1978kHH/Xl4TBlrKa+67TCneX1W4cSLYE/mA==
X-Received: by 2002:a05:600c:2909:b0:3fe:1b5e:82 with SMTP id
 i9-20020a05600c290900b003fe1b5e0082mr1114932wmd.20.1691661541849; 
 Thu, 10 Aug 2023 02:59:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b003179b3fd837sm1621372wrj.33.2023.08.10.02.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Date: Thu, 10 Aug 2023 11:58:47 +0200
Message-Id: <20230810095849.123321-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 7/9] mfd: wm8994: Fix
	Wvoid-pointer-to-enum-cast warning
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

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  wm8994-core.c:631:19: error: cast to smaller integer type 'enum wm8994_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/wm8994-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 1e4f1694f065..aba7af688175 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -628,7 +628,7 @@ static int wm8994_i2c_probe(struct i2c_client *i2c)
 	if (i2c->dev.of_node) {
 		of_id = of_match_device(wm8994_of_match, &i2c->dev);
 		if (of_id)
-			wm8994->type = (enum wm8994_type)of_id->data;
+			wm8994->type = (uintptr_t)of_id->data;
 	} else {
 		wm8994->type = id->driver_data;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
