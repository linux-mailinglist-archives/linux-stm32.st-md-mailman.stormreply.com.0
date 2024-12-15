Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0B9F260C
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Dec 2024 21:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFF02C69063;
	Sun, 15 Dec 2024 20:37:11 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE28AC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 20:37:04 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-844d67eb693so256327139f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 12:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734295024; x=1734899824;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
 b=MNSE8gW4sDQ44ea2QkGjiB5ekP45uro1ctHDSLZWuY2xADAV09IgOPCjWjRWVgVYLB
 K2cTCoDDrHJRDzi/OqWZJk7PuXdxFST1j2m1MOCorL+lvuvtavRRW5BtAZsGsLk9T9Iq
 BkmsWx6uJJvmTdHVv/R8UVuYBFpnSaxIJ1LjcNvPEJx7oRjYkRc0iTsDwbIena2L4mgQ
 o6hlbkmhQ5g2U61Hv4MF1HjcpVTtRvmhE4xcWSUP+EewIobYpYMK1TGoG9YZiSOtkpVX
 lKXxfvRk3UQ0kJmXeW8ehA0A/nb7F1H4vFzU4wRhEMzltICuyyMSO6wEorXxgmWKp5O8
 cF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734295024; x=1734899824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
 b=RDC9KCkQnxAVEesROvv0HGBeZcNfUYPHwBkGHBxTmClAgLyJC/KmE62SNefSuzEXPI
 2+VVWA3elsdFw7a2JaSZ98IJ3VYnjR17cEJxkrcxhviXP3qAVJwerxq8+o+P8q6Jc4md
 Y3jOw2nbonjn5nPba2DF9dN+AZIRKPcbXmzfxxcPVksIDnGBtQIiXw8caGlUvjfuTKdk
 aRNEBHM7mPw3ZkKN+3b1RzpiRAqZd86XHwGDbQOKXB3mwut6aEmwHRILfCyX7J1rrpFw
 l68gKjpkhzwKuZWJOebAc0HRKnrKU7B+1MOwcHJbQ4uCliCw1vPNbBM8bGJyVSUNkk+x
 spkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI4chSU602eS7zVdXFgJ1zDpVKqfjtDJIPBJycXihPj7jew4UrOLSIXKZfzmRUTRLxlUjSNAGcouhQ/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHtXoYSNB+/wQlC/QzQjb/fAXA75o9wamdQToq0VPBBileNCIB
 1prOtTpEd1a6GDhWyh9w+662aXPtXU5uLJqTfbRsyV+Mjy1r0uFn
X-Gm-Gg: ASbGnctPrjH9OjL0agOHKlUZWijiFZPD6Spgc3hvDVmVKUseci3XtvORywWZP4nraX1
 d0vfsZQJvtFqsX7VxmPbsHnVZ4VPFJZJkogTEKDBeFy1gWg3EWGHc3ozP8+Qzyb7o98Af5IYVBw
 e+JT+31qETQGqWfjJTqx8CNbROJ86x96gkA4Vc+nrWGsIg5Ox7qe14TehD5a2zJU49Wm7olTMmb
 KjGMookEO44mNbvpSOI/OnB3CiB1Z80/Pltntn9YLqafKZJnwyPCrDkhAQsDekZ4+xE
X-Google-Smtp-Source: AGHT+IEgLKb6YqAkp/sb/aFLexcbRJzAt4rZw2ltZ964YL9/S1xZekP6D1npsz0NfYXIDmMoBDXGeA==
X-Received: by 2002:a05:6602:2b0e:b0:83d:e526:fde7 with SMTP id
 ca18e2360f4ac-844e87be5c6mr1146615539f.6.1734295023634; 
 Sun, 15 Dec 2024 12:37:03 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e5e32a336bsm892166173.100.2024.12.15.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 12:37:02 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: antonio.borneo@foss.st.com
Date: Sun, 15 Dec 2024 15:40:14 -0500
Message-Id: <20241215204014.4076659-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: marex@denx.de, peng.fan@nxp.com, make24@iscas.ac.cn,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 fabien.dessenne@foss.st.com, mcoquelin.stm32@gmail.com,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5] pinctrl: stm32: Add check for clk_enable()
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

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank() 
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 ++++++++++++---------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..5874a054dc48 100644
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
@@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
-			GFP_KERNEL);
+				   GFP_KERNEL);
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < banks; ++i)
+		pctl->clks[i].id = "";
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,11 +1624,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
+		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
+			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
 					     "failed to get clk\n");
 		}
 		i++;
@@ -1646,15 +1638,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
 			return ret;
 		}
 
 		pctl->nbanks++;
 	}
 
+	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
@@ -1726,10 +1721,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1731,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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
