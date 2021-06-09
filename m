Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F16803A0911
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 03:32:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAA5DC58D5C;
	Wed,  9 Jun 2021 01:32:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B2ECC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 01:32:06 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 11so11666481plk.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 18:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+ymk8l7sDsxacyxiiHwx/yDAi9ouIx2opOlllHKJGo=;
 b=rETqv+/5v6VexoVTKEiL4+p0jOdC7Wugt1hqCAt26ZVIK7eVr04itPS5S98u10CUXF
 wCkbpBcx9jkH79pTdTSzBVjyOJEfQ5NLFbGORbm8Y7AaQsp1Q7bXGgU3cMyrGT+eCDYL
 imKFwJoBJNIx5fhuK8Z2yq8c+s51ZpZ5Kw59BjOOrlrGdwlb4TiDX2smFWRAyDgStNtA
 47prT7DrHcjDa+gAa/4ZAnEiaTx0jI6CvN6ahwbOL1YxljGe7y2WHNA+zOy23wfaRbGr
 8GxN9l65KStBtx/mxg8fAw27c3TPkr+JHUJVAafW72CxDvSoNxBtxoM+rAzoCKdbbAST
 sIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+ymk8l7sDsxacyxiiHwx/yDAi9ouIx2opOlllHKJGo=;
 b=fXxMMbse1jR7lgKqpv8v33F/UTE91rhZo5dYWPho33EtQD14vZXtQ6ZG5ffsG59Mk+
 AOA0v0CTBm2efjJHZXJFqPrRU9a62jNYFW6EaG+Hn30hajTwrURODZWRQ5/nQzLIuhmS
 zsisEkA6Wdmt6pwidKLe/sijC24kyL11nV4SXbl2FcnhCazpv2HOoRkRz1slhhPdd4wn
 y8cSLBNe/hYFT6ulhcBmW1tVLvAM5j4R+3Z/rO5i+foC4Knc8lkrk+wVHjhDsAZoKUx/
 7Aou6PBMGsdFSoZG0h9qkk1Uoj3/zzO2ltD5EL7xIRbbSRNYqNdbNVvgX8cC2XBscBRT
 de4w==
X-Gm-Message-State: AOAM531S73Ly+2OK82i8vZc1PNES3fWS+oI69jjJKU2TleIkKbcDiNPr
 KtJCvFZUu2sZaNL78Kr97CM=
X-Google-Smtp-Source: ABdhPJzksTcPTip/Mhf4JXMjYM+qZ6M24lezTlxsHVdN8I2e98HWcnQmfJCDEEdD2+XO7nVchRUGpQ==
X-Received: by 2002:a17:90a:a098:: with SMTP id
 r24mr7872954pjp.120.1623202324568; 
 Tue, 08 Jun 2021 18:32:04 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id v14sm12659815pgl.86.2021.06.08.18.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:32:04 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Wed,  9 Jun 2021 10:31:06 +0900
Message-Id: <77e9f3daa091d0ad0ee56b8973705dd03db85dd4.1623201081.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623201081.git.vilhelm.gray@gmail.com>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v11 03/33] counter: 104-quad-8: Remove
	pointless comment
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

It is obvious that devm_counter_register() is used to register a Counter
device, so a comment stating such is pointless here.

Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/104-quad-8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 9691f8612be8..4bb9abffae48 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -1082,7 +1082,6 @@ static int quad8_probe(struct device *dev, unsigned int id)
 	/* Enable all counters */
 	outb(QUAD8_CHAN_OP_ENABLE_COUNTERS, base[id] + QUAD8_REG_CHAN_OP);
 
-	/* Register Counter device */
 	return devm_counter_register(dev, &priv->counter);
 }
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
