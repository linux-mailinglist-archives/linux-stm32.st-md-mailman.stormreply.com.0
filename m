Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76F77752B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29BFEC6B45B;
	Thu, 10 Aug 2023 09:59:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BD34C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:59:39 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so6417065e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661579; x=1692266379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Qov7/EIECuN7YtcszuKxgzKAg/7N7RK250nQPWPETE=;
 b=v30CTiX2qKSiN2j2kOUXUCQ/qjZOMt4Q+Owm3rESRLeuhidDmOvCrOs1B751U7IBfS
 zndSh6XEzMhiKeb+ubNbtz+e+V72tx4UaERrTzDLqmbUcQYMs/Az6xez653LBbsHef++
 T9dy9CN7KcU+b943r8yFryvjBu0JP7Mk4ItyR7P7x3+Q5qJFaJ51j4Q2b/y97aIH/w6P
 1RV2EzPllNQXNlOmHPs6wh3Qhc6uM/GvDWF1x8cfo5KWrurWHjgFCklcDtSh+vy45EqG
 /52U0A0GZVABjs+kvw7xVTeo0AFbVpIu6lKE/5Y7B+42GaFluEopx4cLAWbAg1eFDTnp
 NyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661579; x=1692266379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Qov7/EIECuN7YtcszuKxgzKAg/7N7RK250nQPWPETE=;
 b=OxyLo0R2RFE3IFUu8vnQCdQHKByHwKAklj07opQzNIQz2PSeEA1MYpPeVeobAynrB1
 p5+jmEynv32/AqKL5X6VuTfbr1MOgp/wl87VshBI6Qti3VBff/dwSGtBsTLLtl0mUEIc
 3Og4Jlj/QteR/9XZLSU6Xn31zoLBDFmoJmsBvwhKvFiGa4ziAQyiFwrwFEaQnE98Igx2
 LRZv47MIcZvBJaI4Vz1MoS9aEl/UcvLeW7fYIUL9B4RrlIuSask9hpbYa7oGdAd6Zo1q
 lSqnoVE8Guqxz0tqayD+lQhtBZmvkY51zNdmgHzqmf4LU3/6z0O8nCwz1L/kljNI0+1/
 l47g==
X-Gm-Message-State: AOJu0YwRhxamk7d8CekpsZ84Oty+rIHQpDLSPDtfkIfVxTZtc1syZ/Sp
 TBWBlu1ilYqnR6qLqVqmwGaiig==
X-Google-Smtp-Source: AGHT+IHW36O9ukQNOr4QWHcwll1B7aloOQhK9sSqv/YA8EWyZmzq6BHWsNTyVSKuU/1PJGhLJb1ZvA==
X-Received: by 2002:a5d:66c6:0:b0:317:9537:d741 with SMTP id
 k6-20020a5d66c6000000b003179537d741mr1614416wrw.54.1691661579124; 
 Thu, 10 Aug 2023 02:59:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d4d42000000b00317ca89f6c5sm1623182wru.107.2023.08.10.02.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Aug 2023 11:59:35 +0200
Message-Id: <20230810095936.123432-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: [Linux-stm32] [PATCH 1/2] Input: mms114 - fix
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

  drivers/input/touchscreen/mms114.c:507:15: error: cast to smaller integer type 'enum mms_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/touchscreen/mms114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index af233b6a16d9..d9beb15a3676 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -504,7 +504,7 @@ static int mms114_probe(struct i2c_client *client)
 	if (!match_data)
 		return -EINVAL;
 
-	data->type = (enum mms_type)match_data;
+	data->type = (uintptr_t)match_data;
 
 	data->num_keycodes = device_property_count_u32(&client->dev,
 						       "linux,keycodes");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
