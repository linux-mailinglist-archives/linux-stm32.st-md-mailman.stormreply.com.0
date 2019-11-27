Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0510B38B
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:39:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6EF9C36B0B;
	Wed, 27 Nov 2019 16:39:04 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 800E5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:39:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b137so8832496pga.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
 b=q6/t6QHFrX/IIKybww/twC4NWcDBGujHbbW6ZuVds6JG9ulrqK5lGwr1HEBFZ4qBMz
 KqP6zyPrBs3/04rc8fYDrdNoQdEevLJOUBc8uPUWa+zRDeHtu8gR8xl/QIibsnwYu0yL
 UoN8lGq5hVtEUcpRqBZH8G0VcwLCbbVIwQNS/gH4HJ2CfGuoozN/DCE7dcd32FEsYFb4
 0EzrAg0jCspjpo+faC6Swl+nwb9tiK0BlLK9a+ro9ULbguCqhX1B5Hgz+HaxnPV0DafW
 ov01MNMyPRgxNBLbfpIaQoX5yHLNMiAgPGNW2CvWdKalrlQc+yPBiubqa6nDWJtJDMfy
 RKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=a5uCI8sDk06L3eBN4lbKYbKhhJe2khqKsQK/HeBIflE=;
 b=CCy+oNYTzrF4GF/7PEL2IlD5gv0PwQsXewB7KGdIH/KAepxenYUpuxtSxD8y2eH94E
 bIePLv4x4APsdx8UQ3uJMIxNJMpPp21qAE/gJ5qHwQtvrDMXOfMslZlya/qTJe9gkvG8
 SYjdN2eGp0MmqLum1ydJSRmq9VrWyAtTy0JPHQkAHw8V/UTDXBY4uY6oZh4w9lpcyldI
 5br1RT7xs8BIsTxZSWla0Oxsm+HkQU6wO7uuPO4vIEe8c22pX88qtZFlRCmmZAxH6Q9A
 Etqem2yiKMY2PlYl/BFwrsd3eu+9R0Tdw/1+HoMbtBG+UES4C4AKhViOFgVF1p8X/PXF
 31Yg==
X-Gm-Message-State: APjAAAUSPK6ZKnu2LDjmFpnJ8cWFGABot8W6iXKRnCevWXuLABIPhZny
 o8PYloRYVq4N7oPR87THyQQ=
X-Google-Smtp-Source: APXvYqyhFzYRUOGgpal+39IdvGP69h56LXE8h32YtVVh0FuJl/Vspv8GKTCoDBf/zWCNFBX2XPiQ7g==
X-Received: by 2002:a62:aa0a:: with SMTP id e10mr47148355pff.46.1574872741931; 
 Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id c17sm17084710pfo.42.2019.11.27.08.38.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:39:01 -0800 (PST)
Date: Wed, 27 Nov 2019 22:08:50 +0530
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
Message-ID: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] pinctrl: Use the correct style for SPDX
 License Identifier
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

This patch corrects the SPDX License Identifier style
in the pinctrl driver related files.

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46
and some manual changes.

Nishad Kamdar (5):
  pinctrl: actions: Use the correct style for SPDX License Identifier
  pinctrl: mediatek: Use the correct style for SPDX License Identifier
  pinctrl: meson-axg: Use the correct style for SPDX License Identifier
  pinctrl: sh-pfc: Use the correct style for SPDX License Identifier
  pinctrl: stm32: Use the correct style for SPDX License Identifier

 drivers/pinctrl/actions/pinctrl-owl.h         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 2 +-
 drivers/pinctrl/meson/pinctrl-meson-axg-pmx.h | 2 +-
 drivers/pinctrl/sh-pfc/core.h                 | 4 ++--
 drivers/pinctrl/sh-pfc/sh_pfc.h               | 4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.h         | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
