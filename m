Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B866DBD73
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 346BFC6B458;
	Sat,  8 Apr 2023 22:00:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA9FBC6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:36 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id r27so2339812lfe.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5nydUHwsIwjtIyju2PPVdWDGkaHFsBAEFCxHgjn6c38=;
 b=o7QDfJtBk3tXHOEoou4q9FOBDB1hNBSTcVIuhUOc2NYgNXlxNOzU8NTQHmzhyBOxs/
 Hc72lhgqMXu/6SfdhFCIto4XGOCM0zcEirTLVbSPJvAv9dj9aWPfgGca2iisGXTa+Bwz
 qE9VXB25fsIi/xExwkKa+dELWqgr+1cbh5yWp0nD+OvI2T5c+LWbnl+WaoUy1rgarsBS
 OXOGzt8kFNU/LcaY7RnDqoZaYMU9StEsAwH29gOClQY4SfjRFOkTJrpivIRadwvVwHAw
 s4++l06b6jMkA569csDPQQfDYdNkU5iPj40V7Zmruno48fTDa1zFTJaIKhrngl7i9nBP
 6img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5nydUHwsIwjtIyju2PPVdWDGkaHFsBAEFCxHgjn6c38=;
 b=ZM9su2YzGgIiVWb1O9x841sjtPeZlhqUvrJsOia5Ttj6e6KrcL7a+BsdrXSV2hu04/
 3Wm8eDNfsKNDA259rl9D9e/9zlcs+50hhbkOp1BKwgM9a05cm172ehTM9O0Y/GFj74cN
 Oi+KaOY4NvE1RazEBfb+QPE71onOJ26e87dZq7JVWxLFDlyAeIH3TzpFlsk2UwU4LMS2
 z5mw/u5fZPUP/yPU1Zt/87cCA5Gm7f+dmJtjhBVUfO/sKyJSd7yWtUdrpZ3UyQr6i6OI
 tULpTBUs0srhfei0Nony0CochBKX/QDWHO/fKE8Ec8PoW2N/qw0fnZi8qFN4TnafzRuT
 3rdg==
X-Gm-Message-State: AAQBX9dr89tUUnpBUBykx/BKB5nUuW9K2y3z7QrAXzjTPuaGULBrEiaW
 dAx5hzAns3l1sCF1GC57epT4hg==
X-Google-Smtp-Source: AKy350azw0lQFoJtbHGZb4b39JvnxqRzxzCjAtZiWUW4js1hCbiF1B1tHHNT7s5to9J8iBxLTeOcWQ==
X-Received: by 2002:ac2:4d11:0:b0:4db:25f2:c116 with SMTP id
 r17-20020ac24d11000000b004db25f2c116mr2068158lfi.18.1680991236063; 
 Sat, 08 Apr 2023 15:00:36 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:23 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-2-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 02/12] mmc: mmci: Unwind big if() clause
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
ChangeLog v1->v2:
- Only assign the cached status in host->busy_status if
  we have busy detect signalling going on.
---
 drivers/mmc/host/mmci.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 9b48df842425..8496df2020d9 100644
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
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
