Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD03C5C51A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 10:39:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D697C628D4;
	Fri, 14 Nov 2025 09:39:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AF6BC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 09:39:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE9ESiF1874939; Fri, 14 Nov 2025 10:39:08 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011015.outbound.protection.outlook.com
 [40.107.130.15])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pa94y-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 10:39:08 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE4LhXc8Be90VSv6m0LJgepAKF43MogsfZX1w3vKn4Vvynbrkeh9callYsonu05U9i4U+1D0OhQUCmAhcrRyBcrFJAmySGExnEg1xRVrKSdzecXxxVf+u3CGTRDLMa4HGF7aulT00kjeBlGLcU3LzCrY9ViNoeYp2hnpLma6viqm9k4XTTUOdl4gklcfrMtW4JV7mNQD1D93VUTtpwP44EqOilIHaCDq+G1QRjzCJBU2OKN78li3Xa0EJkW45WCfTulxnxH7XmZ8ZqzDxCRDntQZthRD/tcagOsYej/GP2jDS362pZVdqsE51o82KNCeYK303DoL6dcBMspC5jjIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHTrIA/ZZhz+Ue+PTBDziXRfTQLjO5Bl47i4ax8PxhE=;
 b=jv3v7jjU/9xEeSTICFM89K/+nINUjlBsA9TAHviyB6sd8DEkeK32CM3NQTHZK8L3cF9DKiJ/abVexPasuRu03N221r2oZcVj0j4IMooknV6x5oEQm42YQAvRUVocNaWd93NXrsQKPaByAMOgYCmmVDJcm5hPZlqmAeb0vth6RpDO2OXwdZEe5oyClG/vmWVbHhFP2tkshjTiPc0jHZx9uhxHNJSo8ri/b8+1cXI7qoZKajlLRWXxVFUhrY5pHNMJ+pz+wORyYp8Cr67cmpxP0I6snty0NdrseSd76tzCzb/p9/CEeJM1cd48F9BBkz1E2hHNtM0BF7ZKQ3rvjazahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHTrIA/ZZhz+Ue+PTBDziXRfTQLjO5Bl47i4ax8PxhE=;
 b=cwdiEFfN3jRYmL3EuVIEAp8vM5scv9dk/pcybUKIGfpoMUJkI2fIC39+sXX25PTD7z9fnV0EuZBwfqAOM/+FMx16+u4ZtMKHEgoMqhQkjM3DawiEbSsTzGOQCXGnJ531M4nBqo8kaCkUKf7j/Me3/tzQLB24HLP4v8RB6CAlY1CSmOIJPBGJibVUcxN/+uh/3b4dZ083md86G8g0vpgh+x2xIxboD1i7mhhysbmsDI1MXKrTojigChBpQiD5rYPT5pEu1d2j9c9jw74gSXfYBOLVmTZryzGr3U7bkLKn0Qjaf8/caMQr84z843AG3Tw0E6BJn9kZarUvL196IwtqeQ==
Received: from AS4P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::13)
 by VI0PR10MB9217.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:39:05 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::b8) by AS4P191CA0022.outlook.office365.com
 (2603:10a6:20b:5d9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 09:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 09:39:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 10:37:34 +0100
Received: from [10.130.77.120] (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 10:37:21 +0100
Message-ID: <ba695c7d-32fa-4412-9029-26d9a0e73b11@foss.st.com>
Date: Fri, 14 Nov 2025 10:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251112085620.1452826-1-andriy.shevchenko@linux.intel.com>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20251112085620.1452826-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|VI0PR10MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b8f2e2-9a1f-41a8-cba4-08de2361a644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dldvZjVMdnNLbkxpWDRaVllXbGxMOEdMdnlNQjNkdmxiYUxOQ3pvTFp2TTIx?=
 =?utf-8?B?SFQ5NlRxSG9hOHJHSW4vblgrdXZubHNDQXo4UCt4QmhSTXlGV0ZPK2RxN1U3?=
 =?utf-8?B?dlRNZk9yTXVwM1VxOC9lM3BYSXc2N1gybnZ4R3hJVmFiMHNDd0hXNE9BWS9o?=
 =?utf-8?B?SENYblVBaXkrZ2VhbVZpb0V3Z0hqblNEdERpZGRvRGtjSFJxaXkzN21UR256?=
 =?utf-8?B?bGh2cis5a21hdDc1N1ViSExQY2R3SFBFenc4V2hybzNQYmhjZUM5cnppQ1M5?=
 =?utf-8?B?elF3b0RQWUk3aUV3YmdNTmdVYzBLZWJrWTFGbk1lb0F4RXJ5VFZGckJUZDEy?=
 =?utf-8?B?ZjZJN3Y5UjNEcVI5bEkycDBZZEV2WDdoMHcvREtxeTJpSEhsRElsV2JJcEsy?=
 =?utf-8?B?ZXV1bUFsNFM1MUtlUE1ta3VIR0x5QmNYWVVjVTJ0WnhyNkV3WUYveDI1NHFC?=
 =?utf-8?B?L1VyeU82OWdOUUV0ekY1Z01CejBvSWx4Wm13Snp4bEdwNHhqekloeitUTitu?=
 =?utf-8?B?RTcvWS9OSjZ5SUdobEVVUlVaMzd6WnV0L2tpN045YUlhNjJuS3M5VU9FRXA5?=
 =?utf-8?B?UFhNRDBLWUs1UTJCZEx3YkF3MmRDTzY1NzdneDdBZmpOS0ZUVjYvSnFMU3Av?=
 =?utf-8?B?OWErRk5vQ0lQQzlXMURtbHBTREJVWTg0UXg5WWpWaG5YeWtJZjA4TWZkRGl3?=
 =?utf-8?B?R2pHQkdBN052TFhwN2ZJT2JWMXRkSnVCamFqWjhtbHc3VlFJWHhLV1pnRjF6?=
 =?utf-8?B?eFArNEpDK3V3R09aaXpMTTcrdU1keUIvdGNHRVhZQ1VRUzlzUWJKTVVKenlC?=
 =?utf-8?B?d3hFTWxzaWlFdElFcWxLU0tMYk5DNnBvV0ZVS1FPQXQ3STdxOWJlbndYZzFX?=
 =?utf-8?B?YWxSQkdYemY1WG1wNGhJdVNxazAramJUazVWQ01nSlhlWEMyeFNDaE4yKzNW?=
 =?utf-8?B?aHkvY3BDa2hoaHFwRUxwNXduQktzMXdIU3MvcXM3OUlkV0NlclkxK3pMRVVa?=
 =?utf-8?B?OUM1L2t5VjBtS3VrRUJKY0Uxd1FkRGpVelZiVk9MeGVFWEsxUGlhMmVsQitD?=
 =?utf-8?B?Z1hGVkpKTWVXNktCK3dtT1RoWloyb0JIYnR6WFZCL0FpSW52Tm1yLzNSUkgy?=
 =?utf-8?B?WnlJemxNZXRYbk90NlF5MEJ6WHV0UHlNZGJhbUp3UFlwU0ZGY1N4Y3dvVE1w?=
 =?utf-8?B?NGhoZUJpbEpScVFGU3l2MS9wZUF2Y0laR1hDTnRQSUxwKzloa2hyZmZDKzBq?=
 =?utf-8?B?aG9DUkdBZjNxa3RSWDhwZmlxNmJwaEwxR2ZCcm9pa0p0S3ljb3NoZmpJUzVH?=
 =?utf-8?B?YXRCazBObTdvWndPTUxlVVhWYXd2L1kvVERaOTZPT0FoejlBdFhCc0FFOVdU?=
 =?utf-8?B?TE44N1JyZ1ZuOFlpcllEMW5kNkZmQlRnMUdlWVBDeS9lejZmam9tK1NlL2FZ?=
 =?utf-8?B?a3crdUVhZHI0WE1MYmREb2RldUR5WWM1bHpUdWYvVVlHeXVmdnQ2cjFrV3hJ?=
 =?utf-8?B?d21UVFRzeng2aEhkLy9pZnpYNXk5NFRaVWJTcmNZVmlDaHpSYUFCbUxXRVFJ?=
 =?utf-8?B?OTZJK0tITEJCclBXMTdMWUR1R2N4VXJFZnZvaktmME50Njk5TW9RRGc0YVl3?=
 =?utf-8?B?cFhKV1cxbWhOS0N3cVN2V3RCbUcyOGFwOUlURmNPR0YvVXpCcmE2RFIwQ3pM?=
 =?utf-8?B?c2lzaVpwaUt0V3hhbEJUbHFmN1AzSW9vdURxOXRpZExBdW1IZTdTNHN3dWhY?=
 =?utf-8?B?L3o3RFY1KzV3T1BocDY1VXdRYWZoWlRaK3N2OHgzL0dOQ3RGWGdIMGx6SEh1?=
 =?utf-8?B?VjRyQ0xvWFA3Sk5BdVF1R0JXK0hXekg3NXZwaHRwbXJmM050UUM4MHpqYkNK?=
 =?utf-8?B?ODF6d3RhaHBWUmVEOHFFbEwvVERiQ1RHakpBNzFqTUFObzRLT0xOR0VVbi9u?=
 =?utf-8?B?RnZtUTF4NWtBVXRpODlCNk1GTktOY2tmcVdEb21lSElXQlpuL2hKRFdYMEZm?=
 =?utf-8?B?VWVIUmtyVmdOTm5uTWtkMGFveitaSlpHbWQ5RitQTXU4aUwwVHBMNENtV0F5?=
 =?utf-8?B?MFhKTDBtdDkvRFlpOUxkMFNMOFNic3FHUmMxbGlqSXdzL2hCVnVFMFFVWUhx?=
 =?utf-8?Q?15nA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:39:04.0783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b8f2e2-9a1f-41a8-cba4-08de2361a644
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9217
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA3NiBTYWx0ZWRfX8eXVla5eh7v2
 fhog8TagOSRqSxdzawWrqicR9WFg5J+XelM8Uz+mFKNSf0DYQ3us5wLCtwrxhng0Zuz8tLtn/+9
 nDSaRbrYuEI1ehRXOqpV/dqtDK3aABYcY4yNvNCGQdN6zVGduL1L7VRMyjtUK3ou2RmeVOoJiXU
 m3nemjpIvzJfhH7Ngjewk8Gs7ivDNbEk1DCgrVkHkvMfYAQ/RE6hOV/wY2MkvA+/yyKXpHKXq2y
 Cqw4+uYU1xSEK33/liWdRuxV0oTcUeGr1W1acOCx0NvbsIp5NfKQQBTLUr9WJffshAz5KqUoDPM
 gdrWvbwgZBaRGcGXQovnIXRAUPwg/ppAefIEEBZk+nTXHFNXJGFGhS8t/3Wex7xSbvhDOGtpNGe
 99lRaTWgy5KnsuCIVOgqWvtXX6ytEg==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=6916f8bc cx=c_pps
 a=BZvBpOJ3R6NwyQWCxJuAzg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RA8ZoFPxCIQA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=X7L7FT1YXr2pfEN7NscA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: 63urpa-oYLNSOuFfXw_m2QZ6F-BZ6N73
X-Proofpoint-GUID: 63urpa-oYLNSOuFfXw_m2QZ6F-BZ6N73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140076
Cc: Rob Herring <robh@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/1] PCI: stm32-ep: Don't use "proxy"
	headers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

On 11/12/25 09:56, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> In this case replace of_gpio.h, which is subject to remove by the GPIOLIB
> subsystem, with the respective headers that are being used by the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pci/controller/dwc/pcie-stm32-ep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> index 3400c7cd2d88..2b9b451306fc 100644
> --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> @@ -7,9 +7,9 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/of_platform.h>
> -#include <linux/of_gpio.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>

<linux/gpio/consumer.h> is already included from pcie-designware.h

However, if it is still required for IWYU, could you kindly include it 
in pcie-stm32.c as well while you are working on it?

Thank you very much

Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
