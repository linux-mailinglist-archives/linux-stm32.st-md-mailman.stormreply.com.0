Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8036217A74
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D21AC36B2D;
	Tue,  7 Jul 2020 21:31:25 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 522C3C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:22 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p3so20602656pgh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
 b=vlg4YzlYmvKnq0oZiRA/WZQZV9aTD1HT5uRwu7wRIjrPwUyorhubGe1al5Kz0My1np
 ez3h7UKM28lZ9RHgN/nlSWooHmU7ppDl1sWqV/scpmPN7++XuCidW7Iz/WaKmnzOqR/a
 JHup0M8XeOQor04qjakUv+rAg76hp/7PLXJtNwOYvpk6DJZPtnVOO2XTXl55D/WTuyXU
 CHEUkEad2ljkpoWL8pmAriaHw2iwphdwQKTc8oz71DDXXf31ZpgjUy6XQ5lEp1d774mZ
 8Ar0GR4BTEvkI+BW1tLbmyuftnYt4DfgzMurlZ8PNATS8qjnVjQnIfe/9wfi+7Gs/YEV
 /ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
 b=RBTgi33c8xQlnNeNAJxE6qNIliRlf7Ckf8c8M6qcdS1/aGZ7NHg94/KfxcNRWJ+U1Z
 eA1UtVY32w2cE4RMI2Y1P1eWcWAv48Ot4fiMboFgwsiyhPhKEXTZbN+KWQC/lPL9ObJE
 PeDs13Ymo2341lPbC9+hU2c/D2ZECjutIf6FrllQxaMBwtvSOYde1DHeAEmemF6ZiiKk
 0ul1fla4cW6/TkUOjBPTMcVbAkg1pDI6J7Tg+GcxJAHIw9GYmnkmdWfoAl6soKbsj9g8
 LSqhhEJSRKkcsJSnwW9RodQkcsUvegD9FWEDWO7WwbxbaVHUJH5/OeyHjzuaH6+mt5gE
 2Gww==
X-Gm-Message-State: AOAM533i0l4oh0zt9KgcYTOQpH/CXe9TWl5toHsfgA2KWzlgZrxhumHF
 5gzPAhvQufpJs9b3wqxof3mnQg==
X-Google-Smtp-Source: ABdhPJyxF5Ve+kukkL9TmVEdAdGxntg6WddAg9u0VffB7KEjWpj59KKeIydccl7sGqBDGW7ydmzbLw==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr45501912pgh.309.1594157480837; 
 Tue, 07 Jul 2020 14:31:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:20 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:06 -0600
Message-Id: <20200707213112.928383-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 05/11] remoteproc: stm32: Parse syscon that
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
index 986f34a336a7..961a53f67ec5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -71,6 +71,8 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon m4_state;
+	struct stm32_syscon rsctbl;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
@@ -607,6 +609,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
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
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
