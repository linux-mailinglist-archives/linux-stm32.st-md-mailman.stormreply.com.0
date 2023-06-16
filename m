Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A287329C8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 529E6C6A61E;
	Fri, 16 Jun 2023 08:30:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 004D9C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f642a24555so473952e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904236; x=1689496236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qAY1A0L5J452WPGRxo2jOeYk3l6HQDTQHokl5FBzRto=;
 b=TLXlhCuU302ifQfNQoGNRhJC8CZdyuaqtoALXuOD0e25eDoWqDmD/Hm7GrMB2U6RuU
 43ZFqwdNHyl5blYFuUsU0PioZlXOFbTp1nzMPHS+uRGrlm4KZrdGRd5h8vxFXHgnc59/
 FajLrU8zRg7HRmnmJifqmHFelmjJT0Kc+QbVOQ1geIela+/zEzI7Ix1vSA53P0F9slGR
 QPVrgEC3cNTARH11oCYogx3maZZwqRvlgT57Z8VDSK8GJAhiEMmIN5nF8Clx/nQff7fz
 9NBsCdSHTSwPF0Mafwy7Y11Yy/lZstY/Y0bQRAWY1jIHkYjRETra/x6lj3S29wVupsGy
 /VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904236; x=1689496236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAY1A0L5J452WPGRxo2jOeYk3l6HQDTQHokl5FBzRto=;
 b=Gn6tR+yaYMaySG6u5lVPFsfcYi5t82PJxBydVXdjoSwSzHGqx8xOPTp9kqDZ9I9VKC
 RbIZuIePW3dSnqFDFMA30OE9gEv30J0pFRmZSF9YlPVejrMAeTEqkLULkmZ4YiN5X82z
 POXd01F4XE8H/k6hUfORhY1yxq+4XvNNjpIMh1z+8Wq0unUcemiH5RmE3uUSFyySm0Ii
 n23baB0ch7U9e71V4+9xpT0kApZeuZyK4s662yxhOKSX/ZOIQOevTW0jvMJPfAyyzx8I
 igWPYX3WlR47sc4oZVkYkL/vxfUbsWHU2KB31TeZoQXK3ZEUFf3Y+VpN4qrE7waTAFGy
 d1sw==
X-Gm-Message-State: AC+VfDwIVu/QJmXNuCa4iTCe85+iUMNTpLu0719vAocgUhV6D1yn6sUj
 y7GIPWChRrFA9gqUZqeBac8QeA==
X-Google-Smtp-Source: ACHHUZ7BSgxJiY9sOkyLihVNLPsqyXx/q5hvthiq2DHxAnf55Cs1Sz0NyP2V6OPFvMmmxmRajzwqyQ==
X-Received: by 2002:a19:441a:0:b0:4f5:bc19:68dd with SMTP id
 r26-20020a19441a000000b004f5bc1968ddmr737690lfa.53.1686904236383; 
 Fri, 16 Jun 2023 01:30:36 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:35 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:33 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-1-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 1/9] mmc: mmci: Clear busy_status when
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
ChangeLog v4->v6:
- No changes.
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
