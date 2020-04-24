Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C96891B807B
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D475C36B0E;
	Fri, 24 Apr 2020 20:25:12 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 191B7C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t11so5165176pgg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgEz+wJcufUUG+teXaGNehTQCeHAZ7uJeYQ2NWLbdjg=;
 b=NOtPZXyitW1le/NvzqyO9UJvTrYAYkLFNPC5AwNo3bL0PVXogbJCl6/dVM5KWMZs36
 AQJbWdPGjvUpntXrlRaguNzGZ8aLKe/4sxDm7VniYpZJ/cLHiFA8QO6i8gFG4nSzxnQn
 VyorVL5RRNnxMxGrG95VDkNeBgfsZ4hHEl+hKZdj489+2Nk+xbfIM71/U/QYVsh3ptkX
 cn7fU4XIsj8mcTPghu1b+GGHpri9b9ix4FSMu7pekIoOLzjpb4TYkNH3JLjh4scZhuIn
 nCz0IA5ZlFaiE5dKld6FqcyTd8y55n2ve0uyvwzkx5oQYzDyASHLvE5jsofE7Rh/NCv/
 C5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgEz+wJcufUUG+teXaGNehTQCeHAZ7uJeYQ2NWLbdjg=;
 b=bd5/Z1im5CCIm1fvD5mtJMNmqhxQFnDnhWq2iwOLoQhB35olXuQYTGr79GiM2vMstr
 PcLWT/7enQR1sb01J04mqNmFfKgREERrjB1rdDhOpOv1VO51XFLugyvP9rT/P3kvcC3W
 QUaeaXrQ7rUGMzhVZkXqiTEzFTyWPVsuO8JhYCrEgkK4OzEdPhvsikXdg5cYLVp/4FH3
 IOCxbON3VpO6Mba9bPA2SaqK3p6ud9O5qXZjvAO+2bUIEhG9eUhnpxQLq17MLJUg1PEi
 EDk9KEIsBoBlq0P2PdR5dZhLXI432W8rM2eHMZfwHk4ZtgaC1VEu0zERQ8aOLd+DECoO
 a2Ng==
X-Gm-Message-State: AGi0PuY7mBNBE71odPd0lUx8ko3e5ZCOCFpHi0SrNWiVSY2ouqc+2h5K
 0q+5RUVBFYZvM+bmiIjGTnM/+A==
X-Google-Smtp-Source: APiQypJ1+f1MKeuUHrNcy2uquiy/RcZuGW6+iD8YyVNAH1nrYXeD8ZJsVVn/D5TeIgUXYDhFWGo24w==
X-Received: by 2002:a63:40f:: with SMTP id 15mr10958456pge.57.1587759909609;
 Fri, 24 Apr 2020 13:25:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:09 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:55 -0600
Message-Id: <20200424202505.29562-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/12] remoteproc: stm32: Request IRQ with
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
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 91fd59af0ffe..1ac90adba9b1 100644
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
