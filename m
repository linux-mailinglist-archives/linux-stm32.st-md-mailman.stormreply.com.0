Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483B6AFF43
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE9AC6A60E;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06319C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132535; x=1709668535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x77bSH20Ou4EihSoiJQDgs4+5OFy75brI2gUDSEqixA=;
 b=BITvZQWlOtqhfcSBqyXsr4cKTKBcOAKbQNIGou5URZIO2fN1b3sCpzyW
 VAuXEMnGgHGGwdJHc6eSOe9FqFOeUS3dzP8fYSA3+YCeEuywbsQBSVvCQ
 ek10pV7WtOcq8eUWiscwRdZh8xoKCz1ItLkH+zJrIjRQmy5H2/iUJ3g4+
 LQxoafGRWVlpjWCXagm+KIJDRLTnVL3MD9ujh+EiMbQ/rE4fdW5jfj98d
 3l6BaK9YvL5RAxfPZJM9MiWfSCStfbx7yTXR4SxYG3OwKwLZIKNWNMYBm
 PePalHgHOpHhkCMjNKYQIhJbfgF841aDJ9SP+Z/1iehaMl3tTBYoO6rFh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483865"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483865"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549562"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549562"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6B292398; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:44 +0200
Message-Id: <20230306195556.55475-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 04/16] lib/string_choices: Add
	str_input_output() helper
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

Add str_input_output() helper to return 'input' or 'output' string literal.
Also add an inversed variant, i.e. str_output_input().

All the same for str_in_out().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_choices.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
index 48120222b9b2..ad345df325ec 100644
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@ -26,6 +26,18 @@ static inline const char *str_high_low(bool v)
 }
 #define str_low_high(v)		str_high_low(!(v))
 
+static inline const char *str_in_out(bool v)
+{
+	return v ? "in" : "out";
+}
+#define str_out_in(v)		str_in_out(!(v))
+
+static inline const char *str_input_output(bool v)
+{
+	return v ? "input" : "output";
+}
+#define str_output_input(v)	str_input_output(!(v))
+
 static inline const char *str_read_write(bool v)
 {
 	return v ? "read" : "write";
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
