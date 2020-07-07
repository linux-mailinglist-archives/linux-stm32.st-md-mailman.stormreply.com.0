Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F764217A6E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CCCC36B2D;
	Tue,  7 Jul 2020 21:31:23 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A05C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u185so16943989pfu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lt6hUGBu1W7gsJ62+tKE3hemun/1WgbhEsuA1Og1vF8=;
 b=EYA+6vGb/dMe9sd7/qMvUrBIuiCU2hyLidvuwJvMVTaVq7cJfuCekg36Ms2kRMi08U
 6yXLvuXAolskKfdtO1Kut8RhdLL5mPrSSkRzXdDo8V6v03M/b2a8sTYMy+zeHW4x+XNx
 A1RJ+1yVSpdbDPAFSUYJuDofNh3IrjQF0YAhPGrxQeJzyj6KYzz9J01cNkW1FIfEOq2B
 ZfT/JtOeRUnX94GOiiFdR2XOHVHfcCG5ApyDEh4q77/HJiNqgNK3Ik+9Cl3N2HiwPKXR
 aHl1WOcih1ambPW3OyrNmvKYprl1TgbNrDbwJXCIthofRqHwGqHD2W/Ofyb9O3kKsd+T
 WN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lt6hUGBu1W7gsJ62+tKE3hemun/1WgbhEsuA1Og1vF8=;
 b=SZlu3qZvv0uzWoWJ2pPUHvrqEPT/+O85D1kuixc3FL20jgV4he/tbJbdH9Teex4qng
 J1CSVnUsGAjtLFemu+xsq4J/3LE7LbBEUlFee4M1lVLacsMYbp5MxHCGDr1ZG+6FMhOv
 krNOfuaN8uzHxVALNo3+qSOnYxplF9xIutgD5Oa37xrfiz/utSlDjk0ZnbP2IxyYXdOt
 /nej+7E78WI3CxmS1RGuJrr13Qvts2ej4TPhrR/c3yZ438SOyhiNbU9RwlJelCbbobhL
 xqGoQOlvOW99X/E/6l9Hp6xR43E570CAQy18FWoOy96EUu5Hs9q2DgQ3Zoz6fE0Qv4aZ
 8NYg==
X-Gm-Message-State: AOAM5322nsRCZvWxnEjCqpEFGdGrXw7qtMAPAt/A767ikoih9OUanv1K
 I5rBfb177ea/SYY0axvI+wfyxg==
X-Google-Smtp-Source: ABdhPJwZ/wF7h8d7pCKt8rGnuyo24lrnRwS6wYuDGgfzl0bj2KI5KVsQvHU3bXAD6dcZ+syoMsQ7ng==
X-Received: by 2002:a63:8c10:: with SMTP id m16mr47225696pgd.149.1594157479588; 
 Tue, 07 Jul 2020 14:31:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:19 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:05 -0600
Message-Id: <20200707213112.928383-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 04/11] remoteproc: stm32: Remove memory
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
index cbba995a80a2..986f34a336a7 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -607,7 +607,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(pdev, ddata);
+	return 0;
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
@@ -634,6 +634,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
