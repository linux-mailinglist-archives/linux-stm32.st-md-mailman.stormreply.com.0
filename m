Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB132B59791
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 15:27:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 691D6C3087A;
	Tue, 16 Sep 2025 13:27:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 653E3C3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 13:27:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GC9HFZ013028;
 Tue, 16 Sep 2025 15:26:55 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013058.outbound.protection.outlook.com
 [52.101.83.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494wr9urvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Sep 2025 15:26:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiXYdYqgTJpZmaw3lLA92basBUT/xIvt+nU5+wBXATrsy1P4bfnMed6Pol2BcvTbdt4tFYVNU1tDNWFl3MWCx1YEOPCsv0CVcZHDYTXBSuDiwOlQYr60L4j7xns9XF9UrzN5GB9psUy8whxtTzKUy/oXUSKEfnIpHOzSpklctk0CT3G5utT1LGuFTc0H41N+Yg1vZ0OvCBNxuIXCc045Ly3jGCKgbgHczJTYsSPo1aAIkwIxdME1iMlVg61BoUXIPWBSgn+wHvTcyNymaXB5loKLQ2qNM6eFmC/XwMfLy8JN16vq4D7i3Li+8zCzxrbtj/JFfgvM2KjYi2ISl/JTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJvFsulW4qiB/NBOBng5vfuW02X0pla+/tATnDTKSyk=;
 b=xuMj5jzTFOB6BsrBknWUGTexpLC1vAeRxyXPsHRpnz1SO0FTpyxuoE5Yt6wdH4QzGHH2YdITTimsAiHpivYXsTl314Lr43AS1HbqJ04YIoqW29EI4EPWH2zBFcRqz6VALRiMi5tdylnPvjUYeTwHso2h2FLEt9xXnkYCv/PHbiITEEychL37uWgwbg8Lx4d+NQeIbAk7z78O2SpYB1HtEE8X3bvMK+cg5pz3BklJIQOPQvWm9xtn2g33UxAMTAmcpBOUv2fqWtg0FvA5At8d8UINSP+3w52rTX4kPaj0AcHmartUzJno39uxhb5GPL0nFlZY7MIn8Gbc1egKnP+yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJvFsulW4qiB/NBOBng5vfuW02X0pla+/tATnDTKSyk=;
 b=cdQzwsB/wyEn1kiegDe8aD2rEbZLkDgUaT0NxRW/VrSZCAZHwLb/ldzfYdbNL6J2O6g52DRiPi7zL45sAE6LoH0CqorE1XBgWBaOKnI5l+Wtq4bYqlj3Vh9vFrcruUCocCrN28UpFNZWDu+Z7SuvX6ZvAT720mNC+hWEIbOxPidKWM5Hk4NZLRUQS1XDjp1rZ4NliRb79zVRXckiFC8zJ2m49Pa/qSwZn46a21zDxQ2S1F/XWjQzVQsC70LJsbY4OOcIUkKKBSwXBgNqM+jq22PTV+rbBg1ozNo15EvfzV5/P84Xg5Z8llYFSOjWBIXK3Hb4YQ9kgL1wPauQDmTL2w==
Received: from AS9PR06CA0697.eurprd06.prod.outlook.com (2603:10a6:20b:49f::25)
 by DU0PR10MB6725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:26:50 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::be) by AS9PR06CA0697.outlook.office365.com
 (2603:10a6:20b:49f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 13:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 13:26:49 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:24:25 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:26:49 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Sep
 2025 15:26:48 +0200
Message-ID: <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
Date: Tue, 16 Sep 2025 15:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sumit Garg <sumit.garg@kernel.org>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aMkqifHSdlCs4VjA@sumit-X1>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DU0PR10MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: d4008bba-16e7-4b31-0453-08ddf524b14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVg4WWxXdDhWNFdlR2JBMmd4RFR6dTZseFFGTGZJT1o1dVVPbFlBVWQzSm43?=
 =?utf-8?B?VjIrT1VaclFRZnhJbWJzTEdrZFJnUFJzdTY1SGExWmNsMXZyNWFSOUVJK0F0?=
 =?utf-8?B?VE8xZ3RNZU00dmxWOWtFR3dTQlEvWUlrU3AwbXlBN2s2QWovUm5pVzRweTBT?=
 =?utf-8?B?VWZpWnRVdkNwR2RqOE5YK3VqNnNVUzhMbmYvam4rSlliczZMS3dDcWNvb0dC?=
 =?utf-8?B?QmxFei9DQ0FIRzBZK3h1QWs0bVFQUE1zTHgwNnFxZXA3YzZIT29XVnZMbHBP?=
 =?utf-8?B?NHNtV09QR0F5bTVSSzA3TDl4TzV3K2FoTWpzUmNETWhmZmxlRFp2RHJlYmhT?=
 =?utf-8?B?Q1FiaXVWbUplVHhEV2Nja2RMRlhSQmlJTUxLTVQwOWR4YUF2dHRqZEpXc0R3?=
 =?utf-8?B?WXBwWHE5TjhRVWZUNXJwR2xVaHpmNXJ2MzRzTnRIMUoxeXVNYVl5a2NRQ1Y2?=
 =?utf-8?B?MmpUUnF6Q3VYSGIwekIvVG82WGtBdjhIZUVaeXdjckFBaTRVcmhkL2k5ek5Z?=
 =?utf-8?B?MmxrbVRqRzkzc0lhUzh1cGgxUms1bWxMSzlRcVpuTkh2UUtrMTVRS0NLY0xq?=
 =?utf-8?B?NjBRSk4yK3VBRm1lbXpmajhlakZoeGQyQjJvMnc4QTNXckR1QytWV2prQ2gy?=
 =?utf-8?B?dE5CQjNPZWZGai8zem56ekVYaUVGcnlnaVYxRWdJYUJjVDRFS1BGTVZOYXhv?=
 =?utf-8?B?ZzhlV291UnQ4U1pjNXo3R0VZUU1ydTd3NEdpUmY4ejF1TjlwdVVHaWI1YWFO?=
 =?utf-8?B?b1pjMGFBVWQwdXVjS3drTDNnU20xNkIrblBEeFpyTjZncG90NFZYL0FxMXhS?=
 =?utf-8?B?V1AwQmw3d3lJWTZaRDRJVk1mbXY4aUV4NWZvOUt3bTFsRkp4R0ZpaVdsbklF?=
 =?utf-8?B?ODVZQXU4Mm94V3FLZkhhdDBpRGdzNTVzMXNFbk1yeFJmTktnUkF2cjV2eEZS?=
 =?utf-8?B?Yys2dUNkQitBNjZUb2d5dkpaTERHQkllcjRITWFzUXpvdm9Kb21Hb2x2Y0Mx?=
 =?utf-8?B?dGgvK2h2RmJrdzZqUkdPaE9VUUdKamZKMndOQUN2WXlNZXMwVGZCdFBzNE5U?=
 =?utf-8?B?SGF2SWpwZmNnUG51ek9KQkRRUXVGa1IyYjlwZFYrZ1E1Qm8zbU4xQTRhN3Fy?=
 =?utf-8?B?NENnTE5KUGZYR0dXSVNvMmtzN1FPNUtBdkdnNE5vaWE5a2g1ZGQxdFVpWUdp?=
 =?utf-8?B?TkJmaTJBc1pua0d5amhobFh3bzNaV3FzZ09Ic0Rockdtd0p2Zkx4SHp0ekww?=
 =?utf-8?B?eFFtQ3ZadXdjTHFkR1FIWU9OY0cvMWJZQm9pbytXem9sRWdWT0pKUk9LSlla?=
 =?utf-8?B?dlVraCswTTZUNVFhZ2R2bW8wZEN2UkRYOE11M1pmOGxaakFJWGpmUWxlUER6?=
 =?utf-8?B?K3NSbkVLbVJDanZoYzlGN2hZQXJvSGNGNUcyLzY3VENpaWtyQiswUDdBSWhD?=
 =?utf-8?B?YkgvbGh0THAwVTVvNHQybHJXdkQxZElBMysyN3h0amRmRlA0Z0l6YTNDL0xt?=
 =?utf-8?B?QjJCVHRGZW5pbmFxbFVvUE14NXA1V0NVNXFpZ2IrYnFza0RXUG96QjJqOHN5?=
 =?utf-8?B?ckVFTVR4U1BMZFlrUXZ2QThrTEk3RDVUbm82VENFZ2hxOGlySCs3L0VBZDNw?=
 =?utf-8?B?N0xqQ0NHV3ZJMXkrSHhscTVuUGlhcHJKRnBPSlYwbFZCYjBnNkFneXNGdnZL?=
 =?utf-8?B?ZzZPWWZwQ3RwMHhEb3lySEZqNTJuUzVoSS9rSmszV0Y4YXl0Z2RBcUI5V1li?=
 =?utf-8?B?Sm9tNXc1UU9yMTBWbnpNa0dhclk2aS9RUW1GeUt0UDNQUDRxUE1kbTY2Rks3?=
 =?utf-8?B?dVJNT2lCd0IxT1BqMmlEUmRFaWhGODVobGJjMnd5Z25MS3cremZHTFBOUS9V?=
 =?utf-8?B?ZlhVRG4xek5nNzNSV3pjaXJoKzV1Mkp4NEN6WnB3emxRSWxXNmlsWDhJREJH?=
 =?utf-8?B?YUV5ZWdBaXpDWUJUcERHZmxBM043UE8yaTF4NmlLNm11cm1hWGxzVVE1RlFs?=
 =?utf-8?B?OWs4WVpnM043M0g3aDVaSkY2ckNNaUwydVV2cWMzYmhZOUdiV2wzOHhRTEZt?=
 =?utf-8?Q?d4265W?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:26:49.7775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4008bba-16e7-4b31-0453-08ddf524b14e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6725
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDIyMyBTYWx0ZWRfXzTNoaxMTTf64
 0MEkTTFUFTuwiQ5rE+gi8rhRssmDADBXb+zyGdAqGcdrw4YEzJ0JQrE50FhB+zurWXloZooZNDG
 AxqvrwXI2czdPIf1ZykAECC0QKf4WVhTKlOTEXpu+2qs3obrJPm9SMP4qXxjNCnpmkjfRzKlVkk
 uRDqkSCr3NgLjOZLYFI2W2kd/OlHE2TGr7Fxjfr2xKAcbpzEQ/m2vLYdCQj1fPBKrBdY7M0hwtP
 AN71NjYkHop6KNihn5NN2Gxb3aYr5fB6fBXe9W8OcjMnCr91OUZbBQTHfufVGfuKUykMATu4Sg9
 pFXpucOp7HdHdzYSXjs8zv2fPq5IR8354MTL9Zl+nA8go/I8DZRbMUhQwPEb/ktyYUDl19y4esc
 UvPBkfDr
X-Proofpoint-GUID: UzLhKG6J0Q0IjCkoOL6EFs0_grlEc8IQ
X-Authority-Analysis: v=2.4 cv=HpN2G1TS c=1 sm=1 tr=0 ts=68c9659f cx=c_pps
 a=xFT3qlHD+1xS+TaMy1FbcQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=VwQbUJbxAAAA:8 a=nnNgWeZtcpC2q1cG_EoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: UzLhKG6J0Q0IjCkoOL6EFs0_grlEc8IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509120223
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v19 4/6] dt-bindings: remoteproc: Add
 compatibility for TEE support
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

SGVsbG8gU3VtaXQsCgpPbiA5LzE2LzI1IDExOjE0LCBTdW1pdCBHYXJnIHdyb3RlOgo+IEhpIEFy
bmF1ZCwKPgo+IEZpcnN0IG9mIGFsbCBhcG9sb2dpZXMgZm9yIHN1Y2ggYSBsYXRlIHJldmlldyBj
b21tZW50IGFzIHByZXZpb3VzbHkgSQo+IHdhc24ndCBDQ2VkIG9yIGludm9sdmVkIGluIHRoZSBy
ZXZpZXcgb2YgdGhpcyBwYXRjaC1zZXQuIEluIGNhc2UgYW55IG9mCj4gbXkgZm9sbG93aW5nIGNv
bW1lbnRzIGhhdmUgYmVlbiBkaXNjdXNzZWQgaW4gdGhlIHBhc3QgdGhlbiBmZWVsIGZyZWUgdG8K
PiBwb2ludCBtZSBhdCByZWxldmFudCBkaXNjdXNzaW9ucy4KCk5vIHdvcnJpZXMsIHRoZXJlIGFy
ZSB0b28gbWFueSB2ZXJzaW9ucyBvZiB0aGlzIHNlcmllcyB0byBmb2xsb3cgYWxsIHRoZQpwYXN0
IGRpc2N1c3Npb25zLiBJIHNvbWV0aW1lcyBoYXZlIGRpZmZpY3VsdHkgcmVtZW1iZXJpbmcgYWxs
IHRoZQpkaXNjdXNzaW9ucyBteXNlbGYgOikKCj4KPiBPbiBXZWQsIEp1biAyNSwgMjAyNSBhdCAx
MTo0MDoyNkFNICswMjAwLCBBcm5hdWQgUG91bGlxdWVuIHdyb3RlOgo+PiBUaGUgInN0LHN0bTMy
bXAxLW00LXRlZSIgY29tcGF0aWJsZSBpcyB1dGlsaXplZCBpbiBhIHN5c3RlbSBjb25maWd1cmF0
aW9uCj4+IHdoZXJlIHRoZSBDb3J0ZXgtTTQgZmlybXdhcmUgaXMgbG9hZGVkIGJ5IHRoZSBUcnVz
dGVkIEV4ZWN1dGlvbiBFbnZpcm9ubWVudAo+PiAoVEVFKS4KPiBIYXZpbmcgYSBEVCBiYXNlZCBj
b21wYXRpYmxlIGZvciBhIFRFRSBzZXJ2aWNlIHRvIG1lIGp1c3QgZmVlbHMgbGlrZSBpdAo+IGlz
IHJlZHVuZGFudCBoZXJlLiBJIGNhbiBzZWUgeW91IGhhdmUgYWxzbyB1c2VkIGEgVEVFIGJ1cyBi
YXNlZCBkZXZpY2UKPiB0b28gYnV0IHRoYXQgaXMgbm90IGJlaW5nIHByb3Blcmx5IHVzZWQuIEkg
a25vdyBzdWJzeXN0ZW1zIGxpa2UKPiByZW1vdGVwcm9jLCBTQ01JIGFuZCBvdGhlcnMgaGVhdmls
eSByZWx5IG9uIERUIHRvIGhhcmRjb2RlIHByb3BlcnRpZXMgb2YKPiBzeXN0ZW0gZmlybXdhcmUg
d2hpY2ggYXJlIHJhdGhlciBiZXR0ZXIgdG8gYmUgZGlzY292ZXJlZCBkeW5hbWljYWxseS4KPgo+
IFNvIEkgaGF2ZSBhbiBvcGVuIHF1ZXN0aW9uIGZvciB5b3UgYW5kIHRoZSByZW1vdGVwcm9jIHN1
YnN5c3RlbQo+IG1haW50YWluZXJzIGJlaW5nOgo+Cj4gSXMgaXQgZmVhc2libGUgdG8gcmF0aGVy
IGxldmVyYWdlIHRoZSBiZW5lZml0cyBvZiBhIGZ1bGx5IGRpc2NvdmVyYWJsZQo+IFRFRSBidXMg
cmF0aGVyIHRoYW4gcmVseWluZyBvbiBwbGF0Zm9ybSBidXMvIERUIHRvIGhhcmRjb2RlIGZpcm13
YXJlCj4gcHJvcGVydGllcz8KClRoZSBkaXNjb3ZlcmFibGUgVEVFIGJ1cyBkb2VzIG5vdCB3b3Jr
cyBpZiB0aGUgcmVtb3RlcHJvYyBpcyBwcm9iZWQKYmVmb3JlIHRoZSBPUC1URUUgYnVzLCBpbiBz
dWNoIGNhc2XCoCBubyBwb3NzaWJpbGl0eSB0byBrbm93IGlmIHRoZSBURUUKVEEgaXMgbm90IHll
dCBhdmFpbGFibGUgb3Igbm90IGF2YWlsYWJsZSBhdCBhbGwuClRoaXMgcG9pbnQgaXMgbWVudGlv
bmVkIGluIGEgY29tbWVudCBpbiBycHJvY190ZWVfcmVnaXN0ZXIoKS4KClRoZW4sIGl0IGlzIG5v
dCBvbmx5IGEgZmlybXdhcmUgcHJvcGVydHkgaW4gb3VyIGNhc2UuIERlcGVuZGluZyBvbiB0aGUK
Y29tcGF0aWJsZSBzdHJpbmcsIHdlIG1hbmFnZSB0aGUgaGFyZHdhcmUgZGlmZmVyZW50bHkuIFRo
ZSBzYW1lIGNvbXBhdGlibGVzCmFyZSB1c2VkIGluIGJvdGggT1AtVEVFIGFuZCBMaW51eC4gQmFz
ZWQgb24gdGhlIGNvbXBhdGlibGUsIHdlIGNhbiBhc3NpZ24KbWVtb3JpZXMsIGNsb2NrcywgYW5k
IHJlc2V0cyB0byBlaXRoZXIgdGhlIHNlY3VyZSBvciBub24tc2VjdXJlIGNvbnRleHQuClRoaXMg
YXBwcm9hY2ggaXMgaW1wbGVtZW50ZWQgb24gdGhlIFNUTTMyTVAxNSBhbmQgU1RNMzJNUDJ4IHBs
YXRmb3Jtcy4KCk1vcmUgZGV0YWlscyBhcmUgYXZhaWxhYmxlIGluIHRoZSBTVCBXSUtJOgpodHRw
czovL3dpa2kuc3QuY29tL3N0bTMybXB1L3dpa2kvT1AtVEVFX3JlbW90ZXByb2NfZnJhbWV3b3Jr
X292ZXJ2aWV3I0RldmljZV90cmVlX2NvbmZpZ3VyYXRpb24KaHR0cHM6Ly93aWtpLnN0LmNvbS9z
dG0zMm1wdS93aWtpL0xpbnV4X3JlbW90ZXByb2NfZnJhbWV3b3JrX292ZXJ2aWV3I0RldmljZV90
cmVlX2NvbmZpZ3VyYXRpb24KCj4KPj4gRm9yIGluc3RhbmNlLCB0aGlzIGNvbXBhdGlibGUgaXMg
dXNlZCBpbiBib3RoIHRoZSBMaW51eCBhbmQgT1AtVEVFIGRldmljZQo+PiB0cmVlczoKPj4gLSBJ
biBPUC1URUUsIGEgbm9kZSBpcyBkZWZpbmVkIGluIHRoZSBkZXZpY2UgdHJlZSB3aXRoIHRoZQo+
PiAgICAic3Qsc3RtMzJtcDEtbTQtdGVlIiBjb21wYXRpYmxlIHRvIHN1cHBvcnQgc2lnbmVkIHJl
bW90ZXByb2MgZmlybXdhcmUuCj4+ICAgIEJhc2VkIG9uIERUIHByb3BlcnRpZXMsIHRoZSBPUC1U
RUUgcmVtb3RlcHJvYyBmcmFtZXdvcmsgaXMgaW5pdGlhdGVkIHRvCj4+ICAgIGV4cG9zZSBhIHRy
dXN0ZWQgYXBwbGljYXRpb24gc2VydmljZSB0byBhdXRoZW50aWNhdGUgYW5kIGxvYWQgdGhlIHJl
bW90ZQo+PiAgICBwcm9jZXNzb3IgZmlybXdhcmUgcHJvdmlkZWQgYnkgdGhlIExpbnV4IHJlbW90
ZXByb2MgZnJhbWV3b3JrLCBhcyB3ZWxsCj4+ICAgIGFzIHRvIHN0YXJ0IGFuZCBzdG9wIHRoZSBy
ZW1vdGUgcHJvY2Vzc29yLgo+PiAtIEluIExpbnV4LCB3aGVuIHRoZSBjb21wYXRpYmlsaXR5IGlz
IHNldCwgdGhlIENvcnRleC1NIHJlc2V0cyBzaG91bGQgbm90Cj4+ICAgIGJlIGRlY2xhcmVkIGlu
IHRoZSBkZXZpY2UgdHJlZS4gSW4gc3VjaCBhIGNvbmZpZ3VyYXRpb24sIHRoZSByZXNldCBpcwo+
PiAgICBtYW5hZ2VkIGJ5IHRoZSBPUC1URUUgcmVtb3RlcHJvYyBkcml2ZXIgYW5kIGlzIG5vIGxv
bmdlciBhY2Nlc3NpYmxlIGZyb20KPj4gICAgdGhlIExpbnV4IGtlcm5lbC4KPj4KPj4gQXNzb2Np
YXRlZCB3aXRoIHRoaXMgbmV3IGNvbXBhdGlibGUsIGFkZCB0aGUgInN0LHByb2MtaWQiIHByb3Bl
cnR5IHRvCj4+IGlkZW50aWZ5IHRoZSByZW1vdGUgcHJvY2Vzc29yLiBUaGlzIElEIGlzIHVzZWQg
dG8gZGVmaW5lIGEgdW5pcXVlIElELAo+PiBjb21tb24gYmV0d2VlbiBMaW51eCwgVS1Cb290LCBh
bmQgT1AtVEVFLCB0byBpZGVudGlmeSBhIGNvcHJvY2Vzc29yLgo+IFRoaXMgInN0LHByb2MtaWQi
IGlzIGp1c3Qgb25lIHN1Y2ggcHJvcGVydHkgd2hpY2ggY2FuIHJhdGhlciBiZSBkaXJlY3RseQo+
IHByb2JlZCBmcm9tIHRoZSBURUUvT1AtVEVFIHNlcnZpY2UgcmF0aGVyIHRoYW4gaGFyZGNvZGlu
ZyBpdCBpbiBEVCBoZXJlLgpEbyB5b3UgbWVhbiBhIHRvcG9sb2d5IGRpc2NvdmVyeSBtZWNoYW5p
c20gdGhyb3VnaCB0aGUgVEVFIHJlbW90ZXByb2MKc2VydmljZT8KCkZvciB0aGUgU1RNMzJNUDE1
LCBpdCBjb3VsZCB3b3JrIHNpbmNlIHdlIGhhdmUgb25seSBvbmUgcmVtb3RlIHByb2Nlc3Nvci4K
SG93ZXZlciwgdGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIHRoZSBTVE0zMk1QMjUsIHdoaWNoIGVt
YmVkcyBib3RoIGEKQ29ydGV4LU0zMyBhbmQgYSBDb3J0ZXgtTTAuCgpDb3VsZCB5b3UgcGxlYXNl
IGVsYWJvcmF0ZSBvbiBob3cgeW91IHNlZSB0aGUgc3VwcG9ydCBvZiBtdWx0aXBsZSByZW1vdGUK
cHJvY2Vzc29ycyB3aXRob3V0IHVzaW5nIGFuIGhhcmRjb2RlZCBpZGVudGlmaWVyPwoKPiBJIHRo
aW5rIHRoZSBzYW1lIHdpbGwgYXBwbHkgdG8gb3RoZXIgcHJvcGVydGllcyBhcyB3ZWxsLgpDb3Vs
ZCB5b3UgZGV0YWlscyB0aGUgb3RoZXIgcHJvcGVydGllcyB5b3UgaGF2ZSBpbiBtaW5kPwoKVGhh
bmtzLApBcm5hdWQKCj4KPiAtU3VtaXQKPgo+PiBUaGlzIElEIHdpbGwgYmUgdXNlZCBpbiByZXF1
ZXN0cyB0byB0aGUgT1AtVEVFIHJlbW90ZXByb2MgVHJ1c3RlZAo+PiBBcHBsaWNhdGlvbiB0byBz
cGVjaWZ5IHRoZSByZW1vdGUgcHJvY2Vzc29yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcm5hdWQg
UG91bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgo+PiBSZXZpZXdlZC1ieTog
Um9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgLi4uL2JpbmRp
bmdzL3JlbW90ZXByb2Mvc3Qsc3RtMzItcnByb2MueWFtbCAgIHwgNTggKysrKysrKysrKysrKysr
Ky0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
bW90ZXByb2Mvc3Qsc3RtMzItcnByb2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZW1vdGVwcm9jL3N0LHN0bTMyLXJwcm9jLnlhbWwKPj4gaW5kZXggODQzNjc5YzU1
N2U3Li41OGRhMDdlNTM2ZmMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0LHN0bTMyLXJwcm9jLnlhbWwKPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2Mvc3Qsc3RtMzItcnByb2MueWFt
bAo+PiBAQCAtMTYsNyArMTYsMTIgQEAgbWFpbnRhaW5lcnM6Cj4+ICAgCj4+ICAgcHJvcGVydGll
czoKPj4gICAgIGNvbXBhdGlibGU6Cj4+IC0gICAgY29uc3Q6IHN0LHN0bTMybXAxLW00Cj4+ICsg
ICAgZW51bToKPj4gKyAgICAgIC0gc3Qsc3RtMzJtcDEtbTQKPj4gKyAgICAgIC0gc3Qsc3RtMzJt
cDEtbTQtdGVlCj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBVc2UgInN0LHN0bTMybXAx
LW00IiBmb3IgdGhlIENvcnRleC1NNCBjb3Byb2Nlc3NvciBtYW5hZ2VtZW50IGJ5IG5vbi1zZWN1
cmUgY29udGV4dAo+PiArICAgICAgVXNlICJzdCxzdG0zMm1wMS1tNC10ZWUiIGZvciB0aGUgQ29y
dGV4LU00IGNvcHJvY2Vzc29yIG1hbmFnZW1lbnQgYnkgc2VjdXJlIGNvbnRleHQKPj4gICAKPj4g
ICAgIHJlZzoKPj4gICAgICAgZGVzY3JpcHRpb246Cj4+IEBAIC00Myw2ICs0OCwxMCBAQCBwcm9w
ZXJ0aWVzOgo+PiAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgb2Zmc2V0IG9mIHRoZSBo
b2xkIGJvb3Qgc2V0dGluZyByZWdpc3Rlcgo+PiAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBU
aGUgZmllbGQgbWFzayBvZiB0aGUgaG9sZCBib290Cj4+ICAgCj4+ICsgIHN0LHByb2MtaWQ6Cj4+
ICsgICAgZGVzY3JpcHRpb246IHJlbW90ZSBwcm9jZXNzb3IgaWRlbnRpZmllcgo+PiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+PiArCj4+ICAgICBz
dCxzeXNjZmctdHo6Cj4+ICAgICAgIGRlcHJlY2F0ZWQ6IHRydWUKPj4gICAgICAgZGVzY3JpcHRp
b246Cj4+IEBAIC0xNDYsMjEgKzE1NSw0MyBAQCBwcm9wZXJ0aWVzOgo+PiAgIHJlcXVpcmVkOgo+
PiAgICAgLSBjb21wYXRpYmxlCj4+ICAgICAtIHJlZwo+PiAtICAtIHJlc2V0cwo+PiAgIAo+PiAg
IGFsbE9mOgo+PiAgICAgLSBpZjoKPj4gICAgICAgICBwcm9wZXJ0aWVzOgo+PiAtICAgICAgICBy
ZXNldC1uYW1lczoKPj4gLSAgICAgICAgICBub3Q6Cj4+IC0gICAgICAgICAgICBjb250YWluczoK
Pj4gLSAgICAgICAgICAgICAgY29uc3Q6IGhvbGRfYm9vdAo+PiArICAgICAgICBjb21wYXRpYmxl
Ogo+PiArICAgICAgICAgIGNvbnRhaW5zOgo+PiArICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMy
bXAxLW00Cj4+ICAgICAgIHRoZW46Cj4+ICsgICAgICBpZjoKPj4gKyAgICAgICAgcHJvcGVydGll
czoKPj4gKyAgICAgICAgICByZXNldC1uYW1lczoKPj4gKyAgICAgICAgICAgIG5vdDoKPj4gKyAg
ICAgICAgICAgICAgY29udGFpbnM6Cj4+ICsgICAgICAgICAgICAgICAgY29uc3Q6IGhvbGRfYm9v
dAo+PiArICAgICAgdGhlbjoKPj4gKyAgICAgICAgcmVxdWlyZWQ6Cj4+ICsgICAgICAgICAgLSBz
dCxzeXNjZmctaG9sZGJvb3QKPj4gKyAgICAgIGVsc2U6Cj4+ICsgICAgICAgIHByb3BlcnRpZXM6
Cj4+ICsgICAgICAgICAgc3Qsc3lzY2ZnLWhvbGRib290OiBmYWxzZQo+PiArICAgICAgICByZXF1
aXJlZDoKPj4gKyAgICAgICAgICAtIHJlc2V0LW5hbWVzCj4+ICAgICAgICAgcmVxdWlyZWQ6Cj4+
IC0gICAgICAgIC0gc3Qsc3lzY2ZnLWhvbGRib290Cj4+IC0gICAgZWxzZToKPj4gKyAgICAgICAg
LSByZXNldHMKPj4gKwo+PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAg
ICAgY29tcGF0aWJsZToKPj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgIGNv
bnN0OiBzdCxzdG0zMm1wMS1tNC10ZWUKPj4gKyAgICB0aGVuOgo+PiAgICAgICAgIHByb3BlcnRp
ZXM6Cj4+ICAgICAgICAgICBzdCxzeXNjZmctaG9sZGJvb3Q6IGZhbHNlCj4+ICsgICAgICAgIHJl
c2V0LW5hbWVzOiBmYWxzZQo+PiArICAgICAgICByZXNldHM6IGZhbHNlCj4+ICsgICAgICByZXF1
aXJlZDoKPj4gKyAgICAgICAgLSBzdCxwcm9jLWlkCj4+ICAgCj4+ICAgYWRkaXRpb25hbFByb3Bl
cnRpZXM6IGZhbHNlCj4+ICAgCj4+IEBAIC0xOTIsNSArMjIzLDE2IEBAIGV4YW1wbGVzOgo+PiAg
ICAgICAgIHN0LHN5c2NmZy1yc2MtdGJsID0gPCZ0YW1wIDB4MTQ0IDB4RkZGRkZGRkY+Owo+PiAg
ICAgICAgIHN0LHN5c2NmZy1tNC1zdGF0ZSA9IDwmdGFtcCAweDE0OCAweEZGRkZGRkZGPjsKPj4g
ICAgICAgfTsKPj4gKyAgLSB8Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3N0
bTMybXAxLXJlc2V0cy5oPgo+PiArICAgIG00QDEwMDAwMDAwIHsKPj4gKyAgICAgIGNvbXBhdGli
bGUgPSAic3Qsc3RtMzJtcDEtbTQtdGVlIjsKPj4gKyAgICAgIHJlZyA9IDwweDEwMDAwMDAwIDB4
NDAwMDA+LAo+PiArICAgICAgICAgICAgPDB4MzAwMDAwMDAgMHg0MDAwMD4sCj4+ICsgICAgICAg
ICAgICA8MHgzODAwMDAwMCAweDEwMDAwPjsKPj4gKyAgICAgIHN0LHByb2MtaWQgPSA8MD47Cj4+
ICsgICAgICBzdCxzeXNjZmctcnNjLXRibCA9IDwmdGFtcCAweDE0NCAweEZGRkZGRkZGPjsKPj4g
KyAgICAgIHN0LHN5c2NmZy1tNC1zdGF0ZSA9IDwmdGFtcCAweDE0OCAweEZGRkZGRkZGPjsKPj4g
KyAgICB9Owo+PiAgIAo+PiAgIC4uLgo+PiAtLSAKPj4gMi4yNS4xCj4+Cj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
