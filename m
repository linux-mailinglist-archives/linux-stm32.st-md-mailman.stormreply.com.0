Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C931EA8B9
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A95DBC36B23;
	Mon,  1 Jun 2020 17:56:04 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AA45C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:01 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j21so3840525pgb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5BZPTZAmXxklJpoMRb5vD0GYMFXpjrq4/dihvCieGA=;
 b=oGDezAuwIcD3h/JVFiFkScpwzDR7DBlQ3K82qjR89+nwgkSaq0E5YppwnXKytVSlas
 dl/hRrPjMDN0njFWBVSKAVG8aR6rmRXgaxqwVvmhmdk2DKf6XYFQIaf9Eavl3reRURgG
 4VEQIvfKLORMIIs35V5Mm8PL7qzFCVvr+tQ1uxZG6vBedJTKCkDSH6rRJC6hMMaRqZEO
 Y1YAuNKI1gQ3YObz3ty3IXa5OyI1bnIprq3f84lh9LlQnL03m3dce8SwO14bW/NuHYM3
 5FXETrADg+UOjJ5EoctZZ4Ix7VbLhchbCdEu3YuYtK8CejO9iOCwSu3PY5LVK5LaBEhj
 yPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5BZPTZAmXxklJpoMRb5vD0GYMFXpjrq4/dihvCieGA=;
 b=VgGFTZLcmRQ5A3LFi+jjACrEEiCRqyWZeh9/emR9Rjd9fAl2T+F8ZbjXtL/S93VhHA
 sUwEPH2x9w6NqNEW6QpBG9QxZNq6bXeb9mcqVTGVTreTn638iCh2lZ4CFrtxHeFUXxP8
 LGPDMBD+YVBJQtQRuddYZxD/e7ghqgXJ/X3LFNJ4W2ZCNWXdavyt/0g5juGeu5VxikAC
 OCx344laQJLjdcOwgXtThZBLM4za1YwfAOWNi0HqyfOqOSfEv/knymGIuSbCkck9F4Fd
 OZPEUnKOQSfhO3YSC60NHBYcprgMSxQJGVZV6W6XngztIFGlzAnAa+0AOeJ0CHkkvmhe
 vPPg==
X-Gm-Message-State: AOAM531NB4eqR3KzszOP+KtStQJDZsZT/V/hZiS42H6sV45HjJy0Lot8
 +reQ4UmVzOrtMYe/3FPbtuc19w==
X-Google-Smtp-Source: ABdhPJxrhPzy4O3NyPsLmeg5/fP9w0+e83//FkVHlGYJSYKm29+DOBd/ogwZCnOjBob1eTm4pfRdqw==
X-Received: by 2002:a63:3c11:: with SMTP id j17mr20781628pga.70.1591034160056; 
 Mon, 01 Jun 2020 10:56:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:55:59 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:45 -0600
Message-Id: <20200601175552.22286-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 04/11] remoteproc: stm32: Remove memory
	translation from DT parsing
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

Other than one has to be done after the other, there is no correlation
between memory translation and DT parsing.  As such move function
stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
stm32_rproc_parse_dt() can be extended to look for attach bindings
in a clean way.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 1e512ddf2591..3e3b199a02c1 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(pdev, ddata);
+	return 0;
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
@@ -633,6 +633,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_of_memory_translations(pdev, ddata);
+	if (ret)
+		goto free_rproc;
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
