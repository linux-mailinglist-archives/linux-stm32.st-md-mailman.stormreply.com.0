Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847FE4FD275
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 09:10:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4798BC60496;
	Tue, 12 Apr 2022 07:10:39 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0709C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 07:10:37 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id s4so13036181qkh.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oakkso+e+qhsN2ZmTPlz+KXAhhWn3wzRJANvdCpqxYk=;
 b=Q+HOoAU3/nLyYd9yfYUohPKt65udJu10tbdVwUJryH80QoNi65kxmmTeCr9w9bzzlw
 9+CcPTMIxqaDMabg2+1y9dXeGATDuh201jif5CmGHIeqDdX0cH6DbiImoYLmwC/lc2jl
 R/wSyhKXfQMCMUFavhPHAShEs055XqvOqGD0YXq3jA8L/pEcv1WjVETenvk1nthFTAUo
 zismcqyOqf+cfe2yh4uTtdBlq9bnut9NBhOM0DBK2RoAZzSFxc8remZ/aznsK0JCKl+g
 Hv/5GL8gyYCqSaLkH6Qn8hXutJ7r2UL3WIOaOwPf0iu26PdDdkLhXONNAT/cCLc8y1B8
 p1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oakkso+e+qhsN2ZmTPlz+KXAhhWn3wzRJANvdCpqxYk=;
 b=vVMQZXqgB2UDGjFTTB3QfpxDs3ZWwY8pk6MY04ucAPhQUmHEp18mmA/hYYis842DLk
 ki7uH4+33oIuW7XciQ218MY1vhsvnuibz8j3Ltun/OjJxZDNnGxL9nwCKQnO/PR0GYAs
 aJ8VaG9yEdDauKkfSLaasd6QD937gyzjPkrXmXgGh1wrstT6X2Zx/bYouUUTw7VG4trQ
 04GK7T9ViEby0pR8vxCOG4ibqonDncij7VOeOHlLM6MskAaZGOuKjOwjNVOep0GJTvCw
 3fJZ3x0DRP8us+48owNJ6qTGIrDefkn1oASoBR39jDtz6XhGP24zOspFPaAfUixXy36a
 ByyQ==
X-Gm-Message-State: AOAM533jHdImvFteaYpnKNMZmAyjLyxNxyQtMWGEEegqxvsE0Yt7VmH9
 lcylxew5CyZjQgq6LaC1isY=
X-Google-Smtp-Source: ABdhPJz9HpruIk48ZvRlIQ4rkcyvLj2AR76zs2UjUSXZUe6ZnqXu1WL6aSY3Fc6MNlZTyztR5C57zw==
X-Received: by 2002:a05:620a:2848:b0:67d:35de:bb5b with SMTP id
 h8-20020a05620a284800b0067d35debb5bmr2092273qkp.499.1649747436883; 
 Tue, 12 Apr 2022 00:10:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f6-20020ac859c6000000b002ee0948f1aesm4653771qtf.72.2022.04.12.00.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 00:10:36 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Date: Tue, 12 Apr 2022 07:10:30 +0000
Message-Id: <20220412071030.2532230-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Zeal Robot <zealci@zte.com.cn>, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] regulator: stm32-vrefbuf: using
	pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/regulator/stm32-vrefbuf.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index 161622ea7259..30ea3bc8ca19 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -44,11 +44,9 @@ static int stm32_vrefbuf_enable(struct regulator_dev *rdev)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->dev);
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	val = (val & ~STM32_HIZ) | STM32_ENVR;
@@ -81,11 +79,9 @@ static int stm32_vrefbuf_disable(struct regulator_dev *rdev)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->dev);
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	val &= ~STM32_ENVR;
@@ -102,11 +98,9 @@ static int stm32_vrefbuf_is_enabled(struct regulator_dev *rdev)
 	struct stm32_vrefbuf *priv = rdev_get_drvdata(rdev);
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->dev);
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = readl_relaxed(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR;
 
@@ -123,11 +117,9 @@ static int stm32_vrefbuf_set_voltage_sel(struct regulator_dev *rdev,
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->dev);
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	val = (val & ~STM32_VRS) | FIELD_PREP(STM32_VRS, sel);
@@ -145,11 +137,9 @@ static int stm32_vrefbuf_get_voltage_sel(struct regulator_dev *rdev)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->dev);
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	ret = FIELD_GET(STM32_VRS, val);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
