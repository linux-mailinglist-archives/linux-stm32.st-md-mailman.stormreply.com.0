Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E888CE3B
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CC28C71281;
	Tue, 26 Mar 2024 20:24:05 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E21F7C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:03 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso695963066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484643; x=1712089443;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oszJq80lB2gEh9lWeE9ItwyQq2sVQmw5suR14elTxRc=;
 b=oc9MSCXkx1QLslAr7+PP76VEnA7ROR3S6+A8zdxaOlEuidSrv1xNLOkiWduJC0usp/
 g2Dfm7BPzugqgeiUzp05s9DCafWRCjBe8RshJHZhBDbjzjQ/0CSJUdlV4IOBOVXYU6sj
 hnJfeURmOuwjJiKz6pgZCkz1l98x4pjfiLnV6lttMGZY/A0/fIVD1Z7V8s96MTRuUNw/
 adSAEXNxgrHIpU4pcAXu29lJC0SxRg2sQQJ+5PDwGFju0B7zuEhSS48TZs5vFVGl4KxW
 yYyGixEN8Bk/f6r2XEGyjVvGFZjMRoDjUFCLuhBcWUVz0N0JOCqYKIQEE0I90k6usY4U
 +NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484643; x=1712089443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oszJq80lB2gEh9lWeE9ItwyQq2sVQmw5suR14elTxRc=;
 b=v8v4FeyzWU1Cu3vHyKFczjAa4gw3IX6DD45HmsREle9guS1HHhAO8a3a0gx82Yjc0M
 Jza+5RxvytscPNf/9u1Eefzv9tDzutjnOGsikUY1s4s7k3QWpXNz1r0YHYNwm6hTU3GE
 cn5D2AYI/FN+15Aby7qUZFxYIOQKeElkqgLpdnw5lkLbFDy5OLvW3VDKS6cFHOKujhGH
 KZ5XCmvfUHrAj09H3UBnObyzR2LJc45nVbUp7ouo6RKyKJDe+BUaJahvwZJxmL5e2q5i
 9plu2Kfxqz+iZW/Fg6DtK8C6u9N+N3Q1XbDZUvPmlZMDdv4uKctzs/Iw1pJYYVLVuQxK
 0zFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX575b28LWP659pf2fQ9RDwLyWVk5eUIfqnYIrFbd6wH2uT1V1cqyVX9Vj3uS1RqnFh4c1hX5ZPbowp1Bk4ngutsfoZqXqo0oK3B8NpUZf2Gg+wuu/UHxip
X-Gm-Message-State: AOJu0YzJEG8c1cdG/YSGgixCGyu0IjWmPTjL2iAVWM6NMqzWAnOzn2LQ
 n3KAT90PDGZJ86qcUlPCK22scffMuxOx8R02PfaAxZSFUbReXADAD1pWcej2b+0=
X-Google-Smtp-Source: AGHT+IF36ebGHdThhaXtGqM/m8jr3LdkOo+O0duXrjQ1dCCzQHRrHj2gdSWK7PhOmV9feIMSlJ3TuQ==
X-Received: by 2002:a17:906:169a:b0:a4d:f406:259e with SMTP id
 s26-20020a170906169a00b00a4df406259emr1568712ejd.1.1711484643350; 
 Tue, 26 Mar 2024 13:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:32 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-2-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=E6oiCUv77bElbjGq0w2fujcqFTlKT8NL9bDH7uHNcnY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7NOwLLbJwaDUXL7V0PZh2jku+JoMDsPrc7m
 NzHCD3TWnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzQAKCRDBN2bmhouD
 1zcCD/wL7jy6EpLsVXBGfS64OBKoLjqB570Nzr0xz5jjEOIHnWEDebnlh2C9JRhEwi4ybeuiYUh
 d8OKzKNy5u1RrBqvyeZD3ETlW83XhTv8PdFb8WanJkUJ7Ob8YMesycKcnijf2seqXrPkA+FQI4w
 rFSrSXuvNx+OjDSmYfkVidv0rpBT74bf/PzYydwUxVP7rjTuXM5rNKSl77s6EvPOvrPTE8t/Rbw
 XrHqKCXQlBMdBt4uC6fm9GVQtc6SLAsYheVeOLRGxtz+MYUaDWGMicARiMFrAirc29AI7hftROU
 84wz50/TuB4s4U9heZ0ljKA1oYuujdugLPLph9WXB+zzfHz2dYa76mPI03DuF0w6CXtxhmqM456
 IUPEIIFbp/HLx0x50QhWNnz+X5KnLTYvIPjLXoqwYe0klaC2f+mqBgI4pEGKFwgjMlCOPyGGw+W
 gK4hjrni09R1RHmFzfeZ+XxjrHuYiY89MQvapBUifZDclD6Tje2rmV2YrRW+3ZnsyMz7+P8TFNm
 VdlFafpLM/XiQfBV9MOXM83S/RGSkPnFFuWAf0mscOBGiqlVjPIsaBkamqXOUZBaJXWxLUK62dj
 CfgUsFRgQUrSiw0cj9+pSXjf7sL9haRJXVq8dQ56TA3w/5+9G45chAo/5PIBxYIFaeWsLHhVUgL
 SqRSg3rM2hSciDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 02/19] coresight: cti: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on first amba patch.
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index e805617020d0..d2b5a5718c29 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -982,7 +982,6 @@ MODULE_DEVICE_TABLE(amba, cti_ids);
 static struct amba_driver cti_driver = {
 	.drv = {
 		.name	= "coresight-cti",
-		.owner = THIS_MODULE,
 		.suppress_bind_attrs = true,
 	},
 	.probe		= cti_probe,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
