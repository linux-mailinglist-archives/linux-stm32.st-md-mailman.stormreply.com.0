Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55B963B39
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 08:23:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324AAC6DD6E;
	Thu, 29 Aug 2024 06:23:28 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24124C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 06:23:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WvWRx5nchz1S9MX;
 Thu, 29 Aug 2024 14:23:09 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id BAF64140153;
 Thu, 29 Aug 2024 14:23:22 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Aug
 2024 14:23:21 +0800
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
Date: Thu, 29 Aug 2024 14:31:10 +0800
Message-ID: <20240829063118.67453-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829063118.67453-1-ruanjinjie@huawei.com>
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v3 05/13] net: phy: Fix missing
	of_node_put() for leds
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

The call of of_get_child_by_name() will cause refcount incremented
for leds, if it succeeds, it should call of_node_put() to decrease
it, fix it.

Fixes: 01e5b728e9e4 ("net: phy: Add a binding for PHY LEDs")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3:
- Add Reviewed-by.
v2:
- Split into 2 patches.
- Use of_node_put() rather than __free() to fix it.
---
 drivers/net/phy/phy_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 8f5314c1fecc..243dae686992 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3424,11 +3424,13 @@ static int of_phy_leds(struct phy_device *phydev)
 		err = of_phy_led(phydev, led);
 		if (err) {
 			of_node_put(led);
+			of_node_put(leds);
 			phy_leds_unregister(phydev);
 			return err;
 		}
 	}
 
+	of_node_put(leds);
 	return 0;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
