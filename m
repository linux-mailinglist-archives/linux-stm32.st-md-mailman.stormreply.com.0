Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5FC244FA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 11:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7099C57169;
	Fri, 31 Oct 2025 10:01:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4923C1A981
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 10:01:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9sOiN019489; Fri, 31 Oct 2025 11:00:56 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a4mt59ktt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 11:00:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ievb+SHvehnN06GEduVvpLkZ7/yMk5BJpKTL+GYhqX02jAG7FK97ZfUM3JG0jfdNCT+rND06d45rn31McPE8bkAvDLTmpXa1QnKF/J6ai4LkRcJYt8QZdDwZyon1gjz6mexpz49DBXvtMbkzpFeikLHC50XQ5KmLW7ptRq+5vCuXflui2+hmJZzYpe2xXQ2YnUTtgaqTvRahlfuuX+IqBjt/fx36WBraCj1OZMeAeNLYUL/V0LCgPLPmKz2TDzAS2AEcfsw92zijrIKBsBE+xsW8ig2Vvom6Ij48vkaK83v5MGShHrGy1PZAvHGh58AamqCyaQ4JhlY8i45qhPDO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RjkCmC+MclefTX3lvxE6P5d9kc+7RyDO28AAFMRfCg=;
 b=qqFiljUWgP4IiT15wWi220qSCLr/8JdA0o1AGme0NedXDw6hQhIymYsXjZWJUZGyHL0EeX6mGGYxwyn1pL2KVffTfy0uTPyvP1yUazSdIyQlTMbVEZQ4RPLrrR0Rgu9czk1aeAKwSMciYSG23KNF5NlvZ6GfhmGDZ3bovy0AFQhqeOiYL3AqXhEf6u5ZzrvsQscJHhMFGSya6PgchnnrCF3BtmaJbGYeEhhpTm6v0JBsWh26KUqZhpeK+QwuckUnf+5tgylqivNojG5EIGVSPEu9o6vXk+Aa5/YHtI6eGkimVD1fZsLkEg9jSzwCLHluqmjBeoWqA6ER6p669/XYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RjkCmC+MclefTX3lvxE6P5d9kc+7RyDO28AAFMRfCg=;
 b=FyyqBVyFYKwWEJRePXWVW0Rpn5GxYzO0tZnjtNjD4ktl607OZo55qpzc/QwJn1YIqRCN0u5iohKHFo4NYPQ4ov0DfX5O+deXOKHfnG5oiALtj3NIyF1smhsB1hBmKHr1VMKp1Z9J+dF15Reyo7eJ1J6MYtOVLMtV9mMvgRQzN/6ZVhCLe9i6DocMZEByHIfTmyxVKuFnIsbb16gtutRadQP0El34RqwGdPJyLoGLaHK4dRsrTCpHR0e1gfFP/APu6kdcex7NsmWKbWBSE3QygYBuQ50uuHSdMS4W7AWbEz32m1nd5XuweIF4HoUee3IlPySuChMyQ21l330RpSfBBw==
Received: from DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) by DB9PR10MB7411.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:460::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 10:00:52 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::37) by DUZPR01CA0045.outlook.office365.com
 (2603:10a6:10:468::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 10:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 10:00:51 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:53:27 +0100
Received: from localhost (10.48.87.185) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 11:00:51 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 31 Oct 2025 11:00:40 +0100
MIME-Version: 1.0
Message-ID: <20251031-iwdg1-v2-1-2dc6e0116725@foss.st.com>
References: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
In-Reply-To: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|DB9PR10MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cbfb0f-557e-4b71-2507-08de18646007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGJ2aklodDRtUzJrSllvejRyNXE1TU9tOERXcGFiUjhDYk8yRkRyRW9relJx?=
 =?utf-8?B?dmJwaGoxMjNFMkpDQTRpdlNZZVliSmJveFpOY0ZRMGxJakt0dkJLajVXUWJ6?=
 =?utf-8?B?Z1duc2Z1M0NXYloyc0hxK3BxQWwvSFdYUDZIQmJoNCtQVGhqTUpaZzNsbkxp?=
 =?utf-8?B?WXZEOVdyVVBKUUdkYjFrTUhHWWxGNHZlMUJwMTUxMG83QWdvRjZSZGlscmh3?=
 =?utf-8?B?cUgyZWJURk5tdjJuZUFoQk4wZFFwRTVSQ28ycXNOb2hDMzliNVhlNmpaYkpY?=
 =?utf-8?B?QldyQlJkUVR6RE5HL25UOEJiQWhZWUZtemR1azdrb3dmV1J0blhIV1RkYjBY?=
 =?utf-8?B?cSswUStiUS95cjd4VXROWTRhcjdnZHZ6MmF3dmRrOE5zWklnclhTcktuUG1I?=
 =?utf-8?B?TVJJY2xzOVc2cURqc2hsUlBSWWd0Ylg0dVVqUm43cnpBejljbURiUWFUdmNJ?=
 =?utf-8?B?cWFmUjN1MCtpTVNxaWd1UkFvbDZsZkhmcEQ2ZjVDT2d0UE5zY3hkek9lellN?=
 =?utf-8?B?YndtUmZrTHp6dSt4TEh3VmhueTZaejFIRjV3MUR0K3pDWlBReis2eVlWQTcv?=
 =?utf-8?B?dXRodkxzSk5OakFTR01uR1RTa1dDSEhweXVvelRlQU9pSjBCakZPQWRueHQ3?=
 =?utf-8?B?VmFRNnNQdEZYeTNCcUNYOXN0UFpjckY5ZTVTaVFHdFUwdUg5ak55QkI3akxQ?=
 =?utf-8?B?SER4TUVrbWZaU1pkb2pLZERaQ1RiR1RENGkwOU9hRmRLLzNCZE5GcEpDRHZT?=
 =?utf-8?B?WWFQWFVVMmpSclVQcDR2YS85Y1hHaGQ5aStDS2VqU3h4UFJUV2o0VVoyYjBL?=
 =?utf-8?B?eW42NU1KVUtqeThYZTAvTFdUQUE0SS94dkMzeGUxcWtnSFU5Wld0TzN0ZFlH?=
 =?utf-8?B?UlZjTGg2YW15eTljK1prOUd6aDF5Nm5MeDVsaE9jQ2EvKzJPVlllZmhpdHlt?=
 =?utf-8?B?UmwwclVJN3dXanNTeHJXQ0lKd1RQWFZ1WUxTaStORzVTeFI3Qm9JOG9MVCs5?=
 =?utf-8?B?U0JmT0o2a0x4eXZlRTNYOWxuL0FLdFcrZzRMWDNKMzBmYjV5bG81dVQrTHhI?=
 =?utf-8?B?WTZpV0hDaG1wbnp4WlpoRUFwNFM3bnR6SmwzOUZGLzBRbUhpOGRWRys4bnNP?=
 =?utf-8?B?WFpLUnFVRUZJQ1EzREV6RW82TExGRXpLb2RLN2dRMU5YOEZWcW5ScGRCNG1H?=
 =?utf-8?B?eDduYjZIenNLTks4NjZQanNaMlAwL2FMeU1sakJwMUNreHhCalRFTXRBSGVD?=
 =?utf-8?B?OUxEU2tRVkpnWHA0ZjZGaDFWb0ZDWVZOUWxLRi9PZWxoV2gvK0cwbkJXRWRT?=
 =?utf-8?B?UGs1RlY0WWlmRGRsYjV1UzJFSWpaOTVsQ1FmYzIrRXM5Wi9vUkZFQUtkTnNq?=
 =?utf-8?B?SEcybkJZTU9pOFU4T1pnSlFRc0U5RnhLY2J3aERVQmNTOUQxaFNtc2hLa0lm?=
 =?utf-8?B?TUVWckViY0dsTlVyMkg1MVBoa2xQM2RnN2xjSE1EclpwSGR1TG5ERFd1eTkw?=
 =?utf-8?B?Um13ZjNQYzVaMnduMXhab0oyNmViNUJzSk9YajRrWElIVTgzSnRGUkVuTlZS?=
 =?utf-8?B?eElUcDZETlJkN3RVZTg3NVRHUnllNnJFQkNwdndVZlMwV2tON2JhSW1KYjZp?=
 =?utf-8?B?dy9GekZMdTFObXJLUVMwemdCNjBvQ2doZEhKWW5kYkdQNk1PM29OK2k4V0di?=
 =?utf-8?B?eWxQNnlkQUtTS0tiRkJ0UmJpamNqWW9VeFROenFpRGV6UDZsT3RFNlZwYnQ2?=
 =?utf-8?B?RWhLM1lFSDBYV20vUmxLWWE4ZGt6aEY5V3NoZUxTL1Zsby9JZnJGNUJEbUg4?=
 =?utf-8?B?Y28xTUZjNFF0cm5FbnN6enpMc1RyL2JVSUhGRkNMUEtyUEFSZWdDMGZyNWtR?=
 =?utf-8?B?YWJJaDZiTnNicnVwMElFZTlYZW4rdGt3NW83YW5scWdLaTU2N2FRSUI4VW0y?=
 =?utf-8?B?WVl3RDlzT0Mzd2VSQTJ5RGRiNXh4eGRRbTdZM3BKS0x3dE9seHpIZnVTZVVq?=
 =?utf-8?B?YVdNTUljWDY5bFBhMHh1emNGbCtabXIzOXZQUzU3R2xCT1JzdGp6b3lRbGVH?=
 =?utf-8?B?dnNjQ3dqYTlMWVhiT0N2QVN5akJnTG56SFZvSnBSZDNDbXQ0OGh0bmNiV2ZJ?=
 =?utf-8?Q?3Zw8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:00:51.8763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cbfb0f-557e-4b71-2507-08de18646007
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7411
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA5MCBTYWx0ZWRfXyOcZe3gCInUJ
 S4I3h1DXEhzKYBblGw+8lw+mZkko5/vUpzJyfOcuyLTy49K4ixeOtAr7hv5eQ3K/GQzLfFBZAsZ
 NPDdVApEZ3759IgthJlSJS8gCFxNeYCJcYbcu+g6DNJ7UIrxtSUzAr+og5HgAHNOzJ+ixgoxI6C
 rCx62kOR/O6/uqJdlJm7D/Re6MyqB0CZLJmIi75CoRGPa2FrBDYkD/ty1MFmRM5A1zXC5ktzg0R
 w3s0S5W2VsDt0p+vxfohP13cd4jeT+X4pwK5blh3snHs8dx4Rps9QRhnewe8ZvmjJv6FGNrxztU
 d7cLhUVYevPl/EsutbP5Ne9xaqNxIRprUhgZZjeWQUhiHgZ2XNy9M23PPP+QEZ5eHZWdnznQ3KT
 JBwuYrtJCbYRR8FbmqW6tnPZyuunOA==
X-Authority-Analysis: v=2.4 cv=Ot9CCi/t c=1 sm=1 tr=0 ts=690488d8 cx=c_pps
 a=v9EP5GKU77DCKZ2Fk5HK/A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Wpbxt3t0qq0A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=wqjeHN6rOxvaTua_6sYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: ANddJ_apeVDJZ8Eh3BBPFkPGIlJ2Yx00
X-Proofpoint-ORIG-GUID: ANddJ_apeVDJZ8Eh3BBPFkPGIlJ2Yx00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310090
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/4] ARM: dts: stm32: add iwdg1 node in
	stm32mp131.dtsi
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

Add the IWDG1 node in the stm32mp131.dtsi SoC device tree file. It can
be used by Linux as the Cortex-A7 watchdog when it's configured as
non-secure.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..a18da1a04fe3 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1657,6 +1657,16 @@ usbphyc_port1: usb-phy@1 {
 					reg = <1>;
 				};
 			};
+
+			iwdg1: watchdog@5c003000 {
+				compatible = "st,stm32mp1-iwdg";
+				reg = <0x5c003000 0x400>;
+				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc IWDG1>, <&scmi_clk CK_SCMI_LSI>;
+				clock-names = "pclk", "lsi";
+				access-controllers = <&etzpc 12>;
+				status = "disabled";
+			};
 		};
 
 		/*

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
