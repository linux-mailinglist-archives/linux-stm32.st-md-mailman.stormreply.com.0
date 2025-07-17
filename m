Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62020B14897
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B507C3F92E;
	Tue, 29 Jul 2025 06:49:50 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FD51C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 12:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+CIOmVBNVsEGzLVuv2BDUhZ+wM2TP2RRAGqNFKx7c8Ul3zU2nBb3qWv5qezKxI7SyJU65kgqSOH6koasJr91lJ0JogEmPSuqOz26p6pqlvD0aV5frnVvlY0FZ8bapIszG4agRNQWrKOxQNss5ukmdNub/iH3CwMIFPBai09r9kSHerqh//jlIK2rXlEYFfvh9/OHEnBcVB3Y5qHlOwptTpCkOuKrW9i9i7nilhHAfhNrGMJrldxGjEdprMc3EFIrqPIguSHAXqD44ZP4d0c4ynuZLZXt20FHxoqb5atXHKjCRu5iPvfW/dHU1DrR8pqZUKXNxsfmUYE0fPaCxJQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvYLM4XY6L7La2t0icRL/chMYAq+wpHKnHTN5t3sHoc=;
 b=Cg2jJnWFTin9TmG64emwPAHl/c96B6w3uta6oC3VxWFVLVoxSWNuBHnnWc2kN4Dtq09viaIDLXDy7bfUm5Px6+3DRXBHN3OCzKozoEW3bqx5icI8YUnire+Qb85UPVy4MtsdwwVz1cfsdk5+k1/Cspdf3WnlRrmej8tJpYtMjODJgUnN5bK+0Nid912Vr3A1LYPFuGx0aXDIsJON2LjUsdHMXmkAp8q1i0mMquXNMP6YbmIOWRuiUd1hK97eJ3DLf2cW6GvMTTHCFokxXR4S7Ef9HlsVWL+SbqjWDmAoAw8o1lHXXXCP25ej32ez2z+15p2YIn2x/sEAVn4E1vt+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvYLM4XY6L7La2t0icRL/chMYAq+wpHKnHTN5t3sHoc=;
 b=Nhd+whoy8CdKuvFbFThG2ctO6vOm3KEVCmI92kh6rQsMoy0ahe6fTHBP/hnQgK+7bDTJJbm+LZR1lsr/mVmCAwuT0A5nuFx7PyuxBDoOzM6vUTneVZgN94CROOyr/pZ1tbdjjYGvwdBzM8GsTAtVX0u3TuE8omTcQl3CjEDVyfT63bzeVwZGB9psCxPGt2ICsWJt91mzQusiK5KxQFBiE4jwgCUzmoRGQ5qHyhHOoSlZCepAXaG3PwydSwYKyTFTYE0nDN8Zy00lSQOS2DragwGlzWJT0FAgkmBbPoCTClOAaGrhJT4D4X265jT5xR2dgCDltOKAAqfQznTxviPVjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by IA3PR03MB7665.namprd03.prod.outlook.com (2603:10b6:208:50c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:59:45 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:59:45 +0000
Message-ID: <74770df8-007a-45de-b77e-6aa491bbb2ae@altera.com>
Date: Thu, 17 Jul 2025 18:29:33 +0530
User-Agent: Mozilla Thunderbird
To: Serge Semin <fancer.lancer@gmail.com>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
 <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|IA3PR03MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bc2f47-f27c-4fee-3772-08ddc531cdd9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SStOendzRHFBRysvTnk5QVBqbjc1VHFKRm5aa0ZiUzhOa0FmUGJTaU93dk1q?=
 =?utf-8?B?aE5Lb010NElvWVJGUXN1aXRaak56VmdRNkhmZVQxaHNLeEhtdWs3Q3ZOMkwv?=
 =?utf-8?B?dk5UZFc5dkcveEVOWE4ydFBFeXdhZnpYYXl6UjhaNGk2WllRY01ldDQrTUY3?=
 =?utf-8?B?TXYyNEdRcHRZL3RBUkJub21uak1sZWhDdzdTcElNR29XbjlqMGhWMEFoc0hG?=
 =?utf-8?B?Z09MNjhxNUJrcnJ3blFYdHorQjJuODBLU2ppWVhSMEpXRkhCWUN4K292VjNR?=
 =?utf-8?B?ais2RVV3RXRUUi9pNmx6TTZSRjNSc1FqanBWeEdZTlNKMlIrVXZlc1JzNXIz?=
 =?utf-8?B?UmUrYzRqcFd4MkdueUhmMU9xOGovakVBNktFQjFYWlh1MkF0ZkZaSE1YMzBk?=
 =?utf-8?B?NDNPblRhaTRkVS9Zc0xoNU9FZlBobVdCUHVvNk1VeVZMa3ZMNTlIOTFUQVJD?=
 =?utf-8?B?NnQwM2RpYmJCSlpaN3FNa3d1VXRsSEovVXcwUHFFS1QwbEI2Q0NvZFRJUVpW?=
 =?utf-8?B?YTU3anlyaTZLK2VrSmJlK0tyTEM1OUhyR2hUR1lIQzNoRkducHF1QTRWV2Vt?=
 =?utf-8?B?MExWZnUxTXd4U0EyODVMNnoxUkRwV2YrNmpOTk9aYkNyRE1wakNMUUp4UDRE?=
 =?utf-8?B?NHIxa2VaYnZVdnZ0a1ZoMmhaUjk4U1VsOTFiSmk5aVpOMXA2OHFSYmt3N3p6?=
 =?utf-8?B?YVNzM1ltWXpMc3VwdXBUZ1d6WmFiZTJ4bnRmQkVXbk9YakpRVWVxc3ZHL2s1?=
 =?utf-8?B?YTN4SmRPOFlGRzVkUjQ4YTFJeEVMQkNyV3FUSFkrek8xTG4zdlkvWGRqbTlr?=
 =?utf-8?B?VFlWN3hYK0VVWU43bXUxdlpaV0YybExqb2k3UTluZ1JrZUlEY05KdVZmNnJv?=
 =?utf-8?B?NnpFcHJ2a1RVRFlEb25vZk9VMVh1Uk9jVHNkNGJMaUFqUG1wVXlxZ2tyUmhq?=
 =?utf-8?B?WkJsVGQzUzBvejl6T3cwR0paUkpGeTJMQlhWVG5BL3ZRVFpuNlFzOGY0ek5t?=
 =?utf-8?B?OEtiem80TUNoRkJXM3FsYTB3TnBuUXlNTU1HNmkrMnVSYzlxVHJIVXNnZlJG?=
 =?utf-8?B?T3NycjFhT1ltNXZGMmcyM1BVSFA0a1BNZXlJaHFMb0U3Mjc3VEV3Z28wTm5K?=
 =?utf-8?B?MzI4MHk4WkoyWlJKN1djRTRKVUhDRXBFYmdLeXo0d0JiOWVtUnVQUExMS3cr?=
 =?utf-8?B?TXR0b3JrOGk4RkJ3dnVXbGdqbDFXVnVvTy9XVVBkb0x4Z1FMTWl6U1VxSkkv?=
 =?utf-8?B?U1BPdDVRWllMZzRYQkprbVBPdTE2bVlLWkJOc2RCbGtCR3J5UFNKcXNqMjNV?=
 =?utf-8?B?emlxZVJwYzByS05sYkF5TmlEYUNiT2FKV3lBeWk5RmlLT1VOaWJRTjA3L1N5?=
 =?utf-8?B?dzdOU1l1dm1TRzNhR1Y2TUhLUlNKVXJ0cmtQR1I4NDVLVW5rakJpcVRsb1k3?=
 =?utf-8?B?K2dJcDNlNmxoa2NUM01Fd3dUNERWd3Jva2pnZHlmT1lrWWMxeTVvWnVMMzF2?=
 =?utf-8?B?eS81M0VlK2dNSnlpRWpFclJ6ODZPUllFZFNKK3RVdVR4Q3dIanRnTXRndkpP?=
 =?utf-8?B?SkFzenl6MGwvd1pPaXVmOWNJMmZhQ1BXcVJUc2Jpamlsa3FZRDM1QTBybmt1?=
 =?utf-8?B?Z0F4TjBqWlZ4TTJkVXVLWWc3MGJtY1A0UloxVXFEaEhmOXZrdGJaWjE0aFo5?=
 =?utf-8?B?TFhScFBqNjBraEFldVMwTWlxTFBMekhBSXdVQkFxRzdtQWRrTWErbWFCTUtV?=
 =?utf-8?B?WEMyZzc0VkZxS0lIMzJUNTB6Qm40ZitwM3E3SHFrQ2xpUm1IN1lVZzRTd0NN?=
 =?utf-8?B?M0l4Y1RERDVUcGE4WTArVEhyZW0yb3lhb0dTL2k2OXhsQThFMEJ2NEs1WUln?=
 =?utf-8?B?cnJHQ1BLMGJKMG1iTVpVRWNpemRSSEMzU0xzTUZURzltaXA5V1JqLzNOSWRk?=
 =?utf-8?Q?XunDqdhPRqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9DMmMwNUNhUzRnWmtLazV5Qk1pVnhnck5JV3VKRGRSWnhMZVl3ZHVTNnR2?=
 =?utf-8?B?Z3Fsb0hRTkM4V2JTc2FxSDloYytnQUtWNXJYREpuaE13YWc5UkMwaWlKRHJV?=
 =?utf-8?B?WlRVSGI3cDViWlcxeFNJck5SNlB4ZE94dWJmU2tpa2FyTXlFVml4YWFVOFcr?=
 =?utf-8?B?Q281dVRVU0pIaU5vVzBacnQrbUlIQUkzMk1kNFhZTENaTTRId0JuYWZPNHhZ?=
 =?utf-8?B?UW9jVGxieEVCS3lacGMxSUhyOUFJREtkSzZZZTBESG9zTlcxbk9UVXkxTUdo?=
 =?utf-8?B?eWk2WW9GSVBZVmJxbE5DM2FXaThPKys5ME1zZGpmMGo0ejZiNUtLWkdmWmJV?=
 =?utf-8?B?aEhjZXcxNEx3bkl1TXBhcUxqWC95cGI4aFFMSWQ2Ui80QmN4a2RjRlRXUGls?=
 =?utf-8?B?ZHR4MHpIdlUwcUtUR0QySWtGWUNFeENQWTFjaURGUUZyNkh2ZXFUS0MvT24y?=
 =?utf-8?B?RVZzdWw5VVROZFprV3NoQWdQYk52V3RrS1dGZVBpOWpSdlVCUTIzZmJsZUxM?=
 =?utf-8?B?VUxtUHVTd080eWVhSkFhYnRkVWN6amt0WlRseE1Yei91NjVDbndIdzd2TVQz?=
 =?utf-8?B?TlNXSlZ2cllUbTIyOFZiK0tqR2N2MFFyWlhocHZNVnhRU2NjRHAwem1DcUx4?=
 =?utf-8?B?TlZWVDlyNVhYL1MxY3FrcFhBTmVMMk9sVXNJV25BamtWUTlqakRVLzcrLzRo?=
 =?utf-8?B?dnVpQjdPb3ZZUGxXU1R6STRVRVlLTVhNOXJvZDRzSFcwMTVRYXAzVzFzc2Iy?=
 =?utf-8?B?M3U3VG55S1FrbDJPbUVnOWNOTWtSMWgxTm9odEZmY2FhUjhDWGtEOFpQSnlW?=
 =?utf-8?B?TEQxVnIxWFNNWlZwbU81bHAyQ2xsMlpTT1J1YTRRN2kwcG1JSWVmazNMRWx0?=
 =?utf-8?B?UEIvVHQ2QU1wYjF0YlhuZkdPZDhBVkxodVl3N1duSGVvZk5zT21YeVdMZW5Z?=
 =?utf-8?B?QktnbUJQTU9RTitVU1pzTGZ3eUtFZE9Xc0M1WnJDOUQ3aVN0dXIzWHBnTFVn?=
 =?utf-8?B?THJuU0VxR1lWeTRrVVVpYXBXczNCVTQzUHFWQmY2d3JuTVpLRHhIOU5vVC9B?=
 =?utf-8?B?MU5iM1J5eDJ0RDFEU2Q0dWdXVzNUQmlZTDE4cFRjWkEwM2huOFNHL2ZwcVhi?=
 =?utf-8?B?dnRVdjR2eTQ1dmxHUzZMeTZ0QjdiMW9LYndjR3lmZm9pQjZsQXpJK1FoYzMx?=
 =?utf-8?B?empNdk0rbjRvSk9OK1dPSDV4Y0dPYkFGVmh6NnErRlR3Z1RCRW9MUS94b1hz?=
 =?utf-8?B?ZndLaGhGZ1FyVkFnWGJFSk1ZUnc3Tm53eXYyaDhlVjdjRnlsS1VrUWpCNzEz?=
 =?utf-8?B?RUxmUWc5a08rOG1PbnNKa01MaUF5cE9NbHJyYi9jMHBvbVlVSHZZVmdydjJS?=
 =?utf-8?B?eE5wZmhSYnh0cXpaVkJCenpIQnNnVzcvZkJQeEkxTUFTQXZPSU0wZ3VYWXIy?=
 =?utf-8?B?amE2VnRrMXF4ckYyNWNzZG8vY25IV1ZhWWxBSUxzdEdoNHc5OUhOQkdTaXJY?=
 =?utf-8?B?NTRkQyt0c2N6QmgwdTV5UVloNjNuRTFlOWhKTzJVTnluOE12MURUT2FOMnlN?=
 =?utf-8?B?ZkZQQ3MzQTN2ZnlacGdDbXZYd1ByMktJR0ZXbXVqamE3S3NqSGpLTFFQVWJX?=
 =?utf-8?B?MUx5VENHLys4bWduemhUUkE0aW1yZnorRGFGK1YyWGVyTUxuaHd5c24wazBH?=
 =?utf-8?B?SWpOTFpEOEljYTY3bjRVK1hkWlhVSG1KTm1pRWZpd0wwYWNtbDErWEJaRjZE?=
 =?utf-8?B?b3RUYzQ4NTdic3pNY1gxdXNkODdMVWFxSzFOeEJ3K3ZWNFVkdUp1Y1Jodjc1?=
 =?utf-8?B?a3RvUnRBRmcwZDRkTEVMMXJXNkNBV1dRQnRvY3dzTXIrbEk0ZUY1WE9ZbEoy?=
 =?utf-8?B?VmpDa095MXRxb0owa3U4T3RoSGNiZ0ZlelJlV2R2OXY4RzF4Z2JKOU5XK0d3?=
 =?utf-8?B?ZHFZU1FIMEdSNWFrYUVveGtzeDlaeDcrNEk5YjFXaVZIdGcycGVZMFZjVjQw?=
 =?utf-8?B?TnVMTDVRU216ZWJRcXVEL0xOekt3cGVhL2MzZ0FUVC9raFQzUGw0bzA4Zity?=
 =?utf-8?B?ajFta092bEw1RFJVZURoc3dNVmc0REJlbGtSSUNqbFlDYThEZkZaSm1wUEN0?=
 =?utf-8?B?ZjlvOWFOckluY2s2cVBzQ1pjRlNTQ1RYZmxuNzFUSFZReFk2dkg1SVo4K2ls?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bc2f47-f27c-4fee-3772-08ddc531cdd9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:59:45.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSg0q1cijV6Pzh9yycTcnuXz/85bJFzOPJIseXHr4HAW/NmeGbpS59+ugodlGi4k0OF8ruyyr/kmcbSUh1QWDbmty4SSIB/rhjDhYwjeiPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7665
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: xgmac: Correct
 supported speed modes
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

SGkgU2VyZ2UsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMgYW5kIHRoZSBkZXRhaWxl
ZCBleHBsYW5hdGlvbi4KCk9uIDcvMTcvMjAyNSA1OjE3IFBNLCBTZXJnZSBTZW1pbiB3cm90ZToK
PiBPbiBUdWUsIEp1bCAxNSwgMjAyNSBhdCAwNzowMzo1OFBNICswNTMwLCBHIFRob21hcywgUm9o
YW4gd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4KPj4gVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBh
dGNoLgo+Pgo+PiBPbiA3LzE0LzIwMjUgNzoxMiBQTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+PiBP
biBNb24sIEp1bCAxNCwgMjAyNSBhdCAwMzo1OToxOFBNICswODAwLCBSb2hhbiBHIFRob21hcyB2
aWEgQjQgUmVsYXkgd3JvdGU6Cj4+Pj4gRnJvbTogUm9oYW4gRyBUaG9tYXMgPHJvaGFuLmcudGhv
bWFzQGFsdGVyYS5jb20+Cj4+Pj4KPj4+PiBDb3JyZWN0IHN1cHBvcnRlZCBzcGVlZCBtb2RlcyBh
cyBwZXIgdGhlIFhHTUFDIGRhdGFib29rLgo+Pj4+IENvbW1pdCA5Y2I1NGFmMjE0YTcgKCJuZXQ6
IHN0bW1hYzogRml4IElQLWNvcmVzIHNwZWNpZmljCj4+Pj4gTUFDIGNhcGFiaWxpdGllcyIpIHJl
bW92ZXMgc3VwcG9ydCBmb3IgMTBNLCAxMDBNIGFuZAo+Pj4+IDEwMDBIRC4gMTAwMEhEIGlzIG5v
dCBzdXBwb3J0ZWQgYnkgWEdNQUMgSVAsIGJ1dCBpdCBkb2VzCj4+Pj4gc3VwcG9ydCAxME0gYW5k
IDEwME0gRkQgbW9kZSwgYW5kIGl0IGFsc28gc3VwcG9ydHMgMTBNIGFuZAo+Pj4+IDEwME0gSEQg
bW9kZSBpZiB0aGUgSERTRUwgYml0IGlzIHNldCBpbiB0aGUgTUFDX0hXX0ZFQVRVUkUwCj4+Pj4g
cmVnLiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIDEwTSBhbmQgMTAwTSBzcGVlZCBtb2Rl
cwo+Pj4+IGZvciBYR01BQyBJUC4KPj4+Cj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHd4Z21hYzJfZG1hLmMKPj4+PiBAQCAtNDA1LDYgKzQwNSw3IEBAIHN0
YXRpYyBpbnQgZHd4Z21hYzJfZ2V0X2h3X2ZlYXR1cmUodm9pZCBfX2lvbWVtICppb2FkZHIsCj4+
Pj4gICAgCWRtYV9jYXAtPnNtYV9tZGlvID0gKGh3X2NhcCAmIFhHTUFDX0hXRkVBVF9TTUFTRUwp
ID4+IDU7Cj4+Pj4gICAgCWRtYV9jYXAtPnZsaGFzaCA9IChod19jYXAgJiBYR01BQ19IV0ZFQVRf
VkxIQVNIKSA+PiA0Owo+Pj4+ICAgIAlkbWFfY2FwLT5oYWxmX2R1cGxleCA9IChod19jYXAgJiBY
R01BQ19IV0ZFQVRfSERTRUwpID4+IDM7Cj4+Pj4gKwlkbWFfY2FwLT5tYnBzXzEwXzEwMCA9ICho
d19jYXAgJiBYR01BQ19IV0ZFQVRfR01JSVNFTCkgPj4gMTsKPj4+Cj4+PiBUaGUgY29tbWl0IG1l
c3NhZ2UgZG9lcyBub3QgbWVudGlvbiB0aGlzIGNoYW5nZS4KPj4KPj4gQWdyZWVkLiBXaWxsIGRv
IGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Cj4+Pgo+Pj4gV2hhdCBkb2VzIFhHTUFDX0hXRkVBVF9H
TUlJU0VMIG1lYW4/IFRoYXQgYSBTRVJERVMgc3R5bGUgaW50ZXJmYWNlIGlzCj4+PiBub3QgYmVp
bmcgdXNlZD8gQ291bGQgdGhhdCBiZSB3aHkgU2VyZ2UgcmVtb3ZlZCB0aGVzZSBzcGVlZHM/IEhl
IHdhcwo+Pj4gbG9va2luZyBhdCBzeXN0ZW1zIHdpdGggYSBTRVJERVMsIGFuZCB0aGV5IGRvbid0
IHN1cHBvcnQgc2xvd2VyCj4+PiBzcGVlZHM/Cj4+Pgo+Pj4gCUFuZHJldwo+PiBBcyBwZXIgdGhl
IFhHTUFDIGRhdGFib29rIHZlciAzLjEwYSwgR01JSVNFTCBiaXQgb2YgTUFDX0hXX0ZlYXR1cmVf
MAo+PiByZWdpc3RlciBpbmRpY2F0ZXMgd2hldGhlciB0aGUgWEdNQUMgSVAgb24gdGhlIFNPQyBp
cyBzeW50aGVzaXplZCB3aXRoCj4+IERXQ1hHX0dNSUlfU1VQUE9SVC4gU3BlY2lmaWNhbGx5LCBp
dCBzdGF0ZXM6Cj4+ICIxMDAwLzEwMC8xMCBNYnBzIFN1cHBvcnQuIFRoaXMgYml0IGlzIHNldCB0
byAxIHdoZW4gdGhlIEdNSUkgSW50ZXJmYWNlCj4+IG9wdGlvbiBpcyBzZWxlY3RlZC4iCj4+Cj4+
IFNvIHllcywgaXTigJlzIGxpa2VseSB0aGF0IFNlcmdlIHdhcyB3b3JraW5nIHdpdGggYSBTRVJE
RVMgaW50ZXJmYWNlIHdoaWNoCj4+IGRvZXNuJ3Qgc3VwcG9ydCAxMC8xMDBNYnBzIHNwZWVkcy4g
RG8geW91IHRoaW5rIGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlCj4+IHRvIGFkZCBhIGNoZWNrIGZv
ciB0aGlzIGJpdCBiZWZvcmUgZW5hYmxpbmcgMTAvMTAwTWJwcyBzcGVlZHM/Cj4gCj4gRFcgWEdN
QUMgSVAtY29yZSBvZiB2Mi54IGFuZCBvbGRlciBkb24ndCBzdXBwb3J0IDEwLzEwME1icHMgbW9k
ZXMKPiBuZWl0aGVyIGluIHRoZSBYR01JSSBub3IgaW4gdGhlIEdNSUkgaW50ZXJmYWNlcy4gVGhh
dCdzIHdoeSBJIGRyb3BwZWQKPiB0aGUgMTAvMTAwTWJwcyBsaW5rIGNhcGFiaWxpdGllcyByZXRh
aW5pbmcgMUcsIDIuNUcgYW5kIDEwRyBzcGVlZHMKPiBvbmx5ICh0aGUgb25seSBzcGVlZHMgc3Vw
cG9ydGVkIGZvciBEVyBYR01BQyAxLjIwYS8yLjExYSBUeCBpbiB0aGUKPiBNQUNfVHhfQ29uZmln
dXJhdGlvbi5TUyByZWdpc3RlciBmaWVsZCkuIEFsdGhvdWdoIEkgc2hvdWxkIGhhdmUKPiBkcm9w
cGVkIHRoZSBNQUNfNTAwMEZEIHRvbyBzaW5jZSBpdCBoYXMgYmVlbiBzdXBwb3J0ZWQgc2luY2Ug
djMuMAo+IElQLWNvcmUgdmVyc2lvbi4gTXkgYmFkLigKPiAKPiBTdGFydGluZyBmcm9tIERXIFhH
TUFDIHYzLjAwYSBJUC1jb3JlIHRoZSBsaXN0IG9mIHRoZSBzdXBwb3J0ZWQgc3BlZWRzCj4gaGFz
IGJlZW4gZXh0ZW5kZWQgdG86IDEwLzEwME1icHMgKE1JSSksIDFHLzIuNUcgKEdNSUkpLCAyLjVH
LzVHLzEwRwo+IChYR01JSSkuIFRodXMgdGhlIG1vcmUgYXBwcm9wcmlhdGUgZml4IGhlcmUgc2hv
dWxkIHRha2UgaW50byBhY2NvdW50Cj4gdGhlIElQLWNvcmUgdmVyc2lvbi4gTGlrZSB0aGlzOgo+
IAlpZiAoZG1hX2NhcC0+bWJwc18xMDAwICYmIE1BQ19WZXJzaW9uLlNOUFNWRVIgPj0gMHgzMCkK
PiAJCWRtYV9jYXAtPm1icHNfMTBfMTAwID0gMTsKPiAgPiBUaGVuIHlvdSBjYW4gdXNlIHRoZSBt
YnBzXzEwMDAgYW5kIG1icHNfMTBfMTAwIGZsYWdzIHRvIHNldCB0aGUgcHJvcGVyCj4gTUFDLWNh
cGFiaWxpdGllcyB0byBody0+bGluay5jYXBzIGluIHRoZSBkd3hnbWFjMl9zZXR1cCgpIG1ldGhv
ZC4gSQo+IHdvdWxkIGhhdmUgYWRkZWQgdGhlIFhHTUlJIDIuNUcvNUcgTUFDLWNhcGFiaWxpdGll
cyBzZXR0aW5nIHVwIHRvIHRoZQo+IGR3eGdtYWMyX3NldHVwKCkgbWV0aG9kIHRvbyBmb3IgdGhl
IHYzLnggSVAtY29yZXMgYW5kIG5ld2VyLgo+IAoKQWdyZWVkLiBXaWxsIGRvIGluIHRoZSBuZXh0
IHZlcnNpb24uCgpXaWxsIGVuc3VyZSB0aGF0IG1icHNfMTBfMTAwIGlzIHNldCBvbmx5IGlmIFNO
UFNWRVIgPj0gMHgzMCBhbmQgd2lsbAphbHNvIGNvbmRpdGlvbmFsbHkgZW5hYmxlIDIuNUcvNUcg
TUFDIGNhcGFiaWxpdGllcyBmb3IgSVAgdmVyc2lvbnMKdjMuMDBhIGFuZCBhYm92ZS4KCkluIHRo
ZSBzdG1tYWNfZHZyX3Byb2JlKCkgdGhlIHNldHVwKCkgY2FsbGJhY2sgaXMgaW52b2tlZCBiZWZv
cmUKaHdfY2FwX3N1cHBvcnQgaXMgcG9wdWxhdGVkLiBHaXZlbiB0aGF0LCBkbyB5b3UgdGhpbmsg
aXQgaXMgc3VmZmljaWVudAp0byBhZGQgdGhlc2UgY2hlY2tzIGludG8gdGhlIGR3eGdtYWMyX3Vw
ZGF0ZV9jYXBzKCkgaW5zdGVhZD8KCj4gLVNlcmdlKHkpCj4gCj4+Cj4+IEJlc3QgUmVnYXJkcywK
Pj4gUm9oYW4KPj4KCkJlc3QgUmVnYXJkcywKUm9oYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
