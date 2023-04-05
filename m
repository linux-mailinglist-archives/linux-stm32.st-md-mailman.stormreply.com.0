Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9EA6D74AA
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9C39C6A616;
	Wed,  5 Apr 2023 06:50:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAC64C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id h11so38355630lfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JZaLiA0g44U1TRcntaLQYKCUF28R2/Q5H+MPwsKmLwc=;
 b=fL7wUylNUaTmX4XGMPv3Cf3g4V40XOfdDDRUJhuxhA1S73DqkqRsTKyTkpRo26F3I5
 wYiswhO7fQSs/zhzMjc1rSdhzmAYgDucl/YGPmUPSD4/mT5Cc4ksFxdxx/h5oBn3KP2W
 7ChV88hCqTnfVwOqgqDN57/4ncGkTnsTfvtEp250NJaW0UQVSs981X4E46XHW7rdXf8E
 iSagJzZW9Vc61fAU6Amnh7D02OZZOpa9vTxS6ckzHkPS1rJN7bmLTldumT91APF2Vldl
 ttmxnsQ2LZcprscsEi7Dp7bsDPEI0B8oN61ccha3C+Jr2DTFd5sy1VvHmPihFCFhgy4q
 D9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZaLiA0g44U1TRcntaLQYKCUF28R2/Q5H+MPwsKmLwc=;
 b=OnDZx+D9aMPKqsfxjg5aliKAlVYdBOLvLtVpQWKY0PLmc/qcxu380uTw1t9d/ypjLc
 HnbW1NjQq97IBQaio9aHX9DwaIo83XiTKNaXbkB9/vrDgzslR98OrwmK/TyP04rKnj7a
 l6jx/0AaGg4KeLIp5uKR5R/SvS+cjYYtH64ewxL4vs+C00eKhReyrQhP6ZKy5w4ssX4B
 bfLiz/aFXHfWcG/CB0Scu8LeF+4I2GLb8qb2MdExOSNBKMZ66DyG8DyoiQ/Et+NNX1LR
 DN8sZhv+SAv0RuysKvkQN0zqHaIgqAotw4ELcWo76gPTD+U/WwhFJdqXBrnIfra9ru8i
 N/fg==
X-Gm-Message-State: AAQBX9fZPvN2s2VGkeuLnxaHTpO6E61OECyH+61RhFAX2EDI1RctKo9v
 E/5rQO35BbLNwc8lD3HUm1CFtA==
X-Google-Smtp-Source: AKy350blL9duykk1KRNQnFkCyz/h8/m3XElkUTeiFRvWyhGuExbfjktkfA11jOcl64HmbSeHNW8YWQ==
X-Received: by 2002:ac2:55a8:0:b0:4e8:3fc7:9483 with SMTP id
 y8-20020ac255a8000000b004e83fc79483mr1370064lfg.23.1680677438330; 
 Tue, 04 Apr 2023 23:50:38 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:31 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-5-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 05/13] mmc: mmci: Break out error check in
	busy detect
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

The busy detect callback for Ux500 checks for an error
in the status in the first if() clause. The only practical
reason is that if an error occurs, the if()-clause is not
executed, and the code falls through to the last
if()-clause if (host->busy_status) which will clear and
disable the irq. Make this explicit instead: it is easier
to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index db3a8ce27a0e..13dec2e09164 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -665,6 +665,15 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
 
+	if (status & err_msk) {
+		/* Stop any ongoing busy detection if an error occurs */
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+		writel(readl(base + MMCIMASK0) &
+		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_status = 0;
+		return true;
+	}
+
 	/*
 	 * Before unmasking for the busy end IRQ, confirm that the
 	 * command was sent successfully. To keep track of having a
@@ -678,7 +687,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * while, to allow it to be set, but tests indicates that it
 	 * isn't needed.
 	 */
-	if (!host->busy_status && !(status & err_msk)) {
+	if (!host->busy_status) {
 		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
 		status = readl(base + MMCISTATUS);
 		if (status & host->variant->busy_detect_flag) {

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
