Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E849A2C592
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:35:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28BA7C78F8E;
	Fri,  7 Feb 2025 14:35:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2120.outbound.protection.outlook.com [40.107.22.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A33FC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+XnRc49V5/mnF3ReRUcuc+38JbFTj9AvqCOCngNwK9CCD4q7yXkDr0vW+kkm6/VrL3u6o+vtNTW087C2psFmn1tmxpLb3QGwDMKVpqt60tB/FYtfZ/QaSfVgJX/6xr8HfL7p5/FMtaS0SkaHTSHWj3i6lDB35hZk5WiizwWIitW8j/MmymoHuBSu3UhZzHHyHJyltU/yd/YsbNtEmrZ6TmBxK8YWmTHsIhXrfPdm2aq1Jm/z9dQtahv4EI5K6E1WM93+UCJ5uzjXfzgaZNeP2UYLQbr+Ix/wTrJwkw9tlogfDpPoFQSaBeZTvd8expHjntiTNlfz4rxONgOmQBHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Fu0yUZPRf+LoqpqKl0DhujcjNcWWKstPaSu+GukmkU=;
 b=wpO00eAFU9gi0vFB6S1+WUGHh0MlJC8uQhzS308JzXBkuk/FUrqTYsVLe5rPoBZGkN14HDpPA7qIZ7XCU4EXdbZSAnOC33GgOWHYwz2R6S+ImAyPYkUh0LwN3Uzm4XRcMwYBuTZciVqHRrd87VkmUHRsdt3CimX1y04dWHEdeHoRppwvpN1dR3hLD+aLWA+6WaCIq9ehwiQd+8kIJhHL3U6fZDxQGxPeU4NMBumXfwbO4tMKlSc+TxPBgkkOdUYP4YmpIJKCJOZpVJ3aIyPxqAq/R25Pd8960Qn1cDJHag1V1CCuE4x9v3LzLbx+ZFyMCswcqBG48e2AlY9XJYfmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Fu0yUZPRf+LoqpqKl0DhujcjNcWWKstPaSu+GukmkU=;
 b=f42f9ezK0u5rSz8DPbUabTqk9xx27dl6CD2CKGGODYiaLu4oi6ReUTO/hysIGtB7Wnervytnd9oAz1mWCDI1RrmdwLLTk7g3jeO5rpu/t2JGXFWQaCYD7LHcsWoATryiz9NfrQRmiTcUMi9jHjQTOX7UYcZk/zZdOlUSlz4gYDA=
Received: from DB6PR0301CA0068.eurprd03.prod.outlook.com (2603:10a6:6:30::15)
 by GV1P195MB1691.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 14:35:52 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::6a) by DB6PR0301CA0068.outlook.office365.com
 (2603:10a6:6:30::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 14:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:51 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:51 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:51 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355102-57 ; Fri, 7 Feb 2025 15:35:51 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:39 +0100
Message-ID: <20250207143550.432541-1-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:51,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:51
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|GV1P195MB1691:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cac493b-cfdf-44a6-8a2e-08dd4784b8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hps7+SF1pnhzFr9m4OwohnzmmdkYxGS4ICK37arYS7ti4Ac2UHQGaZx0u+5t?=
 =?us-ascii?Q?uOs1zOovy7eebuD2lu2CBQx3k58tE/PUOwFJES77MFtxIUSw60/PwpYQXY2D?=
 =?us-ascii?Q?YVfUjSHbtelKwHVFpUQ3CzMbOaaT6OB3bRXUFqKossoYVO/pM030a5AlXl0O?=
 =?us-ascii?Q?lK4Vf9iOrXdOk9m9MDi0a0SD0gMLIEhb/F9A6fGzy0vm8byFxb0PDG7uDlHX?=
 =?us-ascii?Q?MbLvohoAiENBYXDVXHcPmx2xFCUgNYFbAxLeHzGpF/6c12auJ5g38Lae1v4E?=
 =?us-ascii?Q?4dcRuiBLTC81VDHAxgoJB7hFqmGwnc0TN/K7aDjkaza9jps9nJ78kU91MWSB?=
 =?us-ascii?Q?gP+s7DYJmngNNoVpm4M9W/HuMcfavs9SLGWO8mbVwRsQIosJEMCE8domoWUR?=
 =?us-ascii?Q?BjbmWqobIOZuDVwiUIZtobm0eLefE0Kr0Z0Nqm8tfRqdo6ZYBQxATi1rcSt1?=
 =?us-ascii?Q?59N7XvCWcsmAR2m3oXYSLILNmHPXh1UPxRRymJC/oQJsHYmxPh6lg5ODMgl5?=
 =?us-ascii?Q?uAdvMxI9xY0JbGDnNc8yW/o24ztsJD1sTkWdrbCjWP5zibNoXgZDfGFIPn+S?=
 =?us-ascii?Q?vxkeyzQDquogDi+dx0AtnTohlnOiaHzuZJCLp2NajHUcpZftbQ7ngrwBTaF/?=
 =?us-ascii?Q?8eYzIzD+P3ThN9kbjSFFyNHcluoqX99goqhnb1KScWpA8OaYndLMDGvxl97Y?=
 =?us-ascii?Q?26UgOPTVWBaf9tH5YUmIhCzrhKdz6d0l7xYW9y4q/5HMRt7l2VHN6wfIJzDC?=
 =?us-ascii?Q?Rd/DaBgGzbK0AWtJRc+TvDVTVtDmUU0i8Oh5//f1Lk3bP8bK1DivJw2ExHDp?=
 =?us-ascii?Q?IK3cK/zCdP56+GjdEVJUbFbldtY9YFgLklsfGr5MOWSVi7otpL8VXhhW3DUL?=
 =?us-ascii?Q?2iS8hIIvd0RFx4TM2rT3FcCNHhYCZdMYL2TqbawLfAWGOrBOao++MpN1yJ4s?=
 =?us-ascii?Q?naIoKY/tk2oUnoi59T9fZQmjMkG8YejuUSEkddBlJjE61wlYdtpiBrLLhPm4?=
 =?us-ascii?Q?H/0mKx+yyxyUwtmwBRgDCwR4b/H/RVBPV7eesuBsyTuxclE3G4A4vMlwgWyv?=
 =?us-ascii?Q?PDrZdJxdaUnig+hpE9AlUTyuWbEPiTkjRqOzASNteUCNamCebKyNZioPX3Mz?=
 =?us-ascii?Q?pdaG/TNRK8z2fz4ZvuzZYT5VWz0K+RJsE4CT4/7xgnIOxjgJWrlpwkos5/7V?=
 =?us-ascii?Q?Kmabl1lgNd5B3vHecYzo1KCABwtV7JuD+jvuA4Tj1hIJwojKg7TVrVXCIPu8?=
 =?us-ascii?Q?zwEnZF/Vca6dLlvYyiXzMLxEuFL9eIxlw2PlXaDktauUhP2jKCC7B5Tu8AIf?=
 =?us-ascii?Q?VUhF/GpCl8WemAU5wqtgXMlYeUMg1lXI+e3eGIa6YBdRVO5Dz18YBr7/tCcV?=
 =?us-ascii?Q?m706nkoX/H4XMf7ifPChtcWY8Mvtqjpq51QgDNHsJ6vFztN98rmV5NAhuwY9?=
 =?us-ascii?Q?y61hoy/30QppljWce9F+RSPMGHLaK7SSkuIUiCoYxCYlsufug4WQEzBGnaoP?=
 =?us-ascii?Q?Q1Ypl/wod4yf4j4=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:51.5464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cac493b-cfdf-44a6-8a2e-08dd4784b8af
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1691
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 00/11] Rework and fix STM32MP15x PHYTEC dts
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

This patch series rename and reorganize the STM32MP15x PHYTEC
baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
files.
Indeed, the current device tree naming and organization is not really
consistent as it does not align with others STM32MP boards (use common
dtsi file as much as possible, use one dtsi for SoM and one dtsi for
baseboard).

The series also fixes some important pinctrl issues and minor one (coding
style). Additional pinctrl is also added for the optionnal interfaces
that are not enabled by default (FMC, LTDC, DCMI, PWM).

Changes in v2:
- Rebase on v6.14-rc1
- Fix indent issues in stm32mp15-pinctrl.dtsi and
  stm32mp15xx-phycore-som.dtsi.
- stmpe811 touch: fix dts schema to comply with st,stmpe.yaml.

Christophe Parant (11):
  ARM: dts: stm32mp15: phycore: Rename device tree files
  ARM: dts: stm32mp15: phyboard-sargas: Introduce SoM device tree
  dt-bindings: arm: stm32: Rename STM32MP15x Phytec board and SoM
  ARM: dts: stm32mp15: Add new pinmux groups for phycore and phyboard
  ARM: dts: stm32mp15: phyboard-sargas: Fix uart4 and sai2 pinctrl
  ARM: dts: stm32mp15: phycore: qspi: Fix memory map and pinctrl
  ARM: dts: stm32mp15: phycore: Add dummy memory-node
  ARM: dts: stm32mp15: phyboard-sargas: Move aliases from dts to dtsi
  ARM: dts: stm32mp15: phycore: Disable optional SoM peripherals
  ARM: dts: stm32mp15: phycore and phyboard: Fix coding style issues
  ARM: dts: stm32mp15: phycore and phyboard: Add optional interfaces

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +-
 arch/arm/boot/dts/st/Makefile                 |   2 +-
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
 .../st/stm32mp157c-phyboard-sargas-rdk.dts    |  42 +++
 .../dts/st/stm32mp157c-phycore-stm32mp1-3.dts |  60 ---
 .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 286 +++++++++++++++
 ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
 7 files changed, 564 insertions(+), 341 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32mp157c-phyboard-sargas-rdk.dts
 delete mode 100644 arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dts
 create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
 rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
