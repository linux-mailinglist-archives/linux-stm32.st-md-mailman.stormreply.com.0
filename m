Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B24EB066
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D31EC628A8;
	Tue, 29 Mar 2022 15:29:30 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F67C60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567767; x=1680103767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hkl8/8feuNYMImY/ozo/322V2NGiY6bRDjU8vGAhPTw=;
 b=elfsPq0my/JIIl9UoRm4I0hHkDkIEeCSUVRdo00kQeN6TZGo/7ql2Mua
 eGkwWhpDkOI240HAK4SleTO0LYXsiH/Q/z4BFGZyRO6lbIkTtvvsODh3G
 fGBwHBzrkrRk3aYKYj2bpzcjCILkAVZJZGYg2bPxBH6X88V7A5Vt9nfBK
 EW5TrBq+zX1bDN8D8nEdBq1u+bzW2Q9au8uLCCZt9oGMxnsV+JK1gXuV1
 HZH+5iH+IqAoj3pashBDBsdIhYim2B8PFe2P/qy2pBSwZ34sPvZQeK88W
 /02qu+YlCpFDdgH6t4U2zk3hoE+QlGYwzHz33cvitJxqZyPCXsKb6Ty7M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="319974216"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="319974216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="653044903"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 89A4940B; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:23 +0300
Message-Id: <20220329152926.50958-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nancy Yuen <yuenn@google.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: [Linux-stm32] [PATCH v2 10/13] pinctrl: meson: Enable COMPILE_TEST
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

Enable COMPILE_TEST for a better test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index d1955c65b4b6..64fb9e074ac6 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig PINCTRL_MESON
 	tristate "Amlogic SoC pinctrl drivers"
-	depends on ARCH_MESON
+	depends on ARCH_MESON || COMPILE_TEST
 	depends on OF
 	default y
 	select PINMUX
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
