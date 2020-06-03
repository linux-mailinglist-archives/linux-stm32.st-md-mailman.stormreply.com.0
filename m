Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6E1ED62F
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 20:34:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51AA6C36B21;
	Wed,  3 Jun 2020 18:34:25 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DF84C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 18:34:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s18so3449760ioe.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=57Tbh/vNYp8Z2Y2yrLwm25NVhHK8l73BmbXVjFnRkLw=;
 b=pUvnbtJgLEQazQZOyd1+rITOwOP5uHA0kod+Y19gDu0JQk7PiZgblEN2KHt/kVaor+
 Xj/rstoCyFcgqvklm8OxJjacZwMeHrWMswXjC2r4F+N0yvvBVwpcaORzBFAcimZhooOj
 uARgG/e0hWj3VjUmyygmuOYpIZZD6ho4pdcy1owLNMG4+LbeRfjIEhaV1AQqbz7KTTgF
 6PmA/7JMKGcU97C5Myle0WSO4sStNv7+9OIoTbp8lt4wH1PDR36cNVy87NVlnNnniQfZ
 GMaKgxDeHjx/HqBuyrXIUFEz6KrG4lieMtIyfGLmAxXjyXLgSOJbA3i3hYrIrbATAZgW
 qkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=57Tbh/vNYp8Z2Y2yrLwm25NVhHK8l73BmbXVjFnRkLw=;
 b=HysvoNjgGspnCcFJR0Wi6sBxi1InKsGus4vF5CpRStbekfCECCpaOdfQtgcmKy54kK
 xht5rGhxurzOby4998mr1x1ZagdoW8OlJVMKTeQe2xjoepHacmeSFc0rQTnyCayb3jft
 rX79BS7Q7soPSMY0DVUvZKIDUerRlsjlwEwpIwCdwtYydXw9YMsxaboHHfTNIgHXAvxL
 nGi9s5Mo2KobMASsITiUURRhKzKr+/uW7AdUG66It8N5NsLXuYtHoZdoNLqhW/EGIB1o
 4Z3Pj5Q7K4sZWTPWii8yBk0/uX3eql2aqAwOyR7FL1lFDDl6O86VAqSvmG3vKe4YPyey
 J2Xw==
X-Gm-Message-State: AOAM530QusPIXF9cz2mEYqmZiDg4BZ2Wo+KRcpzS3dNJFvR66/k+NqB1
 +3qkbwIpREAXNPlypAPcLA8=
X-Google-Smtp-Source: ABdhPJxLIWC1I4Cme7nGbQTtDsJkrK6nxiGSfd+zgYibWXQbzGeLUy/MDQWIW9M67LGwWq1uEyshDQ==
X-Received: by 2002:a5e:8305:: with SMTP id x5mr953041iom.47.1591209262037;
 Wed, 03 Jun 2020 11:34:22 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id y2sm158589ilg.69.2020.06.03.11.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 11:34:21 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 13:34:10 -0500
Message-Id: <20200603183410.76764-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
Subject: [Linux-stm32] [PATCH] engine: stm32-dma: call pm_runtime_put if
	pm_runtime_get_sync fails
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
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/dma/stm32-dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 0ddbaa4b4f0b..0aab86bd97fe 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1169,8 +1169,10 @@ static int stm32_dma_alloc_chan_resources(struct dma_chan *c)
 	chan->config_init = false;
 
 	ret = pm_runtime_get_sync(dmadev->ddev.dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dmadev->ddev.dev);
 		return ret;
+	}
 
 	ret = stm32_dma_disable_chan(chan);
 	if (ret < 0)
@@ -1439,8 +1441,10 @@ static int stm32_dma_suspend(struct device *dev)
 	int id, ret, scr;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_sync(dev);
 		return ret;
+	}
 
 	for (id = 0; id < STM32_DMA_MAX_CHANNELS; id++) {
 		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
