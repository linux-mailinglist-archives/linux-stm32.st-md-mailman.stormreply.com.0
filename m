Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6A6012E8
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F948C65045;
	Mon, 17 Oct 2022 15:49:07 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB9EC63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 12:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zg85S36rjNmfRq6G5pOqNwm0pTj0fIQg77ZhiTm0GG4viP9CdxQSX76u6X+owb4pEsOdOPrNMoLEjrPDmklg9hEdpDXr7K+rkn+OlNF8H4GbWCttOI56Wu93xZeYbnc0glbe0/mpd2oRmqyZw4gV1JNYaR/4qXiHUTrdCE46uU/SnPQ2aNMgvKrpBsAdnEUessji0K2uTChG1NEWnD/OetJjfspjz8C/8kouhRi5mzd5LxDbxFKuaYJzfpzhk3olOll+ttHZhbypeddIy+JRbzmprUetK9EjP8rDZIU3gOsqGAl39JRNUTzLT22GYafSrM+HIY1+XHn/ZcvArSxZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD7rtf3QnovkTCt60S8lHltjWUWw4yyi+cqeLh0c6NI=;
 b=VqNOZgjEplPCbsPwEoUFSf6JiyIRvPm5HD82s84AhD4Vz4Cqxp09Y6M/O1UFva+SV2V7iMEcMlM+uPk5eh3d5Gv8awoQu5EE7qQfhMhL3BuzJt87snts8/dHs4DQEPpd0s5JF5k7ptaHnOA2HXSaye2qM9yXaHSXHhk4AjGj9jkuQpcf2Q8RJEdgitpEbY4gUEUdl2Y+1sml2uwauo+ZqXHRq0UoOcX+GmU8Z+ud3VT9I+pXqvwR1RvRUFgVHk+tE7jz+r1iL3FEkc1Qk7oE0ui+j36wIbteKCJk5uQJktPKX14T/TQYaqj4UFa+VbdO2GehnmN25KDK1nu84wWIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD7rtf3QnovkTCt60S8lHltjWUWw4yyi+cqeLh0c6NI=;
 b=B0NZvHXWODddF3KO1IB3AYYQwznTWvhW6XOOt6xQpWJK+0jkqRTa+pS36XITKHcuzAZGwjX4FFFCL7GaIIlcdw7Lr/0VZNOQcSJkknA0yDLq1lrhp0HXCZaKDmsHWgjisEE8v0p7XO8KMo+uSVSA1HJCrsKNQ3dk+KdZ2/O1Nrg=
Received: from MW4PR03CA0211.namprd03.prod.outlook.com (2603:10b6:303:b9::6)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 12:14:36 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::bb) by MW4PR03CA0211.outlook.office365.com
 (2603:10b6:303:b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 12:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:14:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:14:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:14:34 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via
 Frontend Transport; Mon, 17 Oct 2022 07:14:12 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <sanju.mehta@amd.com>,
 <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <kdasu.kdev@gmail.com>,
 <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
 <john.garry@huawei.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <narmstrong@baylibre.com>, <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
 <haibo.chen@nxp.com>, <linus.walleij@linaro.org>, <daniel@zonque.org>,
 <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
 <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>, 
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
 <kvalo@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
 <pratyush@kernel.org>
Date: Mon, 17 Oct 2022 17:42:42 +0530
Message-ID: <20221017121249.19061-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fb723c-e4b4-480d-dac4-08dab0392828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcA2RpMyeZQa4E+Nn3wlIuWOegQT7SBymUI0YOqZ1nXIKb78o/Wbxj29Whxxh5/qzEfEC7JmewR09TjLlkAnYVaUHfPjULDfNTgmUAMO5KZMw83vSoSFXDnadi4nqVOtqny1gBfA3ZQH9F8k2C6eViktzKoy7qCjs1fSp7ZcS9h1QBTuDXpDTEiF/i9fsHyeyX9rUkTWqXc2o06ahmnXkNQDXh/prvcuGRfUs76KMLnRB0tnVXZC4iiNC72vvxjw1qTkdF9fEx5bF+Z2aETmXfy+Oo0pR8N68g/HVXvfIEP42K1VvU/XvlBfX93dwxSuteuOvzdmSKG7W9Po3VPIvfn+rWskV5zN+6YSle9MTIvBNVgvxAbKPQV0pUC5YVzoUKOCcPQk+7Or6BE4DOHUtCJ+6DCi9y21zM3+qiVYAz/dQxco2bOO4v8TdHVqdMmo/kjBXMTrYMuLdotwdzmjpNW5bCEAuiqG3ePNBiof+A8lDj8Ilr9w7jzHnJpz6vCg0T+155vBKTH4QEhoX++RLtPfQhdZeUKzU1jfPAIXli73JgaMM5EaD9zMKadVrjlf7fZxB2hVA3ryS6crSmqSYZ1qeXZLRQ+lR8J0/PVyY2fYM/hVeQgtRoSodZBzZKZaV++T9gqLvuBNROmvbTXieGeW5jCzvDaK+IbFnbCSJbpdmnmWzV5CCBDuA9x9dipscDz1Btv9qwePMX1rZJsc49knffIf5xXP/luhb4dPPcdIg2qgq4WK9Byaoay8wvlDU6OtN7Rv0esVDa3xfWP7mSuiGkii0Tx7UDD6BCxtkBU9ubVZqFdUDXpCuahSNVQLQPZz19TlPWaubqT+eDnJpmSw8AXLPciOJGZwgMvTmAB1j8DN59PUBSXKli1lPnIPMs/QvaVcCcMYgCcAZH0xfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(82310400005)(921005)(82740400003)(81166007)(356005)(36756003)(40480700001)(40460700003)(86362001)(36860700001)(6666004)(83380400001)(70586007)(70206006)(110136005)(316002)(54906003)(8676002)(7416002)(7406005)(7366002)(7336002)(5660300002)(336012)(1076003)(186003)(2906002)(8936002)(2616005)(4326008)(478600001)(26005)(41300700001)(83996005)(2101003)(36900700001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:14:35.7549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fb723c-e4b4-480d-dac4-08dab0392828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
X-Mailman-Approved-At: Mon, 17 Oct 2022 15:49:04 +0000
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, tali.perry1@gmail.com, ldewangan@nvidia.com,
 linux-mtd@lists.infradead.org, alim.akhtar@samsung.com,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 akumarma@amd.com, linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, lars@metafoo.de, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
 venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, thierry.reding@gmail.com, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 claudiu.beznea@microchip.com
Subject: [Linux-stm32] [PATCH 03/10] net: Replace spi->chip_select
	references to spi->chip_select[0]
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

For adding multi CS support & to prevent any existing driver from
breaking, replaced all spi->chip_select references to spi->chip_select[0].

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/net/ethernet/asix/ax88796c_main.c      | 2 +-
 drivers/net/ethernet/davicom/dm9051.c          | 2 +-
 drivers/net/ieee802154/ca8210.c                | 2 +-
 drivers/net/wan/slic_ds26522.c                 | 2 +-
 drivers/net/wireless/marvell/libertas/if_spi.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/asix/ax88796c_main.c b/drivers/net/ethernet/asix/ax88796c_main.c
index 6ba5b024a7be..65586ff24dfb 100644
--- a/drivers/net/ethernet/asix/ax88796c_main.c
+++ b/drivers/net/ethernet/asix/ax88796c_main.c
@@ -1006,7 +1006,7 @@ static int ax88796c_probe(struct spi_device *spi)
 	ax_local->mdiobus->parent = &spi->dev;
 
 	snprintf(ax_local->mdiobus->id, MII_BUS_ID_SIZE,
-		 "ax88796c-%s.%u", dev_name(&spi->dev), spi->chip_select);
+		 "ax88796c-%s.%u", dev_name(&spi->dev), spi->chip_select[0]);
 
 	ret = devm_mdiobus_register(&spi->dev, ax_local->mdiobus);
 	if (ret < 0) {
diff --git a/drivers/net/ethernet/davicom/dm9051.c b/drivers/net/ethernet/davicom/dm9051.c
index a523ddda7609..835674ad6ceb 100644
--- a/drivers/net/ethernet/davicom/dm9051.c
+++ b/drivers/net/ethernet/davicom/dm9051.c
@@ -1121,7 +1121,7 @@ static int dm9051_mdio_register(struct board_info *db)
 	db->mdiobus->phy_mask = (u32)~BIT(1);
 	db->mdiobus->parent = &spi->dev;
 	snprintf(db->mdiobus->id, MII_BUS_ID_SIZE,
-		 "dm9051-%s.%u", dev_name(&spi->dev), spi->chip_select);
+		 "dm9051-%s.%u", dev_name(&spi->dev), spi->chip_select[0]);
 
 	ret = devm_mdiobus_register(&spi->dev, db->mdiobus);
 	if (ret)
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 42c0b451088d..f0ccf1cd79f4 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -2967,7 +2967,7 @@ static int ca8210_test_interface_init(struct ca8210_priv *priv)
 		sizeof(node_name),
 		"ca8210@%d_%d",
 		priv->spi->master->bus_num,
-		priv->spi->chip_select
+		priv->spi->chip_select[0]
 	);
 
 	test->ca8210_dfs_spi_int = debugfs_create_file(
diff --git a/drivers/net/wan/slic_ds26522.c b/drivers/net/wan/slic_ds26522.c
index 6063552cea9b..eb053a76fe52 100644
--- a/drivers/net/wan/slic_ds26522.c
+++ b/drivers/net/wan/slic_ds26522.c
@@ -211,7 +211,7 @@ static int slic_ds26522_probe(struct spi_device *spi)
 
 	ret = slic_ds26522_init_configure(spi);
 	if (ret == 0)
-		pr_info("DS26522 cs%d configured\n", spi->chip_select);
+		pr_info("DS26522 cs%d configured\n", spi->chip_select[0]);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c b/drivers/net/wireless/marvell/libertas/if_spi.c
index ff1c7ec8c450..074d6c1f0c2c 100644
--- a/drivers/net/wireless/marvell/libertas/if_spi.c
+++ b/drivers/net/wireless/marvell/libertas/if_spi.c
@@ -1051,7 +1051,7 @@ static int if_spi_init_card(struct if_spi_card *card)
 				"spi->max_speed_hz=%d\n",
 				card->card_id, card->card_rev,
 				card->spi->master->bus_num,
-				card->spi->chip_select,
+				card->spi->chip_select[0],
 				card->spi->max_speed_hz);
 		err = if_spi_prog_helper_firmware(card, helper);
 		if (err)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
