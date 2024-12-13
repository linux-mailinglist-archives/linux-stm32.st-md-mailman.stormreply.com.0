Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DED9F018F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 02:07:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A20B7C6C83D;
	Fri, 13 Dec 2024 01:07:01 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F74DC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 01:06:54 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-844d555491eso45173939f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 17:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734052013; x=1734656813;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
 b=OpZFe9Ou6+gMchTFAK5G9FS8SZezdrKHBcTt6B2GlLwgsIF1SyeCf/6/+yoadlmEq0
 mlDUqAw0qfHfGEPw6/xWMpHA0rkgqndQJZJh43B1H9QmH8+s5S7CtWKYDGjuhGiU3Uo9
 lkWkYdZrPwnUNzApZR6umFmYXIF6Iy/EskzxwZuejESm+39ExWv/3pHk+dCdlguqmJlQ
 8IIfspNFMraAKawbYySEXKqYNIDml4NONqr/2zHfBl41hQ4AVBro0MsA1oyLALT92Eqn
 7vkIr+/GhUN//XGFHoypuivorFwn+y5NNQMTEFczUVmIBw0AzCuh24WVjt5/hgWjf6tf
 4YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734052013; x=1734656813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
 b=YnAcPGzUYvqZlsMHLKqYOo4adMJBcB8WSW0tIODhcMfkUr/9V8HvXikSmpwK0plqYL
 wu68ndcKu09OvfFiaNQNqsaStCAcS4vbhFpvUTCwz2zbIHa20/uRcpKhuzvt+a6pDTiq
 WwcYW+oHvOrl9F5/e3CmByY3ERrgBB4PswJlmtpHeR8el8P49kvNKq6dG2z/VyTU0JNo
 rB/d3EDdkfQ/xHvHk1vFC4Lupm9A7iVI99uDkbtw+m4Nq8PjTwJb/S09AOpX/OmmDpbV
 3waTVAwBe1f+yA4B0L7pXHolIVu0AuZZpUBKSOaNBfHZzWwpkwoP3TuKHCkIXP+2H8rn
 AOtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDOcLhvkR1zsAgQSzPrRWCFV1pzMhsgf7KpEgFZkWcOnkN3un2S35IKl8YOinrEMltcu1IAlFRzKiwHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPP5buv1ECF6KW+/p3sNHfNAMNHmM3b5vNwiE43Ok8tD+7HwGi
 ye2JXp3l2BVo7z4RcMpubE3oXQBdAg9HFFQ3t4IhaArR0G5eJPH8
X-Gm-Gg: ASbGnct8OPyNnlGEIYuflUUeGTZ77U+x+Acgsc7RLel4AWFNkvyrreGWCoJU3P2cOI7
 Ay5jMdGphD3w5ozbzJT10W1LZC+BXgSP57Mocfdrhvr7s9UXVjNIX0LqYjLdqmh83IqP49kE6E8
 oTdGg5a/X3bZWWawCXiS+5Ry9pq1WR8+M+jQQrUfAUXWKSdZOGqpX6kXXm6nvgjDdMFFAWeZ/MR
 cVnV8cPkT50iLVnjnAFxq7POqZBEYYtGbeERPvuFsxUEwmWywwbUxkvGkw3dD6T7YvY
X-Google-Smtp-Source: AGHT+IE0aRqUJwlA5+FNU6Sqc7UszAClayD0xVEQXFIIaM793yvcNU2uDJsHlxIEfHs4it75DfgO/g==
X-Received: by 2002:a05:6e02:13a5:b0:3a7:e0c0:5f0d with SMTP id
 e9e14a558f8ab-3aff4616f35mr9786085ab.3.1734052013275; 
 Thu, 12 Dec 2024 17:06:53 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a9628ba832sm32644325ab.64.2024.12.12.17.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 17:06:51 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de,
	antonio.borneo@foss.st.com
Date: Thu, 12 Dec 2024 20:09:48 -0500
Message-Id: <20241213010948.2623382-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, Mingwei Zheng <zmw12306@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4] pinctrl: stm32: Add check for clk_enable()
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

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 37 +++++++++++++++------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..427749d4f6a5 100644
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
 
@@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1631,11 +1639,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1646,8 +1653,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable_unprepare(pctl->nbanks, pctl->clks);
 
 			return ret;
 		}
@@ -1726,10 +1732,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1742,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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
