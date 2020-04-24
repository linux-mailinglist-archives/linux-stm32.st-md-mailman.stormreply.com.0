Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4F1B8081
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2E0EC36B0B;
	Fri, 24 Apr 2020 20:25:20 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44E84C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id 7so4968779pjo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQbiUnUIr9QFPfrMWtrls9xYCut1DTLsNUPTpZeLJzM=;
 b=Gp0+Zj2AsVqjmrkROdpibc9WVlvp7tcdcOdZdQHBsR3UgKeec463gD/gEO3BwUfxId
 4qs80FR5WSpzNR1SqjnslyncQsgieuO8FYOSgr5hwqOfCi41IVUjNNC5q5Zzr6j2I3yi
 KJjHDvIlGO48gwfAIbEwO3n5i2jge5R4cWWMaHUprhq/I4laBl8nmafuy317N+fyZmX8
 gy/EOSGWad5Rt3pnr1KQ/DTkoocO+75wrBOQXlXeVt7zb1LIqqCqbavhbNh3j+XucUBk
 YEIf7REW3jwi9Nf2//7v64N+cSG95iVoOExMctUIfyLuDu0h5IOb/KzEZb2XNtq0cgZZ
 9ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KQbiUnUIr9QFPfrMWtrls9xYCut1DTLsNUPTpZeLJzM=;
 b=PkpWPjagzp7GEyNjRKQ47OZyTqs9FImxvNcw8EZsvAgeehD7inoBoyRbYtuBj74f68
 BNLQP8MK6lgCseAcd/YZMCUmcL6BO+6i5rvSVRCTfqEWFocDbyeqFGyopLC0s6DaFAeH
 KQ5gKYf1aOujIgvuN1GYQy5oQGemOcCCyGk3umxK5YbHQD8jLzbgUJX3UF9d0EE0tHet
 dwf5fdYjPJbAkK3ijoD0apoJPvAPWyxviS8VvzlspO0SHqQsltCrW6TtBkhcoptLAVv8
 5vWxIvj8/lWXieyTmEVpM1V2GZqVhtk/pWUJo/USqBzEOpbz64pCu63qn/mzTcWoMzIk
 WE6g==
X-Gm-Message-State: AGi0PuY+RgRFmn0TxfA9dxYoVDl0uyUP9w6Kzrg3nxlFCG1VT7uG3WdQ
 jayvVnXb6FgjXtTNMCp1wAepGw==
X-Google-Smtp-Source: APiQypIv6YWdkGqDXxYu9zKGxgTIDNuyx5qK9TgKQ6Q3MhTchnZhEiINgsaF5cc/+xunWfpXSGwU1A==
X-Received: by 2002:a17:90a:1a46:: with SMTP id
 6mr8190985pjl.111.1587759916801; 
 Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:25:01 -0600
Message-Id: <20200424202505.29562-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/12] remoteproc: stm32: Introduce new
	start ops for synchronisation
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

Introduce new start functions to be used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8ba69e903851..404f17a97095 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_sync_start(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -522,6 +529,10 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+	.start		= stm32_rproc_sync_start,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
