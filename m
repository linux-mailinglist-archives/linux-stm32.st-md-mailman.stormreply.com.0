Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF8E1E3A63
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:28:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78B55C36B21;
	Wed, 27 May 2020 07:28:31 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4A2CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:28:29 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y11so1534384plt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/JV/008aPSkYotGfzM+L6zI+gJbJzTnEPoCKhdwlcaQ=;
 b=vVzh0duJ5UBz8i7EQglR29+3vO1ID79mbmwybvUcue74rvWvRigpxqp2ZVr0rab8e/
 Ry+7PIzSqJgossPgzHagNkc8BPkm3Z0LmHRCYUYMdsPKmv13jv5jgQTLyV598te+V/7S
 hqKUWRB04esPX6hcJbWLwzZbw/an7UI8rmCm4mnPxCTLeCBGBDFb+ZGq1l0/ewgwzmrC
 yyYNYr74oCMw9cpd4O/1QrtJhT0KIiKl20sUb1Sln7SGprcAslSYRWpjmIuzG+2ur+6K
 5JLbT+St99ieEkg+3fQ3MDwNRLoWeGDiEfLKkIt9bWYn039LtKtsXlf6lBBtvx3X2cNS
 QkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/JV/008aPSkYotGfzM+L6zI+gJbJzTnEPoCKhdwlcaQ=;
 b=o8ilhO2kuMVUkvoKNJe6R97Q/RuIDfvdy78I3EMybTSFr0kWHdC3HsGOWaKS/4QENr
 lXEFpAkbZEv1P5T/Xaefk3wA67q57SrecHpDphHjB4Q3xwPKYh7lJQ2naUSk/czvtRNk
 rCP7Ov2h/6JTjCpqWGyIirYLVFrrKqd7aBw6tVoS6WfjLdjhw2MFQPKJKmuZZIolWdEs
 mfaJkJR2D00mDjGO839J+b+r+1kdWfsQQkHoCvJx/8jGp7dnjcW1jnOO5VgpO+IABSLz
 X+Lcnd5IWxEB9dUjmXLAWOzqSe1yJLkuYrIlK63CzuWRK40FHHrCFAVtKSknxIbxrcna
 euEA==
X-Gm-Message-State: AOAM530Cv+xJqJ2XtxMquvif+slPp00m1U5Q6fTbeSPNr1FqqyzGKHap
 88fb/lLnAtZy3eodfhBNNIA=
X-Google-Smtp-Source: ABdhPJymWe4FoVyYbDrlihjLqkxCoTA9jfDcSnxcM8g8a/J8skMLtS/pkQ9CFWP8NSn447pUr7X8sg==
X-Received: by 2002:a17:90a:8c95:: with SMTP id
 b21mr3540607pjo.89.1590564508451; 
 Wed, 27 May 2020 00:28:28 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:28 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:33 +0800
Message-Id: <1590564453-24499-10-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 9/9] spi: flags 'SPI_CONTROLLER_MUST_RX'
	and 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

since chip spi driver need get the transfer direction by 'tx_buf' and
'rx_buf' of 'struct spi_transfer' in 'SPI_3WIRE' mode.

so, we need bypass 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX'
feature in 'SPI_3WIRE' mode

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c92c89467e7e..f8844116f955 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1023,7 +1023,8 @@ static int spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 	void *tmp;
 	unsigned int max_tx, max_rx;
 
-	if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+	if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX))
+		&& !(msg->spi->mode & SPI_3WIRE)) {
 		max_tx = 0;
 		max_rx = 0;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
