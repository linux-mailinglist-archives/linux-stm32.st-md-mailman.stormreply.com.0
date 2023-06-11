Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E372B3BC
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jun 2023 21:41:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3586C6A61A;
	Sun, 11 Jun 2023 19:41:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1616AC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 19:41:42 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f61735676fso4229241e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jun 2023 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686512501; x=1689104501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZK0mkbjHAu8JAeEkTRBOfo0afA15/I72HAPEj6zPizo=;
 b=lf3qjqz6c7HOa/hWJYdEzlwmZ9nRwDuCifWRyX10OijK5MuueM4fuIU2gL+JiQcCKY
 KT1uCtul0Wsdx9fi1ULMuQsfdwxIdme8/sclPwDmqthuCTt3rhWAnAdKEOjX/8UT4mEl
 m6BfyjV/x+1H5Ewfq+jitm2R24ATsNk/mtyAjMGq4RWOeMUHF4Qv2Y5LU0WN58tm2o7U
 Y1oJhrrRqf2I80ltpUPspXQAgVFe0ijwB0Z5v9A0/Hig03KS+3KNppMoxwRjePzNFFPH
 LN6n+ATRHFbffJqN4whYJWFWnCz2yVzcboROJ7gc25MoINn7IO4Eq7hcd50F/Bk1w0wo
 BkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686512501; x=1689104501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZK0mkbjHAu8JAeEkTRBOfo0afA15/I72HAPEj6zPizo=;
 b=KuD8pbLMgn2yFsUbsev9qEvEDz9iSnnKr4khh/2IqHqIcMnHQbhdJxc0GJ1JqqU7zn
 1t6cTFU900/mN1nWVks6grPIzBQH4QFEL/Nevyfe0VyX87eTXanpsZWczgcQvyBovNh1
 Rcd0Y7UR0EzlO+PFvJxUuJ94kq70srYqU6xxkqyPvNjId7haCspeOrrJeMkRJziWl5Yk
 7OfOEQxcBGhaWjZJv6aOhHJb6ZpEyW+sFuAXHQt2At0/1Xj7f2RoIAIkYFTVreLThOws
 kAZMqrUf2XcJq05XOWnSgQtkwhlyK9cSVfs3NkpySkBj9MkeESSPrdZWnmKXDVAZDKlz
 BRzA==
X-Gm-Message-State: AC+VfDwbwDWCjjkf3FBglDO+NoKtXmx6t/mkPDee8t2MqcDvkyyB4GXa
 xlPMbimhW9cCFk+Vv7NGWeKkwg==
X-Google-Smtp-Source: ACHHUZ7jKBMBuYlNtBKwlZYc72v7+1ashCmnM6/royQj08B4wm4S141TRISJSSuxEpWDx39jDiuYSA==
X-Received: by 2002:a05:6512:614:b0:4f4:aea9:2a2f with SMTP id
 b20-20020a056512061400b004f4aea92a2fmr3634906lfe.57.1686512501410; 
 Sun, 11 Jun 2023 12:41:41 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac243d8000000b004f14ae5ded8sm1246960lfl.28.2023.06.11.12.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 12:41:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Jun 2023 21:41:27 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v3-1-cd3d5925ae64@linaro.org>
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 01/10] mmc: mmci: Clear busy_status when
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
 drivers/mmc/host/mmci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index f2b2e8b0574e..14d639872952 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1238,7 +1238,8 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 			c |= host->variant->cmdreg_srsp;
 	}
 
-	if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
+	host->busy_status = 0;
+	if ((cmd->flags & MMC_RSP_BUSY) && (host->variant->busy_timeout)) {
 		if (!cmd->busy_timeout)
 			cmd->busy_timeout = 10 * MSEC_PER_SEC;
 

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
