Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF034EFB37
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 11:31:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E4F6C36B0B;
	Tue,  5 Nov 2019 10:31:42 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B24B7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 10:31:41 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v8so5534900ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 02:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XvBRdkAyPv510oW/DoNbu2ek/YuJ4fUz43i4Kiqpz7Y=;
 b=JPqcG4H5phdwOooJr/oLW7YabE1i6lSsY+fWJ0TRtdX5XGE984/sjRX4Q0cSXiC+EN
 S/S7o9FRAMEaaCYBAEGYUJQ+Fgks2vZHID/fMJ4dgFAKX9TZYeZZT0ZhVM433rIWQUDX
 IwocbN/bYToLqygx9SEJCpDwP+/QjGDBK8msjqmbaZcMBxMVfZYGfPJNfTvEERXZj/IN
 vZRrrN2qk71tE51G/Pi0dBsKMNDeutpEpSp2n3v6qwC12d5DVBx02VDOr1YGQaHNAbzX
 i9dQC8EJIgamWlCtGg5t2G2rW35MdQK4zcC0PMh3CtATYz/BRFdj/5t53rgIPlXl4zFI
 AyVA==
X-Gm-Message-State: APjAAAXQg7rsixONtmoQ5hbaVsK7rAHB7wl5XdriDdeu9FjuQnpAYkQO
 hqTX8c6z+cR2oNmuwafILZI=
X-Google-Smtp-Source: APXvYqwzcMTXY37jn+kevU5PVaRTL4Bx5Du38GnP8Dod/bvdxDLo0L2M/SRsDTpCtbdPGxLa8OU4Sg==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr21797881ljb.22.1572949901044; 
 Tue, 05 Nov 2019 02:31:41 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id y189sm13700469lfc.9.2019.11.05.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:31:40 -0800 (PST)
Date: Tue, 5 Nov 2019 12:31:36 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <ce14d5fa5cd4d07b1014220f660068c662ebc42b.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 41/62] gpio: gpio-stmpe: Use new
	GPIO_LINE_DIRECTION
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

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-stmpe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 994d542daf53..542706a852e6 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -84,7 +84,10 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(ret & mask);
+	if (ret & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
