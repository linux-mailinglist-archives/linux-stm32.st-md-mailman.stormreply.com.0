Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0E6012E9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39A61C65048;
	Mon, 17 Oct 2022 15:49:07 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C05C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 12:15:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j64Vvr4grSu1MR4OPT/QeQp4KaQ/hdtVKhkODbqw85nHRhqqcCu5I5qPPcLt7+1b0B/48ft3dMXsKprsBibWgvix2Kn8SyYLneMu4TyO3OzLwcRaVMn88oNRJZgZpkXe4tMjjQe1cqzLwd5qssE1Cja9IkXY8R8lwe/0oiMDsKoI+AlM8kbkI3n2nG9SngQyPRLBty5AEBlYWvSeYZ/Msnm1Wb62PZ1kW5ajJX9x1EexFUdaZ9RuE0ZS8fWXEXkZu8/BENSrDS6GlB5vpp60qLlwAy4Iwpsoy2UFc2jmb7TvRP+BnWr6acut+NdCceqDHEkFf4iDxJf7odDl3/3/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3vftWpToOrWwmVK2f/g7HfHOtUR2723hCzCMOgjHcs=;
 b=Q6PANvi4Yz9/ADCjkj4D90IU67TPZT4IzJYfPoJUwL/h3EE8+UdBWWJEgsHmeyMeocEiE/AhJ3Ph4MBejhRHmu4gcTO8rAfhesMeOp8AbZJMUwRPnrwKD7T+B5VvuXJ8+7LFuU8ymHHQLs3SxIpTSdD/QYKXKohjkc8KVSU3gBtAI/+Nc62HmbS8dUrpBGYSdyP0RURgTIGYb1J888JyKI6CNTJDKDlmP/5DngG61do3LF7U9C6mmEQ5xd/fhiXcxjo8GxpsASmONBoH8SwC/qED+4VE9fkMYxmZSk2/6+CE3eCQW6O2FhSvyxgG9PFDPSoB860EWFWqt/J0yTZvaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3vftWpToOrWwmVK2f/g7HfHOtUR2723hCzCMOgjHcs=;
 b=ysMNElw/coL5ZcKF/6CRo80bU09mEp6ktmc60+2Igej7QGHueqskiZJpbT6xPKJe3zUxhcIuQCa3Tk3pwcTKJVoiX2rFtLt7ScFXAQTvOu8lSpODL4XmyiHzHVFE3qHNoLd40w8Wrt1/crs+iKIVytaJO+rx10Aq/0SbejPoM+A=
Received: from BN9PR03CA0975.namprd03.prod.outlook.com (2603:10b6:408:109::20)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:14:59 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::f5) by BN9PR03CA0975.outlook.office365.com
 (2603:10b6:408:109::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 12:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:14:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:14:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:14:57 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via
 Frontend Transport; Mon, 17 Oct 2022 07:14:35 -0500
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
Date: Mon, 17 Oct 2022 17:42:43 +0530
Message-ID: <20221017121249.19061-5-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f332d08-504d-4e8d-716d-08dab0393622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XF/YUyQo5nOCyZVtxiv84pofK3aH3YR+fYG5ZoonwJpFOAS/4TEnBdgs+/zUFeLmSr5NdyJvhEgfs5dTjUwsPjJmgxKlFRxGqHdfK3JQ3tTv2nXsrDL/Ab97zpur7cB3wW/pTVcmvUj0IZ3+DJn8ke84iX5ciUVQvbXNwO9jm3hEJjINdemwNw3E0/s1JnfRVqo8kkR1bGg+i/1T4y/y3+VHaZ/8/VXqA6pbJ14e00eBA/naWHnKL8OGwf7TVrlZUf3hIzcJGXAdksEBOTNyHVn0/fwMWaOFb19j1CcReG+S++buf9TrP619fg+Zl1gPmN3KvEFauPxMqKBC4JsW+2ydonSAbgVx/dtKpsSzcTv5KWTu48Q3rCC/Vye8qF1icR63Mdb4K9L9yifmqW3J4FBVkSQ47xwYW2NDLSZjU0r2+pl2jOmR4+4Z/svYRlvvWowGuga8/Q7YSDW73AlZ8v3iKiwWOV/HgDNcDS+Lkiblg8zTLFHAT/kc0zpzERnk+65E9eOne8Xo/jtQvDBwT2cawJBDBARsTJB6WOnknCPVIICZydenJ8GiMkTMlbAiUp6pid8v/OQc0oohlWDKwXNQGSW/VdY/RrsOUT8gsCrhF508JSUa0TpO2rEnQRNM/jD292/hJ7hW/vO/K6zUt9ZUHaEQuoooFsqxIcvy85oyZZCdsKYHSLiBIe6pJnXadi8Vcxi+lThbV+gcJofv8htwQFSCpwjta/ifzn/ahVSURXTm/X5XzkeK85gAt3GfC5bsnBGJbGOguqQ0XJIEb+l/yJpFiehtKBvps/KOcCJ+aBQCX9mAFyVp14P9VpL4FG8BDY4hvA6M0aLyaOUHfhZMJ7nH70N5acMyqdg8moEj2KrM6/7nhjHeCiOw7JHG6ggMtZpQSv2NydqwQOdRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(26005)(36860700001)(6666004)(83380400001)(478600001)(336012)(186003)(1076003)(426003)(47076005)(4744005)(7366002)(7406005)(7416002)(5660300002)(2906002)(40480700001)(7336002)(40460700003)(82310400005)(54906003)(110136005)(316002)(41300700001)(8936002)(8676002)(70586007)(70206006)(4326008)(86362001)(36756003)(81166007)(356005)(921005)(82740400003)(41080700001)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:14:59.2947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f332d08-504d-4e8d-716d-08dab0393622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105
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
Subject: [Linux-stm32] [PATCH 04/10] mtd: devices: Replace spi->chip_select
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
breaking, replaced all spi->chip_select references to spi->chip_slect[0].

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 25bad4318305..5d808ca5e4c8 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -646,7 +646,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 
 	/* name must be usable with cmdlinepart */
 	sprintf(priv->name, "spi%d.%d-%s",
-			spi->master->bus_num, spi->chip_select,
+			spi->master->bus_num, spi->chip_select[0],
 			name);
 
 	device = &priv->mtd;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
