Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC5AE7F6E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:33:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCCAC3087B;
	Wed, 25 Jun 2025 10:33:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8B83C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:33:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso5433715e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847622; x=1751452422;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
 b=VJWfnlEZXRRxK6bnYz9mNXXDeRtcQA2PQnxZ4Ht1I3dkEQuuyU9sWF6O8jujXM6sGe
 YRD/Nc5rAOf4klzOe9cJZaQZ0qgHzNLahDpsrLVqdNiT80sCDWLWoozXhCzue0WASUNC
 KsPFkCKK1RrqERdLEQje/x9tBHE9lScoCOBRPidD1EDPL+dTFcHA3RgJN5HUYZSGxxNL
 jkXbyXgJCUoEJBr/nkHuOWAK6efcYUIoQaUoojodpjboRDD87jev9y1WTIzC7KRN86cJ
 nsTFEhkJQPAjz5GXbvkQdaeNavGu5fDX2YE8TIRWH1lM6YVtkYmrJAfjttH+WzVymDKs
 +8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847622; x=1751452422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fds2MhNytSCnzKU0jjInhjpfsALDR8PAilLtpJ78pio=;
 b=hD7ReH/ZeTKGz2rX7Z6hVvq2F77nkgafAIuuItw0VWklHBiIa088rNQ04yysnrm8/k
 +ZDjfTx2T3YyvVclbOWWrS/p4jPrBHCEOE0rcFiPVLiKzLREfItSyGe/iBv0sYEhedz3
 TPFUB4Fi/wLjGsf2c6wab/m2DjfXCBDvIyI9XTerzZ/4/JlyAx7FHCXf3C/n/Q2P6v6+
 acrPfbf/OunOTLVj0CESMjnlGKJNMTfOpnKx+1xahycWyHSEzTxNBmVZOS3t/9MF1Bdv
 icr0hlZo0WPxjr2GgoSm60WCpBsKhZIYX+H8eWb1TnYnZy9w+YDMrg+QegNJ6ptzdeZY
 gzZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtk1qfU/IWAEJitIrnnLoQGYmqyZwV9GJzjqeELMgmlAyL/avgZzxc/z/rb3ZNmZJnO3PVUTNflGXuw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5f7visrSYLK7mLP7ay1MB9e+vC3snL4ppeMSvJZyrJko64q0E
 MG/hUc9yZxUGZUfJ6QLzv+lxKqCdXXOOusCN10Xzrh36nlPFgqEOqjzqGhfZkVesGK8=
X-Gm-Gg: ASbGnct/C17su3tF3w/KGpzaHrXGFtXGE2bKmCt0mfczcjrWf+YcL2IV7ieZDqhQelr
 VorGSLqZfGsOFwm7igyQJ2+QuZKMUmyNtlfa4x9lcoELm8eKPNSomtULGKlgm34VVOMY64rjWvZ
 CzpAoCOyLGdJK+ydQQ5rMukg9pkUr0REVqCRA/HBbJWVG+tCoLOFceLoDw4z8Fpldu3vZV6a2PI
 Xc3gET+ugJ9Vtq0uEsKfNtUuhMUZ3PU0cDe3r85evL/AK41AvbnlU0fL2UxgoeRQ19TVR/QYGnC
 to13x0u06mFcCQMPxMu4mK0p2369aQ0uI88IvBi1s2DFLPxbCOqI8Neo
X-Google-Smtp-Source: AGHT+IEB1bVGz7jSwt+k7RvQZQqq75gx1fKExWgNrY0BLqhaHS3PlIlRuoRf4PgDZVjFqYg82xBLcg==
X-Received: by 2002:a05:600c:3b22:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-45381aaf86amr22139135e9.7.1750847622277; 
 Wed, 25 Jun 2025 03:33:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 03:33:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:26 +0200
MIME-Version: 1.0
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-3-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=20ZB+p91W6AfddlrDokTU/tosMerfgooAW4ezeKuNp8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B+lAJkN7YZV3SHnrEA4WiRFC3HboXlPuB0c
 SAVrMYCTUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfgAKCRARpy6gFHHX
 cjpIEADH4hG5lCY0NvrLOQRwNpAisiacV4oow9swqvnZ0QQ+EIPY/iPgJ79MDLQsc360Yyjf2VP
 pMSesR959pD69DRYDL9pgyWkzI2Y6hbZGuSCWrpj2tJBvkg3shRC0HY3f9ljTAoXb6tI/6RlqXF
 EjP93T8flceHpQNlgbcDnp4AaTQZ44/woZVIVN9ysdatwAZBj3KBJKVlrwfFhAgvwcNTuYrtyYA
 Sdbq9REuMsneZMleAT7M2kT3ApJ6SNwnBaDL1RSTgWYY4IifB5lLMi45T8VFFBD9Jix4s9BKpfs
 znIXj0AsnGPpCUD1Bw+SgThvSu4JrBwe0GMYCGYWveGGx3EKSzE6RA9tSZJUtXU8WYK0wSIjbFe
 tdke11pUAIH8ejvEZQF+hDEaMO40lBLlI0XsBwXqGmDdjw9pmT8sGpzfxafxLLIHLdwGoBblGeI
 eldYCbtvZK+0WqYln1XRUAFItEiuW3YDTVneQ+rF+SUguZBdPZY6y94ABnxWjEyZZNWaTvk22Ho
 gFLWeaiHMBwGuvJFUsaVzFIo720p4+YVtajCYePpl+0hO6NxwpVyeeKjoWAXZTixsyeLCFPKEF8
 4NPYbZvIQEC3yJVwhXQOQVt0JiSHb1YvcC4IzUGwzsjxcHMB0+ech5K0UC62OdKnCdW/lxCyp0B
 hJ4tw3aa8/cNsSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/12] gpio: sch: use new GPIO line value
	setter callbacks
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index ff0341b1222f7ec2ea0df56b004222946d2418c4..833ffdd98d744948cddc32fd8039a9489a654ab4 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -117,7 +117,7 @@ static int sch_gpio_get(struct gpio_chip *gc, unsigned int gpio_num)
 	return sch_gpio_reg_get(sch, gpio_num, GLV);
 }
 
-static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
+static int sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 {
 	struct sch_gpio *sch = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -125,6 +125,8 @@ static void sch_gpio_set(struct gpio_chip *gc, unsigned int gpio_num, int val)
 	spin_lock_irqsave(&sch->lock, flags);
 	sch_gpio_reg_set(sch, gpio_num, GLV, val);
 	spin_unlock_irqrestore(&sch->lock, flags);
+
+	return 0;
 }
 
 static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
@@ -146,8 +148,7 @@ static int sch_gpio_direction_out(struct gpio_chip *gc, unsigned int gpio_num,
 	 * But we cannot prevent a short low pulse if direction is set to high
 	 * and an external pull-up is connected.
 	 */
-	sch_gpio_set(gc, gpio_num, val);
-	return 0;
+	return sch_gpio_set(gc, gpio_num, val);
 }
 
 static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio_num)
@@ -166,7 +167,7 @@ static const struct gpio_chip sch_gpio_chip = {
 	.direction_input	= sch_gpio_direction_in,
 	.get			= sch_gpio_get,
 	.direction_output	= sch_gpio_direction_out,
-	.set			= sch_gpio_set,
+	.set_rv			= sch_gpio_set,
 	.get_direction		= sch_gpio_get_direction,
 };
 

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
