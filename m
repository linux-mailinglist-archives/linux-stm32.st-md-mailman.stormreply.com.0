Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F8D9FC1CD
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 20:57:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1256BC78F65;
	Tue, 24 Dec 2024 19:57:06 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 354C8C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 19:56:58 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3a9cb667783so40803075ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 11:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735070217; x=1735675017;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
 b=isWaw6TGqqi6GOs8RlgZgffi4EaBpgY8H0cXk6jW10cEnhenLMEmFn18OrK5h3vbRG
 BTHvOgsz1mxQpnr1sjaEapIP5oH9YnUuROSOtPcd++Zv8FEAcKWHvj2W1kOBzJulcNX3
 CGTrfbO0XOdo6OsP/PBwb0OwAWkevn8TIwx9jM9O2QCSqgirFeoTqj6J56J5BQyqgkjW
 aW9bz+tfW8jHK/vFKlSQb7s6Muq2eTXacEXWBUnnFOG+w05u59yIHuhret6GxseRcSXV
 GotWZLzFJoXUnkX6oGDPdOnNgOdRpgaBihcPRdUqYmJ/Io+rjEs+iUeiGfz+v1luQCnl
 92Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735070217; x=1735675017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
 b=hGLalwcJdhCqqz+XMfGNxE6zHdRZiwRNoFkA6ttgH69cntIw87MHMUvVNMD69HuyHU
 2PF2BMtj52XMGIWfLS/Jo9b7A3l05pSa0lg8Dk+z8CRgeY3YttpUzWbFmuUZaNX835g4
 EHJup9RHs4DgoRUuhnovAxPbzFVMCa+UZtkbIIqJrMCy0YkNi7Y7lizcOnSWAjWfqOs+
 hkXfv+qjlEclnBH9D4WgjpjrQb2Q1cjojruup7OFUINWOGcbx4tsThu4OJuF1cxpRxBB
 DfwVUCT9EzvSmj8UNVlj3mi2il4ZLPXpkzF4oE7Fst/LNi4kecJAfp0QT7vBv6LZ54Uh
 9Uuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWasTq+ttzgszIlB0C8W85+S16EKTHeZXq1l7rn/HGZnqBc3OEz0W0ayXq/WOUANJGQ7oSTHkkDYKZyKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/YdbgB1Vz8VfLsnkGDO/o2FdhnMcFlDqf8sJ1YVL6MQBRYljf
 LPMMiRwfJX8D6xXCxyuyFaLfr14MkS3czwAJlsE5rYzxT8qY1BmU
X-Gm-Gg: ASbGnctWFiBEprIqB+C7HNyOrUbmHLrj0bEuSFs8n5VtFqM7r6ByYoDJNxJHB46YNCD
 zjQhxC1pqFNELO3o7yuZ39YVg4loblThbp380aC3g/24BJvB+pRTMT5+ZEjJBkRjx6MLm85Cz5j
 xKOHAMaCFkpbw87vPSa1F1NBQQaYTRcHW5k10DSchWjCNs/Q4W8jR1KtM3jW7RF+ifQAPmxXq4F
 tAsw9Loln576V4CvWsqQpmlxdtpW0SGD96hnCDBFapzc/Xg1QzjV86qo+XunYYJesTb
X-Google-Smtp-Source: AGHT+IHX4vrmb8xk5P7zI2PSaxST8v5YjWWt+HzJlZhWJGjYPjLwHvnt47dobMyGbrbLFCDBd6cTxQ==
X-Received: by 2002:a92:c24c:0:b0:3a7:c5cb:8bf3 with SMTP id
 e9e14a558f8ab-3c2d277f5aamr146379315ab.9.1735070217031; 
 Tue, 24 Dec 2024 11:56:57 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0de053105sm29963655ab.15.2024.12.24.11.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 11:56:56 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Date: Tue, 24 Dec 2024 15:00:00 -0500
Message-Id: <20241224200000.76661-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, Mingwei Zheng <zmw12306@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7] pinctrl: stm32: Add check for clk_enable()
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 71 +++++++++++----------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..9c32ae3e5d45 100644
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
+			goto err_clk;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
+err_clk:
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1714,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1724,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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
