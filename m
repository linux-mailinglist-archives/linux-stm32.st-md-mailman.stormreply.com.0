Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E56570AD
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:04:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BF5AC65E6A;
	Tue, 27 Dec 2022 23:04:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD96BC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:04:20 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id q2so15053460ljp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ALCXqoODJG4Fl1tVrTYiR0YIC0rXIReKhT1lUtG3hdA=;
 b=yUVecZ76fCB6IvA+Cy8N88tPkw06p37lZ0KXjxTx3ZHIslky5t2WXlZV9KZb/ZaFPK
 26aLSaHZwMTeKto5N5oUi4HW12FrVrdFD8umOH9DB8DoPdV3MIL7bsFbWfGkoP0hxs98
 A3267hW+oerZP6yQzyh2Gn/JaxqbCm8XCBJ+q4M3H+jOIPsQae5d1TEuD0BUiFkp376H
 iY1LUWlWKCFJGekC4nxaq5WJczPk5sUoAFpX/DZC9cT8Plmy3MCkuutHjcmfNnPMxiJw
 fW3RrTjPpbINPMFi26xnHCtSRItCjMSvKI10Ew9AnhUQzNFoBTVYD4WHjeh3WLLPGBr4
 3LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALCXqoODJG4Fl1tVrTYiR0YIC0rXIReKhT1lUtG3hdA=;
 b=X4F4lJIZufig9ohwCFxlNM6JnYqklc6G9YV2+3JXRCUTiVAROgZBBjOV+P0sGjCMGF
 SjroYtobxzrZAFTrw85uTUQ1J4is1w2zbY1mF0z2xXtsC6H9B2ipmo4p2A9dOvmex/Su
 XvAnsU0yPSjQo0W9boWMMdOaVrXHPbnNsRUpF52GOfh80FXwmWBWAg0tjMtizOFxbFRL
 tNhH824dUDDufD8/9wJoUmfJlvoVGviMOOu4pTv3GDYuSsPf7Fz09MWduMSkT1HeWeVF
 w2gSN8TmxZ56+SeNhYPHqo7MeJO3yJOc6vCx/3rAY+fSwp/FPIRhOWnMy46Vrj7HZCXD
 i0Lw==
X-Gm-Message-State: AFqh2kop57KIwuzLjjRZicrb5/2PkvUsSH8nJhdHakJAg9NRohuK74xz
 ZppqQr15+zHo2tNgfnULQlkbig==
X-Google-Smtp-Source: AMrXdXuLm80d+XZDJHjvTajcZdy9zM+KujZjLg2FBDMAjQSW+sWpH+i5cLf5CJvpjqnCzwbw8l2iiA==
X-Received: by 2002:a2e:b0d0:0:b0:27f:8b85:4098 with SMTP id
 g16-20020a2eb0d0000000b0027f8b854098mr6719151ljl.52.1672182260250; 
 Tue, 27 Dec 2022 15:04:20 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:04:15 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:37 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-5-b637ac4cda01@linaro.org>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
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
Subject: [Linux-stm32] [PATCH 5/7] crypto: stm32/hash: Wait for idle before
	final CPU xmit
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

The default test vectors mostlt worked fine, but when I used the
extensive tests and stress the hardware I ran into this problem.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/stm32/stm32-hash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 5f03be121787..92b2d55d6e93 100644
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
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
