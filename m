Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D666AC9FE
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 18:25:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 335FAC69053;
	Mon,  6 Mar 2023 17:25:13 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2050.outbound.protection.outlook.com [40.107.212.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E23CC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 17:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbkIQmHMlenYVDylNHa9tky1MAScGo8S4D9ijGji6DghHAn+OpUBfeoA2vc1oeUEu8KdCxpqnlSg5H5E411AfyMa4Djb9HncGMrt7/odOlFemHUl5hHw3OCVoB1dPXBcMc12KasZ/WlF8kmEwmbkvguTD3CaRAyRQSFYy9ZKa86MXyYJL5mIyXxwNcNeiJ/xtm/3JnonClIefj+rz92BYbDVB5i0cv2IUlaLq2DwX5cy5MtyHKmqr25gI16M1XYtINuWZLls255CI8Qjv/L1pF3ocdZKESMf63GS+DkwCa37hQp6a3X7C8YpSN59IwW4102+EI5scEtGjzHzHF2iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=naPIQEFxrNPys9YdoIfl+H7zsQYlL7TUOZs/XXcgRrksOdKqOXiKyJqwSOCDxv1/TLz/sS/mCLvD6njgl302wWeJTCbjJCnNnwHK8biBSPivzTKzwGl0YQE9pda/S+HR0qzm8ahW+5vdBCRgf9lm7do1ViFDm9qpNkHBCicH8pGMkvg5Oj9x7xIhsyo9uFMI7UGQ7zQqE8n6RCbVi20rp7yXnJ3bEqGLiy4JkQhBVWYr2R+ait41g1zI85TpEiovzkhtPNMu0nM56EHBcJmvc4ToyMEuW9vZlC9Rdw2XgEfmnahfJ2ZigF4NkufgfuBOZgXfWgU1PNTi9JU90ROmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=nEGTy0kPmXAoPmOXA6Rc8k8XsTJeV1NoQcbyyWC6BfEG1ix3R4dqNtoKDyNm0wVuocmc+xF0HGCIuaF+UUSutHL4o5D/hcw0B1YoSBiaoEmvl0AcvDfQa/YMCtkswzV4kMEAfwKJ5HAyCWM/ksx2/P/GF3seTJzRj1ZYnHn4v7E=
Received: from DS7PR03CA0059.namprd03.prod.outlook.com (2603:10b6:5:3b5::34)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:25:08 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::d5) by DS7PR03CA0059.outlook.office365.com
 (2603:10b6:5:3b5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 17:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 17:25:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 11:25:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 09:24:45 -0800
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Mar 2023 11:24:17 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
 <pratyush@kernel.org>, <Sanju.Mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>, 
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
 <windhl@126.com>, <yangyingliang@huawei.com>, <william.zhang@broadcom.com>,
 <kursad.oney@broadcom.com>, <jonas.gorski@gmail.com>,
 <anand.gore@broadcom.com>, <rafal@milecki.pl>
Date: Mon, 6 Mar 2023 22:51:00 +0530
Message-ID: <20230306172109.595464-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1422a481-6afc-4b20-fdb4-08db1e67bbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzzSJUjobRyMuwK7pspBvT8itA3MpfoIsUnk6QlJ+jW6NaqPAv9xdxXpXr0Foe4qaWvX4J6+01u1XrVYGultnpZNyYePaDI2KxaedeepviAeTRUGX2rshWu68hdS7d7/u/morW4/WVgFBMwB84eyNqKznARBpSA2SACs99Kr9tsHnG/TFmUTpFFZ7vV6VGYlthkKFLd88He+gFA1O8cQsmF91HqZVeE8oBVxeITAWxuItQ452sLqy+9uJX0jCa5gmFuB3rPoqPsZr5IcDjAANZ8EbvofKaTLXCbqXWjoWyR4X/3uJ0U/Gt/pFweaPCH30XfzG6jY7TNfwetiQFHoZlieO7eH0G5F7qqT0AEAgsT7kqWe88sEROr+qzcR9wr7NZs1Is11qSRuU1mJErtwp46QQygpz0DM5qeoRkzbjXgS7I29m/nYu9nAV0ilSJhXUlGB1b75t4XSD9+3WhnCNxuQq6wWaAtivqI6VuxM8MkquyZy0o1K93+ux7kqkRpUAPode0ryFB0bzx9M44ZzruKKHSDa1O3rbYIVQqlOQC4t7F2fBd6RF8tE4+zx9qjkyzNxkdnTEcllXAhpLzWXfuESzsVcZ+IXzrFumwoQIy0djF1abnlev6tmQXDwbVpg0PuSHpwIMdD7u4YnNDQhc7xSbPd6eElzlwQhO6GmZ36W7DQ58Dzj4cJjVcGwvU5364yZYDbiDd/ejwN2b7wqVWGXyB9yeGKH+9BZdn/vPvi/KrYJugYRQ1vbqkez6T1F4JZccnCWFAZVnSMP9GQjvdQ5a1TVgRz5jQ21xBgrXxPvzAh2kjO+ScQ0GyQaX6B0ygIB1GKPNIp8buJiWN63rPHBZpZiHBzQxvqEj7NBHJg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(921005)(86362001)(82740400003)(81166007)(356005)(5660300002)(36756003)(7416002)(7276002)(7336002)(7366002)(2906002)(7406005)(4326008)(70586007)(70206006)(40480700001)(8676002)(8936002)(41300700001)(1191002)(82310400005)(2616005)(336012)(26005)(40460700003)(186003)(83380400001)(47076005)(426003)(54906003)(110136005)(478600001)(316002)(1076003)(6666004)(41080700001)(2101003)(36900700001)(83996005)(84006005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:25:08.3283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1422a481-6afc-4b20-fdb4-08db1e67bbf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, alsa-devel@alsa-project.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, jonathanh@nvidia.com,
 amit.kumar-mahapatra@amd.com, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, linuxppc-dev@lists.ozlabs.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, patches@opensource.cirrus.com,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: [Linux-stm32] [PATCH V5 06/15] platform/x86:
	serial-multi-instantiate: Replace all spi->chip_select and
	spi->cs_gpiod references with function call
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
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 5362f1a7b77c..270a4700d25d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -139,7 +139,8 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 			goto error;
 		}
 
-		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
+		dev_dbg(dev, "SPI device %s using chip select %u", name,
+			spi_get_chipselect(spi_dev, 0));
 
 		smi->spi_devs[i] = spi_dev;
 		smi->spi_num++;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
