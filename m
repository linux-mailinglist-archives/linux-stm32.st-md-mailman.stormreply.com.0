Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10666D74A8
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD42FC6A610;
	Wed,  5 Apr 2023 06:50:38 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52DD6C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y15so45313190lfa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cSJ4MzJQ8UoPiz3rGVKBpIQtOY1lklGXlYq7/mXSQCU=;
 b=kRXZrFDq4/sV1F5HRJwuIvnh6JTWv/kvEjyGrh00xAUixf6+JOCnJhimtch92xg/SL
 dkm7lhBjKbP6wPWTCSfjIh6ok49XTRZXSDvW3sj1aM7ED67Tk3HbXuxd9SVlGaWYZVb0
 xKQhobCrl87z/3vKBIUZhU2ZwTsMtNyUi9JOmWrXM49z6Cz7706JKrK+rXB3YLcygQ12
 1IoOkUPFTDJq/PWlHG5X8r4jBgDkA2Q61PrZWAQ1/b5HAmfb3mIo/qTn15JEX8JLB+PC
 u1sJLx3++5QK57WbglBk64Gs3aDItT93xvXQR/cI7cay/+iY6H4rQNR4XjbMfalkXw0h
 ZN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSJ4MzJQ8UoPiz3rGVKBpIQtOY1lklGXlYq7/mXSQCU=;
 b=jZnhXrPIel8Mx9ufqKiekxhCN2JWQTe4aDPnP29Ji5tzGdom2AcG7X4G3UkDWXEatW
 SibNRDvCrDpU9/FdLopkuYIdDF0EYxQadce3SKc3UZb1hTKR1dOHFKmW872sDm0svvrN
 iFfT77wZ/Qae2nsA2cs1U5Yn5BQvythg4G3/fKbUwlgS4QUSbbwxM+psJkpkXq/PeMBj
 7a8k09qZp+24WooAdxB9Be0NZF3wC+HsOPt5oeoZqqhE43EvvE8kid1SS9H2j4zM74MC
 tT3yfGL4wmtuXkTYVS+qUhM897ItxYJTD4+Y5R4Yct1yBf7qwpkLBnwCA4SG/opwO4sy
 GFuA==
X-Gm-Message-State: AAQBX9dhJ6i9sQ3/dwlga1W8TdcPModFEMZgYev8WkLSXF+stDH7icW5
 AGpfGMVfWGLgAOnn0lWoGZbgXQ==
X-Google-Smtp-Source: AKy350Z8FesrBLZIGWRqwdr9YER0mju4LtzITsqbu9lQmVTwD33TDZguDxpYfgzVF655JsV+OwrlIg==
X-Received: by 2002:ac2:46e4:0:b0:4e9:d53b:337e with SMTP id
 q4-20020ac246e4000000b004e9d53b337emr1257013lfo.45.1680677437096; 
 Tue, 04 Apr 2023 23:50:37 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:30 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-4-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 04/13] mmc: mmci: Stash status while waiting
	for busy
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

Some interesting flags can arrive while we are waiting for
the first busy detect IRQ so OR then onto the stashed
flags so they are not missed.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 3c1e11266fa9..db3a8ce27a0e 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -704,6 +704,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 */
 	if (host->busy_status &&
 	    (status & host->variant->busy_detect_flag)) {
+		host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 		return false;
 	}

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
