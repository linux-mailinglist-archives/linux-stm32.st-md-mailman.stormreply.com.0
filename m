Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF57D46C8
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Oct 2023 07:01:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 440C0C6C837;
	Tue, 24 Oct 2023 05:01:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F1E6C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Oct 2023 05:01:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40838915cecso33576985e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698123709; x=1698728509;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ImCVUO1ahKZsANhATFtH58NBKo6LvXQpu5phZSZNnHA=;
 b=c/+ln8DSr/3Sij3EaIHStr7aOVwjTfeRYHedXeBkJ79jvpIi8K3o6VWdFzgiYeC2zd
 FsjfHph22AHvKGKrBmdOopt2orGulF9llirB0syMdsX1A/vPmicZzl7rJ8q76djpAqwy
 5KxL5T1oUUMUgn4SKZ5/Aq1PNF2kePipFhLEtJrHC2SXQ983c7eG8gCAVV6WjDqgYYV7
 jPhiqjV+S5ObAORSuM2wHs9RRR/OuOQScu0yfH2ao+M8UJ860Zzbd+BjZORKy6oI/Axr
 8rwlhdBx1cxlOOFGBSjp5Y5RqSyHdAWidxtcgGcD4R0CySPXTxscPzP5EFEU+8UNV9/6
 qH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698123709; x=1698728509;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImCVUO1ahKZsANhATFtH58NBKo6LvXQpu5phZSZNnHA=;
 b=MpEoUk/alxxuefdQBVVtGBdMQBX5/EVKTz/JFNVfIvUX4T68UHW7KZ1ZuVpHF5cPpw
 7vBlmbPWp+U8bk8VJQOd6qt1e1AuJaImHKmLcP7mpXe5I/p1IRYA4Y2w2VXcf+p5g7r3
 +TKnn00cNQ1TiRrxYvOouJPQ8MaojBvvbNN1STeydK9N7lWDV5LbjAd2EbSr6XkCVpn7
 0qd6UtPM04e5vkjNxSCmHSDGLcYbsyvWkmED7vM8reEL0g6VTkwCMXMaAAABlKWnmIEW
 +4GCgi42VK1kA+W1jEHGVCuSjkCoTOzt+dcsNGQ2m4MTg3a57kFmsFIYqlS4U4m+N755
 mslQ==
X-Gm-Message-State: AOJu0YwjRk2dPXnNUHzLbzs4sP8WX4jMK8bnkbm9rOaIlBlHyJFvNW8B
 ajAhBjuQvRsrtt9TNRfsHO6Ywg==
X-Google-Smtp-Source: AGHT+IHgvVy2f1BV1BsDfwKNhz9rEUGmMdEhT1ISE8VviisrMqlIOWgrMNB36+9/H1gdNBXg8/aFTA==
X-Received: by 2002:a05:600c:3594:b0:408:59d4:f3d8 with SMTP id
 p20-20020a05600c359400b0040859d4f3d8mr6674127wmq.18.1698123708705; 
 Mon, 23 Oct 2023 22:01:48 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b0032dc1fc84f2sm9154045wrp.46.2023.10.23.22.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 22:01:48 -0700 (PDT)
Date: Tue, 24 Oct 2023 08:01:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Message-ID: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Laurent Fert <laurent.fert@intel.com>, kernel-janitors@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] stm class: Fix a double free in
	stm_register_device()
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

The put_device(&stm->dev) call will trigger stm_device_release() which
frees "stm" so the vfree(stm) on the next line is a double free.

Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/stm/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 534fbefc7f6a..7315f7d3910d 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 		return -ENOMEM;
 
 	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
-	if (stm->major < 0)
-		goto err_free;
+	if (stm->major < 0) {
+		vfree(stm);
+		return stm->major;
+	}
 
 	device_initialize(&stm->dev);
 	stm->dev.devt = MKDEV(stm->major, 0);
@@ -913,10 +915,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 err_device:
 	unregister_chrdev(stm->major, stm_data->name);
 
-	/* matches device_initialize() above */
+	/* calls stm_device_release() */
 	put_device(&stm->dev);
-err_free:
-	vfree(stm);
 
 	return err;
 }
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
