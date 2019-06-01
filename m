Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18D57E7E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86CE9C57B61
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:48 +0000 (UTC)
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5BECC9AE3B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Jun 2019 03:24:40 +0000 (UTC)
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net
 [126.125.154.139]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x513MrHC023003;
 Sat, 1 Jun 2019 12:22:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x513MrHC023003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1559359374;
 bh=r3qAVs3xM8MaSXiqlFioeBt+ecKWRRFeKPnE+XTAM3A=;
 h=From:To:Cc:Subject:Date:From;
 b=xw0YwrrAPeAY0OlcTa3SqAJKQnezXQoI2+/7rrH2CfETfalYjs1oPY4aVPA7tr9gd
 PRENg4z1TGu6XcME/fQNuRRNr/MWUyJDUA9g6NOMDBnSEuZOGzvFEhQ27AUfnIO3sa
 i1YAFJSzyn2RPF7OIZdKRk5sifWn4Jnc1sOFY9daWmqQyNbN9Bv7WwR1Z0r2TcU1q8
 wYJjAACezYFAKTQmvSn0Nxg8GYX4RN/YnoLhUfVK+VO0x+7E0OfO0bRe/S3bJLJByI
 R2uRHaeHgFubi/04LIXnk9kFNomJCl9TkcTXqn7fOzIIxpVKdpGhv5s4zM4BOfsM7g
 mqkobRgO/jTHA==
X-Nifty-SrcIP: [126.125.154.139]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sat,  1 Jun 2019 12:22:42 +0900
Message-Id: <20190601032242.10405-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-renesas-soc@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, linux-spdx@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] treewide: fix typos of SPDX-License-Identifier
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

Prior to the adoption of SPDX, it was difficult for tools to determine
the correct license due to incomplete or badly formatted license text.
The SPDX solves this issue, assuming people can correctly spell
"SPDX-License-Identifier" although this assumption is broken in some
places.

Since scripts/spdxcheck.py parses only lines that exactly matches to
the correct tag, it cannot (should not) detect this kind of error.

If the correct tag is missing, scripts/checkpatch.pl warns like this:

 WARNING: Missing or malformed SPDX-License-Identifier tag in line *

So, people should notice it before the patch submission, but in reality
broken tags sometimes slip in. The checkpatch warning is not useful for
checking the committed files globally since large number of files still
have no SPDX tag.

Also, I am not sure about the legal effect when the SPDX tag is broken.

Anyway, these typos are absolutely worth fixing. It is pretty easy to
find suspicious lines by grep.

  $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
    :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
  arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
  drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
  drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
  lib/test_stackinit.c:// SPDX-Licenses: GPLv2
  sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/kernel/bugs.c                | 2 +-
 drivers/phy/st/phy-stm32-usbphyc.c    | 2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-
 lib/test_stackinit.c                  | 2 +-
 sound/soc/codecs/max9759.c            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/bugs.c b/arch/arm/kernel/bugs.c
index d41d3598e5e5..14c8dbbb7d2d 100644
--- a/arch/arm/kernel/bugs.c
+++ b/arch/arm/kernel/bugs.c
@@ -1,4 +1,4 @@
-// SPDX-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <asm/bugs.h>
 #include <asm/proc-fns.h>
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 1255cd1d9a60..56bdea4b0bd9 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * STMicroelectronics STM32 USB PHY Controller driver
  *
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 473da65890a7..9ed4ead2dafb 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -1,4 +1,4 @@
-// SPDX-Lincense-Identifier: GPL 2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * R8A77980 processor support - PFC hardware block.
  *
diff --git a/lib/test_stackinit.c b/lib/test_stackinit.c
index 13115b6f2b88..e97dc54b4fdf 100644
--- a/lib/test_stackinit.c
+++ b/lib/test_stackinit.c
@@ -1,4 +1,4 @@
-// SPDX-Licenses: GPLv2
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Test cases for compiler-based stack variable zeroing via future
  * compiler flags or CONFIG_GCC_PLUGIN_STRUCTLEAK*.
diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index ecfb4a80424b..00e9d4fd1651 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -1,4 +1,4 @@
-// SPDX-Licence-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MAX9759 Amplifier Driver
  *
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
