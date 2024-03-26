Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B606788CE3A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F28C6DD96;
	Tue, 26 Mar 2024 20:24:03 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A71C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:01 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso716433566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484641; x=1712089441;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rzOtSbwk5HJ+2n5ZSOsaMRKkDMm+dhZPpBfR72UdRjo=;
 b=iTcKPcLwqRhfOIOJQ6vCtMLLvAoc3G+wu5ftaQo7SMRa0MLHa8O0rcLCRQnFXWvdAW
 P0rkkqLRVb7re55byvMehJ30tZPjSR7E65ygGfQTrwevthN63b6Wz1HfwOy12aUafiDJ
 6th0l3f0Lwbt8RTRAbyH4mAK8egYYdt5F25x/HHb/IlT0pr7EOPsUVP+NLAzEomuG0CB
 MaRHqbIq2hKHn9xEe3bAnxKNRuThbP84ALTMUtcPefIwWLPlRMYQBguUvtzi88QZuPnr
 mccULLZxVWdMpnyBr8cPLkPGmI30owwPfxES9eAEd8CXiViNC2cgJneUMdB31dAjqxUD
 IwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484641; x=1712089441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzOtSbwk5HJ+2n5ZSOsaMRKkDMm+dhZPpBfR72UdRjo=;
 b=o5II1D1zVB6sOohLE90tAPNrypZDCtVM+y0k9/RdzxdLN0O1KBB8mYMvl9b2yFFWMo
 jqcX38TkyK75/gGV7iRHjKtYgy8wcyA/2PHQf9OTL3/D8WPkKCTPeWXXbR/A0cJiMeMg
 Q1yCyfbVrW0mYndVJwvbEcL2McaFccDzcYTGqKY38lfVGDe1SsKiNjyUGezcRYDiOABB
 0SHi5faEjwG6AQeeif5nXnrU7VKNfeSbhplNqvFKLjsGwM2CdjTkz1K0T7NPX0ZaJljQ
 T/W8qnc9aSlvp4lWPcf5YB+QEZ0fCWBtG4mVK3TvcgzvrZq6BrFIwq8NiVC0XDzISOAE
 99vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBjlUTvSNLJ72FtFJNQhTnhuY6dKUEWSpui+8Er7w8+4pDZDnq/50T+4n3ttxlCBNoRP7GOoQ8LPI5c7zvb1XMpsQI/M6HTX6w2ijy6IDYqIjKD29LLaes
X-Gm-Message-State: AOJu0YyY/HaNoBsHBUAjwmZEq8TM7k+94/j78ubx5lHs/HJ2xyMONW5Z
 DCcUAp8ygEdeEBy6RILHzwd2Tmi3eYx6URApk7+Pn5UHvLiUUqNudYSasnKnmA8=
X-Google-Smtp-Source: AGHT+IHfUSgEMWZC88gEg7F4GxZ/oDXrRdeKiGsGX2j66fElfR1zUubE+AJU7degaWuoIw5rscdz0Q==
X-Received: by 2002:a17:907:9958:b0:a46:7794:2c00 with SMTP id
 kl24-20020a170907995800b00a4677942c00mr7550207ejc.40.1711484641253; 
 Tue, 26 Mar 2024 13:24:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:31 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Z0l0OnzgFtpbmIReqfYeehApq3f4h0o4aClKc0Rot+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7MRPDu5a+3xwWGiZHE1/r7AY6a/x3KWTzHp
 77I8uZh33qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuzAAKCRDBN2bmhouD
 1yOyEACSnqUPFtIIdUyjMgTJS4Qmh0Be5ij4MNrmGJi0DcwMoT/FYoqXDwowpxlx8KaNnjkytMS
 g87s0XhMJrEHtMgWgKsIHNH4CR36WyN/wPZWxgZBQUNFMGEWA4SRWXI6ciqjqFDdtyOcOiiNDOB
 fjlML1z9zLk3ZgS69LBDozVDoKYqATgEivZnXVpH+fYyZH+dwGJ+wIWFDHNlD+D5ESopGYbvVrI
 acagfRKmUyn32IZtpsKAzxWP0N0jyuxvy3o/gzmIJODgXUbai5pWZ9SvmdjW6mwJQhZNLP0wEAl
 FeGgVZHmuZxZx7b50T5L9HutnGId15TIfFk2kigt9tvxzJbK9faRqNrd3xPSO1StxHVdgGUJdhH
 7qBOhl3cKy8P6d8w/bhMwsG2qPnSlPtB5xqq1/bP2I/XoYMc/on3ySbT/UAXPZoN3sy7RHJf4Dw
 uDA4cdhkQv/dmkCXI5FKEnH9QGC67ZRvyiDn5rMeab2wksV+iRV6DQFivjvzwDjyaLWH5tj9mGI
 bYUhU4iOTf16YgQ+zkq2tJPAugQ4AnoGofp7J62i2Ixb7zMMsLRSul6x9/MJ72BHumZ2WNFG/yR
 1b32qFSAKFBJxacXSMluhq8gmBg0FrD5qiNxFc1KPUJsvZxf8X0Yd72wwm0dvcV2BerN8HUJRxj
 PN3v05nOHA22Kyg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 01/19] amba: store owner from modules with
 amba_driver_register()
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

Modules registering driver with amba_driver_register() often forget to
set .owner field.  The field is used by some of other kernel parts for
reference counting (try_module_get()), so it is expected that drivers
will set it.

Solve the problem by moving this task away from the drivers to the core
amba bus code, just like we did for platform_driver in
commit 9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/amba/bus.c       | 11 +++++++----
 include/linux/amba/bus.h | 11 +++++++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index a24c152bfaac..aba3aa95b224 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -488,28 +488,31 @@ static int __init amba_stub_drv_init(void)
 	 * waiting on amba_match(). So, register a stub driver to make sure
 	 * amba_match() is called even if no amba driver has been registered.
 	 */
-	return amba_driver_register(&amba_proxy_drv);
+	return __amba_driver_register(&amba_proxy_drv, NULL);
 }
 late_initcall_sync(amba_stub_drv_init);
 
 /**
- *	amba_driver_register - register an AMBA device driver
+ *	__amba_driver_register - register an AMBA device driver
  *	@drv: amba device driver structure
+ *	@owner: owning module/driver
  *
  *	Register an AMBA device driver with the Linux device model
  *	core.  If devices pre-exist, the drivers probe function will
  *	be called.
  */
-int amba_driver_register(struct amba_driver *drv)
+int __amba_driver_register(struct amba_driver *drv,
+			   struct module *owner)
 {
 	if (!drv->probe)
 		return -EINVAL;
 
+	drv->drv.owner = owner;
 	drv->drv.bus = &amba_bustype;
 
 	return driver_register(&drv->drv);
 }
-EXPORT_SYMBOL(amba_driver_register);
+EXPORT_SYMBOL(__amba_driver_register);
 
 /**
  *	amba_driver_unregister - remove an AMBA device driver
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index c60a6a14638c..958a55bcc708 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -112,11 +112,18 @@ extern struct bus_type amba_bustype;
 #define amba_get_drvdata(d)	dev_get_drvdata(&d->dev)
 #define amba_set_drvdata(d,p)	dev_set_drvdata(&d->dev, p)
 
+/*
+ * use a macro to avoid include chaining to get THIS_MODULE
+ */
+#define amba_driver_register(drv) \
+	__amba_driver_register(drv, THIS_MODULE)
+
 #ifdef CONFIG_ARM_AMBA
-int amba_driver_register(struct amba_driver *);
+int __amba_driver_register(struct amba_driver *, struct module *);
 void amba_driver_unregister(struct amba_driver *);
 #else
-static inline int amba_driver_register(struct amba_driver *drv)
+static inline int __amba_driver_register(struct amba_driver *drv,
+					 struct module *owner)
 {
 	return -EINVAL;
 }

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
