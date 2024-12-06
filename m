Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3F9E7B23
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 22:40:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49FB3C78038;
	Fri,  6 Dec 2024 21:40:05 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBAA7C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 21:39:57 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7b66d55522dso294645785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733521197; x=1734125997;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
 b=eGpC6m3o3b37GLIvLQ3iD+XfbSGGYH2NjMp5hPuqLYN4WkdKaFd6uRH2PLXQUYtL/J
 VcYFryYUOlUy88w7esNJmOE7nyJ9XR64c8bjg6mRj623Ezdi4WN1fGXRRQpwy7tj6qos
 WZMsZvsV5mWfD5sZ3Nuk0WF2Tj/6DkS9xomi6TipJtYmiOPt/ppC7XBk23mPUd68bDgA
 qjsJClaTgyQ6YL8v0lwFGMPT3K2lM7g719iRi9N1+bT3stfDSHrE4qBQHHgBbPDjB7fs
 YvyTr7mALsZ9OtPvrCgfWDmgA0RFSgPXxPw+OFs7XRKUAgddLI626YSlaKJ81CqwyUwW
 W4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733521197; x=1734125997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
 b=Ewo7+gVCkxNmraWVJl9jRDTwMJc41eveaqLecQPbeOwzBSlKvn0JpcA9bDj3LI2qNd
 GmlJbg+zw/3Paj6wu8SK6MNJHtYvV96kWoeiTckv5jygg6NzqHpVyJRdwJFKby9yYrmM
 MWqxQ94DCxvKk6FAQ1mp5XmsWGR2+UzprzgPtd48KBHEcRZ9eeCm4GRUkm+nhRmo2C8+
 876PpjdPX5n1CdLQQssrbyYf28VSlAi+Aq47zpI035as/Ska3bMIwdRzjjm4RBHeRM6W
 LKQdOi34Qdb5eaI0GiFvqLNfWp2KJ6FCUiKxSq1bkxIVVY73PLZ9PQKQA3GENx0KlyIx
 uNEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuAAKd2yg/nYN40li+LDLc3Ok2rMY3MkEijaEef7UgzYX6ayyK3RvyEpfwgFRvYfwIUtb33ecs6iwSYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx96GsSho2+hhABMf8RSey/khejuOmv7HiTGY2+mA1NqrbmOQb7
 Q4VEWkAthNuey7/CZjxf2iV91bMG/nF7ubtcP2rjEoUvZxOqN8ly
X-Gm-Gg: ASbGncsmkHMODkoM9mmho4oidQWRCb6Hmy+zX73Gd0WaGnUYQCH9VvFxBZsn0XqpSH7
 7rm0SR3UVSS0/7qI8w0ULCi1CZ2R8OfyyTAUEXT9mKofh2Z8hRy6+w3oi/ONAhZad7AVli27cjn
 pObYjxZ1kH9FWv01SNucDTS0OqD+eGFzwR+bTIO8CnZAT4JyPZ4IuWhjV9yBFMYNTP1ZP8JE+sn
 1Si3GLc78tPqjl9VIDvLwNbQgeZGDYsjAwKwwBEBsn6mH3Pk4upXj126qmhiQ==
X-Google-Smtp-Source: AGHT+IEEnGwLcZ6wgoSEVpifnZ7n698aIGd7Lu/CBlB0yurAYkGYemOCDvTincbiQGiudFkAp3rHqA==
X-Received: by 2002:a05:620a:2682:b0:7b6:7356:a19e with SMTP id
 af79cd13be357-7b6bcac22a4mr686886185a.7.1733521196806; 
 Fri, 06 Dec 2024 13:39:56 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-467451fa7fcsm3100801cf.9.2024.12.06.13.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 13:39:55 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Date: Fri,  6 Dec 2024 16:43:15 -0500
Message-Id: <20241206214315.3385033-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, Mingwei Zheng <zmw12306@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] pinctrl: stm32: Add check for clk_enable()
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

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..0ef912e82736 100644
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
@@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable(pctl->nbanks, pctl->clks);
+			clk_bulk_unprepare(pctl->nbanks, pctl->clks);
 
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
