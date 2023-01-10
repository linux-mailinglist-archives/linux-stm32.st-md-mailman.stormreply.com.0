Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 528ED664C39
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 20:19:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E11C69054;
	Tue, 10 Jan 2023 19:19:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F03FC69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 19:19:38 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bq39so20073508lfb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 11:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xlq2CbHJ+i9XV8+jNLPey1GnGzkjb+RabVFKJfxLUEk=;
 b=cCr03c8OuR3SxnQcfmUXa5UYpYW/hjC3nMq95tqfrFBv83fwN8AaPfeyefx/H7Bnzt
 irg/urOSRix4aVAUCrwcXDVrm7lkLGBlURTs2ihDKek6Ust2Cq6BkaqTyLn6oPu/gk61
 j91iraxv1DqxLFZTvyMOqBKE6Rw5HZ2sqKRjkUAZAVgQkju6G9GjFHN8ULbsv3C3WBz/
 Q50vVOo9pFaaep4yYJ+RafWYHDsNAbrAPphVtujYgewY21XzgEsypCAYYJUNhkjARy1r
 NpqQvKxZIgr06PI1BDXxLk9uzjQVDV9uLtb4N2O3lCPB6Wj+RAidFQK5jwRSvuF81abZ
 Xy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xlq2CbHJ+i9XV8+jNLPey1GnGzkjb+RabVFKJfxLUEk=;
 b=327q4lGjhNEsz8YPGU8fantDFyujcnYduoJeoArXYbo95J/nNLSoYNet+q0Eggq1bh
 JHbwSDOhS0YCnIYh2QgH8SUkuQiXLrTGzacOQKmoQtwGtTkUQ9jj3HeycX7pmq1Hgee6
 TEkWkJCiha+D/qyx+fT1Gx3zZ7v9oarnCPtqYzRHTRrSpDh9tZdMzgMiVgZLAlxkuvRO
 RXOwCNFF9b86pBfrtHLbf/yXIlUjEBMXSSvQI/Rnvb4ehEOWNhdG9gplU++3mKoiLG+z
 nYqNSYEizg0uR4v7KKiMeN7jfBXfGzWtTZ52BIcJ8IDno4rxAE7pjcjQk795A73OtY3m
 02zA==
X-Gm-Message-State: AFqh2kplVtDhhR+zy1xO4HiqlWKN4/rEQTtSKuSb+Tm9I0JVF6cG/lx6
 zDz+8CBzofkrl5Yt0nkyRNSZuoEh6lx1aJxy
X-Google-Smtp-Source: AMrXdXt72stXioSMjkZTM/iKtBKW04S+MylRrfbbR19vpORoaY2m0ITpHLr/qexleH2KJ/KJ7v47aw==
X-Received: by 2002:a05:6512:c1b:b0:4cb:3e50:f5e3 with SMTP id
 z27-20020a0565120c1b00b004cb3e50f5e3mr10337407lfu.61.1673378377977; 
 Tue, 10 Jan 2023 11:19:37 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 x28-20020a056512131c00b004b549ad99adsm2297725lfu.304.2023.01.10.11.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 11:19:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jan 2023 20:19:15 +0100
MIME-Version: 1.0
Message-Id: <20221227-ux500-stm32-hash-v2-4-bc443bc44ca4@linaro.org>
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
In-Reply-To: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
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
Subject: [Linux-stm32] [PATCH v2 4/6] crypto: stm32/hash: Wait for idle
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
