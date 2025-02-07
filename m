Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC0A2C596
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:36:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75521C78F8C;
	Fri,  7 Feb 2025 14:36:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2117.outbound.protection.outlook.com [40.107.21.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69023C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFt2IYBpLha145ouLdjlrcoSLr6HRC2udsku63yhQ0wdUpdQRupLGegOa/TnONDSvKWap1HgIsZU4bVpUAWNqIxxXJgcF1ugfjz3krOQKTWHi9upLHBb8PpleFL/mLnEVHRaDf+VOIe6boSCL5zq1jNxyuKBRiEfgfJ3ILdqAylNuGG03Yml4XXTRv1fZustJDhPLq3SdrVRtS2NqV/oOGN/ZMMVUcBtYDoV+8ivFYYAZ13T1CRMim4FnBdKE6LNO2g057dX/03eXAi1XUnGD/Qr0KEhqc7Laz9yszWXlUAg+WYbuEWyRMCZeTLLWHeo6q0ty4gVPfAdrcPg6DJ/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=zHpViU+hbQqJajBgZ3SQUW1uFf/NF05/G2oQSLT+CU7i3HgXKf2tCRLI4bfPppw9VzlTnu9XbAZ1Urt759BeQO6xlNBFc39/2lIGoMtqkO8rXhNOISYfSZUfhsBPmMAqp2X3wzVqHBLAn0qEmVBzNNnUl4BDsEcFyRPeCGqXOvT6lYqAz3Gi7b9aOgOfCaTX+tJI8hPfQidFSwasC0sYkzwub7abjeweLXRpbBRYj+NqNFl9H1ZKbZL4QzWzIRkr1QtkQ1OEPmdUIwHXQVvTY3tJvmBB0wjumQiHFS/EvnauIZI0SdZ+l2q2ZNDpHSAt8yL+y9Kqe3/B+Jyr7YxMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxzwLVrrw+kPA6VXI91oJrzdavPUFWWsU/19Ehqxjp8=;
 b=kraviZtNPEUc8oMkWU9nYQXLOsabWGWwPu1r09weqN/v1rPhV0zdni4a5OyQEt9iJSF0waMkkTPgFH+B0PkuP+q4Y9ISqd6TBGdaju+F+WakHmOq4z5sajIDOFmq1k882NCHC1KuShhzzhhi0tmTdq6meUmxVIj6oOG8AuIgFAc=
Received: from DB6PR0301CA0069.eurprd03.prod.outlook.com (2603:10a6:6:30::16)
 by AM0P195MB0722.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:163::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 14:35:56 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::4b) by DB6PR0301CA0069.outlook.office365.com
 (2603:10a6:6:30::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 14:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:56 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:52 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:52 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355210-62 ; Fri, 7 Feb 2025 15:35:52 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:44 +0100
Message-ID: <20250207143550.432541-6-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:52,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:52
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|AM0P195MB0722:EE_
X-MS-Office365-Filtering-Correlation-Id: c349f519-149a-4025-90cf-08dd4784bb9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PBQYvOPkmZ2DfFgrFafQRFlIPm1tBg/K4xGpK2GKYK1oPAi/UxwFVqjfaJM3?=
 =?us-ascii?Q?ttFXnhy4NRhYYl5Zx8v6Z36blt3jZXkBb3ESheQuLwg9z8Dp6S29lCN+D5VS?=
 =?us-ascii?Q?bFlmSO3aPltuUlnEFILl3HyLbmIMFs9hglD/JzLbCDaZ7PLwvrTCduaGZoI8?=
 =?us-ascii?Q?ajJ2r9TfaMxE+FV1vhYBVnpK8dFXQ0UoDZRGUP6dJp687Aszs8HrBFoVMW5D?=
 =?us-ascii?Q?UEHKeD1lee/tfXJZ1WOwcnNvv+2WlvxgkHfeejlSfZwbVUzgNyoAwxvQ7Gyc?=
 =?us-ascii?Q?GkYz6kY2xvf++suRpGoj1Qf5TEJRBT7mTMbILCxKE84/5hU3kB06xk60EFxl?=
 =?us-ascii?Q?RY/dh5vWbM7DEdBRy2zrSiF3UBCEzeCjuRS+1Nm4BmYTmvRxTPRdvlBQgD0I?=
 =?us-ascii?Q?FUPq10sff5zytlFNX/lfGbVeIQIqWX7y40jA3LCeWTj5RcEFHHAlpdzNC4nz?=
 =?us-ascii?Q?bx1FVfw0MPHLKljzOR2+AsM3nvLADsIOdR3Dj6pLnpqMPY1tJIFoIMBzC4qU?=
 =?us-ascii?Q?mfVEp34eLW5nlAcHPO1VQZ5RDXVIk8W/biFYqc4dWxoJitbObQKnidTPZ/Rg?=
 =?us-ascii?Q?PmVxiyT/FytPZSD3uGu6YPi9QpmZMuXNxijZ9KdCC49J8FAJivJdv7L+YEMV?=
 =?us-ascii?Q?m0OmXfP0pwa2MCKoNMc1UBeM+aXoWZdu3b9EEiOPlwAQs1O/Dzy6spa5S8sy?=
 =?us-ascii?Q?lWgHoFfeS0uz36cjPSsDtY6pvSBb2zx5db7c5+vB+WxoITgjTMnmhd7whjf8?=
 =?us-ascii?Q?Iq/Jqe/vrwptfzrBJhkmw40UG31HMGLm977TK99uwBRIODx1KzoEIfmRxNBn?=
 =?us-ascii?Q?CJzr6vTvQlsAUiLMqnkZ+15oByd0TJLpma7iIQMZRBO2Wq1rmI4ka23RqBjN?=
 =?us-ascii?Q?s3Z+aWQTjR2VXuHEBtb+4bTLzt8NnLBG+Q76AB02hCB67anqBl7Qj2bRVC0s?=
 =?us-ascii?Q?3/zTUblawHm2t/r5eJGfpWQ3ahc/bKEtvkyMVCMUGL69gA1voUx3ZGWFY30h?=
 =?us-ascii?Q?ydFDKkceA17H+odnBeHpfNdI0szJ9ayCnRJcLegMcez8EkaZYeHH3CmJkMlQ?=
 =?us-ascii?Q?lkozozZzH6Ltriu8oCnrZtE6N+sT3TqXYHOAWQiD4Q7zKC0Yg7VlfJIaSREP?=
 =?us-ascii?Q?/NkzUPywKZgoaEIah0CJOxdavA1XVXr0O7ClUxb2WWohHZzrHkBTyBIafAWk?=
 =?us-ascii?Q?LTCfcJJJReYJ1pBST/9zDcmzNBmNebkOu3AU678lppKQm/wyurouC2Dyq7Ui?=
 =?us-ascii?Q?B0GvLV0Qn1jrHlkxOCOZfoR8bTzPnvayDvhhKr8fVvutSCBo3XSlzD14QuJ2?=
 =?us-ascii?Q?PoLFzm2Y4JK2dihpB3mIO054vVxb7yp0CI08IBfnhmyP3X8SSAA/Z5HSn2Dp?=
 =?us-ascii?Q?99rb9HV80DLJVx77JTCPNlwTiwW1lHEyIc9Z12PExErw8U0j/bdyVSxtULyv?=
 =?us-ascii?Q?rBYpCRVA2ayYVMHa1UknTxG2pfMuTRA4OST8tecMPrU0Y/KXqZOYLJvUB02R?=
 =?us-ascii?Q?/aFtU0sge5pCzDs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:56.4683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c349f519-149a-4025-90cf-08dd4784bb9e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0722
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 05/11] ARM: dts: stm32mp15:
	phyboard-sargas: Fix uart4 and sai2 pinctrl
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

- UART4:
  "uart4_pins_a" pinmux option does not apply here, as PB9 should be
  used for UART4_TX instead of PG11 (PG11 is LCD_B3 on Sargas).
  Use "uart4_pins_e" instead.
  Also remove "pinctrl-3" which is useless (identical to "pinctrl-1").

- SAI2 A:
  "sai2a_pins_b" pinmux option does not apply here, as only PI6 is used
  for SAI2 A ("SAI2_SD_A"). Other pins of this group (PI7 and PD13) are
  not used for audio.
  Use "sai2a_sleep_pins_d" instead.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
index 2fdab99fc562..564b2607bb9d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
@@ -143,8 +143,8 @@ &sai2 {
 	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
 	clock-names = "pclk", "x8k", "x11k";
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sai2a_pins_b>, <&sai2b_pins_d>;
-	pinctrl-1 = <&sai2a_sleep_pins_b>, <&sai2b_sleep_pins_d>;
+	pinctrl-0 = <&sai2a_pins_d>, <&sai2b_pins_d>;
+	pinctrl-1 = <&sai2a_sleep_pins_d>, <&sai2b_sleep_pins_d>;
 	status = "okay";
 };
 
@@ -202,10 +202,9 @@ &spi1 {
 
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_a>;
-	pinctrl-1 = <&uart4_sleep_pins_a>;
-	pinctrl-2 = <&uart4_idle_pins_a>;
-	pinctrl-3 = <&uart4_pins_a>;
+	pinctrl-0 = <&uart4_pins_e>;
+	pinctrl-1 = <&uart4_sleep_pins_e>;
+	pinctrl-2 = <&uart4_idle_pins_e>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
