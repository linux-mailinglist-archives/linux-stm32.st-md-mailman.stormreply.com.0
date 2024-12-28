Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC439FDCB1
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C27C78F63;
	Sat, 28 Dec 2024 23:33:05 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D302C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38634c35129so6172625f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428781; x=1736033581;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i3zTfYTmH7V6QXuNHKkMZLGYqANdc4Kmp0yLfTvIJII=;
 b=CT2DSmTTLOw7c5PrVAc9qGg2thPSjAwEuLYmnaPkgV/wo4SlXadYwVZ/Vf2O9WsiTv
 0s5zgLC+hsZtJiChxAAGGovwyUX+t14D48YCVCSTOvu7xxqxlGyfi8ftyMolr7HDV9oJ
 dhnnqepiHcasrBgL+GcTscw0vF95wk8meHU/hMj/+f2xP739zKhvaX0patZtnuarIsZG
 E/q+G898Bi86/9O/f/kDWL7+0296UAxcw8NuLW3KppQwBdPnfQzWEGl5Msq/z7lIhyay
 m1zjoZ1VgvkZ8X2kA1QJGEhvoCA/oROJ/Z0x6A3SzWXjVpo3TlsWXYLC79z3piYUUi/C
 WsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428781; x=1736033581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3zTfYTmH7V6QXuNHKkMZLGYqANdc4Kmp0yLfTvIJII=;
 b=PklznpOoGNRr4ILjJ6jPZi+bVxuvOprOf9IVnPzIwwOcR+b9xv2Fa+Jx6ztNWw9anK
 hwZKNEeTs6CTBuOFZszbXbCrM8hYVj9h45n3GazRgWnWu8Nvl6Jj8nZD/8Q8GDxdaMEf
 k9mDnLMYJIdZQ5SfTn287YQGVvteLDiYH21+/N1nuZ4B5ftyPbXXPYOp0KIEiHue4Vln
 U6Nm3wR2oxQlFyMEf6qOFrjKdTM/ybXcXG0mfuCwnYAmqA7aC5jgB7c5IALJQtQ9Viqr
 G7hwLDEC6NBTI2AuF7YAGvfDcGLBYadhOAYzJQa+aUC7Bg+G/7xTRdAiinirwlsNmq3B
 9PgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVBihtMJF8wo7dJPM5+3SOLqRjqdlzUY8QLjS/9L3o0UPppIu2bmaAy3TCyG2lnXJ/Nb35T2vz7CH2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YykS5Q7wr8FKgFYAUcq5/dX2PqRCi8xBgPTCMRV0y+TuUwzDOtR
 7uokQBKLLStOwol/OZdQ6sLQa2WNcnCwxGftbtT3TUoO1KIx06Yc
X-Gm-Gg: ASbGnctmD9z9stA9S9shtRr6u5E8fzsIkxBnzgSFD5XXe4s165hRAWPZ8Xhf7/BF2Wx
 tJ1ucqUz2sS+OQ27lH3lMs8nYFOj0X9x4GJxvCCj3l+jHPpl9Eu/Qvs/n5KtUWjblTdu81BBa5l
 EJyAHGssyjNDPhwnT4qk1PB/hkRjwdqqoVqWVotWUeBxsznpko3Li6tSTRk1E1SpFxAsUwrt11S
 V4aJguuYEr6Uy0CaU20ynq8HrDUmaa/SCpWH3aDFrsdJ41uWGe7dTNsqg==
X-Google-Smtp-Source: AGHT+IEcJYHmTXyjTQ0IKDccCfhouFmdjCPXPJuqVdFHdCEXf871k685aGmx4Gh0Y+WbNAty4FI1JQ==
X-Received: by 2002:a05:6000:4021:b0:385:e4a7:df07 with SMTP id
 ffacd0b85a97d-38a223f76a3mr28191587f8f.42.1735428780424; 
 Sat, 28 Dec 2024 15:33:00 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4b0sm309653465e9.35.2024.12.28.15.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:33:00 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:45 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-6-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=2SAyWje7KVs9u2R4zoEyduMFN1gU91zxKOMAXSN9WYY=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqlgyp8ozEWbmqkXK9N4hLvauXPgVgz8iuIX
 xBtJUtexBuJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpQAKCRDnIYpo1BLC
 tQjtEACgRG4xlJ7uKeIA7lnM0soMV6YFReYT4AAeQKOEdIX+sJjm1B/RWvmEgjXHXiMS6i/olGb
 tdDopgx+J7oOsCT66udg8iNHBKWlKb/czzNYxNoGUk7ot5nUdnl3Bpi4D04kQrhx0LX+BMyTZ1s
 +tUcKBW2RH7Kjv2vjN1o/ibE7G6bNCGaBwQGTQ9bQd4lxohl9pKtpGmSYvHzpKodw074qMs+YdT
 z4kVd89fIMpy7xqvrsFb27UR/VRPP8IpZ02niz+kXpcXaEQaVz6Gexv+T/QlM37+ep/oXUYpFEz
 wl2lxWo3Dr87Xr1tl8nkk9R+1KGlQXOCm+jQOBA5Glz7qtPq9KyckYmCnaioNMg4QZ1dJKjgN8E
 BP0o+AKr2SsiZrlB0eG59j0BtjMzxcHcTjtCqqc9eLfL3QxRkjDnRXslWdHYjK3xarvL4qoWFnc
 5SoEnxWQAzlBUlnMQbMz+rvUOBgBf2CkbJL00q/21GlSPaafulA5Ir3UE8ZutbThESAmOb3YCCC
 7KICCYh5ru3stSIk3v57JjCGG8OmoViMTw9TdUI1I57+KNmiSlNoC84LUAqRsXLEl2kHrXrPH46
 0b5vWiZUeMOn33qDrFPEiGuHlzP3BcA0M7IwZNPW7nJ1rhQ6H9dkT9dR3nF1MtJg2X2Orpw5FsW
 Ww6pQALy6v0aVTA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] spi: st: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/spi/spi-st-ssc4.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/spi/spi-st-ssc4.c b/drivers/spi/spi-st-ssc4.c
index 4cff976ab16fbdf3708ab870176a04f2628b501b..5cc452447410bedf3c12893d94bc959892ac827d 100644
--- a/drivers/spi/spi-st-ssc4.c
+++ b/drivers/spi/spi-st-ssc4.c
@@ -378,7 +378,6 @@ static void spi_st_remove(struct platform_device *pdev)
 	pinctrl_pm_select_sleep_state(&pdev->dev);
 }
 
-#ifdef CONFIG_PM
 static int spi_st_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
@@ -403,9 +402,7 @@ static int spi_st_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int spi_st_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
@@ -429,7 +426,6 @@ static int spi_st_resume(struct device *dev)
 
 	return pm_runtime_force_resume(dev);
 }
-#endif
 
 static const struct dev_pm_ops spi_st_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_st_suspend, spi_st_resume)
@@ -445,7 +441,7 @@ MODULE_DEVICE_TABLE(of, stm_spi_match);
 static struct platform_driver spi_st_driver = {
 	.driver = {
 		.name = "spi-st",
-		.pm = &spi_st_pm,
+		.pm = pm_sleep_ptr(&spi_st_pm),
 		.of_match_table = of_match_ptr(stm_spi_match),
 	},
 	.probe = spi_st_probe,

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
