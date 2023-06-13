Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFD72ED00
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63863C6B457;
	Tue, 13 Jun 2023 20:34:29 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB80BC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:27 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so7477850e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688467; x=1689280467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zjbTCpreEwrPILZW6pVXqr+kf3zl3RqDAOxeSTWO4Xo=;
 b=OGfRhCFCEBHmYRzodJx0DsHjJwHotZpGZY8TupzhoiuigjQ/wY3KjwP/2zSy6xQ7jC
 PzyIy7Z6+Zzfe0fnf3t0qlYmFcb3E/xFhSgJ4+GfHB5vDnWFxP9fhsj2u9E5Voo5ICaV
 7JDEOksiEw/NbZKgGU04Qjzj83hKRY/8qb85uxw46wGTnI9bEChR+zIRKY0n2BLYcUf3
 vBHDzKlWlAu7aJ/snZj+kaX13XoDtJAbrxWlsfdi7fmaL+EYFuxKHT0/K7iZeRAa0twU
 hW31Y2XZcT+dsH1pEoPysyw2A0/Q+QNKG2xxIwx6WnzRVcJcC6UUmRExQaVswFouOG8P
 nXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688467; x=1689280467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjbTCpreEwrPILZW6pVXqr+kf3zl3RqDAOxeSTWO4Xo=;
 b=hORElmc2Wk+rahLvKFcXKLQ0Wps+1fbXXtagoq0YFdlKQ84iq/ZTVOfH+fiEH+iijb
 Rcxq3oEdmai+eAVFEOdYwCYQbJ3bkK0AiOKGSZVXhi4e4XDc+lgEa8RTiCtoLp322p17
 OFUmF3YWDvHR0GdDkAnYwpX8mCaaTRG4I6TfQzS7u6+OiypNCd70XCwh2boznUUMbQWz
 H3ZN4XhBv64SfCl8LH+eesEZETSr3iEqjLuiowC7Tr3MxUaEyJNq+x2CnLaiiAVveIiH
 YagFLOUf9VHoCvlTEVIqVQURDv1S8OP1vz2cnAR3a3PJF+PRLIBaP39Sr+4GhRZ+fscV
 /lbw==
X-Gm-Message-State: AC+VfDw5y2FOtinurx0IPrVw5f9dgAkZtJ24CF++lH2tLEr0OZwkzqy8
 wBAWvDTukdQSIHeJvNWV1GuT7A==
X-Google-Smtp-Source: ACHHUZ4bLabGiY0m9kbpH88S2x0f/T1TMtQw6g60ZJS+cKL8tYcQdAXtZcauyjVGuutNwa1+6YGaWQ==
X-Received: by 2002:a19:ab01:0:b0:4f1:3bd7:e53a with SMTP id
 u1-20020a19ab01000000b004f13bd7e53amr6432839lfe.49.1686688467301; 
 Tue, 13 Jun 2023 13:34:27 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:18 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-2-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 02/10] mmc: mmci: Unwind big if() clause
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
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- Only assign the cached status in host->busy_status if
  we have busy detect signalling going on.
---
 drivers/mmc/host/mmci.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 0a4b6b6e0f03..eee449f90915 100644
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
@@ -671,14 +678,16 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status && !(status & err_msk) &&
-	    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
-		writel(readl(base + MMCIMASK0) |
-		       host->variant->busy_detect_mask,
-		       base + MMCIMASK0);
+	if (!host->busy_status && !(status & err_msk)) {
+		status = readl(base + MMCISTATUS);
+		if (status & host->variant->busy_detect_flag) {
+			writel(readl(base + MMCIMASK0) |
+			       host->variant->busy_detect_mask,
+			       base + MMCIMASK0);
 
-		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-		return false;
+			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+			return false;
+		}
 	}
 
 	/*

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
