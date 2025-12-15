Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC23CC17B0
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE7F9C8F261;
	Tue, 16 Dec 2025 08:10:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17B31C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDFC44429E;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA977C19422;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765809005;
 bh=wFu7HDRMAdpVlowB+kOuTDIm7pWaAUtn4h3uu6I0uGU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=mVlvm8DG13DHRlf6pbQ0CwxjRX7e1QBXoyQ4zS6YYr4pwOUdlWxurFqgBKXGDtIsG
 Ez78EesXd/mLsNT5lLW3o2DgVPlG8fXDRuygtDjlC154UDHiNbkrgyxRkos3ifCrnm
 BYtZfmOevor613ejDsdJLsT503qrS/i3kIiDOeI0rCKtyuiSExeO4oJtDzwu/jXQoq
 QfKqhMSvajMBTbvKgpO1/iae3BGh4HstWrVKUe8Z+MhE/kjrUYyIs01+Tg4pvauLLH
 RQNyuEVC+c2Ed4ZKOOTFpQoOSzRoVo/n+/bg1jVEOYLMn/IYYduvNv4iePGnlhqdCk
 44CJUh4W1+RoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBDD5B16E;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:03 +0100
MIME-Version: 1.0
Message-Id: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3xHAswUTtGvoQ6NmHBshFsBrqnYL61pqa0b3OMWeB7I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrnuNSlCDEp3U0AMCL9StDPaBZkQm8UpZo5
 tdO7QEjWDuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 ctYxEACflPTTG5VIeyFgwBgtxU3aAkYDozrwSyYm7rqhN45yyb+3Lj+UkzWI1NLtbuG1vk1o8Ql
 wcRbmjLeFtLKzOWvGprKN57MWOeQRduWiYWua/ZES83aVbK9SekWaxB3r7CAdMrPwjegBrDu7Lc
 cJDIz3yMv1AIEpwlN/eNxj85cpJP7F8+URLSuwE4NEGZcQ+AS/+nOmG0ri9WXvMz1WCs7GwZSL6
 AbOfbbHS0NVVJnSI0BqY1IlSzqBeQl9JSvGVqxgPiWXatmDFaWw+R/MDOiD/Eebfg6/S6onh4+Y
 K7ALIXs8jyrwovmA1FU0vVeHi/hRTvfQONG4G4r1vM4XceEVZyd8u4VHoN7O3M0RGIpxRa+X48/
 JYrrw0Bfe7tNzsl/m6tin9niNbdOQ6IULtAfRbA/E2PVaZDvm5VYRA5bIbb9fmWTnARq0vjshS9
 Cdk5P8sbVjT9Z5AACXDF/0cMszhIU1lnq6NA0rfIO2wfqgPqTPOI8sRdld2lnG0rz7F5NM/Pc6X
 nioeug9YnEXFUKhdPAfEGq/xFPNyE6nukMO9zV10WU/Duc0uE1n5gapGiXvuiwVUlbn+wYGhqpx
 D8vVJvrBlXjrtEtD15BONuFCNhJLSfMOrccvCSbTWRQyChqsrIOVVGkMHzQgZknDgF7OMM5pXMq
 kci2Br62lLhawTw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] Input: stmfts - use sysfs_emit() instead
	of sprintf()
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Petr Hodina <petr.hodina@protonmail.com>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index ad363b3c344cd..4b166b0a9a5a6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -410,7 +410,7 @@ static ssize_t stmfts_sysfs_chip_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->chip_id);
+	return sysfs_emit(buf, "%#x\n", sdata->chip_id);
 }
 
 static ssize_t stmfts_sysfs_chip_version(struct device *dev,
@@ -418,7 +418,7 @@ static ssize_t stmfts_sysfs_chip_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->chip_ver);
+	return sysfs_emit(buf, "%u\n", sdata->chip_ver);
 }
 
 static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
@@ -426,7 +426,7 @@ static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->fw_ver);
+	return sysfs_emit(buf, "%u\n", sdata->fw_ver);
 }
 
 static ssize_t stmfts_sysfs_config_id(struct device *dev,
@@ -434,7 +434,7 @@ static ssize_t stmfts_sysfs_config_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->config_id);
+	return sysfs_emit(buf, "%#x\n", sdata->config_id);
 }
 
 static ssize_t stmfts_sysfs_config_version(struct device *dev,
@@ -442,7 +442,7 @@ static ssize_t stmfts_sysfs_config_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->config_ver);
+	return sysfs_emit(buf, "%u\n", sdata->config_ver);
 }
 
 static ssize_t stmfts_sysfs_read_status(struct device *dev,
@@ -457,7 +457,7 @@ static ssize_t stmfts_sysfs_read_status(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%#02x\n", status[0]);
+	return sysfs_emit(buf, "%#02x\n", status[0]);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
@@ -465,7 +465,7 @@ static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->hover_enabled);
+	return sysfs_emit(buf, "%u\n", sdata->hover_enabled);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,

-- 
2.51.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
