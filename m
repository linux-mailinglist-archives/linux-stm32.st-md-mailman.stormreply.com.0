Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04472B3BF
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2A70C6A615;
	Sun, 11 Jun 2023 19:41:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 442C6C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so4141659e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512503; x=1689104503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=leQo1eQI2yGMA+F1whh7Mzh5/OHjjWPGlqQlPIARggM=;
 b=JzHmoRxskRPBqRU0oxKMdWiC2ux9EoTDP5BA2bYiUG0GeVVIU7Utrz8oOaEDumSQmr
 LjKCrXIwwSQPFIBDkQ4m2wQqemqC7fXKtgX0A+Ih5Y+XxUIQiP7d8Nuqynn1IIuF4vl0
 YQHJE9ZVparD2CXEpB9wSwFNr0EJAXGwW0TSXfR8orn6EoyHDGuGuirHQw6CL6Y5L7bI
 bCXFtjmnC+3No/SzLyPTE5SPBcNZxVzDIqafdKyAlytg6tOyEeYEMnziCHXB216sBU75
 UPXazQ0LQrzBTY7woP24hkPo3y7DMryNqRofh31mSHFmKLBze+7IeMIaJq3g6YzaYPfd
 GjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512503; x=1689104503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leQo1eQI2yGMA+F1whh7Mzh5/OHjjWPGlqQlPIARggM=;
 b=iyU080eoGhEOwwgGbOBkL0Bll+BCHcsIoJ/jTLClzetXh5bk/0hZ/9pMI684ePDgKj
 EZcbXkpO0UH1mDMyvXC3NYhbyaamBbJDfJDPWbxyRb+1i8vANqczAabtpLK6N1bra1E/
 Gq6iq5gsIAoNM9MN6OdVJT/OFmuMady37CvCgsbjGa0N7xWCks1MKxJWA4A90MWDdlp8
 b1g5MYzEQdFcfYHba8bbBfOC1O4G5++lVXqbmPombPE5ix0lsMVL8lHtsbrzhBC8mpE9
 Exw3QU4iSX4Cs5VzRaNSvE5boX0xxITcmO0A6+wCJMvaY9uPysYAlB4MDACcgaiTgkNR
 AwrA==
X-Gm-Message-State: AC+VfDyOJZwPmy+VroqVKeVoAuH/Wum0aK+hobQ28UOP8xzuo2bP0XFW
 CrIipsjz44XXB9k+An33TafHuA==
X-Google-Smtp-Source: ACHHUZ6ULkkOOmgR+U1/7iaSinRzCgPnItOqoS3hN/U8Qa60/d6WPvkdwtgBFv4NuUS9F58fDYBJZQ==
X-Received: by 2002:a19:711c:0:b0:4f1:2986:3920 with SMTP id
 m28-20020a19711c000000b004f129863920mr2977578lfc.41.1686512503739; 
 Sun, 11 Jun 2023 12:41:43 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:29 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-3-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 03/10] mmc: mmci: Stash status while
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
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index d8e7b17adaee..73b5205592ae 100644
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
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
