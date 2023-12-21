Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B105481B0C1
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 09:54:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7801BC6C820;
	Thu, 21 Dec 2023 08:54:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C47AC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703148889; x=1734684889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1JsXbGf0ei8NX9i8T+iRqjYzH4+nfdAl4Vq6Pu5B8C0=;
 b=D1FXlxIYvxJq5oSQfz17qD/F3OjNtBOHuJxob7E/vO+I8p59EeVuWrQS
 wRdBt4wfL/N7HOyJaRYbu7bP4jpNYO1n6RzJeaV+SG35K36O7uIbMyvcy
 4xVXFMqUO+cl6oanKS0zsYphCD6zmaM3jv0BlXquq+vKF3WalkI0opDF2
 Y7VvvNvBEBsX4wfaE43kIlwrIaagFP75lFp9k8cHL2oot5I2ko/6y9l73
 HvcCalECvwjmxow6qN+qY97z+viHWFLAXG5GztSr/pNFq4C1u1sMLhXa6
 v78v6EGlcivrKw3bQ5nDGZz8kYZkhetBeMPgzNGNysytwhFQb2QYheIbW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2793717"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2793717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 00:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842568348"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842568348"
Received: from ssid-ilbpg3-teeminta.png.intel.com (HELO localhost.localdomain)
 ([10.88.227.74])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2023 00:54:41 -0800
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
Date: Thu, 21 Dec 2023 16:51:09 +0800
Message-Id: <20231221085109.2830794-3-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221085109.2830794-1-yi.fang.gan@intel.com>
References: <20231221085109.2830794-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Choong Yong Liang <yong.liang.choong@intel.com>
Subject: [Linux-stm32] [PATCH net v2 2/2] net: phylink: Add
	module_exit_stub()
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

In delete_module(), if mod->init callback is defined but mod->exit
callback is not defined, it will assume the module cannot be removed
and return EBUSY. The module_exit() is missing from current phylink
module drive causing failure while unloading it.
Add module_exit_stub() in phylink for the module to be unloadable.

Fixes: eca68a3c7d05 ("net: phylink: pass supported host PHY interface modes to phylib for SFP's PHYs")
Cc: <stable@vger.kernel.org> # 6.1+
Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
---
 drivers/net/phy/phylink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 25c19496a336..823c9b43cd92 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3725,6 +3725,7 @@ static int __init phylink_init(void)
 }
 
 module_init(phylink_init);
+module_exit_stub(phylink);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("phylink models the MAC to optional PHY connection");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
