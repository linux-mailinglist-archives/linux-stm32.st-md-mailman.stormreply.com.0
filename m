Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4928369F17
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Apr 2021 08:45:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF49EC58D5E;
	Sat, 24 Apr 2021 06:45:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B7B4C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Apr 2021 06:45:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B293161930;
 Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619246734;
 bh=/R60wucnhMxzatTcaaq6aX+wA4KyHRrla+Ogrsx7GxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fGxOGCEDw7emVbfmqcy/LRzHXKZ0GH+CzQmXW5EnGtQthu9QU/SBU5ZgEqwxxWiBc
 FbCDMuoeky+RsOMkSAeO5JNJFDIqX81lKc4pvE1ROLNClyVSWFPaSn1sPswhnJo/ag
 dRRcBRodIRaIzFlJjN9Rta+T110d7QJ4//BaNnsxhEh+GzPPwY5dh/xUT3JxIRhAeA
 G8HwF4R+D5ia7F8B5r5ohnPG08I0H0qf5A4GsgP8aULQa36mrqx37fz1YSPKkqzbBr
 BadhMMj2VCywfwH8/PJOshLrP6jIQx7oi8AkuDlYoEK3S532SoeYCV/+6KY0215mke
 qmGNFXbzCkUcw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1laC2n-004Jhk-BC; Sat, 24 Apr 2021 08:45:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Date: Sat, 24 Apr 2021 08:45:25 +0200
Message-Id: <c3fdab46e373c69bdc88edb0efffce61cae06929.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 mauro.chehab@huawei.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 75/78] media: stm32: use
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
