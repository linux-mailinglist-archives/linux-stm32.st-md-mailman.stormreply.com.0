Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383F1EA8BA
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6E5AC36B26;
	Mon,  1 Jun 2020 17:56:04 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4658C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:02 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ga6so153335pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ViPzLIdY6S5F9ukM8AO/hVR30UuoYhcnMI2Jw2fXDro=;
 b=nvQCaQ6BDkTVt4N68rp3+7sk/OjINYsb1pnrOSFmRo/gwHwW1MLtNPDYyIYmMUN7va
 pAGWbWmDdudAr+B1HdFaXSDQy9VeZAFeSH/E6a92sqnzHfG9lfLVzh8eNYil7KOpas5V
 MsifJkeC4UtOyw3PTK8mW0nPUHppgrAmoEx+Irz0tFmiA4rqGRLq25pCeBMzo0dpob2+
 lAQGp4nwcRTEAsxGWAJgDmyysDFPYpDEOwin8u5jplAGUwE8IctWxAvV8Tsa6MlJrBQS
 9QRaD9k42fv/ghRMP4rXysqNHgx+j0SuDNtEhzUPdJSE/gtORupjQvx/D7d6/k1FR8ZZ
 6Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViPzLIdY6S5F9ukM8AO/hVR30UuoYhcnMI2Jw2fXDro=;
 b=pAEwXvV8f2mo0zEIbDFGk/v/yRU2FlTlLg5mTRpedHg0WUCLwT/tr5kHCll8LifZkX
 sGSkaWoJLS+S2Dzg8u7xUMtuyAS7DSHncw0ap5Veui17r5dC9KICjgtcXyLM6GqrsjCQ
 r9boXpnVufuqSdEEJ/ybT6UJpoDBsyan6kSDH9X0Y73LMrAgmziD/pwaTege1zohhlud
 mTpTzqNDKIfAevAgCDPJqRt+rL6pQX/ztH5NWZ/oljFVjpBRumYjIUfk2Ghu6/kPWYuZ
 n6h5tioMAzs4Hb24T/QDnmgEh/E2boXuncguA8X/urokE/hpvCP7VzRdrrA1IiEbMioP
 0BPA==
X-Gm-Message-State: AOAM530vMGiFTkl66/txP57yFRpmir/x+U7a+IHBU2WZMMF9GZPzozTZ
 eyVf0xxXZQow89951kqpnHXMtA==
X-Google-Smtp-Source: ABdhPJynMxDT0cCzVhHBOevuGK2TcnLJIdmLB+om4mji64XigRKmYH5t1RVhWndkJJsbNUj/fxZJrQ==
X-Received: by 2002:a17:90b:705:: with SMTP id s5mr580608pjz.147.1591034161245; 
 Mon, 01 Jun 2020 10:56:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:00 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:46 -0600
Message-Id: <20200601175552.22286-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 05/11] remoteproc: stm32: Parse syscon that
	will manage M4 synchronisation
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

Get from the DT the syncon to probe the state of the remote processor
and the location of the resource table.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 3e3b199a02c1..80fd8fd831da 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -70,6 +70,8 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon m4_state;
+	struct stm32_syscon rsctbl;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
@@ -606,6 +608,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
+	/*
+	 * See if we can check the M4 status, i.e if it was started
+	 * from the boot loader or not.
+	 */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
+				     &ddata->m4_state);
+	if (err) {
+		/* remember this */
+		ddata->m4_state.map = NULL;
+		/* no coprocessor state syscon (optional) */
+		dev_warn(dev, "m4 state not supported\n");
+
+		/* no need to go further */
+		return 0;
+	}
+
+	/* See if we can get the resource table */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
+				     &ddata->rsctbl);
+	if (err) {
+		/* no rsc table syscon (optional) */
+		dev_warn(dev, "rsc tbl syscon not supported\n");
+	}
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
