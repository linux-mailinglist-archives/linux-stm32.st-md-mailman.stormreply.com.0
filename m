Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986516012EA
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51E6EC6504B;
	Mon, 17 Oct 2022 15:49:07 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA079C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 12:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7iOX1mgCWJUdTzscSMS17mPnkG6wNU1ZuhrEBABiaRuXqIirl2lmxeGrZtkZr+4TGFeIPCyEUzJkD770hF184YUBbZSgWqyLuG90jbRXA6D9pS3u55jZxc/F9eM5UgtjQlJHCeFyKzVD1EgzYt7Zy7m2g4tAMe+tuqbFBo1pTVlHaVGhZKoef7YHGH0u1JLF3nyI3wzyYSK5zU8EiSv34MWvYa/1Df/ieu4xd3kVn9BRABQpG1dzmaB/K6TWxGmDmBudI5ESC/Ww9OuImr0MdSrLqYkO8EAg77R0eJ2AFWEY7FH/dR/8N2KLNvKbUyCDcDm9zzXdpDe0SpavtB1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR4ZrZBMZwZtiMXie34UcHhYI++CQN66d821m5/RpFI=;
 b=avexfhBMY9HBJhGZSkDfHZ1H7+rLUbXhpeysbcbVPFQ2StFfcv7ruH3a4Gpgx/eBlEBhNxWTyvh2MD5UcUbPdn3UIg6hkD/WpuJzQxqicmFr2bQX7NrUcCzeMjosC4463lH79YrPdRAjiR1wk4tw7U8lbXMzl3gjkl3l1vLXJ3LPwIIf5w4rnUcPlT9+BFDrgw3sCUfL/8aQlSMGcfMCwXaLkt8/iUzc2/81VEPsoaKc3LLj3QWb0IuUJUMtdg15rf20QeE4OarHe0rk5Hg7pg5a94fDvZIqWElMzWb7e2dNjKCYEcNRP8Hu08yipKtfoQNY5AqWWcKoKm+tDDcXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR4ZrZBMZwZtiMXie34UcHhYI++CQN66d821m5/RpFI=;
 b=A5S7w6HOI+c6OHe3jjmJSTpsMaEKoxK7li9cozjJbgs1h5pkYNFXOA+fMc/qQ0WyE0POzQ5zQCYtGZio2CjrH7z33salmwKinf+WZYNBgXddLGxE7ych+OKtKKubjmHQkAdvirIeREZKaMnsubhtmluv0V7noWb7faO32Kx2lbs=
Received: from MW2PR2101CA0016.namprd21.prod.outlook.com (2603:10b6:302:1::29)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 12:15:22 +0000
Received: from CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::22) by MW2PR2101CA0016.outlook.office365.com
 (2603:10b6:302:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Mon, 17 Oct 2022 12:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT077.mail.protection.outlook.com (10.13.175.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:15:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:15:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:15:20 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via
 Frontend Transport; Mon, 17 Oct 2022 07:14:57 -0500
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
Date: Mon, 17 Oct 2022 17:42:44 +0530
Message-ID: <20221017121249.19061-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT077:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: b78af9a2-92fa-491c-4040-08dab03943c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbNqnHIcDYOOSq/MVqFPrP1dtnh4ViEz8Y9E9eUYz98wpW90hXSIBBe4FjvCQCeNKOiRS0YK0KRFkIqqe+tCuQO+rF/Pt8YkUAIBOZYOdcRLMVQoLkxoNCzauEqvkVmv/g4oykyk8o5m04NRnwHWDeIXHoCKUNULes1mXWCg4E4eiOKknc+s3wjS0G5TeEjQPbFn/B3YZcWJQ3ROlmm9DVPrzv/pDbU7ueKlz7wyaonV1gozBgpTnYJmxS+oPzgAqfmo3SDESSqDLW8G969TUVhDVOTfyiFJVSuxwu84GuwdIbwtEwidnr79qwUDhf9ip43ufPsoqyNsKIsqvr1K2Qc+gSeJy7Fm+VMxVRifM0qfXQ9csKE3B5WwCkzE7m+CaCZN8nDlexUdxTZ+U57X0cLHQhx5TEPWFYmnkX7B+rAgN9bWPQpbM/relH33/ddPbudC3TtciCEntb0XUb+Nra4/qQGR1W1R3HhkErofiZNPXnUBhSYsTFOyoqS/hugpoQugVHKIrElIoM9FbTiSLoF4W+pE5aS7fZ5mMYde5mUqcUvQJZk6b6ZZNBJ/wK11PB1SyUyMggP7rXIKuAM9H7IJmeCZhsuhe3zDIatzRkU70aS2hYDwjtSb1qSsydph3x2LzGtODhqiykyL0Un/TIoza8mHo8Hm4EackjcBScbHkU/xwwPgz56oTNnQDaeJ0PqQCaLunC8gek6UMRxfTZ8VYqwrB5CA8FXgDCz53XX0Z+MuCdMkyQkxwNP/zvS9e6XL/BoF081G/qgnbyA6pq8u7eBgTalWBI/aWu/5EwiDyxgZFqzQlBZags2izOAtfbkAtM814Rqv2lsohEF3My+Ppf3POgKVBlvMn3nKlgVGBSsnDEwyVNKkBQbmp4VpqWYcIz31apdQJAvyA4fuUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(7416002)(7366002)(8936002)(7406005)(2906002)(4744005)(7336002)(70586007)(4326008)(8676002)(70206006)(41300700001)(86362001)(36756003)(186003)(356005)(81166007)(82740400003)(40460700003)(921005)(6666004)(2616005)(1076003)(336012)(426003)(47076005)(478600001)(26005)(110136005)(83380400001)(316002)(36860700001)(54906003)(40480700001)(82310400005)(41080700001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:15:22.0834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78af9a2-92fa-491c-4040-08dab03943c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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
Subject: [Linux-stm32] [PATCH 05/10] iio: imu: Replace spi->chip_select
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
 drivers/iio/imu/adis16400.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 17bb0c40a149..aa7bfcee3510 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -466,7 +466,7 @@ static int adis16400_initial_setup(struct iio_dev *indio_dev)
 
 		dev_info(&indio_dev->dev, "%s: prod_id 0x%04x at CS%d (irq %d)\n",
 			indio_dev->name, prod_id,
-			st->adis.spi->chip_select, st->adis.spi->irq);
+			st->adis.spi->chip_select[0], st->adis.spi->irq);
 	}
 	/* use high spi speed if possible */
 	if (st->variant->flags & ADIS16400_HAS_SLOW_MODE) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
