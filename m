Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806C49A3FB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 03:07:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC01FC5F1D5;
	Tue, 25 Jan 2022 02:07:13 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ACFDC57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 02:07:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8B0A9CE140F;
 Tue, 25 Jan 2022 02:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134C2C340E4;
 Tue, 25 Jan 2022 02:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643076429;
 bh=DkmaCtzsHaDPBE4tP0CtUwloyPGdoHeaJw6+TrZcPzc=;
 h=Date:From:To:Cc:Subject:From;
 b=fXK5sTtrVfnVn9wHuKkp4/rZufg1I6xX1vRxBNJOygtNroA6BHGiOv81djcwLhJgW
 SfuJU613oVo8CugT8dJMFR5+0eiuKV447klDxPHHqkBr00bX/b9f5sQXYfjss6r0H3
 fVWE5PYcxyuehvkkkvaM0keZPgJFP4sBvnpq51lG4/CkI27q9yxaqimKs/aX+q7gw/
 OYwoPwjYVB9GnJSY6UHSA5hlt5Fjfdj4MEeR4lY4DQAD3xuu+yCK/m08LZh6zcOJQc
 mdCrIF1lyVRos9YXbp7rff0KNtE4hnK9QHWS/dCRw18rmMOThBeVBLtmAafKL3U/sG
 gMZjZFsNheXIQ==
Date: Mon, 24 Jan 2022 20:13:53 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20220125021353.GA29777@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-remoteproc@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH][next] hwspinlock: stm32: Use struct_size()
 helper in devm_kzalloc()
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

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worst scenario, could lead to heap overflows.

Also, address the following sparse warnings:
drivers/hwspinlock/stm32_hwspinlock.c:84:32: warning: using sizeof on a flexible structure

Link: https://github.com/KSPP/linux/issues/174
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 5bd11a7fab65..716ad4401249 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -73,15 +73,14 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	size_t array_size;
 	int i, ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-	array_size = STM32_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
-	hw = devm_kzalloc(dev, sizeof(*hw) + array_size, GFP_KERNEL);
+	hw = devm_kzalloc(dev, struct_size(hw, bank.lock, STM32_MUTEX_NUM_LOCKS),
+			  GFP_KERNEL);
 	if (!hw)
 		return -ENOMEM;
 
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
