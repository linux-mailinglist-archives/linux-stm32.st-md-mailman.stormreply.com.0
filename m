Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE281B0BC
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 09:54:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC56C6C820;
	Thu, 21 Dec 2023 08:54:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53323C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703148871; x=1734684871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nPqbnaHiW6+MXK3XW+N9OxQlTqrsdHfKbFZUo5uWY3g=;
 b=IEqNJzzrwGRIE3Wf8rP3mv8M0qfFVGnjAGZGHOV0HgqPCY3bX38iY4rc
 xS+EVc1b7U1AUpxVtmvnsX398yOk38J10fI1wBQHGCwcHODk3Z48Ig9tY
 vVTI5s5jP+rZ6kIifb9yiDJVptxlAcIF0rwgjULpIPuPCf8IghqvnZtsw
 Y+lK5cvEvYG62HcQhc08jK17uLv5y2eggWVAqKbQQ3gq0D7zAErTKLLii
 TpLGpGPDUe1m+sKxN7ugQEboJouWK+LwSYj1aYfNYOP9C8AupYuQ5aNiZ
 VeGRMcEKlUeTn/CDVE7epB/mw8DjmH5j2cS6y7Bk+b3UUrQyNU0aoZ1M6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2793666"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2793666"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 00:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842568301"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842568301"
Received: from ssid-ilbpg3-teeminta.png.intel.com (HELO localhost.localdomain)
 ([10.88.227.74])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2023 00:54:23 -0800
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
Date: Thu, 21 Dec 2023 16:51:07 +0800
Message-Id: <20231221085109.2830794-1-yi.fang.gan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>,
 Choong Yong Liang <yong.liang.choong@intel.com>
Subject: [Linux-stm32] [PATCH net v2 0/2] Fix phylink unloadable issue
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

Add module_exit_stub() for phylink module.

Changes since v1:
- Introduce a helper macro for module_exit() boilerplate

This series is the combination of following:
v1 with empty phylink_exit():
https://lore.kernel.org/all/20231127101603.807593-1-yi.fang.gan@intel.com/
v1 of module_exit_stub():
https://lore.kernel.org/all/20231212094352.2263283-1-yi.fang.gan@intel.com/

Gan, Yi Fang (2):
  driver.h: add helper macro for module_exit() boilerplate
  net: phylink: Add module_exit_stub()

 drivers/net/phy/phylink.c     |  1 +
 include/linux/device/driver.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
