Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001488CE45
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83D9C71289;
	Tue, 26 Mar 2024 20:24:18 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8B4AC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:16 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d485886545so104766161fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484656; x=1712089456;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HACANyvTKUa2F7OFT3YqMnbFiK8dE6yzsz6U8915HRw=;
 b=OM2QZef811YCTOVhdnNBMys7+1bnEz5CXE4+xJ3nEw0hbJGn4nxPuY+iOHDMMKU4wy
 l/Ca0+iQvBtNMEF8pmQWHPX3NkSPncDwVEOSd8ZtbUKjLLC7M9uTsHubKINvUgHJBIZD
 k5XVvL0ab4qVQcyjR+c/b1znT1kPSRZImlduA0Gfc7VDsbM9HRzRuSC2+hbVcD0mRQCC
 elo3es9idZc0/ittl3YQlgRgAm40JBGwKowKhz4f/GP5P6UYn9QmUnEaZcgU7vuZm43Z
 C0sjbiYVKB/8UTkn1OdhJ3C6IzV+O4fwpsaPQhaq2PxlQqxNAZTaUuXWoFeSSl6HjtXc
 oDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484656; x=1712089456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HACANyvTKUa2F7OFT3YqMnbFiK8dE6yzsz6U8915HRw=;
 b=dAYVB4dcvFU4r9BTrWZALJzDdz//0zQPtOs552izBJVPHKkTzM1UCZ8F9oP+kerENH
 mjZLOkFRu5CvVw88Gu/NJIV90bUfLsC8G5Ea+HujS6lGFEOFNB3US5L7zhnYVIDZxEBA
 yIRusJoSVL6FBnfiu9mio6bfNdytmsPz57KhqRefyfiMwg0coEiaxLOkMxzekFQ4QSSK
 bq25sXGx+wAUPRE3vt42F5ak/8ha9LRsr5Yrmqq4O5XSAoSMRZiQQpSjEz7zX9Qrtkur
 qANIVc+V8dE2fIQyqP79fHh/w2NO9bTAh+xUDSETM2IIsWvNpvgOLoZej/tDLtFV/177
 X3Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAHOIq0ciid+geK4ZM/ZjlFcIq32kSH5Vb21kZd9CRsW/4IZG/QjeHv+2ky/GcS/ZQEC3YGxdY9nayQi501WZG1RjLL+YfSBDvBGBPTC5qlZFmQRDp2/QT
X-Gm-Message-State: AOJu0Yw0icJtGHNmZnkjxLWaAuzmgsFptP5o9YOxoHnKHbpc/K/0btRj
 OAb4PltZhyedQjN0WSbrSRCeyCK5HemG/HfDCg2jXbqBdKlPnHqO/jeZtoC+Afk=
X-Google-Smtp-Source: AGHT+IF9pUMO5M3/G0TGt/BcN+vt86zQwEQP4of6OmbIqz+WBaFAHT+Lq8Y8KdBG7dtyVu7UH7lCUQ==
X-Received: by 2002:a05:6512:2012:b0:513:bf8a:bd2e with SMTP id
 a18-20020a056512201200b00513bf8abd2emr604675lfb.17.1711484656259; 
 Tue, 26 Mar 2024 13:24:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:38 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-8-4517b091385b@linaro.org>
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
 bh=wYJl4vhVWtWOdD3Sbdos0pesavVG40uaiKbFBYn+928=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7SkWq5sAlGgTyUPiqGzsh+Q+oXWdA1MnZYA
 IUmYXEOH1OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0gAKCRDBN2bmhouD
 1+HOEACAmSAmkE3a3j67RICYun3nSNDCQ2Ctd3yWPnpTaNzh2D4VErkXht9CBOYh9XcE8TJP8sb
 iWjQjj0Zuc7MUFhPyWSUo6R9q7YIKGdhlN4h+PraouDOic+ib3iU0a+YKc/+H0f38cTpKLExdyE
 DYrkcd/8n71Zn02XP6WPM6HS8CUbKj9syRY7iOXPsRKUEacQ7Prj/fRtfEU9mKaDQ5V2CBymmvl
 APTMp2voCMq+0E1VmmE26uY+0SrK8PYPe/iiWHZAc8EkX1Uqz9/HxaVEGv8Zco9qI/IFj5jqCd/
 78P2ufBMMwjrgwFmTYedxZPNIgwfNu3c6sXH+M0V30qWivJW/xEtQmcTA66xjyLpaI2JqPRCzQ0
 t7bPzGh/e47T3pLALRDnTfd87Rq5h9Iei/E4EGQvlCmdN7Muo+Qj1xM0GXUJW6vmiT0dCBZmEUE
 5HOpQcQxD5WVVrXf1M4u6fVE75dlWRG0wR09TIEqoVOmNZqpGBExHxOERcUA7ZUyaFXj1ZVr4/G
 fqxDm1AF8P9ToGvKeuujU+nwaiO+xutHyuxDvIMg7G3tKlTNZZoXIG/fJGI/tE3jGDy+Tw3GNVh
 yJZy0bXGOzbsbOszryV3haor8aXc8XJML+xeVHwJlq1FbN53kUCCg1mlQoB6I7n+IexGHMGQMMN
 8jI6ABMDvFg0I+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 08/19] coresight: etb10: drop owner assignment
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
 drivers/hwtracing/coresight/coresight-etb10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 3aab182b562f..7edd3f1d0d46 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -844,7 +844,6 @@ MODULE_DEVICE_TABLE(amba, etb_ids);
 static struct amba_driver etb_driver = {
 	.drv = {
 		.name	= "coresight-etb10",
-		.owner	= THIS_MODULE,
 		.pm	= &etb_dev_pm_ops,
 		.suppress_bind_attrs = true,
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
