Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 214FB963B44
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 08:23:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB83AC7801C;
	Thu, 29 Aug 2024 06:23:33 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F1E6C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 06:23:29 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WvWLh3qchzQr41;
 Thu, 29 Aug 2024 14:18:36 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 36289180105;
 Thu, 29 Aug 2024 14:23:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 29 Aug
 2024 14:23:26 +0800
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
Date: Thu, 29 Aug 2024 14:31:15 +0800
Message-ID: <20240829063118.67453-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829063118.67453-1-ruanjinjie@huawei.com>
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v3 10/13] net: dsa: microchip: Use
	scoped function to simplfy code
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop by using for_each_available_child_of_node_scoped().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3:
- Add Reviewed-by.
v2:
- Split into 2 patches.
---
 drivers/net/dsa/microchip/ksz_common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index cd3991792b69..86ed563938f6 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -4595,7 +4595,7 @@ static int ksz_parse_drive_strength(struct ksz_device *dev)
 int ksz_switch_register(struct ksz_device *dev)
 {
 	const struct ksz_chip_data *info;
-	struct device_node *port, *ports;
+	struct device_node *ports;
 	phy_interface_t interface;
 	unsigned int port_num;
 	int ret;
@@ -4681,12 +4681,11 @@ int ksz_switch_register(struct ksz_device *dev)
 		if (!ports)
 			ports = of_get_child_by_name(dev->dev->of_node, "ports");
 		if (ports) {
-			for_each_available_child_of_node(ports, port) {
+			for_each_available_child_of_node_scoped(ports, port) {
 				if (of_property_read_u32(port, "reg",
 							 &port_num))
 					continue;
 				if (!(dev->port_mask & BIT(port_num))) {
-					of_node_put(port);
 					of_node_put(ports);
 					return -EINVAL;
 				}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
