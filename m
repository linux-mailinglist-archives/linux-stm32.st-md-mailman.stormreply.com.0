Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C18EC4F701E
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 03:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FCDC6049C;
	Thu,  7 Apr 2022 01:17:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBCEAC60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 01:17:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B359C61DA7;
 Thu,  7 Apr 2022 01:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168E9C385A1;
 Thu,  7 Apr 2022 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649294246;
 bh=0naOMxH3Ws/cN6Gr0znKiOXtUMhUhuBDe3no0f3cIO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXmLMNfBHBbq2i1uzAR6AjGJz4MqREYVRUhSXY4P7iAmYUe2u3Fda1q9tbcS7ugtI
 qLy2lgoijUdwh8jncUMlp9620iFs6DgBubFCjjSyTh1//tjWDv9NsS7wh4v2gRLkjc
 xCb5uIj8Gw4+1K+vTw6ro3N6DddtjpeW0uZCQtOtb1Tl7qdYj+LeIb233+P1rBYekw
 +5dKA0rE1PMSZZvzhogGdDUQ+E0ckO+eY6t1VzoqYQKBRCnxk8KDl6KFWQK6MqVSbg
 avi/tkrcK60/PAJtx42f3P/3NprZwMF4SvXT3TC7Uyk/UiPk9A3DnyR2cnW9/e/jHg
 SaNXLEWlW/Qqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:16:42 -0400
Message-Id: <20220407011645.115412-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011645.115412-1-sashal@kernel.org>
References: <20220407011645.115412-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, mcoquelin.stm32@gmail.com,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.14 5/8] Input: stmfts - fix
	reference leak in stmfts_input_open
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

From: Zheng Yongjun <zhengyongjun3@huawei.com>

[ Upstream commit 26623eea0da3476446909af96c980768df07bbd9 ]

pm_runtime_get_sync() will increment pm usage counter even it
failed. Forgetting to call pm_runtime_put_noidle will result
in reference leak in stmfts_input_open, so we should fix it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Link: https://lore.kernel.org/r/20220317131604.53538-1-zhengyongjun3@huawei.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/stmfts.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index d9e93dabbca2..9007027a7ad9 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -344,11 +344,11 @@ static int stmfts_input_open(struct input_dev *dev)
 
 	err = pm_runtime_get_sync(&sdata->client->dev);
 	if (err < 0)
-		return err;
+		goto out;
 
 	err = i2c_smbus_write_byte(sdata->client, STMFTS_MS_MT_SENSE_ON);
 	if (err)
-		return err;
+		goto out;
 
 	mutex_lock(&sdata->mutex);
 	sdata->running = true;
@@ -371,7 +371,9 @@ static int stmfts_input_open(struct input_dev *dev)
 				 "failed to enable touchkey\n");
 	}
 
-	return 0;
+out:
+	pm_runtime_put_noidle(&sdata->client->dev);
+	return err;
 }
 
 static void stmfts_input_close(struct input_dev *dev)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
