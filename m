Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9AA784724
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F6E9C6C838;
	Tue, 22 Aug 2023 16:25:20 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94CECC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 07:47:03 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv751dK3zkX6d;
 Fri, 18 Aug 2023 15:45:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:46:59 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
Date: Fri, 18 Aug 2023 15:46:30 +0800
Message-ID: <20230818074642.308166-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817024509.3951629-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 miquel.raynal@bootlin.com, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, vigneshr@ti.com, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, wens@csie.org,
 christophe.leroy@csgroup.eu, tudor.ambarus@linaro.org,
 u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: [Linux-stm32] [PATCH -next v2 00/12] mtd: Use devm_clk_get_*()
	helper function to simplify the drivers.
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
devm_clk_get_*(). Moreover, the unprepare and disable function
has been registered to devm_clk_state, and before devm_clk_state is
released, the clocks will be unprepareed and disable, so it is unnecessary
to unprepare and disable clock explicitly when remove drivers or in the
error handling path.

Change log:

v2:
 - Modify the format of the reference commit, use "since" instead of
 "after".
 - Drop the helper functions mtk_nfc_enable_clk() and
 mtk_nfc_disable_clk(), because both of them now have a single user.
 - Add a new patch, replace devm_clk_get_optional() +
 clk_prepare_enable() with devm_clk_get_optional_enabled().

v1: https://lore.kernel.org/all/20230817024509.3951629-1-lizetao1@huawei.com/

Li Zetao (12):
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
  mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
  mtd: rawnand: orion: Use helper function
    devm_clk_get_optional_enabled()

 drivers/mtd/devices/spear_smi.c               | 15 +----
 drivers/mtd/nand/raw/arasan-nand-controller.c | 29 ++-------
 drivers/mtd/nand/raw/fsmc_nand.c              | 12 +---
 drivers/mtd/nand/raw/intel-nand-controller.c  | 15 +----
 drivers/mtd/nand/raw/lpc32xx_slc.c            | 12 +---
 drivers/mtd/nand/raw/mpc5121_nfc.c            | 11 +---
 drivers/mtd/nand/raw/mtk_nand.c               | 62 ++++++-------------
 drivers/mtd/nand/raw/orion_nand.c             | 22 ++-----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 17 ++---
 drivers/mtd/nand/raw/sunxi_nand.c             | 29 ++-------
 drivers/mtd/nand/raw/vf610_nfc.c              | 29 +++------
 drivers/mtd/spi-nor/controllers/nxp-spifi.c   | 33 ++--------
 12 files changed, 67 insertions(+), 219 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
