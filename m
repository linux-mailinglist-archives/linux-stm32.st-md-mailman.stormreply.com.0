Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD026D74A4
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84ACAC6A614;
	Wed,  5 Apr 2023 06:50:37 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 358ADC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y15so45313100lfa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qiM54vpHAvlLc1pdSUZ0ibiOpnt1h50sa+Xwq+/IdPw=;
 b=NrIzxPmGSXw+D7zfQWluH8L67j+7Z5MeDhw3zqZd5jjc3icWMdC0My/4MCvihvPCZK
 onfKRBKS/1mUMkIL0ijSbq5OZKFmkM1NQhIHMWsNNdkBB2uH63+Xz4ewbNurBVEzD7hK
 aGPKZki4YxEwtXS06+AZqPV1ZtxwX6QAZq8y6c4wVflu3XZ6mkjzqkfNaHo3vTF/FyBn
 UFYWXmOw0XASQOEAyKdMImwGlYsXqMzMeBwU3p8Os0jayDDQYpRZtfqzu9UIKllkaLdI
 eBdQ5I6i+vVFSZAeY1lowqoodbxbKsgy3Hv+ldudIDG7+VbTbkn/mGQssA21b77sTtI/
 4Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677434;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiM54vpHAvlLc1pdSUZ0ibiOpnt1h50sa+Xwq+/IdPw=;
 b=zICE8u6T7wbIzbwLN+2ycd5HypeXxdklMvWZjCEaVFuioFR4McxH1Aj8vtTFzy7vFN
 p1R/ZBxNfsSlTlgGNeI1wRAaGLebVXEkMgc5OEtnw6871ekaJN6Y0tUGHlJAose6zN4k
 FbC6+rgbiUY/9wxmVGrQkossihGO3I3E20MO/ia6NFr5eb7QTGpqybmqQRSUYnVbYg3c
 whiJsC/XW4KGAuwLCb9uuZ8kARE/tD0ImNphVgI2ipXIOMTDd7pqaORBFKkzH8jnaGO1
 KZyP0juPFfPVAhlSAYlMjESzidzQaq2kmlymQ0/idRErMJjYKN9E6odyNt6AXkO8k0dc
 eq+w==
X-Gm-Message-State: AAQBX9cJCbLwZtc9k4G/X/LRsSbNsdhEhXJzPp4RzsI0elYXsFbtrrXh
 tm+hgRMnpQk50LLy20lQcCbSWw==
X-Google-Smtp-Source: AKy350bgqog8tYcwKoOQ4OK5DxI1lxCKOcQXvd+tbHHbQya6iSPCxpQb5CJPGihAIirSEe3C3YDMCA==
X-Received: by 2002:ac2:55af:0:b0:4eb:2a0:4021 with SMTP id
 y15-20020ac255af000000b004eb02a04021mr1365131lfg.34.1680677434539; 
 Tue, 04 Apr 2023 23:50:34 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:27 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-1-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 01/13] mmc: mmci: Only call busy_complete if
 callback defined
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

The code unconditionally calls host->ops->busy_complete()
if we get a busy response and the variant supports busy
detection (variant->busy_detect = true).

However there are several STM32 variants that define
variant->busy_detect to true but do not define any
busy_complete() callback. This looks like a recepie for
a NULL pointer exception.

Check that the callback is valid before calling it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index b9e5dfe74e5c..bc150c0d5eed 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1381,7 +1381,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 		return;
 
 	/* Handle busy detection on DAT0 if the variant supports it. */
-	if (busy_resp && host->variant->busy_detect)
+	if (busy_resp && host->variant->busy_detect && host->ops->busy_complete)
 		if (!host->ops->busy_complete(host, status, err_msk))
 			return;
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
