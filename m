Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF31EA8B8
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 500C9C36B21;
	Mon,  1 Jun 2020 17:56:02 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A90C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:55:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d66so3827141pfd.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mt1xsDxJMbdYjwmldK7j7a3WkNUGnKAAzigiHh0OZYk=;
 b=u5/FuQaVxT5K7fVveXroKYGE2Zkc2ldozzP6SgKNozz77UeMbxAqCMvbgzVT8RVLFA
 Scg4NCGQT4Sqz9xEoi8yNghdiu3YgMMNBjOvFgSkBZD2e3V8BWngoTlOfX0OSbxUXBAR
 N7yJa2o/eGXN/O4gAijAldki0lalo/I7xkj1OwnLQPDaPI59ltWTcV7QeAH1Nep5jYOZ
 c4vMH+DMedwZSIqH2iJyjH0t/8loYGv8Uk3bIdG4kC3BU1jafTVZmZyWJBJelJlSwy/l
 Nixoyy16uXwvpYgUYsPModiPoxQA2EJwhA3SbYihK5ht40Ag4OMwVIxvmW19nWOiTzrz
 uBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mt1xsDxJMbdYjwmldK7j7a3WkNUGnKAAzigiHh0OZYk=;
 b=RCmFErSh3alLsinKVLKEnNG9utEaXReIQj3+pGHgaVS0a9f+HEdVEIZ2KJZC5SlqbK
 fjWqM54U8B2yBXNPBr2yohtt9X4vRuWTslcsx9Lo3wqGWxMFdlZZjFQqKbcGSzrUHLjB
 CtUirXdgSKJ9jgvCBeeE6+z1a3T8HM65x/MSfrLZmulqqq47xKNqO7tFEts7VT0w+GjU
 MPfxw4JRZvmVKFd0f2w9aGCM8xVdgSqHP4x6TsmafGumrKz23sWqfkACLtX/Is0hmmf6
 PI2DUfO5c/NUIP0UGUI36Cb/6sRxbn9WqFgUo80hXbMowV6vAA/K4B1PPuS798VXXtZs
 JA/A==
X-Gm-Message-State: AOAM533qaIXp/hq3mBRsXLOzA2vpkv8WnVHesZ5jsoCxOB9dptvde5Fs
 RzxeobZSQTJqXfcerclOCNd+aw==
X-Google-Smtp-Source: ABdhPJzE2aa5iEK5faj4x4YJ+CgK8FSIvkIzTyWsM91Imyim08uFbh4bfBtcgO0gJflpEkMgLor8XA==
X-Received: by 2002:a62:1e84:: with SMTP id e126mr22019473pfe.67.1591034158196; 
 Mon, 01 Jun 2020 10:55:58 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:55:57 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:44 -0600
Message-Id: <20200601175552.22286-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 03/11] remoteproc: stm32: Decouple rproc
	from DT parsing
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

Remove the remote processor from the process of parsing the device tree
since (1) there is no correlation between them and (2) to use the
information that was gathered to make a decision on whether to
synchronise with the M4 or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 94fd687fb5b2..1e512ddf2591 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
 	return err;
 }
 
-static int stm32_rproc_parse_dt(struct platform_device *pdev)
+static int stm32_rproc_parse_dt(struct platform_device *pdev,
+				struct stm32_rproc *ddata, bool *auto_boot)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct stm32_rproc *ddata = rproc->priv;
 	struct stm32_syscon tz;
 	unsigned int tzen;
 	int err, irq;
@@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = regmap_read(tz.map, tz.reg, &tzen);
 	if (err) {
-		dev_err(&rproc->dev, "failed to read tzen\n");
+		dev_err(dev, "failed to read tzen\n");
 		return err;
 	}
 	ddata->secured_soc = tzen & tz.mask;
@@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 	if (err)
 		dev_info(dev, "failed to get pdds\n");
 
-	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
+	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
 	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
@@ -626,9 +625,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
+	ddata = rproc->priv;
+
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
+	if (ret)
+		goto free_rproc;
+
 	rproc->has_iommu = false;
-	ddata = rproc->priv;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
@@ -638,13 +643,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rproc);
 
-	ret = stm32_rproc_parse_dt(pdev);
-	if (ret)
-		goto free_wkq;
-
 	ret = stm32_rproc_request_mbox(rproc);
 	if (ret)
-		goto free_rproc;
+		goto free_wkq;
 
 	ret = rproc_add(rproc);
 	if (ret)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
