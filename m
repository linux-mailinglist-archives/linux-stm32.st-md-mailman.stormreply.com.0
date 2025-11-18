Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0282C6A91A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 17:20:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 827C8C62D20;
	Tue, 18 Nov 2025 16:20:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65F93C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 16:20:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIGHrLN414293; Tue, 18 Nov 2025 17:19:49 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agndtj26q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 18 Nov 2025 17:19:48 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdEGjd6IK/XbLv6gfWCbVICCDqfZJ79lCsGz/G8v8SKyzpyqxr8pt6uqFtZF/wuZgKL2GgsooFCvKRlZC1zONWYVswK4W0ySlqqAQu8Q4SPVFuCyP0+hpsUxDKVqyep2PW8xdDWWXIMsOJ/w4kTAYtv3vVKaUkiUv0rADQL5ZMLZI88wK6QNdL1pyAL7iVf8qK3Aig+d/gbo4JVWxjyXQ6g3/VT6wMPjyOxNyAZFX6diZ3wurAy2rqhTaB3WHqFVxVaFbK1hL3ltAMffGb+qx9VgWZXYL1cmLztDG6c+w4GThbVwrFqVQo3NdYzOibTXY629ze4uGkVOODVgjO8+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbtycFlbNUPUuIqzvpz735DM2l8j5LKUR75TnWyK1r0=;
 b=sMG4rd2Nd2NB4VAv1+hgidD8s0VlIUzNWVVNuTIFkX0GuLctsve5MHaTkziXl6BmO1QxzwdiBBCUVvyic5Nl3sIMgpxUswoTLlnltRRGd9yydXW2UN0SllwqFwlejMIZXzMpltWNixQjBJo5rc7Xk7gnEFB69672wCI8kGux8og5uNYAgO8OQQu23CrfCmAETGiMDj7h7Hda/IdN2K4os5GWu2Ec01PW+YPJk8cjBA4mMacrA38RnjZiFiM4CI9mXcMKPlwnMY33wJHVpVGUVmtyoA8WimBDHES3PjspGvzwRkpW9SPDatxSWPWiPQ4j1C1Jn84QR7l2tb2sHZziUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbtycFlbNUPUuIqzvpz735DM2l8j5LKUR75TnWyK1r0=;
 b=LmK0NR7SJ/7BeIlBIMzCE/qHms+xmvByIqPSuZJumWjnzzzclntHVUEKkEyAkfZdKoLRdwfdMWQwg/xx6qXYG2qzmwmFkPlQOO3AxE2Ctgy/90KB/NJtzihr7+qOBuIYgidxY+iqW92QbbF4wDKDFPlmmoSVKrMnrHmPyhtaqHoSSxaXbc5F9NyQvGEfu8cwORHfdRmh/5sDma3JJDJgB8BFnIKxk6ArWZVDipZbQf3Sz1BzBLJAyFkkaQ6fDK5xD6gz1+RpzbVMMEyr3fzoddVp20+Mxqo8ek0+iM/3Zza9uI9wSXl3asQ1n2cb/4k+/zAyV8/jusLZS6/5x2YQ8g==
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by GV2PR10MB7605.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:19:43 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::86) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 16:19:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:56 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:42 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 18 Nov 2025 17:19:21 +0100
Message-ID: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039233:EE_|GV2PR10MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de02919-5330-4c99-dfe7-08de26be4844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTllcXRla1pPREI4TjhRa1Qvc0EybWZGemxmTEIreStVczB5SGdRRVBxRTZa?=
 =?utf-8?B?NXIyaGJUemVGOHBUdktyZTNOYUk2bW5SZnp5OFU4NjdHdUtIQ29ObDcvOGtl?=
 =?utf-8?B?SlJncUI1UmJLbU9EekhuTFRIUDgrdEQxMjI1eDUwZGtPeEsrNDlRMHFlTFBE?=
 =?utf-8?B?NFNVczlnQ1A1L3ZrSUlHbmFQSVRsYlZneDdKZlNjYm9td3pHTjBTUlZGeGx0?=
 =?utf-8?B?ZFZwcEg1WDJhY3ptYVByZFd4Mm5sNHdyMlNTN3N4VDZuSzRVVENCTk00NldL?=
 =?utf-8?B?WG5aU25jZmlMUVc3Z3ZtZkF1b3hMb1UwSnVPSkhxRll2WE80SWsrOUNlSGpE?=
 =?utf-8?B?SnlCeDdJMi9uMktoRHRtUW5rektLWnViRGpyWnpXL0daVlN4UldmWUc4cG9m?=
 =?utf-8?B?QWNkVlZ2TndadW9zMmFuelFTWHZnbXJhNUs3OS9nZzNNaTloSEpNa2thaCt0?=
 =?utf-8?B?QW4waVhVRlZlOXlBS3lPanJvSS9HUDVmRnZXcHVhQUJ6dlMwclo3eGk1NS9M?=
 =?utf-8?B?ZmdPclpJR1lzMElFODcxc3lVNSswaW41c2R1cEUyMVpqVlRjMXVoUTgzbElM?=
 =?utf-8?B?MHRDdUFkS0Q0VFV4SEVmM054RHhTVy9sdHd4L2lWN20vRml4NVRGQk5VWGxl?=
 =?utf-8?B?SVFDYVljdWJNL1dCbVlENHV0WUorenR4VnN2TVZ5UmhvK1RJM3BZQ2Npd1pZ?=
 =?utf-8?B?U2VtY1Rhc0F2dlFLbXRRTHhCa3l2Ri9QUHZuTEVXZFFuWFpuQytpVlJsR0VJ?=
 =?utf-8?B?THcxU1BiR05lclp6N1lKUTAxUUJ4Z2JodEtIR1lnNWJObTNOWStBMHM4R3Jr?=
 =?utf-8?B?dUlyaXY1ZkZlQWR6NFJOc01jR1lMT2FmV1oyVzJHMm9jTk4wU1dKOWtGV3Ra?=
 =?utf-8?B?dXg2RWRud3MyeVlsU0R6U1VGcStVNVgyS2lNUWp4WjBQOTFwV054T1kyYjVK?=
 =?utf-8?B?ZE9oRnBjd3VMak1YenE2Z0lPcWpHZTFxVkYrM200TmI4UzUxR05lUXpiUWZJ?=
 =?utf-8?B?Vm5iVy8rcWZSUHBKdnhVVVV5ZERTVURRbVlGcEFaK0Q4TW56dWRLSkE2NzVS?=
 =?utf-8?B?RjNQTStGMVVoaGRydDl2ZytkdU9GRk9hbG5iK3FUTWZBaU1US3FCRXhSS3lG?=
 =?utf-8?B?ckt5M3pqSTQ1MS9vNmV5RmliVFA0ckcyQTczaHprTEJxVUxVaWl3QlpiQ3Mv?=
 =?utf-8?B?N3UvdE42N3V2Ym16aHJreGVQUDZURWJQOW5KbmdOUncxT0V1aUNETWxTSnVD?=
 =?utf-8?B?b0ZWV3doTlpJNEtOZXYrc0JqbnpnMnNUUEtPL3o5Myt3d2JFT3NSYjc3RTZt?=
 =?utf-8?B?SE8vVXV2NGMwRk9XNWRxS05YODEwbUV2a3QxUHYrSmZoZ2RwYUNuQnVRdmJE?=
 =?utf-8?B?akMydzFkNFFZQnZuUzl0UkZRVWlZcEp6Wk9YTDJsRlNGYmdxdWY5NmdUNWxu?=
 =?utf-8?B?amdCN0QvSXM0Yit2Z1FMUkludzVBczRteEViTSsvWTc0ek5Va3FjVnhUVGxS?=
 =?utf-8?B?b0NpQXNJVnhydDZKcHFkQkN1eVhQdDhwRC9zcDZmZzdodnp4L0RKLzYzZUV4?=
 =?utf-8?B?NGpKRzl4aW13aUZwa1JrU0hxaDB5VEJheEdGa2FNMkNiMjdpM2Via3lUbkxR?=
 =?utf-8?B?TUczUzhOT0VKeTF0ZUsrbzRobWN1MGVEV3NjUG95WXNKMUV1c01FUll4TVhI?=
 =?utf-8?B?UzlQWk1DaHdGOUxzc1g4b1p3Ynp0a1ZRVGlYYzdIT3FmQlFpMVN6MEtnWktp?=
 =?utf-8?B?V2M5VmRqZTFHSmxXbEdrcCttNlFJSGRMalpRUjRnWUR1ancrdHdUQUJ1b1FQ?=
 =?utf-8?B?WnpFM2kxK09USUVoQmVPTXZNSFlOQ0YvNG9yZ0Voem5EYUcrZi9qM1JwWXZl?=
 =?utf-8?B?dkQwdU5DTm51MEJPclJEZkJjakZnQlQ4WmxaWVl6bWk3N1FJd2JMU0puc0oy?=
 =?utf-8?B?NFJKMGFZeEQ1WjB0aTQrZFR0dHlqU2FKN0ZyNHp3bGUxQ1FVd3VYeGdKaXJw?=
 =?utf-8?B?SHA3YTJvVkt5bnVGTmxNVEYxRTRCTHFsZTZDUWwzbEJPZEc5bXpRU3daZmhn?=
 =?utf-8?B?bWJUcW9hcVQ0VytaQkY2ZENqVklqdjAvVHdnaERaSGFIOVpWRWloUEVyVHdx?=
 =?utf-8?Q?y2MfbJvC9QxrH0qN1iCj1HJIU?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:43.0221 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de02919-5330-4c99-dfe7-08de26be4844
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7605
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfX9ogwA9BFtOJP
 JronamUQFHyVTt8HCWlTGmgjA6fwXM2cnSd+7Goet3aPkTB7bA101RMtKxL7x38cpY5h731v6Vm
 GfFHrrUtoMDIypcNNPT2s6pj8CUVQaX8E9lzz6/KlhNvchTFnpnel246fPeNSIR4ykmseTAGbuH
 jRXgvmRNa2HTu4KymT4HKboyGAXY81B1CcwfJu3fDankbcH/+9FRMuMh7AL48nNhhqEsfforadu
 SlEjqRBFOyU7YZ9y0vXulP1OT0LcSNM9+xa2sNfCsWQzHWiZFFrxYAokiphGIEI/CPH1Eqzh3+X
 eDzGxElSLNmiHDpn5ogkHQDb0O3Hq984WyxSsVrnUOvmA0cfaOL/YhwY7z8c5Jj258ggl6Ru+/y
 j7E94U0zYPzBiYMkjr+wlxTu4VJMlA==
X-Proofpoint-GUID: LmUsbQSHjwJNVmqbpSi17NvqmOKxM6yK
X-Authority-Analysis: v=2.4 cv=Uqhu9uwB c=1 sm=1 tr=0 ts=691c9ca4 cx=c_pps
 a=AOycmoUevleOEOAMEpukkw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=3TsN7hw2_K0hBqRFV8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: LmUsbQSHjwJNVmqbpSi17NvqmOKxM6yK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131
Cc: Pascal Paillet <p.paillet@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>
Subject: [Linux-stm32] [PATCH v2 00/15] pinctrl: stm32: rework SoC package
	and add STM32MP21
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

VGhpcyB2MiBpcyBhIHN1YnNldCBvZiB0aGUgdjEsIHNwbGl0LW91dCB0byBzaW1wbGlmeSB0aGUg
cmV2aWV3LgpUaGUgb2xkIHBhdGNoZXMgY29uY2VybmVkIGluIHYxIHdoZXJlIDEwLzE0LCAxMS8x
NCBhbmQgMTQvMTQuCgpUaGlzIHN1YnNldDoKLSBvYnNvbGV0ZXMgdGhlIG51bWVyaWMgdmFsdWVz
IG9mIHRoZSBwcm9wZXJ0eSAnc3QscGFja2FnZScgaW4gU1RNMzIKICBwaW5jdHJsIGFuZCByZXBs
YWNlcyBpdCB3aXRoIGEgc3RyaW5nIHZhbHVlLiBLZWVwcyBiYWNrd2FyZAogIGNvbXBhdGliaWxp
dHkgZm9yIG9sZCBEVHM7Ci0gdXBkYXRlcyB0aGUgRFQgdG8gdXNlIHRoZSBuZXcgdmFsdWVzIGZv
ciAnc3QscGFja2FnZSc7Ci0gYWRkIG5ldyBwYWNrYWdlcyB0byBTVE0zMk1QMjU7Ci0gYWRkIHBp
bmN0cmwgZHJpdmVyIGFuZCBiaW5kaW5ncyBmb3IgU1RNMzJNUDIxLCBpbmNsdWRpbmcgdGhlIGV4
dHJhCiAgZGVwZW5kZW5jaWVzIG9mIG9wdGVlIGFuZCBleHRpIG5vZGVzOwotIG9uIGJvYXJkIFNU
TTMyTVAyMTVmLURLLCB1c2UgdGhlIHBpbmN0cmwgZHJpdmVyIHRvIHByb3Blcmx5IHNldHVwCiAg
dGhlIFVBUlQgYW5kIGFkZCB0aGUgaGVhcnRiZWF0IExFRC4KCgpDaGFuZ2VzIHYxIC0+IHYyIHN1
YnNldDoKLSByZWJhc2VkIG9uIGxpbnV4LXBpbmN0cmwgYnJhbmNoIGZvci1uZXh0OwotIHJlcGxh
Y2UgbnVtZXJpYyB2YWx1ZXMgb2YgcHJvcGVydHkgJ3N0LHBhY2thZ2UnIHdpdGggc3RyaW5nczsK
LSBhZGQgdXNlcnMgb2YgcGluY3RybCBkcml2ZXIgb24gYm9hcmQgU1RNMzJNUDIxNWYtREs7Ci0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MTAyMjE1NTY1OC4x
NjQ3MzUwLTEtYW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20vCgoKQW1lbGllIERlbGF1bmF5ICg0
KToKICBwaW5jdHJsOiBzdG0zMjogYWRkIHN0bTMybXAyMTUgcGluY3RybCBzdXBwb3J0CiAgZHQt
YmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBzdXBwb3J0IGZvciBzdG0zMm1wMjE1IGFuZCBhZGRp
dGlvbmFsCiAgICBwYWNrYWdlcwogIGFybTY0OiBkdHM6IHN0OiBpbnRyb2R1Y2Ugc3RtMzJtcDIx
IHBpbmN0cmwgZmlsZXMKICBhcm02NDogZHRzOiBzdDogYWRkIHBpbmN0cmwgdG8gdXNhcnQyIG9u
IHN0bTMybXAyMTVmLWRrIGJvYXJkCgpBbnRvbmlvIEJvcm5lbyAoNyk6CiAgcGluY3RybDogc3Rt
MzI6IGFjY2VwdCBzdHJpbmcgdmFsdWUgZm9yIHByb3BlcnR5ICdzdCxwYWNrYWdlJwogIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogdXNlIHN0cmluZ3MgZm9yIGVudW0gcHJvcGVydHkKICAg
ICdzdCxwYWNrYWdlJwogIGFybTogZHRzOiBzdG0zMjogdXBkYXRlIHByb3BlcnR5ICdzdCxwYWNr
YWdlJyB0byBuZXcgYmluZGluZ3MKICBhcm02NDogZHRzOiBzdDogdXBkYXRlIHByb3BlcnR5ICdz
dCxwYWNrYWdlJyB0byBuZXcgYmluZGluZ3MKICBkdC1iaW5kaW5nczogcGluY3RybDogc3RtMzI6
IGFkZCBuZXcgcGFja2FnZSB0byBzdG0zMm1wMjU3IHBpbmN0cmwKICAgIHN1cHBvcnQKICBhcm02
NDogZHRzOiBzdDogYWRkIGludGVycnVwdCB0byBvcHRlZSBub2RlIG9uIHN0bTMybXAyMQogIGFy
bTY0OiBkdHM6IHN0OiBhZGQgcGluY3RybCBub2RlcyBvbiBzdG0zMm1wMjEKCkNsw6ltZW50IExl
IEdvZmZpYyAoMyk6CiAgcGluY3RybDogc3RtMzI6IGFkZCBuZXcgcGFja2FnZSB0byBzdG0zMm1w
MjU3IHBpbmN0cmwgc3VwcG9ydAogIGFybTY0OiBkdHM6IHN0OiBhZGQgbmV3IHBhY2thZ2UgZmls
ZSBmb3Igc3RtMzJtcDI1IHBpbmN0cmwKICBhcm02NDogZHRzOiBzdDogYWRkIGV4dGkxIGFuZCBl
eHRpMiBub2RlcyBvbiBzdG0zMm1wMjEKClBhc2NhbCBQYWlsbGV0ICgxKToKICBhcm02NDogZHRz
OiBzdDogYWRkIGhlYXJ0YmVhdCBMRUQgb24gc3RtMzJtcDIxNWYtZGsgYm9hcmQKCiAuLi4vYmlu
ZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwgICAgfCAgIDI2ICstCiAuLi4vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eHhhYS1waW5jdHJsLmR0c2kgICAgfCAgICA0ICstCiAuLi4vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eHhhYi1waW5jdHJsLmR0c2kgICAgfCAgICAyICstCiAuLi4vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eHhhYy1waW5jdHJsLmR0c2kgICAgfCAgICA0ICstCiAuLi4vYm9v
dC9kdHMvc3Qvc3RtMzJtcDE1eHhhZC1waW5jdHJsLmR0c2kgICAgfCAgICAyICstCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMS1waW5jdHJsLmR0c2kgfCAgIDM4ICsKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIxMS5kdHNpICAgICAgICB8ICAyOTQgKysrCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMTVmLWRrLmR0cyAgICAgfCAgIDMxICsKIC4uLi9ib290
L2R0cy9zdC9zdG0zMm1wMjF4eGFsLXBpbmN0cmwuZHRzaSAgICB8ICAgNzEgKwogLi4uL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAyMXh4YW0tcGluY3RybC5kdHNpICAgIHwgICA3MSArCiAuLi4vYm9vdC9k
dHMvc3Qvc3RtMzJtcDIxeHhhbi1waW5jdHJsLmR0c2kgICAgfCAgIDcxICsKIC4uLi9ib290L2R0
cy9zdC9zdG0zMm1wMjF4eGFvLXBpbmN0cmwuZHRzaSAgICB8ICAgNjMgKwogLi4uL2Jvb3QvZHRz
L3N0L3N0bTMybXAyNXh4YWktcGluY3RybC5kdHNpICAgIHwgICAgMiArLQogLi4uL2Jvb3QvZHRz
L3N0L3N0bTMybXAyNXh4YWotcGluY3RybC5kdHNpICAgIHwgICA3MSArCiAuLi4vYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1eHhhay1waW5jdHJsLmR0c2kgICAgfCAgICAyICstCiAuLi4vYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1eHhhbC1waW5jdHJsLmR0c2kgICAgfCAgICAyICstCiBkcml2ZXJzL3BpbmN0
cmwvc3RtMzIvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvcGluY3Ry
bC9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgIDEgKwogZHJpdmVycy9waW5jdHJs
L3N0bTMyL3BpbmN0cmwtc3RtMzIuYyAgICAgICAgIHwgICAzNiArLQogZHJpdmVycy9waW5jdHJs
L3N0bTMyL3BpbmN0cmwtc3RtMzIuaCAgICAgICAgIHwgICAyOSArLQogZHJpdmVycy9waW5jdHJs
L3N0bTMyL3BpbmN0cmwtc3RtMzJtcDE1Ny5jICAgIHwgIDM1MiArKy0tCiBkcml2ZXJzL3BpbmN0
cmwvc3RtMzIvcGluY3RybC1zdG0zMm1wMjE1LmMgICAgfCAxODA3ICsrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMm1wMjU3LmMgICAgfCAgMzQ0ICsr
LS0KIDIzIGZpbGVzIGNoYW5nZWQsIDI5NTggaW5zZXJ0aW9ucygrKSwgMzcxIGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIxLXBp
bmN0cmwuZHRzaQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3Rt
MzJtcDIxeHhhbC1waW5jdHJsLmR0c2kKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL3N0L3N0bTMybXAyMXh4YW0tcGluY3RybC5kdHNpCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjF4eGFuLXBpbmN0cmwuZHRzaQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIxeHhhby1waW5jdHJs
LmR0c2kKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NXh4YWotcGluY3RybC5kdHNpCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL3N0
bTMyL3BpbmN0cmwtc3RtMzJtcDIxNS5jCgoKYmFzZS1jb21taXQ6IDYxY2JlNDhkOWQxZmYyNzdi
YzU0MDUxZmJhYjhiNzMzYjJlNjRjY2IKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
