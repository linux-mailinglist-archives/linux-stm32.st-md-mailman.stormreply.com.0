Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F560B581D3
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Sep 2025 18:17:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F25C35E00;
	Mon, 15 Sep 2025 16:17:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EDC6C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 16:17:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FE2E9X006400;
 Mon, 15 Sep 2025 18:17:38 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494yy0yy9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 18:17:37 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDBNM91fPm3mecp1qeXs2eSDatBjey1lr+ze0hdZEmSvQPTYjyop0MYdOjhN5EPjrJjZHKcWDJGbrZ6RvgbnBEpFzQ52fiHDKETOic44OxwmrnLNriEH/Of6RoET+CwFU5HKZRLV9nhCEtxMcyt5nVQSJwfRp+zn2CDD6HH8c2GNLvIjJEvXUP1rjDc/0uxsu2hKUx7QdMrXfuovg9sdV7kiQguxRHIqX6t8f7tQce+ogEh37VB+fmsfslT/vPsbSBiyn5pVMzRvFbw8dyMi2MtXWImUwiwlfBf4gfsBrjWN5u0aFoYOQbll4qwGKssyJP9JIM4cvJaeRSIexkhDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+uQo4AnzMwzsROTEoyJDQq3iCR+wMAqkGdepH0MjMc=;
 b=oUrfdzOLEus1OkDTNiq44CUoHX1FH7HTkEomt/HGkXuHcAM0p0tCxJ14eXgEFFN0KfWAZXaGANpJJ0Zyf6lGITW0ButMNZJTCsPvXelsG10w76wbvDK7yqwPujQO7dDt9A5TUdqkgjM4ImIEyYrXYMybWUw1zCjZRG7+2TJ0Hh6m062LGC3WmW62sWpjLNmowdmOUcBcE1zMFqEI9h3xLhgA683GLEuY9m0ssIJaGFdWXEWQIsxb0dOtu49As7f2SDjeibFVhEzu9fOoWamw6OgdyeRzDGtaIt8JUd/DpkWXTwL1bzrnfZAduzTI5oNVX3hBGogl7319GzqW04xF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+uQo4AnzMwzsROTEoyJDQq3iCR+wMAqkGdepH0MjMc=;
 b=lldr0x03jlOL5zLfRpKz2aZvFcjWrZpV3U6mxgKwhELSF5vdbkcFsMTJE3mxAarND6n0dqi237zbuAvFDcvG27DhJlITJ3RQzRYSz4CuPvjaf/KlAtJMOSIryy8KQhAq/mWcrxcQ2EygU1V5FFxVpd3AvMv/2+AXq90dvdms9wfAewDhQlASqyFuE2NiyOmS/VwpdhDQGbBQA1nDcutPdzIFh2V94R0iJAcv6KoL1UpJiPuQZw4Nxhk0dbgc6TL5gOyNrcJVcO3jCKDameQhGHkyVKMFNad503//uzDP3kgNuSro0Jcl/Wo2O4FB8nCnCKOgJkMK8+4dOGplQnYOOg==
Received: from DU2P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::22)
 by VI1PR10MB3262.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 16:17:30 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::48) by DU2P251CA0009.outlook.office365.com
 (2603:10a6:10:230::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Mon,
 15 Sep 2025 16:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 16:17:28 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 18:15:05 +0200
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 18:17:28 +0200
Message-ID: <13153fc2-1abe-4d53-807a-5d289981a63d@foss.st.com>
Date: Mon, 15 Sep 2025 18:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 <arm@kernel.org>, <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|VI1PR10MB3262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3624f3-7941-4a7b-9633-08ddf4735df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9hSFNsUVlCZ0VPWEUraGk4MExBS05rMTgyN2xieEpMTUU2SjFTQTgrbThB?=
 =?utf-8?B?T2ZOQmN6OFVLNFdPTjlPQ3RVeXZzRm1SMHhKcUx1eU1VZ0hhN1FDRm5oeFM4?=
 =?utf-8?B?eHZSMGF4S0dVbTZacjlESWY4ODlrRm9uLzlwSXRwLzJxaDdUMXNrQTFnWExa?=
 =?utf-8?B?U09NT2gwdzNoTnBhMHVDVk5McU80VnRpczBlU2RmT3NpMU4yUTN2bFFzWG1D?=
 =?utf-8?B?QmFPNGdoeUJxY2pNUURjTUtvbXU5VFFzRk5Qa3hBTUlnR1ptVG5qT0pkamVT?=
 =?utf-8?B?ZVloMGo3VWRnV1J6WWc2ZGZDanB4UGdqSE1YTmdiN1ZsK3FuMHJSY1dPYjc1?=
 =?utf-8?B?WEwwZGpGdWpaQ09xa3hxNmcrVnJNZXRGZE5vQXBBYnV0SVR2cE1adWlSM1RO?=
 =?utf-8?B?VE1COXlyRUwwNzh1OWszRmF1ekdxNFg5a0dIYU1kMHVSbitmZ0cxVnlnRzIy?=
 =?utf-8?B?QjU0K0Q5S285NjlLWW9zWHBneURic0duQ2dKOTUwYjBSS0pWVFdPZUNkQVMx?=
 =?utf-8?B?cnovZzFnQmFySXJUOHpWRitlS0NoYWFsQksyaG5OM0NuWHhzeDE1QUozeXpJ?=
 =?utf-8?B?UWlZUTRUd08xb0JLRW13NXE2UU1KelQ2N253U2d5UHovZW9xRkxSeWhEYnpq?=
 =?utf-8?B?aEhQNm9DeFgrd0xFNE5YUkRad0hmNnUrWUpBV3J2SE0yNTllRkpkRVhDUTN0?=
 =?utf-8?B?YTJYYWswSGdocWprV3o5MjA5NnI5akhmL2lKMmVHN1JPRXF0Q21JbXA1VzRC?=
 =?utf-8?B?VzhaZEEzd3dRK3I0SVFOc1NxT3FHR21TdCtQcW8vTUpsbXpTMFE4eUtqbUZo?=
 =?utf-8?B?UUptNlJORktHdE9NNmF1L2wwRklGeEh0QUpiNU11S1A2V3F0ZDJ6M0JTTUh1?=
 =?utf-8?B?Y3N4NHFUZ2RNc2pnb3F5UXlpdDVBTHkwMkFoY1FIQ2xvbXo3aUhpVVZtcmE1?=
 =?utf-8?B?OUV0OHdCdmhNREhmZHp3OXlmK1k4Sno4aFYyV3VDSlNoUm9YVGdSNXRRbno0?=
 =?utf-8?B?UTA2VkE2QWhPaFBpUkwyNVoxb2hiNEQ0L3hEN1ZHZEVINXFWdUt1Y2VmNUNL?=
 =?utf-8?B?cHk0TEVnZElzTnhoNFBMNTlKQ2lGZFdzYXpHSnFKZmJCa0VRRGVLZTI3aGRH?=
 =?utf-8?B?Mm9Fd09oQTNvakd4czJLM2dtOFUyTG5yRmNpMzg5QVJiZHdNRWc3V3NKZ1dT?=
 =?utf-8?B?ekRjUHNaU1VKRmpyWFZuYzZqbDFyTjM0UEdEcytUWTlubzRUU1lXYkl3OUFu?=
 =?utf-8?B?NmFNcnpYOStwUHVXQVJublZ2RzdLV1VpT29yMHhucUFlbDdjNURlOGFSKzky?=
 =?utf-8?B?K1ZhUktXWnpGRFcrTGc4d0RuaXhNekticnBkMUR3a2QvRVZycnMvVnk1a3Ft?=
 =?utf-8?B?bG9yUlkwRTAvc0xDV2ZhbUladVJZOXRlTnJXeUMrY3VzYmFPWkdtbGhDODdD?=
 =?utf-8?B?MXJReElDa2JVNEJ4dTBJUUF2eUZ4SlBxcG9xTE1WOTBBY2V5cWwyT0xiM2JT?=
 =?utf-8?B?RXQ4R1BBcXNvNDhTSG5TSDg5bVlxSTcvVjJ6V0JqVDFEU1RIQjA0ZmRRZVlS?=
 =?utf-8?B?bjBZY3FTb1ltdnpwUGxoaVJ5Nm5CbjRJTzJwbm9ucWkxVHRlYkg0TFEyMC9Q?=
 =?utf-8?B?NDFPVkJFTzVLWWpKSTQ5VEhoMjBsM3lNSHlQWGYzVWNPY2hLTUkvczcyY2tB?=
 =?utf-8?B?TGJqdldUSzF5Tlcwakc3VTR3NXRNaURJc3o3aWxjVmdpaFk5QldCRDNkTTBh?=
 =?utf-8?B?b0tKSmZzTTNLb2VDRXFQRnFKMXdMYnhMd0pTeXVJamJQbkVjMXVETWxjS0Rl?=
 =?utf-8?B?dDY0MThGVldUamtiUFRDc3Eybzl6eFQ5L1dJcWtSdkt0NlBZUUFNTUJiRUZB?=
 =?utf-8?B?Q2FVaWRHem4xR1NZdCtWQzIyQnV4UlNtampqTGpGT3pPVjJjeGhRRUt4VGdJ?=
 =?utf-8?B?dm1acmh6USt0NDRKSWFaSnpEMDUwUVIxZUczS0RIZjRSdGt6emZzMWtCVmM2?=
 =?utf-8?B?N29YZllsTk1EREFTUDcrSG5sdHZTVDgwZWxQRXd6MVNlQlU3Y0pkZ09HWDJj?=
 =?utf-8?Q?ggytG9?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 16:17:28.9859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3624f3-7941-4a7b-9633-08ddf4735df3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3262
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMyBTYWx0ZWRfX/r2B//GXnvbl
 bShiCKpf/LrcoCqgYsgpmv1NMDIaeslr8gbrwy4jYkkNiSauiE+FFjTjy6+0IMX4MSloB8R2tVe
 w8oegh/QU+LQcDSa03IDtrDv58Fmky021NbZcB1hP7csYj0Ztl29jqu3c3wojum/13S2xEPpQwP
 5SyU9fxT/hPh/i9HeKsM6VuOP1o+pEEbnKpYoLwHg3vurNStwyjbj7dAQbEuv1USyM86x75IWFS
 wVtQWqlMpymDJPSV0p04BlU5FkCNhuDDgvrmecla3ouPl9pEOVSaLj55PiH2atVTZZbGeBDPLGY
 1SV7kxFnUvnJqjlKvw89edtSg+pVfhssIAH/NUOKH+pudI7ik7fKacGQVKUSsdiQBEtqM92tGNF
 0rQS4qCD
X-Proofpoint-ORIG-GUID: _ugINwPTdXrZFaQ6hsrqtYq3_tBAqTGv
X-Proofpoint-GUID: _ugINwPTdXrZFaQ6hsrqtYq3_tBAqTGv
X-Authority-Analysis: v=2.4 cv=X+9SKHTe c=1 sm=1 tr=0 ts=68c83c21 cx=c_pps
 a=QfNz7WxyfdFdmo+E+Fz36w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8
 a=_aLy0x8VAUbdkObL9E4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130023
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.18#1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQVJNIFNvQyBtYWludGFpbmVycywKClBsZWFzZSBjb25zaWRlciB0aGlzIGZpcnN0IHJvdW5k
IG9mIFNUTTMyIERUIGNoYW5nZXMgZm9yIHY2LjE4IGN5Y2xlLiAKVGhpcyBQUiBjb250YWlucyBt
YWlubHkgdGhlIGFkZCBvZiBTVE0zMk1QMjUgZmVhdHVyZSBsaWtlIEV0aGVybmV0LCAKUENJZSwg
RGlzcGxheS4KCkkgYWRkZWQgYSBjb25maWcgcGF0Y2ggaW5zaWRlLgoKVGhhbmtzCkFsZXgKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOGY1YWUzMGQ2OWQ3NTQzZWVlMGQ3MDA4
M2RhZjRkZThmZTE1ZDU4NToKCiAgIExpbnV4IDYuMTctcmMxICgyMDI1LTA4LTEwIDE5OjQxOjE2
ICswMzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogICBnaXQ6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXRvcmd1ZS9zdG0zMi5n
aXQgCnRhZ3Mvc3RtMzItZHQtZm9yLXY2LjE4LTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA1M2MxOGRjMDc4YmI2ZDllOWRmZTJjYzA2NzFhYjc4NTg4YzQ0NzIzOgoKICAgYXJtNjQ6
IGR0czogc3Q6IGZpeCBtZW1vcnkgcmVnaW9uIHNpemUgb24gc3RtMzJtcDIzNWYtZGsgKDIwMjUt
MDktMTUgCjE3OjUxOjMyICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTVE0zMiBEVCBmb3IgdjYuMTgsIHJvdW5k
IDEKCkhpZ2hsaWdodHM6Ci0tLS0tLS0tLS0KCi0gTVBVOgogICAtIFNUTTMyTVAxMzoKICAgICAt
IEFkZCBtaXNzaW5nIEV0aGVybmV0MS8yIFBUUCByZWZlcmVuY2UgY2xvY2tzLgogICAgIC0gQWRk
IEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkuCgogICAtIFNUTVAzMk1QMTU6CiAgICAgLSBBZGQg
cmVzZXRzIHByb3BlcnR5IHRvIG1fY2FuIG5vZGVzLgogICAgIC0gQWRkIEhhcmR3YXJlIGRlYnVn
IHBvcnQgKEhEUCkgYW5kIGVuYWJsZSBpdCBvbiBzdG0zMm1wMTU3Yy1kazIKICAgICAgIGJvYXJk
LgogICAgIC0gUmVzZXJ2ZSBsZWRzIGZvciBDTTQgb24gc3RtMzJtcDE1eHgtZWQxIGFuZCBzdG0z
Mm1wMTV4eC1ka3guCiAgICAgLSBzdG0zMm1wMTUxYy1wbHlhcW06CiAgICAgICAgIFVzZSBjb3Jy
ZWN0IGRhaS1mb3JtYXQgcHJvcGVydHkuCgogICAtIFNUTTMyTVAyMzoKICAgICAtIEFkZCBFdGhl
cm5ldDEgTUFDIGNvbnRyb2xsZXIgb24gc3RtMzJtcDIzNWYtZGsgYm9hcmQ6CiAgICAgICBJdCBp
cyBjb25uZWN0ZWQgdG8gYSBSVEw4MjExRi1DRyBwaHkgdGhyb3VnaCBSR01JSS4KICAgICAtIEZp
eCBHUElPIGJhbmsgZGVmaW5pdGlvbiAmIG1lbW9yeSBzaXplIChERFIpLgoKICAgLSBTVE0zMk1Q
MjU6CiAgICAgLSBBZGQgRXRoZXJuZXQxIE1BQyBjb250cm9sbGVyIG9uIHN0bTMybXAyNTdmLWRr
IGJvYXJkLgogICAgICAgSXQgaXMgY29ubmVjdGVkIHRvIGEgUlRMODIxMUYtQ0cgcGh5IHRocm91
Z2ggUkdNSUkuCiAgICAgLSBBZGQgRXRoZXJuZXQxIE1BQyBjb250cm9sbGVyIG9uIHN0bTMybXAy
NTdmLWV2MSBib2FyZC4KICAgICAgIEl0IGlzIGNvbm5lY3RlZCB0byBhIFJUTDgyMTFGLUNHIHBo
eSB0aHJvdWdoIFJHTUlJLgogICAgIC0gQWRkIGRpc3BsYXkgc3VwcG9ydCBieSBlbmFibGluZyB0
aGUgZm9sbG93aW5nIElQcyBvbgogICAgICAgc3RtMzJtcDI1N2YtZXYxOgogICAgICAgKiBMVERD
CiAgICAgICAqIExWRFMKICAgICAgICogV1NWR0EgTFZEUyBwYW5lbCAoMTAyNHg2MDApCiAgICAg
ICAqIFBhbmVsIExWRFMgYmFja2xpZ2h0IGFzIEdQSU8gYmFja2xpZ2h0CiAgICAgICAqIElMSTI1
MTEgaTJjIHRvdWNoc2NyZWVuCiAgICAgLSBBZGQgUENJZSBSb290IGNvbXBsZXggYW5kIEVuZHBv
aW50IHN1cHBvcnQgb24gc3RtMzJtcDI1N2YtZXYxLgogICAgICAgUm9vdCBjb21wbGV4IG1vZGUg
aXMgdXNlZCBieSBkZWZhdWx0LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWVsaWUgRGVsYXVuYXkgKDIpOgogICAgICAg
YXJtNjQ6IGR0czogc3Q6IHJlbW92ZSBncGlvaiBhbmQgZ3Bpb2sgYmFua3MgZnJvbSBzdG0zMm1w
MjMxCiAgICAgICBhcm02NDogZHRzOiBzdDogZml4IG1lbW9yeSByZWdpb24gc2l6ZSBvbiBzdG0z
Mm1wMjM1Zi1kawoKQW50b25pbyBCb3JuZW8gKDIpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBB
ZGQgcGlubXV4IGZvciBDTTQgbGVkcyBwaW5zCiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCBs
ZWRzIGZvciBDTTQgb24gc3RtMzJtcDE1eHgtZWQxIGFuZCAKc3RtMzJtcDE1eHgtZGt4CgpDaHJp
c3RpYW4gQnJ1ZWwgKDQpOgogICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBQQ0llIHBpbmN0cmwg
ZW50cmllcyBpbiBzdG0zMm1wMjUtcGluY3RybC5kdHNpCiAgICAgICBhcm02NDogZHRzOiBzdDog
QWRkIFBDSWUgUm9vdCBDb21wbGV4IG1vZGUgb24gc3RtMzJtcDI1MQogICAgICAgYXJtNjQ6IGR0
czogc3Q6IEFkZCBQQ0llIEVuZHBvaW50IG1vZGUgb24gc3RtMzJtcDI1MQogICAgICAgYXJtNjQ6
IGR0czogc3Q6IEVuYWJsZSBQQ0llIG9uIHRoZSBzdG0zMm1wMjU3Zi1ldjEgYm9hcmQKCkNsw6lt
ZW50IExlIEdvZmZpYyAoNSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBk
ZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAxMwogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQg
SGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUKICAgICAgIGFybTY0OiBkdHM6
IHN0OiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMjUKICAgICAgIEFS
TTogZHRzOiBzdG0zMjogYWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIEhEUCBwaW4gYW5kIGFkZCBI
RFAgCnBpbmN0cmwgbm9kZQogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVi
dWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgCmJvYXJkCgpHYXRpZW4gQ2hldmFsbGll
ciAoNSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBtaXNzaW5nIFBUUCByZWZlcmVuY2Ug
Y2xvY2tzIG9uIHN0bTMybXAxM3ggU29DcwogICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBldGgx
IHBpbnMgZm9yIHN0bTMybXAyeCBwbGF0Zm9ybXMKICAgICAgIGFybTY0OiBkdHM6IHN0OiBlbmFi
bGUgZXRoZXJuZXQxIGNvbnRyb2xsZXIgb24gc3RtMzJtcDI1N2YtZGsKICAgICAgIGFybTY0OiBk
dHM6IHN0OiBlbmFibGUgZXRoZXJuZXQxIGNvbnRyb2xsZXIgb24gc3RtMzJtcDI1N2YtZXYxCiAg
ICAgICBhcm02NDogZHRzOiBzdDogZW5hYmxlIGV0aGVybmV0MSBjb250cm9sbGVyIG9uIHN0bTMy
bXAyMzVmLWRrCgpKaWhlZCBDaGFpYmkgKDEpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBzdG0z
Mm1wMTUxYy1wbHlhcW06IFVzZSBjb3JyZWN0IGRhaS1mb3JtYXQgcHJvcGVydHkKCktyenlzenRv
ZiBLb3psb3dza2kgKDMpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBNaW5vciB3aGl0ZXNwYWNl
IGNsZWFudXAKICAgICAgIGFybTY0OiBkdHM6IHN0bTMyOiBNaW5vciB3aGl0ZXNwYWNlIGNsZWFu
dXAKICAgICAgIEFSTTogZHRzOiBzdG0zMjogRHJvcCByZWR1bmRhbnQgc3RhdHVzPW9rYXkKCk1h
cmMgS2xlaW5lLUJ1ZGRlICgyKToKICAgICAgIGR0LWJpbmRpbmc6IGNhbjogbV9jYW46IGFkZCBv
cHRpb25hbCByZXNldHMgcHJvcGVydHkKICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIHJlc2V0
cyBwcm9wZXJ0eSB0byBtX2NhbiBub2RlcyBpbiB0aGUgc3RtMzJtcDE1MwoKUGF0cmljZSBDaG90
YXJkICgxKToKICAgICAgIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBTVE1pY3JvZWxlY3Ryb25p
Y3MgU1RNMzIgRE1BMyBzdXBwb3J0CgpSYXBoYWVsIEdhbGxhaXMtUG91ICg1KToKICAgICAgIGFy
bTY0OiBkdHM6IHN0OiBhZGQgbHRkYyBzdXBwb3J0IG9uIHN0bTMybXAyNTEKICAgICAgIGFybTY0
OiBkdHM6IHN0OiBhZGQgbHRkYyBzdXBwb3J0IG9uIHN0bTMybXAyNTUKICAgICAgIGFybTY0OiBk
dHM6IHN0OiBhZGQgbHZkcyBzdXBwb3J0IG9uIHN0bTMybXAyNTUKICAgICAgIGFybTY0OiBkdHM6
IHN0OiBhZGQgY2xvY2stY2VsbHMgdG8gc3lzY2ZnIG5vZGUgb24gc3RtMzJtcDI1MQogICAgICAg
YXJtNjQ6IGR0czogc3Q6IGVuYWJsZSBkaXNwbGF5IHN1cHBvcnQgb24gc3RtMzJtcDI1N2YtZXYx
IGJvYXJkCgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2FuL2Jvc2No
LG1fY2FuLnlhbWwgfCAgIDMgKysrCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5k
dHNpICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArKysrKysrKysKICBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTMzLmR0c2kgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsrCiAg
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSAgICAgICAgICAgICAg
ICB8ICAzOSAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgYXJjaC9h
cm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgICAgICAgICAgICB8ICAg
NyArKysrKysrCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MWMtcGx5YXFtLmR0cyAg
ICAgICAgICAgICAgICB8ICAgNCArKy0tCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1
My5kdHNpICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArKwogIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTdjLWRrMi5kdHMgICAgICAgICAgICAgICAgICAgfCAgIDggKysrKysrLS0K
ICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1lZDEuZHRzICAgICAgICAgICAgICAg
ICAgIHwgICAyICsrCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtdWx0cmEtZmx5
LXNiYy5kdHMgICAgICAgICB8ICAgMiArLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTdmLWRrMi5kdHMgICAgICAgICAgICAgICAgICAgfCAgIDIgLS0KICBhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kgICAgICAgICAgICAgIHwgICAyICstCiAgYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhjb20tZHJjMDIuZHRzaSAgICAgICAgICB8
ICAgMSAtCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNp
ICAgICAgICAgICB8ICAgMyAtLS0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1k
aGNvbS1zb20uZHRzaSAgICAgICAgICAgIHwgICAyIC0tCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1eHgtZGt4LmR0c2kgICAgICAgICAgICAgICAgICB8ICAgMiArKwogIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAgMjIg
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
MzVmLWRrLmR0cyAgICAgICAgICAgICAgICAgIHwgIDI1IAorKysrKysrKysrKysrKysrKysrKysr
KystCiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUtcGluY3RybC5kdHNpICAgICAg
ICAgICAgICB8IDE0NiAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kgICAgICAgICAgICAgICAgICAgICB8ICA4NSAK
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0z
Mm1wMjU1LmR0c2kgICAgICAgICAgICAgICAgICAgICB8ICAxOCAKKysrKysrKysrKysrKysrKysr
CiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMgICAgICAgICAgICAg
ICAgICB8ICAyMyAKKysrKysrKysrKysrKysrKysrKysrKysKICBhcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyNTdmLWV2MS5kdHMgICAgICAgICAgICAgICAgIHwgMTI1IAorKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0K
ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKICAyNCBmaWxlcyBjaGFuZ2VkLCA0OTYgaW5zZXJ0aW9ucygrKSwgMzkgZGVs
ZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
