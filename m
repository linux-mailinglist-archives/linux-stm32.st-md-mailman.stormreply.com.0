Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE816A546CE
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 10:48:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 693F7C7801E;
	Thu,  6 Mar 2025 09:48:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0744CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 09:48:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-391211ea598so296741f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741254518; x=1741859318;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
 b=b7gdVaq2132Vi0scxTgfbFLnHGshyRUOhkrgJEQ72KZm9ep4gbq3w+1CIIhYdWyk+d
 uCHkWhR68m1LrnvpXVLGaks/CRbIcOWTOcnnXMY8DvtLe230kttAoLo/1nxb5puXTpCE
 NrhjF2+Y25mvy9O0YwqGQWhkOCNC5gvo3ulIfJqoGT8NIgDqLjMPNHLRGjWZEb25loaw
 kF3NQeRDd7cv9ab+vzg+Mx8WnQ3f82F5QZRpqnjYJOZ5yr1qFhtheR7Jk0uMZYTOn+ME
 2+ccMJ7h4y6evmtlhXLt2eW5y3BYnDDo3RRMfy5/q6u448vytp9x6e6MiOmkuEWMz+tq
 UNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741254518; x=1741859318;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
 b=ixL3LWsW3gOaYuF6T6rW+AhMs3pffulqaoeDN/tEGHsUCX4WUXXsPUhKCK/ZIMYaEp
 alfUCM83+7c0vtNq9D5Wo0wTe0AA3+ew/uTE32pxjXC9fdNNIBsWvR2cZn/nU8QqT7bt
 xpxV6yatiznQPEdDXbSnPKvh3BCYi5pTVy9KGKZYN6U2stQbGVk1fO1BUs6mI35iOiWV
 nqrgSNNiSQEtVL9DAiZRnUPif8t1lcpNNPytUAEUTf8RZvtIISlQNqlnYzf9mxBYs61P
 D+hT04v7mQ5ECR2LLfiXl2L2+7L5a12foOGCWk7B4zoBys2ysqte0kGqcH3a89JbS1Ra
 daGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRYhludXH0aZmWAlJaDI0oFVcHplMRJNydnWJp9UsLaMtDl6iwwVuVLjQKgynUghmBz/N2Wnr2EHqp2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyzNd7TqS+f4miIA3Qm4uEkkQbQQhafJxITECSl1qSLGW7FJU2G
 8iOM02zeP87KK/3LnAriDbbR6o74LQc7l7rhxiHHXXTS/m26QoaANKo99qCZbeA=
X-Gm-Gg: ASbGncuuQJo69Mxj7xjvMwBwhFAbo1TgY/KQg77d9tmGZq5JifzgWhpKGTnTKJFlKux
 ccEaGDqIMK4h00yiBiKgkcwccTJO4uGuFF4ewPYDf5CKda6O//FWNn8oamCWAIlzhP2CPD7AFQM
 xJbCLVknj+Vi8LtVvvt+z8aVzggvb0oV/cy/bFguZdEi/0pN9RqGYSnQdjY6ZXAIyDTiByx51Dl
 /mbRCQt2LxYCDZdtC+Kl+XXxgezkmJ6P3PT0Y7F1l3xj7Q7tpoItFA+TupsIOBuPELHJSX7vdxv
 aIuwU5/QPftQhW8v82qzrpRRDBWbvRDNR2SPzR7xNHfYKrpp7A==
X-Google-Smtp-Source: AGHT+IFBd/ryvsqo4SuH5AoV+P7wyT4wM81i1izptWSUavGGlpTSK4T7eUmgeLPy3GMlZioDo8QvWA==
X-Received: by 2002:a05:6000:10d:b0:391:225:9521 with SMTP id
 ffacd0b85a97d-3911f7bd8b2mr4846113f8f.38.1741254518181; 
 Thu, 06 Mar 2025 01:48:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912bfba66esm1527318f8f.18.2025.03.06.01.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 01:48:37 -0800 (PST)
Date: Thu, 6 Mar 2025 12:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH next] spi: stm32-ospi: Fix an IS_ERR() vs NULL
 bug in stm32_ospi_get_resources()
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

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.  Fix the check to match.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..a544d7897edf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (rmem) {
 		ospi->mm_size = rmem->size;
 		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
-		if (IS_ERR(ospi->mm_base)) {
+		if (!ospi->mm_base) {
 			dev_err(dev, "unable to map memory region: %pa+%pa\n",
 				&rmem->base, &rmem->size);
-			ret = PTR_ERR(ospi->mm_base);
+			ret = -ENOMEM;
 			goto err_dma;
 		}
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
