Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B293AA33FB1
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 14:00:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A702C78F6D;
	Thu, 13 Feb 2025 13:00:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64760C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 13:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awwrS311NJLbqMzlCpeOWo8XCbl/N7e8reyBj+orctjNHzK/+tJ/qayKOSHdIlerpvRr3KWcCZRJiJiJ9vXThoZjn1uCiIiLq4RHn+T2AUjsSczcI8w/diWq91dSyZKWcXNC4pmVbrzm9Wj0Kny2VsiLRDE0d2dclWz5TaGF51rERCjiZ9qCLkDh8uyqxeiQ8IjKdiMPcwqiXcHIybH7iysmPW4147mCXDdXL+2YSjnNKBUc+mP4mp3Ta4VTZyOk8vfMNLJz2fpJeZJNa0by/jI1YY1hDnJ+dHhCVCFLiEN45NfcnvgHQ4klfAHvmWCdTYk5cTrIMNdtvTxxroDb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrKxg1XQ4fCyN2OVZOnmTYc/fM09F2tvH4+LyizwIFk=;
 b=B4b25u1iey+ASjQT/RUJbYvr0JF99WYxXqKRW1vbOCoR8frZddCKGoZpy76WYhIYrbCDZ7WuEOKD8Otm4xk8NIZAd3ykrx4IurOsguVTZyyWKhzhpSN8HPxRCDQkcb99sy1yDK/t/5hwtO/0QWNZ+8i95Jyo/kikXuoGcVv/ltRPX0nuYUfJ7wxjED5awlP8oXrL2G39/XEVcriwbCxvsWptMS6vf8pdLXBgE7W6CM72sDHFp4ERjWJ4MBgptkfB3NM5+VUZjrQytzbuDXquze1osdovm1oGtN+qv/uhMxhmc+5IeNiDSIJaHfeMQjL/Ps2nQr4EfrR/ipbrunEDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrKxg1XQ4fCyN2OVZOnmTYc/fM09F2tvH4+LyizwIFk=;
 b=dMMw9TzhoB+DXL6GXITnUwBHZGHHtU1RA0hQfKjIbBOf+hNJ+g/ogsrRycQYJritmDi/77D6LGaru18eO5lgTgslX4FaCapspYdwMB/XB9PIuC+lKlYKPoNrmkG88wuiXSFQftDNeue1xcYAEWitOYFsWkoBUQVkaKGQBtCKv/E2VT8uQzyOF1edFHjZUE2z7HCjAj0ucNalPqqscS5O9jVOR4Rtmd8SRMKcxg4+IllZA2Fj3/BGMyDQqWGkAE/uRKT7sKSJ2T+w4VRZ4q4ZQTtug9boYe9AE/Buo/nvqc3m9TZl1yo8XQ1Ki4Srk6nIrB8vxFXXY5XQVFgaoaB+ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA1PR04MB11059.eurprd04.prod.outlook.com (2603:10a6:102:485::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 13:00:08 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 13:00:07 +0000
Date: Thu, 13 Feb 2025 15:00:03 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250213130003.nxt2ev47a6ppqzrq@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
X-ClientProxiedBy: VI1PR02CA0063.eurprd02.prod.outlook.com
 (2603:10a6:802:14::34) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA1PR04MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: e6346f7e-1d01-463c-5c14-08dd4c2e5783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0c4RW5RYTBRNVlMWWdSME9mNGV3Q01wZk5ucHQvc3BVYy90dVd6Z20rYldr?=
 =?utf-8?B?SDROaVl2UmNWcFY1K3hxemxvdWwzbEhIYTI0OFlocllLTi9JYWFleUZzT21Y?=
 =?utf-8?B?dy8zZlJGNWUrV29YRTRNamFkNW5CUFo4aFZtb0swNFZla3BmT21JVEp4aDZT?=
 =?utf-8?B?cVRZVXFCYzJlWFJZZ2VaWnhMV1h1N1Vac0lhMzdPNXRTZnpFQlVMQUgzbnhy?=
 =?utf-8?B?cy9BYUNpV084TkE5eWx3SHQ0clpONTBZU3dnaXJQYW9EY04vOEtIZkZtTk5M?=
 =?utf-8?B?M3NrSlZOTVRxNUJPTFZubUxlVlNtM3MxYWJVYTljU2c4enE2MDJDUmE2WDl2?=
 =?utf-8?B?bzEyVTBYa3RaR2xGWVh3VHRKY2drRlpPNGZ0aWFFS3N3Q1Z3SGwySDVsYmlC?=
 =?utf-8?B?Qm1RaDc5T3M4V3lWL3h6Um84aEtlV0g5ZWRHR3FZWEl1OUdqNW5kUGIwdWg2?=
 =?utf-8?B?V2I3T09PRVNMbzNrbTZqOHhxYlRaVGNMc1hORk5zaWRaZlMyWFpwbzI4ckFT?=
 =?utf-8?B?c2RXdE9UWVFKUU1menNyMDNjN2wzT3BiazJFSnltM3dFMlZlWEprR0psS3VR?=
 =?utf-8?B?S3V3b1BRZUV3K1ZqU0x4NzFzalQwRmZkc0NWNHpTVHlBL2Nkb2hJbW56cmlO?=
 =?utf-8?B?ZUQwRXkxbUdmZ2I0K1ArQ1AyVGlUS002L2kvalM0K2FmZ21NVGhIRno2Zzd0?=
 =?utf-8?B?aE12OEFJTmMwRTZIcU1wdVhZa2RyTXRYKzlnVWFqdDlBenpkdFB0eFZHOEZS?=
 =?utf-8?B?TE1wZ3MvYkNha2xBQlpLUXZUMS9ncVp2RkJ4ZS9FVXBjaGh2WW55L0ZjSXBV?=
 =?utf-8?B?bzExQ05rUDE0Skl2WWU0ZkE2WXRpcnI3ZmFncWprV0IrSWtyQ05WakQ1V1Fv?=
 =?utf-8?B?eG5DckxwYWFJRThjalBnYkVCWjNoVHdyaVdOMjJDYXgvNW85UlNZcFRZMkFo?=
 =?utf-8?B?azcxZ0ZuOWxhZERFN0VhYS9jRWhVOU50dVZtek1rWlA0RUJZVzlIZlI3eTk2?=
 =?utf-8?B?R2h4dHZDOHF6K1lmVDMzZVdqU1ludTcxT0xuVUhGdWlrN1RSaXNVeGYrTndr?=
 =?utf-8?B?MGt5NHk4dEFLQ3Q4bDZ3cVhHeFQvK2JvYWxzbEVWMm52WURwSGd5QzJNZGF6?=
 =?utf-8?B?aG8rc0h1QUhzd1ZtdE1QNjVkaGhWcTRYdkFvNkdWSG5tNERNdTJ1STJJTmpo?=
 =?utf-8?B?SGl1QzBsaEkyMjg2Y3BOZjFLV0JPRGpOS3VJdTVnenVWME5rVHhoaGJBR0ZE?=
 =?utf-8?B?aGNvcVhiSndkNkdUUEcxU0NMWjJHVTFYb3RqZ1dQbGxhUFNuMHZLQ2lFeVdH?=
 =?utf-8?B?QVM2SEN3NjFYZWpyUm11Qmo0aVB4YXhWblIzNVRQdStsbmE0ck0wSkc2WEQx?=
 =?utf-8?B?bnB3VDhSRWxoMjY3WXF2YlRGbGtFSHZISSsvZitycE5IUHY4c1ppWEVlYWZa?=
 =?utf-8?B?WkxoRTVXNGVtQmRRT1NZb3FqVC9vejRQRExQeU80L0d1bk1GNWdHdGlVUHVv?=
 =?utf-8?B?ckE4SUF1eFZuYnlJTGpWUFhGS0pQS05zTENBY29EVU1NdXR1VWY1YmpKb3pW?=
 =?utf-8?B?eTZjV1AwZDFFVzFHeVhLMlVzdk0zT2hoRytsTGUwcCtWdFZGdmVLMFpEeE5F?=
 =?utf-8?B?bWJCVnF6MTVJbDUwRHJCT0Y2bUxtSHVlSG5LcFRtY3RIS2dJTTA2OTBBU01C?=
 =?utf-8?B?M1NtRVBMd0ljSW5TOFlYaWozSTY5NDh4UUp0VDFyT21RL0JsS1h6ZUpDS2h5?=
 =?utf-8?B?ZjRBRzJ0dlYrbk0xRU45TVd2bVdWYXlyUnBvdlZQZS9QS3E0eEtvMnY2SlhT?=
 =?utf-8?B?MkNZdHpWYStlTDUweWg0VWhzY1R0WXRwZnpJTFg3TUxxTnJKbEpWU3doU2ds?=
 =?utf-8?Q?TsnqLqO1hEwjZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2x1QmNhS1g5MFZhVUQ2a05KQlN0dlUyVDdjUHBUaFFhbGZ3SlBaUmFwY0xt?=
 =?utf-8?B?dmllTm11QTZ4UzZZNlVRWkt6VmJEaDU5N3ZhY3ZEY2FUcFlvVEdCM1hGaEUy?=
 =?utf-8?B?MnBrTkFJRmhxSVpkRmtZUTNqSTdyY0tPVUtxZVIzdUpLVVdxQ1lEajk2K1Ba?=
 =?utf-8?B?RlBZZERPNUlOVDBNMDFhS2RWaUppaURLemkxM1czSVFseGVWZGsrL2pCb1FM?=
 =?utf-8?B?eFlkVERwRG82Y3pLUDFxUFhFK2owZlRrOVVnZEF3YXJPdkM1MFIvZWQzRy9Q?=
 =?utf-8?B?ekV1M2xOU1ZvVXE1R3NMM2hOT0ZzdXZqZk1OTnpGNnVZWE5PcCszMnRxNTZ6?=
 =?utf-8?B?WThxVVM0RXFRejRJREtHUktwUXJ3OXhYVVEyNW10SVdnWGp4UGVvSzdkZThY?=
 =?utf-8?B?Z3dScEtXTUFDK1l4YndiL3FmdFpZd2J4YXh1WE5hUWN2M2FmTXdHU2E2T0Zm?=
 =?utf-8?B?QmdraVVoaUFrd2ZERjJCM1Jnam1TaDZ6QWNIWXN2c1UwRFZ3ZDBubXJDWXhU?=
 =?utf-8?B?d1dDMm5RRWdTSGQyQzhWdmRZeEplaDdGRVBxWW56cllwd3JJcGZaUkRwa243?=
 =?utf-8?B?Ti81aks0R1FQeDZKOTJ0WDJUdHIzVi9UcW03Vll6bUIwQys2eVVZN1pybmRx?=
 =?utf-8?B?ZnREZzRKOEhJOFQ3aHlhWnZPa21yU2EvWDkzdDhTb3lVdUpZQkxKVVIzenRv?=
 =?utf-8?B?bElRdVRYRnoxeGZzUDBtSFZQWlBBeG9qMDFGck9yQU14cjhmaHBuNnhUWkIz?=
 =?utf-8?B?QkovNUFZSVhhNzNFZEQ5NmJhN3VoQjg1WWljQ2lHd1dlbVZzSVFFY3lobUFy?=
 =?utf-8?B?aVhudUp2dGJYQXpwa29udlJuazF0eUlxckZKWjVMRnJaYnZSWmoyWGVSOTdr?=
 =?utf-8?B?VXUrQjJMYUgrM0ZCY1lyYTJWbmNpZGlUR1FyRjRtV1dyRTNzTjFyNXF2b3Fn?=
 =?utf-8?B?a2ZOeXhyV2lZaU1JYVArd2xobVNZQUVhYWFna1NYZGhLeVpwQ244NWpPc1JV?=
 =?utf-8?B?QkcvYnllYTZYZUtVdWNJRUhhVXU4TUlOL001MllGMnZsZmRieGR5UXlNVUlO?=
 =?utf-8?B?VEhZUmtCTVBObGJYWUJiNTl1TVNaMUVWWUFiWFNvMWlxKzFuMlp1dDVhdStC?=
 =?utf-8?B?Y2VSWWUxQjFyTVVEMXhrVTdyKzN5M2FJa2tmUVBRd3JPT2xZOG1qNldFNTZ2?=
 =?utf-8?B?Y0luVFdqbUJIOFp4Qnd4aGJPY0d4M2NUOHMvNkthMmRoZ1NrbWpHRTYvU0pz?=
 =?utf-8?B?NTgrdmN4cng5UHk0d20rcFlZd1BGSFdnd3ROUmU3c0JNREYvcjZiQW1GNDRr?=
 =?utf-8?B?ZFV0WHQ2UjBwNTBRYkRjQ1R5S0pvbzBBZno0KzdDWFNIUEdQMEVnbGJlK2lr?=
 =?utf-8?B?bGhwOVVzb1dnVzd5aUxCMnJtczN3Y2hWNGcxNUdJbERYWlR1TzRJeHh6S1Vj?=
 =?utf-8?B?ZEY5RlpsUU5kcVB2cVB5MERIa3RSM1luaDhMR21iZlFrOTNJRi85SDRJd1VE?=
 =?utf-8?B?ODlxZG1UcHdCeERYcHMyT0QrMFVvSkJhVThabDNTR1I0czZWYkhDWEVlUzNS?=
 =?utf-8?B?elNTWmFlcEovc0lOQm9RSGllWGRBN2VmUjJTc1ZjUVhiejRTanNsRUM1RmJ1?=
 =?utf-8?B?d0dUMFBVSEYxRkxaaUJRbUVnczhzRjNSZEtHUHA3dSthK0k5MlFIRFJzcHAy?=
 =?utf-8?B?cXE4R1BWQk4ydEozWStIaGcvZ3FHdGlldFRWRUFtekdTRHVTak0wZzV0SVZW?=
 =?utf-8?B?YWhaM0Y3MVJrNW1yeXdyZUdPVWs1bTZXeWZmd0JnemxhVzFNN0F1WThqcWdD?=
 =?utf-8?B?ajMyUkpqbmdTckNvVytGL29vMVFzSUZGZmVLQ1d6ZVNDaG5rNlMwajRZdkVZ?=
 =?utf-8?B?ayt1Zyt6b3VueHh3ZWJvcnlUcXM4MGorTkNzOWZLZWJkbDJPUkNUQnJyMnA5?=
 =?utf-8?B?NzNoSFhGazVnaG52TUdNRFVSVnhGRVQyTTVJeWpITVhpb21HMjc3Sk5YSjBT?=
 =?utf-8?B?QWRVOFdWaHBLam9rOS81UTFXVkQ1TVVmTnFWSFBnaXh4M1VaMnF0R2xYTjZp?=
 =?utf-8?B?cHJBc3R0ZFBPYWdndytlN2N2MDRERit2amNnMmMybFNOZHhOZDNVam0rYzRu?=
 =?utf-8?B?Mi95NlgySXk5Z242Z25nb3JsVzAzeVVjeEs1cnNHRXFjdWhwYjJZODN2RUNG?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6346f7e-1d01-463c-5c14-08dd4c2e5783
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 13:00:07.8481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go/mHM3RkXWlsfhJ6VrwwrI9AWczo30LRMk0PSLVTzL5IYNjb5EbpW9gzBmY9cUpKKOkXA7oeMOFpYDPnGtLDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11059
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

T24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgMDg6NTQ6MThQTSArMDgwMCwgQWJkdWwgUmFoaW0sIEZh
aXphbCB3cm90ZToKPiA+IFdlbGwsIG15IGlkZWEgd2FzIHRvIG1vdmUgdGhlIGN1cnJlbnQgbXFw
cmlvIG9mZmxvYWQgaW1wbGVtZW50YXRpb24gZnJvbQo+ID4gbGVnYWN5IFRTTiBUeCBtb2RlIHRv
IHRoZSBub3JtYWwgVFNOIFR4IG1vZGUuIFRoZW4sIHRhcHJpbyBhbmQgbXFwcmlvCj4gPiBjYW4g
c2hhcmUgdGhlIHNhbWUgY29kZSAod2l0aCBvciB3aXRob3V0IGZwZSkuIEkgaGF2ZSBhIGRyYWZ0
IHBhdGNoCj4gPiByZWFkeSBmb3IgdGhhdC4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/Cj4g
Cj4gSGkgS3VydCwKPiAKPiBJ4oCZbSBva2F5IHdpdGggaW5jbHVkaW5nIGl0IGluIHRoaXMgc2Vy
aWVzIGFuZCB0ZXN0aW5nIGZwZSArIG1xcHJpbywgYnV0IEnigJltCj4gbm90IHN1cmUgaWYgb3Ro
ZXJzIG1pZ2h0IGJlIGNvbmNlcm5lZCBhYm91dCBhZGRpbmcgZGlmZmVyZW50IGZ1bmN0aW9uYWwK
PiBjaGFuZ2VzIGluIHRoaXMgZnBlIHNlcmllcy4KPiAKPiBIaSBWbGFkaW1pciwKPiBBbnkgdGhv
dWdodHMgb24gdGhpcyA/CgpXZWxsLCB3aGF0IGRvIHlvdSB0aGluayBvZiBteSBzcGxpdCBwcm9w
b3NhbCBmcm9tIGhlcmUsIGVzc2VudGlhbGx5CmRyYXdpbmcgdGhlIGxpbmUgZm9yIHRoZSBmaXJz
dCBwYXRjaCBzZXQgYXQganVzdCBldGh0b29sIG1tPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9u
ZXRkZXYvMjAyNTAyMTMxMTA2NTMuaXF5NW1hZ24yN2p5Zm53aEBza2J1Zi8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
