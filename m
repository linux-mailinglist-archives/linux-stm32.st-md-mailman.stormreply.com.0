Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A211EA8B6
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:55:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D204BC36B26;
	Mon,  1 Jun 2020 17:55:58 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B0BC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:55:56 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q24so171448pjd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiaQOah0tkVij5o2XB19f+57g9nxyi9Dr0rKn4GNNWo=;
 b=JAL0xv+J0eDQvIWE9P08dNSkHM11snhLNWBIKigP5OWrAyaQOl2aH7kIY4OQZ65Itw
 txVqAp3KExHzk+qIz30vM58NovUzH03bOLTvfdSdeZlodE/khP02rrMkEZV/eLl56XP0
 1NmD1KVXjuzjkrg/5zNfF9BUTz9vJVkkIJcRJ5XVGjMtsm7XbrBbP/3YKn+m3N++ZtM3
 6yuvhHwsQm8LyueSGhn9P6nyA9bjiWn+eLsYNJUy7rGTqTRKPZ2zV+RMt02baecdKX9m
 KJtzqPdFRzaB/xlrbKEl8YVhHRy1h+XuYLzDOLBNycDzgSiN/BJE7J8TWnyJCGWzuX7p
 TIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiaQOah0tkVij5o2XB19f+57g9nxyi9Dr0rKn4GNNWo=;
 b=NRl7C3fT77Aaa3Iz0GhzfEiuohtBOwa1S+ciM6Ymqm6Yn5zeNoGpoHod+MubqdKdu5
 SglD5ahxm/1b8HfXfyhPfYSIlNzuXpjf5/d/sBM6RR3XLK6N3rDAUoUdI1tE0/ESpLUk
 /xIhWNkeCr4XopoQ75+KlHEhd2IFbdt715QExUKk+od90ChVDRt0LDRhCpXcDNDPbTnK
 3Eg7ufWzPfc7aKygT83TzFYb7FGMkccKI3SfRBr444rqYTl4waP0Iet1PC2+0igV1XWi
 W2lBCZ6qWepnSho5XRBT8NnooebR4aZTxH5hTl/eyOaUGHbcvczKBtUQ++vNF604xof+
 Mymg==
X-Gm-Message-State: AOAM531YlAKgGDTynBhLL0JxZa+Xtp+5LFnZ95Itym8P9uBqsBp0E+Di
 kVlwTx4+c4Je1VrwTfi+FR3DTw==
X-Google-Smtp-Source: ABdhPJwCeQOCr89X+QwuX83o1+B8wMZb1kqOYTtx1WnyqkdzZeWW1Be4A4m7ZXhsCX7hyj9yIQeS8w==
X-Received: by 2002:a17:90a:6706:: with SMTP id n6mr621042pjj.13.1591034155457; 
 Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:42 -0600
Message-Id: <20200601175552.22286-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 01/11] remoteproc: stm32: Decouple rproc
	from memory translation
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

Remove the remote processor from the process of parsing the memory
ranges since there is no correlation between them.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index f45b8d597da0..a80733fb08e7 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_of_memory_translations(struct rproc *rproc)
+static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
+					      struct stm32_rproc *ddata)
 {
-	struct device *parent, *dev = rproc->dev.parent;
-	struct stm32_rproc *ddata = rproc->priv;
+	struct device *parent, *dev = &pdev->dev;
 	struct device_node *np;
 	struct stm32_rproc_mem *p_mems;
 	struct stm32_rproc_mem_ranges *mem_range;
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
