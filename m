Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E226570A7
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Dec 2022 00:03:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E70C65068;
	Tue, 27 Dec 2022 23:03:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 604DEC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:03:56 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s25so15076027lji.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i2N7NNifAQ86WoZ7rTUxWJfmzgVYj68lx1CkkjLHfuc=;
 b=oKTHfe5WpDJ+0S0x9Q64mivXn6gj2tUZMKKd+8RnEujrrZl0qNLXkvCbulXJooqt04
 EoqpfufbUrXy9fHKA/OlX/D7kQNF3+6GgR5OXGr5Gkp61L/j4g6Pb6bS64LBj7/OVVX0
 42UnDcK2eAj9hkH+31lKbADQ5LIwKAK6CiSzZkIrvYw9oUvs5icpP537v50zIj435cCu
 B0TADlrv2/+zvFxwe8Y8/mmkevlhPAIZ0zCY+4W2dKqmmFRJD8SXZyQMXRUdrRXq2KZR
 nYV7FVyieFgWYBAHV4DIim/oxTMFmGRoFTXhYm2Aab//s3485UxwOZ0URpjJj6ppgvJu
 AkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2N7NNifAQ86WoZ7rTUxWJfmzgVYj68lx1CkkjLHfuc=;
 b=S2R1KfAG59fJHBNVGqO13tEHNeXbc2awLeOhP1I0mm2xpp+DVxaQeGVW6IcncJ1iz4
 uGpS/KjsHhx6hFb8F0y/wTd6DDy/Arxee4nIBn54yvbTefZuOMh59jCVXNQJ2zTWDbpa
 GoUzIPvwhhZWeqJqIXPaDqgbWUM+TaJ6bw3ellAaSH/z3f4wC9sXps1IQ0c5hoIOhe0R
 LdKoUsUuBTdmkzXo0E48GiMZr214X6MWQ5lX2NfERRiPbf8S0ZF9ohFzarjtRo9FlBc1
 nKhl5LkHWq19PjPI59Grgkf/C06hYf3qJzBS8xRMM6ZK5zRkF/fyEYLrc3CPG93XiLfb
 +8Aw==
X-Gm-Message-State: AFqh2kr9/SeriW40vA6UUh6NNRGiTuGh3OaxkyntlgcgfWaUEL9RZL7E
 RCko9pAqhKQ880Cod4qUwgezjw==
X-Google-Smtp-Source: AMrXdXvrQu86e9KN1tewvOMgrDxWfgLXTRrdS3k1l5PdDsuMATBoNzZFvn6HMaqHHB4dG5xK1SAnpA==
X-Received: by 2002:a2e:954f:0:b0:27f:c258:b24a with SMTP id
 t15-20020a2e954f000000b0027fc258b24amr1866334ljh.11.1672182235821; 
 Tue, 27 Dec 2022 15:03:55 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 bg25-20020a05651c0b9900b0027fbd4ee003sm876925ljb.124.2022.12.27.15.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 15:03:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2022 00:03:34 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v1-2-b637ac4cda01@linaro.org>
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
Subject: [Linux-stm32] [PATCH 2/7] crypto: stm32/hash: Simplify code
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

We are passing (rctx->flags & HASH_FLAGS_FINUP) as indicator
for the final request but we already know this to be true since
we are in the (final) arm of an if-statement set from the same
flag. Just open-code it as true.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/stm32/stm32-hash.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d33006d43f76..0473ced7b4ea 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -399,8 +399,7 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 	if (final) {
 		bufcnt = rctx->bufcnt;
 		rctx->bufcnt = 0;
-		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt,
-					  (rctx->flags & HASH_FLAGS_FINUP));
+		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
 	}
 
 	return err;

-- 
2.38.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
