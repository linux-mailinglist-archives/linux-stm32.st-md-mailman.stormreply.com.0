Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E16926AC
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 20:38:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156CAC6A5EB;
	Fri, 10 Feb 2023 19:38:43 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F09B4C6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 19:38:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7A9GBOocMudz/1u+fjQKs0aoWBThpqZul6CJdAVSrAMxVePQWsddDAyIqJrNt3agdPJVTFgS8eUTRkQiCH2tIQcq90nt0I8g8gkEmz9pybE6tWR1+jXGRltM2D3la+XYf6wWVqla5jqsyX/RSNEKXl0DNk8WgVk4JYscJTa2udgEyCKbis5c5mBDeuyQPoErm+XzMgUpNQ0bZs6bsqUlW10GVlkMkSN3n7CNxPdgZxY01f3pY6JlX0IolQfrYhWOI/4s+uXzmDPC/3c+H1kTyXOHfuConPZRXJuNsC2CLVAwUri1weYQnYQTJaN3MY3EeIfOlfEf1z1uB4siLoajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGTDv9j62eqAAUbZYCqOwhh6o6pzCwATcSrO/Vzqvog=;
 b=LUbqSnjj/F7OUBvNJ51k8rLbpXN/1W0t3ruefHFvIqW26l07mdI99klh/Q5JwA1GDOYtP+NjTFeL+NNuryWI3DV+wCfPdwqBV9CuKQkV4OUFFxVJWSVSvEB3iZO4mkp7OXlzcUhyluZH5deF3EWYAnBN91zrJ9paYKuniAIb/o+hZYlt5mx3PynmjiyKnRLWmVxmsZzIIPlRjlFlvJtIn42LHXJtRq2U+jwwuA8PWzctibzpT0Tt7iYpvDc6jYwCBBtTGqE/MxeDd21YVanVeFjmybS/cdZQTlKQKVki3AaWfjnSCvDQMOnXracBWwn0OHJj0adOQPo6dtc8IGUaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGTDv9j62eqAAUbZYCqOwhh6o6pzCwATcSrO/Vzqvog=;
 b=3gqq/KsoZQpDizQE1oIAqvVi4TR5LUXFqFILRyZPZfYwRLC0dzNfWhVrl82QvNuKX+jABKvZ5dzfyoW7fVdQBSbcTyIgAgovbl9SOk5ecgEnahSPDvZsEQgJRuc/z/gr7Nt+M36Psp9hDPS/z4SjCyYWGwK16TB3dm8ZeVwqTVc=
Received: from MW4PR04CA0184.namprd04.prod.outlook.com (2603:10b6:303:86::9)
 by IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 19:38:39 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::ec) by MW4PR04CA0184.outlook.office365.com
 (2603:10b6:303:86::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Fri, 10 Feb 2023 19:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.21 via Frontend Transport; Fri, 10 Feb 2023 19:38:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:38:36 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Feb 2023 13:38:10 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
 <pratyush@kernel.org>, <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>, 
 <clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
 <olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
 <khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
 <linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
 <robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>, 
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
 <kvalo@kernel.org>, <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
 <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
 <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <oss@buserror.net>,
 <windhl@126.com>, <yangyingliang@huawei.com>
Date: Sat, 11 Feb 2023 01:06:34 +0530
Message-ID: <20230210193647.4159467-4-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 73299ece-7630-442b-f782-08db0b9e6836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHHK3WMrmy+DVD5iL7Seu1BlQJBbX5m32CtO2eBNw33k+TcdAWYQBIsHFphT/YPSXQch3csXjmxWlKNe9riNZ548aAiaIbapH4dau763C2nJX22mDzsKNcA65ShobKhJ4ABV6KiBg+qUmJz2XvhmA/KZsBLL7Tj0faoNaVWXH/lf5ApDUiR/gL5HLpT9QWCR/P+z3V/RFoxVP7ZT4nQN87FQG9jrewXIiPnDzGUBg2CpBJn+xk0vAZehYKsUcutsTAGYroDMk+/tDdiMnRtb5pJV7qc8MUC8hoxkTpFW2pQms9HSJvx6omXTS6ZRp6fkEyaM7EYWqJ/zmSQ/A8jtrnVpdPcWOvj9o0Awj+IWkxqJOTeCdrewh914aE/EPEtC9uhbh2wynEcaXXshr7IWFhWf9IeSAd4M2PGAD1VfJtAaWMWYvqo4pu3JFH8EraUUn64/oUYqBhudoJeJAofxQ+KZ9T5Ds2XMRnmAS7ntVFhjTC9+8o02x6m7AE0RkY5VAEsY0f1SIzbcWUgnEtzFYBoo2WODhjkV23pX6bW1zySOVWEVs4DknXtGzVAXbSRdcNN5xwYvOA8F+/cmHg1DurVJheihDjdWnKezslzhEPLFjADiNd0S0opJGDmRPHe/XhTS+vX5JFcAGlHOPk0oPJ9rFs1xCATBmzAC9MassniW0qOgXp7rOwnNzO7fcZ0a1V6p3MMl9iuF1sThH+aNNgCwBlAnFbTZs2SOWawkoIPHL3QQZuidByKMf9ji6zP3oY5rNagGzGbVO+89cl2CgC1bw3lRKWba3YadgxnYYgiINhWBbYggWS0vW4B9skbVRlPG+GUHWy91Ln1gg2F5e0szdfKtbt6ts9MdeDE41AA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199018)(40470700004)(46966006)(36840700001)(2906002)(186003)(7276002)(7416002)(7406005)(336012)(40460700003)(86362001)(426003)(1191002)(47076005)(2616005)(81166007)(8936002)(7336002)(5660300002)(26005)(1076003)(478600001)(6666004)(36756003)(82310400005)(7366002)(83380400001)(316002)(4326008)(356005)(8676002)(82740400003)(70586007)(54906003)(41300700001)(36860700001)(40480700001)(70206006)(110136005)(921005)(83996005)(84006005)(41080700001)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:38:38.2353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73299ece-7630-442b-f782-08db0b9e6836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, alsa-devel@alsa-project.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
 venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: [Linux-stm32] [PATCH v4 03/15] iio: imu: Replace all
	spi->chip_select and spi->cs_gpiod references with function call
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

Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
members of struct spi_device to be an array. But changing the type of these
members to array would break the spi driver functionality. To make the
transition smoother introduced four new APIs to get/set the
spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
spi->cs_gpiod references with get or set API calls.
While adding multi-cs support in further patches the chip_select & cs_gpiod
members of the spi_device structure would be converted to arrays & the
"idx" parameter of the APIs would be used as array index i.e.,
spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/iio/imu/adis16400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index c02fc35dceb4..3eda32e12a53 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
 
 		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
 			indio_dev->name, prod_id,
-			st->adis.spi->chip_select, st->adis.spi->irq);
+			spi_get_chipselect(st->adis.spi, 0), st->adis.spi->irq);
 	}
 	/* use high spi speed if possible */
 	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
