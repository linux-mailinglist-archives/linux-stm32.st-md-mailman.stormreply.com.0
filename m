Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E167A781
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 01:23:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B58DFC69056;
	Wed, 25 Jan 2023 00:23:25 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 738E4C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:23:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id mg12so43505485ejc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XtSwGpV2j0nQXiZ+LcNdnpcv1hVjkJ1W08Bggr7Cjy0=;
 b=TIneo37BFcCoCvPMeBd+WYwoMRhtkaoPCmdy6r3Ws0YPEw99fpwL9/3Z9uvGBE8G5I
 J0pATloRutbCl+kMFdBctuX/JUuWrbwmXJqt0ZIKbXvl7cfejdjxN0iGJojYnm0HawTY
 +Pk9+qH+/lIxmXXnq7Iqzbfl3chdCfS7pl6Zw8sfTy99Ez9YeHDDZtnR/8UxtIMQJpvl
 88AJ+ATsMy51AlyxKQeUZjZIO7qOp1rNA9txjGTgCxfK6LtYcawgt68/Xu/YTlTQ7Lzt
 qB4+3/1iG6jrEY+Fs3ZJLGVFvwtVrxbJxaqyEmQrEFShhadwx4/8EKqUefbFNUlelut9
 M2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtSwGpV2j0nQXiZ+LcNdnpcv1hVjkJ1W08Bggr7Cjy0=;
 b=orFUCWq3ZgH+yszAkJ+D8QmSipL+zfP1h08stNt03rZJ/skaKmZIsEp4g/sSEnf063
 qCZ0T/TcoQXUYOob74hv+KLXuHbG7GUQ73b90LNnJ72AzsBZ47Ip3gyWLYkrVqlayZkS
 oK6JNGrFc1wPnVV8GDe5/u6RQZOqLmohva5H4UB2iqQ8tpTcoys4TBG2EDEiDDuAUvGO
 fe1p1Bi3Ml/XJkixpfZeARcni9c3flR8YW4LvHt9wADCo9Y2UW43f4wzGyXWD1xK6ADC
 GDadxCXDW1JuenSucoFgcc95k8tmumIZSReZaqixZe0yzkk6yftp1+SCvVVCAT45x+0K
 r4Tw==
X-Gm-Message-State: AFqh2kodGrl8L6IyZpq/uUsoQQuteBQv+1yOy9UVJCEtZUmFn2YSsJVU
 NaL+Htb8eEY8sd+RDDN3uGbOlw==
X-Google-Smtp-Source: AMrXdXsWPHwaqA3WsFV3Zsw9CNtSgOoeqJLePtVfjlhhSr1kf3GR4doCP1rTJ0p7Jd0Cz9n8wGI1Zg==
X-Received: by 2002:a17:906:8298:b0:86d:be0:607d with SMTP id
 h24-20020a170906829800b0086d0be0607dmr32534825ejx.70.1674606204058; 
 Tue, 24 Jan 2023 16:23:24 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 if10-20020a170906df4a00b00738795e7d9bsm1584606ejc.2.2023.01.24.16.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 16:23:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 01:23:09 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v3-4-32ee12cd6f06@linaro.org>
References: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 4/6] crypto: stm32/hash: Wait for idle
	before final CPU xmit
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

When calculating the hash using the CPU, right before the final
hash calculation, heavy testing on Ux500 reveals that it is wise
to wait for the hardware to go idle before calculating the
final hash.

The default test vectors mostly worked fine, but when I used the
extensive tests and stress the hardware I ran into this problem.

Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- No changes
ChangeLog v1->v2:
- Pick up Lionel's ACK
---
 drivers/crypto/stm32/stm32-hash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index cc0a4e413a82..d4eefd8292ff 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -362,6 +362,9 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 		stm32_hash_write(hdev, HASH_DIN, buffer[count]);
 
 	if (final) {
+		if (stm32_hash_wait_busy(hdev))
+			return -ETIMEDOUT;
+
 		stm32_hash_set_nblw(hdev, length);
 		reg = stm32_hash_read(hdev, HASH_STR);
 		reg |= HASH_STR_DCAL;

-- 
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
