Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005FD13D61
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 16:57:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A329DC5A4CA;
	Mon, 12 Jan 2026 15:57:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC123C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 15:57:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CFbDWY3568059; Mon, 12 Jan 2026 16:56:49 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bm2kpvjfn-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 12 Jan 2026 16:56:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0nCbYChLISwayWIRNsPhAki7QlPiLRd4XhAqBYul40/BB37zXladktg2hSyGofhauNeFA5Md1rRi2dJVNCIUEStaoOV043TI1AQj2W4UDJjVF0AAoXKFIl1s5jO69b+//5wW1axMdxccqiE4fxE9knpSGG6bvex5wZwkVgRcv5bvl1/BlncySpf9a0QdFuGJzAXtUUniXtLqiq+P4MtkePsz2ZcpNOJENeIc7Qd1S0hmRHwYjcPUMAiDHrFGnFmhCgqWrdUyIrTCOhy3+Pm2Z66V0iqWkxi9Hxpe1zl2/3CigpB1EVicmyaiHhPdWO8tcMLqI6guPOcDC5Fuxs0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnlgiFJfv4qdn9WqcMN12KaRFXbVJYyNRztehNQsTkM=;
 b=S5AwLYkFlWFfzfku8NuTiYF3/PCSDpZ+l483A/cwrnE+2vbB8iaCaH3eSH+lYX6slyhktiG+2Ou76aqCugKv62v8hr17jlKg0Kj96v4o6h+z/GqOplzOYTlcsPZbUjw5J59MYtkEqCd6cp8tUil5FG8w6I2HwPxjd3QM1BK8vKrT9/8rFvmpJThZSBSz/iaZh4CJGsUqkqDe8ZCZICVAdy2uHAUzUg3s3D73wJmVu8uoxVZ8TX/jQ270yDa47JWebO5ChsySwYdz+A8imCLAr0Ffe8JP/kbzRtO+KWYgMqkOJvS3NOl3qo+3lwDKqDfgH4IhkmF0qt3QzA19t8dEdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnlgiFJfv4qdn9WqcMN12KaRFXbVJYyNRztehNQsTkM=;
 b=PHENBecPeSSYEqz68QmXccxSjUMwLQX5lzuGw1UK8tzFO+sriz8BqtD4A0eBffkWOgX1pWO/0yyWIohMT8GnrcMhSP5ryxjEWBEbJcon0E8s38iNUTh4wYf2A+OJQiW9EdCUrDgZMaU1pw32hGZFTcc+fD/0J4eOPwIfi4FFYrNN7jxz8NI+r6DI77ZjzeLR+HLAHdu0ph4dFqSrTi8UQvQjihspBi4HWDKqxGBZiEpDdj7hVQ/yIQbFQiKk97B+Va4i6ueobgg9z+HFXGlKW4r4irTMTp0bKVZABrrJvvKSaaz7duGj+Nf1of15gsFHMxLpEgWFdgjs4Wso011/9A==
Received: from AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11)
 by AM7PR10MB3720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:56:46 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::fb) by AM0PR10CA0031.outlook.office365.com
 (2603:10a6:20b:150::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 15:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 15:56:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 16:58:10 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 16:56:45 +0100
Message-ID: <36aadb47-7cea-47cc-8952-6eab14c925e8@foss.st.com>
Date: Mon, 12 Jan 2026 16:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linusw@kernel.org>, Jens Wiklander
 <jens.wiklander@linaro.org>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|AM7PR10MB3720:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f43b12-0111-4e5f-44d1-08de51f33070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUpQVXE3Y2dBS3JqRENVTWE1SFhJcFd0cm1HVlNXYU5WRDFmUFBFYWpWeEZq?=
 =?utf-8?B?RUNWdld5TXZ4M0ljVVdlMUxEU1M4Y2lCcUdLcG1FM09lMWtLcktaRXZ6cjRy?=
 =?utf-8?B?eVpSd2NlUVJzczlUQ09jQU05Y2Q3RkNLZ1hSUXo0Mi9PN25mdHNOM1M1ck11?=
 =?utf-8?B?d3lOZ25xTm43QVUrM0owbmN3c1Q5a1orY2FEQzJ2TklhcFk3THVEVHkvVXZm?=
 =?utf-8?B?bk5ablpTeVA1eUYwSENqQWdzL3RRaGVEamw4cnRWRmJ3eGI2NHpyYngxWUth?=
 =?utf-8?B?eDkyeHJRdUxLVk9vajFoWGY1dy95YytnT0NCSk53YkYxRnVQdkhadDRRZmQr?=
 =?utf-8?B?dW1BUm9sU0hQaFdNZkxkM0t5QWdocUxXSkFwTkxGdGJ6MFJicm55RGtJam55?=
 =?utf-8?B?M1pNVUttSllLSXJsdHR5V1ZWSGtWL2VONHY1Mzd1M3p6UEVpUFFOend2Nlky?=
 =?utf-8?B?bnQ4c0VINFNDajRaWDBIRXBCenJzRkFXOWZibXJEeFhnYjJxU0hDZ084L0VQ?=
 =?utf-8?B?QTUvMjA5QThyM0Z5dmlYcndXaFJGNGZteGVVZEN2dEJGOVFscjhFZjNUZCtM?=
 =?utf-8?B?RzFYTkRMTmlGdlZaOFBoSmFOMnA4c1FMMlgwMzdPODNyeUhtcytlN0czVXVn?=
 =?utf-8?B?dDAwWE9FbnBabVc2N0xabU9VbVZvTUQxNHZjZzZDaVJVOFdwKzJqaFZiR2Qw?=
 =?utf-8?B?bGdFRHlmV2tjUkVMOTAwSWlNUDVvUk9Ec0hzVm5PaGZVMk1tM3hlOVk1TTVu?=
 =?utf-8?B?Z25mQ2lPRGhMaXU5emEvZUhuR2k1emNpc1dRUy82TGI4cVJid3ZVUlRrbHky?=
 =?utf-8?B?SG5Va24zZ01EQ0hSaXp0QjhlV0JsS05iMkFPZitCSzk0cVJhNFJDQzRQYXNo?=
 =?utf-8?B?S1hUckRFNTcrSWtRSTZSaDZnbVBjR294V2tYZG1haFZjL0srR2RwL0YvM253?=
 =?utf-8?B?SnhoTnBSdlIrN0NkOEUxNGVIYThWOG9SYWRod0E5RlpSVEJjcGF5VEZaN0Fl?=
 =?utf-8?B?a1cyaVduazNaWHczTUp5NWU0WklIdnVFZk9nY3VQZkduZ3kvNytnY1I0am9i?=
 =?utf-8?B?TzIxYmE2RVBSeUtHSDN4M3RCV1hDbXYzT0hWNkp2OTlTNWVXWFNLYzh5dUxJ?=
 =?utf-8?B?UlJrUS9hWGpTRExoK1pLMUVBTUM0bWV0aXJqQ01IM25oejY4c0hZclpOVGNz?=
 =?utf-8?B?Qlg0ZHNFZTJCYkRacVZ0SzZHOW1zRjM2NWw5NXVGb3VlWGl4cFl5R1dPNTFT?=
 =?utf-8?B?cFVocDd0NitLNGM4NWYxNUtYbWl5dlhxTll3R3lBb0pQcE1EYnk2anZaR01P?=
 =?utf-8?B?Vi9ZZWtnMHFMRWVlWDYyb3QrYW12MzdHV3RiOWdwZDJISy9JaUl0cFVSQ1Vn?=
 =?utf-8?B?N3Q1NkhtNjJRYzd5aEtjekhzS0dvLzB5UnNYUE5WZVJxSDgwWHJWNXRzVVVD?=
 =?utf-8?B?Mkw0R2hwZHRrYXJLaWVVQWRYUTRFNHl3eUZGUkdxNE91ZDZXTS9Qd0Qyb3Fo?=
 =?utf-8?B?OFMwOGZ2QUVrUU1VYko5eHAyc1NFMjJLQ3FtUEhSRm5haFVIdys0N2J1UmNH?=
 =?utf-8?B?bzZaTDJCZnZIdk0vb1JtanBMYVdHZytTL1AyNkFaSzVLSzFSVVZvUk5GQklq?=
 =?utf-8?B?bjdqTFpQclJRLzVmYk9ORy9HRWFuNHk2eUdubVJ6Vy9KT2xHdWNlSWdtUlc2?=
 =?utf-8?B?ZWNpK3ZtMFl4ZHJKcjFzWnhFUFNROTZ5bVduWkx2RXNNNnJ4dDg1Zml1RTAx?=
 =?utf-8?B?WEJ0RnVQaS9QdTNQY0xDMFhKQkErdHlxZzNzS1krck5vZStFZzZqUmhSdUk1?=
 =?utf-8?B?MXlNSnBkSmpIMkd0TThYNWRZYjBTamZOYkF4K05zLzlmeGFPUENWa2xxUDNH?=
 =?utf-8?B?Q2thS0R6S1l1N2k2WDArdzk1cS9FNkYrVzE1RWNQMVljamM5aEZCUlUyeEtr?=
 =?utf-8?B?M1NwZ0dzWHhBck9jalVZNG15ZzgxR1h4RVFVQjJ4bENtMXJ5VllEeUdSWG1S?=
 =?utf-8?B?THIvVUdDZ2oyV3BieWU2b3Q3UnljajRjTkJpRHJESlU3ME1HcTJXRWlLWTZW?=
 =?utf-8?B?TFN4aXhrV0YxTW03RjUvbmszK2J6dlA4dnR1amxyZjkyQU91Q2lWWTdvUmhs?=
 =?utf-8?Q?L9gQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:56:46.3888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f43b12-0111-4e5f-44d1-08de51f33070
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3720
X-Proofpoint-GUID: NsIHp8Qwf3AhQcV5zGOSiy9IYN6QuQ6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEzMCBTYWx0ZWRfX3UMLFWXJxPsR
 RdG6vMbO3cpG85cbf8+jczVHXDwyP5y756b9TSjmZrDLy5c5YFm2lWaSsQJBTz4fizKQYjRVjBo
 EEoaF52z8+gIGvtesj0t2ohfc2qRY/q555cI4JIlu9IOJ8mJbKnSF1YLD/mHlfKiRzh2Koxi3j3
 OeWI2OmK8Tden2pt6++kbKoJaq20aI+ZlcxGmY2B9Jv9zXbWtMM0/+nzt8NmuLERYROLU8WeHJi
 eooY3W1sNvK+5yNeNvai5ZSxXKX/vBI5Y9lixTHiyiOr/YIq9lGenMqz/AOocRRlqscjc9l25Ge
 81Wq+ywZL5znfwC2CQ/sghNSuk4NJxEVf11HKh3piH1E/7rD2CCKNBP5szbl1UeiWCr1INBKSwt
 1olkuYQWjgfwiOhSkQatZ23kLLDkj4ve/sCqtO6PCA/Q30jFfRffyWj0bPydXXeReBxa4wGEau7
 6Weqm9PAcFgIFsa0MJA==
X-Proofpoint-ORIG-GUID: NsIHp8Qwf3AhQcV5zGOSiy9IYN6QuQ6l
X-Authority-Analysis: v=2.4 cv=BZTVE7t2 c=1 sm=1 tr=0 ts=696519c1 cx=c_pps
 a=XdU98ikZCVsoVlHqIUyARA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=F9KKovqh_Fmp6Uur3D8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120130
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 00/11] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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

CgpPbiAxLzEwLzI2IDAwOjEwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIEdhdGllbiwKPiAK
PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ggc2VyaWVzIQo+IAo+IE9uIEZyaSwgSmFuIDksIDIwMjYg
YXQgMTE6NTbigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo+IDxnYXRpZW4uY2hldmFsbGllckBmb3Nz
LnN0LmNvbT4gd3JvdGU6Cj4gCj4+IFN0bTMyIFNvQ3MgZW1iZWQgZGVidWcgcGVyaXBoZXJhbHMg
c3VjaCBhcyBDb3Jlc2lnaHQuIFRoZXNlIHBlcmlwaGVyYWxzCj4+IGNhbiBtb25pdG9yIHRoZSBh
Y3Rpdml0eSBvZiB0aGUgY29yZXMuIEJlY2F1c2Ugb2YgdGhhdCwgdGhleSBjYW4gYmUKPj4gdXNl
ZCBvbmx5IGlmIHNvbWUgZmVhdHVyZXMgaW4gdGhlIGRlYnVnIGNvbmZpZ3VyYXRpb24gYXJlIGVu
YWJsZWQuCj4+IEVsc2UsIGVycm9ycyBvciBmaXJld2FsbCBleGNlcHRpb25zIGNhbiBiZSBvYnNl
cnZlZC4gU2ltaWxhcmx5IHRvCj4+IHRoZSBFVFpQQyhvbiBzdG0zMm1wMXggcGxhdGZvcm1zKSBv
ciB0aGUgUklGU0Mob24gc3RtMzJtcDJ4IHBsYXRmb3JtcyksCj4+IGRlYnVnLXJlbGF0ZWQgcGVy
aXBoZXJhbHMgYWNjZXNzIGNhbiBiZSBhc3Nlc3NlZCBhdCBidXMgbGV2ZWwgdG8KPj4gcHJldmVu
dCB0aGVzZSBpc3N1ZXMgZnJvbSBoYXBwZW5pbmcuCj4+Cj4+IFRoZSBkZWJ1ZyBjb25maWd1cmF0
aW9uIGNhbiBvbmx5IGJlIGFjY2Vzc2VkIGJ5IHRoZSBzZWN1cmUgd29ybGQuCj4+IFRoYXQgbWVh
bnMgdGhhdCBhIHNlcnZpY2UgbXVzdCBiZSBpbXBsZW1lbnRlZCBpbiB0aGUgc2VjdXJlIHdvcmxk
IGZvcgo+PiB0aGUga2VybmVsIHRvIGNoZWNrIHRoZSBmaXJld2FsbCBjb25maWd1cmF0aW9uLiBP
biBPcGVuU1RMaW51eCwgaXQgaXMKPj4gZG9uZSB0aHJvdWdoIGEgRGVidWcgYWNjZXNzIFBUQSBp
biBPUC1URUUgWzFdLgo+PiBUbyByZXByZXNlbnQgdGhlIGRlYnVnIHBlcmlwaGVyYWxzIHByZXNl
bnQgb24gYSBkZWRpY2F0ZWQgZGVidWcgYnVzLAo+PiBjcmVhdGUgYSBkZWJ1ZyBidXMgbm9kZSBp
biB0aGUgZGV2aWNlIHRyZWUgYW5kIHRoZSBhc3NvY2lhdGVkIGRyaXZlcgo+PiB0aGF0IHdpbGwg
aW50ZXJhY3Qgd2l0aCB0aGlzIFBUQS4KPj4KPj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vT1At
VEVFL29wdGVlX29zL3B1bGwvNzY3Mwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFs
bGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4gCj4gSSB0aGluayBKZW5zIFdp
a2xhbmRlciB3YW50cyB0byBoYXZlIGEgbG9vayBhdCB0aGlzIHBhcnRjaAo+IHNlcmllcywgc28g
YWRkZWQgaGltIHRvIHRoZSBUbzouCj4gCj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoKSGkgTGlu
dXMsCgpTdXJlLCBJJ2xsIGtlZXAgdGhlIFRvLiBhZGRpdGlvbiBmb3IgVjIsIHRoYW5rIHlvdS4K
CkJlc3QgcmVnYXJkcywKR2F0aWVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
