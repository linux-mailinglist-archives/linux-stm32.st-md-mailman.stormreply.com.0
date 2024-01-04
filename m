Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0D823F55
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 11:16:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4653C6B476;
	Thu,  4 Jan 2024 10:16:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEFC3C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704363382; x=1735899382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCrXfWmSxLvasPVqx5bvaAF0h2FNR5wLkTJHVmOM0RI=;
 b=myfW7wv/de4XDtdTz40NloKHjSiuMYESVBSKHwf3ZMZxuuVk67UspHkx
 j504aNk5VtYnLOIGC365c5AbO1QYRaoQkZOVENh8FZTan8tywRgNXFw1i
 lCLG9KL7Cska9nx3NSU+EwIig/Rti7gEV2ze5ZVdmV0Fdsmy2reEOZCkt
 jPxyQdVbV19yHDhqa7R16fecwLD2OB/lrKILncmlYSd+B5i5UyWzv1Xb0
 mtPZVhg0ziQHsnGXTSpKEGYS+BDLOxLNsRkm1t97ZJG7Lm+TVs6sZroOx
 l4v2kabOlKPtMIgkL17FrjsbMZANHApkrimKIEI3CcUvlafDUxShIxEKt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="15831370"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="15831370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 02:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="903761717"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="903761717"
Received: from ssid-ilbpg3-teeminta.png.intel.com (HELO localhost.localdomain)
 ([10.88.227.74])
 by orsmga004.jf.intel.com with ESMTP; 04 Jan 2024 02:16:06 -0800
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 18:12:55 +0800
Message-Id: <20240104101255.3056090-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Gan Yi Fang <yi.fang.gan@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Choong Yong Liang <yong.liang.choong@intel.com>
Subject: [Linux-stm32] [PATCH net v3 1/1] net: phylink: Add module_exit()
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

In delete_module(), if mod->init callback is defined but mod->exit callback
is not defined, it will assume the module cannot be removed and return
EBUSY. The module_exit() is missing from current phylink module drive
causing failure while unloading it.

This patch introduces phylink_exit() for phylink module removal.

Fixes: eca68a3c7d05 ("net: phylink: pass supported host PHY interface modes to phylib for SFP's PHYs")
Cc: <stable@vger.kernel.org> # 6.1+
Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
v1 -> v2:
Introduce a macro function to reduce the boilerplate

v2 -> v3:
Remove the macro function as it is rejected and fix the
format issue suggested from v1

 drivers/net/phy/phylink.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 25c19496a336..4a05cda74d42 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3726,5 +3726,11 @@ static int __init phylink_init(void)
 
 module_init(phylink_init);
 
+static void __exit phylink_exit(void)
+{
+}
+
+module_exit(phylink_exit);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("phylink models the MAC to optional PHY connection");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
