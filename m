Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E81001EA8B7
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14B9CC36B27;
	Mon,  1 Jun 2020 17:56:00 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F8CC36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:55:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t7so3003464pgt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ly/+lULxncE0Hv/XKPdsdbKvQX3A5UmakKCmLALYjq0=;
 b=dkI7qDJyx89vpnpMR9RvXRcPeeBf1zFWx/8GgGMnZHyTtL5pipzTvNVHo3FGncZVYp
 Q7Y9OGgwFDlGDkHj7dXap5cwa0mPWzPieIeTTIoUzGl+fW7h3aF95HXddQjs0fsROJrA
 P528DEuQDIA7QACQVabOPNA0v632XS/lQMgR4b1qXKrkSqaKCYcMKk5J05O3srOpFIXY
 dUrHzjzEx2EkUO7RCMrWu181kDtXBfkA0iO0u59DOUweyH/+HKER5DQSaT4lrzGdRhMa
 gyt9sn5ZugY43f4OnB3ZlAL/eKeILEk7u/Tb+l7MBh0tkjdiYM99wXTLXsnK0qC4sIJM
 qzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ly/+lULxncE0Hv/XKPdsdbKvQX3A5UmakKCmLALYjq0=;
 b=CSB422gzAmoJdeRuAZrm4QS8aS8RUN74WOb9gaUG+q5P+dtRf9PTrkI/Qi99VEyV0c
 CRqi8Q60RcXhnscFK/cH22aCRGAjxE1ix/u21V1sg+Lqp+2UfUcmNsdGY2r1EikZbbXH
 H6A09ESBWQB+6GdS98YJ3GLp8aE81QKpt62KIqYZlZfnh6LQgHpqg23k83VXNvPY9hHq
 y0j46K76IDcsSClLO+hZWT792mRM4+QrbRR1kW18k5cOQYVomrMMoB/aJusk4j5gHeBM
 0rMCWNrSui70TCGgqVpBBonfWHILDur5ZZEYIE9cBuHup7UA8QmPr8Jz1S7ZV45v9ypJ
 VVkQ==
X-Gm-Message-State: AOAM530YME3k6D9ndJ/h+YEhWm18e8UAeoll+WlQCJGWWCFoYpdbVy+w
 +/fnhyck3v+vbXCydfcYxQP6OQ==
X-Google-Smtp-Source: ABdhPJyfHXNxc1V3Yc+P6I77d41jXD45DyYRGH8UfzswQ1/Fjb0Q/j2fYXA57kZwWD2pF4ngIEehYg==
X-Received: by 2002:a05:6a00:148c:: with SMTP id
 v12mr21200684pfu.171.1591034156896; 
 Mon, 01 Jun 2020 10:55:56 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:55:56 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:43 -0600
Message-Id: <20200601175552.22286-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 02/11] remoteproc: stm32: Request IRQ with
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
index a80733fb08e7..94fd687fb5b2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
-	struct rproc *rproc = data;
+	struct platform_device *pdev = data;
+	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_report_crash(rproc, RPROC_WATCHDOG);
 
@@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-				       dev_name(dev), rproc);
+				       dev_name(dev), pdev);
 		if (err) {
 			dev_err(dev, "failed to request wdg irq\n");
 			return err;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
