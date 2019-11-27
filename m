Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D910B3AC
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:42:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DFC7C36B0B;
	Wed, 27 Nov 2019 16:42:47 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00AD0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:42:45 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z4so11280417pfn.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
 b=aaLImqaXXEFyDQoHrPEMGh8ndhdl9gZJuOmHyu+pZZDTZWbfo8bKC+whjrSQVWhuxU
 NYt+PbFK7OG+rEYQVDWtB8A0KHHEIDstj61l0+aHTIFEZ3ibUY4OeJYXrC+28XbcaqqY
 atqmBXE+O4sp1cYypiKae5R6bxlRt8myyVVJ1So1UTPM+Bv2pXNfGlal4+Fo2eYANxA/
 b9F0B4VdjmNO6gO5aXgVhVpAa8kcNBSkcwJzRmb4430VOcNRZAgSNLtP/9Oiq7y1w4ne
 sjDEqe9L1scDSQetQaLeZAncSNqzJT0GL8oFf05RRmWtALJqS5XFvK2+YIZ0W4zrVlL+
 F/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xl4Glegm6mdECeLqfmquxCwZlwbSQB4i6Znnj9ZE+DI=;
 b=MKyhAOhuvpZcbd2G643iXHekX4d2PYwFYI2qKmMP0IoH0NtzOef7TdDr6iVWw4rdTr
 J5TxZ2vmTExm8fH804esYHHInrLKQoCaUbyRIKLHKdZzQXSJVnjZ5KSnf58GN8NzK6L8
 zAEt9Kst9gZE/AF69eWHkwvdgEm4XeA+d+fCzSujSmWAs9Ybz9A7HUeTUGzXB7D7iT6K
 +J2d7UJKAppqha8bs1OOIxjLBMCNdnXEqQV/Q6g6ekb4smHFWpTPYDjCjZ0tNitotZRU
 NVUSX7/GWKSbL3KpdlecSfVOVx8zjCp+x6IX220YinO0PkU8d7qKr1ZLffrs0KVqV3OX
 Nzqg==
X-Gm-Message-State: APjAAAWkeAXEqhEkYQidIi9iBedhwyZDJp0jqk+XHza7q2fTCYtgRsl6
 qBgFCPqcpwVN3qDHdEneJvo=
X-Google-Smtp-Source: APXvYqwlDU2Ab8PAuwqLDAc5/btU/U8B8e0EchIgGnZlTuxZOq1jBwxBcCm7mSvfv1ntAHxZjKgsbg==
X-Received: by 2002:a65:590f:: with SMTP id f15mr5870948pgu.381.1574872964385; 
 Wed, 27 Nov 2019 08:42:44 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id v3sm16827100pfn.129.2019.11.27.08.42.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:42:43 -0800 (PST)
Date: Wed, 27 Nov 2019 22:12:33 +0530
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
Message-ID: <2994fb2f3375790e832396cdbb0a279dc8c8839f.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] pinctrl: mediatek: Use the correct style
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
header file related mediatek mt2712 pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
index ba2356a8ab89..845c408b5fdb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
