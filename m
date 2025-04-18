Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA297A93685
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 13:28:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88027C78F8C;
	Fri, 18 Apr 2025 11:28:06 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47F92C78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 11:28:05 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id 5jt3uIpWSETiN5jt6uVhXy; Fri, 18 Apr 2025 13:28:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1744975684;
 bh=RhKKzOTavQSyVncFCb3AgWCcG0eXDV8j6b9vH+lBEeA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=VMdEVWS2hqlZxDo0TKNCxl3joZjhxZ5dBS7jxMf3Ig2oLFcedqURf035X+Jw176ZQ
 QcsWaiXrLT8X5xmmDrjRQYF2ImTuhZ+VMWlUGkk/Mwl7ck6Gv7cp8wiTan9TvMxRWk
 ERm0gI5Vrr/96HQVBSu44t5mHNziyqFa4Jg5ddIW69TfzUTgddT8Ju8VD/okA5wfv6
 4gZlT5pA6eIbzwrR0wG7RNeWSL9Uze7pujd56A3Mur39GyaOsqWIE99ykQ5N08Hfs3
 Wv4hg3yq+TMbTHpEnLoIPgPWakRcLRKzS1ytgYg4Tr9o9LURl4djvDBVsZJICso9yW
 4AhmuJ7XVYN7Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 13:28:04 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 18 Apr 2025 13:27:53 +0200
Message-ID: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32-ospi: Fix an error handling path
	in stm32_ospi_probe()
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

If an error occurs after a successful stm32_ospi_dma_setup() call, some
dma_release_channel() calls are needed to release some resources, as
already done in the remove function.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/spi/spi-stm32-ospi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 668022098b1e..9ec9823409cc 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 err_pm_enable:
 	pm_runtime_force_suspend(ospi->dev);
 	mutex_destroy(&ospi->lock);
+	if (ospi->dma_chtx)
+		dma_release_channel(ospi->dma_chtx);
+	if (ospi->dma_chrx)
+		dma_release_channel(ospi->dma_chrx);
 
 	return ret;
 }
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
