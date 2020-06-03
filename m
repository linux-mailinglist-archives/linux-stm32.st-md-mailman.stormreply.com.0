Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E871ED6F4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 21:37:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1453C36B21;
	Wed,  3 Jun 2020 19:36:59 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8BF9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 19:36:57 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id b5so3721970iln.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dIAMuCC/A5PYohN0KXICQjv0ipT40UQi12lhKqfFpJg=;
 b=EhDZIgQUvtrVrX2ZzQDg0eOdeeEkvuoFE2dur2qomJ21YzFSR0zSu+QXLEie+QcWcI
 pqtiRkz0H+cuDyQ7YndIF05da+Uys1LWhKYpHa1/BAQkpxvAUQYuqXR2QNg4ST5lkWjU
 9eTM1MGOQQps6R7rkQUn9PJ8RWxhNIUrSXrAvF1Y54VrRe/WxXMjTUA6/eEklUBoJY79
 tDBNgLnsoaVHFh3lWGZIWv1e+ktDp52tXFkcBjGINC6k3FMwLIO9srj7HwNBAG7A44wx
 kZvMrd/1VaWheADlWPfTFeNq/dy3U19Gi2bSjlTSury3yuen+OXHF6ZOmYfpc8FkI66X
 iFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dIAMuCC/A5PYohN0KXICQjv0ipT40UQi12lhKqfFpJg=;
 b=ceqFzy0NfrqJEyBbEVHy9wc3XgJPNaVUXvqIqKpcvGrapOHN82THgKePLZRiLQn2Ms
 19Cgv/+smxeqMVwtQa7wEN2es7NJ8mHITgNlq/Fp10e1vB7PSVbemPPAmKBR3WKOknze
 Fjeq15XGcXNfDBPuUvPZNrDCCEth/Y+8erSg+abUDim/sZfMRIbHaIPVQoFlMMvlBCD+
 ROBIa79N+KwwkcmZ8IMqUaoUEAxK5TwQZtL4VwY+zPG2HK01kwurholyve/KYBgPV0d5
 q0wPnR9voqSijy2qD5rfP+7ZrNlc9a6NW5zPWkJmE0ZtCWc86qNWIqZjFhAQbQnlSUUR
 CXDQ==
X-Gm-Message-State: AOAM532bBCqFaneT355ckYbtQ6AkTyQSxk4GVpqFMwByrHDkIUZs3SwS
 PFOZw4CpWOBLPk/j8RRXQ5k=
X-Google-Smtp-Source: ABdhPJyXUGwqgUh5G3Ykal7smWbXFaRo45kJz9GNEN8Kg5jD5/5LxA9AaMhMWGkRoSpvtuiq4hihOA==
X-Received: by 2002:a92:9e5a:: with SMTP id q87mr1083431ili.84.1591213016646; 
 Wed, 03 Jun 2020 12:36:56 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id s71sm256585ilc.32.2020.06.03.12.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 12:36:55 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 14:36:48 -0500
Message-Id: <20200603193648.19190-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: fix
	pm_runtime_get_sync fialure cases
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

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put_sync if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/dma/stm32-dmamux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index 12f7637e13a1..ab250d7eed29 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -140,6 +140,7 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		spin_unlock_irqrestore(&dmamux->lock, flags);
+		pm_runtime_put_sync(&pdev->dev);
 		goto error;
 	}
 	spin_unlock_irqrestore(&dmamux->lock, flags);
@@ -340,8 +341,10 @@ static int stm32_dmamux_suspend(struct device *dev)
 	int i, ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_sync(dev);
 		return ret;
+	}
 
 	for (i = 0; i < stm32_dmamux->dma_requests; i++)
 		stm32_dmamux->ccr[i] = stm32_dmamux_read(stm32_dmamux->iomem,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
