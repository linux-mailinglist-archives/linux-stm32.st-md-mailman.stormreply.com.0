Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C34BD3A8F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Oct 2025 16:48:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474C3C3087A;
	Mon, 13 Oct 2025 14:48:41 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1D6BC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 14:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeYvK0hoQdSd1R1KflXRfqG97EJritrge99+RoU3juBZL2MpUWnXtSuhvzERapw9rYySV+XY/E5awkcEY0jUmQxCedcBKLtJ1mmDkpuiiXs5YVB8TzdZFlnFpdQ96HtPvcmdxaIN6GRIYNdWDwPmEVg70pN3fo4EdNbBwqy3+B4NeaYwBU04TzYdBIhOCBw1G3MT0qtBOstB+2FHbByW6W7DGiWGbxgpK/Yasx1Umk2yBPQ8t6+DqSunTWWbUbhFgsAb2H1Qa0yOt8qk+UZCHV3Qx6EWmnRnevxj4vFQm2gHjJF7thtr9CtT34CE1umpOubOMTr4bXAW2jtySgrCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACDPU+R5yzriQ1Lc4G5s5uOzsdvQ3fMYzS5539Ciqms=;
 b=ogD7H6mfkHLPFQxkpZv3LEC1MMJcDRTlmT8S/tW5sdAjNIcHb6o5P7UfL0/h7mjlv5bbTJ5/llj5SZYAfT9jsAp4Y6lGI2iEavZROBzBoI+4mfh5FqYkU3y0sFTUKTJmhi1JYiP5xmNTfkfOnd8eLSLb3bAB2t38VzBi+rNa8xVW6xAwOBxRZZA+ep84q4fRyYQ8a6kh7paYlPw1f0X3kYhcN3O8VOb16yCgQ8nrUulXjvQG80Paxwxivzk+uPnSEBJzCh+1czRqnDytq2IvwU5OdKZnXW+SoDZuoUPjw1TdQHK7VOq64AOjHmvq/nevhh2f4z9/JiY+xFHUVewlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACDPU+R5yzriQ1Lc4G5s5uOzsdvQ3fMYzS5539Ciqms=;
 b=uy+bNG2rO3VgkgCdRSWLDyMFE65b2OgIo6lc8nWR/eq0pOeLGK91g6Vmn/Trko8xWyv++1VbPy8bgbNlkslyuD34eEiYR8YCNIVNZz3Bko3eb/iV8U4vA/7MT6/+JC+lP/1+cAf/hbO9S4bxAhfehkQkACwcaSN4KWXZ6b7Apts//Mn6ydZLvrjbTiBULYwmtKD+0W2XtW3DLqDshQ9G0KP9hxNEXdoLT9N4n/7WpGa/aUVbx77XnT69u/hlGOtxsNJH7F1mSbBv0dEg4cXFbU/22zFWtZydsr9y2ZBw9XTa8HIpxVkimeo0zm4aRCYU1ToW0ZpGxax8u2cs0Jgpfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 14:48:35 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:48:35 +0000
Message-ID: <4e7a20a8-5911-4233-b93a-d03693019272@altera.com>
Date: Mon, 13 Oct 2025 20:18:24 +0530
User-Agent: Mozilla Thunderbird
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org> <20250917155412.7b2af4f1@kernel.org>
 <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
 <20250924160535.12c14ae9@kernel.org>
 <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
 <20250925185230.62b4e2a5@kernel.org>
 <1e82455f-5668-41fd-bebb-0a0f7139cc3f@altera.com>
Content-Language: en-US
In-Reply-To: <1e82455f-5668-41fd-bebb-0a0f7139cc3f@altera.com>
X-ClientProxiedBy: MA5PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::7) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|BN9PR03MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f13f1f5a-6515-45c7-6521-08de0a679640
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29MUHdQSDdKektRQ2RPY3BaWHNGb0ZUTWt2LzZGUzZlaDdUbG5lemd2cFZY?=
 =?utf-8?B?WlFuTWRVTjhFaWdhSmNodjN6MUNyQmZmQWZQcHpyUEZtWUwyUC94dFArdUJG?=
 =?utf-8?B?bmN3SkcrV3ZrVmpMOU8yUFJoOTdEV3E5NDROS05yb0JGcGNXeWZ6STRYRXhC?=
 =?utf-8?B?WVFtaXJGQWV5TjNlR09mcVNvK0JCNmFsaklDRUpiK1JVU1h3d1dPam5lWlBx?=
 =?utf-8?B?cWR0bnNrUm9keGVTT3ZvMDB1RU1RWms1UGFML1ArSVhEVGNnMU1kQW1pcU5M?=
 =?utf-8?B?OW4vaDB0RjRvRTZpVmtGTkZTaWVCdjFWaUM4NGhaTHhlSU1xbGlaVXVkNGZ6?=
 =?utf-8?B?dElWakIyOUIvMWJ6ZjNSclZCK3B4M3hiekM4QU9wZnYxZG55cDdwbWs1M3NB?=
 =?utf-8?B?SWJsUmlhaENDUndrYWNuWTRnQU4ySTRYRzZiQ2s1QWlSYjJEbThIcDdXZG1Q?=
 =?utf-8?B?aFROVlNNV1B6cWNzaUF1dFc3UlRJUUVaWHVGRXNGeENLUklINUd2eVM0eCsw?=
 =?utf-8?B?bThoMG9Lc0p0LzRObVlOanNORDVlSzFLdE9HVnpoWU10NHZRSTNaRzdFczFI?=
 =?utf-8?B?L2U3NTA1VmZIcXErYXpmUDhTZG9UT2FQMWxKcmxkY2pCZit2R0RrWUVQc1Fv?=
 =?utf-8?B?YW9rTGhJczhLSWg2eGFYWTJPNVl4cU5ITC83YXFFbC8vcUV3ZDRlZ2loMlV1?=
 =?utf-8?B?bHpmc2ExQ1ZKZjhWeVZGVjhLVFY0ZXF6Q3E5WGE4THJkV3RCMnZ5c3NZSnMz?=
 =?utf-8?B?N1grRmEwTGI4NkZHRUw4T0MzNk5RMWVlUzI2Q3BGMkV5dHhSVDdpaC8yVE1v?=
 =?utf-8?B?ZXA2UVZoenN4MTJKSE9hUGlIZ1JEeXNxOVBjbFJrTStHZjdWMmVjZ3ZmcE1P?=
 =?utf-8?B?ZEdjTGl5OFdoWXFmeFVLMjJSV1NGQ2Q3TXhyZTZER3BmVFlEc1cyendtN0pY?=
 =?utf-8?B?WHkyNkQvaDE1d21xeW1yd1dXejJZOFlkcTZIU2xLZStteGV5YkkvWnp5RFlG?=
 =?utf-8?B?QlJHQm91aFM5TEcvS3FMeHdNdWh5UEx0VUVrbEJzd3lzQ1FhY1Uyc0swTkVY?=
 =?utf-8?B?V1IwcDRJVkhaZDJIMFhWaHdpL0xwMzQyR1pGQW5Sd0RQbis1S2JFNkJtdVFJ?=
 =?utf-8?B?TlcwempRakxHeHNBSklMbytPMnFnM0pyOVE3YitJbC82dnY3UHI4ZDIyZExD?=
 =?utf-8?B?NGNHK29FQ0piT2gySHpCNUJ6Ti9wSzBHMTJEb3VMWS91eXVXZlZVUnpvNmRm?=
 =?utf-8?B?cEVTMWxRZXkwQ0s2em43NTZSY3NVSHlZanM0YjRqVlc1eUxlck5lc1JRd0oy?=
 =?utf-8?B?OWFYT1hua3V6WEVIUzVYMXlLbmtwWU1nbER6SlVueTJET3NONTNnVlQrUmlS?=
 =?utf-8?B?ZGJYYlNZay9Bck5QZ1YvejJxTG5hZkpzMnQ4aythdEZwaitlaEJZTkVCOG1h?=
 =?utf-8?B?YVFxbVNEeDE3MWtjZDZad0h2UHJnWjViMDFMbW9HQWhNUGUrNVRkL3dzTWln?=
 =?utf-8?B?RnRDZUkrR2hNYjNJRzZBU3JVdWRoMmlhZFE3bEF5Ylhsb1RiOUg1dlNROXFq?=
 =?utf-8?B?RzZKWG5qSWZTYkFTRjJOa0s4U2grcjErVkhpRlVsb01IRmtSM3FVa1h3SXNn?=
 =?utf-8?B?ZkNZZms4QjVCY010Q2dnN3lEN2NGcyt0eDFISENaNHpkSHdubWRISVZEcnU5?=
 =?utf-8?B?L0lMcHJRNVI0Yi9BbHhCYStPSUNPZnpCTmk5K2t4bURTbC9rSit0bVoyN2Jj?=
 =?utf-8?B?QVU0V2cxSThLUHM0YkI4UE40cFlaRytvWnkyZWdNeEh0RHk4L0RZZ1JTMjZO?=
 =?utf-8?B?SGxPcHJHOXliMFU0YURONTNtR3E3UEUzOW5SKy82QjhVd3pFYnZBY05LdVk3?=
 =?utf-8?B?K3crNnZLQ2pnWFpqSUJoZXMra25IcEdsVlJFODFXS1JVNGltSmV0VWJXWmlB?=
 =?utf-8?Q?jaOeo4Z6YbbJiRnvgknKqRwJMwO4oQT4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBZNWl4eXM5SEpYbHp4VmRuRHBXVTQvdVUycCt0SXhTTzc3UWtsRytkbmx1?=
 =?utf-8?B?QWxVVG9qMU05RDVuUXluRnR1UEdIajNpWHp2Wk5QTUtVRll5SHNOUDdLeTBh?=
 =?utf-8?B?RXpsUkdlbW9PUlpDQnd4MGFmM0VJQmZqQ3RXVU00TUdTZ0hHVlh2Z0JVOWd3?=
 =?utf-8?B?Zy9OMzJwRVVGei9WMmlJNjVJeEJ0YzN1cXFKTGpMTWNjMUU5d0tTamtPYU5G?=
 =?utf-8?B?cjBuR1ZWNDZ4STN0WnR4cDZ1R3FHMXZOdmQ0UE5UMzlNTExnMER4dFBCZlcr?=
 =?utf-8?B?ckI5OTNEMFdZNlhyWENyZHI5YzUveXB2RjB6bFFXYlBnd3ZuK1E1Nk1NVDdm?=
 =?utf-8?B?U3pkWHdOcWNRS3FsWWRXQlR3eFpWR0hINWhxb21Pa3d0OXJ5NzJMSWJiN0ds?=
 =?utf-8?B?SThOSnhrU1dFV2lPdzRSZVFhTlRLcTFFb1dzbS95TzY3d2thVFY5K2trNnVN?=
 =?utf-8?B?UkVqWnZabmROdFBNdnZUQXpiVGJPeFpaUmhDWUdZbnZXTzZ1TVJXamlCekJ5?=
 =?utf-8?B?d004UE5FQWUxb1FqL29RTG5yNGNnNy9rZlNFWjFnRTFCY0ZLbVBzV25nUW1w?=
 =?utf-8?B?WnBiU0dSSi9ZR3htaE5DTFluM2g0a0o4MTlaaUM1R2xPRC9JV3RHQnR1MFNB?=
 =?utf-8?B?UmtHNTUzN3JkSXFOM0E5SkplanE1dWppVE51ZTdieXJuVndvNldvK2NhSXJP?=
 =?utf-8?B?Mys3TUZQNGVzeURWc0NjMzRVeXgyK3hHcFphWE5WS25rcEpmZkdZMVkyQ3V6?=
 =?utf-8?B?eDR0UnpzUUdkSE1XN1Y2UmFXRHd1Tmh3UWdNQ3ljMjg4amh3Sm1rcG5CUVBw?=
 =?utf-8?B?SUlDR1V3eWh3bjFDTTR1N3ZudlNtUTh4NWJHOHVWUndlcFg3M0RFN1V6K25T?=
 =?utf-8?B?RHBPc0ZTTGpiY2M1MHdDMVNBVFZnTkplUzE2S0NxMElpS2hwZ01KUDM0YXNp?=
 =?utf-8?B?dlVKMVpyQnQwK3pVQlcvN2o1OUYvc3JRSE5yL3ZsNlFRV0pKRVJ0eVlXRHhh?=
 =?utf-8?B?WW1pZlB5VWh6QVAyaFZuYTRLaHBUS3hNRU5UN2h2VUVQRnZpd0pWVVFuRW01?=
 =?utf-8?B?ZFBlcnl2b3lpN255NG94aWdXaVd2VGJzTVFGK21KN0phTDJiaDZWNzR3TGlW?=
 =?utf-8?B?bDMvUThUSkE0aWlDdlA2bW4rbS9EM1FJOWJjbGVxSytRMUJoUTQzUFBpZ3g4?=
 =?utf-8?B?RlNXV2J5TWs5czRIM1pYN0s1OG8xM25hMm1nYWlSTVdKbVp1TG9tbmRZcStH?=
 =?utf-8?B?YWJJYjY3U1BrbkVZQUNudVlub3BxcXhvTlJ2dGV3d0NUOW5HaTA1YTd6Njhp?=
 =?utf-8?B?Qm9WVWtpb2FPZkQzcUtsTS9pZ0VJSCtrL3JEdWsvWDJUSWJ4dk9tVSs0c0U1?=
 =?utf-8?B?cDZyaXBUaS9VZjMwYUl6SHNpeWFLNGs3b0d4MXJWMVpTTGFlY0F6R0JadDRx?=
 =?utf-8?B?eW1PMW9NejN5SEdZTDNwWkxxUVVpUzNhL1dTVjRIZlB1YUtJMDUvZjBuanp3?=
 =?utf-8?B?VC9haFQyM0ltNGhpQ1hUZWVVMm1TWjN3QVpoUitURWhmdk8xbXBKUHVCdlNC?=
 =?utf-8?B?T0h0RitlRXFTSVpIRGNnTjBrZDBaR0dCS3BZdkF3VktiMnY5OFlGUHVZdisw?=
 =?utf-8?B?djBlVi8waE9RODgrWmRaam5CRHNudWh2VlFrUEdtcU9qZEg2WkR2STdSTUZZ?=
 =?utf-8?B?WndoTEEwcWVnU1JnL2gzNm0xUFNSUUd3SnhLeEF0by9sRnpxTUI4WGppZTJj?=
 =?utf-8?B?bWtiMGMzVWtuaDM3Z2VwVWVIS2FhYjdsY0FyUElQZ3VucHFiUlhmYWNseTV0?=
 =?utf-8?B?TWpxbG5OL1NUWTJDaENBS3VLNjIxNGd3c1B5MURZK2E5QUNlbTU1ZmhwdTYw?=
 =?utf-8?B?RTlEbUhnNjV4eUZPREFmTmRweDFjZWEzSlN3WkRvM25MYXYvaDFQWUFFQXdM?=
 =?utf-8?B?aFpXcUc2Z1QvVExDMEVtUlYwR083enJGeHNXaXBSczRoVGJsaE1tYmZEOWxT?=
 =?utf-8?B?dGROMk1oTEJ4dEJsVGVSQzAwc2x6enlxWDI0czNZNFAwWUtLNDNwSG81Rmty?=
 =?utf-8?B?YmkyVWUwVHoyUTJ3aWk1cWlISGpuYk43OE51S1NNSkJBNStyVlRML1pINDJL?=
 =?utf-8?B?TzhWOVA2eU5YZE1ONUs2WDBkSWxrdDljZkRmN1pWRTEzZ1h3d0dCakVzek9R?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f1f5a-6515-45c7-6521-08de0a679640
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:48:35.5598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ss7gFUN/9Qj17+YqzP0PuBF20UXauw9w7+BXOJUf+4IL/xK4iMlLAYWCwXIe5V8YAbNabqOyxRJBFLij8I7Kyf8nYyCU6a/Ulm/dwIgyuRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073
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

SGkgSmFrdWIsCgpPbiA5LzI2LzIwMjUgMTA6MTcgUE0sIEcgVGhvbWFzLCBSb2hhbiB3cm90ZToK
PiBIaSBKYWt1YiwKPiAKPiBPbiA5LzI2LzIwMjUgNzoyMiBBTSwgSmFrdWIgS2ljaW5za2kgd3Jv
dGU6Cj4+IE9uIFRodSwgMjUgU2VwIDIwMjUgMTY6MzM6MjEgKzA1MzAgRyBUaG9tYXMsIFJvaGFu
IHdyb3RlOgo+Pj4gV2hpbGUgdGVzdGluZyA4MDIuMUFEIHdpdGggWEdNQUMgaGFyZHdhcmUgdXNp
bmcgYSBzaW1wbGUgcGluZyB0ZXN0LCBJCj4+PiBvYnNlcnZlZCBhbiB1bmV4cGVjdGVkIGJlaGF2
aW9yOiB0aGUgaGFyZHdhcmUgYXBwZWFycyB0byBpbnNlcnQgYW4KPj4+IGFkZGl0aW9uYWwgODAy
LjFRIENUQUcgd2l0aCBWTEFOIElEIDAuIERlc3BpdGUgdGhpcywgdGhlIHBpbmcgdGVzdAo+Pj4g
ZnVuY3Rpb25zIGNvcnJlY3RseS4KPj4+Cj4+PiBIZXJl4oCZcyBhIHNuYXBzaG90IGZyb20gdGhl
IHBjYXAgY2FwdHVyZWQgYXQgdGhlIHJlbW90ZSBlbmQuIE91dGVyIFZMQU4KPj4+IHRhZyB1c2Vk
IGlzIDEwMCBhbmQgaW5uZXIgVkxBTiB0YWcgdXNlZCBpcyAyMDAuCj4+Pgo+Pj4gRnJhbWUgMTog
MTEwIGJ5dGVzIG9uIHdpcmUgKDg4MCBiaXRzKSwgMTEwIGJ5dGVzIGNhcHR1cmVkICg4ODAgYml0
cykKPj4+IEV0aGVybmV0IElJLCBTcmM6IDxzcmM+ICg8c3JjPiksIERzdDogPGRzdD4gKDxkc3Q+
KQo+Pj4gSUVFRSA4MDIuMWFkLCBJRDogMTAwCj4+PiA4MDIuMVEgVmlydHVhbCBMQU4sIFBSSTog
MCwgREVJOiAwLCBJRDogMCh1bmV4cGVjdGVkKQo+Pj4gODAyLjFRIFZpcnR1YWwgTEFOLCBQUkk6
IDAsIERFSTogMCwgSUQ6IDIwMAo+Pj4gSW50ZXJuZXQgUHJvdG9jb2wgVmVyc2lvbiA0LCBTcmM6
IDE5Mi4xNjguNC4xMCwgRHN0OiAxOTIuMTY4LjQuMTEKPj4+IEludGVybmV0IENvbnRyb2wgTWVz
c2FnZSBQcm90b2NvbAo+Pgo+PiBBbmQgdGhlIHBhY2tldCBhcnJpdmVzIGF0IHRoZSBkcml2ZXIg
d2l0aCBvbmx5IHRoZSAuMVEgSUQgMjAwIHB1c2hlZD8KPj4KPiAKPiBZZXMsIHRoZSBwYWNrZXQg
YXJyaXZlcyB0aGUgZHJpdmVyIHdpdGggb25seSA4MDIuMVEgSUQuCj4gCj4gW8KgIDIxMC4xOTI5
MTJdIHN0bW1hY2V0aCAxMDgzMDAwMC5ldGhlcm5ldCBldGgwOiA+Pj4gZnJhbWUgdG8gYmUgCj4g
dHJhbnNtaXR0ZWQ6Cj4gW8KgIDIxMC4xOTI5MTddIGxlbiA9IDQ2IGJ5dGUsIGJ1ZiBhZGRyOiAw
eDAwMDAwMDAwNjdjNzgyMjIKPiBbwqAgMjEwLjE5MjkyM10gMDAwMDAwMDA6IHh4IHh4IHh4IHh4
IHh4IHh4IHh4IHh4IHh4IHh4IHh4IHh4IDgxIDAwIDAwIGM4Cj4gW8KgIDIxMC4xOTI5MjhdIDAw
MDAwMDEwOiAwOCAwNiAwMCAwMSAwOCAwMCAwNiAwNCAwMCAwMiA0NiA5YiAwNiAxYiA1YiBiNgo+
IFvCoCAyMTAuMTkyOTMxXSAwMDAwMDAyMDogYzAgYTggMDQgMGEgYzggYTMgNjIgMGUgZDcgMDQg
YzAgYTggMDQgMGIKPj4gSW5kZWVkLCB0aGF0IGxvb2tzIGxpa2UgYSBwcm9ibGVtIHdpdGggdGhl
IGRyaXZlcitIVyBpbnRlcmFjdGlvbi4KPj4gSURLIHdoYXQgdGhlIHJpZ2h0IHRlcm1pbm9sb2d5
IGlzIGJ1dCBJSVJDIFZMQU4gMCBpcyBub3QgYSByZWFsIFZMQU4sCj4+IGp1c3QgYW4gSUQgcmVz
ZXJ2ZWQgZm9yIGZyYW1lcyB0aGF0IGRvbid0IGhhdmUgYSBWTEFOIElEIGJ1dCB3YW50IHRvCj4+
IHVzZSB0aGUgcHJpb3JpdHkgZmllbGQuIFdoaWNoIGV4cGxhaW5zIHdoeSBpdCAid29ya3MiLCBy
ZWNlaXZlciBqdXN0Cj4+IGlnbm9yZXMgdGhhdCB0YWcuIEJ1dCBpdCdzIGRlZmluaXRlbHkgbm90
IGNvcnJlY3QgYmVjYXVzZSBzd2l0Y2hlcwo+PiBvbiB0aGUgbmV0d29yayB3aWxsIG5vIHNlZSB0
aGUgcmVhbCBDLVRBRyBhZnRlciB0aGUgUy1UQUcgaXMgc3RyaXBwZWQuCj4gCj4gWWVzLCB3ZSBh
cmUgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIHJpZ2h0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBk
cml2ZXIKPiBzbyB0aGF0IHRoZSByaWdodCB0YWcgaXMgaW5zZXJ0ZWQgYnkgdGhlIGRyaXZlciBm
b3IgZG91YmxlIGFuZCBzaW5nbGUKPiBWTEFOcy4gQmFzZWQgb24gdGhlIHJlZ2lzdGVyIGNvbmZp
Z3VyYXRpb24gb3B0aW9ucyBmb3IgTUFDX1ZMQU5fSW5jbCBhbmQKPiBNQUNfSW5uZXJfVkxBTl9J
bmNsIHJlZ2lzdGVycyBhbmQgZGVzY3JpcHRvciBjb25maWd1cmF0aW9uIG9wdGlvbnMKPiBhdmFp
bGFibGUsIHRoZSBoYXJkd2FyZSBtYXkgbm90IHN1cHBvcnQgc2ltdWx0YW5lb3VzIG9mZmxvYWRp
bmcgb2YgU1RBRwo+IGZvciA4MDIuMUFEIGRvdWJsZS10YWdnZWQgcGFja2V0cyBhbmQgQ1RBRyBm
b3IgODAyLjFRIHNpbmdsZS10YWdnZWQKPiBwYWNrZXRzLiBJZiB0aGF0IGlzIHRoZSBjYXNlIGRp
c2FibGUgU1RBRyBpbnNlcnRpb24gb2ZmbG9hZGluZyBtYXkgYmUKPiB0aGUgcmlnaHQgYXBwcm9h
Y2guCj4gCj4gQmVzdCBSZWdhcmRzLAo+IFJvaGFuCgpJ4oCZdmUgYWxpZ25lZCBpbnRlcm5hbGx5
IHdpdGggQm9vbiBLaGFpIGFuZCBjb25kdWN0ZWQgZnVydGhlciB2YWxpZGF0aW9uCmFjcm9zcyB2
YXJpb3VzIGNvbmZpZ3VyYXRpb25zIG9mIHRoZSBNQUNfVkxBTl9JbmNsIHJlZ2lzdGVyIGFuZCBU
eApkZXNjcmlwdG9ycy4gQmFzZWQgb24gb3VyIGFuYWx5c2lzLCBpdCBhcHBlYXJzIHRoYXQgdGhl
IGhhcmR3YXJlIGFwcGVhcnMKdG8gbm90IHN1cHBvcnQgc2ltdWx0YW5lb3VzIG9mZmxvYWRpbmcg
b2YgYm90aCBTLVRBRyBmb3IgZG91YmxlIFZMQU4KKDgwMi4xQUQpIHBhY2tldHMgYW5kIEMtVEFH
IGZvciBzaW5nbGUgVkxBTiAoODAyLjFRKSBwYWNrZXRzLgoKQXMgcGVyIHRoZSBYR01BQyBkYXRh
Ym9vazogQ1NWTCBiaXQgb2YgTUFDX1ZMQU5fSW5jbCByZWdpc3RlciBjb250cm9scwp0aGUgVkxB
TiB0eXBlIG9mIHRoZSB0YWcgaW5zZXJ0ZWQgaW4gMTN0aCBhbmQgMTR0aCBieXRlcyBhbmQgQ1NW
TCBiaXQgb2YKTUFDX0lubmVyX1ZMQU5fSW5jbCByZWdpc3RlciBjb250cm9scyB0aGUgVkxBTiB0
eXBlIG9mIHRoZSB0YWcgaW5zZXJ0ZWQKaW4gMTd0aCBhbmQgMTh0aCBieXRlcyBvZiB0aGUgcGFj
a2V0LgoKQ3VycmVudGx5IGRyaXZlciBpcyBjb25maWd1cmVkIHRvIGluc2VydCBvbmx5IFNUQUcg
Zm9yIE1BQ19WTEFOX0luY2wKcmVnaXN0ZXIgd2hpbGUgdGhlIE1BQ19Jbm5lcl9WTEFOX0luY2wg
cmVnaXN0ZXIgaXMgbm90IGNvbmZpZ3VyZWQuCkhvd2V2ZXIgVHggZGVzY3JpcHRvcnMgYXJlIGNv
bmZpZ3VyZWQgZm9yIGJvdGggT3V0ZXIgYW5kIElubmVyIHRhZyBmb3IKODAyLjFBRCBwYWNrZXRz
LgoKQ3VycmVudCBjb25maWd1cmF0aW9uIHVzZWQgaW4gdGhlIGRyaXZlciBpcyBhbWJpZ3VvdXMg
YW5kIG5vdCBkb2N1bWVudGVkCmluIHRoZSBkYXRhYm9vay4gU28gd2UgdGhpbmsgaXQgaXMgbW9y
ZSBhY2N1cmF0ZSB0byBkaXNhYmxlCk5FVElGX0ZfSFdfVkxBTl9TVEFHX1RYIGZvciBEV01BQyBJ
UHMuIFBsZWFzZSBsZXQgdXMga25vdyBpZiBhbnlvbmUgaGFzCmNvbmNlcm5zIHdpdGggdGhpcyBh
cHByb2FjaCBvciBpZiB3ZSBtaWdodCBiZSBtaXNzaW5nIHNvbWUgaW5mby4KCkJlc3QgUmVnYXJk
cywKUm9oYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
