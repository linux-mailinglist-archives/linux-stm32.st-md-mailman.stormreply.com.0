Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE4217A6A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AD62C36B31;
	Tue,  7 Jul 2020 21:31:20 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DF3AC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 1so1281150pfn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOLpDhUaI5YvggRlgo01SV+Tf6RdV3ahOTchedkHuLg=;
 b=Y0V7o8t1H3YTMhZ4TUkXy4GVXShzOzSWSy21TEMMRnDoyvbmw6ulB1nneFGbHQhnWb
 RPVS9cocqmq+TNSkG85TTyWEE2Jvhr0FOaNEuLMKvEBOgGqwAlIFCiRO7P5+6MoaL0uG
 8HCWa1qK/+LHGT/He2W6vUvyrI5u6qTLp9zkVr2okLWa6liHBbcNigt79AIfQuEjqrz9
 f47iVafujZXEtxF8vZ/fxYccBGemuFiWA7z5Fz3BZrXY9fHSYHZMgl+R0P0dIibDlRjr
 jlyASpnXRxua+C8hzcs+DmecRTXzjtjJ0Lv9LRe42PI1qGOJJmnGRl+snWS1dAD9h+Jj
 Lf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOLpDhUaI5YvggRlgo01SV+Tf6RdV3ahOTchedkHuLg=;
 b=bb2ao/8mn7KbawixOGhVAXDrilQUtXnZEKqMmUShVQjc7TKNl9IFUtvGbnKgXmMnGZ
 PVJAidR7FwVS/EqRrZk+yN0SAWcIs7JgoHptr729PeY16m2/wEhQXso6hDPhe+g6Nwx1
 9NQKwWOwd9jXmweMp86BP0IzAyTbFe4FN2AO8qOD7AzbKuVeqer9/TI8diw27Iu/4Gfe
 Jtc+3iGwc5oj+tN6NjbW9vtcQEJPcyoCNliBtg3L/280V6jDIsECFAp+Xoy9wA1b3k3w
 BWOquf0w2OAco3i7LsSWNAWiWJeYqJcnmk8JhJXi48xkIX5s5knMO98yArf0UH+N9z5P
 S36g==
X-Gm-Message-State: AOAM533xVYMepGeAcipjtqsA4X1D8rdHtKTUHKdlliRX9AYdyJ4kffnO
 1KehER8X1+pn17YwQ9uQ1+oV2A==
X-Google-Smtp-Source: ABdhPJw484OOouijNAC2XAXKCPThV6Q8AEvN1qz4ZshbZhJQxomJ//VywcwrkYKw9PtyBst7CC9J8g==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr7887844pfi.233.1594157476994; 
 Tue, 07 Jul 2020 14:31:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:03 -0600
Message-Id: <20200707213112.928383-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 02/11] remoteproc: stm32: Request IRQ with
	platform device
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

Request IRQ with platform device rather than remote proc in order to
call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
know whether we need to synchronise with the MCU or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2973ba201c1d..c00f60d42ab6 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -262,7 +262,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
-	struct rproc *rproc = data;
+	struct platform_device *pdev = data;
+	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_report_crash(rproc, RPROC_WATCHDOG);
 
@@ -554,7 +555,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-				       dev_name(dev), rproc);
+				       dev_name(dev), pdev);
 		if (err) {
 			dev_err(dev, "failed to request wdg irq\n");
 			return err;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
