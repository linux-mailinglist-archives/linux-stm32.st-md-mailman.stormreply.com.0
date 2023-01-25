Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E367A77D
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 01:23:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F61DC69048;
	Wed, 25 Jan 2023 00:23:22 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85A8CC65E72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:23:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id k20so2944813edj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9/AsczzAoIWOzK8lXXQYr+oZjWpK7SKdHJ3MVSXvuVY=;
 b=G5sSLdwLn4mg94HvxPiDfL7ErUh2JaPb1dvXZIK7dW4TB9o4KJCsGO+civsatRjENj
 eB5CnYxpgVTynGQFCDLap3gEHuE3VsV6qAYe6Od/8USkm/H7MwWPqfnnX/RD4qIjtb4S
 4Z+4o7PbWsOD+zftvKx/HqRqH16rruAVChrd2R9oDdlDjgoVptjcnZNvJ/16j23vI5lf
 h00IW0b2nnEDfMoEYQHgFLmj8fxPSXiaBc/rNFwJSp2Yef20EZnMAVwg9pnliUanstTj
 RFPP76mjCFI7dOc92UuDD547Rr68oFWF870u8NqijqqpfY6Jh7jvk8tpRry100+RA/VI
 88Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/AsczzAoIWOzK8lXXQYr+oZjWpK7SKdHJ3MVSXvuVY=;
 b=K0nFizXuTvsoTWehvAK4oE7i/LCb2OC2ckmO060tmbDADd3utQds+607vQ4vAgye6Z
 buvA/BqZL+/WxW757j5+mloIdLS5uND9Pry+eDWdzE3704+tpcWnkJUWe/ELksn6NYit
 Iu55tsHZfEtPBQwsOOh0vu6vDJWeaIMBWBP91YjkT29wXF+cC5Rfurrp5qcHDNnIen3D
 3H05MRKkZiTsLW5BFMpQo1ntP5WFU+H7L6b+EgVoNs1gURmkigXc86j3r609VVduuHyf
 mR76WMaxLZKcSyCs6kNuLbyjKU7IHbQufW5ZlFYNNshthGK4JNmmkWtA8ceGZrVC2tBd
 GIdg==
X-Gm-Message-State: AO0yUKWP9QGEv510fVrn+3vm3HytAX62G3kBMb5gY0Cq0FEzMpSQuoUH
 0hAQ/oPaM+VOmKPiCoUG0g3DAg==
X-Google-Smtp-Source: AK7set8pICFlSnupzt+B/4dEj+GIHPXyXilClxiORWUNlNS5tqZ3vG+e4gQbF27oTL658xWqahpvKQ==
X-Received: by 2002:a05:6402:298c:b0:49f:a3d7:b84d with SMTP id
 eq12-20020a056402298c00b0049fa3d7b84dmr5449787edb.34.1674606201166; 
 Tue, 24 Jan 2023 16:23:21 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 if10-20020a170906df4a00b00738795e7d9bsm1584606ejc.2.2023.01.24.16.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 16:23:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 01:23:07 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v3-2-32ee12cd6f06@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 2/6] crypto: stm32/hash: Simplify code
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

Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- No changes
ChangeLog v1->v2:
- Pick up Lionel's ACK
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
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
