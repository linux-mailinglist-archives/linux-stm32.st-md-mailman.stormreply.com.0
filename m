Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D96AFF46
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5103EC6B443;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F793C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132540; x=1709668540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqgmkF6/LXf8ZTPjacKEJCrkdjdR/gKDvDdM5DRJJDo=;
 b=TlZIuuvtk6qJBzfL8Rw6M0RWoWrAkzVXLFMWU0+qeaGHOGcQRX8j/Ymv
 TJ2etj+EbtLh7u7PMPkh1uPg7BmC4EkOd/d6krYIIo4OSMFuomdLaV+Rw
 i/XhAFsy4g9sNutWwX5jv654dMsCEHLzwHhg30B87euy8aNY193zRCp9T
 XixVFziOVPG9KulMmSKqjpdaJsInbOabp+CFwTiRXTsS4uDWf3opv5HYg
 Vyz12XeaklWs+abiMSVdTISb3KSAvND1B9vglmSgUG8+WG+xOI2IU34LC
 2/WrYByk5rgAhFoxnigA99+1eYkPktOREml8VBFUiH+tIIVtdDK1HbrL1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398240773"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398240773"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819423553"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="819423553"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2023 11:55:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 61EF6367; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:43 +0200
Message-Id: <20230306195556.55475-4-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v1 03/16] lib/string_choices: Add
	str_high_low() helper
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

Add str_high_low() helper to return 'high' or 'low' string literal.
Also add an inversed variant, i.e. str_low_high().

All the same for str_hi_low().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/string_choices.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
index b7e7b9fd098c..48120222b9b2 100644
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@ -14,6 +14,18 @@ static inline const char *str_enabled_disabled(bool v)
 	return v ? "enabled" : "disabled";
 }
 
+static inline const char *str_hi_lo(bool v)
+{
+	return v ? "hi" : "lo";
+}
+#define str_lo_hi(v)		str_hi_lo(!(v))
+
+static inline const char *str_high_low(bool v)
+{
+	return v ? "high" : "low";
+}
+#define str_low_high(v)		str_high_low(!(v))
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
