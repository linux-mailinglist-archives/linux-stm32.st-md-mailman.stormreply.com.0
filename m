Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C816881F4
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Feb 2023 16:26:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99381C6904F;
	Thu,  2 Feb 2023 15:26:43 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09C97C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Feb 2023 15:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgpkAjWMvrIIeLk4heyNXxChWczXPdGIoT+yLcf16OMJcJTk6gGP4TvcvLY3TIUXx2SzZt6FLRVGMtWqHqzMcslhJvRlAB2UfzM3TbkSvZPOdTurmpzD63+V9mu1D98mxg3coU+6URfCpy9w60lG06jQ+vOz6ihou9J6MlYllXdllkQ4P5kEXBzzU9C/oH4TRat+4QhwpPIa5k+dB9HN1d77GaGUnIN9Ei8IzvRCY9Xu1P54/Sw0XF5h92G7kh7Wt8fTggpo5gZG1JKVzOgh9g35Zg96u45J7DlMi15t3pinhi2R7ILgzt2nsnuwehEjIN0qxbgg1fPpc+QuW3TLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81s+8TCJ7jCbm+CdMdkkcrMQFPnQni896CqX3sAY8EM=;
 b=A9yXRMZ5mk5kcYuIw6XUHx3ft2Jpj68UvT2A++0b0KleDwYUx26M2uLcqjxcJCSuBGViM6O3N0COHF/IhmWkrbaPyTbc9OviMCDCB3WqhEYlk6N5SktjFduGhWjD16KA568HR+ZPgisE+Vbi/GTen26biQzNK0Re1cfFrcnSnQrXF4bPXejOs5+CHv4ehvZDjlrBU/BIoDoG8YMmjj0Kx/7Ie8vRHcv92W49E/aSqX2XjY3jnNbj+X6oR5OZwhlovUDxz5uDvB6k0AjBX16sjrF16ff10eaLffE1fIG2V3gkHtEF7U2HolWNbT3LgThB/JKnBBHgyv9T2DbVMKOJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81s+8TCJ7jCbm+CdMdkkcrMQFPnQni896CqX3sAY8EM=;
 b=o0XxKOyI2oxbW1Z573XLdd9DL1tH38o+QrJ6/c0JzUqRA4GQDIUYxtlgCa/y6H7wbAExL4zctOIeZq7PQcswINz8vrzaxIODvh8n9RnMjECIBZvFt4IF967zCTISdgI5enV6lVitsSSdJRt2KCMIHdgVkWE45f0ANKSr42GXTW8=
Received: from DS7PR03CA0146.namprd03.prod.outlook.com (2603:10b6:5:3b4::31)
 by DS7PR12MB5909.namprd12.prod.outlook.com (2603:10b6:8:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 15:26:34 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::61) by DS7PR03CA0146.outlook.office365.com
 (2603:10b6:5:3b4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Thu, 2 Feb 2023 15:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.28 via Frontend Transport; Thu, 2 Feb 2023 15:26:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 09:26:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 07:26:31 -0800
Received: from xhdsgoud40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 2 Feb 2023 09:26:08 -0600
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
 <kvalo@kernel.org>
Date: Thu, 2 Feb 2023 20:52:53 +0530
Message-ID: <20230202152258.512973-9-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|DS7PR12MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ce5bb7-4295-4cd5-ac77-08db0531de7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRdddnif87Mq7xpo0WIbiRUN0pvJ11H9rqmN0ue9xwgxjjdiWfYestaJZl6gwAz0BMNM8XWVsIRv28JBuk9CZ1nWQnZuIbwqM2H84sLhKy/qexeJSJk0dOxS1cPl2bBf94Sc9RoZ86l4hO9JntwOqFzFWTXZQv2yoK4CvCRwjdGmyZGe3V1wuGFdVmM9e4nu5fcAbnNgv1nx4AD6yS3L0X16rZWR9QvAZPMeB1oUxLbAZAphl4b9KgTefDj3xzkaB8C9oae51/oYTqjCIfzc4ybyDf9nJs36lD4EGX0ZzwWf6bKbUcVCwfNlZpAOgN1bfgTHTGzTJEUu4YN0BllJZ5uBuJWkqwwaiRZDr5FZs0Qd2JaKKPWTxLxz3Jo2XP6hqZUYQxYMniGbFtuRgDhhyXpEuUZ9qy0bKp5aI9HD7QEVWE2vqqhCQYFOhij3rdc+xoFeKMboRP8BTTgJyeQM5S7yhiUwcYBTJGm719Nkr5vezlO89xqaR+UE+3vMBzIoAunKM/1riWumzChg2cvfoFYmj6admgctJrIW/X/RbN4GgN9eRibW277fXXXkzX8mS1yw4jVZzhupCqpUEuyexW81NtX5YXD+K8yVhxJ4AuQeV8ratOIkiwKmG01qioWCHgyE2z8uX/P5HTExS5UhL8/CFdeFpMaWmya9lCtJNL90C+VJKdOnOMI4O6xFlyahk5aqMg8hxGj4RpWnmR7gJnPs1rxxR/HLmRv4vNNnNv2NDbwQfX+k1by6xj/wcDt09B5BREc6uk6fVBoW010bZrpXN6ZpoqeEhsE4C+pZoyL+7WVUU7fO31H6vck448g7mW9Ay73MgwfyX7yyMvvDJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(2906002)(36756003)(82310400005)(426003)(336012)(47076005)(110136005)(54906003)(2616005)(83380400001)(316002)(6666004)(26005)(478600001)(186003)(70586007)(1076003)(40460700003)(70206006)(4326008)(921005)(7366002)(40480700001)(8936002)(5660300002)(7336002)(356005)(7276002)(82740400003)(8676002)(86362001)(7416002)(7406005)(41300700001)(81166007)(36860700001)(83996005)(2101003)(41080700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 15:26:34.5768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ce5bb7-4295-4cd5-ac77-08db0531de7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5909
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, tali.perry1@gmail.com, ldewangan@nvidia.com,
 linux-mtd@lists.infradead.org, alim.akhtar@samsung.com,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
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
 michael@walle.cc, thierry.reding@gmail.com, palmer@dabbelt.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 claudiu.beznea@microchip.com
Subject: [Linux-stm32] [PATCH v3 08/13] mtd: spi-nor: Convert macros with
	inline functions
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

In further patches the nor->params references in
spi_nor_otp_region_len(nor) & spi_nor_otp_n_regions(nor) macros will be
replaced with spi_nor_get_params() API. To make the transition smoother,
first converting the macros into static inline functions.

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/otp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 00ab0d2d6d2f..3d75899de303 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,27 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+/**
+ * spi_nor_otp_region_len() - get size of one OTP region in bytes
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: size of one OTP region in bytes
+ */
+static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
+{
+	return nor->params->otp.org->len;
+}
+
+/**
+ * spi_nor_otp_n_regions() - get number of individual OTP regions
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: number of individual OTP regions
+ */
+static inline unsigned int spi_nor_otp_n_regions(struct spi_nor *nor)
+{
+	return nor->params->otp.org->n_regions;
+}
 
 /**
  * spi_nor_otp_read_secr() - read security register
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
