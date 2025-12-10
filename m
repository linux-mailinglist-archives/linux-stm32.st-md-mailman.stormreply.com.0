Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E06CB2A7A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DDC8C628AC;
	Wed, 10 Dec 2025 10:16:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023122.outbound.protection.outlook.com
 [40.107.162.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BED9C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3a7q/xJzn9y3/JMp1yx9gHsojUAp7lEDn6ZC95r7n4vI75Ok1DQew9JYbZG/qDBaubRNbscNLUhQoNTu6OiR/q6g2MqvUn4otKYvAJmSTFfgs0tjR6H/58TalPXZudagOxQqL/L20k6Qe6vQAZIzu+OY4kM/YhRTixO2TvV6caAEJIRddd9A66U7c6kt3SxiQq4gjAzLIaIdw0UXbnlfrSsdTYzDehajFjJntf4DzIom8dFtIJRHjh2MWu0pwd+GYEyiHeV5O+eJI27A24VrVxtVZVxq9rTuODTEStDN3zYphCAvcNke0vqE06xoCJwXD8L461d6E5MEH4YKfKi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM0OaW0E/SgwP5X2OGiNMUsoYcnx0P1QvIZ1zQCjoCk=;
 b=exHAv2k9iW3tzlSgYb9O3oHwCVvLDWWwUiJvM7xxb2QI6Z8t1fwAJbIeTtvKsEURdquw+HcuAtfoew80QCNNjdrW78txhFuJyt2Gro5kU/UKfpCjIig7v45bzKScxL9lFqtFpbtG0JrbyDzAnUDBjv8QcZeMhvP4XfqA/T2kCk+4bAOoTqAwjwLJqXlq944zTDO/HuThbbu37WwoH5hs1jNUvdvnZh44G4T6+APPlaV4fiW1SvnyNXcVI1e9v76UeUTcu9yScbRzj96jm7nmzI73TIrDtdcEbjpFlYSXyjsErJFcgvYIJpvHYMwnQ0x7RzwmvEy9fGS3yeOg/R4eTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM0OaW0E/SgwP5X2OGiNMUsoYcnx0P1QvIZ1zQCjoCk=;
 b=dDU7KGDfugol3tkwcF9ux1/a/BUcKKqfuqH4lxcHMocdurOVu45JJwp6S+SgIB/TRBZ7X5INnyjcJrobede5+ghbnSlzSP80V1RzhSM6ST7SVue/DuWC5qH5m2AIS1oPiQrHn0tT252jKA4Qvf0wXfqpBothwRELOaw6dzfCJjk=
Received: from DB9PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::33) by VI0P195MB3370.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:16:20 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::32) by DB9PR01CA0028.outlook.office365.com
 (2603:10a6:10:1d8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 10:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:19 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:15 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:15 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161557-317 ; Wed, 10 Dec 2025 11:16:15 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:08 +0100
Message-ID: <20251210101611.27008-9-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:15,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:15
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|VI0P195MB3370:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbfd260-02a5-4dc4-7a0f-08de37d529b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IzZ+49x9wj0qgTRe/aSofASg6xh5NUQyLirkkDqOOfC/y557926ZRjC+52mg?=
 =?us-ascii?Q?z6PEOzoWw6J1K7S01TwP4Fbdbqw5xodIncq1lbzJbh/oHL6Z151jOiJBbggD?=
 =?us-ascii?Q?69bjUhaAc1hj1zlZ1nT53y+GU0Ts1pKXaCtAkndhryZI/2yemeOZWVexqnbe?=
 =?us-ascii?Q?E0ysgjRNzWI2cyGiOI5e9O7O90iZMuS9zTcDd9hYfna6mdcvFrb/JT/JwhnO?=
 =?us-ascii?Q?Hbm32qZY6zI6oXPXYNM6zsGo3NBgzkmb1W6WlcPuhGqk59x3u8NQByqrnCpc?=
 =?us-ascii?Q?qsWqeHPqmVxTsKMmDXqchrI0rycoMC+cNTwxq4AeP20bUDSedLE3+fBhZbrc?=
 =?us-ascii?Q?crpCyI5PAEIRz/0IaSCBlB8D1V7hV/cPA2y2aqgrikcDczWI1cL/kgHGSHL8?=
 =?us-ascii?Q?4xWiA7biFx9CNmtx15R5EPpYNyJ5dWywp1Pi4uskCgYDnVrbeGuVw6spt24N?=
 =?us-ascii?Q?MPxf6Epk6HAOsGG2KoLbFfVadFUAINGTNqblyRjX2do4YM/xXmGusIex0jeU?=
 =?us-ascii?Q?+T4aKqLER1+VSHXZGW6FNDHMO9YmitvZkB6yuHtkw411HuV6ACj5ppadKjR+?=
 =?us-ascii?Q?/JSvndc9PwL+qE8vItYu6VS/CwcAV8uxcTFM6ddGMsz/ZUcEnsFzgJsht+wk?=
 =?us-ascii?Q?oOVeNsDyaSW40CaXrhUh4oNxVv8ZvbJbbU9omRr8/jAdjP6wzt+PUjzJoGnS?=
 =?us-ascii?Q?06Twfdjix7UOdRQTTMr8bJLbMC2St74NYTvtmpaOxdrPmBFnixg+eJY/mv6G?=
 =?us-ascii?Q?5GCRsetStyjlxVKrSGMIPLBWCuyfu/0YhRVlXBjjnRCpYGbCH++E4Gkbni0L?=
 =?us-ascii?Q?7sjo39/clcG1Q31UloWIUDdF8yoPjzG4FnHULdJHeeZzq7eXBb9ZS4Nwi+Lp?=
 =?us-ascii?Q?O1ewWnJviUhylfX5aWgstxw1h9/6PaPCPZzd1mfA9HOrUJcCkTj1mdxyufcd?=
 =?us-ascii?Q?pekxXtTu8nt71zvdWCO18QUMxS6YnPNRV+H8/M6Ax7ZmPw8L2sAoXuDJDUVS?=
 =?us-ascii?Q?0db8HLZcHLG8cRctWr9oEmv3GZbrmo+M3tcbDfjmAOfZ5vBxLr+szswK8yEP?=
 =?us-ascii?Q?cV3yWDsTgW5HlSeV7nl49jFI+mrge6FJ3tAKMOHfRjvIchAOVhotGlBE9YuI?=
 =?us-ascii?Q?TKMVWxNX+VJfd9xPr6KcTHcqkxkSK7Uu9kTCN5Zm5BxDTD2W3fBr9VLqbRjs?=
 =?us-ascii?Q?x+StZlkdgm177/7gNvIxyJYF6QyM5CE95aTRg2VrzyiZY3ct9oguIdRZsUaK?=
 =?us-ascii?Q?RFjtkjmFnm9xmpW9w37S2EDQs2B9yuD0N7yQ0EOsehyOkiBiApPqKhNVAWPk?=
 =?us-ascii?Q?Ddtu4M7sG2vKpy7tfUX67yFGVt6teetgcqv4uQUMz5VY+N/l2ZNjjEHMPavC?=
 =?us-ascii?Q?o51v3sZU9v3bXXc0qwcexKDPjs0QU8SOI6y+1BF+xTwHNjinzanjQPbvTEy8?=
 =?us-ascii?Q?IwYDNEBjAsjWmjvquZ9ILcexVWkjsZHi+ZkD8OjqX848gHzLLSV6jp/IPbxS?=
 =?us-ascii?Q?xJINleAPBOaJq4dIJihwGxilmoMh0aGJVVM4RnjWY8UxZ9o9LYvqhoQ+RPf1?=
 =?us-ascii?Q?+vQ+icG2Bf7c0V6kGrQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:19.9723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbfd260-02a5-4dc4-7a0f-08de37d529b4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3370
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 08/11] ARM: dts: stm32:
	phyboard-sargas: Move aliases from dts to dtsi
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

aliases are common to every phyboard-sargas version. So move it to
the common phyboard dtsi file.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts | 9 ---------
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi    | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
index 48adc3462958..f7c02a381304 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -16,15 +16,6 @@ / {
 	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible = "phytec,phycore-stm32mp1-3",
 		     "phytec,phycore-stm32mp157c-som", "st,stm32mp157";
-
-	aliases {
-		mmc0 = &sdmmc1;
-		mmc1 = &sdmmc2;
-		mmc2 = &sdmmc3;
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &usart1;
-	};
 };
 
 &cryp1 {
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 44f3aa1ddebf..9578e78bcc1d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -12,6 +12,15 @@
 #include <dt-bindings/leds/leds-pca9532.h>
 
 / {
+	aliases {
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
+		mmc2 = &sdmmc3;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &usart1;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
