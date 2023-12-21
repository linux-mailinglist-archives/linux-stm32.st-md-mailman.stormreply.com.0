Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2A81B61A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 13:42:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72BC5C6C841;
	Thu, 21 Dec 2023 12:42:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEF63C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703148880; x=1734684880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ba7Ldspb0L81io7WDsMQs1X2A/thFBlYyfgOhF/Vgg=;
 b=bU8WhUZXFXcrZ7QKudbOl8ogiCDuxllBsvd0UGABqFoRua4dowG4F1XN
 WnOm/qRTvedOoKxcPuw7VoocykCKicqyZtDr3odWKpSZoYPUDqa5FXYwj
 q+G2isCLbi0imEqdJ4gpb0Su5gs0ULvgElJbjV2DE8bfkDUVeHX8sfRer
 hVG4sokt/05dg9UZRuJw1xJX+WXmsAYFfCG7/m1unn71j/EUQUdzrp3E+
 kRXsns18VyOVU/btaaElEzaTThEQlOK7Swn8iWlmglkTJV5PNZ+NMb2eD
 yMmlWPb8onGBreOe+N3KQiqp0kTtLfj2kP3nJ0xIunvyiTMXnYYVAekbp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2793695"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2793695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 00:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842568329"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842568329"
Received: from ssid-ilbpg3-teeminta.png.intel.com (HELO localhost.localdomain)
 ([10.88.227.74])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2023 00:54:32 -0800
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Halaney <ahalaney@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 John Stultz <jstultz@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Gan Yi Fang <yi.fang.gan@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 21 Dec 2023 16:51:08 +0800
Message-Id: <20231221085109.2830794-2-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221085109.2830794-1-yi.fang.gan@intel.com>
References: <20231221085109.2830794-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Dec 2023 12:42:22 +0000
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Choong Yong Liang <yong.liang.choong@intel.com>
Subject: [Linux-stm32] [PATCH net v2 1/2] driver.h: add helper macro for
	module_exit() boilerplate
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

For the modules need a module_init() but don't need to do
anything special in module_exit() might need to have an empty
module_exit(). This patch add a new macro module_exit_stub() to
replace the empty module_exit(). The macro is useful to remove
the module_exit() boilerplate.

Cc: <stable@vger.kernel.org> # 6.1+
Suggested-by: Lobakin, Aleksander <aleksander.lobakin@intel.com>
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 include/linux/device/driver.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 7738f458995f..7d322eef501e 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -288,4 +288,18 @@ static int __init __driver##_init(void) \
 } \
 device_initcall(__driver##_init);
 
+/**
+ * module_exit_stub() - Helper macro for drivers that have init but don't
+ * do anything in exit. This eliminates some boilerplate.
+ * Each module may only use this macro once, and calling it replaces
+ * module_exit().
+ *
+ * @__driver: driver name
+ */
+#define module_exit_stub(__driver) \
+static void __exit __driver##_exit(void) \
+{ \
+} \
+module_exit(__driver##_exit)
+
 #endif	/* _DEVICE_DRIVER_H_ */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
