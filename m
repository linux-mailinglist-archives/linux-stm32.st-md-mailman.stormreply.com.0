Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD56012EC
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:49:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 825F3C65051;
	Mon, 17 Oct 2022 15:49:07 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D5AC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 12:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofkS6zmSlU/L160fuk3kmJfu8LrH7414/6LHGgdWrq21sR+entrcv7NnwzY8bJFiW/D4EDXWghc5r1YSsjVT0KjsjQFhZNFzxoBOobPKD8LGHeweb2WI6dhSMIZAhagtR5DKY/c6imrmvRDJs99ivF1j5pwayKNeGKjMEShz9vmvItjNbA1yPavRArjqK0iSRXzfvAOjQ/GA/kK/6QhwovQDK4aD52JdDTnCi/LrxRBZrUpjSax3Y1MaDN/xRK9C2QQVYF7xHXIRrKSNg2UWAymqosFZvB1cPSJRuDiXRilDhIRuPiGDdeMwnW4EEOQnO8lPh3qWG+3LolgrVrAh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwd9qUuHdsHBoeDJaDZzMkmq1y0m1ydAGqQ/2KCaDWk=;
 b=YZFfDCujCF4TiMP8nsg2fPU5cr5GKwq7exQIt2NDVP4TMTmCdNSAIzumpwj4ToK9s8NZwLDIpZCBFbDX6yJps04DQLeuNx8xnjuuXQqOKeYVNpI0ouE/1vYePUpAnaojVvEPbLH33Jh2bjtn8ZHoadLLdiCgsoLE3dL25R9HygxGxbe5F4shdolc7/zlVbPxOrC+k1biAvkd6OtUpxJryzd6w4YflQRQOk+Cy6y6F6K5+B6DwmshPTBRsluDzQO19EL5S/P01LvUUFZYg4S6zML0dE96fdz/akra4CNnhTzkza9pVn3QCerlRFN+4FEHs2jQrMFKxff5Z+cUYRF4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwd9qUuHdsHBoeDJaDZzMkmq1y0m1ydAGqQ/2KCaDWk=;
 b=rvpNhsHsvaPXQyDMcXhnaphwV6MTgGmlA+SGT+izmUQCOOVvd4rChDkr8S+tyvIno/ZmeClZlTLjpNF+h5JEFos0ggjTTYWaQQFG2rsJ2tXR5SDU7WyoweFIocx4WsDqnxQBU+AahDSPEkepuWnHXTEYNVB5+dYMnmwcNr2874c=
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 12:16:08 +0000
Received: from BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::8a) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 12:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT103.mail.protection.outlook.com (10.13.176.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 12:16:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 07:16:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 05:16:06 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via
 Frontend Transport; Mon, 17 Oct 2022 07:15:43 -0500
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
Date: Mon, 17 Oct 2022 17:42:46 +0530
Message-ID: <20221017121249.19061-8-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
References: <20221017121249.19061-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT103:EE_|MW4PR12MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 168266ee-b613-4b35-5fbb-08dab0395f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUFDR5U8DYxStaYK3AfNFl0eRi4RodVP9hy2F95QaPiLb5yiwDk4oZmCCfLScEiMzfDyQmi2gc8ncUSgdIN5rtB7tn2yqwpm/61g7Xjun0zgcV0tnYDlBI+cooMJG/mMTBwGUE81VlUXUiwr0PwXcV0rJ9EbYfrNcMEODGWRQesKBRtcx18/uL2xRykSzCeI6le9/0ifmG/eYoo1/XcuYGMuPJXTAawCPLyJMnHEI4UFHRlmuN4h6GCx/MgFVZZsHsB8KDnRhSy8fXFHHbM7JupvAPnXNq3aff6HKVRxUR3k/cILa8oxW01qPzFA5Bk+rAb4Ut9o8vk2O0R3rEEMhjSoPuxi5EMzeG+jD6dKtnxZpifp1v2c3zztN3zae1O/EbIBjw6rU5dj+vzIONdiQeSZGz5Y2cnVkFtpIIVSyXqbd8Vmdsz7CKi3ts5wECh8siB51Qk4tb7yTcWCUfxyFl992wed3HbWhbaOgQctwaar4syL4JAAWJrYIEvk1ZkQhjVs6LiAnT6E86bUUy+kem0MTYmYTceVpm450O5AXOW05LzLasJZSNqsj6uATPMOYrIfqj28SrPa8kn+5i83eWS7oOgBLKNUE6FWvJtcYVL2qTfBeyPfnHLf6tJW/F+eaq1323A02BqCDq3rGzQAhjzFYEoCRLJP9aI/Duw2untewrzpsPawUewCMhGznnqQRP5+sfurizNXzhFVN4KLjp3LTHofXsWV5EYOPNQJQi1WbBJX7FHd+CkijrQ0K5iFHJbkQU2aYEdb+eYKE/GG1MCL0aZekdlh7/CHsy/8I9S0wvvjzlE5Q/EfnQpmOnM8tPTtC12I9td/do9B/tLe4G97USlzzrn3LqKyPJXShNmo7uXILSJ8SE3X0MjsBlPNc2B2RQxT7ZlWU64P7Pe00g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(186003)(336012)(2616005)(1076003)(2906002)(40460700003)(26005)(8676002)(41300700001)(4326008)(82740400003)(47076005)(426003)(40480700001)(86362001)(81166007)(82310400005)(356005)(921005)(36860700001)(316002)(54906003)(7406005)(36756003)(8936002)(5660300002)(7416002)(7366002)(7336002)(70206006)(70586007)(110136005)(478600001)(2101003)(83996005)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 12:16:08.0416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168266ee-b613-4b35-5fbb-08dab0395f1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
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
Subject: [Linux-stm32] [PATCH 07/10] spi: spi-zynqmp-gqspi: Add stacked
	memories support in GQSPI driver
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

GQSPI supports two chip select CS0 & CS1. Update the driver to
assert/de-assert the appropriate chip select as per the bits set in
qspi->cs_index_mask.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/spi/spi-zynqmp-gqspi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 35ff734fb82d..4759f704bf5c 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -156,6 +156,9 @@
 #define GQSPI_FREQ_100MHZ	100000000
 #define GQSPI_FREQ_150MHZ	150000000
 
+#define GQSPI_SELECT_LOWER_CS  BIT(0)
+#define GQSPI_SELECT_UPPER_CS  BIT(1)
+
 #define SPI_AUTOSUSPEND_TIMEOUT		3000
 enum mode_type {GQSPI_MODE_IO, GQSPI_MODE_DMA};
 
@@ -467,15 +470,17 @@ static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
 
 	genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
 
+	if (qspi->cs_index_mask & GQSPI_SELECT_UPPER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_UPPER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	} else if (qspi->cs_index_mask & GQSPI_SELECT_LOWER_CS) {
+		zynqmp_gqspi_selectslave(xqspi,
+					 GQSPI_SELECT_FLASH_CS_LOWER,
+					 GQSPI_SELECT_FLASH_BUS_LOWER);
+	}
+	genfifoentry |= xqspi->genfifobus;
 	if (!is_high) {
-		if (!qspi->chip_select[0]) {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_LOWER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
-		} else {
-			xqspi->genfifobus = GQSPI_GENFIFO_BUS_UPPER;
-			xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
-		}
-		genfifoentry |= xqspi->genfifobus;
 		genfifoentry |= xqspi->genfifocs;
 		genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
 	} else {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
