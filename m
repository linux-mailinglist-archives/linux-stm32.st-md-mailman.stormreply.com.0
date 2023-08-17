Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9778470F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC1BC6C832;
	Tue, 22 Aug 2023 16:25:01 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64661C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 02:45:29 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RR8R63hSzzNn0t;
 Thu, 17 Aug 2023 10:41:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 10:45:25 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <michal.simek@amd.com>, <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <michael@walle.cc>, <frank.li@vivo.com>
Date: Thu, 17 Aug 2023 10:44:58 +0800
Message-ID: <20230817024509.3951629-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: robh@kernel.org, paul@crapouillou.net, dmitry.torokhov@gmail.com,
 philmd@linaro.org, geert+renesas@glider.be, martin.blumenstingl@googlemail.com,
 yangyingliang@huawei.com, lizetao1@huawei.com, nicolas.ferre@microchip.com,
 christophe.leroy@csgroup.eu, linux-sunxi@lists.linux.dev, rogerq@kernel.org,
 linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 linux-mediatek@lists.infradead.org, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: [Linux-stm32] [PATCH -next 00/11] mtd: Use devm_clk_get_enabled()
	to simplify the drivers.
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

Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks") provides a new helper function for prepared and
enabled clocks when a driver keeps a clock prepared (or enabled) during
the whole lifetime of the driver. So where drivers get clocks and enable
them immediately, it can be combined into a single function
devm_clk_get_*enabled(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clock explicitly when remove drivers or in the
error handling path.

Li Zetao (11):
  mtd: spear_smi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: arasan: Use helper function devm_clk_get_enabled()
  mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: intel: Use helper function devm_clk_get_enabled()
  mtd: rawnand: lpc32xx_slc: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mpc5121: Use helper function devm_clk_get_enabled()
  mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
  mtd: rawnand: stm32_fmc2: Use helper function devm_clk_get_enabled()
  mtd: rawnand: sunxi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
  mtd: spi-nor: Use helper function devm_clk_get_enabled()

 drivers/mtd/devices/spear_smi.c               | 15 ++-------
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 +++-------------
 drivers/mtd/nand/raw/fsmc_nand.c              |  8 +----
 drivers/mtd/nand/raw/intel-nand-controller.c  | 15 ++-------
 drivers/mtd/nand/raw/lpc32xx_slc.c            | 12 ++-----
 drivers/mtd/nand/raw/mpc5121_nfc.c            | 11 ++-----
 drivers/mtd/nand/raw/mtk_nand.c               | 20 ++++-------
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 17 +++-------
 drivers/mtd/nand/raw/sunxi_nand.c             | 29 ++++------------
 drivers/mtd/nand/raw/vf610_nfc.c              | 29 +++++-----------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c   | 33 ++++---------------
 11 files changed, 48 insertions(+), 170 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
