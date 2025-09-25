Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58465B9EDB2
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 13:03:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56ECAC3F950;
	Thu, 25 Sep 2025 11:03:37 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B293C3F94D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 11:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Du3W8us4utuggkuIX0uzketH93XD6+7l6zgKeDJNo3+yJGSMBm76Q4bJ8cWlFn+Q8E0bu/kvA8nnpvhVpu86E7GNXK1xkixsarngpVYi0qa3WaiX0ipMxnQptaWU4hxKA9Emgce79a0Yg0uUUCjIzwOT7BUWHgLlnGgRZfpXOxF1HN1d1gtmeJbtVea6sKsrkCWxI8kRbynUHSgNRANZRFkItE0JszrvRH/hi6aTtjn80+D/G03yzBK/tRuPpRS+W2bzNn5GSRb9ZZCsCFdxxvipazBSnEiGp2ipiZkQF0O/+xPGprawk/d1ELQJUElzquIvIsVR7E1Ty5nU/R6Odw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3fzTbHNctfX3b6YXHqklwvF6MmunS2wFI9KQNTtjoc=;
 b=gxZR7Pbt1oDs+kLIx5J309CTO7asEM3cQZww3ImpzatfrL8Ev8VnaHUFjqm59zbFvmwG0EcL8eSMoeRFHQZUwLPBsTwJP6IZvnm99Kht+1ogY+rXax51Va+qeVWIgxyA7F9qwLI+HJfHWzbeJ7R9Hj0KSpuKUafE3GWgJ7LkDpIqHF4tkhcBkNNR5SuBh5o/fCA5fCeTqkdgYCHV4R7r2QHgUxZoXJV3lKPngH3gwl8rxIZFuEOXVeBevrgemlgjEPQQvyQVofMBCkuHdEXHPLjlN3FledIqDL7xDtyCHFJjsUCmRvdk9qPaYDhVNT5aIaOFRVa9Va460qOEqXLcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3fzTbHNctfX3b6YXHqklwvF6MmunS2wFI9KQNTtjoc=;
 b=HHktLGUHtXgkxfQmD4jDW0fLedTJTGcaUm2OJiM7mcXl4PKXm61KvjXbwm7hfGQqldjDrk8qtW+a4fEROv3BKp4qqi0KAAWckrStzm189APU/VquQc4hS3bKv2TXhdSR1tLvi0xlO+BcwopM9TS/KAIcR/yebhZqitztKnY6mQR+gOq3oM0E64sC8bCKuWeysoewTCqlpwWrxSVALuoE/wYNCL+x6iApgRlZwdP7nwvTjo01t2d8Sq96v0A0N7bzI7eo9Gl9P9pUsr0wgXaVRU8IvJlFmdf4FBRAnpQW7ay1D+5xQBoUxS0pIdZ/6aIr/3Ib3X9OurFyF3Kf88cwMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by BY5PR03MB5362.namprd03.prod.outlook.com (2603:10b6:a03:220::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 11:03:32 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 11:03:32 +0000
Message-ID: <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
Date: Thu, 25 Sep 2025 16:33:21 +0530
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org> <20250917155412.7b2af4f1@kernel.org>
 <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
 <20250924160535.12c14ae9@kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250924160535.12c14ae9@kernel.org>
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|BY5PR03MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: 3736785e-7549-438b-47b0-08ddfc232a2f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU9QaW1MQ3RwZ0VUdmRYYktya2RtS0JSak5mV044RGVzbHpoZnFpdll0dm96?=
 =?utf-8?B?dkt0Q2JSN29Nd0J1Y0NhZW8rbWxhRWNsS0p1OG9iTWx4dFBING9DdDRTK3dZ?=
 =?utf-8?B?bHNLdlpITE5YcWpDM09tMEhiNVVWSFJFaFZUVFQ3NTFyaFNuVitlcWF0Um5L?=
 =?utf-8?B?Z3pEWVRKQVIySnhuNnVmWDBwanE1SExTamladFAvM3YxdkdzaENicEg3SnRq?=
 =?utf-8?B?bTZyaTNSU2ZodEFkNG5lUi93ckczNXF1Tmlwbk1ZT292dExsaElDV3hUdmhn?=
 =?utf-8?B?NmV5d0NlR1l5OTU5M1RrbnRwY3oyS0NmRmM5OE5WUWZCd2F0ZHp5V1FCdU1p?=
 =?utf-8?B?K0pmbWg1SGVmRTQ4T20rK0V3dThHK1U2UWlMRFkrMHhLR094NUhtYStwWElN?=
 =?utf-8?B?d04wN1J4L1NJOTF1cXJBYTRnRnJwWGpTZTdEYU1RczMvbElHV1gwVHBQU0Ur?=
 =?utf-8?B?TW1adFQwRTQ1U3ZwU3FuUUZtWWwzZTFDSlk3QUdwYlNyZDNHOG5nZ0hVWUZK?=
 =?utf-8?B?TTNXNDB0TWhyRHNTTnNFZ2VGTU95djZEZVNmemNlVjVCaU5PVU1LckY3c3NR?=
 =?utf-8?B?V3JwK1ZoNW00YWxDS1AxWXE4MW0zYTBkSmF0cllSbVZydXNCSVdWQ09lSGZX?=
 =?utf-8?B?MmJlTVFRRHdXQjcrOHBuTUU2MFJtc2dtV2FwRVpnMkZWdGluL0R5OG9VL21U?=
 =?utf-8?B?R1hibG12enRubHpQSFc1V3I4ZjdEVUQrK1h2aTQ1TC96NVAxY3NJNFV1KzlS?=
 =?utf-8?B?OVlOQzg4OW9PMTNWdG8vVVJ4YytRdVpTcjdORjMwc1N1RVQ4M1pZWERoUGxp?=
 =?utf-8?B?YW5YYVpDK2lmWjNIWkJnYkRSRklZUmY1K242c09kck84RTF6NkJlSllEZDVX?=
 =?utf-8?B?dXR3RFcvV0gyQmZaZnpXYkppSHk2ZExrRGl5M281MHlsMjJuWXlnU2RMVDFy?=
 =?utf-8?B?M01xenUxNzRhSU1RR2gwUkRkL2ttamVUemoyajJWWWJ0SUFhQ1d5S1p4QnlS?=
 =?utf-8?B?ZVA4bytKZWVQcHpWMHV6NEp6bWErdm1nbFcxY0lSVmdTV0pJZVJzcXRXWTFY?=
 =?utf-8?B?NkdCNlN4aDBOcFl4SUR3aUtZMWlEZzhVSk5RMFBxVVlmTTQ4TU84YXRuVi9v?=
 =?utf-8?B?ZHlkMGRoNDY1Uyt1ZzdwYnZFbDB3RlhSbXR2ZndpaDhxaEphanV0cnZhbCtp?=
 =?utf-8?B?MUlVdExGbzhiblFra1B6N1A4UnhzRjdjbDBYa2hqaldFYkVKQ0FDYUh3Skp4?=
 =?utf-8?B?OUJwMllIc1pZL24xNVpyTlJQZGh6V2VXRUJlSDVRNXY5MGpkNmxHUFU0UHV3?=
 =?utf-8?B?bk1HQ2hiUktKMzVid0ZyNUhCUUFqMldxdTN2aTdKY2Jidlk3SVNMWHpWL24r?=
 =?utf-8?B?TE1NNldDT0RTNXJ6TmI0VzkrMUYzdVJhSUpQVy81SXdhbENERUM1ekVQaTIy?=
 =?utf-8?B?TXc4SDNQdzJaVHBWRXVEdDVQQzlwNEZqc3F5OTMxTlAybmN5TVRTS2o5bHRp?=
 =?utf-8?B?YTVmK1Nuc2hjR05RN0hicUxRZjlSYnI5ZURtRVdSa1Z5Z2pieldGNVpBeDV2?=
 =?utf-8?B?bnhnR2dVWjZuYThGVjRDcEdDMUdUVVEzUE45WWo1NVVUSTJsNFJwb1ZtcDE2?=
 =?utf-8?B?ZWhrOTdtUGsrK2lBeWhwNmpoNlJCeUd0OWpsQ0VOV3NaQUxXMlM1MGpEemVH?=
 =?utf-8?B?d0cwNGRBeEp1a3dzVVo1MVBraFhBQm1WQURJbG1hUEg0ZHJzN09TdkhzNmJJ?=
 =?utf-8?B?c1puZFhOYk1Ec0YzQ2Q5TkNmOGoxeXNoOE5YT05manBoTy9qUE05eDBpUGZl?=
 =?utf-8?B?YmhiMHA1ZDNvQzY1QVV4dld2MWYzcE42a0EzUHM5WFg4N3pNbFVHWjdXdTV0?=
 =?utf-8?B?QTV3UDR4azZkcFBzUmk4SWQ5UUNOVzBLUEVuaE9rb1ZETk5DakV5TVA5V2Jv?=
 =?utf-8?Q?uAgKDBwp5+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFoyUktYVDl3bTZDYzN4TlB0Z3pPODFMeEdvNDZnL3kyaDNzNzNmUXAwaWUx?=
 =?utf-8?B?cnh1ZXdLS2JvU29oWlowRkNkR2VybGxYQWxaOHRESVo5WXBaMjJzZ3BEZG0x?=
 =?utf-8?B?MFpSNjVibFduYlVDS2JwbkhLbmVGbStYMjYvc2RlYzlSVjh4ZmI1K3crbCtZ?=
 =?utf-8?B?d1NCVnVnL2JJcWpsM3h3cmNqMGQ1L05nSEY3WGQxRjlCT0w2dkhvOHB1VUIy?=
 =?utf-8?B?ZlFaRDFFM0xDcnJvNjRENUt3cm55TkxUZUxMOXN4Ukh6ZjlCdzErNXlicUVK?=
 =?utf-8?B?QXpjVFh6QVZFNldBTzd6czBNQkNyL09HL0hUN21zVVVtcEwzZFBxeHhZNDVT?=
 =?utf-8?B?dWp3cGFBeWEwaDN4U1ZhdHFmU2hlUnc0azlPcmNQSWdDbEhIekd5VnNpOG1P?=
 =?utf-8?B?T0NsbmFJYm80eFFnbVVBSzdNLzVWaVBpTFh2eVRPU0g3UlNYT3hRV3paSkp3?=
 =?utf-8?B?WkhEekhrTTcva2Zvdmxza0Y1RUY2RDZwVEJUbzJvb2VHU0Y1V3BZWklUa3B6?=
 =?utf-8?B?VnZBYVBpVUE4QjcvU0xja3p1MzRQM1VpYm1RUUE1UGhTeU9uU01CWG53N1N1?=
 =?utf-8?B?c1BEYStUNUVvTTdMSHhnaFhVZkdBbUF0OGRhT2k0T2RYRHJhaFBTOVlSdUlK?=
 =?utf-8?B?Z2p5bWpHSmJ0U1VNcmI5TklQTHBESG9PZWUwend3TnQzajBvNm5hZlBsbmds?=
 =?utf-8?B?SlBVeHpyeUpNKzhyRzFSL1NzRkpTczNJTnZUamU5blNEaldrd0E3VFhkT2d4?=
 =?utf-8?B?U0pkVzZLQndEbm1DdDNoUk5PUysrUnlxM3YwZ1dGeE0vY3MxaUxGOUkwZnZo?=
 =?utf-8?B?dFVkOWZLZHZlNzg3ZktNRDFNbkNWQ2VEUmtCVlJmNkVjRGRqRUlyTERqYTVG?=
 =?utf-8?B?U0RoMHdsSkxvOXNFNmYvT3ZCTjh3K3VjMmJEL2hQSHhObVcwcE1RRnZib0o5?=
 =?utf-8?B?dThwWVdZb0FScys1c1I1dGFzWVcvc1ExbkRQalBPb3JiOXpnNlFvOFdhZEht?=
 =?utf-8?B?ZmJTM3MvYUVjSWNLRmR6U000TFdtYUFnL0VKTExFQ3BiQTFZNExvWG9haWpz?=
 =?utf-8?B?WEtpQWg5b01sQnN5NFFZbzRHZWlXN052RjNWSGFxdmdpbDE5Skl0YWdHWG1D?=
 =?utf-8?B?M2RYYS96ZUg3ZDBlS3pOWTM0VGxEL3BHaVZMVDRIcGJSYVE5NjlsYkorc0d6?=
 =?utf-8?B?TXZLTXZQcHdGYk5XcGJaMFB2Q3VwRWh6S0ZsUXBYRVQra3lOeVdkbWt6bXBG?=
 =?utf-8?B?eXJzZFNCczRYMEVEc2l5QksveHViZlJNQndnN0hBZ1djbzVEeE9MVTIyMkpr?=
 =?utf-8?B?ckZvZE94WnZYRDBjM2t5eUIxMnJIdFdnL0lnYktSL0RkbEpQNEhjSGkycGtS?=
 =?utf-8?B?ek0rTUNndnVqU1ZTUGJ5cTI4OHdLM3M0eE9EdXQ2QU9FK3FCSk15Q3MyN21O?=
 =?utf-8?B?VXpsYnpLTWRqSVRYZ1Jacll2VlVSUGVramplbWFkSFJIR1QwMEZBRzhZc1A2?=
 =?utf-8?B?Mk1zSExxNjFwMEFzVy9VVE54QllneXVuZVg4ZnE5blhDMXhYMGVQUTNKMGtR?=
 =?utf-8?B?Mnk4algvbXFNMEIrdlJtdk5DRnFVNnRWdEpFQ2RmdlMrME13UUhxN0dmVVNP?=
 =?utf-8?B?d1BjdEZuSi9sdHZnL1Qyem1RRFo2NW9nY3ppY2poa0p3QzZBSHQrWWxrZ21p?=
 =?utf-8?B?Q1RZa2Z4Y0lHUFhKWWI4L2RvbTV2aDdMZzd5MHdDbmc5czRPVDJsOFhXSzlV?=
 =?utf-8?B?bTIwODRDMXAyak1PQTlvSkgxRkdTYnlJMFB4QzNkclQzNlgvblFkdWk3V2VH?=
 =?utf-8?B?U1NHZ0piU1VRMEkvNFdMbTFiblU3ZW9RWDhHVEJSeGFocFhJMmYzUEo5Y3E5?=
 =?utf-8?B?QWVoWkJDZktiV2N2MmhpRmdTcUNsczIyYkRrczdwK2JjZXNjTFhibTlkbDhC?=
 =?utf-8?B?VFhNUzRkaUdURHU3bFZObW9hS2JQRkZjOEVFZVhTalhzdWRlL1BqWnpSSmlD?=
 =?utf-8?B?bGw0eDNqU25jdVZWS1RHZkl1dURFeXN6ck5HY3gwQnoyMktZZEFuTUY2ODcv?=
 =?utf-8?B?V1lTZWFIeXlGR3BsMFV0SXp6cytybEFGNTBuR2NvUWdLdUpMcjZLc2lQUFpT?=
 =?utf-8?B?bWkvVmJHZkhWck5VeCttMkdUckN0SzlTUE9PQThMLzQyY1RvWExPdlRTMTJF?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3736785e-7549-438b-47b0-08ddfc232a2f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:03:32.0716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzfdEE5Vlqo5EnGRFLgavb8Tisksmb83nPO3xIJimVogFZwUxoE+5Q/Ky1q2t7v2QaOgiaxOd5xzEDnaZuTCREsSzfJxhdCrwUmd07mC8H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5362
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

SGkgSmFrdWIsCgpPbiA5LzI1LzIwMjUgNDozNSBBTSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4g
T24gV2VkLCAyNCBTZXAgMjAyNSAxMDoyNDo0NCArMDUzMCBHIFRob21hcywgUm9oYW4gd3JvdGU6
Cj4+Pj4gSXMgdGhlIGRldmljZSBhZGRpbmcgdGhlIHNhbWUgVkxBTiB0YWcgdHdpY2UgaWYgdGhl
IHByb3RvIGlzIDgwMjFBRD8KPj4+PiBJdCBsb29rcyBsaWtlIGl0IGZyb20gdGhlIGNvZGUsIGJ1
dCBob3cgZXZlcnkgc3RyYW5nZS4uCj4+Pj4KPj4+PiBJbiBhbnkgY2FzZSwgaXQgZG9lc24ndCBs
b29rIGxpa2UgdGhlIGRyaXZlciBpcyBkb2luZyBhbnl0aGluZyB3aXRoCj4+Pj4gdGhlIE5FVElG
X0ZfSFdfVkxBTl8qIGZsYWdzIHJpZ2h0PyBzdG1tYWNfdmxhbl9pbnNlcnQoKSB3b3JrcyBwdXJl
bHkKPj4+PiBvZmYgb2YgdmxhbiBwcm90by4gU28gSSB0aGluayB3ZSBzaG91bGQgZG8gdGhlIHNh
bWUgdGhpbmcgaGVyZT8KPj4+Cj4+PiBJIHN1cHBvc2UgdGhlIGRvdWJsZSB0YWdnaW5nIGRlcGVu
ZHMgb24gdGhlIGV4YWN0IFNLVSBidXQgZmlyc3QgY2hlY2sKPj4+IGxvb2tzIHVubmVjZXNzYXJ5
LiBNYXliZSBzdG1tYWNfdmxhbl9pbnNlcnQoKSBzaG91bGQgcmV0dXJuIHRoZSBudW1iZXIKPj4+
IG9mIHZsYW5zIGl0IGRlY2lkZWQgdG8gaW5zZXJ0Pwo+Pj4gICAgCj4+Cj4+IEkgb3Zlcmxvb2tl
ZCB0aGUgYmVoYXZpb3Igb2Ygc3RtbWFjX3ZsYW5faW5zZXJ0KCkuIEl0IHNlZW1zIHRoZSBoYXJk
d2FyZQo+PiBzdXBwb3J0cyBpbnNlcnRpbmcgb25seSBvbmUgVkxBTiB0YWcgYXQgYSB0aW1lLCB3
aXRoIHRoZSBkZWZhdWx0IHNldHRpbmcKPj4gYmVpbmcgU1ZMQU4gZm9yIDgwMi4xQUQgYW5kIENW
TEFOIGZvciA4MDIuMVEuIEknbGwgdXBkYXRlIHRoZSBwYXRjaCB0bwo+PiBzaW1wbHkgYWRkIFZM
QU5fSExFTiB3aGVuIHN0bW1hY192bGFuX2luc2VydCgpIHJldHVybnMgdHJ1ZS4gUGxlYXNlIGxl
dAo+PiBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBmdXJ0aGVyIGNvbmNlcm5zLgo+IAo+IFNHLCBu
byBmdXJ0aGVyIGNvbmNlcm5zLgo+IAo+IFBsZWFzZSBtYWtlIHN1cmUgdG8gQ0MgIk5nLCBCb29u
IEtoYWkiIDxib29uLmtoYWkubmdAYWx0ZXJhLmNvbT4KPiB3aG8gd3JvdGUgdGhlIFZMQU4gc3Vw
cG9ydCAoSUlSQykuCgpXaGlsZSB0ZXN0aW5nIDgwMi4xQUQgd2l0aCBYR01BQyBoYXJkd2FyZSB1
c2luZyBhIHNpbXBsZSBwaW5nIHRlc3QsIEkKb2JzZXJ2ZWQgYW4gdW5leHBlY3RlZCBiZWhhdmlv
cjogdGhlIGhhcmR3YXJlIGFwcGVhcnMgdG8gaW5zZXJ0IGFuCmFkZGl0aW9uYWwgODAyLjFRIENU
QUcgd2l0aCBWTEFOIElEIDAuIERlc3BpdGUgdGhpcywgdGhlIHBpbmcgdGVzdApmdW5jdGlvbnMg
Y29ycmVjdGx5LgoKSGVyZeKAmXMgYSBzbmFwc2hvdCBmcm9tIHRoZSBwY2FwIGNhcHR1cmVkIGF0
IHRoZSByZW1vdGUgZW5kLiBPdXRlciBWTEFOCnRhZyB1c2VkIGlzIDEwMCBhbmQgaW5uZXIgVkxB
TiB0YWcgdXNlZCBpcyAyMDAuCgpGcmFtZSAxOiAxMTAgYnl0ZXMgb24gd2lyZSAoODgwIGJpdHMp
LCAxMTAgYnl0ZXMgY2FwdHVyZWQgKDg4MCBiaXRzKQpFdGhlcm5ldCBJSSwgU3JjOiA8c3JjPiAo
PHNyYz4pLCBEc3Q6IDxkc3Q+ICg8ZHN0PikKSUVFRSA4MDIuMWFkLCBJRDogMTAwCjgwMi4xUSBW
aXJ0dWFsIExBTiwgUFJJOiAwLCBERUk6IDAsIElEOiAwKHVuZXhwZWN0ZWQpCjgwMi4xUSBWaXJ0
dWFsIExBTiwgUFJJOiAwLCBERUk6IDAsIElEOiAyMDAKSW50ZXJuZXQgUHJvdG9jb2wgVmVyc2lv
biA0LCBTcmM6IDE5Mi4xNjguNC4xMCwgRHN0OiAxOTIuMTY4LjQuMTEKSW50ZXJuZXQgQ29udHJv
bCBNZXNzYWdlIFByb3RvY29sCgpJ4oCZbSB3b3JraW5nIHdpdGggQm9vbiBLaGFpIHRvIHVuZGVy
c3RhbmQgd2hldGhlciB0aGlzIGJlaGF2aW9yIGlzCmV4cGVjdGVkIG9yIFNLVS1zcGVjaWZpYy4K
CkFueSBpbnNpZ2h0cyB3aWxsIGJlIGhlbHBmdWwgZm9yIHVzLgoKQmVzdCBSZWdhcmRzLApSb2hh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
