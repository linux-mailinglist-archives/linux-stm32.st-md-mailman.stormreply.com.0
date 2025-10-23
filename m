Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FCBFF01D
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 05:31:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E19A4C5E2DB;
	Thu, 23 Oct 2025 03:31:34 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EDF2C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 03:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqKPi7X+wmq1gA3Y3WDAY3k+XGIaBNedg1AhGanN71WgIKiMw9srhwUH6jMEED/vf8oLHGjlmyfZ77HnNTo+DoKFn/DYoaOjIXlqKTfS9X4JIoVL1KeZbci39u1QD9VFRiincvzD/BEaeacH+5mkjHpqwJUTVgWB9OVfdgnPsuHaDl44r6PvVj7M2v98nqns6m3CC01skF8Gg9c2pvXM9n9FZL9NgFaMB8cIT3VTDpC9x1+YEi9jSIUN+OGu0WTcpnoLP2eSfgx3a6coOUcnnhbLEi2jACEgzJQ9gQz9jdcB3UdNBaDTnPlCQib0K6vMmY3jfgGpvTaw0dvmqOAtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCugp7k54e6K/4m2bHsd2jUY0f/rei0AMeohtcq527s=;
 b=EK17JHf41KjF5QeLlSgPgnUC7qk7UnFuEOOVixNHtmAtimPwCItBxdA5novYr23kfSkCVLig0m7zsospIVjFP3/kbLWH/HgRqyHNgDxYz/xea94ewKfv50YnNIgkf74BIv7eaRQ2ygQxTAAlI6oNF1Uc3zZq4xpoEOrxA8IK/vqepFSI+idkAy/Rj5PGjytDfGzWbE3oiNX1t+Efp05yDIbtS5vC0/iwy68qAx4jZ5icwoVDbXUyjjslkrcNpaUi3IZt/trOpWZCmHJgX3Cl7jZz8Uq4bRV5yupWcIK1P9mxWulkaQdDMY+YsmEI0/PTo83r9v2yqRc4j9UsAVy4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCugp7k54e6K/4m2bHsd2jUY0f/rei0AMeohtcq527s=;
 b=vM1trSYFKCZiHDImPaAswTO7o9SfxutpcVL/MjlYaONbmCs8VVBhqi/l0dJ/Nzd6ZckeOsLu7J+Dp0J5dmXu7BkpF4Fdn+iez7cIlLXJS6gS94RltE44c8lJLEUEdEYWBE1Zwu5GjnrKuFUyM+LhWOEOnsWsu2WsNX2ba0x6HEvHpqoL/jXNSxcQ3ccRklZG3DL4/VQDyOjVZsrwU2hz2uAKZroFYmbLVGq4yw2eZYYN5/lArdHSp+isKRWj2iPUxrlL/JtItM4OGDWnba4YrVqqD7bnNM2gGPjGD6Z0tDvR0dKkn4mdvSppkYyT1fjeADg4QGqcaLc5vO4qCyYdmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by CH2PR03MB5320.namprd03.prod.outlook.com (2603:10b6:610:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 03:31:30 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9228.014; Thu, 23 Oct 2025
 03:31:30 +0000
Message-ID: <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
Date: Thu, 23 Oct 2025 09:01:20 +0530
User-Agent: Mozilla Thunderbird
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
 <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
 <e45a8124-ace8-40bf-b55f-56dc8fbe6987@altera.com>
Content-Language: en-US
In-Reply-To: <e45a8124-ace8-40bf-b55f-56dc8fbe6987@altera.com>
X-ClientProxiedBy: MA5P287CA0215.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::8) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|CH2PR03MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 46510bcf-1cb1-49d7-22fc-08de11e4a7e9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUYrL0R4R0RtcUd6dkVIeEFVRVNtZTA0V1daaHovanlQR0FaUVJHbndOZFpG?=
 =?utf-8?B?YmJPVzFFaVc4TVlPWi9BcXdZNi9XRGF5OEVjNlFzZmFmVzZxMjhVWFZVa1Vy?=
 =?utf-8?B?U29VK25xdExCWis3N2V6enFzV3E1Q1FLL3VsaVRwRlJNZVI2WVJrcS9UT3ZN?=
 =?utf-8?B?eGEyeVcrczVsdE1FckpvUVV1b2dTUTZ3VGUvUUY5NGQrMjI0MlJTUjAvRkVV?=
 =?utf-8?B?WkU4Q29EckdWNVk1K0N3TUFINE4ydGEvaXMxdE5MSnJaWExvejFxV1R6VUgz?=
 =?utf-8?B?VCs5RGpGZ2xVcGhLd3pUdkV0ajJQaGxnU2RUMkhIekRLK21BM3hpNHNQZE9J?=
 =?utf-8?B?cTFCdkJOYVBob2E5RXNGQlpsTEl3Y0xqc205amI0Sk1CVW5OR3QxQ0lCWEtE?=
 =?utf-8?B?K3VxejFhdU1CS29ZQ0Y5UmtFYi9GTUZsK3BaQ0NYMU9vcGRvYUJlZTcvdEJx?=
 =?utf-8?B?bU91RE9TaHZDS1FNeTdUZW94Zm1xMjQzaVl2dFdIbE81cENPc3UxQkpWWjdl?=
 =?utf-8?B?N3BlclBGSzFZUzJHd29WZUxuaW1ydEk3R3pCR3Z0cUQzMzNDaGVVVE44UjRL?=
 =?utf-8?B?RFQwRktMcUhYZk9jUGR1WXliV0kwNXErbHpXdFZ6L1VYS01rMDZ4aWhna2ZD?=
 =?utf-8?B?cTRLZ1pWZUJIRVFEU1R1OEJqVjhMMFJYZG5peGo4WDRXUkpqa2Fuc05Uc0tQ?=
 =?utf-8?B?WGp0aDNWMG1XUUdlSTNaWHBHcjJIdzMxcUVnRTVEbEtjUjJuYm12TDRKWHVw?=
 =?utf-8?B?YXFHeVBvaGdLMGtDUlNpR2tOa1lPbmJNdzZualAvN00xMU85bnFEUkI0RTR2?=
 =?utf-8?B?MUtkV2h3YXgrdk96dmY5YlFJS05tQnVQeXRjY09oTCtZbkZUQ2VPcE9tVGxH?=
 =?utf-8?B?Yy91dXdneDhMTlIyS0dTWm9Nd2JPVmN2TkUvOWhNdXVhaVZsVUVRNXh0M3VJ?=
 =?utf-8?B?VWduZUNtUVdMUXhaZGcrcHA2aUI2VHFoTEI0a3Z0V0tFWi9ESUhQcmI2UzNP?=
 =?utf-8?B?bHc1UGJDMzNlekdEZ0RvcE1qQjJaeCs2S1JVREdqS1RvZUV5UGRTRmlwUVFY?=
 =?utf-8?B?V01xUmwzRndrOFRURXRxb0FJSUxHNEYzRG15aVdPMllJMzE3NTBVVEdmV2ta?=
 =?utf-8?B?RWtWKzM5UnRvQkZJSnRBSGk3ODg0N2NLY0doRGswR2dQK1pyUW1mUG5hN3Ux?=
 =?utf-8?B?eEp6aG5lRVRrWEZtbFo1L3JJcjdWcE4xaUNhaS9LSkp6MHFxOGcxN2duK3JV?=
 =?utf-8?B?dUloTW50ME5MZ1pxTlVYZ1BlbVFFRlBWenBud05qZWJpblNodGtnazNGZXR0?=
 =?utf-8?B?anltSWNVN29sZVF4QnczTkk3UEhZVFV0SndvQlFtQ01UZ3ZRTnpLVnk5M3RI?=
 =?utf-8?B?bXBKakZZd3hVNXBtWVhKdzBOclpBeHF6THQ3WmxjOTNGcjkrOUwydUNlR2pX?=
 =?utf-8?B?VVhjZDZDL2E1dituWjNIcEpiTDVlZWc2czBzbkNnczVVYVhrWWlVYVdtRlJH?=
 =?utf-8?B?Mnlhb3VuZUltZVRsaE5TMUFDYUpjVUFHQjlpb0pPOWNGZzRCVmdlTUZjWXl1?=
 =?utf-8?B?alJkaXE0L1pFUUdwMCtVRmtvZitwcCtuOGVCQWh0NHczb3pqZ3h1S0ZEQUJP?=
 =?utf-8?B?aFBLMWE2N0M2MUhvNjhWa2t6d2lYVGlRc0dwU210SXVBTFduU1VCQ29FZDJ0?=
 =?utf-8?B?K09QazFXeXFhMXB3RVJJaVNkNmhiaEJzb2pCQjE5M28zbTR6enNkQi8zVjZE?=
 =?utf-8?B?KzN4NzBNclowb3hES2t5dTR3cURiYVZTYXA5VjQ0eDRPN0YveE55OFRBcEJX?=
 =?utf-8?B?c3JiNFpCZlAyZGtMMjhiQmh4azFzNFM5L3B1dWllUEJYZVRua0RpL1NlY1Vi?=
 =?utf-8?B?ZHM2cmtlSjFnMW13MHFlVTlXaktsaVFEQnBDSmZDRTRBUU1YT0dmN1NsV0Uz?=
 =?utf-8?Q?EYzK22oc6stb+vyH56uctXWiNq/NnRd4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZGVTloeUMrZVo4TnVsNkpIdnE3K1Z4UGhzbE5BUk8rNENDbDdMdDBCUmth?=
 =?utf-8?B?R3ZVcE81cVN5WGVyczlITnhZSk5aRTFDWWtNU2hYZEJocko0THFZbVFDcmox?=
 =?utf-8?B?V1FycklHV2VSYlRlZXBQbmxIanJLR21zeHVveHR2cFVKMEtuSmJhRXlNQkgx?=
 =?utf-8?B?STIyYmRPT0dzUjVnT2tZSk1ZOEJQUzlIU0xOZGVEZ0ZVU1NucWg0cUltOUlX?=
 =?utf-8?B?TWFybncwekpsajN0UTUzMWQvNDlQU2VNK3ZhMDgybGhYWUpGWkY5WW4zQUxO?=
 =?utf-8?B?VnN4Z1o4eUR4Q3NKSFVIdHFxaXZFd0ZTQjdWL0ZZeUNZb1JUYzZUaUFDSWRG?=
 =?utf-8?B?TWtDOHM3VlRXVW1CREllSXNnWTIrNDdsZTJ4U0llalRTYlIyT0xhZWxGdWV0?=
 =?utf-8?B?M1hST1drS3ludE5jOWJVSDVEMGwrSmJwMjkyYkhBY1dndjNpQ1B2b2JvR0VZ?=
 =?utf-8?B?Y2tDa1A3Q0lja0lQWjlhemk5ZG0vN3RhS0ltY2FGd2hmTG54U2pHUytpaHRj?=
 =?utf-8?B?TmF0RE0wRGVsUFFsdkJJWlZjaDA2QUpxZ05MbmtWMzdSUHhmOTFZMHE0SFNr?=
 =?utf-8?B?TzJ2emtDNmhtc0ZaM3NPd0VaclRKR0ZUZXc3UVFyUnJ5SW9GeFV3aFYrWVl1?=
 =?utf-8?B?Qy9CMFlhWFkrejdGL2prSFVyQWxWK0pBM0dQNlpLcW10RitaYWJMd3ZCZHJj?=
 =?utf-8?B?TE54YWZqMUtFdmUyZ3BnWmVHcHE1N1QyT2ZQWm4rZmd2anlzTFRiWVZVbDhE?=
 =?utf-8?B?RlhRbkhwWlFTYXRiWjEzYk1teFM2T0JsQVZRS0NvVlFFNE00S1JVTGcyQ1ZX?=
 =?utf-8?B?M0pJbkNZbnZFRmYyUUVWMGFJQTdETHM3OWZpbDRRcHVBZVJxQkpsb1dzdjlh?=
 =?utf-8?B?Wkc1bUFWUUtnVGlUOWVXVEFycEpTbWhUL0Y5akowdGYrejM3V24zOWQzWXc2?=
 =?utf-8?B?cUZZczRTS2ZYaDNKOHp3UzVOVkxtT3NYZXNwMmpqYnFmOWUvV2hVMVZTaEVX?=
 =?utf-8?B?TWRXOFowUUNyUUdTNmhSdDZlb05EL2paRVZkL1dHcktqenYwS0xzQzIzT29n?=
 =?utf-8?B?WXBTeUEzVUxLVGJjdU5MK2Vta0p4ZUVUeEw2T0ZjK2ZKdTk3UTRJT05WM2FV?=
 =?utf-8?B?Tk14ZHFSeU1kcWEyU01UekxVL0JPdFgraHB1Q3lIUVN3SE53Y2kvVjdMcGU4?=
 =?utf-8?B?S1VnVVVpb0E3OXlYZ0tDMW9JV3I0eWROWDNUdFB3NWtSdURwRDh2SHlpWEZs?=
 =?utf-8?B?YmpHRXJVR1YwbHRGeXU0VmhzaXpjbVh3a3hhZ3NxV2UrSHlkckt0OHhoTm5i?=
 =?utf-8?B?YStnbkcrVGIyaDcwNFVnTGIzN1lQV3ZhWml6VThNL1VwWjZhVW1BUS9TMUh2?=
 =?utf-8?B?dUJsMzU2OTRwQUpVRTZBRUFnU1RwV20wSElhQzBtbWQvQUNPV21UVkhzTzRF?=
 =?utf-8?B?V3pSa2pOQ1ZGaXJKdkc4b3BINVVlcWE0RUhsNTFhVllwRDQrVGU2QTEwM2xv?=
 =?utf-8?B?eHVScldmZmZGSlY3eUE1akV6Q1NDRFdOTko1NXhER2luNEl3NXNLYlY4WFEz?=
 =?utf-8?B?WFZLalMwOGRCei9rOFFVZHF1L3lYcU9CSXJhR2JaSUx2RzNvVXBXUnlTeVRm?=
 =?utf-8?B?VWJ1R3Z4TTExTTNVRFhGSmo1TWdyaERxVGVHUUdUd3J2bTdDMkYzaTNqQmZ1?=
 =?utf-8?B?UFh6aUFIM2hFVms1ZGpRS0ltUlltTlQ1ZGFmQ0s1WUJtRnYzMWZNcXc5clNW?=
 =?utf-8?B?TW5uTFpZeUVZZXJQSDJ5a2RBbG5ZcXNUNTBTdUNXL1lhU0lBajdLRDdhKzdJ?=
 =?utf-8?B?MkM3QUJOTTBSZlNTTlk2TDJlVjF2KzlUQmhSTTROaXU1Tm4wOXRGR091NHdp?=
 =?utf-8?B?VmpWMjNTS0EvVzB6WG42R0NManVUekdiZG1scTNqcmRuMk53bXBEeXlvaFhG?=
 =?utf-8?B?YlJ5Q0d5RDdGNGNHWmZmbklKempMd3pJcUlKVkIwSFNNY2VZSlRyZGpLNk1W?=
 =?utf-8?B?cEdOSUhQbHRFSDR5Z1NkeFphRTlmdGxpNHJEa0xmdjdGc3g0aXZMNWhoNVUz?=
 =?utf-8?B?VFJHTlB2a2xyMXFuVG9jZE45Sm0xdDJzUmJ4VCs2a2hyS01hM3Z2TU8wL1Er?=
 =?utf-8?B?Q3pXRkl1UlQ1aE5OLzJpVWtUYU5mSjQxdlMvUnJsM0R3Rk4yUk01MTZwK2JL?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46510bcf-1cb1-49d7-22fc-08de11e4a7e9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 03:31:30.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SejHTIFWpu2E6vasuYgc0rwQZr3MkCrcXflN37KcjKON8JOj739ED76Nv4bQrcX7Qk8ZpZBFtn+tgpfWEJ0PTLpnIVa7mGnPXrk59d5RCg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5320
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: stmmac: vlan: Disable
 802.1AD tag insertion offload
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

SGkgUnVzc2VsbCwKCk9uIDEwLzE4LzIwMjUgNzoyNiBBTSwgRyBUaG9tYXMsIFJvaGFuIHdyb3Rl
Ogo+IEhpIFJ1c3NlbGwsCj4gCj4gT24gMTAvMTcvMjAyNSA2OjEyIFBNLCBSdXNzZWxsIEtpbmcg
KE9yYWNsZSkgd3JvdGU6Cj4+IE9uIEZyaSwgT2N0IDE3LCAyMDI1IGF0IDAyOjExOjE5UE0gKzA4
MDAsIFJvaGFuIEcgVGhvbWFzIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+Pj4gaW5kZXggNjUw
ZDc1YjczZTBiMGVjZDAyZDM1ZGQ1ZDZhODc0MmQ0NTE4OGM0Ny4uZGVkYWFlZjMyMDhiZmFkYzEw
NTk2MTAyOWY3OWQwZDI2YzMyODlkOCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+IEBAIC00MDg5LDE4ICs0MDg5
LDExIEBAIHN0YXRpYyBpbnQgc3RtbWFjX3JlbGVhc2Uoc3RydWN0IG5ldF9kZXZpY2UgKmRldikK
Pj4+ICAgIHN0YXRpYyBib29sIHN0bW1hY192bGFuX2luc2VydChzdHJ1Y3Qgc3RtbWFjX3ByaXYg
KnByaXYsIHN0cnVjdCBza19idWZmICpza2IsCj4+PiAgICAJCQkgICAgICAgc3RydWN0IHN0bW1h
Y190eF9xdWV1ZSAqdHhfcSkKPj4+ICAgIHsKPj4+IC0JdTE2IHRhZyA9IDB4MCwgaW5uZXJfdGFn
ID0gMHgwOwo+Pj4gLQl1MzIgaW5uZXJfdHlwZSA9IDB4MDsKPj4+ICsJdTE2IHRhZyA9IDB4MDsK
Pj4+ICAgIAlzdHJ1Y3QgZG1hX2Rlc2MgKnA7Cj4+Cj4+ICNpbmNsdWRlIDxzdGRuZXRkZXZjb2Rl
Zm9ybWF0Lmg+IC0gUGxlYXNlIG1haW50YWluIHJldmVyc2UgY2hyaXN0bWFzLQo+PiB0cmVlIG9y
ZGVyLgo+IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIEknbGwgZml4IHRoZSBkZWNs
YXJhdGlvbiBvcmRlciBpbiB0aGUgbmV4dAo+IHJldmlzaW9uLgo+IAo+Pgo+PiBJIGhhdmVuJ3Qg
eWV0IHJlZmVycmVkIHRvIHRoZSBkYXRhYm9vaywgc28gdGhlcmUgbWF5IGJlIG1vcmUgY29tbWVu
dHMKPj4gY29taW5nIG5leHQgd2Vlay4KPj4KPiAKPiBTdXJlISBXaWxsIHdhaXQgZm9yIHlvdXIg
ZmVlZGJhY2sgYmVmb3JlIHNlbmRpbmcgdGhlIG5leHQgcmV2aXNpb24uCgpKdXN0IGNoZWNraW5n
IGluIOKAlCBoYXZlIHlvdSBoYWQgYSBjaGFuY2UgdG8gcmV2aWV3IHRoZSBwYXRjaCBmdXJ0aGVy
PyBPcgp3b3VsZCBpdCBiZSBva2F5IGZvciBtZSB0byBnbyBhaGVhZCBhbmQgc2VuZCB0aGUgbmV4
dCByZXZpc2lvbiBmb3IKcmV2aWV3PwoKPiAKPiBCZXN0IFJlZ2FyZHMsCj4gUm9oYW4KCkJlc3Qg
UmVnYXJkcywKUm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
