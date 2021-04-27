Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95C36C33F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Apr 2021 12:27:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A882FC57B51;
	Tue, 27 Apr 2021 10:27:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E53AEC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Apr 2021 10:27:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 815A661415;
 Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619519236;
 bh=/R60wucnhMxzatTcaaq6aX+wA4KyHRrla+Ogrsx7GxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P56zrL4Gg3jEUeTkZS2IFHj+uXqtpdhmLsJDUn92MY4jLzJjsQAryX6b1IuA4GpoC
 uiZVc1R9FxNaZE3nN2cCyZR0UT5MeNcBNUzscwoou2kUKoy+tWYKD1dG8VBteaq506
 pIOcETXuU9PPpieZnMFlvj8nlszSsVh7Ty5l5thsp1lnQoM42oV9QGL94uNwZanFzZ
 EAipNbg4MFY7UlZWA3zXP3lxC3IeJxVDBrA121JQ14Ki3F0PsoxcMrpDJEnKDwRzmR
 QehK2z7aUj8zb2mpo7fTfROvJdt3jaPNmBdKvwFOtLjtKycARv1ZOUIaV88bhGhzyn
 5xBT36E1ppv7Q==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKvz-000o2n-Hp; Tue, 27 Apr 2021 12:27:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Date: Tue, 27 Apr 2021 12:27:04 +0200
Message-Id: <7a01ab8c03a6778c6aeb9357a3807829c6dc91f3.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 mauro.chehab@huawei.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 74/79] media: stm32: use
	pm_runtime_resume_and_get()
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index bbcc2254fa2e..5f4e1db8cfcd 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -723,11 +723,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	u32 val = 0;
 	int ret;
 
-	ret = pm_runtime_get_sync(dcmi->dev);
+	ret = pm_runtime_resume_and_get(dcmi->dev);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
 			__func__, ret);
-		goto err_pm_put;
+		goto err_unlock;
 	}
 
 	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
@@ -848,6 +848,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
+err_unlock:
 	spin_lock_irq(&dcmi->irqlock);
 	/*
 	 * Return all buffers to vb2 in QUEUED state.
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
