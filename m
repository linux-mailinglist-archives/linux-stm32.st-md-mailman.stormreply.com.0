Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B5D17922
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 10:21:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72242C87ED6;
	Tue, 13 Jan 2026 09:21:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 972FCC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 09:20:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D9BIUx1650996; Tue, 13 Jan 2026 10:20:40 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bkcs89b24-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 10:20:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdEbPwYAmbw5QhyIPKpCzheV1yCQehaSXV3AGvOi509kgR9n6aPjRDDg+tN+SXNjyYNI/ZDPY46jMbEkw13UYidYKNwSUIqDhIBSXHtZIXIDM8pZYL/HvKl4SGE1Ry2zyYhmbILo0g8kZLcMxthpyZuCRZL4swUDIQUZUahBIGPsGVatm4qok5Cst0pwIXVuZWBIQ1BGVXmpMedVIbgRdWjBta0/WqIY/FLH0UqliLdZuLAxJ5knky4M7ICLIwVsdVBuVkuolid3RqlX7mzElTIbhRJs1uAr5HNZOewuzTj/jKXi315t0eTSag+Ws4qIkJl3krGb1r4nMiHvcKbU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86jfJbC1ywkJLlYaHLbSBCBZAT+By/i5iEejptSElVM=;
 b=r5sfN+IrmCCxdV6zc/5W59BQ68UOFdi6A1XO2ErostqchwV3E2/bz+zkQxfgOSmReqLvX/0R+tu4p1S4pY/HM2azcQOds9+knh1XWlefXLE76Kp69oGb6w9dMC1L5KVs/dJRRqlvOA8830IHGo+dCEbVv/YY4C+BHliOIz1+r4X3a02AFCquB9OIiyPgaSNvapSJe/X2BrW7n1lNQCL74gFGqefQy7ndqkgnMYGfDiZ52WZgNVBulTKCk84pV1Jl53fLtha2BoTvAoiwk+SYsDNOh8KDX1pbwZdDLY+gxfksX1fZm1Ml9uEw8ZRoVicsPjwIUxb5st+T1U6WcuZ8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86jfJbC1ywkJLlYaHLbSBCBZAT+By/i5iEejptSElVM=;
 b=kMHLlA99LOkLSPj10FHSkaCBwf+SD91nOo9sR5RJhMwbqE9/ftlykwHiFKbJkWR6+ukqmQssWwo46E83wL4Il5sAo6p2sCCP6M7vCEdQ3NAYLxAKi2XZHroEQ2ZX5avO0wUBRtOsU0Zcyps/+rbP41YAwMQrSWQLAtKe9TNhNLYAKFQnXIVaRqxklSSvJkutFfuHswSVbmWRnbh4QjRTMzWN79W0DZQCjGPFh6ZkZTueM8pscQgaHEfAoWjdHFV8Kp6SJAdVAzX6g13jFZdICf+4+yKEU+dY00diStT3vruEzFyRwYgpbQAM+V0zCEloELaB+Tga5z//51AHJSW1YA==
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by GVXPR10MB5864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:20:36 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::d4) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 09:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:20:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 10:21:51 +0100
Received: from [10.252.31.60] (10.252.31.60) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 10:20:33 +0100
Message-ID: <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
Date: Tue, 13 Jan 2026 10:20:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sumit Garg <sumit.garg@kernel.org>, Rob Herring <robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aVtqITUxy--E8HJt@sumit-xelite>
X-Originating-IP: [10.252.31.60]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|GVXPR10MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5ac73f-fd2f-462b-ff85-08de52850287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RytMcTdVRVNnVW5wWGg2RkxBUmZsNk9PRWhVYUxSUDR4Yjg3bldsckRyRDJ3?=
 =?utf-8?B?S3kzRVJnSWh2VDBlZytwMEgzTU5LQW1nZFcwMS9WZ25nU1lSYndqS3BoVWl0?=
 =?utf-8?B?N0lyWFVVNDF0ZURzM3o0K3BVR1FkWE9xNVM1QmhIK0Uwak9oUmprV09zcmN4?=
 =?utf-8?B?UWVxWlFxTFFJM0NYZFVTZ0pIdmw3eGJTdWZldUIweE0ycTZESmhTcFQ0VHE5?=
 =?utf-8?B?Rk5jV2pPRWRSUFE5bG9TRlNmZ1ZvYWliSkxyUTBTQURUekRQUGJMbXVFRmxa?=
 =?utf-8?B?ODF1ZFNEM09hblJwbHdubkkrSHZsZVNyNk5KRFU1ZEVHdmNXb1RSYVpxWXBW?=
 =?utf-8?B?eCtwRVp1MnlOQWVPY3UwZUJuT0FYQlZ2Q3MzSW02WFlXZ3hLZ05reWVZSUF3?=
 =?utf-8?B?YWpNR240ZGJ1d3FlSnI0V0tuQ1puaGNMRXkveTdTblBabmRuNTIwa1kySzI1?=
 =?utf-8?B?TitqWFBCRFREYnV6bksxNEwyUUFiTUhRSzhzWlppUHNIOEtQbWxtYTBwemFh?=
 =?utf-8?B?UmRid0dyU2xzVzVzaXNJWkE1OXlidTEvMlFLb044S2hKZ0JWVmhobFNBZGJn?=
 =?utf-8?B?VFpWS0ZENTl3SkV2dmVXUythVnp1cjNpczVUdGE1ZHpaQ3BOOC9kYWx6NDJU?=
 =?utf-8?B?SUdSVys5SmFGSjFGcFNTaG1XMWZGVVlYYXF6T3pJWnRlZjZ3MVRtcG9VRWla?=
 =?utf-8?B?bmlWd2ZpVzg2UklRVTdKRkF4QVBuZjEvZitKNjkxNExXeUpnVnVIUUY3Uklv?=
 =?utf-8?B?aklJMGZwS2QyNTBsYkovU1RaaldXOXIrMURIc3lKZS9rQ3IzeDI5OEV3ZWRN?=
 =?utf-8?B?MXFZQUtUcWwxWm1QMDBIL1RFZkFHb0Q0M0ZaaG8wSkE4cHo5b282M3ZwanRh?=
 =?utf-8?B?cFZOMXg2Qko5YllSTnRJajExenBqYVFSYmxmV3VoNlpNZSt6SWV5eTBWVGt2?=
 =?utf-8?B?NlVUaE8yWVpodjJnVllXazdIbmNLc2xYMHV4dzQ4R2tFM0szeXB6d0RXeVo5?=
 =?utf-8?B?azZNay9wVVdBOTR0SjJ4cnhRd0M2a3pxOXhpQW1nRE91dHhXL0tYVFpSK1dh?=
 =?utf-8?B?TzFIZlVxNVU2ZUNyWmYrWWh0N3BLeVhKazlhYzV2ZWpkenJsVmJaL0t6ajdN?=
 =?utf-8?B?MWV0V2ZHU3pQK0lpUEh5YzhVNWE2VmxsTSsxMUpXK1FHMmJ3M05vTXBYQVdm?=
 =?utf-8?B?ZDJXeUFBNGJpTGpKNndrMXNVQkxXbDZVenVyMFZRVGlETXZxZmg5RHRnTjJp?=
 =?utf-8?B?V2cyUWJuZzFra25tYlFOaVB2M2NGVVpWc2laa2d3dWZkREhkcFB1eUhiUXFm?=
 =?utf-8?B?NGZuU2RJVGJxNUhCRVJHcDZlMzZ3S0dCZzlXTmZSRVl5eVd5OFdFUjA0dkFG?=
 =?utf-8?B?MXlwYUdPRmJUM0QxVlJQM2VIaEZXRVJEUGh0T0hqNW9TL0kvb015OUV5MUx2?=
 =?utf-8?B?ejdvVkJsRHVXWEtDamlVbFYyZnBJVkh6ZzljOTJIQXErNTNTR3F3endCNnRs?=
 =?utf-8?B?cFdaMGlpZTR6VFpySC9tMGdFcHNTeFVwVmNUSGtnTlpaRDM2WCtoL255TEpY?=
 =?utf-8?B?UXRjUmhlTWRVWjdpYUR4Um1tWWYrVEwvbGxlNURpQ2IrUDJmYXFFdjB2ZjFQ?=
 =?utf-8?B?TkowYzk3RkNlQ3Q0eURsK3VDelhoS09VNTBmRjVZSGltbUNyMCtTRjM0eHJJ?=
 =?utf-8?B?cUpwVFRGVlZ2QzNpNGU1TVQxMCtJZzBXMHdPaVo5L3BtV3lNQmt4QnhMY05X?=
 =?utf-8?B?VVpBOVZ2U084UlZEcHRqUTRYWVQ3MkNFeDg4YWxHSVB6WmJ5MzhDYUpYK3BJ?=
 =?utf-8?B?ZnBuaXNlbWwrN2dQdzgzc3RJM0pIU2lpeTFsRGRLNzJjRmJibFpqRXBwdTU0?=
 =?utf-8?B?aHlxQ2x0dE4reWV4UUVRM3pUWlJ5NDdCTUJFeG9EM3pQczY2NllzNytubHFx?=
 =?utf-8?B?T08zYUtMU3FvRUV4YU0vOW1UQjVmOE10bElmT1R2ZGI3RElxVjZFdmpGbEwz?=
 =?utf-8?B?TkZwQ2ZiODM1Mlp6cnJtalVRamtNcDRLYlBVczNsdThQbEcwUGZSS1VQZUN5?=
 =?utf-8?B?SzRaTGc0Rzk0bm8zL1FqS2NBcmhqSHgyV1E1Y2tudTJ4emJ6aUVNRnQwQmUr?=
 =?utf-8?Q?NpDw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:20:35.8660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5ac73f-fd2f-462b-ff85-08de52850287
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5864
X-Authority-Analysis: v=2.4 cv=XfSEDY55 c=1 sm=1 tr=0 ts=69660e67 cx=c_pps
 a=zENiTB/zEOiFyifeSt50yg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=i0FVImxyn9gA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8
 a=xsx64BSX4TkU_5fudAEA:9 a=Hj5wB2MbPpAxq7y1:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 7PlfaP0p0NewNUEWHksE_lbTOhor3FXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NyBTYWx0ZWRfX91yrjRjOujAL
 BxwbbC8rmt4rL5vyKTAIhr4vHTYfsOviU+fm6WFisLglHG3I/7jklSIs4oRbe1vKl8xx5mVwpqJ
 t7nhpW3ux5X8naNPCAChxSTNsPBfXbmTOr1N0/BcZ7ussHjOIvpPq7D06XdfPDwsyyS0Dz5egxs
 vHTG0Q+bdvk05KHk/g94cnOlabhIxpD/YPLeDAuEPJwWXEAfmASrTu61MJcVmW8ejYUBOjbykK+
 dqJLuKDDRla0FiZzHy+azsnRC1PBucNo3oA4ZWIjSPcNziwrGEhdyJW60uctO7L34+gcC7P4nYx
 32MixUn0fyC2IKMhu3xMjb1EDNZJIxcyMmO2c8bPBEEIZxOvNc9VAFKFtAgqSeW1PJJwwDUR3in
 gG6Z4x0aVJB1JHRN1rkh61mYUs7PIx9qikEf+V0YtCG60lQDGVFTYhB6bURUu2dpJvB1ZsMHB+o
 J0XoZLK/l2TvNewPELg==
X-Proofpoint-ORIG-GUID: 7PlfaP0p0NewNUEWHksE_lbTOhor3FXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130077
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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

SGVsbG8sCgpPbiAxLzUvMjYgMDg6MzcsIFN1bWl0IEdhcmcgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MDIsIDIwMjYgYXQgMDQ6MTc6MjdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIFR1
ZSwgRGVjIDMwLCAyMDI1IGF0IDU6MTDigK9BTSBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIE1vbiwgRGVjIDI5LCAyMDI1IGF0IDA1OjI1OjMwUE0g
LTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4+IE9uIFdlZCwgRGVjIDE3LCAyMDI1IGF0IDA0
OjM5OjEyUE0gKzAxMDAsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4+Pj4+IEFkZCBhIGRldmlj
ZSB0cmVlIGJpbmRpbmcgZm9yIHRoZSBURUUtYmFzZWQgcmVtb3RlIHByb2Nlc3NvciBjb250cm9s
Cj4+Pj4+IHNlcnZpY2UgaW1wbGVtZW50ZWQgYXMgYW4gT1AtVEVFIFRydXN0ZWQgQXBwbGljYXRp
b24gaWRlbnRpZmllZCBieQo+Pj4+PiBVVUlEIDgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZh
OTc3MWEwOC4KPj4+Pj4KPj4+Pj4gVGhlIFRFRSBzZXJ2aWNlIG5vZGUgaXMgYSBjaGlsZCBvZiB0
aGUgImxpbmFybyxvcHRlZS10eiIgZmlybXdhcmUgbm9kZSBhbmQKPj4+Pj4gYWN0cyBhcyBhIGNv
bnRhaW5lciBmb3IgcmVtb3RlcHJvYyBkZXZpY2VzIHRoYXQgYXJlIGNvbnRyb2xsZWQgdmlhIFRF
RS4KPj4+Pgo+Pj4+IElzIHRoaXMgZ2VuZXJpYyBmb3IgYW55IHJlbW90ZXByb2MgZGV2aWNlIG9y
IGp1c3QgU1QncyByZW1vdGVwcm9jLiBMb29rcwo+Pj4+IGxpa2UgdGhlIGxhdHRlciB0byBtZS4K
Pj4+Cj4+PiBUaGF0J3MgdHJ1ZSwgdGhlIERUIGRlc2NyaXB0aW9uIG9mIHRoZSByZW1vdGVwcm9j
IHN1Ym5vZGUgaXMgdmVyeQo+Pj4gc3BlY2lmaWMgdG8gdGhlIHZlbmRvciB3aGljaCBpbiB0aGlz
IGNhc2UgaXMgU1QuCj4+Pgo+Pj4+Cj4+Pj4+IEluIGFkZGl0aW9uLCB0aGUgImxpbmFybyxvcHRl
ZS10eiIgYmluZGluZyBpcyB1cGRhdGVkIHRvIHNwZWNpZnkgdGhlCj4+Pj4+ICcjYWRkcmVzcy1j
ZWxscycgYW5kICcjc2l6ZS1jZWxscycgdmFsdWVzIHVzZWQgZm9yIGNoaWxkIFRFRSBzZXJ2aWNl
Cj4+Pj4+IG5vZGVzLgo+Pj4+Cj4+Pj4gSSdtIHByZXR0eSBzdXJlIEkgYWxyZWFkeSByZWplY3Rl
ZCBwZXIgc2VydmljZS9hcHAgY2hpbGQgbm9kZXMgZm9yCj4+Pj4gT1AtVEVFIHdoZW4gaXRzIGJp
bmRpbmcgd2FzIHN1Ym1pdHRlZC4KPj4+Cj4+PiBUaGF0IHdhcyB0aGUgcmVhc29uIHRvIGhhdmUg
ZGlzY292ZXJhYmxlIFRFRSBidXMgaW4gZmlyc3QgcGxhY2UgYW5kIEkKPj4+IGhhdmUgYmVlbiBt
b3RpdmF0aW5nIHBlb3BsZSB0byBkeW5hbWljYWxseSBkaXNjb3ZlciBmaXJtd2FyZSBwcm9wZXJ0
aWVzCj4+PiByYXRoZXIgdGhhbiBoYXJkY29kaW5nIGluIHRoZSBEVC4KPj4+Cj4+Pj4gSWYgd2Ug
ZG8gbmVlZCBzb21ldGhpbmcgaW4gRFQKPj4+PiB0byBkZWZpbmUgc29tZSByZXNvdXJjZXMsIHRo
ZW4gY2FuJ3Qgd2UgaGF2ZSBzb21lIHNvcnQgb2YKPj4+PiBzdGFuZGFyZC9jb21tb24gY29tbXVu
aWNhdGlvbnMgY2hhbm5lbD8gSSBkb24ndCBjYXJlIHRvIHNlZSBzb21lIHNvcnQgb2YKPj4+PiBm
cmVlLWZvci1hbGwgd2hlcmUgd2UgaGF2ZSBldmVyeSB2ZW5kb3IgZG9pbmcgdGhlaXIgb3duIHRo
aW5nLiBPUC1URUUKPj4+PiBuZWVkcyB0byBzdGFuZGFyaXplIHRoaXMuCj4+Pgo+Pj4gSSBzdXBw
b3NlIHRoaXMgcmVxdWlyZXMgYSB3aWRlciBzY29wZSB3b3JrIGFzIHlvdSBjYW4gc2VlIHRoZSBE
VCByZXNvdXJjZQo+Pj4gZGVwZW5kZW5jZSBmcm9tIGhlcmUgWzFdLiBCeSBzdGFuZGFyZGl6ZSBj
b21tdW5pY2F0aW9uIGNoYW5uZWwsIGRvIHlvdQo+Pj4gbWVhbiB0byBzYXkgaWYgYWRkaW5nIGFu
IGFsdGVybmF0aXZlIGJhY2tlbmQgdG8gZndub2RlIGZvciBURUUgaW4KPj4+IHBhcmFsbGVsIHRv
IERULCBBQ1BJIG9yIHN3bm9kZSBpcyB0aGUgd2F5IHRvIGdvIGZvciBkaXNjb3ZlcmluZyBmdwo+
Pj4gcHJvcGVydGllcz8KPj4KPj4gTm8sIG5vdCBhdCBhbGwuCj4+Cj4+PiBPciBkbyB5b3UgaGF2
ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBoZXJlPwo+Pgo+PiBXaGF0IEkgbWVhbiBpcyB3aHkgZG9l
c24ndCB0aGUgVEVFIGRlZmluZSB0aGUgY29tbXVuaWNhdGlvbiBjaGFubmVsCj4+IChtYWlsYm94
K3NobWVtIGFuZCBub3RpZmljYXRpb24gaW50ZXJydXB0KSByYXRoZXIgdGhhbiBlYWNoIFRFRSBh
cHA/Cj4gCj4gVGhlIHN5bmNocm9ub3VzIGNvbW11bmljYXRpb24gY2hhbm5lbCBpcyBhbHJlYWR5
IHRoZXJlIGZvciBlYWNoIFRFRSBhcHAKPiBiYXNlZCBvbiAoaW52b2tlIGNvbW1hbmRzICsgVEVF
IHNoYXJlZCBtZW1vcnkpLiBPUC1URUUgZG9lcyBzdXBwb3J0Cj4gbm90aWZpY2F0aW9uIGludGVy
cnVwdHMgdG9vIGJ1dCB0aG9zZSBoYXZlbid0IGJlZW4gZXhwb3NlZCB0byBURUUgY2xpZW50Cj4g
ZHJpdmVycyB5ZXQuIEkgc3VwcG9zZSB0aGlzIHJlbW90ZXByb2MgdXNlLWNhc2UgY2FuIGJlIGEg
Z29vZCBleGFtcGxlIHRvCj4gZXhwb3NlIHRoYXQgYXMgYSBnZW5lcmljIFRFRSBub3RpZmljYXRp
b24gaW50ZXJmYWNlIHRvby4KCkluIHRoZSBTVE0zMk1QIHNlcmllcywgdGhlIG1haWxib3hlcyBh
bmQgc2hhcmVkIFJBTSBhcmUgdXNlZCBmb3IgUlBNc2cgCmNvbW11bmljYXRpb24gYmV0d2VlbiBM
aW51eCBhbmQgdGhlIHJlbW90ZSBwcm9jZXNzb3IuIE15IGNvbmNlcm4gaXMgdGhhdCAKdXNpbmcg
bm90aWZpY2F0aW9uIGluIE9QLVRFRSBjb3VsZCBpbXBhY3QgcGVyZm9ybWFuY2UgYnkgaW50cm9k
dWNpbmcgCmxhdGVuY3kuIEFkZGl0aW9uYWxseSwgdGhpcyBtaWdodCByZXF1aXJlIGEgRE1BIGFs
bG9jYXRvciBpbiBPUC1URUUgdG8gCm1hbmFnZSB0aGUgc2hhcmVkIG1lbW9yeS4gT25lIFJQTXNn
IHZpcnRpbyByZXF1aXJlcyB0aGUgZGVjbGFyYXRpb24gb2YgCmF0IGxlYXN0IHRocmVlIGNhcnZl
b3V0cy4gTWFuYWdpbmcgdGhlc2UgYXMgbWVtb3J5IHJlZ2lvbnMgaW4gT1AtVEVFIAp3b3VsZCBi
ZSBjb21wbGV4IChkdWUgdG8gbGltaXRlZCBudW1iZXIgb2YgbWVtb3J5IGFyZWEgZGVjbGFyYXRp
b24gb24gClNUTTMyTVAyKS4KPiAKPj4KPj4gTW9yZSBnZW5lcmFsbHksIGlzIGhhdmluZyBURUUg
YXBwcyBkZXBlbmRpbmcgb24gcmFuZG9tIERUIHJlc291cmNlcwo+PiByZWFsbHkgYSBib3ggd2Ug
d2FudCB0byBvcGVuPyBJcyB0aGUgbmV4dCB0aGluZyBnb2luZyB0byBiZSBhIFRFRQo+PiBjbG9j
ay9yZXNldC9ncGlvL3Bvd2VyIHByb3ZpZGVyPyBXaGVyZSBkbyB3ZSBkcmF3IHRoZSBsaW5lPwo+
IAo+IFRoaXMgaXMgcmVhbGx5IGEgaGFyZCBsaW5lIHRvIGRyYXcgc2luY2Ugc2lsaWNvbi9PRU0g
dmVuZG9ycyBiYXNlZCBvbiB0aGVpcgo+IGhhcmR3YXJlIHNlY3VyaXR5IGFyY2hpdGVjdHVyZSBw
YXJ0aXRpb24gdmFyaW91cyByZXNvdXJjZXMgYW1vbmcgVEVFIGFuZAo+IHRoZSBMaW51eCB3b3Js
ZC4gQW5kIG9uZSBnZW5lcmFsIHByaW5jaXBsZSB3ZSB0cnkgdG8gZm9sbG93IGZvciB0aGUgVEVF
Cj4gaXMgdG8ga2VlcCBpdCdzIFRydXN0ZWQgQ29tcHV0aW5nIEJhc2UgKFRDQikgdG8gYSBtaW5p
bWFsIHRvby4KPiAKPiBJTUhPLCBpZiB0aGUgdGhyZWF0IG1vZGVsIGlzIHdlbGwgdW5kZXJzdG9v
ZCB0aGVuIHdlIHNob3VsZCBhbGxvdyBmb3IKPiB0aGlzIGhldHJvZ2Vub3VzIHBhcnRpdGlvbmlu
ZyBvZiBzeXN0ZW0gcmVzb3VyY2VzLgoKSGVyZSBhcmUgc29tZSBhZGRpdGlvbmFsIHJlc291cmNl
cyB3ZSBuZWVkIHRvIG1hbmFnZSB0aGUgcmVtb3RlIApwcm9jZXNzb3IsIHdoaWNoIHNlZW0gY29t
cGxleCB0byBoYW5kbGUgd2l0aG91dCBEZXZpY2UgVHJlZSAoRFQpOgoKLSBDbG9ja3M6IE9uIFNU
TTMyTVAsIHdlIG1hbmFnZSBjbG9ja3MgdGhyb3VnaCB0aGUgT1AtVEVFIFNDTUkgc2VydmljZQog
ICBbMV0uIFRoZSBTQ01JIE9QLVRFRSBjbG9jay9yZXNldCBzZXJ2aWNlIGFscmVhZHkgZXhpc3Rz
IGFuZCBzaG91bGQgYmUKICAgcmV1c2VkLgotIFBvd2VyIGRvbWFpbnMKLSBSZW1vdGVwcm9jIFdh
dGNoZG9nIGludGVycnVwdDogQ2Fubm90IGJlIGNhdWdodCBieSBPUC1URUUgb24KICAgc3RtMzJt
cDE1LgotIEdyYWNlZnVsIHNodXRkb3duIG9mIHRoZSByZW1vdGUgcHJvY2Vzc29yOiBUaGlzIGlu
dm9sdmVzIHNlbmRpbmcgYQogICBtYWlsYm94IG5vdGlmaWNhdGlvbiB0byByZXF1ZXN0IHNodXRk
b3duIGFuZCB3YWl0aW5nIHVwIHRvIDUwMCBtcyBmb3IKICAgdGhlIHJlbW90ZXByb2MgdG8gZGVp
bml0aWFsaXplIGl0cyByZXNvdXJjZXMuIFdhaXRpbmcgdGhpcyBsb25nIGluIHRoZQogICBzZWN1
cmUgY29udGV4dCBzZWVtcyBpbmVmZmljaWVudC4KLSBjb21wYXRpYmlsaXR5IHdpdGggc29tZSBj
b21pbmcgSVBDIG1lY2hhbmlzbXM6IFN1Y2ggYXMgcnBtc2dfSTJDIG9yCiAgIHZpcnRpby1tc2cg
bWlnaHQgcmVxdWlyZSByZW1vdGVwcm9jIHN1Ym5vZGUgZGVzY3JpcHRpb25zIGluIHRoZQogICBm
dXR1cmUuCgpJZiB0aGUgcHJvcG9zZWQgdG9wb2xvZ3kgZG9lcyBub3QgZ2FpbiBjb25zZW5zdXMs
IHdoYXQgYWJvdXQgYW4gCmFsdGVybmF0aXZlIGFwcHJvYWNoIHRoYXQgbWFuYWdlcyB0aGUgcmVt
b3RlcHJvYyBURUUgc2ltaWxhcmx5IHRvIFNDTUksIApieSBpbnRyb2R1Y2luZyBhIHJlbW90ZXBy
b2MtYmFja2VuZCB3aXRoIHRoZSBwcm9jIElEIGFzIGEgcGFyYW1ldGVyPwoKCiZmaXJtd2FyZSB7
CiAgICAgb3B0ZWU6IG9wdGVlIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW5hcm8sb3B0ZWUt
dHoiOwogICAgICAgICBtZXRob2QgPSAic21jIjsKICAgICAgICAgc3Byb2M6IHNwcm9jIHsKICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5Nzcx
YTA4IjsKICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OwoJICAgICNzaXplLWNlbGxz
ID0gPDA+OwogICAgICAgICB9OwogICAgIH07Cn07CgpycHJvYzE6IG0zM0AwIHsKICAgWy4uLl0K
CiAgIHJlbW90ZXByb2MtYmFja2VuZCA9IDwgJnNwcm9jIDA+Cn07CgoKcnByb2MyOiBtMEAwIHsK
ICAgWy4uLl0KCiAgIHJlbW90ZXByb2MtYmFja2VuZCA9IDwgJnNwcm9jIDE+Cn07CgoKWzFdaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTguNC9zb3VyY2UvZHJpdmVycy9jbGsv
Y2xrLXNjbWkuYwoKVGhhbmtzLApBcm5hdWQKCj4gCj4gLVN1bWl0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
