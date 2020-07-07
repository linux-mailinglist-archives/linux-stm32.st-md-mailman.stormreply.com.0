Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B1217A68
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF2EEC36B2E;
	Tue,  7 Jul 2020 21:31:18 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C397C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 72so6692456ple.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
 b=tcnXdAvzX03mqCigv8Jy421RijVdkg0ecDvQfyDHz2jEEBlnhbfGivOaU/+2s0Pgmn
 3tsdKfEC8PhWGEvoDo/I6w9YedSWGtghsgyLEVpOKCtaBncu3pYmX1Z5yYuxYCYNOtSL
 uQEGUnCE3qyhanG0SciQRhdQq+J8NodcGwvE9gKvYIkPy7sfRa7Mo1p+NV6V0WtJJN4F
 /Wq/2FO5r114g1JCNjdWfNjqp40FwSjTf1wX7uNznIqmQeEvtY1IxdeFAjJo7TBSI1Tn
 dIDBHMmf7HY3He0o/5ZMIImkvc/Hv5tJdOlpu8GoHrW0rg/ctMq11cGahf7RfgFLai3Q
 WKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
 b=n1AkNP272Zxz/wKVug9RCfR9Dyf9ln3x1cIOxQQb1rqgCC8fLJCcHGnH28it7E+kLP
 lMPsrOo3X/8Nz1GEJO5zUlv/OpHBd+k9XawlRNDYVkWqp5GQEf+x/0zpVpRnstffburz
 tTMzl2mXXpWKdUlgax3Dj1YxNVJHedTkzRqwXhxSLxCEabe8iD6ufK1/tX/fLIvI+2zC
 17/MbnhFuELjo/3V79UFQlJ0xu38oLfvUWr2ssDO0/wfRICHTULnV1f6NJuUb9thEE/v
 84YwJcZd3kgvC0Qnj3Pguqxzhje2PD1HOyAgpOnJzfPcDToUeISdpMD1udJ0c23GETgQ
 WuYw==
X-Gm-Message-State: AOAM5337sDtoBmF1iAuiwYYjOhoPsQT9SGdyX9eFR60AgC6AGNcr8T3z
 UG4ROz++zksByyLBZMsER3RWoFXCXC8=
X-Google-Smtp-Source: ABdhPJzxps+cB0xsIwcYtX4mckhbPISXHLhDLBza/r3J8rLtrIUt/l/0xypzOFeCzqE7blRJ7NQWVw==
X-Received: by 2002:a17:90a:6948:: with SMTP id
 j8mr5811255pjm.45.1594157475841; 
 Tue, 07 Jul 2020 14:31:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:15 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:02 -0600
Message-Id: <20200707213112.928383-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 01/11] remoteproc: stm32: Decouple rproc
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
index 062797a447c6..2973ba201c1d 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -128,10 +128,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
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
@@ -607,7 +607,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
