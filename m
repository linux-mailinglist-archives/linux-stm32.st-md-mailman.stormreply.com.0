Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19F21FE09
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:04:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44A84C36B31;
	Tue, 14 Jul 2020 20:04:57 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC860C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:55 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 207so8051426pfu.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
 b=WFvRYThJYieMcZZcfrO7iKSQOtDiOIn11T8zg8cyTTY9mABDDOF4RU/XQKr+ZuWpRt
 pM1LeWbR6MW4SR16los784+NTr9yNy8eV+cE9JwNNpu7ZVPM0d8WFJBkDkGyUva2rLE6
 ELFE9UCIcL1bx5S0eqfJBslPX2Jeh4+U++df+fzjk/Axb/a5F3PxoCcrGva4F2RYfv+X
 CuQSCSs+DCJBaL5Y+ZTh/CJ05T4dX+hatiWX11kTEZ3u/c0maPXpd6OyC4KBNmLbS71G
 9fwODBOSaY4wl0fI6XmYygm+7rVsIgLaXsMxYbzn7w/O62WLhnJWZlI+w8AEJ2R2AODC
 iuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
 b=B7VcQNxX48WMmgIwefyb7oTuwGR3y5Uq8tOpmuWPB/q3eGdCZszaVfq4rMw3b5Hibb
 jEHBTBcTICzVxIAvXyImhJeMJTNPYjkrVr1iIhB9zrQLQ6ZNMWNOfE2C6eo3mxxvTKFD
 E8/Yg5WKqGQAwrtB5KL/35jfedMWHY3umuPXr6Si7YQR8vIoVFJ9sdHBGXbaEIe9B1lZ
 nL4DxA+JWCOz4Nbn9YNNWq4AkxmXwoXo0xVD0Jb3zvQZM/f2HrYE43fl4Sd78PRB4kSD
 8c6TT21WAfnNwORYavKPGezJhJEPad1nBYChKyKYmdDX8s7JtAXkJkK02ZVTcxPTOvrd
 NJSA==
X-Gm-Message-State: AOAM533xcPwAiB5Zv/225SKLgvmzt+c961wp2iphYpgM1MlljrlOMEYM
 F4SsrFu0t8OUxQ8jzH408kTlhA==
X-Google-Smtp-Source: ABdhPJwNZcSXvJT1wtXgc68agE+YL1/Mrb+Az3kUVQCf8Y43dRW88sdoc4zonyyqrK61Li3XyFe5cQ==
X-Received: by 2002:a63:541e:: with SMTP id i30mr4735003pgb.47.1594757094489; 
 Tue, 14 Jul 2020 13:04:54 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:39 -0600
Message-Id: <20200714200445.1427257-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 05/11] remoteproc: stm32: Parse syscon that
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
