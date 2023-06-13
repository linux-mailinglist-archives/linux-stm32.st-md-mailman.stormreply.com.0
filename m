Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1C72ECFF
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:34:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FDDC6B454;
	Tue, 13 Jun 2023 20:34:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20D7AC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:34:27 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f63ea7bfb6so7127562e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688466; x=1689280466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S7UBLcTRqRDwyg2dTPn5N53PKfQxU1SA5dNqRVb2SiA=;
 b=MVhtYZ3zaidcK4sb8yl4WR2oTheh70dTSCD+vkNSi7R31b8Uk+pqOR85uMtcRJVv/z
 ctEXi/2cgxkQmfbvlqypQYC2tqRy0H2ErzChOE4aztJEjCguhjQfsjnbI8/VsQzEe5bN
 nkXBa+0Au3ZT559GepoJg6jOxrRo1sWBM58zSDt2qj1kWe6R7HTZnvDwWzoOCJLbTwjJ
 TciLFO3X1+KGuxcG3ebuZENy9Mq/xc4MewlBvcTyZw1k/+T96M7ChJqrgMud2J/j+B8S
 sEKWs8z6vf/Nvkei7Z4jGF6cGTq+HPgo0Oqi8F7Q/gXoR9p5lZKknqCCem9K9eG2yJa2
 Kaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688466; x=1689280466;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7UBLcTRqRDwyg2dTPn5N53PKfQxU1SA5dNqRVb2SiA=;
 b=YjIqNN5upmAIZg7IRoPWYrUf2+B7THYrdf0S35E9hyJsmrB+KKz1lzt6rsSGxRpvjx
 5jkMRy1r+CDIHe0XWwd466i28KeN2OewASRMDVjIvH+7LcEkvWW84kucOOO83nNWAxM5
 Fzfjbq2taWTIXY3ywDL0qdvQizlHdu8EslqtkdmEQIO0IL0DP+RjsUmvugYmKlZOguAh
 XHi3v1HiH3s3VSOZpTp2dZszEhIMzu35nmfnDiUiOLtsHuoMPArZ9aCjVZiFAoTE2liI
 CrtHADP3efLBxlz0ue+D+AqOduDCRL3O3N32evdBD+JPxO2q6ffZLiFqriuy1dlkwJvs
 Vhaw==
X-Gm-Message-State: AC+VfDzZJVbG4q8H5j4rDgXpPztQkEpQvNNx3+EQmB4PWa3p91tws7mP
 Wdgl44X2LOA4DUQKjaXnu8Tcyw==
X-Google-Smtp-Source: ACHHUZ7W4kB0+K6j6YMrWQpjURfpqZwC7/r7SId+XagPh+drqL6h7JN+J4aLHswQiULgS5gxsosIyw==
X-Received: by 2002:a19:8c4b:0:b0:4db:3d51:6896 with SMTP id
 i11-20020a198c4b000000b004db3d516896mr6367821lfj.11.1686688466325; 
 Tue, 13 Jun 2023 13:34:26 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 l12-20020a19c20c000000b004f26f699e9dsm1897813lfc.184.2023.06.13.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:34:25 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:34:17 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v4-1-df9c8c504353@linaro.org>
References: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v4-0-df9c8c504353@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 01/10] mmc: mmci: Clear busy_status when
 starting command
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

If we are starting a command which can generate a busy
response, then clear the variable host->busy_status
if the variant is using a ->busy_complete callback.

We are lucky that the member is zero by default and
hopefully always gets cleared in the ->busy_complete
callback even on errors, but it's just fragile so
make sure it is always initialized to zero.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Fix the oneline stray change to semantic order of busy
  flag so the patch is the oneliner it's supposed to be.
ChangeLog v2->v3:
- Clear host->busy_status no matter if the MMC_RSP_BUSY flag
  is set or not.
- Now we have an if inside an if left, so combine these into
  one singel conditional.
- Resulting re-flow the if-clause.
ChangeLog v1->v2:
- Unconditionally clear host->busy_status if we get a
  busy response.
---
 drivers/mmc/host/mmci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 97a77eefb11a..0a4b6b6e0f03 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1238,6 +1238,7 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 			c |= host->variant->cmdreg_srsp;
 	}
 
+	host->busy_status = 0;
 	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
 		if (!cmd->busy_timeout)
 			cmd->busy_timeout = 10 * MSEC_PER_SEC;

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
