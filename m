Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790888CE4E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23393C71288;
	Tue, 26 Mar 2024 20:24:29 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D495C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:27 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a4734ae95b3so593855866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484666; x=1712089466;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FuVDaEvr2c6AAkjEaLK4iGtTvSGvFSYUkhrUiINQHVM=;
 b=YR3hdpZuP2oBev8UJVq8mEuBQ7PaYsJRMVd7GgPlkd6mnx9gNu/46As9tV2DsRoLCK
 XuzOIAnHbdU+Y//ywEh7PIy0VAdHLG2MAvvkRi3540xdeToB5v6XykCO0hLHrZ6bzRk+
 WJgzGd33pivufk/H0/7YNI2u+KiSTZadmUolbufeDzZVAUudgKaMXvRXuXuVil8e36RK
 EWC6BG3OrIkAU12HuNDdzOSiiCCQ6tranm8/loOUZVzY/ZpWFvTPLzR9OYp5wbpUEEP4
 mZklqT68xrS++FMQhwe2tDekaS58CwgH1s46s/1lki6DPJ712zgCGE48/0FYZJR2srmo
 HP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484666; x=1712089466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FuVDaEvr2c6AAkjEaLK4iGtTvSGvFSYUkhrUiINQHVM=;
 b=NIByozlkuFH7HrNkoNzht8IyXooaUhSkoTT83TiZ9YoOQtNm5Ty0Q/yZ2uX5nWAKG3
 FrT7SeXRSp2pJfzfB1heGXoFq5W8j2jLuK8zQv/N9XOV9ieFPI++osh5CdkGiHlh7wHC
 lr8TIAWzN2gwk2T5KWUGEuz3sqsUn0ebHUvNHovcnvfXAxUSZB+fDQU/4IkB/fU/B7aF
 lB6Fywm2/Ae/lk8dsLOLpXMmZLN6mdjqEN1+ksgM42GKm7yOCYACa57b35adVBePTMnt
 TntJzu+iWMF0oMVGXGH1VeedwlhRIlBo9l8tug2FOLNALQslm2bF5QgA/lNoXXOemVoS
 MzWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK3UwKgsYw4ht7TmxowXetHYpy+viECd3TEq1NlxHBkpjh7VygSimoh0Wes+d318wNS3gw/MFxJTT8M6vN4fR2fs7eCMjG9tN/puqRa/+a1bNaCQrQLebn
X-Gm-Message-State: AOJu0Yz6wl3w/GFv54iceiTwDFqiuNS6N8GuAMLfrSddBKTSlY2sd27T
 L5N+Z/FLJBPlPF3lGoOjXk8dQIkLPCGSBlICyxVIMQbk8Sft2xJS0ixNn++j/Gk=
X-Google-Smtp-Source: AGHT+IFHSER7YzYA9YStVg65zDciiNiGG7ueOSBINzUVaXu+ywI3HbB5wXjAk97hfb/FMIFSp663HA==
X-Received: by 2002:a17:907:86aa:b0:a4e:29d:c2cf with SMTP id
 qa42-20020a17090786aa00b00a4e029dc2cfmr30978ejc.29.1711484666718; 
 Tue, 26 Mar 2024 13:24:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:43 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-13-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mzW83dKAeopOAlsaYSxUYRMWGIcV+pi1cfkK7J9iXH4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7WRhiBye4JPUDUabGW8d0YAo6h+snTYUYAO
 26UykPuFNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu1gAKCRDBN2bmhouD
 1yYjD/917HcS9h6P/anThHL1FhBJ6kR70Zqgi1NnZ/bUfxBkPtJjBAzS10+Phk7non4SmlFqodt
 ihWJzYjc8YDq/aARsJQDj/+4lkfPXoVcGOKaOr+io+biWFplarvo/LK1yWWgZENgcdNN0EeroN6
 agwwrSsX/qVKx3oVPx16kewExZzKKulFeio6Y9XJVfeNTOwJKpN0bgPT68hbtJ3lhb1meCz+uad
 qlgeu2stSdNg4qVFudy+ATp1ZdE3RloRzX1vg3rWgdE0tOV2ozr6cO/mzxuh/MDyJHAcAH5nHEe
 vSrVtFwPTQiyei7G7BmxQHcQInKudMTbbINpGY1FVZ2sgHlcmw+nmjcJHz4dosl+EmZn+m8Dstx
 DWYAKPNKL35sqjp5bXeoXYb+H1NTG0WICUqg271lqp9CwXvH2gQVkKw261M/xulaHWZMfajrKcb
 8EfddeWzVm5nNiRajXmiJ+zzA6xuxKUio9etRkwQAngG3UqFWo5raKYiRQIV/X4NwvPVbbT0eAu
 ZQJLTR0MhpSq0QBYZtXDpyOEPIi0T2IVanll6fix2jcGp/u4qjob/k8k1I/u8BlS5MfGwmlso4h
 8+c9SDFTcHyEGw8WH4UyRr91D7iZc1XHRcGmhZl9MnbR/Ca9GbU/Dy9AExmIFXnSJJTeTao9uVn
 g57cf3JmUqoNXCQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 13/19] coresight: tpiu: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpiu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 29024f880fda..7dc9ea564bca 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -236,7 +236,6 @@ MODULE_DEVICE_TABLE(amba, tpiu_ids);
 static struct amba_driver tpiu_driver = {
 	.drv = {
 		.name	= "coresight-tpiu",
-		.owner	= THIS_MODULE,
 		.pm	= &tpiu_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
