Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E0A03271
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 23:04:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41227C6B47E;
	Mon,  6 Jan 2025 22:04:16 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6379C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 22:04:08 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7b6f8524f23so1626097985a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 14:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736201048; x=1736805848;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gE972PSUI18MWZ+RwXKg9FgJGGHphELoFtgsgAWfKDc=;
 b=J6fS4JusWE9njGa/MZqkFEk8XrIzu+Uy7vhKwdiS9RdWbeMMaoWUAryiNRzG0IwqbU
 +FA6nyFa3Y6Qx1bI/doXR65rRyr36KnLDQzWZHWZ6Sa4BGP6GwCJWSBvLrUQEVgQF+5G
 NhccdwUVIw8O/8zYslu714/Rfy/isvRP+xvhhwvLTL6bnNBM4f3LCkV0DBQsC3YNa3OS
 pR4Dzh5cexAgO38awdldpRGwTk5cPC6Q2V/282SQmc+5EmrXPKX5zVyHfv22l/2e1iQo
 rztvwPnDEg5M14HIgTfd8KJT61GkaZvyMlIQROEn4gumCd+O7QeHwyvKsehGViK1Q/t0
 txFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736201048; x=1736805848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gE972PSUI18MWZ+RwXKg9FgJGGHphELoFtgsgAWfKDc=;
 b=Yv+MaXS7i5PwCd0pg1AxJgMHm0EnC/wVgt6hiST/pymaCc4X8pa8mQhTPygwq9chyc
 uzH5q0mM3B6BBAs7UiCIjCqc8ey6lKaWpJvXHW0+fJbbJq2QPl56tvzukRRuHbu2QroZ
 THnOFB9McTfoIiLgKhneSL0Wu1rV1iV8WyJk6a1p6ND5EmwzuxjW1+X0vD1OuvPnEwxB
 3HcItvB7rRN5zu2AAY24192Le7eQ6aI9S9grltUX3BwcsaBZl1+OU5O3ns9GY4FkLBCk
 mnvX8Bh8pN0k00kZIl/PfNnSojDQh4vH41n09RzVnrU3EGcbmu3c+G0LGAp8Bc7PjyKB
 F6fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFhUlHBmPkBiD9A5Zw5Dv/uNrqsTvs6+p5rhxSsiKIy+Wjmxj+5+/VWgNaJge7kx9So71Mkp1pDc8LHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzfggzjIoNOEY17/bBhGRBJdmz3ZiDpuuzyUjXuoPLdevo3aLf/
 lQ/Cwch9qJ4gM2sov3MitOAkKpwJXgLXi7mhlmuSGfqu/N6zLB3e
X-Gm-Gg: ASbGncv/nx4fZ1j700fcvlOkMkxgWrr0mTqxg4Oz+M5Sez3VUSp5+Oog3mxGw6zWc4v
 FbcNlWImQ7SF9Odupy1ZMiNjkrR/tizWBmQ2qf4ozTke40U/YtsCeDzbW6jUKWVCjssT4lnapeC
 qOSqBmIImic+qxm19tY07VLLhsjGSjMzjvilavMNU/qHjt3QPRgDZIzSbZem6WgJZfJKiGEeWOO
 YAKXvRQh5W/RSDnMfJftf4+JxpFNFpVtfFuT+K1EkbeTg0oBC7Pr2XvUBk1NVH/DWF8
X-Google-Smtp-Source: AGHT+IGn0g8TEC3Aj/0e3OGDC3eL91fHDnZHW118aKg0tjM+B8b8FsO0SH7lTvnA8lvipg/jwXVjnQ==
X-Received: by 2002:a05:620a:19a0:b0:7b1:52a9:ae1d with SMTP id
 af79cd13be357-7b9ba716a1bmr10201657485a.6.1736201047754; 
 Mon, 06 Jan 2025 14:04:07 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b9ac30d378sm1541912685a.56.2025.01.06.14.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 14:04:06 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: antonio.borneo@foss.st.com
Date: Mon,  6 Jan 2025 17:06:59 -0500
Message-Id: <20250106220659.2640365-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: marex@denx.de, peng.fan@nxp.com, make24@iscas.ac.cn,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 fabien.dessenne@foss.st.com, mcoquelin.stm32@gmail.com,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10] pinctrl: stm32: Add check for clk_enable()
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

v9 -> v10:
1. Move the id assignment into pctl->clks[i].clk assignment loop.
2. Remove empty lines.

v8 -> v9:
1. Revert changes from v5 to v6.
2. Add assignment for clk id to avoid NULL pointer dereference.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 76 +++++++++++++--------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..03f3f707d275 100644
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
@@ -1360,26 +1354,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
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
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1378,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
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
@@ -1621,6 +1605,11 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1632,24 +1621,27 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 		}
 
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
+		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
+			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
 					     "failed to get clk\n");
 		}
+		pctl->clks[i].id = "pctl";
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
@@ -1658,6 +1650,15 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
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
@@ -1726,10 +1727,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1737,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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
