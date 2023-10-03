Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED227B6C76
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8AA5C6C830;
	Tue,  3 Oct 2023 14:54:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DCE2C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 14:51:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-406589e5765so10046935e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344707; x=1696949507;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j3W5gbiwB/5gwTM96ugP2be7g+wEOoUYMu+wXUrQYg=;
 b=0DkAtpvqayme01dP/m/48OTLNzbhQR1BBiGJz3ScbcrPwdXLELOY8H1KjVAYqIYJne
 6ALo5DnzVhUJzcJIIp01Rhmvx594HZ0Zi1blc0bsnQrsX+WMH9xwLdYSLNcJAK0H5FuD
 4wItF72HMubmmLIKsW0f3ko7Rx0DgS6HlCQmUHjNflFvzaUfgds8XmH9cqjohDy3m7JO
 pez/cKu3/QUxA+f10hS+3dU6TrMnQOpxvlczLsyIXOAsMaDy+ZaWTw5+X9t4b0hDX8Jx
 ZdJo64mQ1K/U3HLzMfJDLhEBV7frY/PQScpezhSGX18egAFpykLjeRbRetVXXcEbrKAZ
 jUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696344707; x=1696949507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j3W5gbiwB/5gwTM96ugP2be7g+wEOoUYMu+wXUrQYg=;
 b=dlaxdeVNvAlTaWvivLHMToMbNI+4bjJS7CQHOHoh8iBH5QeMgTcx4aAK7jYZvFgQcv
 Z/OKkD7UD6HX4fMfQicqyd03wE4MtQ3MVY9l3LoTFB74CCeAX2wnjFa2z8xN0MdwIoyr
 wyW98yxlJVHhpsuIyLSJbLn+7h9Np6nJmyweBTbaquEsyPbrOHfKtmnVJNzBlhci06KP
 Hd/mJZ4JPd2HQ+iEb7IqnUvBsZlU5JHrQZNT/4Vu129wTVpJU8OMkzGCs6Y5HM5vgbqQ
 KkGoUDsty/RA5fFPuGMkpHqEeCl/qiougMX5q7JiaOoJQle07JSJKDMo3xc+i2ASdugW
 4AjA==
X-Gm-Message-State: AOJu0YzcARPifeufBCE/59hphnXwGXxlg9XAXwhe2h4tCqzlvfGn5APq
 W9t+mx7edlBHlV33hsXif1n2Hw==
X-Google-Smtp-Source: AGHT+IE9rY8QXd3hX73Q6lwbGcVQvBQsR36SBdXE4r91ckRXTZW8tA0AY76GpxKS6c+NIXmjS4Oxeg==
X-Received: by 2002:a05:600c:3786:b0:405:3ee3:c69c with SMTP id
 o6-20020a05600c378600b004053ee3c69cmr11960246wmr.15.1696344706839; 
 Tue, 03 Oct 2023 07:51:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 07:51:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue,  3 Oct 2023 16:51:07 +0200
Message-Id: <20231003145114.21637-30-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:52 +0000
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH 29/36] pinctrl: st: use new pinctrl GPIO
	helpers
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index c1f36b164ea5..ec763572ab3e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -719,7 +719,7 @@ static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_direction_input(chip->base + offset);
+	pinctrl_gpio_direction_input_new(chip, offset);
 
 	return 0;
 }
@@ -730,7 +730,7 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__st_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip->base + offset);
+	pinctrl_gpio_direction_output_new(chip, offset);
 
 	return 0;
 }
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
