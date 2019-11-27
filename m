Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AF10B3CB
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:48:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E785EC36B0B;
	Wed, 27 Nov 2019 16:48:01 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 992A3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:47:59 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ca19so680327pjb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9SZAmWvTSiI+gHLgs5Po7ArlmvrbXeX2vqZ4bfPjpcs=;
 b=bVuk4J6e71rPLDTWea4PmbbDyI1l7WwhvvuQPxoo5ZcZ+tUzptPml87q3c50o92rSb
 o5IRsIZ8Egk8d93YITnfjKr+EJHRDVe4wUABMkWcK1SMJqHe8V7WFlZqv13ap+g7Zl0B
 yS66lfpC7NQrIt0Tcrc4CjnhgIvttv5Km/TpjcPQ/PvZW4s/RZKWBIMu0A/pExYsEXc2
 oyd6YM7NZgjUK/fRtLJwE+n6olKwLe5eg/0DIPa1cqW6IZB6x4AODFc2GUAUsScfV27Z
 Bu4piH4y+rcvrkRl+DfEwimTYhXtCxyeXVQ4BJcvHWkD42uGT+UwxEkxARnoMaw25qTN
 KCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9SZAmWvTSiI+gHLgs5Po7ArlmvrbXeX2vqZ4bfPjpcs=;
 b=HLe0StWo5MCfpl3ImsDIDUbBeL4kWUTnnEPTdZE+hcNvmv7auegIvABki4PQgHq49E
 zoaqwQRgTZhnP/xXAOwUx3Cur2/JYOYOWt7Pn09CB4purMvAsXtEjbyTBdAIrHxvLBTH
 kLiKVxMhPVbekHLyTdas9lPPcha9zVAKzSRfBrwGx7R3Ehon9t/x4iWZ9wBUYbEt7f1y
 0ukM2gmBVoFf7INrRx6OiH2hVVSUASblrckDVL2ijkuIedhBo19B/O3aJor2TEiFTkdt
 E6R8axyFIo/PR0dBmKy17fvHDPGSDVeDxMlw08Pd3IdBCsrlsO+6pJ8Xe/0K/8Ek563y
 9+Cw==
X-Gm-Message-State: APjAAAU+X58S8q6BKoJXUYr3XCgzQRQQEvgMTbAUevnDq6yScznS1F+j
 FQO0M/zF9XdUPC+UC83w0QM=
X-Google-Smtp-Source: APXvYqzi9jGmQiu2kA4LX2jnITpm6qRbd3wi313jRCjlpWXyLG1o/AqnWEHm4gPv739pkR1Ong4KUQ==
X-Received: by 2002:a17:902:b702:: with SMTP id
 d2mr5147195pls.104.1574873277975; 
 Wed, 27 Nov 2019 08:47:57 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id i9sm4117846pfk.24.2019.11.27.08.47.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:47:57 -0800 (PST)
Date: Wed, 27 Nov 2019 22:17:46 +0530
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
Message-ID: <14bb695da50f7af8499e7dfc32c2ab753d92a3e9.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] pinctrl: stm32: Use the correct style for
 SPDX License Identifier
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
header file related to STMicroelectronics pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index ec0d34c33903..b0882d120765 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) Maxime Coquelin 2015
  * Copyright (C) STMicroelectronics 2017
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
