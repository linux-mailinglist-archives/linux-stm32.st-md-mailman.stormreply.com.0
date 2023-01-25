Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E351E67A77F
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 01:23:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A43E4C69055;
	Wed, 25 Jan 2023 00:23:24 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AB7BC6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:23:23 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id bk15so43433307ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dZ27p7zF4T27+K/nN0SUmKAuxZywkQG/U6QyG5d8NyA=;
 b=QJ/19TCg14yqvOQLmIFg24XehYjzB9j13SdaTs1rKJ83AU1VbzHGuKuUMnia3DaMML
 LYwAkiPjcpm6NzEf2MRfedGuZXWLPbji4TBfQVe1kb2+bizrSabk+mvVD4ucmqmdHomI
 sOzZQOyU62Vj1y/SnnJ7ovCeQmu4/ovGgcCLS58UHYkmDqA9IS737Fa8dcPPHHX8FyKU
 X6ffSN2Y1q2FZbNMIoB5MCFOrEAHXpIJuP732o9D10rrJkvmhIKXIgz+muzpARYPOoYa
 4oXKc+9TN6pU4/ulqMYkpcDIyOvjw7ARw0qoWqgw9n9iDD42cWOsF+YLPNx9JYP0EXLl
 oJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZ27p7zF4T27+K/nN0SUmKAuxZywkQG/U6QyG5d8NyA=;
 b=I1JGHM1Yl3yIRHAGeph53x4eAd7/e+/afg0R7fI0VadcAIjEDWaHuI8o7bGmX1MKoQ
 H17rhr/4hyte9jjs6ss7ahQuS2h5O21lrE4gaU/IytQ8gc6HsjrUmoB9fVWuVsMyhpjR
 oL4J/zkeJf6p7s0RJ585ROfdn5xe1GWeVWrysqT9DhV1JcmNwDGlRrN9+xe1zgFFeMxM
 WFyWv3PK3tHbCk5koLfe/UaNm7qiTZzEtm9ZT1Wu5tX8NX8B+sOguxJD4h1ndSDtETiy
 cJWdiVlu0LnXGjRAlesD1WFP1ZN8fYDFrfh4jUlvsOF7xh4w8wld+iLLl4ugsuiT2+Qp
 85ZQ==
X-Gm-Message-State: AFqh2koqsdD8c6RNb91QBemWQPtHZMdYPGy5zjNSp4DNZ6dMVpfhNZAa
 xLzjLiBBNUvLMcAW4RHCj4gozw==
X-Google-Smtp-Source: AMrXdXuPVo13SXKzlv8efr0eXOVX+Rwf2H5jTBFY9jVwKrKrye2EFI7PJBI7aI+BIoZC8hmeQf5ZAg==
X-Received: by 2002:a17:906:a3cf:b0:861:3ed5:e029 with SMTP id
 ca15-20020a170906a3cf00b008613ed5e029mr44674312ejb.49.1674606202741; 
 Tue, 24 Jan 2023 16:23:22 -0800 (PST)
Received: from fedora.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 if10-20020a170906df4a00b00738795e7d9bsm1584606ejc.2.2023.01.24.16.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 16:23:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 01:23:08 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v3-3-32ee12cd6f06@linaro.org>
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
Subject: [Linux-stm32] [PATCH v3 3/6] crypto: stm32/hash: Use existing busy
	poll function
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

When exporting state we are waiting indefinitely in the same
was as the ordinary stm32_hash_wait_busy() poll-for-completion
function but without a timeout, which means we could hang in
an eternal loop. Fix this by waiting for completion like the
rest of the code.

Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- No changes
ChangeLog v1->v2:
- Pick up Lionel's ACK
---
 drivers/crypto/stm32/stm32-hash.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 0473ced7b4ea..cc0a4e413a82 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -960,11 +960,13 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 	struct stm32_hash_dev *hdev = stm32_hash_find_dev(ctx);
 	u32 *preg;
 	unsigned int i;
+	int ret;
 
 	pm_runtime_get_sync(hdev->dev);
 
-	while ((stm32_hash_read(hdev, HASH_SR) & HASH_SR_BUSY))
-		cpu_relax();
+	ret = stm32_hash_wait_busy(hdev);
+	if (ret)
+		return ret;
 
 	rctx->hw_context = kmalloc_array(3 + HASH_CSR_REGISTER_NUMBER,
 					 sizeof(u32),

-- 
2.39.0
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
