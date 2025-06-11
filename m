Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5CBAD4AE5
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:14:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 119DBC32EB5;
	Wed, 11 Jun 2025 06:14:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ACB8C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:14:23 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45306433f71so247175e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622463; x=1750227263;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
 b=h1WuMM+v6TIbHzPibpYj3P4aXv5DoECZUaNG6DEvoVHppMkMOd9hAEp+xh+rIWtwEN
 LNHOriQ1eCdTDn3HhnjITZ9DTATJw6hsc2i97+3YTuwTKmrW5oLJ6GBiMdZQvlEWOqC2
 jMJsuTHPdc7tY3fXghlQGqKqJKk2Sc6bPBV3h2qQZxIlaWrQsQble/n3B6iHnWFDAen5
 pxarxQTDux5uzDSkiSlnkMDx9nUBZPDcFwsQX5KgyeUYH+GOOKaDBy4yYaqcO+CgQ5B6
 ahzMnIw5TAXZ+PWTnEe1zHcfol+dvkhBnIjkDe1WF9o3Dot/v1p8b783NKX+cs3NQ8ig
 ydyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622463; x=1750227263;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecu8yupT+rCBH08RZ8e0dqpuzlN5xMN0SV7HkCMJ9k8=;
 b=IhO3kOd5DdK9aeDEjqKCUQM4qzNSNu0CfY0hzfPX4+kG09GPPD9sCh2YPU9iMNrYqJ
 mMn6Xr3EQ26xrMIwQPfni+braXdMGjPB68OTKnA0Vtp7YyxhXJWUcGwx+N0LL4QF6XKX
 hnT/JatEv6Am3K6+Q0dT87y7lKzF7MaQjr2qTUqBh9rVgdppa9coE7Unl8iGumOjbtPg
 HDN7+Pd/OaS4TBnSaACWKPxOnacKKTtXGCGbl1jc5S/Y3bO+lX+GpkOjlXpBUVp0vyR3
 E7T85X6qc0KjY+6xVi1LS/eHuijyZc1WGGdeWtCIdQNivCI1+kCw5csd2ZQORPDVZteE
 PJoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpjCbvQrCERjbjaH8L/g2rGWKlyIPuCbw/x5nDvlv2Ch27085eKzHjTMNsk7mFzUW3Z37ZVjIKHmCvrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVpuhPcje7IpqL41XQ3Wjd4MDRPOT+g1G+DF3gAZXCLTFTqJ4Y
 hVAQ+59QZ7VIJ5WFssPiIkF4Ii+n1tgKQo9/BsKQGRq+MyB67wZGoElWdDzZpt8o34E=
X-Gm-Gg: ASbGncu/Z15Tn62sp5ok/oxD7qfG+MgtF7p0L0ZAJTGTsZKXh4umdwL0E5vabONnvVW
 ZrG3zychZBmFXw3vXzd1ZqGWgKeeUS0KRUPQ9vflNtqt/uKlw1xRE4eT+nrIGEdPFKO8i7cqyJO
 MhDk/p/hIzANDPs+VTJZ+GwTCGdMjTfoLUbajUlBmBpnRfDVUOJtcOYDh0ZZO3OFFEMuJ3ppcL3
 /qlA1da9Z+rN/wmVAHsdu2T6YyxJCvwFj15ovlv0ITTQzf3UteepvuhBCpE79zBY40o9bBUv3TX
 EgnMEwlec43Wgs9tVFzRKg4fWJIvhOn26vGYyenAe/pTzDKx82s26ZMkIJkVGQuX3mBIwRyEvd/
 XbO1FP0Y=
X-Google-Smtp-Source: AGHT+IFfJgestylyWWTFhvNWZXRgEjP+auivw4jI2Dh1LfZu2fjTV+4EOE/BFvcRpTxAjjUQnLhlFQ==
X-Received: by 2002:a05:6000:2088:b0:3a4:d4a0:1315 with SMTP id
 ffacd0b85a97d-3a5586c59cfmr506452f8f.6.1749622462916; 
 Tue, 10 Jun 2025 23:14:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:14:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:36 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-4-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nR+2FS8PYTwR5NQQoTqx9iHRdQvo+vV4Iua6AqxT5Nc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6ikhHWTfLaUx53ErHmCNvMDtuwZ6lVKR4RR
 0yG94URNwGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeogAKCRDBN2bmhouD
 13d1D/0cTiL0nPIVc59aoSJVwhVV3NR69H2ygZw5k+q2RV7dSayB/i8dGfZgnZHJiG21q1xVLex
 vusrPMcisMsjokc7a7W0t0dTxxM8FS11ivjQfeWUutmL7xCo9FjTJC35TamPh/eTK3IbJyVpVEv
 DQ42DQ7ogisRRN8V0a7C5F62h9jU8rsNRdRWMfEAVoIWlaRQKdFms4jjazFWDVtLpIWq8WRZq9L
 gF5gELsOUj8CT8CYb8R+FoPrSvCtU+A4O4EXwm5TdHORWpbU95IfR20Av1HUyK7tad6COn3Jmwi
 3Qq8ZVpD0rdjEmlLZ+HIwdVO/CBSMjGTkQCcycSK4I47cc22MDLVQdsTesZpi6d1xdninpaaX7L
 PoOfudghYpHzaziiwHv7cgMyr7WARCnREfTLLqOYjgxbklA7EvXpIkQ9VmFmEedee/wp3Mq6sTT
 kyIhkCXj/eanf82v/IOnh9Fp6IThWVBU6RGuCWS0bepidD+XYDMj01M4a6petC2k2iNg8q331wq
 U0NPQBNuLmfidJTf/A0acOYAvSw33H2S1crIvjNMY3KJ4kfiWeNpLYeFPaCebi0ig6NZxukpRa1
 RiMOrWRAyJmV2ZuPSLFvbxxocjhYKp3U4q+/f5tMjHmqP5tB0i3qvrjO7khJC5XWUoZllIcX3lX
 wmRssquEAgIJxkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/17] pinctrl: Constify pointers to
	'pinctrl_desc'
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

Pin controller core code only stores the pointer to
'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
be changed to pointer to const which makes the code safer, explicit and
later allows constifying 'pinctrl_desc' allocations in individual
drivers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

This is the pre-requisite patch for all further patches.
---
 drivers/pinctrl/core.c          | 13 +++++++------
 drivers/pinctrl/core.h          |  2 +-
 include/linux/pinctrl/pinctrl.h |  8 ++++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9046292d1360218bc70eff418fb8d1028c22b11a..73b78d6eac672095c8556763af1744be6f558501 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2062,7 +2062,7 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
  * @driver_data: private pin controller data for this pin controller
  */
 static struct pinctrl_dev *
-pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
+pinctrl_init_controller(const struct pinctrl_desc *pctldesc, struct device *dev,
 			void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2132,7 +2132,8 @@ pinctrl_init_controller(struct pinctrl_desc *pctldesc, struct device *dev,
 	return ERR_PTR(ret);
 }
 
-static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev, struct pinctrl_desc *pctldesc)
+static void pinctrl_uninit_controller(struct pinctrl_dev *pctldev,
+				      const struct pinctrl_desc *pctldesc)
 {
 	pinctrl_free_pindescs(pctldev, pctldesc->pins,
 			      pctldesc->npins);
@@ -2209,7 +2210,7 @@ EXPORT_SYMBOL_GPL(pinctrl_enable);
  * struct pinctrl_dev handle. To avoid issues later on, please use the
  * new pinctrl_register_and_init() below instead.
  */
-struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				    struct device *dev, void *driver_data)
 {
 	struct pinctrl_dev *pctldev;
@@ -2239,7 +2240,7 @@ EXPORT_SYMBOL_GPL(pinctrl_register);
  * Note that pinctrl_enable() still needs to be manually called after
  * this once the driver is ready.
  */
-int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 			      struct device *dev, void *driver_data,
 			      struct pinctrl_dev **pctldev)
 {
@@ -2330,7 +2331,7 @@ static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
  * The pinctrl device will be automatically released when the device is unbound.
  */
 struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-					  struct pinctrl_desc *pctldesc,
+					  const struct pinctrl_desc *pctldesc,
 					  void *driver_data)
 {
 	struct pinctrl_dev **ptr, *pctldev;
@@ -2364,7 +2365,7 @@ EXPORT_SYMBOL_GPL(devm_pinctrl_register);
  * The pinctrl device will be automatically released when the device is unbound.
  */
 int devm_pinctrl_register_and_init(struct device *dev,
-				   struct pinctrl_desc *pctldesc,
+				   const struct pinctrl_desc *pctldesc,
 				   void *driver_data,
 				   struct pinctrl_dev **pctldev)
 {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index d6c24978e7081a663b8a0fa6cb9314670575b1bc..fc513a9cdd4f2f9dd4ec4a088eee53fdbd673285 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -51,7 +51,7 @@ struct pinctrl_state;
  */
 struct pinctrl_dev {
 	struct list_head node;
-	struct pinctrl_desc *desc;
+	const struct pinctrl_desc *desc;
 	struct radix_tree_root pin_desc_tree;
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 	struct radix_tree_root pin_group_tree;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 9a8189ffd0f2c28c88640280deee194d17d18400..d138e18156452e008f24ca06358fcab45135632f 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -165,25 +165,25 @@ struct pinctrl_desc {
 
 /* External interface to pin controller */
 
-extern int pinctrl_register_and_init(struct pinctrl_desc *pctldesc,
+extern int pinctrl_register_and_init(const struct pinctrl_desc *pctldesc,
 				     struct device *dev, void *driver_data,
 				     struct pinctrl_dev **pctldev);
 extern int pinctrl_enable(struct pinctrl_dev *pctldev);
 
 /* Please use pinctrl_register_and_init() and pinctrl_enable() instead */
-extern struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
+extern struct pinctrl_dev *pinctrl_register(const struct pinctrl_desc *pctldesc,
 				struct device *dev, void *driver_data);
 
 extern void pinctrl_unregister(struct pinctrl_dev *pctldev);
 
 extern int devm_pinctrl_register_and_init(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data,
 				struct pinctrl_dev **pctldev);
 
 /* Please use devm_pinctrl_register_and_init() instead */
 extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
-				struct pinctrl_desc *pctldesc,
+				const struct pinctrl_desc *pctldesc,
 				void *driver_data);
 
 extern void devm_pinctrl_unregister(struct device *dev,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
