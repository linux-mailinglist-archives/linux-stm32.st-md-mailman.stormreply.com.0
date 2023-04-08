Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7426DBD74
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42197C6B45B;
	Sat,  8 Apr 2023 22:00:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98D68C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id d7so13374533lfj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eL2tfczN7su2jHUV2L3L9PcxI+ycYQtmblvqUdrfgmI=;
 b=sbCZRGtj0pBtvuBE5qNrrAagA41l80nwBDTq9ERbV6uofvc9xMva7TzDVOiDm0nJBG
 UpgBWOg4DpEZc0LdhmVOtrp7/GNV/52R1jgnUp9KtAWAruqmkuOhDrGJFUBZ105Xe8ia
 aVysJEU5LxZSZ7sjfCyRrNi+7riA35fQTFZ3mEsnwTrXWk1QPExdyYpWdRVJT+wuU3Wa
 geBtzI7TYoIthWk+pZfr0Zh4I4scxVMC7zx4PSqHyb1Yr3NCrkwYplOtjRN8qDqVlmyN
 71rEgtepq666wLQ7NInidKflpds+sqHV8DPxt9Rw70Kn2IvMWh/OpTUt494kJxkShVPx
 pdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991237;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eL2tfczN7su2jHUV2L3L9PcxI+ycYQtmblvqUdrfgmI=;
 b=ellHgmNPMZyv62KlEvl2lu54puVELiKCh7hoNoAqXbFSj5sVriNOpop7+IHZ8OYJUi
 Ds2PlOnDiXL6zBGcCekwyWS0W8z72Vyac/yw4DA90zlNt6/1jCFyh0pxR7zPY+PUA8iG
 kOhw5KUCJvwxFOy0PGQ39DWNOIE6v3yN6mDMH8PaIfJPQCuFUs0zT0ETJ9HMJ6+broeC
 IbQEbAHIV5EZQ1s+K584+fhGrJ7RQ8oeYAj4n4gIRg9aQKiaL1fLquSf4usK2Hw8KzpW
 pJmiekN70R9GF1A+6Z+m+Lvem/pji7oibM1ujdPiwSdPDPHiwmli94g7hfQQ2pozv2cX
 Z4Mw==
X-Gm-Message-State: AAQBX9fWjiSTBBKHT0B1gwr0GfLKAVwnbnC9LwcV9LiI/xghJ3l759LT
 F6GZcicaIBT17bP7VUUqWT6wTg==
X-Google-Smtp-Source: AKy350bdedttz8LNGHVTqRJZTPzHsZh/f5b5PazxcSTopf17Qg+1MOLB28Li27oAmDRNouCVlW0O5Q==
X-Received: by 2002:a19:c206:0:b0:4eb:30f9:eed7 with SMTP id
 l6-20020a19c206000000b004eb30f9eed7mr1630557lfc.22.1680991236968; 
 Sat, 08 Apr 2023 15:00:36 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:24 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-3-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 03/12] mmc: mmci: Stash status while
	waiting for busy
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
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 8496df2020d9..e742dedaca1a 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -703,6 +703,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
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
