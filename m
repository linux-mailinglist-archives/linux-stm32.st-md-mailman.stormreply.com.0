Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4BD04BE0
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 18:10:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B09B5C8F284;
	Thu,  8 Jan 2026 17:10:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A01FC8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 17:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDAOrSmrYNDhHTtM1baRR/6C9gvrGIwoGg33W1/aZ0D6FfKnyo55oXBQJT3XY5AFhqh76TkAtxolpfmMbutJZgGu2OYUnYsy0EiVFCu8tca+NQ3N+IKtN8pkkaMkQ3HdAJwOh2frNlUC1q7ohVezMq10adSqFdNYy9CP6s5kxGKsOPOlRopblMrUjLKlkWPfIBWr7hlCLfxmxZJ77DsWQyAg/OuqeTxtXyJNto5cyPu7AJwF3RTHD/mYhUbydJtMiSsqzQoyGD9wTocT0g7P9QYjmgK5/WLtTqRFSzaqOlUSTY0UIutMbvMalEyGmtsPL2MT0aeyRsMMav7FEkeY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRV1ScRZYO3jm/q0+SSLXnbn8Hen+0WiOoF3kU0y+gI=;
 b=gljxROvK0gXjN8iC1bBBYYINCXxXXqcLQXEIy+nW+NtO9PThVrdN8AMvBlXOmrrockrApB1Op7vAXrYyu3bkKxWOYmze7UZNgChfTH6Ap/7HUe24rJm0q4+WSRnxFt5MR3cCdPJN/O0L+thu5OWOOZt8Qa4JyiaVEkTxf6HcAYM93jRlzoY0seglWk85FfpbkRkvqTe98KBONJ12A+cpqALG31ImgUos0P6FLTkVca54owIUm5WMofCsCRnGyhszR03qE26E/CPlofTGS5I2PWE8O21kgimIDXulwLfGgfEbsqTmiQQpXBKzYgE1kK0mD2EnlstViQVutNfVPZ769A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRV1ScRZYO3jm/q0+SSLXnbn8Hen+0WiOoF3kU0y+gI=;
 b=PxVqFN/TVUTfCyN9doo0Pg/D2yxxuIY2zzxoll2TyAiULHl1XncdDklIt/qlIWNTdMVP8o6K2DayHltpuA9qagC9ykeuew8tah0Y4hsoK4blm/tYscluUXYRZQdV3jiNB9iKukCjgzxjtF/ERcEOmtiQjT3m5skpk3vDM2jf2aHyiqPmfvmDKErw5veQ9QAdoryW0hIGBmkaqj6pafJMinHQWOZnl92PIOLtGVtdDQIjmy6NyknUZxMhqElvlJAdqHQlNBOULS05lHArB+Pu6MTgZyrMTfX6Px5vHBKcr5HFFSVUUdIwZURB05ZNeVtYTh2v+5iFc6Kd61kt0H4nbQ==
Received: from CWLP123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::35)
 by AS1PR10MB5440.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:10:50 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:401:59:cafe::76) by CWLP123CA0071.outlook.office365.com
 (2603:10a6:401:59::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:10:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:12:05 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:10:48 +0100
Message-ID: <87e037a6-3f5f-411c-b029-83f26f5d5bc8@foss.st.com>
Date: Thu, 8 Jan 2026 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
 <20251114-upstream_uboot_properties-v2-6-3784ff668ae0@foss.st.com>
 <6f9041d1-fd3c-4fba-ade8-f91f0d760921@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6f9041d1-fd3c-4fba-ade8-f91f0d760921@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AS1PR10MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 039590ad-8612-44c0-69d6-08de4ed8df36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1g0OUFVZ01mdVk5ek5EdmZYTWl0a3kwdEp5SkgvUC9FYS9FY2U0bHRuSm9K?=
 =?utf-8?B?c0p0UDQrQU5HZ0dYN3d2QUxra0tUY1hJZnpaakZ1SXpKR252Q2tSdzhjOHlj?=
 =?utf-8?B?aDBvUTI4QmJlQnFDenRoVFByd2wzaXJock11eW9OKzFiQmF1akpoN1hIMkVF?=
 =?utf-8?B?VkhKVlNpSXRCOVIvd2tiV3lsSU1EcHo5MG1tQVdrU2k5dHdNM2grYkFobGh1?=
 =?utf-8?B?ZXBYTHR6UW1MelFpZmF0dXFCTVBnYVZ0UEdNZUNrMTdWTy94K0dzVnd5djFp?=
 =?utf-8?B?empwcVFKYXBMbE9nWExQM2ZBODRFdDdLeWYveDBVeEZZc1JhSSthd2dKRjNi?=
 =?utf-8?B?cGFDZmhnUytnZGp1N1JWWWt1VytNWnVOUEZIM2tZc01kK2htY3RhRnMwZDYy?=
 =?utf-8?B?N3FocXFYdDduL1FqbnhnL2xhSXhvbncvc05TS3ZXUWNOeDZpUUJWU2ZSSXlS?=
 =?utf-8?B?VGJGOTladHdDcXdpdFRBekF6NU0wOHBZQlJqVDZ1TjVZOE8zSjJ2NmVveFBn?=
 =?utf-8?B?amZWZnJhblhtejZYSUNDVGo1VmJPMkZ3cEVMdnlZUUdMVnhqdWN6bEk5Ynln?=
 =?utf-8?B?bFlFOTFWckhzS1h0N2Fib0s5NXY2Vm1XT20xWGJaOGVlb2JNRFIrMlU3bFhr?=
 =?utf-8?B?TFhPQTRVNEd4Nnp3YVhBcjVxTVY3RE1ldzJkQVNqYndzMU9GMEIxU0lRTi96?=
 =?utf-8?B?TVdJSE9CdHFnMGtzTVhGekFUV1pFZ09QOWwyY3VJM0FlY2J2WG5GeTFrUXhw?=
 =?utf-8?B?Yk5WU1FSYzdGZ012UFY1YS9GNXYzRDBTSlBDNldQWUY1TWFQTHBWaFE2cDBG?=
 =?utf-8?B?UU1POW5SMEh3VDVGRmVQRGs5NDBnc3NXQzNJQ2pyTnQ1V0YrUWY1cXBNc3Ns?=
 =?utf-8?B?T3poeCtVUXA4cWJKZkdkQ3lVa0NVUTBTMUFKdnJHMjl5eWh1WlNvMVJENysx?=
 =?utf-8?B?N2ppUkR6bkRRUTRQcWtNWHdjVG9EejVUUURSS2dxZ1NXYTFPRklhMXZjNHQ5?=
 =?utf-8?B?NXZ3R0k3NnZCRFJGNzZubmJxTk1SbmtXWTB6NXBBeWdrTFB6SHgxSDV2d0hv?=
 =?utf-8?B?NEc5ek1wZit0Vk9BbUdhd2x5N0djTkFpa2Z2aDBkM21lZ0dDU3lZU2FGSzJt?=
 =?utf-8?B?VlpyTkdFcVlnTEUvc2tJcVZ4cGJLbjBxWkFBMi9GeEhpWDAxZnZTeEpWR0xv?=
 =?utf-8?B?UGc3OVNpazNTWGV2ZTdVTDk3aTRncnphWkN4VFRvcFlLTGtXZXJoTnJxc3lW?=
 =?utf-8?B?K1RXQVZVY1FYT0xaSEtjeTR3Q2RCTjBOWWo4dUtJRGNNRGNweGQrRVp2ajhP?=
 =?utf-8?B?MHc1STlyMU1Nb0RWZ3VWSDZPUERjWDdNSk1SSE5hc0ZJb3dxb1Naa2I4YXE5?=
 =?utf-8?B?WGVQS3JCUjhrOTNRNDBMUnQwL0xFeWtNek0reUVMZGJOWksyV2l6MTViRVRQ?=
 =?utf-8?B?ZXE1ajY0WkVEVFlFTjZhUFVpVEMwZ1JaWWZDaFRmM1N2cWM0VDdZNU9MSHVk?=
 =?utf-8?B?dG5CekdBaldBNUsrK1JzMU9WZzViNlJ3VkVoc0g3UlJuY3VpVGlRMFhRT09S?=
 =?utf-8?B?ckJwN3JWZFRNVjFUd09TcURLQTJiaXp3eUdoTzVxaHBBOTFaODZaWnhFZ2t0?=
 =?utf-8?B?UFg5dXRKMzQyQ25vQm9tL09nSXhHbXpYSWhYM2lCYmJYVWZrWm4vdUljaTU3?=
 =?utf-8?B?d0FvamRZMEZPZ0p1dkpHNUxRVzJXVXI1cTRNU3NNcnBTSFoxN0wzWGdCemdh?=
 =?utf-8?B?TEwzbzQwQ2NTelR1eWROWUZlYkIxRGovK3BjaVord2M5a0g5d29BaW5mUnBa?=
 =?utf-8?B?Yi9kZXA0cWJyZjNHU3BycGNJVmh1dzY3a2hKOTU0WXZGb1F2VHVXQUZuZlJB?=
 =?utf-8?B?VEhlbTNHbUwzd3N5QlVxZXpnT1dwckdvc1dCTVl4V3FaTytNZFppYng1U2FU?=
 =?utf-8?B?UDhiUXl4R2g2R2xNOWRORTVTWDRhVzNjUDlpVlgzVGNmcUNRTDcra2lhSkd6?=
 =?utf-8?B?UEVRM29QNDBxRytteTR0R2xIa3A2cmp6bjdmaVlKbmlQTmQ2bWJSbFo5WHda?=
 =?utf-8?B?UjIzR1Qvak1WZmc3ZExZWTBPNXY3ZmlnbnVxWGNSRzFidHJuUUpvOStSRnQx?=
 =?utf-8?Q?Znog=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: //fjLWbDFZmQ/wr75G1U8ASSvfxaQFUqAMV6eBy0Y6kspT0Sn1sd3ek3eji2ow3tsXifoO7YiV1K3E2pNrZcULzNCdbf7nGK26AJqJ2sYZ561mzbjFocj+Q3i21hqEeZvHCRHzoxJVFigXFPwINSDn2QZNHhNSpwnvgx2GqGNP2OFvg/+JexBbCS+Zns3XSXm+TkA2p0wlU7NMUNbsSOU7lEGIq4COLWXemwfvY0R2s8jErgKqqeB0/ANyrXrOJbNvzoytCpsvCvciuqWN2ZJ+2bd8ETtEYOxA7YLUBXmuaqHDZxalVOl6xaemrHOAkCdFF0Si1lfylWrQsmm5O6RnDIeKbCB60cStTh2KuRGrmdV4MJpRtwE/+kzW970XcLZ36SB2NZdZx2z9RsDB9999gjfU5RMkhdoGCEtLtttUsBOxA+14sJkPtPQ8eYnBVvzpj9HIRxdYfNUeZLhf80XAQbe0nJifIhiBfIrhJvJ9ZGunECoRIU+mY6czjJ8mSDurpI7Nh6VxgW6aon/0PTmvrHATwGKWDgqLQWoaREiGcbKEBMLXvlDfQDHyKSh4MHbf4TWXYKW/2Ixwkck7YaoS/BK0WNUcgvbPj23E+CMZYFB8Ox8bhfWJWl2Eu5HMwi+UT43G1U88UI7Bj66C2cALfpLdq9+xvr6JJ/O7S+Yp/6/APHbarW0ApDFwnLVcUk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:10:49.7096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 039590ad-8612-44c0-69d6-08de4ed8df36
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5440
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 6/6] arm64: dts: st: Add boot phase
 tags for STMicroelectronics mp2 boards
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxLzgvMjYgMTc6MTYsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkgUGF0cmljZQo+
IAo+IE9uIDExLzE0LzI1IDE4OjI2LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IFRoZSBib290
cGgtYWxsIGZsYWcgd2FzIGludHJvZHVjZWQgaW4gZHQtc2NoZW1hCj4+IChkdHNjaGVtYS9zY2hl
bWFzL2Jvb3RwaC55YW1sKSB0byBkZWZpbmUgbm9kZSB1c2FnZSBhY3Jvc3MKPj4gZGlmZmVyZW50
IGJvb3QgcGhhc2VzLgo+Pgo+PiBUbyBlbnN1cmUgU0QgYm9vdCwgdGltZXIsIGdwaW8sIHN5c2Nm
ZywgY2xvY2sgYW5kIHVhcnQgbm9kZXMgbmVlZCB0byBiZQo+PiBwcmVzZW50IGluIGFsbCBib290
IHN0YWdlcywgc28gYWRkIG1pc3NpbmcgYm9vdHBoLWFsbCBwaGFzZSBmbGFnCj4+IHRvIHRoZXNl
IG5vZGVzIHRvIHN1cHBvcnQgU0QgYm9vdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBD
aG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMTEuZHRzacKgwqDCoMKgIHzCoCA3ICsrKysrKysKPj4g
wqAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjE1Zi1kay5kdHPCoCB8wqAgMSArCj4+
IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5kdHNpwqDCoMKgwqAgfCAyMiAr
KysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJt
cDIzNWYtZGsuZHRzwqAgfCAxMSArKysrKysrKysrKwo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyNTEuZHRzacKgwqDCoMKgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2nCoMKgwqDCoCB8
wqAgMyArKy0KPj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHPC
oCB8IDExICsrKysrKysrKysrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1
N2YtZXYxLmR0cyB8IDExICsrKysrKysrKysrCj4+IMKgIDggZmlsZXMgY2hhbmdlZCwgOTEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+IAo+IC4uLi4KPiAKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gaW5kZXggYThlNmUwZjc3YjgzLi5mNjU3NjMwNGY0
MmYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNp
Cj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4+IEBAIC02
Niw2ICs2Niw3IEBAIG9wdGVlOiBvcHRlZSB7Cj4gCj4gLi4uCj4gCj4gCj4+IMKgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGx0ZGM6IGRpc3BsYXktY29udHJvbGxlckA0ODAxMDAwMCB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdHBoLWFsbDsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNTEtbHRk
YyI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NDgwMTAw
MDAgMHg0MDA+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAxNTggSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4+IEBAIC0xNTc3LDYgKzE1
ODUsNyBAQCBsdGRjOiBkaXNwbGF5LWNvbnRyb2xsZXJANDgwMTAwMDAgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImxjZCIsICJidXMiOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIExURENfUj47
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzLWNvbnRyb2xsZXJz
ID0gPCZyaWZzYyA4MD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vdHBo
LWFsbDsKPiAKPiBkdXBsaWNhdGUgcHJvcGVydHkgPSBidWlsZCBpc3N1ZS4KCkFyZ2gsIHNvcnJ5
LCBpIGRpZG4ndCBzZWUgdGhpcyBpc3N1ZSBhcyBpIG9ubHkgYnVpbGQgZm9yIDMyIGJpdHMgcGxh
dGZvcm1zIC4uLi4KCkkgcmVzZW50IGEgdjMgQVNBUC4KClRoYW5rcwpQYXRyaWNlCgoKPiAKPiAK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQi
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoCAKPiAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
