Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 065267D624F
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Oct 2023 09:20:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3756C6C85B;
	Wed, 25 Oct 2023 07:20:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D6FDC6C857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Oct 2023 07:20:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso2828115e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Oct 2023 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698218450; x=1698823250;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoS842zLgIKkSI8+QUqHv3sPQiEji6N4hBzkvgiFN50=;
 b=P+SEt1q9GXeNCekAjWVn0g740qtgjcDJWZz+YOprpPT7uHwmGC/M4HVMt5JUGZn+It
 TT8BGKeBpMdhJYaRH10okowOjSfekOyB+9zGCPvd29uEii1LZpM3VZ4r8wpkm8aRHo52
 ZgB053MA302XHcHs6CGtsumeIACi+TIr4PuX86d6kcs7p4GyaCzOLGD+L2ar5D+U7f8/
 qVUyoK8c2fyK0rsuEfMK89m3zy0LHfXm2CicWH7MiinXGAbKO14VQ2sGT06XIZ8Bcdlq
 xG786oIBCKJ8XS+qwJHSHsxZ8AG+w0mam2oP3waDer6kFCB06tK+DjyNGevMlkGK880S
 JGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698218450; x=1698823250;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoS842zLgIKkSI8+QUqHv3sPQiEji6N4hBzkvgiFN50=;
 b=XMr4TKRCs/OTUGSfRwqbD0K93Bl8GQLz+Zt/5s9vo2rYCG00rJKBpzD2o+devMlEzR
 uWIN1d1M4UpAJv0cW77WyC7+fKKniZQccSxiISsf5uWnooMILZd+rOpdYKtlfOMGehtR
 Q/8stHRF12eVjmERuQDpZTr2TsI7HjiErSFk3As6+emSZ2opfv9zUhC1XMq7xzIrWdLk
 kRtaW5xCYR3Rv389NEPsgYl6uPH3UsxTmPh4fSWdDqiBWlK1NoXNNPMR1+wrKdzrxx9q
 2QIkSGzCwdax6Wkd1JXeiDvIKhQ+zzy8PX1h067uyxlvd36ccePO8TQILbEfGt3YA7J/
 /+XA==
X-Gm-Message-State: AOJu0YwLOwTTO3+brryj9dhRLyIKDYZuKMAeLohdy4k6fo7brFOoChbb
 DQ5SxXzLkTkEdYhHxJtozQnQjw==
X-Google-Smtp-Source: AGHT+IGmnYPUPc5xfkBAUX/aDYGji9jc3HoO/aGKz5O7ooj69MkfZd5JW8TMd25Bp/TNALuVjjD/tQ==
X-Received: by 2002:a5d:5911:0:b0:329:2649:ced5 with SMTP id
 v17-20020a5d5911000000b003292649ced5mr15232476wrd.32.1698218450519; 
 Wed, 25 Oct 2023 00:20:50 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b0032db4825495sm11370891wrx.22.2023.10.25.00.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:20:50 -0700 (PDT)
Date: Wed, 25 Oct 2023 10:20:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Message-ID: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: kernel-janitors@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Laurent Fert <laurent.fert@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] stm class: Fix a double free in
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
v2:  My first version introduced a use after free bug.  Thanks Amelie,
     for catching this.

 drivers/hwtracing/stm/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 534fbefc7f6a..20895d391562 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -868,8 +868,11 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 		return -ENOMEM;
 
 	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
-	if (stm->major < 0)
-		goto err_free;
+	if (stm->major < 0) {
+		err = stm->major;
+		vfree(stm);
+		return err;
+	}
 
 	device_initialize(&stm->dev);
 	stm->dev.devt = MKDEV(stm->major, 0);
@@ -913,10 +916,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
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
