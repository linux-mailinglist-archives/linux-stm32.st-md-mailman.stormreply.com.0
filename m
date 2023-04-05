Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723D6D74B6
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C30C6A610;
	Wed,  5 Apr 2023 06:50:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C26D0C6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:43 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y15so45313461lfa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OU29sLolFBKRRrM2SwmaE/cR08rID9BsyZV6fg0YEgw=;
 b=hV2g54d4uBykzRRJFGdYqiFznq7btZms3bs8Iwn3lBuAlDhrl660foVDXeaOb+yChM
 jLZsKYiFd5IN2KrdTGCQR+qP6Lq+kLNkP3fPvd5HHL9vHgNzHwQQQab4kUMskCSJ5mwf
 dZr3pQD5KswfyfofrZ1is7+YjNm3HbuwRS6BODkaLmfDgmpWswjtMqj14vWcfaq5Evqf
 r8tn6a0iTtDo5r6tU2xfTm8gzgmDhPjDJvHLQMUDAt6B1JddEbV0UgS5v4e3tvu/8kea
 t3F94MMl1byFw4ZZaUn3BhcZR7UMC4fqyL9adCDdMUb5xV2lKRYRfjT8SWDTwr8IcXbR
 vM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OU29sLolFBKRRrM2SwmaE/cR08rID9BsyZV6fg0YEgw=;
 b=djU0BRRGszzCmfoYChmmxIcfVZGerPlV3NREXFQNlQzZyrvhjMHKFwYj6nRIcl06Pc
 raa5zSUZ8kNV1MfCsePJcxZH8mBwEVG+rn8lm7AUhsMDJBMTHi9Io2s4tG+etjGQwNgg
 yl8/ZDMLZ+v8dQRatapEr+pBLblPBhmIrvoqQhnSvfJwjjDhnRj+P7OAdprbKZB97z6Y
 6uf74z9YsaTwYtMwzStlz0kizvJLHzggOohNGBaHZ3ZIAHlGFar/cyUyRoTT3/zbCcrF
 AD+LY/5vzw/p4tedXNeGkiN0L6n2B2EdkuxrDsrA5lXz64YAXO69mdTlrgK9hVmPMYZo
 IVYw==
X-Gm-Message-State: AAQBX9dT/HwoD0Yo6qWkNYHYcw5f0g0pURXpl2/vAIuBOHhmJBmLS6JO
 HMqJDiO/Od2ZdVhu/kRxqdJZ8Q==
X-Google-Smtp-Source: AKy350bXEOoF7rWHlL8fzzu9oZ6TpABcoX6qKLw/hdmAZRE2CTKjJfGoxdLsmUdIdnZ//D83I+EngA==
X-Received: by 2002:a05:6512:971:b0:4dc:537c:9229 with SMTP id
 v17-20020a056512097100b004dc537c9229mr1340343lft.30.1680677443526; 
 Tue, 04 Apr 2023 23:50:43 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:37 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-11-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 11/13] mmc: mmci: mmci_card_busy() from state
	machine
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

If we have a .busy_complete() callback, then the state
machine triggered from the busy detect interrupts will
determine if the busy is complete or not.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 92a49726cf83..2779d4985b63 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -339,6 +339,14 @@ static int mmci_card_busy(struct mmc_host *mmc)
 	unsigned long flags;
 	int busy = 0;
 
+	if (host->ops->busy_complete) {
+		if ((host->busy_state == MMCI_BUSY_IDLE) ||
+		    (host->busy_state == MMCI_BUSY_DONE))
+			return 0;
+		else
+			return 1;
+	}
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
