Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE39B14882
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 773AEC3F92E;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFD7FC3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jul 2025 11:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DadR7Yw4Mzzm3nvz0hi0IAoc3JeKOSe7V/9DItouKnFyf0c6jgSlq0kUwD8ZrCj7UnVV5PNdgKxG2QEapyfYhy3FUpt0VgyhROsD0jcCQkCHsC0M3AcGi6amlxVdqArhcd38VlEg9JNcuKXIdg2PwU7UfVxuW1MB3WEXu1AmfeOUn4WqEsQisSbItJQU5elvyL+8VjDCHYyvCALAyAICahS4abj1gG6VyTtKEey8CQ1Gd3QO0RmoFPoycG8tPK+OOeXving8JICODQS2iOKrObgA2aoIMsu5ieFCEO0kLuYmNb4V9v6ujwdP/lzW5obHK7pjMIz9gJ8Pzvvl/3VRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YImI/g/ZSoXf6HNtrMNoX3JSUWhlidlSp8+GYuARRVA=;
 b=ENHBkRqCZyKcwdGFJzCv9WhegzV4C9Edw4RXSOCAZJTiZPxO2YMgx7e00FGIgWdHfGHBG3WYBFj8k8CaTDt9+yjuyd9Rgv+FGpAgJ6jNZCVS8KJZ4vZ979TNFiPFBzJYhkSsIMOdwqoQ/F/YPAlqbOGzjYqKkvdVGIjn4wkYAQ6SLhI74V46XOI71OnsXUBViKCBOE60lK0t2T22AM0tT+4jMib2EID5Kuy5AE2QOjZVUSPUJ1ZTiDhxuDoaLysV0moM9yFTmRGfU4QeG4aGHuglPPOOrOA9/0dayVOvgbysH1Tz0Vc6+oCP5pmdcOVraDKS/LSlXQFPE6sK3hbuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YImI/g/ZSoXf6HNtrMNoX3JSUWhlidlSp8+GYuARRVA=;
 b=XhYbWXF4khBBbMZtV8Nk6VcZYKo8idwRXLryCJRWh5UXOs5r+1eHmEzHeyOdXXagnZyamZgn4Rt30/CdgJV8BHqdRIfALUeBEISrxhoUxYzjLSf/4komrMMeFGGTYkoARbP5vdx1eD/yYQkMzw1IzPFOnU7hNrf4OI5fNe6mGHErLi77jMKjjQWURX0gG6O+hJrwzH6Ck8H81f9vt695Tqbv7R76VEXsDnMdlzAgHYUiJiP3BDZgb/QTfj22b4igeBF/ErSJTaChem107qxbWflGVt6IH9f85sf9eM7B541K+9oKwtGg0ubXUvAMrDrAg1PPL5fcTKVPC3LTb1lnrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by BLAPR03MB5554.namprd03.prod.outlook.com (2603:10b6:208:290::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 11:38:59 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8943.025; Fri, 18 Jul 2025
 11:38:58 +0000
Message-ID: <f568bfdf-31af-4589-97c8-744a63a2f67c@altera.com>
Date: Fri, 18 Jul 2025 17:08:46 +0530
User-Agent: Mozilla Thunderbird
To: Serge Semin <fancer.lancer@gmail.com>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
 <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
 <74770df8-007a-45de-b77e-6aa491bbb2ae@altera.com>
 <ae4b3iobvbdyyijkpqhh4xv32rnfql2nvzmlzvmfbluefecy7z@t5o42w4orpfi>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <ae4b3iobvbdyyijkpqhh4xv32rnfql2nvzmlzvmfbluefecy7z@t5o42w4orpfi>
X-ClientProxiedBy: MA5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::13) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|BLAPR03MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d1f3b7-143f-4a67-a092-08ddc5efaec4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFN1a3VIdXFiQ3pxMkFHNXBldEpYd3FtYXVPVDZTaW1NYVZBS01ZbHhmYzQv?=
 =?utf-8?B?SlZCMDVDdlM0SDZwajNHbHAvMllWeHhOLzBhNXJObHJyQU0rM3VoZVUvemEr?=
 =?utf-8?B?WE1TVmd3R2RjQmZHNmJ2dTdkeTZhOGJSUXpGNjJ1bTBVVmZCdWVRVHdvYlhI?=
 =?utf-8?B?MlNDcExrZzVSM0FpWWIzWUpueENlR1IyQ2tyYm4xMUdsNmFEMU8rM3JuWnZZ?=
 =?utf-8?B?eHVmQnZ1VmUyaElNQ0VqdkMwSjdtVUJqSlE3SWNzbzNFaExhemNDL1Z5T3F1?=
 =?utf-8?B?ZHJDMGUrZnZnaFFDVEdIbm1BY2NOdUNodEQvbDIwRUpTVGtUeVNJbTNZN0F3?=
 =?utf-8?B?T0ptV1lqWEw0RkI3QVY3SWRTL2pjY1libDgrd3gvY3NURXRXdE5hd0Q3eklI?=
 =?utf-8?B?QmE1M3VFL05SL21KM0Z4eTJHNVJ0WC93MnhsdzJXeWsweFI0Z2FNTHdSTlh5?=
 =?utf-8?B?SWZ0N1FLdE5POWxWTHpWOWE0QXE0eGdFRGV3OTVHUXAwempWdVRCYXVPMWpN?=
 =?utf-8?B?V1R3Tk5yNk1wamtNZVVVc0lXNk5qdjFVdHRtOTlMcWVUOW1maExneXB0eFlx?=
 =?utf-8?B?c1FPcWVGOGFibC9TSXJEWWNyY3VzcWE1SllZNThKbGQwSVIwMTNIN1dVc2Vl?=
 =?utf-8?B?WFkrdG8vRHRwcG1mUFU1R2dsclUvaXRTdUlnaXlET0t2Nzk4K2sxQzNNdEdy?=
 =?utf-8?B?d0dWVkxGUUlNOXNDL0NOYmhnNHdaUTJQeCs4Tk5RSlRVWnByL1UxZEkzRjhS?=
 =?utf-8?B?bXk5Wkc5VEdXME1hVkdDUEw3MUVMZXZhc1RWeGxxQzR5Ymk5OUNpcm5mNUUw?=
 =?utf-8?B?dVZJbjVaWndCM2NWYnh5QTRDQjh4Y2QxR1F4ZXVKS2x1dUVtb1FNTllNZkxN?=
 =?utf-8?B?MDZJMEZUSmpjNHgwNWVOQW9ab3Nsc1Z2dU93Z0N0a1dIaUdhL0NoWUhKdDVj?=
 =?utf-8?B?ZzNhRXNZdy8wcFpzNlZQYXpMTG9tNDk0WllPcGlkYTBuSzA0cjVNVWpaeGFt?=
 =?utf-8?B?cEtTZy9UbmZ0c3V1YnVpN09VNlduRHRrVW9DUnViQ0txb1M2ZjBKc3VRNit4?=
 =?utf-8?B?dC9GWVlnNS83YVlyV3NkR2ZBbk5SdG5scmJmOWpFdXoyaUtzczJFK2JpWGp3?=
 =?utf-8?B?aTNDTGNYMW85dExhVncrUFhhdmo2eHZWeGpQNG9XN0dzRDl4Q0FUbU5JbUFT?=
 =?utf-8?B?RysyZ1EyakYvSUdlV0pKa3NtZ0g5aENpRHpxTkg5SG9KUWtvQXFkeHdza1Nv?=
 =?utf-8?B?eDV5M2pSem8rSUdzR3FCTzcxMjgwWWlJUjJwWUY0bzZ2TnRIZ0FZaFlXN2ZT?=
 =?utf-8?B?cENicGlWNXVpY2M2VDFqOVA3NS9wVy9laTRDVVhzTXpqN05YU2lhZEZ2Qk85?=
 =?utf-8?B?am9OQjl1SVlnMWFVQi9rK2NTb2JtRTUxb3BKUERHQnpWR20wZXVzRmdUQVpF?=
 =?utf-8?B?Q2pteWpzeTRMKytSSFFBYldia1BucWJmTmNPaThZbTJnb3k3cGlldTg1ODMw?=
 =?utf-8?B?elgzNzdrRnU4UWpLV3p6aURqR3hYaWhEcDlndFJBckZpMnkrRGtQWWhsNDlM?=
 =?utf-8?B?cHpnZVZYbkYra0dDMWozZnd2ektRM0VJVzVOcnJYbWhSeVNSM3BIQWJsL2k1?=
 =?utf-8?B?aDhCcDVUS29OUkhtTlA5SEczQ1RydVdvNDhpMlZJK3BtRGc3eXlvNTNqdERR?=
 =?utf-8?B?V1ZSQldTdVZxVmF1cnBiNm9QMk9CakdyK3hLT21UQkVGSXJJMEJpblBvY2hw?=
 =?utf-8?B?OTZHQ0UvRHNlNkFoSC9iVE9DckRId1ZXSXhpNVF5WjhWYkRBcFlYZmFiLzl4?=
 =?utf-8?B?eHNvRWg3NGROZWovRnJsUnR1NkN6S1dXUjNGdU9UN2pqTUdvbDRJeHJhREFP?=
 =?utf-8?B?QVBUb2NERkx2eVVhcjNlQUNTdDY0VTBFU0J3V0ZlaHcyeDdFeHBjcXFnSCs1?=
 =?utf-8?Q?q+42rtYo8yU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sll6NXRBU0NwOWNwZWpoZ000RlZOcDdnUElPNzJaQXFRSExJRU0wcjRlT002?=
 =?utf-8?B?Y09nWnNhVXdkOTBtamh2MEk2TWFVN2ZyOGEvYWZJSjJHWS80V3lQRGlhS0RI?=
 =?utf-8?B?OENrUFhFVVBQY1ZqUDRINW5UYXA5L1NJaHhKNGtLUHcybUlSc25ucHZ1Ymdw?=
 =?utf-8?B?MnNhQ0t4eGlJSlV6eEF6N0Y2OFlXZ0hsSmUwSnJrQWpaQmxTbUl5aUdNeWYy?=
 =?utf-8?B?eldJa0NEc0lUelhFVGgwTGJQK2xHOThVSnFSeDI5eFJ5Vlp5ckRKVkp1T0lC?=
 =?utf-8?B?TFFIT1FWaVN4OEd2Y1hrZ3Bmb3VaT3libFNoQjNzRUVVNFl0WmRmSE8wUGZQ?=
 =?utf-8?B?emhIYkJjYXVkNVZkSGJ5OEtYWG1NVituSi82elBwd08vQzd0R1JLWjBocnBG?=
 =?utf-8?B?d3J5VnFlL00zN0tZaDYwZmZZMFJiTzNRclA2bVdvSkNjTEF5eDdGVTZVZTVq?=
 =?utf-8?B?cGdkYUxudXRkTm1QQWpqalpQTTdPVktwaWFiclhTd0FMSHgrZkpIQjNiemwz?=
 =?utf-8?B?ZjAzN1ZIam10TXFRQjVieTA5ZWJibFhNWTJMWXRrSkE1WFB6dU9MdXozZlh0?=
 =?utf-8?B?c1NmampqdDlyN2pzK1NXczlrYzdLN3g4b2thQTI1S0tHa2NkbFRRNzM1Rjdt?=
 =?utf-8?B?Ny9hYzlyYkhmb0cwOTU3aU1QVlgxOUtoRUpwSWVHMjF5RDlWazdQMC9hdjhO?=
 =?utf-8?B?UFlPYUpobG9hb0NtT3l3T09FMGVyLzc3dUtoT200VjJ6SmhKYlVnMTRKc2xC?=
 =?utf-8?B?OVNKU25uZFA2M1R1TFVTRVdaT1YwRGd2SWtKUUtGRnp0N1VyV3ZyMTY1VE9N?=
 =?utf-8?B?YXNrWWlTdWloQllvd3RFVnkzNFJEQXJpRHpCS0JXWGNFZGU0Q1EzazN4MWVo?=
 =?utf-8?B?T0VHYXA1NENUZDBMK2YrVnVoVituayt1VHpoUG0zazFoQkVycFd2bEJIb2dY?=
 =?utf-8?B?d2hjRVhyeVJoNCtUOWxoTnZPeHViRDlVS2p6b3NxekJHTndsL2Z6OUNOaGJq?=
 =?utf-8?B?cHZTQm1YWUZJQTd3Ymg5UXdRdGpDRkJuYmkrT0MrcHNPRjRHUkthUjRLQksv?=
 =?utf-8?B?TVd3cE5wWHVpcmJ0RWVpWnlSQm00a094dWZ4M3RiSEZIK20rMFIyQlF5R3Zq?=
 =?utf-8?B?TzJDaUdwd2w0VHp1SWtKbjVWZ1Zmc09jTTVMYUd0WDZ2ZHdjTmhJOXNudjMw?=
 =?utf-8?B?c1NOTEFjTS9VaVJwUy9GUU9XZVpsODJXYXdDeFFvZlFKTW1YZk1NeFR1ZENa?=
 =?utf-8?B?ZFB3NUxNYnhzK0p5M2hPcG5NMGgrVk4zSEt1RG1IYVd5VDhDbC9lZ2FRZUIy?=
 =?utf-8?B?Tkx0REFsempzeWdkZkVjbFQ1TmpDTEI3R3FIMjQ5eE5xT1hpNE1ZRUw5d0Qz?=
 =?utf-8?B?dWRzdmdUdEN4a2I5YTl4TkVtZUg4RFNNSHdqbmNGOWdnOXMvK3ZrSXVMS2xO?=
 =?utf-8?B?bDZ1TzVtWGdvblo4U3Roa2FUWENBMTRDcUYzRy9UdUdyUk1wdm5tdHg0azEv?=
 =?utf-8?B?RmJOTjB1VUhPYVIzdm1HdDZhaWJHWWVTMGJLL2hiSWx6OHlqeGZlNjJoMGYz?=
 =?utf-8?B?VHEvU1lPZEVRV3hpd3gvYUxHKzI1cFZ5VXBCSWRZOWVmbHlGTUNaQ2lDR0R5?=
 =?utf-8?B?R2JQT3QwTlduSDQvVUlQQjVxV1o3RW1GcDdBUW80ODlQcTk3WisrQnVwaWFs?=
 =?utf-8?B?eEVObWx4WnlubW90UzBWSlN6dm9sd1NwNllDb2tocTRSNmZQQklBcEdmNVR2?=
 =?utf-8?B?TnlFZ2xDblk1OUY0Z2FHWjUwNjN2dWZUamh4QlR0RHVVRDBZRm1nV3BKdnJq?=
 =?utf-8?B?d2k0VXd1d05vUVJlY1lKQ0t0NGhHUDVSNDR5VWtlQWVMaVVReUJueXVQdVlO?=
 =?utf-8?B?eG9aK1Nod1paRHAvd1QrMUNybzA4aFlPblcwa2xzRlNqcXNZSU5QME02UjJt?=
 =?utf-8?B?aUMrVzlwLzlFb2c5QlBlZElNUnJsMEFEdElmZktrTS9kcUdZT2p5WVY2Vm1x?=
 =?utf-8?B?N3pScWdGNUVXUkpOdTVjcExoMUd2dEpPeHNrQU5ueHhDWVdzNVdjSHUyTGxK?=
 =?utf-8?B?dVIyOTZWYjM3N3UzVmRWK012Ty9oK2Q1b1JkazFPN0FLQkRSMVowRFNKdTFC?=
 =?utf-8?B?empkSTZLOEozbi95cVArZHNFTEY2QStxVXYvaTNHdC9oK3RYcDRmRE1GMitz?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d1f3b7-143f-4a67-a092-08ddc5efaec4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:38:58.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr4gVd2AaUHIkGAvP8iwF5GT8ASfVWHNPuE29BROKyFQ60+Rs5EGYq8vXTsm+N9u0c0XlWhO47w6i4OAOGBEtYWHONGVQga5dY/0csFDylk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5554
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

SGkgU2VyZ2UsCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCByZXNwb25zZS4KCk9uIDcvMTcvMjAy
NSAxMDo1MiBQTSwgU2VyZ2UgU2VtaW4gd3JvdGU6Cj4+PiBEVyBYR01BQyBJUC1jb3JlIG9mIHYy
LnggYW5kIG9sZGVyIGRvbid0IHN1cHBvcnQgMTAvMTAwTWJwcyBtb2Rlcwo+Pj4gbmVpdGhlciBp
biB0aGUgWEdNSUkgbm9yIGluIHRoZSBHTUlJIGludGVyZmFjZXMuIFRoYXQncyB3aHkgSSBkcm9w
cGVkCj4+PiB0aGUgMTAvMTAwTWJwcyBsaW5rIGNhcGFiaWxpdGllcyByZXRhaW5pbmcgMUcsIDIu
NUcgYW5kIDEwRyBzcGVlZHMKPj4+IG9ubHkgKHRoZSBvbmx5IHNwZWVkcyBzdXBwb3J0ZWQgZm9y
IERXIFhHTUFDIDEuMjBhLzIuMTFhIFR4IGluIHRoZQo+Pj4gTUFDX1R4X0NvbmZpZ3VyYXRpb24u
U1MgcmVnaXN0ZXIgZmllbGQpLiBBbHRob3VnaCBJIHNob3VsZCBoYXZlCj4+PiBkcm9wcGVkIHRo
ZSBNQUNfNTAwMEZEIHRvbyBzaW5jZSBpdCBoYXMgYmVlbiBzdXBwb3J0ZWQgc2luY2UgdjMuMAo+
Pj4gSVAtY29yZSB2ZXJzaW9uLiBNeSBiYWQuKAo+Pj4KPj4+IFN0YXJ0aW5nIGZyb20gRFcgWEdN
QUMgdjMuMDBhIElQLWNvcmUgdGhlIGxpc3Qgb2YgdGhlIHN1cHBvcnRlZCBzcGVlZHMKPj4+IGhh
cyBiZWVuIGV4dGVuZGVkIHRvOiAxMC8xMDBNYnBzIChNSUkpLCAxRy8yLjVHIChHTUlJKSwgMi41
Ry81Ry8xMEcKPj4+IChYR01JSSkuIFRodXMgdGhlIG1vcmUgYXBwcm9wcmlhdGUgZml4IGhlcmUg
c2hvdWxkIHRha2UgaW50byBhY2NvdW50Cj4+PiB0aGUgSVAtY29yZSB2ZXJzaW9uLiBMaWtlIHRo
aXM6Cj4+PiAJaWYgKGRtYV9jYXAtPm1icHNfMTAwMCAmJiBNQUNfVmVyc2lvbi5TTlBTVkVSID49
IDB4MzApCj4+PiAJCWRtYV9jYXAtPm1icHNfMTBfMTAwID0gMTsKPj4+ICAgPiBUaGVuIHlvdSBj
YW4gdXNlIHRoZSBtYnBzXzEwMDAgYW5kIG1icHNfMTBfMTAwIGZsYWdzIHRvIHNldCB0aGUgcHJv
cGVyCj4+PiBNQUMtY2FwYWJpbGl0aWVzIHRvIGh3LT5saW5rLmNhcHMgaW4gdGhlIGR3eGdtYWMy
X3NldHVwKCkgbWV0aG9kLiBJCj4+PiB3b3VsZCBoYXZlIGFkZGVkIHRoZSBYR01JSSAyLjVHLzVH
IE1BQy1jYXBhYmlsaXRpZXMgc2V0dGluZyB1cCB0byB0aGUKPj4+IGR3eGdtYWMyX3NldHVwKCkg
bWV0aG9kIHRvbyBmb3IgdGhlIHYzLnggSVAtY29yZXMgYW5kIG5ld2VyLgo+Pj4KPj4KPj4gQWdy
ZWVkLiBXaWxsIGRvIGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Cj4+IFdpbGwgZW5zdXJlIHRoYXQg
bWJwc18xMF8xMDAgaXMgc2V0IG9ubHkgaWYgU05QU1ZFUiA+PSAweDMwIGFuZCB3aWxsCj4+IGFs
c28gY29uZGl0aW9uYWxseSBlbmFibGUgMi41Ry81RyBNQUMgY2FwYWJpbGl0aWVzIGZvciBJUCB2
ZXJzaW9ucwo+PiB2My4wMGEgYW5kIGFib3ZlLgo+Pgo+PiBJbiB0aGUgc3RtbWFjX2R2cl9wcm9i
ZSgpIHRoZSBzZXR1cCgpIGNhbGxiYWNrIGlzIGludm9rZWQgYmVmb3JlCj4+IGh3X2NhcF9zdXBw
b3J0IGlzIHBvcHVsYXRlZC4gR2l2ZW4gdGhhdCwgZG8geW91IHRoaW5rIGl0IGlzIHN1ZmZpY2ll
bnQKPj4gdG8gYWRkIHRoZXNlIGNoZWNrcyBpbnRvIHRoZSBkd3hnbWFjMl91cGRhdGVfY2Fwcygp
IGluc3RlYWQ/Cj4gCj4gQXJyZ2gsIEkgd2FzIGxvb2tpbmcgYXQgbXkgbG9jYWwgcmVwbyB3aXRo
IGEgcmVmYWN0b3JlZCBod2lmIGluaXRpYWxpemF0aW9uCj4gcHJvY2VkdXJlIHdoaWNoLCBhbW9u
Z3N0IG90aGVyIHRoaW5ncywgaW1wbGllcyB0aGUgSFctZmVhdHVyZXMgZGV0ZWN0aW9uCj4gcGVy
Zm9ybWVkIGluIHRoZSBzZXR1cCBtZXRob2RzLigKPiBTbyBpbiBjYXNlIG9mIHRoZSB2YW5pbGxh
IFNUTU1BQyBkcml2ZXIgQUZBSUNTIHRoZXJlIGFyZSB0aHJlZSBvcHRpb25zCj4gaGVyZToKPiAK
PiAxLiBSZXBlYXQgd2hhdCBJIGRpZCBpbiBteSBsb2NhbCByZXBvIGFuZCBtb3ZlIHRoZSBIVy1m
ZWF0dXJlcwo+IGRldGVjdGlvbiBwcm9jZWR1cmUgKGNhbGxpbmcgdGhlICpfZ2V0X2h3X2ZlYXR1
cmUoKSBmdW5jdGlvbnMpIHRvIHRoZQo+ICpfc2V0dXAoKSBtZXRob2RzLiBBZnRlciB0aGF0IGNo
YW5nZSB5b3UgY2FuIHVzZSB0aGUgcmV0cmlldmVkCj4gZG1hX2NhcC1kYXRhIHRvIGluaXQgdGhl
IE1BQyBjYXBhYmlsaXRpZXMgZXhhY3RseSBpbiBzeW5jIHRvIHRoZQo+IGRldGVjdGVkIEhXLWZl
YXR1cmVzLiBCdXQgdGhhdCBtdXN0IGJlIHRob3JvdWdobHkgdGhvdWdodCB0aHJvdWdoCj4gc2lu
Y2UgdGhlcmUgYXJlIFN1bjhpIGFuZCBMb29uZ3NvbiBNQUNzIHdoaWNoIHByb3ZpZGUgdGhlaXIg
b3duIEhXSUYKPiBzZXR1cCgpIG1ldGhvZHMgKGJ5IG1lYW5zIG9mIHBsYXRfc3RtbWFjZW5ldF9k
YXRhOjpzZXR1cCgpKS4gU28gdGhlCj4gcmVzcGVjdGl2ZSAqX2dldF9od19mZWF0dXJlKCkgZnVu
Y3Rpb25zIG1pZ2h0IG5lZWQgdG8gYmUgY2FsbGVkIGluCj4gdGhlc2UgbWV0aG9kcyB0b28gKGF0
IGxlYXN0IGluIHRoZSBMb29uZ3NvbiBNQUNzIHNldHVwKCkgbWV0aG9kKS4KPiAKPiAyLiBEZWZp
bmUgbmV3IGR3eGdtYWMzX3NldHVwKCkgbWV0aG9kIGFuZCB0aHVzIGEgbmV3IGVudHJ5IGluCj4g
c3RtbWFjX2h3W10uIFRoZW4gZHd4Z21hYzJfc2V0dXAoKSBjb3VsZCBiZSBsZWZ0IHdpdGggb25s
eSAxRywgMi41Rwo+IGFuZCAxMEcgTUFDLWNhcGFiaWxpdGllcyBkZWNsYXJlZCwgbWVhbndoaWxl
IGR3eGdtYWMzX3NldHVwKCkgd291bGQKPiBhZGQgYWxsIHRoZSBEVyBYR01BQyB2My4wMGEgTUFD
LWNhcGFiaWxpdGllcy4gSW4gdGhpcyBjYXNlIHlvdSdkIG5lZWQKPiB0aGUgZHd4Z21hYzJfdXBk
YXRlX2NhcHMoKSBtZXRob2QgZGVmaW5lZCBhbnl3YXkgaW4gb3JkZXIgdG8gZmlsdGVyCj4gb3V0
IHRoZSBNQUMtY2FwYWJpbGl0aWVzIGJhc2VkIG9uIHRoZQo+IGRtYV9mZWF0dXJlczo6e21icHNf
MTAwMCxtYnBzXzEwXzEwMCxoYWxmX2R1cGxleH0gZmxhZ3Mgc3RhdGUuCj4gCj4gMy4gQXMgeW91
IHN1Z2dlc3QgaW5kZWVkIGRlY2xhcmUgYWxsIHRoZSBwb3NzaWJsZSBEVyBYR01BQwo+IE1BQy1j
YXBhYmlsaXRpZXMgaW4gdGhlIGR3eGdtYWMyX3NldHVwKCkgbWV0aG9kIGFuZCB0aGVuIGZpbHRl
ciB0aGVtCj4gb3V0IGluIGR3eGdtYWMyX3VwZGF0ZV9jYXBzKCkgYmFzZWQgb24gdGhlCj4gZG1h
X2ZlYXR1cmVzOjp7bWJwc18xMDAwLG1icHNfMTBfMTAwLGhhbGZfZHVwbGV4fSBmbGFncyBzdGF0
ZSBhbmQKPiBJUC1jb3JlIHZlcnNpb24uCj4gCj4gVGhlIGxhdGVyIG9wdGlvbiBzZWVtcyB0aGUg
bGVhc3QgY29kZS1pbnZhc2l2ZSBidXQgaW1wbGVtZW50cyBhIG1vcmUKPiBjb21wbGV4IGxvZ2lj
IHdpdGggZGVjbGFyaW5nIGFsbCB0aGUgcG9zc2libGUgTUFDLWNhcGFiaWxpdGllcyBhbmQKPiB0
aGVuIGZpbHRlcmluZyB0aGVtIG91dC4gT3B0aW9uIHR3byBzdGlsbCBpbXBsaWVzIGZpbHRlcmlu
ZyB0aGUKPiBNQUMtY2FwYWJpbGl0aWVzIG91dCBidXQgb25seSBmcm9tIHRob3NlIHNwZWNpZmlj
IGZvciB0aGUgcGFydGljdWxhcgo+IElQLWNvcmUgdmVyc2lvbi4gRmluYWxseSBvcHRpb24gb25l
IGlzIG1vcmUgY29tcGxleCB0byBpbXBsZW1lbnQKPiBpbXBseWluZyB0aGUgSFdJRiBwcm9jZWR1
cmUgcmVmYWN0b3Jpbmcgd2l0aCBoaWdoZXIgcmlza3MgdG8gYnJlYWsKPiB0aGluZ3MsIGJ1dCBh
ZnRlciBpdCdzIGRvbmUgdGhlIHNldHVwKCkgbWV0aG9kcyB3aWxsIHR1cm4gdG8gYSBtb3JlCj4g
dXNlZnVsIHByb2NlZHVyZXMgd2hpY2ggY291bGQgYmUgdXNlZCBub3Qgb25seSBmb3IgdGhlIG1v
cmUgZXhhY3QKPiBNQUMtY2FwYWJpbGl0aWVzIGluaXRpYWxpemF0aW9uIGJ1dCBhbHNvIGZvciBv
dGhlcgo+IGRhdGEvZmllbGRzL2NhbGxiYWNrcyBzZXR0aW5nIHVwLgo+IAo+IEl0J3MgdXAgdG8g
eW91IGFuZCB0aGUgbWFpbnRhaW5lcnMgdG8gZGVjaWRlIHdoaWNoIHNvbHV0aW9uIHdvdWxkIGJl
Cj4gbW9yZSBhcHByb3ByaWF0ZS4KPiAKPiAtU2VyZ2UoeSkKPiAKClVubGVzcyB0aGVyZSBhcmUg
Y29uY2VybnMsIEknbGwgcHJvY2VlZCB3aXRoIG9wdGlvbiAzIGZvciBub3csIGFzIGl04oCZcwp0
aGUgbGVhc3QgaW52YXNpdmUgYW5kIGFsaWducyB3ZWxsIHdpdGggdGhlIGN1cnJlbnQgZHJpdmVy
IHN0cnVjdHVyZS4KSeKAmWxsIGRlY2xhcmUgYWxsIHBvc3NpYmxlIERXIFhHTUFDIE1BQy1jYXBh
YmlsaXRpZXMgaW4gZHd4Z21hYzJfc2V0dXAoKQphbmQgdGhlbiBmaWx0ZXIgdGhlbSBhcHByb3By
aWF0ZWx5IGluIGR3eGdtYWMyX3VwZGF0ZV9jYXBzKCkgYmFzZWQgb24KdGhlIGRtYV9mZWF0dXJl
cyBmbGFncyBhbmQgSVAtY29yZSB2ZXJzaW9uLgoKTGV0IG1lIGtub3cgaWYgYW55IGNvbmNlcm5z
IHdpdGggdGhpcyBhcHByb2FjaC4KCkJlc3QgUmVnYXJkcywKUm9oYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
