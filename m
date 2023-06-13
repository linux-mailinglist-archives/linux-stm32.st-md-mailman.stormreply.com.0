Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EBB72ED01
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D61FC6B456;
	Tue, 13 Jun 2023 20:34:32 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAFCCC6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so7477878e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688468; x=1689280468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HEWZ3mk4O5IbHesXExTqQF3woZXVOofkrFDb7Wvq9pM=;
 b=O3GqsVFjd8mTLVD5WMmFXeH/dZGabEKtmTTLdPUlcbL6BI4/+J3hsqPTuDlIz9BAzg
 +cg7hXy+74KOIH8eCT2LGEieWXtZCLlQGgVtf81BgpZljJ/Mq4hlGUn1fFDWvPQ9qkAU
 UfJBeXE7AJl/Mq+Xl6WWc4TNju3HUX04vcK6G/Q6MFXEDqXvnpC1pfB+xamyJOY1D3/x
 RIUwjQZe9Smvndk1o1K5kKJH09osYlWsc+2PBcT4FsMJsKbLcGJkNCib+LeE9cwNANNP
 FmH75hPPyCgE/cW4lesnquNjqourWLSiHJ9XsP1ucIOkA4WFNH3YVWYrTMmmk5ubewj3
 tmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688468; x=1689280468;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HEWZ3mk4O5IbHesXExTqQF3woZXVOofkrFDb7Wvq9pM=;
 b=XWagHmvr5DZppXvxHS5KT24Tz+ep/H421xfjS8Gl3p7kyBhzqSd4PrvsqfsVfMJ7vV
 kSXGeQnm5KOGfQxrvNcPMhOKAzvVg2gs4Eq5GZaYWdaZ1cqLzcdlyGFP0s8/dQbnbHV9
 aoe4A53dwF39RIRCvOCrH25JgFE9Br9gmg5z3C0bZjqtZk+54Tds2XUXWOT3Yd+nH+WQ
 VKlesVYXumwU2ajarODvK/tdphfIxUwHAnhj1WUcPL7X/mykqJiIq5CSBRbPdF1AHxX+
 03/bU38+5oAQ/Qq10aVx0QeA3vgOLzQ2og5KZgPTkYmdcLBTU3GwwtN6SRPbXeXhARB9
 FK7w==
X-Gm-Message-State: AC+VfDz02wWbGL11uTOIWl5+HSE35fKnDksVbNE68f8SVbpyuFbL366j
 H7oPhogxihMj1oH1zKub8ZlUHg==
X-Google-Smtp-Source: ACHHUZ4MJ1g+3kaOn/hlXnU8wnvFYa+Alm2v+9RG63pXCADxF8i/SEE0xuvW94dag0BU0pXA4yYBfw==
X-Received: by 2002:ac2:5b5b:0:b0:4f3:a9d3:4893 with SMTP id
 i27-20020ac25b5b000000b004f3a9d34893mr7278345lfp.35.1686688468189; 
 Tue, 13 Jun 2023 13:34:28 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:19 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-3-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 03/10] mmc: mmci: Stash status while
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
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index eee449f90915..47b306e45f78 100644
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
