Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DC6D74A6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9CDAC6A61A;
	Wed,  5 Apr 2023 06:50:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A95FBC6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id c9so34891824lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EzNDUri52+ydwnf/71tMhyZyGCHdCPy1yA6ftXOBwcg=;
 b=xwbw5c1tMoZpFDnTx4NAqBXZGcaMkUkhjWMiuO9UG19bRMZaouaHMfUN4Llg69zepE
 +24Zl+9gH8GGbC49btX52adt4iZBT+56J2Gl8mq1kqqYETj9CB1ggq8xt1lT1AFFBJL8
 jV9TSGuFqFfBdLAAqbB1rIBXEbbM9j47YDVH8hv2sXeotgrrPi0SMWL3/o5+crv5YRtZ
 Syap8G15D341r3qyk3srGJ0SDgS82j8dQa0EAz0g5sLCNGNYqtsBS/8DzW29bZFd4bMG
 A9u4RVqqfPKV71XLzEHzD2S31RttzrFkdf/LHFkeGB0Sg/Aqv3Uu767EfWyVVbVSF0QY
 57WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzNDUri52+ydwnf/71tMhyZyGCHdCPy1yA6ftXOBwcg=;
 b=o1ZyT/iO+nSBvPTu6En6F0zsFiwYSLXAsmpw2HVv0J7+uJ9Pr/u7XvEA8lZBmOvQ6m
 41r+jgSSk9R/q4p6pFzW4O1XPZE+m9Mm/72PE1VNdI9geICFaHKrKkplUSo5gUl5bP2h
 5KW7YrXbz6mnDsPbql8SWbMRpmadf06mTVSmMZii5XkNkrG27A3kT9IceFi9QmuLjkVc
 kej0CRwQmd3dCX/72B7qU103TYtuy7KgQe/fMQvKgvGNd4LltAiB5+zxpDcqAIO0Hyl/
 LqCOI1MvA1lRIWebN0aXtxv8fH2lOyKAdDJUI/WLC9E6nSrXSPb8qgdX5wo8vl3nFtsF
 6REQ==
X-Gm-Message-State: AAQBX9dooj71wC3/cD+wGe6Mi3SvZPl7lmdmeTIDGJGptM2Tt6CXYj+w
 GgmceXYbt+etI0em+Tx5nTiyDg==
X-Google-Smtp-Source: AKy350bFChkzu/xDuMrQEacxaYMKmPDwmQZtQnPBti5B1xqTDTgiwMx5x20RvKZlOVJIVjSyFspsEQ==
X-Received: by 2002:ac2:5d46:0:b0:4ea:e296:fe9e with SMTP id
 w6-20020ac25d46000000b004eae296fe9emr1235549lfd.9.1680677436318; 
 Tue, 04 Apr 2023 23:50:36 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:29 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-3-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/13] mmc: mmci: Unwind big if() clause
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

This does two things: firsr replace the hard-to-read long
if-expression:

  if (!host->busy_status && !(status & err_msk) &&
      (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {

With the more readable:

  if (!host->busy_status && !(status & err_msk)) {
     status = readl(base + MMCISTATUS);
     if (status & host->variant->busy_detect_flag) {

Second notice that the re-read MMCISTATUS register is now
stored into the status variable, using logic OR because what
if something else changed too?

While we are at it, explain what the function is doing.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 3e08b2e95550..3c1e11266fa9 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -654,6 +654,13 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 	return MCI_DPSM_ENABLE | (host->data->blksz << 16);
 }
 
+/*
+ * ux500_busy_complete() - this will wait until the busy status
+ * goes off, saving any status that occur in the meantime into
+ * host->busy_status until we know the card is not busy any more.
+ * The function returns true when the busy detection is ended
+ * and we should continue processing the command.
+ */
 static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
@@ -671,14 +678,17 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status && !(status & err_msk) &&
-	    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
-		writel(readl(base + MMCIMASK0) |
-		       host->variant->busy_detect_mask,
-		       base + MMCIMASK0);
-
+	if (!host->busy_status && !(status & err_msk)) {
 		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		return false;
+		status = readl(base + MMCISTATUS);
+		if (status & host->variant->busy_detect_flag) {
+			writel(readl(base + MMCIMASK0) |
+			       host->variant->busy_detect_mask,
+			       base + MMCIMASK0);
+
+			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			return false;
+		}
 	}
 
 	/*

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
