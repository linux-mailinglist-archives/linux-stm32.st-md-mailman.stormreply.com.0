Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLIvOIdQc2kDuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:42:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B027474C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:42:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 445DCC8F26A;
	Fri, 23 Jan 2026 10:42:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED904C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 10:42:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NAXUuO2700580; Fri, 23 Jan 2026 11:42:02 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bv3yp10te-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 23 Jan 2026 11:42:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAcMo4+hHUkCaTJln5pE0gbSu/8cFzpmmpaPgxwM/E+o0AhHNYPYy4UxtF39AqNOA9gECYTHjG9h+bWofpB8vAsHASF42fb9kuO+0uvfRfu2tUJGyT7sPVa002cV3/aWPQxHb4UDRzWRZPBiiZ6zWJJDB6YIG0OA0UO/+NlBP6VOi1d88RoDpOe0e/Q9xkv7ANm5rXjgBPvfs79kjJrl8eWBpyQHlkzT7hqyrnCNl03NTbk9b/AgNxL17psjeZWtHoAjAs0cRC/BTY4WF56CpN5drVoqRGtNJj2mI6ERV399g+WYSr4KQ//qBxp0EdMG35/xuGLbPLKJfBINRcpwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=GafoV3QRndRdWIASVyCb8fQJ/Ihn5xAOsTbgOe4cspl1yD9RBGAs0DzCUwJWkamVj6m8QoNNDfnsDKRuSahU0hO6p+IgjbFL8v+sIlb2kREjF3r7RFC7bmrGRXYiOD54r/lCpl/0HJo0c4kPNQLfbfPWZVGLD5IFR2tqx6OOIhUVVudc7rLrV8+2xFS4oDsb9/HodZ/IhWggBhJl5FVBWntaf7U9oheuSdPt5xTX6sGiedwVUuMeYR/TOMrUyFXFTIdVsJzjEe6hESrN/4kY3gfTKY+5z3uxLK3O486RS79Bw9ooZPtcwUzx/LOD84RrVG5xZDy0x0SbMA+Y1X12pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=aPsWXaReNtPR12sywbwcCUwmlgMqtj6c/aZVETyiWYifmq5gfo/+QO6u54dDRG5jyXDyiarLl6CP8xqQJDM0Wr1IjhcClAd9pGTQDFbCfteLqR4ery0lBmZcM7TtFY15DNwauoQiidRhlwtU27i5Uqp9PYiHNUPZBVsxsmjtHBeW3yFpvhwk4CapW1GNH0+QvtjIhIokewYBIj510MRCFdS+LIjs5PD5VeazKgPQvujJx+xBbR7evib6x6dXsM3KlarG9ww29A++MasgM8DzA7PAHO9ZEq3WytLl7cNI009t5ehpxMAqFZh3G4YoCXWQ9Pp/HspJyrP4YPuhmpFKkQ==
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by AS8PR10MB6970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:42:00 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::93) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:41:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:43:26 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:41:54 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 23 Jan 2026 11:39:09 +0100
MIME-Version: 1.0
Message-ID: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <jens.wiklander@linaro.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AS8PR10MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: a34c05eb-b494-4efe-d778-08de5a6c0967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnFYWUtQUExSdnZpUUhnMVlBQk9ldGl3emlqRXllYnV6SjFTRTlRUWtWWDI2?=
 =?utf-8?B?bUNLRmVZWUxMR0J1WmhvbnNZUVk1MnhSYjRhRHlxTk54d2IwcFRzcUJrZmtj?=
 =?utf-8?B?MUZIczlLRi9ucnVsQkxxbHhTdkY4MVF3L1Y1VVBnY2pNK0xTTUsxZlRvYk5W?=
 =?utf-8?B?RHQ0YVlUYndnaDFVY0htQVZ5SDFldGRTeDk1MVhkMS9LYkcxcm14a3JHQS9h?=
 =?utf-8?B?MXVwL25FUmpIaVA4M05FUW10UVJaUnE2cmZNbDFyQVN3cUY5eCtCR1IyMTZF?=
 =?utf-8?B?SXdyTGlLclcwYXdMYTFlRU5ScFZWYjBVMnpLQVQ2WWRRTmVCZHMwK3dYYlR4?=
 =?utf-8?B?akZxU1ZvQytTRzlYL0hnWGJGemV4bTF0cHNTdjhtWGdkLzh1Y1d2T0EzdTlN?=
 =?utf-8?B?TkxhVThmeWYxZ1pSOGtTNVpqcWdrOGFuQk91Q0JuM2FUVUIzZlhQV0R6b1c3?=
 =?utf-8?B?NVZKdlJTQ0JJODE0dFFoanlKVEdNNDlIM2ZJSTR4aG1ZQ0ZxODJ2TDNVMG9X?=
 =?utf-8?B?TnBhejkzNzVycDYvWWc4SnFGWHdSRlpXNnEvK1pETXRJbzV5ekwzRWFYcGJu?=
 =?utf-8?B?WDN6V3B0L0pYT3JtZUN4NHZjeW1UZmJZV2pwd09YZGhWYk5NUkdYNStyUk9k?=
 =?utf-8?B?ZXE4VHVUUlpXdVlqc0Q1ZWkxdmxaU1JPSXBGdm5RcUZ5MEYwYlVKd25udVIv?=
 =?utf-8?B?M3VNSlBDUUhkd1pGcUdobjZZOUtqK0hIWDh2eEo3UmJ3YlBtZGhJZDdTVmNu?=
 =?utf-8?B?clAzRUh2dFdEU2g5bFJiVGRKSWIzS2RtakdSQXdrdFVveXlHbndFQnZjL3hk?=
 =?utf-8?B?TTFIZFRaQUhkVVBCLytUajh5aHVneWVGWDgwYlQ2TzZVN3lWb2k4TTVCYTVm?=
 =?utf-8?B?ZFg1RnY3SWhsamN2Y2lZU2J4ZEVZd3Y2THNsdWtyQzlNUGJRQ3lFcFc2Y1M1?=
 =?utf-8?B?R1E3K1lLM3dkeHV5ZUNvWmhFQ01wZHpqempaRHZ2Q0NYblprc0tXcXNsRFZ6?=
 =?utf-8?B?aUtMdERvRlBFdTh4aG8wV0FSQjEwbTUzY05PV2QrRy9yM3lJZlpHTis5TlRI?=
 =?utf-8?B?NTRTaWRDVVVyUVhJdFlNNGVTaXpoK0piL096QUFBVU1qL0dMMXVGVUFXVXFK?=
 =?utf-8?B?Mnk1ZDRRekJSTG10TXRjbmVla2FYTlRuRVlkeHhONkZrdFJRZzNiZ2pyUm1a?=
 =?utf-8?B?bExIT2JodndsR2dlUy9kSndUNVBZY1dOREQvZTk3KzgvbDhndEw3OVF3cVZq?=
 =?utf-8?B?NHNyWVpVWVFzMTZZdG1PV1BKUWwwNkIrRzF3U2xDYzFmL2tnWVVQbHlzemhX?=
 =?utf-8?B?cmdLdzlvVy9DcklkZ0Y3R2ltVldza2xHTHlWbjB3YW8yWGdwV1dNRE84Uk81?=
 =?utf-8?B?Y1pMMTdDL0tDUzZITmRGWUxoUEVvNU15MG9hc25lTmxJc1FKaVFXdXlsbHlz?=
 =?utf-8?B?SnRZZlJQVUtVbm5hcDZaVEMyNjllK3RzbllJdkVCR1JUYVdaU2MwMnF0YnJ3?=
 =?utf-8?B?YXVYdm5vMFFIWmVkM3NGSElDMHpzOUFRVlNBcyt0ZkVMa3RPdWQ5OEdOc0I4?=
 =?utf-8?B?Vmk1V2owcDlQdElyUFMvUkdDZEQrNzc5YzVoZGJ0RnI1cDlpYUMyWENVOFRM?=
 =?utf-8?B?N2pnZmZBL1NVSDNGMUxTOXUvREhLcGFUVVNqTUZtU2N1bXZsTVlUTTdBOUIy?=
 =?utf-8?B?UEVaTDE3MnA5QWo3eVJIbDdvS2RJQ2cxQVp1dStyQWNsMytYUS8rOXJMM0xn?=
 =?utf-8?B?YVJMOUZMd2xBWVdrUXgxZGRYK2dkL29qa0VKZDQxc1RQTVRRdnlLOURtNy93?=
 =?utf-8?B?ZjM4RjRHc3AxK3ZraUVRZjl0YWZ3VnZFOFZqcnRXZlQ2TURNUHByWnM5SkNo?=
 =?utf-8?B?Wmo3cy8xclliY3RSbERJc3lPYnBSa2JzckpseVVmRmJKOHZPc2hIT2pBdVNL?=
 =?utf-8?B?ektYWVZCaXA3anVMdEVQLzI1ZGZVWUd5RWYzRVdaVlJMV2tiRFlMS0FiRW0w?=
 =?utf-8?B?dlppc0s5ZEVVYVI2MEovREZNVkxjdHZPeSs5S3AzUmpJL3hGYVU2VXZsSmZ0?=
 =?utf-8?B?L0RUanhuTmkrMzI0L2lIb1RvWjdoZzlLSXpUZVZlaVdld0hraWgvVUdUYTlJ?=
 =?utf-8?B?M3BTVXF5WUd6Qzd4WUxEMysxTEFNaUFuTytqTzRXQi8zVUNuS3E4VkNsMWo0?=
 =?utf-8?B?YkNXMkJEU1huZ0Y0TEtONXRoU0dLaFREbXlGSmFLbHZWQUFlRG9XV2hXRmVv?=
 =?utf-8?Q?YIl3BhzWSq+eikjJhU5WOQGw7r/IzVqlYst78RsOIU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:41:59.2857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34c05eb-b494-4efe-d778-08de5a6c0967
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6970
X-Authority-Analysis: v=2.4 cv=DLiCIiNb c=1 sm=1 tr=0 ts=69735079 cx=c_pps
 a=q3CUEi5PZ8FXU+N3jHbiIQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 5wtEQKNc7ZE4nRtI4rfS7JhlLNjpT6kj
X-Proofpoint-ORIG-GUID: 5wtEQKNc7ZE4nRtI4rfS7JhlLNjpT6kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NSBTYWx0ZWRfX/lCFw9xUYmMP
 lN3R1I2ttAZQCkpRscOz+6+ZwOChAkUB7WWr+a9Z42axeYmU2/xsIYF3Kos27csTi+AUkd/syrn
 9oKyi6YRicUpKeE2NdlEE3hgYXs4srGp+LhR4uHHllZ0Gbek7YY7boyyeGGpxa0mgTSy/28hLPR
 92m2OEpyzcHIQy6WzQSrVW83oAyDsabydi1MPIiwuvbrmlAu7c/mhydffnmlErHN5tjwOHRz/tA
 l8KU/UwzB5ofb/suxddH5Ut3aFW03pq189Npkf4hmTESaqmwh50RQR0xxYpkiDXKxRtvmiwaSnD
 SiPTJOIwuAgLNs+DJLMPF0MmtDqnrI1EwGrU0noy8r0J3JsEJym8Oi8kYf/qO/ORsdSXARBlm/E
 HHzoFptTqfiwBPsBdkY81hYO94VBKDaVFn9NSQkd5WHgGZnHaTet4p3ZY2URFyx/qCEZ51Qkb0g
 4cX0SOIhTUVagvAHnxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230085
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 12/12] pinctrl: stm32: add firewall checks
 before probing the HDP driver
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 85B027474C
X-Rspamd-Action: no action

QmVjYXVzZSB0aGUgSERQIHBlcmlwaGVyYWwgYm90aCBkZXBlbmRzIG9uIGRlYnVnIGFuZCBmaXJl
d2FsbApjb25maWd1cmF0aW9uLCB3aGVuIENPTkZJR19TVE0zMl9GSVJFV0FMTCBpcyBwcmVzZW50
LCB1c2UgdGhlCnN0bTMyIGZpcmV3YWxsIGZyYW1ld29yayB0byBiZSBhYmxlIHRvIGNoZWNrIHRo
ZXNlIGNvbmZpZ3VyYXRpb24gYWdhaW5zdAp0aGUgcmVsZXZhbnQgY29udHJvbGxlcnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5j
b20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgfCAxNCAr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYyBiL2RyaXZlcnMv
cGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCmluZGV4IDBiMWRmZjAxZTA0Yy4uY2Nl
NDc3ZTg2ZWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0z
Mi1oZHAuYworKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYwpA
QCAtNCw2ICs0LDcgQEAKICAqIEF1dGhvcjogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50Lmxl
Z29mZmljQGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgogICovCiAjaW5jbHVk
ZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZl
ci5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vZ2VuZXJpYy5oPgpAQCAtNDYsOSArNDcsMTEgQEAg
c3RydWN0IHN0bTMyX2hkcCB7CiAJdm9pZCBfX2lvbWVtICpiYXNlOwogCXN0cnVjdCBjbGsgKmNs
azsKIAlzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxfZGV2OworCXN0cnVjdCBzdG0zMl9maXJld2Fs
bCAqZmlyZXdhbGw7CiAJc3RydWN0IGdwaW9fZ2VuZXJpY19jaGlwIGdwaW9fY2hpcDsKIAl1MzIg
bXV4X2NvbmY7CiAJdTMyIGdwb3NldF9jb25mOworCWludCBuYl9maXJld2FsbF9lbnRyaWVzOwog
CWNvbnN0IGNoYXIgKiBjb25zdCAqZnVuY19uYW1lOwogfTsKIApAQCAtNjE1LDYgKzYxOCwxMyBA
QCBzdGF0aWMgaW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQlyZXR1cm4gLUVOT01FTTsKIAloZHAtPmRldiA9IGRldjsKIAorCWlmIChJU19FTkFCTEVE
KENPTkZJR19TVE0zMl9GSVJFV0FMTCkpIHsKKwkJZXJyID0gc3RtMzJfZmlyZXdhbGxfZ2V0X2dy
YW50X2FsbF9hY2Nlc3MoZGV2LCAmaGRwLT5maXJld2FsbCwKKwkJCQkJCQkgICZoZHAtPm5iX2Zp
cmV3YWxsX2VudHJpZXMpOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwl9CisKIAlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoZHApOwogCiAJaGRwLT5iYXNlID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwpAQCAtNjcwLDggKzY4MCwxMiBAQCBzdGF0aWMg
aW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGlj
IHZvaWQgc3RtMzJfaGRwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCWlu
dCBpOwogCiAJd3JpdGVsX3JlbGF4ZWQoSERQX0NUUkxfRElTQUJMRSwgaGRwLT5iYXNlICsgSERQ
X0NUUkwpOworCisJZm9yIChpID0gMDsgaSA8IGhkcC0+bmJfZmlyZXdhbGxfZW50cmllczsgaSsr
KQorCQlzdG0zMl9maXJld2FsbF9yZWxlYXNlX2FjY2VzcygmaGRwLT5maXJld2FsbFtpXSk7CiB9
CiAKIHN0YXRpYyBpbnQgc3RtMzJfaGRwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoKLS0g
CjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
