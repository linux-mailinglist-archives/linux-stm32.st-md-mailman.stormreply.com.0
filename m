Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 195421EA8BD
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7262C36B0D;
	Mon,  1 Jun 2020 17:56:07 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62C58C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:06 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a45so176719pje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGa03lX7GA8URIieK7PnLLIsoaCKdhXRKV0c6GJ73tI=;
 b=fHad1ZlRXRd6UFFqcnWYGebp/1qiqu6I6YG7lmTYQPfLmvzU3ili028ezh0WLK6pL9
 Soka818wrsXboZC9AvizDk68exysKOKDQ1RcJCPKrE+/0vdSZ/cmiawUXYna4OKrGuv8
 tBBUKyqOoaSXMrxEoXGWa+62ZlZXjm7bGFY5nIm1riaCWiEDMRngQrWDF45EXUCBin4K
 ZyX2u202Adr0pTbCPrmrJOn7CDMj65Tcgy6v/bALMyxvMBhv/9dfcX6yUpJTZ/esArXm
 QzGuovIftcEXt3zk1WrFNj7qPB6ldEVUAqa4wN8mb2ouUlCm02CQW4ojpI7EKCJiXb1S
 fbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGa03lX7GA8URIieK7PnLLIsoaCKdhXRKV0c6GJ73tI=;
 b=Qam5gpQhdId9OkWFrD7C/V17Xenkup80iSbfLeQlRoGlX37uB99tQvzarzLQ0HnLsW
 Xby9e7EhjLAXpDtANLWFVflTJW42wnaVOqRNYPohpHYL4sfjgRqCJEZ0WSHVwS+rHS5Z
 wrW0hpTAldiTQYP9RKj01jiVTr4Yo9F2L7ohf4++w/QIAcLTtiKEYbfzqWSimg7no6Rp
 pGgf4CxYyPYjhFp6M6SjUXSUeLyRWdAfgt3glntqsZAGS70RSdHpha4bCIbR2TTMD+0q
 YB5fv3/kid7D7jTW1FG5sJGKwWhFsT2uywHAxkOmkAxn3DHZgog/pltGVjWKIW3QjUtj
 3uPw==
X-Gm-Message-State: AOAM5329P/qTAuw92v67LVVwSiSrlOq77x1nHbqxxO/JTsizAizlreGe
 IcIl1IluL14gxxwduXHSNNNLDQ==
X-Google-Smtp-Source: ABdhPJxo+rRAuznsmQHkRYV/lgJKQUgNvxDihegVF54QvvvmZmMN1dJgN7m3M9TYTxlxRQLGujQuYA==
X-Received: by 2002:a17:90a:7787:: with SMTP id
 v7mr598171pjk.199.1591034164890; 
 Mon, 01 Jun 2020 10:56:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:04 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:49 -0600
Message-Id: <20200601175552.22286-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 08/11] remoteproc: stm32: Split function
	stm32_rproc_parse_fw()
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

Split function stm32_rproc_parse_fw() in two parts, the first one
to parse the memory regions and the second one to load the
resource table.  That way parsing of the memory regions can be
re-used when attaching to the remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2154c8b90a2a..9316ce3b03c2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -212,7 +212,7 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -265,6 +265,16 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 		index++;
 	}
 
+	return 0;
+}
+
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret = stm32_rproc_parse_memory_regions(rproc);
+
+	if (ret)
+		return ret;
+
 	return stm32_rproc_elf_load_rsc_table(rproc, fw);
 }
 
@@ -692,15 +702,20 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (state == M4_STATE_CRUN)
+	if (state == M4_STATE_CRUN) {
 		rproc->state = RPROC_DETACHED;
 
+		ret = stm32_rproc_parse_memory_regions(rproc);
+		if (ret)
+			goto free_resources;
+	}
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
 		ret = -ENOMEM;
-		goto free_rproc;
+		goto free_resources;
 	}
 
 	platform_set_drvdata(pdev, rproc);
@@ -719,6 +734,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	stm32_rproc_free_mbox(rproc);
 free_wkq:
 	destroy_workqueue(ddata->workqueue);
+free_resources:
+	rproc_resource_cleanup(rproc);
 free_rproc:
 	if (device_may_wakeup(dev)) {
 		dev_pm_clear_wake_irq(dev);
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
