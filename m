Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB510B3B6
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:44:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 371C0C36B0B;
	Wed, 27 Nov 2019 16:44:37 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1DBBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:44:34 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id ay6so10042419plb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
 b=IrlA9jBoYhmnJLv3XX1CbNuYLMmcJ20omNiqylLbqKNY7YXmt5Qg/tzaiDbcvEWRJK
 LAHOhWLyA/laKOk7HCohToz0fPm5rZ5anSEPArvahmgydJXYD3d4FJ3loZNxqXeNWl1y
 wtepn0Z6Bpw2qvYFLZfU3TKSbDcDJBi7F+805QOAsDJrFTbBkgAr6IDkKcb1mgHK26xx
 7dH6YKmNo7AA3SOht4pAksRArEDouCbxLv/ZbHdVujMaso/1Il1sUuXGTjNla8xixG95
 AkBCdedD7tjrwJxwv7h4Mjl+WBKvopx/3Dnfvhf99W9n9FKhOJFvkpkzsqY7dQT1aWUN
 tKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=whErUc4BDiJMZ5xY3J/KJ/8CM+fMkJiEkPObAvIrJNY=;
 b=RtPWo0CtEVumguI7bSN0magMFOnaX0P09OIK0baYRED7xMTKBJIuSzmmHOaFZ9pXRQ
 HMGfvzO2oSYqgV1TPDDv+eIiw2cFqpIGOcsCppCsCLnWSJbzm+vJlToMeNZVai5cqM65
 B9uKcCGRcj/aRLljRenKe/16AOG4QGX1X3WZnSgrKmW+xmiss93kqCHsKToQRUvaqCuX
 gRVHwAAflWSiH/m013dGy+p3cj+szcwh7OPxtngDcvSXTZ5ma4VNJmGqmqGKkdAnCK8O
 POJTHRFNWgX3/TCHTzl6YEgFhWT8TkIjtHiVP104qcr/Hye0ugnQEMqrKKJJreS+5Vj4
 qmzg==
X-Gm-Message-State: APjAAAVTq30oi1ZS7/w5f3Jv649GCevwsKUYyuUuRNb3UvNuB4imfH6b
 W/2iMuI8IRZXDe/PWt+1o5M=
X-Google-Smtp-Source: APXvYqxU5CUXFdGJB2Ooeq9rK1fyfcqrLOz+Hg0d0n70pp541B+B9o7dx7Stb4JEkXaH6oaMWoeZug==
X-Received: by 2002:a17:902:bb84:: with SMTP id
 m4mr4987230pls.255.1574873073243; 
 Wed, 27 Nov 2019 08:44:33 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id z11sm18371211pfg.117.2019.11.27.08.44.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:44:32 -0800 (PST)
Date: Wed, 27 Nov 2019 22:14:22 +0530
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
Message-ID: <bcb86aa22d8d8499502bbd8c54a364be24886a86.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/5] pinctrl: meson-axg: Use the correct style
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
header file related Meson axg SoC pinctrl driver.
It assigns explicit block comment for the SPDX License Identifier.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
index 8ff88bf2e849..aa79d7ecee00 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
 /*
  * Copyright (c) 2017 Baylibre SAS.
  * Author:  Jerome Brunet  <jbrunet@baylibre.com>
@@ -5,7 +6,6 @@
  * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
  * Author: Xingyu Chen <xingyu.chen@amlogic.com>
  *
- * SPDX-License-Identifier: (GPL-2.0+ or MIT)
  */
 
 struct meson_pmx_bank {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
