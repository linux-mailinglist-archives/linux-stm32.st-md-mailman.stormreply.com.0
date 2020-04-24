Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B66221B807D
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82210C36B0F;
	Fri, 24 Apr 2020 20:25:15 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5800CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w3so4159626plz.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrZHw3wDEqsWxtX6I3Qw+OHrqvqS6c3mqgfKBC8xSv8=;
 b=nEIHT4o5k+submU1rUBIRjPzreeeM7YSY4E7V1SEGu5YkKslbOpGjRxk2PVJ0e6xHd
 SXjmkQFR0s76Vs+SIhZbiqdwxsxXClpb114b/0W8uabUhIKFao3OKd1L4nuMX1znjiPe
 qQP7XgxiC4lZLDwECOiQbzUW0fEuqUgbDTn0rw28bGRcuJ7ngPnzqT2ZSGJLoxMn/PxZ
 fffRPF6DxDAFWbgEb6z50zzUw7NNjxuXSWuXCgJJacAYw3fPqEgIUoslVBSEZMjMwBxp
 BI43yLdV4LCUQzNbtcSRkmPWV1eRNty/VNcNXkODiU/gepJb91dnMBcF8aeufnmxkkCX
 lQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrZHw3wDEqsWxtX6I3Qw+OHrqvqS6c3mqgfKBC8xSv8=;
 b=nIh666wnyjfQsN4Q+zVHaoyJJcTs8yBTe5/UwUtNte49wdQulYf0W3XXKzZkoWxSIR
 FlEGxkK+BY0+mEcVqkQzr5XYxfD3a4gQLTXU2cro+CGRX1q462qBZ9xdhYNQJpbrV23+
 V5j+B7Y0LYD0rBsDBTBt7d9YXLCki0pkjtYJFazzP9VV+LuKy07IwM5KgPZOJpzBm5m/
 boLyDh/lhfuSM7b5M5IuaFY3TWQlmJZKMvJLjmh/wtsYnGcOS01hEfNWg+xU/g3XJcNm
 RPzjCvOY3zkZVOwHfupVzCMO2q1IReCPVyQw4sJbXGuO71s9wRenDmVrFcrud6kDHDri
 HZ8g==
X-Gm-Message-State: AGi0PuZKi1CoiFYwv3LEnTvBnj8mmdFmucONQr3BmAElA7ti8JJxRVxD
 M8WTM4WGsf0lwoikt7jz/x3pyA==
X-Google-Smtp-Source: APiQypIckGk/05A/UD8d3TxSQDoWu1T4/CMGlEehpQVQAKrC1wqh0IN3n+KIr7o6Kj7ucki41lXmAQ==
X-Received: by 2002:a17:90a:d703:: with SMTP id
 y3mr8770619pju.75.1587759911901; 
 Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:57 -0600
Message-Id: <20200424202505.29562-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/12] remoteproc: stm32: Remove memory
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
between memory translation and DT parsing.  As move function
stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
stm32_rproc_parse_dt() can be extended to look for synchronisation
related binding in a clean way.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 57a426ea620b..658439d4b00a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
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
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
