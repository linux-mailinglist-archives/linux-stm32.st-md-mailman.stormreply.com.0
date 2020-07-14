Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA721FE05
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:04:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BACE6C36B2C;
	Tue, 14 Jul 2020 20:04:52 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988CDC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u5so8044503pfn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
 b=ZEGVgZAw1WowmoNs4YtaxMkX8J3P+N+cEDsqj2D/XXL3ERgqiuUzqEElWdgsEZ8j36
 zHiG2HGWu2JXaLB2A3xNpmyRyfw9+5DVk5xkuFncPHh6GsecjkGYzKDfoCvsr7NzvB6h
 AhWrjIM3vSmnTLXNiwYgH/HgZ4wI2CKFwMcHeck9ekgqt0DwiG6WhEof9haEdg+XSFw2
 0Rr4G9EehYJ+TH3AYiZg+AnU3lSoARmcMnC4mVbSI0QSu4BzFs7rUQhXe8AVmElKIIKs
 /JNNwqja46P/E1NAbtbiJ06pPbhDQ+wB0xLBjU3yChF2DeQpQ/So9otApPKrYdSceMxq
 bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/h+lVOr/RBj1CX1aOHHsCmrTQA/AlJdomb+YOh2q4g=;
 b=bCOfvtMowg9ZW8ImuCNMkaqrxwKk8GctdJHHh8ucSXWl5WiktesgZ7l/bnVLG0fQur
 sp/xpWD9Z9pSTaROD4n3Z1k2Su6WBn7n4ql2Lpz1E7rFWZ4YiufwaLBUoH9d4qn/ZY7M
 evQVwksBpgojGqGocnV7pSmq7NdTUzN8riOaGpeD1x1OH8mm2vw06f+HI3vcNS8r+tsH
 wo2mFyVfXvkUSrnpHuqLw1XIb1oKhxeVUZCXvWpplcT+DK1gOuZSVjV0bRisjt7tY35o
 fBHlAHKIsum+yPZlpOaOWQxkb5qBmPp+TqIMTC3mYacEJ1C0jwX0BBEEi0s6KyysXQPf
 bPcQ==
X-Gm-Message-State: AOAM530TfA/DoVZtoMszJUBZiv18aJ8wIQhwvi9cQp+KJ/Lkp6sCegX/
 54l51AjHi52+ac/GVgp8/SLXqA==
X-Google-Smtp-Source: ABdhPJz4I703eNXUyqpSyP9X2805DzU2nM9L+TbgHrqWROsz+GKA0ZlPW9Yew1EIKYBdjAzccbF2Sw==
X-Received: by 2002:a63:c447:: with SMTP id m7mr4654907pgg.118.1594757089129; 
 Tue, 14 Jul 2020 13:04:49 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:48 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:35 -0600
Message-Id: <20200714200445.1427257-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 01/11] remoteproc: stm32: Decouple rproc
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
