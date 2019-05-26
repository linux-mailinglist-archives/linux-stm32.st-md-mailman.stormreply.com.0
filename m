Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 098852AF33
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 09:07:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C80A5C59795
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 07:07:43 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A140C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2019 07:14:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y11so2891639pfm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2019 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gpKp1Ji3NbYE6dlIioVp6OmCdvPteX1H1EwDeUiYnRo=;
 b=SlQO+gvKGyFVekP53VsMEkLrnYKIXnPeCfyVJpCc6L5giIU+OyiuvYGxLKys+i4eEg
 x4Bxv0XjnhN+IX32qe7Y6ElOmFVk5JLdxHDQghLROUfhfkS/yI7y9AsqY8dDjZTmx9Qd
 xQq6iB6wwJHfMzKKMnLuHIqOGcQm72DQLSdgSd8p2BRMGx11qnpAKZACoV3zQish1JUA
 LHrdhVNgk2vQzJ78O0MaTc2cM+d8KmN9D06jyp3OatZm4LGXzYiLtYWkToQNPYiS/QdZ
 HJroVs+UoCH+9+RMl3xE/lALsZKw7lFYjaYgbdr4apzaQv8q/VQyLTftAW25QN3sZjdX
 a30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gpKp1Ji3NbYE6dlIioVp6OmCdvPteX1H1EwDeUiYnRo=;
 b=pLaX8jD53l72ntmxhnpnh2YIU5IvnQcnmaDjT16XuCQwKwxQe32I70A6DELwHyC0eC
 UXYNmtAbraSwLxdgsqpbGFWyibQqZzfMswRiB3frR4T2Kw/HKGi8IOn72SGR7D/26GTG
 ZTAve0foArzZSdDcHIvNWqn22Cqkr+Rt+wCmBo9eBfPBjv6QNQRJXkj3jDKD+g5hHDT4
 K6498AjSL7FpwvzTd+6eca/+6eGp2g+SA9RVEs9MUNRM1X3PpvUgAdhfkSDxSki416qb
 0YDo9XkIK3JE6b4W2ar3v+/7QeKlqFD0SOpVC1JO2b1R52G2yKfiBoC5AnqyGC7uFyXD
 MYLQ==
X-Gm-Message-State: APjAAAXjydG5NVpUPaOouZ4dxFulV2pZBXJ/Q+ZGxdgoemb82A5vX91s
 CPpYMbe2lxarS70PeD0S3ss=
X-Google-Smtp-Source: APXvYqwTC0FptfX7CPxxhryj2laivRpDqWwH7V8fygp/VEbP5GYpQPJX1vkSLqIrM2RDP7oYdhrGsA==
X-Received: by 2002:aa7:8e46:: with SMTP id d6mr98123175pfr.91.1558854846680; 
 Sun, 26 May 2019 00:14:06 -0700 (PDT)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id 4sm11313421pfj.111.2019.05.26.00.14.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 00:14:06 -0700 (PDT)
From: Weitao Hou <houweitaoo@gmail.com>
To: vkoul@kernel.org, dan.j.williams@intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Sun, 26 May 2019 15:13:24 +0800
Message-Id: <20190526071324.15307-1-houweitaoo@gmail.com>
X-Mailer: git-send-email 2.18.0
X-Mailman-Approved-At: Mon, 27 May 2019 07:07:42 +0000
Cc: dmaengine@vger.kernel.org, Weitao Hou <houweitaoo@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: use to_platform_device()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use to_platform_device() instead of open-coding it.

Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
---
 drivers/dma/stm32-dmamux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index a67119199c45..63af24d4c834 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -306,8 +306,7 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int stm32_dmamux_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev =
-		container_of(dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(dev);
 	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(stm32_dmamux->clk);
@@ -317,8 +316,7 @@ static int stm32_dmamux_runtime_suspend(struct device *dev)
 
 static int stm32_dmamux_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev =
-		container_of(dev, struct platform_device, dev);
+	struct platform_device *pdev = to_platform_device(dev);
 	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
 	int ret;
 
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
