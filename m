Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A39FECC8
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2024 05:25:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA4E2C6DD9F;
	Tue, 31 Dec 2024 04:25:08 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 486B6C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2024 04:25:01 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-844ef6275c5so337528239f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2024 20:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735619100; x=1736223900;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
 b=kbvoSQrQhezoClHyDwxG+2fMtwfIWiENJtAm2Hk48zqINPMlgyMUawaAA9AxfDRyPq
 it6Ohxhf4mNAUHDS3lDurQX84dpH4lXUjbVfuzUTRCRwPXgC6Tgk9KoD6GEPfgoksKJT
 +UVP/qQ5cImFRp1SBe9Ty3vv5Lsdf9P1i0ui9wrpSrO7XJ5NsOfiMFwva9i0fYWXu9uk
 o6Ap1dcyF73JGnlts33DuLWOGQg5p0VCDeA3+jyD1BZN/JaE9mMWMjwjDkg/K2JsWQh/
 FIbc4qafweK7rXVVAb6BNMks6FylfEH5M2vw3eibXfaZFQCgtmf7EN14yw/heVPc5h5O
 0/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735619100; x=1736223900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
 b=tFKMaWlBdW8ejpvgvE5iJ+RgVLEPnpqFKbYWc40zbxxVI1FsAnpjzjTD50NnnhozNy
 WKGl/S3rPs6SFC9Xy9qCHu4mTl0J/w2ibrO1M+eXh11mBI+uuwKMS2UUZVZi5UGmaSJY
 1gvSY10FkDaNBg5e3EgNgOmJL7N5t2K/N1ogpZz7BmhgsXX3JxkXc8o5FMM7PMH2QeSL
 izwDnxKztdLFL/gmaQzzeeq+gkcfNRNyX78/lZ6gLLDOUf+w0jTQgJtXy5dXb2E8BWRD
 +qGwCRtPxDnPyE+fegQ/Wlx3TTvj/VYN9nx8U23gZC5cBTlu89YBfCChu0ppjDEN5qUk
 vrHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQn53V9cnlR0WsQwKYtVo2fUz9PjEKUDfXuIRd0pGUC3vNAT0f26nfCFZSSt+eylCtUMrvn6w6pA7NLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx28m8VVg62FfPy3xPhZ7K5Jl2LcOrw3m+I3rwE2qMVS7p0e8c+
 yI8Kch/0sNJo31SXMseKbKLouJwvUW2HZT/KnKZ5+5cJ+H/PpxLQ
X-Gm-Gg: ASbGncuFmRHLr7C1jzZ1Ytzri5f6VPFumQl48KFJnaLFXaKRelpBAwGcUnvplRXgqV3
 odVmFOpv6rp+d1Iqfuovkl28LJ3jDrhNIZDUJBc0SEHIvzUWUIhbKJ9O45Px8LLn9Y7qpCUJRm1
 06CGvAg99+GcJ/Y6cux7AeQxDO1q6/YZ8seJ2NQVONjhCamq9OawnT7xKz9WA3Vpf0chzqdrmxm
 z3ic8Dw2URFm8N1vyLTCIS+m/cpiE3N/Vx5UGVDV0Tyq9NC3f+9XEYYW+u75t1IQrUc
X-Google-Smtp-Source: AGHT+IFWciUZBXof1ClsDUD8qKNSVi/Is3uvZ/OcdGpT3wvFKtaZF6hzKy2H4IWFdlhfBLpQxrowkQ==
X-Received: by 2002:a05:6602:1503:b0:834:d7b6:4fea with SMTP id
 ca18e2360f4ac-8499e4cf6admr3595656639f.6.1735619099986; 
 Mon, 30 Dec 2024 20:24:59 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e698e2e985sm5286933173.38.2024.12.30.20.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 20:24:58 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Date: Mon, 30 Dec 2024 23:27:56 -0500
Message-Id: <20241231042756.3166495-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, Mingwei Zheng <zmw12306@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8] pinctrl: stm32: Add check for clk_enable()
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

Convert the driver to clk_bulk*() API.
Add check for the return value of clk_bulk_enable() to catch
the potential error.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v7 -> v8:
1. Remove all previously registered GPIO chips before disabling 
the clocks.

v6 -> v7:
1. Move clk_bulk_prepare_enable() before calling 
stm32_gpiolib_register_bank().

v5 -> v6:
1. Call devm_clk_bulk_get_all in stm32_pctl_probe().

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank()
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 76 ++++++++++++---------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..32c04391e2a0 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
 
 struct stm32_gpio_bank {
 	void __iomem *base;
-	struct clk *clk;
 	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
@@ -108,6 +107,7 @@ struct stm32_pinctrl {
 	unsigned ngroups;
 	const char **grp_names;
 	struct stm32_gpio_bank *banks;
+	struct clk_bulk_data *clks;
 	unsigned nbanks;
 	const struct stm32_pinctrl_match_data *match_data;
 	struct irq_domain	*domain;
@@ -1308,12 +1308,6 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
-	if (err) {
-		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
-		return err;
-	}
-
 	bank->gpio_chip = stm32_gpio_template;
 
 	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
@@ -1360,26 +1354,21 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 							   bank->fwnode, &stm32_gpio_domain_ops,
 							   bank);
 
-		if (!bank->domain) {
-			err = -ENODEV;
-			goto err_clk;
-		}
+		if (!bank->domain)
+			return -ENODEV;
 	}
 
 	names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
-	if (!names) {
-		err = -ENOMEM;
-		goto err_clk;
-	}
+	if (!names)
+		return -ENOMEM;
 
 	for (i = 0; i < npins; i++) {
 		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
 		if (stm32_pin && stm32_pin->pin.name) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
-			if (!names[i]) {
-				err = -ENOMEM;
-				goto err_clk;
-			}
+			if (!names[i])
+				return -ENOMEM;
+
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	err = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (err) {
 		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_nr);
-		goto err_clk;
+		return err;
 	}
 
 	dev_info(dev, "%s bank added\n", bank->gpio_chip.label);
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(bank->clk);
-	return err;
 }
 
 static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
@@ -1621,6 +1606,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	ret = devm_clk_bulk_get_all(dev, &pctl->clks);
+	if (ret < 0)
+		return ret;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,25 +1620,20 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
-			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
-					     "failed to get clk\n");
-		}
 		i++;
 	}
 
+	ret = clk_bulk_prepare_enable(banks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	for_each_gpiochip_node(dev, child) {
 		ret = stm32_gpiolib_register_bank(pctl, child);
 		if (ret) {
 			fwnode_handle_put(child);
-
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
-			return ret;
+			goto err_register;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,16 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
+err_register:
+	for (i = 0; i < pctl->nbanks; i++) {
+		struct stm32_gpio_bank *bank = &pctl->banks[i];
+
+		gpiochip_remove(&bank->gpio_chip);
+	}
+
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1720,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1730,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	ret = clk_bulk_enable(pctl->nbanks, pctl->clks);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
