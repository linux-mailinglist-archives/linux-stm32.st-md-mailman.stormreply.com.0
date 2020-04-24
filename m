Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 355361B8089
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00B0EC36B0E;
	Fri, 24 Apr 2020 20:25:25 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C31FC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:21 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id ay1so4169737plb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zs8zqxSLmCFU6lZYzSjBYa2nEV+/JbKTSnr0oNB1H9M=;
 b=OBm+YaG5e7Hf79gRnIDBZNaKsh8b7ZMTm3+BICnzVBFchzziucaX2vdz1Hv2U4wWWp
 EcT/3bMOuXUFNAWq5WKuengPx+5y2fcGvHKhTvEZzrMcAp9+kNgx8ULtRQaj1VsNvOpQ
 qj2Yrg8Vn3xU5CSUU+C/M0KviqQ0YKH++EEcCiL3V5CUSo5gfl6Zuwp+cdPpX1BkMt1+
 BCTEf18ioZntEnAvgClbjfDXsHKPgGNrXVRhyrUUGe3RotINDtjIgWezMoHtIKkprwEm
 52k/IRykm18cYzv6tyXkxGpk0acftWHy4zSTQ2/lKYv3MiF+lIksGYegWWlFFILFYXqk
 pNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zs8zqxSLmCFU6lZYzSjBYa2nEV+/JbKTSnr0oNB1H9M=;
 b=At38e8QcvAB8sORUYTJzoLUGNYU3qUHZI+8eYmWA44lhdsbmX+kBeCrj6yffIg2BQO
 +/7v6Tw6sSCHIhzj/BS0mFm2vULlXM+97g0vo6W+GjjROH/PTDs3MAIPg8nMe+cV6L7A
 ejDSPy9lFHVi6UvE8D+l5tJJOxheNAl84uITGVvgJjB2XmizXviXp4+e3onAjukHQjQT
 BtPJN16j8J9o5cIEH2KQYgwXOMZr1RdCvlFbWqcSbVVTwOvZC2lKaJa2f2zK2m4PHuYQ
 puxq4UtOAKMd6LsnaCn97yT6Dfz3cj2P5F+m9ISftc5DP0MjUnscO3ofDz2Qj16lhdSJ
 vzuw==
X-Gm-Message-State: AGi0PuZ9G6p0+bUywS0n8utk/9CRwflJ7IaNyhiSKlYgbuXYzcT7Ejhs
 APmc9XEkg4LTVRcy978wKi5a+Xr22Fg=
X-Google-Smtp-Source: APiQypJU8nTXTveTpL95Js1RKNrdGMPxwTFKK6UCZMwcjKNmAhFJgR4kBO2M3JrCnfwpW1TsGUDwwg==
X-Received: by 2002:a17:90a:82:: with SMTP id a2mr8752961pja.47.1587759920159; 
 Fri, 24 Apr 2020 13:25:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:19 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:25:04 -0600
Message-Id: <20200424202505.29562-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 11/12] remoteproc: stm32: Introduce new
	loaded rsc ops for synchronisation
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

Introduce new elf find loaded resource table rproc_ops functions to be
used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b8ae8aed5585..dcae6103e3df 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -319,6 +319,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
 	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
 }
 
+static struct resource_table *
+stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
+					   const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return (struct resource_table *)ddata->rsc_va;
+}
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -593,6 +602,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_stop,
 	.parse_fw       = stm32_rproc_sync_parse_fw,
+	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
