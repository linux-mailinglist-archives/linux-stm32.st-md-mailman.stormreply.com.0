Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1222963B3F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 08:23:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77DE9C78028;
	Thu, 29 Aug 2024 06:23:28 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B187C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 06:23:21 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WvWR90bpqz18Mp4;
 Thu, 29 Aug 2024 14:22:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 4E3681401F2;
 Thu, 29 Aug 2024 14:23:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Aug
 2024 14:23:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
 <alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
 <sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <mcoquelin.stm32@gmail.com>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
 <UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <krzk@kernel.org>, <jic23@kernel.org>
Date: Thu, 29 Aug 2024 14:31:05 +0800
Message-ID: <20240829063118.67453-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v3 00/13] net: Simplified with scoped
	function
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

Simplify with scoped for each OF child loop and __free(), as well as
dev_err_probe().

Changes in v3:
- Sort the variables, longest first, shortest last.
- Add Reviewed-by.

Changes in v2:
- Subject prefix: next -> net-next.
- Split __free() from scoped for each OF child loop clean.
- Fix use of_node_put() instead of __free() for the 5th patch.

Jinjie Ruan (13):
  net: stmmac: dwmac-sun8i: Use for_each_child_of_node_scoped()
  net: stmmac: dwmac-sun8i: Use __free() to simplify code
  net: dsa: realtek: Use for_each_child_of_node_scoped()
  net: dsa: realtek: Use __free() to simplify code
  net: phy: Fix missing of_node_put() for leds
  net: phy: Use for_each_available_child_of_node_scoped()
  net: mdio: mux-mmioreg: Simplified with scoped function
  net: mdio: mux-mmioreg: Simplified with dev_err_probe()
  net: mv643xx_eth: Simplify with scoped for each OF child loop
  net: dsa: microchip: Use scoped function to simplfy code
  net: dsa: microchip: Use __free() to simplfy code
  net: bcmasp: Simplify with scoped for each OF child loop
  net: bcmasp: Simplify with __free()

 drivers/net/dsa/microchip/ksz_common.c        | 12 ++---
 drivers/net/dsa/realtek/rtl8366rb.c           | 21 +++-----
 drivers/net/ethernet/broadcom/asp2/bcmasp.c   | 18 +++----
 drivers/net/ethernet/marvell/mv643xx_eth.c    |  5 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 20 +++-----
 drivers/net/mdio/mdio-mux-mmioreg.c           | 51 ++++++++-----------
 drivers/net/phy/phy_device.c                  |  7 +--
 7 files changed, 51 insertions(+), 83 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
