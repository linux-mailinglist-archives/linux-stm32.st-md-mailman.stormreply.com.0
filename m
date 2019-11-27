Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1910B3C4
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:46:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 562F7C36B0B;
	Wed, 27 Nov 2019 16:46:02 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66FC7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:46:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i5so2880196pgj.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tj5ZEHjlL0iZSNA+rHkAWXmN0KEeZgtZHyN1eOwk32Y=;
 b=k9J2Ifpg4j+1FH8t6rWuy0uynpeC4gjGtBp09I2ky9UZukixjIow3FIhPcE2F/M7ED
 Tc9yNQguerPjWujTgAKtdngHQiYwOFy7g8DyinPmwYSOd2biBcy3hDxi+0zd/H2CKPoR
 ZOkXucWQZEweQ9f+CBAle5Wcrb5VK6F2pUWErYXFH7Zt8dQ2FOeuaKDQt0g9/x577lJr
 LbAVBHGx7hv+F+mSttjNRr7LM4CIcFHO5INuzmF7sr1tPLrNn9hSUd+8jgqPNdzoEgWJ
 X2bWOSjbftKm/ad0Yy4j3knPQVjngjsE/9w/L7TXAS5RUx6w1XSKp1uda0Cm/nfUg+m0
 c9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tj5ZEHjlL0iZSNA+rHkAWXmN0KEeZgtZHyN1eOwk32Y=;
 b=YB6iWPWFzVHaFtVBVeM9KZ+KIWjwXYFhwodnr9Rw44Z2lsWx5qc5YLFbeBLLCJAwnb
 TwWpgB7JQE1uXqOUgvLVg+77Swx8BlyJc3suWv95UF6QmpNWbgWf6MyVXsd0W4WfWuz9
 FMaZJk2u+GHflAay9JqVMj62+82vNiE1oKry5hLfdis/uLygCSniH69/pJ/i8bGBC6U8
 n++L7iofp/Q64g0TiOujj6t68d0zH7Hx3oGPTabkhKTOuV1nEqm/Db4tRQZNpwT+UXQ9
 XK1m7qVWqNgBcYeOMUkk2TOLXTl1CjmUPzn+t2JuUAeDGH9qn0EBOyIOpDIV2t3mZKy+
 EJBQ==
X-Gm-Message-State: APjAAAUwyiAAqsR40iqi5RLtxNssEcUM9gcSOsdm1IIOgLp37K2s61VM
 eTfhNRcog8awlbjNQZzfM+w=
X-Google-Smtp-Source: APXvYqzlUwwE1e5ZlvYiDCVGgUwc4Bu633wd7znJmjBhjUROKMtJj5O/PGEBApa4LvO6N5r6fvnykw==
X-Received: by 2002:a62:2686:: with SMTP id
 m128mr48513352pfm.143.1574873159861; 
 Wed, 27 Nov 2019 08:45:59 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id i9sm4113911pfk.24.2019.11.27.08.45.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:45:59 -0800 (PST)
Date: Wed, 27 Nov 2019 22:15:48 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] pinctrl: sh-pfc: Use the correct style
 for SPDX License Identifier
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

This patch corrects the SPDX License Identifier style in
header files related to Reneses Soc pinctrl driver.
It assigns explicit block comment for the SPDX License Identifier.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/sh-pfc/core.h   | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
index b5b1d163e98a..5ad0ab8f9e14 100644
--- a/drivers/pinctrl/sh-pfc/core.h
+++ b/drivers/pinctrl/sh-pfc/core.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * SuperH Pin Function Controller support.
  *
  * Copyright (C) 2012  Renesas Solutions Corp.
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 640d2a4cb838..fff9cbb7a0f8 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -1,5 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
  * SuperH Pin Function Controller Support
  *
  * Copyright (c) 2008 Magnus Damm
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
