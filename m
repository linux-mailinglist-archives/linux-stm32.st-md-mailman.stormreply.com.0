Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DE6DBD7A
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6E9C6B45C;
	Sat,  8 Apr 2023 22:00:45 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 230E5C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id t14so2156927lft.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/LHmw5cP/mktYU3ZkTHFGE0ry3dquVBbcV8PSndMvnw=;
 b=yMyhy+Ihg6G5x+T2QZ+9BFIOcqTsNMP/ImmEzutXidDwICWaT+uedcy7b52mXWVDFQ
 v42FmEeZSJ/xKI6NXJkmNIvbtLvrO5MtD2I5gUIsVxJYRQgdqMOre+bgy31fXctRjDmZ
 09FNLUNXAKMIEJUex7HQkMSAfh2pGeF0yeTrSDgDd22ZCbx2IuplZncdJhRIafiCPlDC
 nYkqloRGn8cnMuJ7dCH5CHEZlvpySriNKnQejQwn6ZCCQyonS6vNPRMuHdtZ7LSsveuU
 4ZmO7Brq/Wz71O651U1oAKoY4tPEcXIrTLcoUtZqylvlldjiV/rbOmSJxhXSIcUaU09w
 HxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/LHmw5cP/mktYU3ZkTHFGE0ry3dquVBbcV8PSndMvnw=;
 b=SrCU83Xcea1xVxes5id4oszk7rsrS5GeX4uWvlS805RaSWmV8IO1gT+/SEiiO1Z5vY
 rx0HMCV0ZkchgKqZGjSo6Xo3RnUY7+ibXXpqElEb2E8Aj/ku94lJ58okXMzar83sTXtv
 /IIWpMWr54+RJobdAkK9BS2expiMldNsHE9yP2I7X17hBB+G+dKBiQ/TQWejg1IjTrSC
 iFopf16OCMTVsNUf0vqLrgVn4iKNyrjY3G5Juo9nlR68RkygsWHGZ5GUNa864MaL8qSf
 6rynKlKxoa1vzuSObUn8J62q13MpxTfIBpp5p14fYv28jLyw/TbK7Gh3riuviTPuSZAN
 btgw==
X-Gm-Message-State: AAQBX9fmULxTr/vw1NdO9N5rli+r+ovGqN3us/GTJyr10WJZEYMVPjy8
 3RS1m6AaePttDQcBSNAJzwUemA==
X-Google-Smtp-Source: AKy350ZuZSKTqn5CvyZR6lbMeyKnlxxnApYA3GcKVyg/68BqUZNskF5lIsVOhC+ly4y81O2l7Q2/OQ==
X-Received: by 2002:ac2:551b:0:b0:4dd:9eb6:443e with SMTP id
 j27-20020ac2551b000000b004dd9eb6443emr1606943lfk.31.1680991243598; 
 Sat, 08 Apr 2023 15:00:43 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:31 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-10-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 10/12] mmc: mmci: mmci_card_busy() from
	state machine
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

If we have a .busy_complete() callback, then check if
the state machine triggered from the busy detect interrupts
is busy: then we are certainly busy.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Do this in a safer way that falls back to reading busy
  status from the hardware if the state machine is NOT
  busy.
---
 drivers/mmc/host/mmci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 9a7f441ec9d6..180a7b719347 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -339,6 +339,12 @@ static int mmci_card_busy(struct mmc_host *mmc)
 	unsigned long flags;
 	int busy = 0;
 
+	/* If we are waiting for IRQs we are certainly busy */
+	if (host->ops->busy_complete &&
+	    host->busy_state != MMCI_BUSY_IDLE &&
+	    host->busy_state != MMCI_BUSY_DONE)
+		return 1;
+
 	spin_lock_irqsave(&host->lock, flags);
 	if (readl(host->base + MMCISTATUS) & host->variant->busy_detect_flag)
 		busy = 1;

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
