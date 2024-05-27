Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D978CFCFD
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 11:34:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A26AC6DD72;
	Mon, 27 May 2024 09:34:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4315C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716802456; x=1748338456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wAljxYnR6kHVj4d404qDnwEVTRLVT6TjGBJ45tg0riI=;
 b=XF1CFm1/7OGvte/OJLtTKH1nLFa95Z0QEVgZDBY+79mxdLD7ehGKUDrU
 ZyeWC08Y23qQJrCxP1ScqwcSKDlinY3iFVILCO4xYE+4HMFM8W5m6I1A5
 OQwC66mmGDv2ASsVa8GAJdE45xZ0AYOfwUfHOi8R9mWPIIuPFp/xGyhBN
 IdAdwf+CW4mvS2WyR5zTFXQweUIiPxdA/KZ7O7Enw+L6iZ+Nk4JKQ4vUx
 P2wr6ZwLho2Wrlugt8N1qfhdfca2NIvOnlwGRTYQ78y43kRmf7M82ajBl
 F7rC5WcNF3EfkXdUsULuq1rAloXqNFv4mxvZvbc3NHWEmWULPfmDuRdqF Q==;
X-CSE-ConnectionGUID: DD9nRjuqSGavU7bOz0ihpg==
X-CSE-MsgGUID: NDZNUjX/RUy+KH5UQrNPXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12933273"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="12933273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:34:08 -0700
X-CSE-ConnectionGUID: sjeSJxlQT0a4GZ9DIF7Y6w==
X-CSE-MsgGUID: 6aV1CZTWTHuJfqky91LCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35193439"
Received: from pglmail07.png.intel.com ([10.126.73.9])
 by orviesa006.jf.intel.com with ESMTP; 27 May 2024 02:34:04 -0700
Received: from pglc00465.png.intel.com (pglc00465.png.intel.com
 [10.221.239.148])
 by pglmail07.png.intel.com (Postfix) with ESMTP id 3231716423;
 Mon, 27 May 2024 17:34:03 +0800 (+08)
Received: by pglc00465.png.intel.com (Postfix, from userid 11742525)
 id 2D37560568E; Mon, 27 May 2024 17:34:03 +0800 (+08)
From: Boon Khai Ng <boon.khai.ng@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tien Sung Ang <tien.sung.ang@intel.com>,
 G Thomas Rohan <rohan.g.thomas@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 May 2024 17:33:38 +0800
Message-Id: <20240527093339.30883-1-boon.khai.ng@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Cc: Boon Khai Ng <boon.khai.ng@intel.com>
Subject: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature v2
	0/1]
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

Hi,
The Designware 10G MAC(dwxgmac) driver has lack of vlan support
in term of hardware, such as the hardware accelerated VLAN stripping.
The driver was not draft from scratch, however it was ported from the
Ethernet Quality-of-Service (dwmac4) driver, it was tested working on
ourside.

Refer to: 
https://github.com/torvalds/linux/commit/750011e239a50873251c16207b0fe78eabf8577e

Boon Khai Ng (1):
  net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping

 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 28 +++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 34 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 18 ++++++++++
 3 files changed, 80 insertions(+)

-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
