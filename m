Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 070064721E2
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Dec 2021 08:45:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E38C5F1F6;
	Mon, 13 Dec 2021 07:45:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FC00C5F1E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 18:53:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d24so20419728wra.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 10:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:subject:from:reply-to:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=TWUrlcTesqI3HuTnG0bLpcjjpTZsdRdkaEZo0eKnu84=;
 b=fCL9nwjqyRotkVGUmDRGaxph9Ky8MEnAbUbKRK5eMmoxQy7SE9OCh5OVQFcE66Kljk
 AvH2OxW7k6uW+AzQmDqqAmKJ8M+gevk8Nc6hmGbV4AM+xi6kfXf3/pphzxc+B9uFwz+P
 47pJ4uovEDr45okzlU37gM7i/cIUyrXNQ0SX8j2nc3DwgN0UzRPLlKPDlpRnQ4+UTy2n
 jTpwagJw4shutT/8DYzlGdSR5yFaS+WdDNXyeRgkZcfGNvrafQU3+KnVWFeRe9qyjoDD
 rKC1ZJ/Utty1edqCmXNOK3WpNp7loKq6vGq6ZQ4KAcJRS3q2Ne3MZh+eVyAtWeCBKWnf
 5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :user-agent:mime-version:content-transfer-encoding;
 bh=TWUrlcTesqI3HuTnG0bLpcjjpTZsdRdkaEZo0eKnu84=;
 b=X+Qrf31ZtjEMLBhnrhcfJK8v4fmQLhb6740tOXvYJZST6Z2RfMq60XJegkS2C9lXhV
 d22g8zDGScff64SWMQARmA+aEEILkM/7gZio3vzEsa6nhTPc3Okxv+6uWw6Trk5UhIbq
 zvnZcR5lZu5OeWqyeTbRgrL5n0Ph/tBGcN0z8Y/xtUcJJg2K5rXGzw5vTgzY3y7/F1yO
 7ZPEWbXpsOQ+w+O7Gt3BaeDzgCp/6VQ9idkW5zcfbJKpu0iFmA4IXEoCbnNA9A30py4+
 cjB8gaTMEtq6VHsGnveGQAd8PtAzMhG6mlXjrwjqkIsZF6wa0ypKaca1FhuLB81sBlZh
 K0wg==
X-Gm-Message-State: AOAM5332ZGqqy2DUcXM+lBWq+hCB8abfOejbUe9DyxL7zBcLR2JivA7d
 iLC0SulvVcuBpnb7XJPvk3w=
X-Google-Smtp-Source: ABdhPJx2knX4bKY7hBXMatBBZT+FGKyzvmJWAx1y6UenAlTIGdo8x6ppcC11ynSU11xW1h6iL4GEUA==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr21980731wru.123.1639248827955; 
 Sat, 11 Dec 2021 10:53:47 -0800 (PST)
Received: from mars.fritz.box ([2a02:8070:bb0:8700:b62e:e6aa:398b:fb9d])
 by smtp.gmail.com with ESMTPSA id m21sm5529538wrb.2.2021.12.11.10.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 10:53:47 -0800 (PST)
Message-ID: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Dec 2021 19:53:39 +0100
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Dec 2021 07:45:47 +0000
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Revert "pinctrl: stm32: fix the reported
 number of GPIO lines per bank"
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
Reply-To: chf.fritz@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This reverts commit 67e2996f72c71ebe4ac2fcbcf77e54479bb7aa11 because it
breaks pin usage for gpio-nodes with an offset in gpio-ranges (like
&gpiof from stm32mp15xxab-pinctrl.dtsi).

For example the following reset gpio of a wifi module on a stm32mp153c
board works again after applying this revert patch:

	wifi_pwrseq: wifi-pwrseq {
		compatible = "mmc-pwrseq-simple";
		reset-gpios = <&gpiof 9 GPIO_ACTIVE_LOW>;
	};

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 24764ebcc936..73f49c596cef 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1225,7 +1225,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	struct device *dev = pctl->dev;
 	struct resource res;
 	int npins = STM32_GPIO_PINS_PER_BANK;
-	int bank_nr, err, i = 0;
+	int bank_nr, err;
 
 	if (!IS_ERR(bank->rstc))
 		reset_control_deassert(bank->rstc);
@@ -1247,14 +1247,9 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 
 	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
 
-	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
+	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args)) {
 		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
 		bank->gpio_chip.base = args.args[1];
-
-		npins = args.args[2];
-		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
-							 ++i, &args))
-			npins += args.args[2];
 	} else {
 		bank_nr = pctl->nbanks;
 		bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
-- 
2.30.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
