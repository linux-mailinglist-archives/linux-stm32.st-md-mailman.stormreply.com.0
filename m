Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EDCB2A9C
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:18:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A592DC628AC;
	Wed, 10 Dec 2025 10:18:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023099.outbound.protection.outlook.com
 [52.101.83.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14807C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OT8MlCq5HROpyL6NzAuqOqvys2ASq26qc6timjdPJFpVaTcNbW89/z5Y82CaMDm1IXIQrqj7Qx7iYVu4tw8Wi7niN1WGZma4XGx5I7V4L1ZxrSdn97W5gklfHV16JK1039VLco6ghkqR1bSM5eh/abBc6e9furTMXoAHmAlI3C6ocC8lwmdbUfZXEAK920SJ8+M6Q+PK1um0NTFuqyaVTl9DSJgpekF7CCqxu4/FdNwfa4j1Xz6yB7X94KAMMLnQneSr0Het6s/TjAVGl8qljJbWFUiw2cVYcUu/F0MYqgfiuYKsjFDKYHTgOdSc/n+1ePMLgiLW/O1dLJbMExSQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=r4uvpib9v7saGGlhvqlqDZDnaI56M7U3I282+7Rc7sBYqmsgFuE+/yfeFWuiVd+MwvsoNBB8dSH9iPk7TyYuwKgvIoSeAP9RD/X3q3lNiCmWEjiuIgIKJSIE2dWcRSgdmpnggWfF89CB3tHqDE0lSsuLH/SwPbfiv1ctzcjbjWLf/eTd2f0rhh5andOT3JiMCGX53mW+dGd3z58J4xUBC3wbTQ/po2j85X5+UxeKBDzdDNanSH3m3rnvee2b/ryUm/E00SK+EQiGBphv+MU0TbEWazLGE1XHwvyFSXS2jpakNCimjsBoIMo46E6lo/RoFZnZZwAon9t2j3ql/D3jTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlkBo13gAAMFxY69YUO/r2kEBTxBz8AgO2heyKDlsH0=;
 b=Zb20IujwMp6kBkyA1Eo/jj9FvsCEAQTDrBLnw3f9/vGSs1NpNloe4U3xyButAWFj0TFm2yUIXXmsi5yu+BQYjRWiMidRMyKL3j+s1vTeqU2rEdx1hjvID8UVcOZZpnoPYAf3JNz3PrOM8umir0zdFJOjASnbDPhl2nVANzMucpI=
Received: from DB9PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::7) by VI0P195MB3033.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2d7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:16:19 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::2b) by DB9PR01CA0002.outlook.office365.com
 (2603:10a6:10:1d8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 10:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:18 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:15 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:15 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161495-316 ; Wed, 10 Dec 2025 11:16:14 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:07 +0100
Message-ID: <20251210101611.27008-8-c.parant@phytec.fr>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|VI0P195MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: b2074b86-2e20-4981-3f69-08de37d52936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SPR5XaKFIpnFoUZ2AHqGrO73Kdb9qYzAePxj57JvQBb433BtlU2Yb5kaiMuz?=
 =?us-ascii?Q?i8Ema8WA97e+CLEDTGezoTPez2s6Ww6r6Qdi2XVzrw290YTCzmfQzOsRZ7Nt?=
 =?us-ascii?Q?T4XCCKYdOBKiRGiu4ZfxEdjvkP6LRXjqw0+KJCOA7tb3zm46FMKg+SB6BtmK?=
 =?us-ascii?Q?QWBH8LmMECCgwLuUxaJwBg/9fP1HA44a26kQQ3VmL9Bmdcwze0gbBOOLHDqe?=
 =?us-ascii?Q?oZVVLVGhFmTyAgeuHqNsBZmPM9DA7KW3yI3BNyEYEQSUTm0Qfd71aGOtuhIh?=
 =?us-ascii?Q?4t8IgnpSLyGluorhZynZ2VV65ULySw5DeN1u1FVWD6fGZ1x5i/LOgL8QzGzD?=
 =?us-ascii?Q?1DZ/A87iSY2suJq5Bf13dIHspvqeJ4oapC21Aimm88td6+vjTp2aTikH9+rB?=
 =?us-ascii?Q?rJ9GFBb/5iESMtJ/FcjU5PTDW9rXOxK4NFtGxZC69bqrgjh4QAWaBhWD6HSN?=
 =?us-ascii?Q?2BbvqMHrfGvch2HeuffzKBJERh9qvYP4xmU1YGWnvUQtH1iQN+UL9CWKgyRE?=
 =?us-ascii?Q?XWVHDPLy2G3e4aisNhpmkP02Zs/1DHVms/+InIC6m4AlH5mGGnRMCvEuWwFB?=
 =?us-ascii?Q?5uUQjJFXUXq6USPqCJUWwXrkeSemdlH3au0BWs6MvHGRyQ5JSy+PtGGihMmx?=
 =?us-ascii?Q?v6OA3lVxY5/CjIpX+Cz1RPdjAzx3T0OyPc878mykpF4h02kSx2EozDnJqMYq?=
 =?us-ascii?Q?9yZOdm9B0TgAav4CBbJylxbb8cFaqbOi5jwtOyduWEjVcDwBIoVX6iCf6RIz?=
 =?us-ascii?Q?HzNW2ftVtBnq4hK/CEo8dBlGya+bGJ2hmUlSeKsXM88z5iGN9zpyAJRfTkLH?=
 =?us-ascii?Q?wks8ryaPFSHW4Y8bPffp1F3sv3VmuvSGStg6tZuE370T59rj0vBFzhd+R56V?=
 =?us-ascii?Q?ajExsPF3NfWWDLAKBxg8TrcTkaOzsEeTS8PzCk3af0Wwe8/QbBKbZK1rRBKj?=
 =?us-ascii?Q?TDS7RMST0XxG5Rg00qHtj+O2Kf1BnbtKhmCIBOKcJ3XnKOt0uQ0my/eFJ0UG?=
 =?us-ascii?Q?YgkVT6o9W+mz+ZEh6fNL0DYEfTwQzatnaKntr7tCz9f5KDdoUQCZULKQZIYY?=
 =?us-ascii?Q?INTO0pi3jtUOWV+GfOt+meZxWj09fA6mGepmFBXYNfx3Zuf+cY8pYjO761HA?=
 =?us-ascii?Q?yAm4T9AMham/pg//0q4FYR7oZA97ICugKDCb3/mn0DwgnZzWCc6zMJwkSWoP?=
 =?us-ascii?Q?MbNUpKDo4sW4KTmJqB4kWSSRvfXKCYtayw8obT/XuEn8lteBOeRiVqkmZGmo?=
 =?us-ascii?Q?MDSpB8WA/RuoNFwdohzlcILd3t++0jjJmlJzxwJbB+XsGtOr9G3rSTtbn7kH?=
 =?us-ascii?Q?MYVcGLdE8Vnaf4c1VWgj61ardiAyho8sglp/GRvzeP2oopWc0AwgzuIFg06s?=
 =?us-ascii?Q?jGu4ioNLe+hvxHrh+xzeUYUYAVekNWwfZG1CxEwx8rZiE/rzR2sFgr4msD6z?=
 =?us-ascii?Q?MU0HvqFr0m5/7vU/FKPvoAa5JuCJELwSyIczrQxEXryRR2I4ZSSIbG2U9fDo?=
 =?us-ascii?Q?QEraxXL5q+TRppBmR0/GrPGn+NbctZOtj4bwXxL2F1LWhyLD1AFO//t/RYsj?=
 =?us-ascii?Q?uLfDN30Vc0sd/u+JHhY=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:18.9642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2074b86-2e20-4981-3f69-08de37d52936
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB3033
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 07/11] ARM: dts: stm32:
	phycore-stm32mp15: Add dummy memory-node
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

"memory" node is not necessary as the bootloader is taking care of
passing the correct DDR size.
However keep a dummy memory node with the minimum DDR size (512MB) with
comment explaining that.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
index 72926c3de52c..ce859b94ae26 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-phycore-som.dtsi
@@ -22,6 +22,15 @@ aliases {
 		rtc1 = &rtc;
 	};
 
+	/*
+	 * Set the minimum memory size here and
+	 * let the bootloader set the real size.
+	 */
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
