Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614110B39A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:40:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA306C36B0B;
	Wed, 27 Nov 2019 16:40:47 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64525C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:40:45 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o8so5664151pls.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XxnZyGcP9Rmlyi/FludPQAATJUUTPMQYYmErZMfJYoQ=;
 b=e+kP32NcUaqG5wx8/nGkohEXD3ItQ8/aha7ve3XqxfVhMblGDvxeUUyCNi48rX4WAX
 G2RH/hCsTv8YroV9j5FaPEN4in8mhio2C4a6/8xvcdfkxy+4sPu+JgE0eZX7HUuqCimG
 eMy/u5PPC3X3Eee3qtbxFY92aAGsGyLaWdW5Pj56veJNVw4uPbn6T4odwbKXc36gJnCE
 V1IZ5CUqiLZ7f32a4/4vsWG2mZM8X6Y3h/e1lTBU5P9Pf66sd2HzC2py/NWzkZetZOYZ
 YGRF4/bj2J9Z2DtLX3cRou4KkuT5D7LvQVS5uyAeS7K2uX24K9BzRozkqmt9S6vQ0qM8
 ftcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XxnZyGcP9Rmlyi/FludPQAATJUUTPMQYYmErZMfJYoQ=;
 b=K5mPjzIQ4DiRc2B9jfzJAG/DUlCh282eHF0aaXdip72z554umN7lrnx3pIQn2mNQbi
 lOJjr1+ooW7aXTdNaMebfFCLBXLCZJAGBAbbC0fiSPISB8gtPOwfTPmIB41+RN1xqP0B
 isLuRnAcS4bWNFAtLA7HDFn/k+NM7HO/k9vM8MXmLHLa/i81W9co+IqwnpfHwmqBThrB
 7vhhzps9yWkmK/4qpiKkMKA+cLnRu2IyoMK34fps7FyhPRoWs7Baf8nTD4NA+KFg9wxO
 ZEKQ6E7HBBBFV4NPTUX2DSm8vKATk/7zuQ2wnDWy0EdI2msv4TQZaqf1CrRNSlYQNu3E
 K9dg==
X-Gm-Message-State: APjAAAXi5N/2xNugN6/6sO/buk4QZIJTevcpc4SppOSs8Fyt5JrWQ7+M
 ZUem1kk/NJOYtYCyzd2krJc=
X-Google-Smtp-Source: APXvYqyOTdv5RtT17pzoqksEp4sCN6AzyskRPbgNbPryeVBL24MqJrBpusefhvfglg/U4YVOO8vpYw==
X-Received: by 2002:a17:902:7586:: with SMTP id
 j6mr5091675pll.43.1574872844265; 
 Wed, 27 Nov 2019 08:40:44 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id y17sm17002645pfl.92.2019.11.27.08.40.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 08:40:43 -0800 (PST)
Date: Wed, 27 Nov 2019 22:10:33 +0530
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
Message-ID: <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1574871463.git.nishadkamdar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] pinctrl: actions: Use the correct style
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
header file related Actions Semi OWL pinctrl driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-owl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.h b/drivers/pinctrl/actions/pinctrl-owl.h
index dae2e8363fd5..feee7ad7e27e 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.h
+++ b/drivers/pinctrl/actions/pinctrl-owl.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * OWL SoC's Pinctrl definitions
  *
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
