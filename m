Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE53AD5686
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 15:09:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93D59C32E8E;
	Wed, 11 Jun 2025 13:09:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42E3FC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 13:09:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so55571175e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749647389; x=1750252189;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
 b=wBzjsD/aK/qj5wldSlVmbv7RiFtQmCm9XaZvoLIDRvoJ5H04PeOAUVsqS5b1L/P36P
 lwnNHijXDzoZkMQvJxvpCaYBDN3sQSvvMt/kwlEsGLkm53QNbUvycpu3zZJ2p2Pg+6km
 KPuOt7jalRxlkgdtoo750g9KFHFXI91W5pyl9UufeBRtgBw4LZIDIJ6x517CudWQdA0T
 qSOl2rklUQecdYy1XeL3jzoDjM8YO8deKZ2b9vJreT1wQMgqmmb8vj4dt0XdROxzTNRY
 xhqx1k60riEGEPZgTsyUgMAc6lw+Gv1mVq0XS7f9JXWNIkgTtkaVCk1kqrlL+knoW2XA
 KNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749647389; x=1750252189;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
 b=V6qvvqqqcrvKPIP83RbY8O6EEGyi14joqYj/7WeFAZEEEnv6q0790nhtj2SvsXcJ7z
 o0750sLxFZBX55yZ6mdy+Pj4BJ36QHyw3uowTZ8nbu/nlqETwpjxtUZP6sJFLenbf4E3
 ahL7a9zvdED7ESXKdEGMjRpc7BjWstiKZ6W9wIblOzEiF8hHQRXowMk7DYcn5bgSqX6R
 AukAutA2vflRst2HZGcvx6ruBl9qBVn2NXOvq4/NKXsKdd6dMQZ1nD7RAxLBHSSRTlLt
 2lXYJRzCMnb6+henton0QxhKdETScD7Qa/aLkrUW76dcV4wdZcoMHb1liK+B0yu9ZoyB
 e1Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFTDbYKCdbN79bo98EWOeq70vmFFvpG5v31DwoJn27/2ZLtGtj0XXo2CSWdiNrDDqbFuQJ6P0AvEyYSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoIujIypp++LvjvnuiusJCA2on/sj94GXF4WChmRnQPmHjX9zB
 XE4zbFwgYXqjDtkI8WgeMVITQf+Q9FXbo4+mqKXFKQx7FAmt61aIaxqX3/BEgskdlWc=
X-Gm-Gg: ASbGncv7afzTQ/ARqJlwwyjTNxtDYP6gg91q/lH5HFL3ZugA1MN+YYF9t+F4yyHaVRw
 hViWG6ErQVuCQ7s682U87bHd2S1hAUyOjbSSVMlF+1Y8i0RuVOgzeNKYgiM/8O6hQUKujKfDWzM
 Bz1ZiM3GrY2rO42UgVzh2Iaha+lPTUWorkENAFyQKiGtrgnNtVjAdU1oGOU5g3rjNoELGItMKOn
 H/rvb60y0dtc5WamEetPlvtfsGPOG9UuEd2WJsKwKC929/HpeAhllWLce4T5hkD7/w/lKGWbKoj
 0skZpYv3KmLtVftGf7IqbRkRASY+O1thiYQsIEcIKAZjsNju85sHS/rnDe7A5piJz4Q=
X-Google-Smtp-Source: AGHT+IEBRO+SagBJ4t0nPcz40k+JfMlWO7SvxBp7cy9P/imnH5Z03hsajw0WU0mj5IxyTgoNyCPJNA==
X-Received: by 2002:a05:6000:2204:b0:3a4:fc0a:33ca with SMTP id
 ffacd0b85a97d-3a558a926a5mr2258868f8f.4.1749647389545; 
 Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53246b678sm15078061f8f.101.2025.06.11.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:09:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <aEmAGTUzzKZlLe3K@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH next] spi: stm32-ospi: clean up on error in
	probe()
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

If reset_control_acquire() fails, then we can't return directly.
We need to do a little clean up first.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index db6b1cfc970f..4ab7e86f4bd5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -937,8 +937,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 		goto err_pm_enable;
 
 	ret = reset_control_acquire(ospi->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+	if (ret) {
+		dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+		goto err_pm_resume;
+	}
 
 	reset_control_assert(ospi->rstc);
 	udelay(2);
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
