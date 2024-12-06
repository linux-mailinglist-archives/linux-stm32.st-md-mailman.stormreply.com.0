Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDF9E7A56
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 22:04:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 345FEC78038;
	Fri,  6 Dec 2024 21:04:51 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45092C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 21:04:43 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6d8e7df7199so11058826d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733519082; x=1734123882;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
 b=gzckI/ymc55EHx+ej8zfL2PfeSk9s7tNoV4MXbU/f/iAmxxFF34kjAy8i3g3Lt1FxA
 sbXVhqnS4Qx1T8ZNg795UHjKb908u5UhgEhubIvpzYRG9y0gQerkU5qwpsW5KFGGP0Pn
 xJHQFNzLpCiZ9bzRm/9WsUWkikPTkp5TVoX5p7VVD3uT/X/PTryFBNVJWSidgbFV5jfN
 mFtqpQJcZG/XDeszjwn6RO+z34/be6MBAe/8PeewIx2In3u7IJ/cARWjBecB2xY1uHPX
 3JQjJLuxvkxtkfuXIdEmhyqi8ObD0xBfGZPJmXzOslukIbe1TlCAyH/6T+IsG/5UM4iu
 J0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733519082; x=1734123882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
 b=YFaywuItJnF8Oohaz1+5x+fW8Dvsd81Tk4oNjYVjbAmR9SZXUXMRXU94dPlTy1DYe9
 6A1GC6+DRvpJtnSnNugvvrXz9HZ/LmdHHV/jp3QTdRwBCrcjj8r+CAPJvi63UUo3dCZJ
 aNaw26pwecMKtLgy57vnqmpToMYBhCqiOZGrEWwlPUxrc33IRo+3GOw3RyoQtWQW2+QW
 12aKVaKswIe//BtkqTH5OQM1zMJOqcgbBlXxOjARgx3Ozh4HFel/HyOnN8HVqcxE4ZWw
 AsVkMGsIARYuCMHXeSaJBRbwgoXb00QBbsFFexsqvvjFre+kBNrrZbDdmECxvFdtfRUP
 JWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIm9Ri/556KcYu6vjB60+3IxJckBA5pfH50yS8A5hUfnaFjl12rje0kEsD9a/7/EJXQ+fR5CZPp5XNwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzzd8Hm7+vEE4q0NpssxZ7VWfIyYgHHOQEHh5mIuZrtOB8X2sJ7
 sJC15ocexZMKMc+LqbrUZDRUeQ+jqj6vQ6SgrKkKRGKaP6ZEKikd
X-Gm-Gg: ASbGncs26tEpVHoGLZo3O4dofZUw5IsixBtsVKPEoxRhANqLOMxts4L+mvdsX7JdGG/
 tZoHGOHDVx+HuI8c76qWbPR4IjeeTsBhdKsRCbxgNbsVIf5noZfs8rod89NWgEFHZVyvUgHgB4e
 sMUI2wUNjAlC8VIpxuPw0ur29aTsH9mTe2gdiBSjT7vhcIrj7qsz5lhB60v8V24CmIPMxoNqg5Q
 J6KTJjBPAzJhN3Ah81a+oHZ6dwKRadsI3rF5EGUCesiG586avBXl4drh/s7cA==
X-Google-Smtp-Source: AGHT+IEQdKZujTj7jjBxjOcAodQ9XvJwI3WBewZCeAsZZLW6wO5g4aM64JIpWh3fzo/92H8adS9G7Q==
X-Received: by 2002:a05:6214:20c3:b0:6d4:36ff:4358 with SMTP id
 6a1803df08f44-6d8e718552amr89532996d6.25.1733519082094; 
 Fri, 06 Dec 2024 13:04:42 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm23068256d6.11.2024.12.06.13.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 13:04:41 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Date: Fri,  6 Dec 2024 16:08:00 -0500
Message-Id: <20241206210800.3346579-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, Mingwei Zheng <zmw12306@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] pinctrl: stm32: Add check for clk_enable()
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

v1 -> v2:

1. Convert the driver to clk_bulk*() API.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..188de29ac281 100644
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
@@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
+	err = clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
 	if (err) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
 		return err;
@@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	return 0;
 
 err_clk:
-	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
 	return err;
 }
 
@@ -1631,11 +1631,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1647,7 +1646,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 
 			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+				clk_disable_unprepare(pctl->clks[i].clk);
 
 			return ret;
 		}
@@ -1726,10 +1725,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1735,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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
