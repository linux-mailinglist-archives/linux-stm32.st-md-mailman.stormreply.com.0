Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274F966EBB
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 04:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23AD4C7128F;
	Sat, 31 Aug 2024 02:05:28 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86452C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Aug 2024 02:05:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wwdb45h4NzgYbp;
 Sat, 31 Aug 2024 10:03:12 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id E6F5114011B;
 Sat, 31 Aug 2024 10:05:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 10:05:16 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <florian.fainelli@broadcom.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <heiko@sntech.de>, <yisen.zhuang@huawei.com>,
 <salil.mehta@huawei.com>, <hauke@hauke-m.de>, <alexandre.torgue@foss.st.com>, 
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
 <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>, <kvalo@kernel.org>,
 <lizetao1@huawei.com>, <u.kleine-koenig@pengutronix.de>,
 <jacky_chou@aspeedtech.com>
Date: Sat, 31 Aug 2024 10:13:22 +0800
Message-ID: <20240831021334.1907921-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/12] net: Convert using
	devm_clk_get_enabled()/devm_clk_get_optional_enabled()
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

There are many examples[1][2] of clk resource leakage in LTS. The
reason is that developers need to maintain the allocation and release
of clk resources themselves, but this will increase the burden on
developers. Using the API related to devm_clk_get_*_enable ensures
that the life cycle of clk is consistent with that of the device,
reducing the risk of unreleased resources like clk.

Several other developers are also working on converting to more
secure interfaces, and this patch set is in principle the same as
theirs.

[1]: https://lore.kernel.org/all/20240812160128.338041191@linuxfoundation.org/
[2]: https://lore.kernel.org/all/20240812160135.992451065@linuxfoundation.org/

Li Zetao (12):
  net: dsa: bcm_sf2: Convert using devm_clk_get_optional_enabled() in
    bcm_sf2_sw_probe()
  net: ethernet: Convert using devm_clk_get_enabled() in emac_probe()
  net: ethernet: arc: Convert using devm_clk_get_enabled() in
    emac_probe()
  net: ethernet: ethoc: Convert using devm_clk_get_enabled() in
    ethoc_probe()
  net: ftgmac100: Convert using devm_clk_get_enabled() in
    ftgmac100_setup_clk()
  net: ethernet: hisilicon: Convert using devm_clk_get_enabled() in
    hisi_femac_drv_probe()
  net: lantiq_xrx200: Convert using devm_clk_get_enabled() in
    xrx200_probe()
  net: stmmac: dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled()
    in dwc_qos_probe()
  net: ethernet: sunplus: Convert using devm_clk_get_enabled() in
    spl2sw_probe()
  net: xilinx: axienet: Convert using devm_clk_get_optional_enabled() in
    axienet_probe()
  wifi: wilc1000: Convert using devm_clk_get_optional_enabled() in
    wilc_sdio_probe()
  wifi: wilc1000: Convert using devm_clk_get_optional_enabled() in
    wilc_bus_probe()

 drivers/net/dsa/bcm_sf2.c                     | 28 ++----
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 13 +--
 drivers/net/ethernet/arc/emac_rockchip.c      | 34 ++-----
 drivers/net/ethernet/ethoc.c                  | 18 ++--
 drivers/net/ethernet/faraday/ftgmac100.c      | 27 ++---
 drivers/net/ethernet/hisilicon/hisi_femac.c   | 17 +---
 drivers/net/ethernet/lantiq_xrx200.c          | 17 +---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
 drivers/net/ethernet/sunplus/spl2sw_driver.c  | 18 +---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 +--
 .../net/wireless/microchip/wilc1000/sdio.c    | 10 +-
 drivers/net/wireless/microchip/wilc1000/spi.c |  5 +-
 12 files changed, 64 insertions(+), 236 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
