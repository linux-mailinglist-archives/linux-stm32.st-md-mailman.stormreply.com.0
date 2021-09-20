Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1370C411186
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 11:05:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FA6BC5A4CE;
	Mon, 20 Sep 2021 09:05:27 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E241C5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=v+d2EKH5Hm5rpn
 klW0GzaZ84yipAYJED4MgP1hNorRw=; b=ENT1r8KQ+FnFXriV0P7EoLlZR5qLmH
 4EOYIViXe50IwSpt8xAZqjd/BTaHNLa2HBMyuczSsS5CrB6fR6SgiWtgbCpPPdDe
 uLB7SYVDrfMhxPNElI7Oa7CoAH33R8I5BsLwrEVeKLJ8MbAxrAMpg0g4p8wUekPo
 1Q2x9yeDyWprg=
Received: (qmail 2412559 invoked from network); 20 Sep 2021 11:05:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 20 Sep 2021 11:05:23 +0200
X-UD-Smtp-Session: l3s3148p1@z9vIlGnMCIsgAwDPXwlxANIWpbLKE1Uh
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Sep 2021 11:05:13 +0200
Message-Id: <20210920090522.23784-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] dmaengine: stm32-dmamux: simplify getting
	.driver_data
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

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/dma/stm32-dmamux.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index a42164389ebc..175f06749df6 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -305,8 +305,7 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM
 static int stm32_dmamux_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	struct stm32_dmamux_data *stm32_dmamux = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(stm32_dmamux->clk);
 
@@ -315,13 +314,12 @@ static int stm32_dmamux_runtime_suspend(struct device *dev)
 
 static int stm32_dmamux_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	struct stm32_dmamux_data *stm32_dmamux = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(stm32_dmamux->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to prepare_enable clock\n");
+		dev_err(dev, "failed to prepare_enable clock\n");
 		return ret;
 	}
 
@@ -332,8 +330,7 @@ static int stm32_dmamux_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int stm32_dmamux_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	struct stm32_dmamux_data *stm32_dmamux = dev_get_drvdata(dev);
 	int i, ret;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -353,8 +350,7 @@ static int stm32_dmamux_suspend(struct device *dev)
 
 static int stm32_dmamux_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct stm32_dmamux_data *stm32_dmamux = platform_get_drvdata(pdev);
+	struct stm32_dmamux_data *stm32_dmamux = dev_get_drvdata(dev);
 	int i, ret;
 
 	ret = pm_runtime_force_resume(dev);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
