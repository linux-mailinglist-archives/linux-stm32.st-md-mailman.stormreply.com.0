Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EF76EED1
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 17:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B44FC6A611;
	Thu,  3 Aug 2023 15:58:02 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02266C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 13:35:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so11359647e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Aug 2023 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690983318; x=1691588118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cIdVDpJXzS+NvG6cPE69v+Vo8D8lHdK5ntY+IO2Phoo=;
 b=D2kDCBtAttEWumqYhWLnqvzu6wleezJOq2vuwf5ntVyQ2rTwT6EjhipQarm7eSaZM0
 c1p/UpO91vnGCCn0bVnT2mogT1Dl0G55aWrYyug7/TMfrZa6rXcHSGBgIpxgtgX0N8zw
 UzzjBeDVkF95OdNCm7kbjHxJyxForQRSK20cO1Uh8XysUwBmVSrXe92W1R7b6k97Za1C
 1CXlFiyofIeMw1Xu8uL38AzhkKL1DPVDlapdESRsHP0Oo+gsxx/J/fU5bkKfl2w37Kk5
 R/Ij0OLkqBVnu9lbCq9ix8ykKxNtTirJVLgLpPmx1M0hJNdUwbI/JJ4w2udZ9a2XfuGp
 VNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690983318; x=1691588118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cIdVDpJXzS+NvG6cPE69v+Vo8D8lHdK5ntY+IO2Phoo=;
 b=hIpMh7VT2Ex1HQchGIMcnQfGUvuC9eoFHGr9Yczxt8+qJxwVQcwThBGVRShk1VcsPh
 i7za41F+8ZtVVEkyogUhGENARHM3LKVWkDMMhhUiG+K/S37KaNClhcI+wm30/TsJgVit
 L+gLNBoahSrBWvjShq9YWnkzmHJIPPvFvjcpab6JbGcHOaditWrNtcAb20zESFi27+IN
 P15JveW+d+b2VHB08KysdK7fT2014KFXF4GHgRXmykKuv+isiBzPYua1NDwPrkMs5x7p
 BtI+15TVpzCkmkZs1aBLMdlJ3RIBVj4DJx1zs3+bjQfR0OLA0BRfNbC16uqy2jNc/wu7
 XQEQ==
X-Gm-Message-State: ABy/qLaDV8Miq9M85Zy3J2FE823GRsxHo1lNaFFJ/5yKsucRz2ppsETo
 agRDjdSLZLYMY2kfT4wn1y8=
X-Google-Smtp-Source: APBJJlEHTtK/CnKxbSzEwYziNluvzwpl4TyauHGwMYXt4Y6XTzcawP+k/3a8BYfEbHGb3QZCY1jRUg==
X-Received: by 2002:a19:501a:0:b0:4fe:2f8a:457e with SMTP id
 e26-20020a19501a000000b004fe2f8a457emr4109315lfb.43.1690983317800; 
 Wed, 02 Aug 2023 06:35:17 -0700 (PDT)
Received: from localhost.localdomain ([78.97.234.98])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa7d68f000000b00522594a614fsm8547719edr.13.2023.08.02.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 06:35:17 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org
Date: Wed,  2 Aug 2023 16:35:09 +0300
Message-Id: <20230802133509.29381-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Aug 2023 15:58:01 +0000
Cc: lars@metafoo.de, Andrei Coardos <aboutphysycs@gmail.com>,
 mcoquelin.stm32@gmail.com, Alexandru Ardelean <alex@shruggie.ro>,
 jic23@kernel.org
Subject: [Linux-stm32] [PATCH v2] iio: trigger: stm32-lptimer-trigger:
	remove unneeded platform_set_drvdata()
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---

Changelog V1->V2:

* https://lore.kernel.org/linux-iio/CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com/T/#t
* Adjusted the returning values of the function


 drivers/iio/trigger/stm32-lptimer-trigger.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
index df2416e33375..ab1cc6a05f26 100644
--- a/drivers/iio/trigger/stm32-lptimer-trigger.c
+++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
@@ -88,11 +88,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 	priv->trg = stm32_lptim_triggers[index];
 
-	ret = stm32_lptim_setup_trig(priv);
-	if (ret)
-		return ret;
-
-	return 0;
+	return stm32_lptim_setup_trig(priv);
 }
 
 static const struct of_device_id stm32_lptim_trig_of_match[] = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
