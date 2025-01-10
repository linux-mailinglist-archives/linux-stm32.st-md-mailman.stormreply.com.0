Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CEA09492
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 16:02:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52995C78F6F;
	Fri, 10 Jan 2025 15:02:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2113.outbound.protection.outlook.com [40.107.21.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18B00C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 15:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7YyH1hXrhd/cdktFK7M8lhx3QqY3mhIb81SFb5ALu+QgMUzXCNiVKCWyYVYPYdUTzgTRRb7Q8pxfLR5liZ3NW+lzdymsUQTvZM2tJB8ecwWqDD3Bj7gpxVD7hDS5xkvfTQCQrzVvUwtfImgDUSIQn5YwXjxF7qVVGahsKl257aXdwavFETkpM8YntRDdtcyJcyFouPqM8wYSO9ka9S2ytWu1wFmzC3IGyjm2RHFrVJbAWsfmSKLrf5EoqLINTVG0CLWcfeH2z0Tyg8JkXQR/5hb+3Wg+Q5qAG7VtFndW/Rk7V6VXf9QPVbAb89+wYuOEPSmO9UaOsoCwGZr/Fd23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4yCW7fz9of7ZgzbQksuVUmuVzW7uYUrdorMcsIVtvo=;
 b=yeyoIZjOGPuY+056Z8A8+UqVvDlSI03en9g63rrBfxzSapSkcQRY5ylWJiZsRDuG0AUqqk0Je64WLTomysIufgrvMTHqOE6FWo4BoXmjmevP8tlWHRTVXesjunibKQCuVBYS/oIGKaRor+xdzdSF/U7OJm8BNJYleNipEFvNlTLlh+11vz2pYUF9P7Qml7btoxYQq2JZn6VUX/OM7oodGWHNEWBLvs6hxl03mu6BdGqGoh581QL4pL7nW8OVzvOaiR7n9oyuzYvA+j3ahQvkMj0n4b3KtooN1fun/ZI1CIYC8VGrbDgNuFgZFuBIzpjzS+5/YJGbVhetLx/A/8x/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4yCW7fz9of7ZgzbQksuVUmuVzW7uYUrdorMcsIVtvo=;
 b=kytca89OEoQyzLn+SEo6gnJ5eOALJ+Nk+BaFAYxw4xY4AcbDAOXPF+IaqVDieU5i5UuTnZ7Z4sPAigVUUiEFwZOasN/nLhoX808DxCytjwD2whUYmioHR3txoGav9uonNMYFK7/RSHpHHbCWiDJK9xMWR72r/HaJkgFV0na4hec=
Received: from DU7P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::19)
 by PAVP195MB2211.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:2fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:02:48 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::41) by DU7P190CA0009.outlook.office365.com
 (2603:10a6:10:550::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 15:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 15:02:46 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from Diagnostix.phytec.de (172.25.0.14) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 10 Jan
 2025 16:02:18 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 10 Jan 2025 16:02:18 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025011016021864-30 ; Fri, 10 Jan 2025 16:02:18 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 10 Jan 2025 16:02:13 +0100
Message-ID: <20250110150216.309760-9-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.01.2025 16:02:18,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.01.2025 16:02:18
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|PAVP195MB2211:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0f5ddd-eb02-4297-21b4-08dd3187d7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jdi51VEQ8gAI1CVosrZ8FdEjnKPt8NoSv/Xafnw3TcCmtzVns9VWSdi7NZhf?=
 =?us-ascii?Q?Ih0JisIGMx5Ov5rk2ROOMmioWvizvq7GO1+ZDHkU74T3kvH082nUCvkXZfAs?=
 =?us-ascii?Q?G7ar1rcd1YuN7vi2+vvHgsU2GrQj7n0R0gonqS0tucrMO8owvw7TsQMn8wV5?=
 =?us-ascii?Q?SKzUAmggi2b5Tbe/2AGomlsK6XSRbGr29mBpeZEUqZt0+GojDVn/lwZWgCXa?=
 =?us-ascii?Q?WAi7jnpPCBXb5lI0Z+xYo7urmoO7PwghoXifm8Nud1rrwdyRQYmw2KQE6nfF?=
 =?us-ascii?Q?p1qX97OFK6fXiKoQLMhlaD3FHx3Hr7R4x9Pvq4xBziN87pUHjosEeQmykQRe?=
 =?us-ascii?Q?wjAqXZEz27LEXBXyyJPARTsAJBoMVdvPUYvt8d/5gMoK0R12y5ex/2sOO5Xr?=
 =?us-ascii?Q?6w0QGdlk1BIZqKA7eBxYkeuAEC/3jG+12dVDRYPCcfWa6hS63wkvvknmWeZ4?=
 =?us-ascii?Q?AHVvX/AhQQle1yaY5JsOkP0uZTOWU9J74ySHg1xle9CetSj48SjK3wLbGfp7?=
 =?us-ascii?Q?NfBnrUcaEnwCHmBq2iXd4iCD9CIOpP6tyk8pWnVgyciWjJqONZmZ20MXGARW?=
 =?us-ascii?Q?+5lBNmqyrZAbD7CjZOuzIGK6cv/ZPEZp9Eu+OAVXimR3P+11BBwAYaHxldZT?=
 =?us-ascii?Q?J2+sDUGLcbYmdby6ljldRWMbRmDqtqPKbAxrjZ/krHyAushMFb0PUGfWrWTQ?=
 =?us-ascii?Q?Gjq0GUppGVv80KdfnEteOeEHfHL07+PO6G5Qjb83cCGOnQHXOT3Jjbf/wtfb?=
 =?us-ascii?Q?9dxTjwPUWg5fF9tvVVHvcnSJXnEutVZnBOKcsaZ4Tnzuvfe6LMxHYVXb2KSs?=
 =?us-ascii?Q?8QDXXyIW5OPg4Pa/2Db0vflkjYO/4hG6Qjc1bGfoQnqOo21+NC9NzCKgFilt?=
 =?us-ascii?Q?wqE56U8qPKDtoegpXOeAvHoOjamfjupA590pH71QFivpKFdGVG4VaFN2HEKF?=
 =?us-ascii?Q?sTpS9NRwHup9HYzcAaf+wx76s8Map/zdewTuzrinUwby3rwGksFDZyLiuuBK?=
 =?us-ascii?Q?F1ezn1dth51LgAB5e11baMA2Nhp2NYL1SrI+yWIlHF/tDvbkXzuoHqE1m8le?=
 =?us-ascii?Q?eRcZy1KidFHV4GIzIBlxMcQSMaYhBRBQbD+6Pf1iVa+srI29Pj4O+IzPmjzB?=
 =?us-ascii?Q?t/U1fSxEMq3TOaU0R9tD65VLOC8nWYHOubR6ssvD9S7R2ilaSL0CZ6B/5Kcy?=
 =?us-ascii?Q?hrfeh4aJ9Y1AtiYqWhuw1b53qX3rsDwTgLLhQFXneuQ+G1Db9D7NVz9KHvgK?=
 =?us-ascii?Q?OULGulK2NtWFkPitNwVvoTMjwDXwsPlVG9SxKwK/8EmomVaJGV/CqR6YSjxN?=
 =?us-ascii?Q?n23QI3lHk6sc6clEyGy/gUNgg2/KVWvq7eydUEPvtu+UBdem0ddPlaWJYpBg?=
 =?us-ascii?Q?DXoFvu2OmsGQiGfrs6wBwX3XAjdlAo7um+bAN8jx7ZHPw/QpebSboS9oLA2w?=
 =?us-ascii?Q?awqrdqFOJI4m0Fjn9sXpdTpNnSk4l5f94EjvZ3OArz/lwceS3Xo+qUQMfwp0?=
 =?us-ascii?Q?Jl1BAgR3XM1ZNlc=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:02:46.9012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0f5ddd-eb02-4297-21b4-08dd3187d7f2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP195MB2211
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH 08/11] ARM: dts: stm32mp15: phyboard-sargas:
	Move aliases from dts to dtsi
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
index 43592234573c..462c89e68e2c 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
@@ -16,15 +16,6 @@ / {
 	model = "PHYTEC phyBOARD-Sargas STM32MP157C";
 	compatible = "phytec,stm32mp157c-phyboard-sargas-rdk",
 		     "phytec,stm32mp157c-phycore-som", "st,stm32mp157";
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
index 564b2607bb9d..3d62f9e4d0cd 100644
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
