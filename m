Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86CC6ACD3
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 18:05:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8583C62D2D;
	Tue, 18 Nov 2025 17:05:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C4BC62D38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 17:05:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIGsp9C177696; Tue, 18 Nov 2025 18:05:16 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013058.outbound.protection.outlook.com
 [52.101.83.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4agrub938t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 18 Nov 2025 18:05:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGsd+vrXoIWPLpZlvZyayBcj9xmtwt/VbCIA+TrxbEYYckRVg2HIZ+wHgEmVCymJELxSYhN9j4csDoRwQwqhNy+OoG5LRb5O3BLIrVhFUj8qHvjuqVjXOYdnHoE0vjdJVDRKOidmxYUmM6yfrAcJ8a3sbllXdx+TTzmBQNsOtUHrSy1xx4uqhMsaTs1mOyVB6K4vfnT4e1YMsM+jbf5wh1tFtr6J/Vz3T3BQdw3fzI56lCdtSqgPEJoBIA09Wv3QNn1jEtPGKItgQfarNTnnvNe7hwo+GyObsmforzYlokjpn9fYKegH1quq9qlteyOwFTU2fdBpPzHoC96t42FRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIi/l1+pNF50cE6Pi7PqN/SUM8qTn6hWYAWUzvJzj7E=;
 b=DCXBRC5p7teFeV4wwpIjmTvqjoT2W4r1ETV1Zp5rPvplmDoa+nCdSALDd3DN8T5ukRE2tq9xs5E0RBPXHToz+O9y2pH543T4ZqbTnKNJ0xgQpzqGjUie1bbcg3P2Q9JNLUjG7gqUuMILINoIBMV/vG/k9g9r4tdwwswTooliHDNOIIN2+7ukhD9g63o1KGkOoOOQvEzJriHmuKOikOi1jmOZSHKj5i7UPjOqcm5kfPUgsYnda1R1jaGFDeKWJItwWXcj3Rsy3rJSIGvr5QpMr17Ie1QCHSNDhdcfTkJm9BLUL/i7bX0EzbnSifsfMsV/kJAavp2g/XnlkIBCZ66iQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIi/l1+pNF50cE6Pi7PqN/SUM8qTn6hWYAWUzvJzj7E=;
 b=TnwETzlxB7V/3wFWLIRwLSHCvTpelH4s+uwTdBTJEHhjKIVWE5Mo1ZK7sxYyvCTJbJO2WT6SaGlgbI9xaox7uW8D6Fxd979ey5uNKsC/jT4YyZDcb3o3y5pf0k7MhPQO5C6wv/aZdBX83qyNSl2LPn93tNIQJdfSIWgNFWPrQPP5bWDqrHdU6KydIVlV+ysHkuQGcl+0fMWRW3CYLk8eHad1hfgrjALwA9eMK33b/Q/ihSRXG7IPGB9YPkub/3ULHiRc8vatG+6/ibS12Mf2X3j+G2E0aqXF320SZJn+rcqOuUQfWqT25j72C8dYBgjaCOE8y8eawwN0jNrdP4l3Xg==
Received: from AS9PR05CA0358.eurprd05.prod.outlook.com (2603:10a6:20b:490::25)
 by AM9PR10MB4054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:05:15 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::4c) by AS9PR05CA0358.outlook.office365.com
 (2603:10a6:20b:490::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 17:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 17:05:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:16 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:51 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 18 Nov 2025 17:19:33 +0100
Message-ID: <20251118161936.1085477-13-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AM9PR10MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c37e74-dc11-490a-76ff-08de26c4a49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0czTFI1bmRuN2hFWnZ5eFg0NDR3MEh4akpjTCtETHZlTEx1b1pzWjRVbERX?=
 =?utf-8?B?akRvckVGZGthbkxPY0dMK293cC9IWWxmT3cxdTJ1WlNNVWtrK0dNZkQ3SXJU?=
 =?utf-8?B?M3NxQVZ5eFF0N1l3NjZISkY4NWw2S2c5MWx1cktMdE90ZjFGN2NJejFXQlFL?=
 =?utf-8?B?aW4xUlVCc0V0M0ZjS3J2YlZzUVNFclR2VWZHQTZzckluMENHNlZUTFJnOCts?=
 =?utf-8?B?ZXRQejk4L1daRU1jQnh0c3hlbWMwWmZMLzUzSE13Q0Nxb2dMWVRSOGlZTGpB?=
 =?utf-8?B?QjZWV3ZDSVhPbC9RM2cvTFlHTG9CRkVyNHQ4WWNLajNUa1MwdTMxdkFzYldM?=
 =?utf-8?B?bXlXVmxKd25oM0NyRVk5WHpoNWc4a2ZNQWVCdlJDL3NVWE5GSVBkU0VWdnZ0?=
 =?utf-8?B?SXNBVWliNVZLRnRWUW9CRy9HQ1crMUFNMm8wMTdPVTBTYlNEWnErczE0ajdp?=
 =?utf-8?B?bmhTcE1HVUpNenpJVTNUMVJhM2tlRGMzNkM4dE5icGVXYWNITlhCRTREK0Vr?=
 =?utf-8?B?YzhsdWc2UmVyNFZtSjE1NGhOdXFvVGh0UjVqMklHazQ3YWRRSFFVcFllRnk4?=
 =?utf-8?B?K3NJaTVtTG1OalRGaXgyUUZndm41NDMySXlsRjlzaVo0LzJCdFNxcm04amg0?=
 =?utf-8?B?NkRXSG05Zkdzd1RJaTJVZlExaTUrWTJ2VWVxZGdRdXZIVU9adWpXZ3dqdCto?=
 =?utf-8?B?Q1dqUndlNHc2VzBYa0R3T3p1MVFpelhKQXl2dEJFbGt5ZHFkRDRkbTd2OEF6?=
 =?utf-8?B?NWdmQmFSbmlveVE0eDJ2NkZBcm9TSDZnTXJsVWIvTHlLWjZVeDZwb0dDZUJC?=
 =?utf-8?B?ZTlyaExsNEl4TVhDVERVSXEyaGd2RzVYM1pJbkc2SlM0R1MwWDlWcVJUbkRE?=
 =?utf-8?B?ZUo5c005bTBuQ1picEFSdzV4SzFzZ1hxNHE0OTJMWFBCM0pFb0dnbXFDd1pV?=
 =?utf-8?B?STA5Q2NtQ1JPRGxwaFNsMVhjNG04T0xvSHRrV1BqM2xrb2R1RFViZVhnZzdD?=
 =?utf-8?B?UHVsdUdYM0x0amVRT0VPK1QwNmZaMWhkanExdUhLeTdPNXNVaWlOWFYrUm9h?=
 =?utf-8?B?YTRRSk5Pem9KbHhMMTVDc1FsMzA3NHhqNTBOR2E3R09aZVRockZrL1ZIL3Ix?=
 =?utf-8?B?a1ZKWUxtSUlKNnBzWVZoY1U4YndLSUVlYTZacnVXOC9CbTRWaGYwY0lxd1dq?=
 =?utf-8?B?VjV0bUlsQWV0c3NuOTlxRTBWQlJndnVjUTZoeFprNVh4WUttcDRuQkttRTFQ?=
 =?utf-8?B?VWFOQW1oTnlTOHJuTkN3WlhyUWJ3TWxGOEJGTDdaR3VIT0FKUDN1Vk5YTHZq?=
 =?utf-8?B?cnBNVTdwcGp5Y0toQlNNektNOVFHZFdrdjJNVlRLcGNtejRLcFllclhHM0Nw?=
 =?utf-8?B?bnEzc09ZWGs5UlNOTDQ0aTBTSG92Vk9DMVhSN1lsY1k5L0JlQ1B3MnN2bDZx?=
 =?utf-8?B?dHk1VkppVGJTQjJ0N01uVFFTOFZ3K1VkMmdLa1ZXaEswRHR2ZXU1MDEzanhw?=
 =?utf-8?B?a2w0bmhHb2tGY2dmWWg0VnJVV2oweURSenYweEZqazVhOFlrMWhEbjAzZmlj?=
 =?utf-8?B?dFNISllDNzFlQ2hERjdQSjZGem8yUjg5WUZjUzlFSDV1dmlBZldMVkNiY2hw?=
 =?utf-8?B?RmozYkRLWHVFeFFJT0xpRS9RVHNjVTQ3U3U4S3ZUdEZzNXdnK29NWW9KamJV?=
 =?utf-8?B?Zk9MVFp0cFgxVDkwbEsrOVh6M0FhRHh0eWhnRnloRkVTdmNBZSsvS0g2cWJw?=
 =?utf-8?B?dnRsUzBoQzRaMXBRMGY5emxLUzFFQllxbXpQV3JQN1FZVXZBY01aWERnVXhy?=
 =?utf-8?B?aVE5R0VrR2x5UEtvZ2sxVnd4WFpMbzdRcThoZm9sQ1JTelBTUXNta1hBd002?=
 =?utf-8?B?d3dOYXV0ampuRVpuVXFKeW1Lby9GSCtrV29HeFBJaVBwNXdpMG1OTkdRNlBj?=
 =?utf-8?B?VU85bW9YYzNXakhTNEFNalJ6cU1nVWdJM2RNS0E4MWdWeENtWnErQ2x4czVp?=
 =?utf-8?B?ZVBWQUQ4emxNc1FoVm96bXI3MnZBaGgza2JxdXIxd2ZFZUg3NitlVzdpM1Q1?=
 =?utf-8?B?Z3Bkc2hpYjFKb09ZOC9jTDQ3MmkzUkpDNnNzOXo2SXBQWUVkL0pHY1AreDdT?=
 =?utf-8?Q?/n4+ZUetjLkE+np319t9GPE+i?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:05:14.9720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c37e74-dc11-490a-76ff-08de26c4a49e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4054
X-Authority-Analysis: v=2.4 cv=LKBrgZW9 c=1 sm=1 tr=0 ts=691ca74c cx=c_pps
 a=xFT3qlHD+1xS+TaMy1FbcQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=ypDJklmpTWrOYmW8PNMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: n0gY9CBKmhF42FXNjnWxYawIcVxUVTjX
X-Proofpoint-GUID: n0gY9CBKmhF42FXNjnWxYawIcVxUVTjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzOCBTYWx0ZWRfXw34SUBxyrVa1
 PFJeQoBWEKw/WYrsK1/2sjmY/FqinscwFs8pciXeqiItZagVylNlQ9M2gvL/mW/DduRyApS/9VK
 sv59OCr20T5I3erDfwG47VfvYbCeSeoBl2JRfMCPjQfppquxxRHUUj0L+fyxzBuQVrFGb9bamHY
 IYUYcYY7/JNJ40b5x6yUNop/VB8kUGH4VGqXIoodwRHJ1MtOFwVneM76jN9cQTNWKqSBsDY9DP6
 iJeMs/tOCqdO6/W4Q5MlOapfUUl4ReBe/ShJ3N1yAKeQH1breaXeqfIR+kAkvFA/W3UHYOrrZSV
 CLLzgw6HIZUFPDFkAmV3i9ShX0JbLgjuKhj5VF0MJt5KpjicBGvPAnIC2NW0deeikzB+Arlk7go
 t6f15vTFAyHHsU+3EMMfceJdqlHbTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180138
Cc: Pascal Paillet <p.paillet@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>
Subject: [Linux-stm32] [PATCH v2 12/15] arm64: dts: st: add exti1 and exti2
	nodes on stm32mp21
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
VXBkYXRlIHRoZSBkZXZpY2UtdHJlZSBzdG0zMm1wMjExLmR0c2kgdG8gYWRkIHRoZSBub2RlcyBm
b3IgZXh0aTEKYW5kIGV4dGkyIGludGVycnVwdCBjb250cm9sbGVycy4KClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVk
LW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgotLS0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIxMS5kdHNpIHwgMTUwICsrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIxMS5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjExLmR0c2kKaW5kZXggMWYyMzRjOTg3ZGJjYS4uNGJkZjRi
M2EzOTgyOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjExLmR0
c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjExLmR0c2kKQEAgLTExMiwx
MSArMTEyLDE2MSBAQCB1c2FydDI6IHNlcmlhbEA0MDBlMDAwMCB7CiAJCQl9OwogCQl9OwogCisJ
CWV4dGkxOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0NDIyMDAwMCB7CisJCQljb21wYXRpYmxlID0g
InN0LHN0bTMybXAxLWV4dGkiLCAic3lzY29uIjsKKwkJCXJlZyA9IDwweDQ0MjIwMDAwIDB4MCAw
eDQwMD47CisJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKKwkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8
Mj47CisJCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0KKwkJCQk8JmludGMgR0lDX1NQSSAyNjggSVJR
X1RZUEVfTEVWRUxfSElHSD4sCS8qIEVYVElfMCAqLworCQkJCTwmaW50YyBHSUNfU1BJIDI2OSBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyNzAgSVJRX1RZUEVfTEVW
RUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjcxIElSUV9UWVBFX0xFVkVMX0hJR0g+LAor
CQkJCTwmaW50YyBHSUNfU1BJIDI3MiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMg
R0lDX1NQSSAyNzMgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjc0
IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDI3NSBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyNzYgSVJRX1RZUEVfTEVWRUxfSElHSD4s
CisJCQkJPCZpbnRjIEdJQ19TUEkgMjc3IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50
YyBHSUNfU1BJIDI3OCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwJLyogRVhUSV8xMCAqLworCQkJCTwm
aW50YyBHSUNfU1BJIDI3OSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQ
SSAyODAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjgxIElSUV9U
WVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDI4MiBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyODMgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJ
PCZpbnRjIEdJQ19TUEkgMCAgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNf
U1BJIDEgICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyMTEgSVJR
X1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjEwIElSUV9UWVBFX0xFVkVM
X0hJR0g+LAorCQkJCTwwPiwJCQkJCQkvKiBFWFRJXzIwICovCisJCQkJPCZpbnRjIEdJQ19TUEkg
OTUgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDk3ICBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxMjQgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxMDEgSVJRX1RZUEVf
TEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTAyIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJCTwmaW50YyBHSUNfU1BJIDEwMyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8Jmlu
dGMgR0lDX1NQSSAxMjMgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkg
MTEzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAkvKiBFWFRJXzMwICovCisJCQkJPCZpbnRjIEdJQ19T
UEkgMTE0IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDEzNSBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8Jmlu
dGMgR0lDX1NQSSA5OSAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkg
MTAwIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDExMiBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxMzcgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTM4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAkvKiBFWFRJ
XzQwICovCisJCQkJPCZpbnRjIEdJQ19TUEkgMTM5IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJ
CTwwPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxNTAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJ
PCZpbnRjIEdJQ19TUEkgMTU4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwwPiwKKwkJCQk8
MD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTQ5IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwm
aW50YyBHSUNfU1BJIDE4MCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8MD4sCisJCQkJPDA+
LAkJCQkJCS8qIEVYVElfNTAgKi8KKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8
MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwmaW50YyBH
SUNfU1BJIDE1MiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8MD4sCQkJCQkJLyogRVhUSV82
MCAqLworCQkJCTwmaW50YyBHSUNfU1BJIDE1NCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8
MD4sCisJCQkJPDA+LAorCQkJCTwmaW50YyBHSUNfU1BJIDE4NSBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwKKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwmaW50YyBHSUNfU1BJIDkgICBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxMTggSVJRX1RZUEVfTEVWRUxfSElHSD4s
CisJCQkJPDA+LAorCQkJCTwmaW50YyBHSUNfU1BJIDEyMSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwJ
LyogRVhUSV83MCAqLworCQkJCTwwPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxODggSVJRX1RZUEVf
TEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTcyIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJCTwmaW50YyBHSUNfU1BJIDk2ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8Jmlu
dGMgR0lDX1NQSSA5OCAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkg
MTI1IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDIwNSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyMDYgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjA3IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQl9Owor
CiAJCXN5c2NmZzogc3lzY29uQDQ0MjMwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJt
cDIxLXN5c2NmZyIsICJzeXNjb24iOwogCQkJcmVnID0gPDB4NDQyMzAwMDAgMHgwIDB4MTAwMDA+
OwogCQl9OwogCisJCWV4dGkyOiBpbnRlcnJ1cHQtY29udHJvbGxlckA0NDJkMDAwMCB7CisJCQlj
b21wYXRpYmxlID0gInN0LHN0bTMybXAxLWV4dGkiLCAic3lzY29uIjsKKwkJCXJlZyA9IDwweDQ0
MmQwMDAwIDB4MCAweDQwMD47CisJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKKwkJCSNpbnRlcnJ1
cHQtY2VsbHMgPSA8Mj47CisJCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0KKwkJCQk8JmludGMgR0lD
X1NQSSAxNSAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCS8qIEVYVElfMCAqLworCQkJCTwmaW50YyBH
SUNfU1BJIDE2ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAxNyAg
SVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTggIElSUV9UWVBFX0xF
VkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDE5ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwK
KwkJCQk8JmludGMgR0lDX1NQSSAyMCAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRj
IEdJQ19TUEkgMjEgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDIy
ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAyMyAgSVJRX1RZUEVf
TEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjQgIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJCTwmaW50YyBHSUNfU1BJIDI1ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwJLyogRVhUSV8x
MCAqLworCQkJCTwmaW50YyBHSUNfU1BJIDI2ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8
JmludGMgR0lDX1NQSSAyNyAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19T
UEkgMjggIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDI5ICBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8JmludGMgR0lDX1NQSSAzMCAgSVJRX1RZUEVfTEVWRUxf
SElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMTAgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJ
CTwmaW50YyBHSUNfU1BJIDExICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8MD4sCisJCQkJ
PDA+LAorCQkJCTwwPiwJCQkJCQkvKiBFWFRJXzIwICovCisJCQkJPCZpbnRjIEdJQ19TUEkgMTIg
IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwmaW50YyBHSUNfU1BJIDEzICBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwKKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8JmludGMgR0lD
X1NQSSAxMzYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8
JmludGMgR0lDX1NQSSAxODEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19T
UEkgMTgyIElSUV9UWVBFX0xFVkVMX0hJR0g+LAkvKiBFWFRJXzMwICovCisJCQkJPCZpbnRjIEdJ
Q19TUEkgMTgzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwwPiwKKwkJCQk8MD4sCisJCQkJ
PDA+LAorCQkJCTwmaW50YyBHSUNfU1BJIDUgICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQk8
JmludGMgR0lDX1NQSSA0ICAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19T
UEkgNiAgIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwwPiwKKwkJCQk8JmludGMgR0lDX1NQ
SSAyICAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMyAgIElSUV9U
WVBFX0xFVkVMX0hJR0g+LAkvKiBFWFRJXzQwICovCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8
MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJCQk8MD4sCisJCQkJPDA+LAorCQkJCTwwPiwKKwkJ
CQk8JmludGMgR0lDX1NQSSAyMDEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJPDA+LAkJCQkJ
CS8qIEVYVElfNTAgKi8KKwkJCQk8JmludGMgR0lDX1NQSSAyMDIgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkJPCZpbnRjIEdJQ19TUEkgMjAzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCTwm
aW50YyBHSUNfU1BJIDIwNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJfTsKKwogCQlpbnRjOiBp
bnRlcnJ1cHQtY29udHJvbGxlckA0YWMxMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImFybSxnaWMt
NDAwIjsKIAkJCXJlZyA9IDwweDRhYzEwMDAwIDB4MCAweDEwMDA+LAotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
