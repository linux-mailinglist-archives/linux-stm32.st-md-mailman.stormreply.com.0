Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A3C5328A
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:48:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C35C628DB;
	Wed, 12 Nov 2025 15:48:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3EDAC628AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:48:45 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACFmW4N1104775; Wed, 12 Nov 2025 16:48:34 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013068.outbound.protection.outlook.com
 [40.107.162.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4acreu18x3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 12 Nov 2025 16:48:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6ZM9PAMVscEqHlmN4teTh8eFR1lsEiy3kq9NI08JZH4xpwB+LjIwwhsNfyL7AuKQoOLSz4L1bf+5NNkGRMZBGC8ll5cTyZDsyCPIfQUd3H6YDTG6ihQyvGPGDeptCIUBXO1kygpQmEAzSl6JXk1PQwGeC5FKRiDHGsivuEUp5BzDWtPV5F0bCuBC7HuM5mwC/AEfoOOJZG9iKrb7bQwuJ19KtS/mHYMs9kBgvA/8OF1wIAhOmFS461bCIxy94jqdZ1jR+FjjYouCuB21+v2k0D9SiOeyozgfGe2Uj5Fr/1IvQNBkkf+VX5W3yWv6IKGA7KApfCZ8T6eJDEk42grzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeXMMloIdIH9ltcLglHP5HxzZSQIW0U/OjVSNSq0JCw=;
 b=EmAcwDZSUOUK0AOypbHYef987PcaX5wnTJ+VF5GxcVfPm7PJO0EGEGaBGsNclOv0sfB1BVSiDzkwUvGFLN2Uee8s+TXMJnr5Kw7S8Wv2g4lYjMS0DRT2kEfuK0izW6xDuRlx2KBeF3fvSJyEJptFP+GlYadyQa07Uu27u5jbBVAjaiaHOzgkRBlVbMDld+YEgYINk/NJBVOomQpIp8h+jIYhZR4qDQIBksgA/vYYyHojMJa7UVHNvGS4t9GREmvBd1o4mxJ5+rerPHdw2+YJYEpXvhFehAIZd4QIbQ634RaC/wGXFT4s/NvEiH+JgJgLI0ixHz8qMKtdu9P7i60j0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeXMMloIdIH9ltcLglHP5HxzZSQIW0U/OjVSNSq0JCw=;
 b=T8berNIvCvA9jmu/980QQeiLatT/TryWbAXKxrwn1bDhQU5yXSToHUGC+Mq3n3PnqH6XamuZdV4iVdZKWQYqQcodzoYf9N9BSZPvm0c7apdafTSV9hX56/YBRBQ6A9MDRAmQqthtrHAqDLF9ePeZ97N9lMTfQ25Q+2YuYnuk9mUjAZ9dS9dyOb2dpwpE6q0QGG27WidS8dKrTreGZTZpN/+sElH6qhQnRPr3G/akMbJ+s6veBMP4VgRgKT4zl3Qmdgtn7+uBPb6Ncx5Ry/yAkbpjqo1YwYvN4CdhI98DBBtZQVD/E+PFxY/voH/K9FanDm2RygK50hA2t3NIRKe3Ag==
Received: from AM0PR02CA0141.eurprd02.prod.outlook.com (2603:10a6:20b:28d::8)
 by AMDPR10MB9503.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:73b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:48:32 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::6f) by AM0PR02CA0141.outlook.office365.com
 (2603:10a6:20b:28d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:48:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:39 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 16:48:14 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 12 Nov 2025 16:48:06 +0100
MIME-Version: 1.0
Message-ID: <20251112-upstream_add_boot-led_for_stm32_boards-v1-3-50a3a9b339a8@foss.st.com>
References: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
In-Reply-To: <20251112-upstream_add_boot-led_for_stm32_boards-v1-0-50a3a9b339a8@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AMDPR10MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: 370765eb-1485-4760-a8b6-08de2202ee91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVNqVGFtU2JXNWJUdllzVHIwbDdkdHZ6bVppQ1kxR3pOT0I3dXQwU3k1R0th?=
 =?utf-8?B?Q0xqb3JiUlA0QlVaQVI3M1p4L01WUGQ2TFNVbnBCYWFrRTE1MWF3aXFnNk4x?=
 =?utf-8?B?cnVJNGlIdkkxUWkwSi8rUXpoYWs2K0pMU3dTY2ZjSzh1UlJwZGV0QmY0ZSs3?=
 =?utf-8?B?ZGJKaVVwUTl3azRDS21QdmNtRVFIaCtwSUJjdCtKK2NCUHlRemVpT3hreTJl?=
 =?utf-8?B?eVpCb0hTa09RbWI0UmtjelZpelpBaUd0ZVpWNUtadzhkSThzWlFMMUdoMlhY?=
 =?utf-8?B?dmgwYXZRTWlCVDhQa0hKdjdCMGRXeHVDWGVsNTFuUWd6MnJoK2IrNit4dVNQ?=
 =?utf-8?B?K3RiM1FRTC9qbW5JeE1DY05aSTI4QXd6MUlCTWU5b2FhTUIzdVpwU29EaFJv?=
 =?utf-8?B?NlZRZGxlenM1dmtSU0JGNkpxTVdLUzF0THBKRzBlYVJNNzFSSk5MUW5NS3B4?=
 =?utf-8?B?ZFdWOTdWc1cxcmhTRXVRWEgyeFZ6aTU0ZXgxMTBLZjE1VHdzQXpCL3JXVjB3?=
 =?utf-8?B?VzA2S21JTTJwRHB6cmI3UDVKWGZNTVNsMGNXTXJBUENmUmk0UDNvcS9hQ0h5?=
 =?utf-8?B?UEpRakd6ZXIvZlZOVlUwZmNqTkR1TUFSRUNJZnVIak5idGQwcUN1d1gyb1py?=
 =?utf-8?B?SWhPK1FoL2VUTnBYaVlrL1c0SzI5eWtYVFllVUQxQmwwTFh2Q1FKcmp5elFx?=
 =?utf-8?B?clpKL3JSL28zZms4Z3NTb3hJekVpdnYya0d0b0JiQzJQVm1LR2NRZW1oVk4x?=
 =?utf-8?B?T1hvRlMwSEhuUmdqVk5RbGZaYnAreTdJbmRkUE81dWs0TnQ2ejNhNDJEMHpX?=
 =?utf-8?B?WHRnVndLVlAwQVFkanN2SjVtb0JucUVpMUZUT0FIZ0lCQnFyem5FWm1HTlJi?=
 =?utf-8?B?OGFpS2xuWGpEUUliVHpySUN5SmZkWWFBbktXUnd3WXZwUEtPK1hONE1mWDFY?=
 =?utf-8?B?djZGditySGVJTE1HSjlHWGU3RGtMR3lJOXVLZnUyQ3FOWGZaUmM2MzFDajl3?=
 =?utf-8?B?cktreEI5azhWSzh5VHlTZzVMbWltSWZzN3lOMjE1VjR5Mm51QUttUW1tb0Nx?=
 =?utf-8?B?VVBGVGE2WmkxZFBTNmhaWm45MHF1YUF5ZTVGWlROeHNhQzIyNzRjTCtMZzF4?=
 =?utf-8?B?VTlZRGUvVVR5R2NUcDBVejhtUnN2M25UQ0RaVnB2K081UmYwZk8zeWJMOUlR?=
 =?utf-8?B?K2JWMVdndFNRZzZnMi9JTGxEbStOUmZTWjE2VVZnMEtFY0tGci9IL0VqRkts?=
 =?utf-8?B?aHkvSWV1MWJoS0JrejVwZGhsZ0x1d2lHdmovRnR2SHlGeFJkV1JITkRaQVJm?=
 =?utf-8?B?RnFjUTRQNTdINUVnQUlFQU5uOGVqUkh4cC9xVTViSVRlUlRyTCtCYjdSUldL?=
 =?utf-8?B?REg2Mkw5bExkdkZaVWwrQzNLSWkxK3FWMmRUdXBjcjRkSjExZzhvNTU1OG9n?=
 =?utf-8?B?c25YMmJIeUtPdXc5cFNidk9jalBmdVpleXNWWnE4UGtmdGVoM05pOUE1RjFC?=
 =?utf-8?B?ZlF1V3UxWUJVTHg3R3I0bXVXWUdxVmFsTGlFcGRTOGViOFdHU0o2TXk5SVEx?=
 =?utf-8?B?NVZWVXFFcU02bHR1bHl2T1JEeHg5RXJBeHgwRUJzWlZKa3RIdmI5eDVZUjNs?=
 =?utf-8?B?eElZc0xmTXJ0ck5iZlBnVTFIYWk3Q3NWdjlyVHA4NWljbFFoQnZ3ZkgydmdK?=
 =?utf-8?B?UTN6VFJFRURZdmJpWFJ5THBRMjFLR2VwNnU3WDdMWi9VRUs1WVV6cDRJakVr?=
 =?utf-8?B?WmhwY1pHVXRpcmkyWjM1ejlZejAwM0VlVTVFODFaSGs5QlJQMFpNSWRrQnU3?=
 =?utf-8?B?ZzlaMHEyQWxWZ0VzajgwN25qZEtQZUdiZTgyZCtqLy9KNVZqSXhaakFEWVlp?=
 =?utf-8?B?ejVrZWxjdnV0SHdHMTd6NURGTUtlY0s2MENJY3N1Nk5nalljczRyZVhLejdT?=
 =?utf-8?B?UVVISlFKVDJJc2IzSVBpTVJTTjEzeWVveFJJdVlJWUtrNzB6NU5DUXZoRjlQ?=
 =?utf-8?B?V2ErUXNkM1Badnl2S1ZHVEpLbnBtUWlseStPV1NoWnJVTTNueCtTSk9GZVVi?=
 =?utf-8?B?V2tWa1NoeXZmZEZ5emFwTGZvdXdaaTlScG5OaU40cVBCU3JvUE5PcTAyVVF3?=
 =?utf-8?Q?u4N0=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:48:32.0210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370765eb-1485-4760-a8b6-08de2202ee91
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR10MB9503
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyOCBTYWx0ZWRfX2U91uJS0eUY5
 6FZ3jjtslzYvfb15YmkzM5aLhMq1n3t71XlU2oEhtm0LA5DDk/cRww8jgR1D/p+kWL7kkqJhoaK
 gOVSp7/MAeFhVdC+EvqOhGFRimBPgwiT0Npp80LGfyw7IEHzsjFL12lvDhNc5qRK01SBreDcq+b
 45luLmkFBKT/eT6tFpUVdbdJqDY1hcAOWjpsSp9/AT8CbFxvpkQQX53zPEVWxG7PiMQUlQ3hBhL
 EPzREwDhdgLq4dHUBR7dpe3i1h4WiHZtMW8WzoF/iXUKCCI5p5S8anJHa0MdyFTo/zzngPLk2Kb
 5/V2LMcTZkzo2AENA2nSv8t7Pr5rNldhnJEHcVfjdlhv8U3znU2ws4e3lEM/GwpdJHfPVgYWBOw
 0cjOg9JcyyiLR4PlM2z9AHSrEK2ZVQ==
X-Authority-Analysis: v=2.4 cv=D+hK6/Rj c=1 sm=1 tr=0 ts=6914ac52 cx=c_pps
 a=cyhFtQRhg4USMAHCudA+lA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=lZqO93Kov72a3CVOwBMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: VpsW3Id-XEVrkxVUBdm5lIqaHDhzUAXs
X-Proofpoint-GUID: VpsW3Id-XEVrkxVUBdm5lIqaHDhzUAXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120128
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 03/15] ARM: dts: stm32: Add boot-led for
	stm32469-disco
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

Add options/u-boot/boot-led property to specify to U-Boot
the LED which indicates a successful boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32f469-disco.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index f43547ec436d..943afba06b5f 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -83,7 +83,7 @@ soc {
 
 	leds {
 		compatible = "gpio-leds";
-		led-green {
+		led_green: led-green {
 			function = LED_FUNCTION_HEARTBEAT;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
@@ -113,6 +113,13 @@ button-0 {
 		};
 	};
 
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_green>;
+		};
+	};
+
 	/* This turns on vbus for otg for host mode (dwc2) */
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
