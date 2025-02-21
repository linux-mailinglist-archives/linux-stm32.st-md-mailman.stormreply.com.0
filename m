Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D3A3F790
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 15:44:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92729C7A839;
	Fri, 21 Feb 2025 14:44:11 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49584C7A838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 14:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tha6mF0ZHn2gd46Z/1sha0NAQ+3otA9/nJpDUw5VAk3U9Q/z5NuhNoJmgmLnkYHu1cch03cD81dpmZVnLZoxfEAFHSsxhxC8srZmvKSzZtKCDaHtvdWKVwRbDgyrbIkNUHx5vYmHduE2KZ9pqFuEByKz4HPC4s9FC8r2AgkHpjcXm4tMtGoV4doHmBKoRbMYndQkmS0MnLHSLtDjwFSX172y1JIlj604Ss1XT02VDX6djpYEfw6r3kvwFEotjy8iyr8rEWpmkmzLWhywcJxd+czY4yWJujvcWOHXdRzcg3Vvef4B5Vy5+x+/hvEgRPiLpSoyJ1cI/d7VHOe7K8yGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1wt5CznjtGFJJIe7h1HZUXT71bcvhI8vV2Y3DhG2V8=;
 b=c9dPIzqboXpIJ/THYJNEOKN5yVW1lt1GHIepLiFqOy49R3JS5GHKf4UeAFHrMMgQr9IE3LZSEn8kteXBeMjFIHRDv/39zBRjwzkKc0kumPohkQADogff8N2JOVO2j1Q8bzQJv7CVyxRqsYZfXeXXRUTzcZtcBjXI/6rrFuOEi4EVrNNR9UI8kjLasSSesqwBNK4YqwuopbzgR6W7rNPi6eVSVwm+hyFAh+n0CIeazNwxh6BkCELirwiJLlpPByOkss3znoBjRgDY4eXchGefjGMwI3Asd4zInLAMPRVnERP9VQR6rVYojCJ45DjWLwrb9Hv0jSor+qQM14GEzw+MTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1wt5CznjtGFJJIe7h1HZUXT71bcvhI8vV2Y3DhG2V8=;
 b=f16VgNVfD+xQGUpKoAznsRfopL5qrIDi99zKXcABY3KIWEvAVPdgxicAwOx1p7IX+BgHCgfqi5zXhab3Mf5Gaaprf7Wyl7++OIhm3aN7pcsWGBrXnfV7c41yLyLul8YiWCkjiOL4w1BIMGB7MHBUCZByKoXrafZSN0Eu+Pphw5ucIA6J72kl+biAEKgPrAhjrX4j9qKiiv+HdNE3Z1z68mtH1fDn2Ghx/kl9gnVHbRVYmkHttXjJI1WFiCPpAk9sNcuOZITLKEhWxosZYwFtfnTHci049LHC/2Tmsf51YbshM0yvzQM6mLYk8ARiCW0/a4S2BKl01BOWKz3B1yMBZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 14:44:08 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 14:44:06 +0000
Date: Fri, 21 Feb 2025 16:44:02 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250221144402.6nuuosfjmo5tqgmj@skbuf>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com>
 <20250221095651.npjpkoy2y6nehusy@skbuf>
 <20250221182409.00006fd1@gmail.com>
 <20250221104333.6s7nvn2wwco3axr3@skbuf>
 <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
X-ClientProxiedBy: VI1PR09CA0125.eurprd09.prod.outlook.com
 (2603:10a6:803:78::48) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb93053-253e-444b-149b-08dd5286318b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGJiMTZPK1pvbk43LzlsdS9sV25QMlBsOUpwZWdTOEl1YnpIaDJpTjIrV203?=
 =?utf-8?B?L0k0RitXeDhaejFaSm00Z2Zib1hXdWZTNVBJZVdCdXFTVXQ1bnduanhxckNS?=
 =?utf-8?B?UWhVbjhRZEZ0ZHRnUDdTcGhsS2p1bnA1alZFajdTTDJxN082VlQxUm5xQjd4?=
 =?utf-8?B?ZytINnV2STFhTzhPZm9BTEhaOWh4VE9zQVIrdFloOWg1L0QzSXN5dTdhSkFn?=
 =?utf-8?B?Um5veGJUNUF1SFlLV2xtR0FNVkwxNlBWN09YZkVyWXdnYXBiZlFnaG9tNnNq?=
 =?utf-8?B?T3RoOE45dGp3OGtuT3p4bkZLSUJaczVHSktaODNod1Bmc2FMSjRVTEJmb2RE?=
 =?utf-8?B?UDVmUUtPYnlvcS9DTU1NMmdKWmVKRTRRemlQTHdDUUlUamNJSnpFYjlsWlRU?=
 =?utf-8?B?UC9PNUFrRkxHTW00QytGRGEvRkJFNWN5T2VCSnR3b2RPSEE5Y2RaeENFSzIy?=
 =?utf-8?B?cU5LVy9lRlp3VVBVMmJrVFJhUERrcHBjd0RxSVJTMVlNeEZrR1lndkpmNG9q?=
 =?utf-8?B?NklOUkN3QldDS2V6Rk5pNTZkQ3RlTUpFNDNBNEQ3dXVRclQ5RXhnK2NRWUsv?=
 =?utf-8?B?YnBTUE9ZM0oyRy8wNmhqZk5sclFJK3RHdjJ3MHRMeExwbkJLYkZaZmhrYmpt?=
 =?utf-8?B?RjdONGxJYTZaZjBMK2kzbjhBRXNQS2cvb2EwdWxFZHJESjBWSWZ2VmJJM25Q?=
 =?utf-8?B?K1ExdlNkQnFtZS9RUGpjNFBqbk1GanhZQ2M4YlBxN1Z6a09SZDRqSjVzdlB4?=
 =?utf-8?B?U1haMmMyV0VtRTg4bGFDRnVYbi8wTk9XeDBSNlV3VXM4czBWVmEzUTZ2MDhk?=
 =?utf-8?B?QTZLZ2ZwYnk4aysvQ1lralVFdFlqTHY5Q1ZoeG9jTkpXZ2hoT0h5Mko0UStu?=
 =?utf-8?B?Y3FrVWNuZ081Rm53Zk04bDIzSXlOWERsdnlVaENqbWMvQVFZMDF6aU51NHE4?=
 =?utf-8?B?SUNPVy9ET2hyM2xJTDJnekd5YytEdTFZeFRId1pkeWdqNlp3OHpDSXoyaXF4?=
 =?utf-8?B?WUY5RTY2VTZIaVBzWVlSczhhNFZjcGIzU0hYTXlrK2MyeE1uaC9DQlZUUi9o?=
 =?utf-8?B?ajRpaHVsay85Z3o3dlNkUjF1amp1R2VHS2lQNXlNR25LeEx5Ujl1TDJFRHVx?=
 =?utf-8?B?Y0Rzd0NnTVlGcjdJZlZIRWRGbmRRZ2g5SGxHdWV5OHhPYWFPb1BnTHcwZDRa?=
 =?utf-8?B?NUE3Y2VOdVo1b0RuZ0tXclpkQXhMbnlud2FvVm5aWjZTK3dDajZJbzNJeVVi?=
 =?utf-8?B?OUZYa0NhNE9NU3p5UC9LdVJzUVRFK0xxRkxLNlUvSVJpUERDQlBqRFRaeTdD?=
 =?utf-8?B?VHcxZ3AyWWNTd3J2cnFKRnVjbTUrcWtqdDJCSVRUcSsrUFJnMncxRGt5SFdz?=
 =?utf-8?B?L0JXUCtHUEdPYm8rM3JyMnEvOTJFUm83VkxjVVdJdzA5MFhycFcrTUZZdTFt?=
 =?utf-8?B?QURsRFJiOE1Gd2Z2RGhaRVJoTUtmSzJ0TnhBSk1waFQ1bjNtRFZ1QXo4MjBK?=
 =?utf-8?B?dFlyQWEwY0R1YVVtU00rWVBkUDAwdERLM2lWYzViMHg1QzVIYUxFWjZFNFNy?=
 =?utf-8?B?NzVUQVg4ekVMTEpMM3Q4ZzRkS21nYXRlblVvdlloMkIzRzkxdksrVFBiWlFp?=
 =?utf-8?B?VTVTMGxxRXVld3I5TUNXS0NTMGZnYStUcVJPcC92clF3a0tWUU8weGVyemxa?=
 =?utf-8?B?Z2wveEEzQ25xejZpV2s5NWV0cTBuTlFocHdCYzRBV09HZ3JRNmdHOHBzRW45?=
 =?utf-8?B?VWhjN1dmN1pSY1lEdFk0T3FZb1o2K1V2NEt2OW9XcDgxVVFUTWVJQzFFOVk3?=
 =?utf-8?B?UGJQUW1Mc1NZRDJQWHd3ZlBycVViU010enRBNlU2cGw2S0Nqc3Q2OTNyRmp5?=
 =?utf-8?Q?DEi7ZC7AuKuTc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajhtK0lORm4rM2hBTlJwRmlvaGVqcnpYYXBxSWg4SmFkL0ZWRVkrMVNxdThJ?=
 =?utf-8?B?a1lOQzVKUEE5elJMRFhrNG9wNlRGejZNSi81MGVwcGJBQWwyZ3FwQ0VQbXFY?=
 =?utf-8?B?Y212dTA4TGFyRTRhLytZUDJmVU1tNFh5c3RvN1NkemNmSnduaG14Ykp4YUlZ?=
 =?utf-8?B?aWd6cnl1MHVtZmJlS05QMlFrcDA2Rm4wUWcvSTkrZmNNU3lEL0QvLzl0c3lE?=
 =?utf-8?B?THFEaVVvdE9oODF2Tm9ZWTNFMzdtYWQ5NjBOb2UwTE5FMHdRcWRleDNYaXFo?=
 =?utf-8?B?dUZaNjVvUWRBazhCd3h6d2FOUU93aHFWc1hWb3lDdVI2MEFjZkwrcWQzUzl2?=
 =?utf-8?B?blhveDVxRWp1WXBocmdBTkx6UnV0b1ZMWk5vQy9kRjVWUzBSaU5RNk9hejNX?=
 =?utf-8?B?QVA1d3dSQllBT2xGdlVtbHdmSSt6NDdlODBnL05sMXR4T3RQdWxBWnRXY2Zw?=
 =?utf-8?B?WGc5NExFTXlESkhIa2lDUUxQbkM2cE4xVFEvWkMwRlkzMldlRnRISy9pQ01s?=
 =?utf-8?B?dHkyaUVNaE5pZzJtVm5mL0NLWk5TczJ6Z0thc2Vsc3daUkp3TDZicDF6R0VK?=
 =?utf-8?B?NGozQTNrbmVFdCtKdzR1eWowZUp0RUd0Wmh0SklnakFzbWZqSjNUdEVBZHFB?=
 =?utf-8?B?OWU0amV3RTFZZ2pqYWZYYzhrSDJjNVZEWDFSKzBLTTdwaGtjSUFXeUQyOW5o?=
 =?utf-8?B?RmEwamowdHNKbjdzdWhGYkVTd0NhTjdjQ055M0ZRSTlnR2NORURZVmxGSWU1?=
 =?utf-8?B?RDNjdHNVZkhlanI5TnJuekRJNVVCTjhtWXZUcjFqWlp6SXMzWFQrS0dnQVJ0?=
 =?utf-8?B?c3RkYjlPOXVmbEhQRWRwVHBKYStweTEzRWFScVVwK3ZIeFhHZi9rR2tFUGZZ?=
 =?utf-8?B?SDlrT2JxS3A2enNBTk0ySTZDSFkvdGlvanEveU9ReEsrbk1jWUxRZGpRM2kx?=
 =?utf-8?B?emgrK1VSMk5ZNTJ0c0hFaVVFRFRkL3JBdWkxT0l0UXdGb2toQnA1SzMwZlJo?=
 =?utf-8?B?clU2TU5pdWJJdUpSNHlmTlFldFpScnlxcTFUTmQ1cWJJTys3VU55OUpjbk54?=
 =?utf-8?B?R0xpazNCbVV5NlprdmZJWk1LSXBoM0U4T0JvUG1LVWJMbTcwb0JoUFc2UUhM?=
 =?utf-8?B?c0FySUJOM0U1ZWlyQWhqemEyYXFXSFN4TmZRaGhzcUx6K09PM2hjeGt1M0dV?=
 =?utf-8?B?S1M5WDJzakpQc0V0TVh1OTBhWjZvUnhMZFI3WlNQWjFucHNKWVdVYmdzMVZL?=
 =?utf-8?B?SkR3MFlkeGIzMUg3SUdNc01KTkdzcTlmT2ZvMXBHRWs3RHovZk90S1pWa2Q2?=
 =?utf-8?B?VksyaHpLV3RMQ2k5NEpVUW1xbWlFQnpIOURZeTNqZWZXVDRhendkMW1FSk15?=
 =?utf-8?B?dXJDR3NRUHV2c0tsd1hLWkRKMk5WWjBKQVlBQ3ZVTWZrSStRWmU1MGxuWFMr?=
 =?utf-8?B?RGV5UVJzemFMVGx5QXBWb1p2Qmg3OHdrTzB3OHgyc1ZWcHkxc243cmo4Z1lG?=
 =?utf-8?B?eFVCZGNsWUtoaFg4dGlpT1paZVNXc0M5M0p3WDlUcXBscnZCL1JqYzlZTTRD?=
 =?utf-8?B?dHl1Z3BveXF1cEtHZWdJV2hUZnZDQWtBeUNyN0pNbVJmUTFSUTJVUU1FQlE4?=
 =?utf-8?B?M09vSjFzcUxqcHY0REN3SGh3WS96Y3Bnd2k0RFZCOC8yZ0QwRW5oa3BvY1Zh?=
 =?utf-8?B?bnpaUFdMZ05yUHUydTBkbFJVOE1CR2tKd3ZHeUhFTzBuVFlFb1ZLb3Naalow?=
 =?utf-8?B?ZGV6VlJnOGpjOVppV1hwS3k5MC9vTkg3a1F1aC9TRnhlNEhnbEZRbEZjUmxw?=
 =?utf-8?B?NHl6TU1JcFhkaTJabG4yNDcxVmtWeTROZFN4Z3VoTnpCeHZiZjNWM2lMR1JI?=
 =?utf-8?B?Z3czUTNuR3hVQVljcElYai9xZG5yWVd5NWdlb2VJakZma1BMMlFiK3BDc3lR?=
 =?utf-8?B?STJLdjJySTdhV1JIOUNLdVUrY3gwMU1hYlo2VEJ0WmtFSFh2NlFGNnovUnhS?=
 =?utf-8?B?TmZvbEV1YlJaSFprU2FTU2VRTUFVWVJ2bGhlcHpvRWt1V0ZxRTFHcndWaUdU?=
 =?utf-8?B?L3R1am9xZ3JMcm1Ea0NnbmgzY3FPcjZQcjJ1TTBFNk1IS1g1SXBPam5kcmV3?=
 =?utf-8?B?RzBwU2U4UmhEMXEzTmxsckVQMkpZOUNiL0RpbkU3MXBKeHhkMG5vYXJGS1Aw?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb93053-253e-444b-149b-08dd5286318b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 14:44:06.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9N1nqXkKTmBiljBqDfFZbzVL5py1s4vje9KsdZr1kHnJCGtzYWxhq/zx92M+P4UZVBc99B5ZgEY5A7xd2lG6Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMDk6MzA6MDlQTSArMDgwMCwgQWJkdWwgUmFoaW0sIEZh
aXphbCB3cm90ZToKPiBPbiAyMS8yLzIwMjUgNjo0MyBwbSwgVmxhZGltaXIgT2x0ZWFuIHdyb3Rl
Ogo+ID4gT24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMDY6MjQ6MDlQTSArMDgwMCwgRnVyb25nIFh1
IHdyb3RlOgo+ID4gPiBZb3VyIGZpeCBpcyBiZXR0ZXIgd2hlbiBsaW5rIGlzIHVwL2Rvd24sIHNv
IEkgdm90ZSB2ZXJpZnlfZW5hYmxlZC4KPiA+IAo+ID4gSG1tbS4uLiBJIHRob3VnaHQgdGhpcyB3
YXMgYSBidWcgaW4gc3RtbWFjIHRoYXQgd2FzIGNhcnJpZWQgb3ZlciB0bwo+ID4gZXRodG9vbF9t
bXN2LCBidXQgaXQgbG9va3MgbGlrZSBpdCBpc24ndC4KPiA+IAo+ID4gSW4gZmFjdCwgbG9va2lu
ZyBhdCB0aGUgb3JpZ2luYWwgcmVmYWN0b3JpbmcgcGF0Y2ggSSBoYWQgYXR0YWNoZWQgaW4KPiA+
IHRoaXMgZW1haWw6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyNDEyMTcw
MDIyNTQubHlha3VpYTMyamJudmE0NkBza2J1Zi8KPiA+IAo+ID4gdGhlc2UgMiBsaW5lcyBpbiBl
dGh0b29sX21tc3ZfbGlua19zdGF0ZV9oYW5kbGUoKSBkaWRuJ3QgZXhpc3QgYXQgYWxsLgo+ID4g
Cj4gPiAJfSBlbHNlIHsKPiA+ID4gPiA+ID4gCQltbXN2LT5zdGF0dXMgPSBFVEhUT09MX01NX1ZF
UklGWV9TVEFUVVNfSU5JVElBTDsKPiA+ID4gPiA+ID4gCQltbXN2LT52ZXJpZnlfcmV0cmllcyA9
IEVUSFRPT0xfTU1fTUFYX1ZFUklGWV9SRVRSSUVTOwo+ID4gCj4gPiAJCS8qIE5vIGxpbmsgb3Ig
cE1BQyBub3QgZW5hYmxlZCAqLwo+ID4gCQlldGh0b29sX21tc3ZfY29uZmlndXJlX3BtYWMobW1z
diwgZmFsc2UpOwo+ID4gCQlldGh0b29sX21tc3ZfY29uZmlndXJlX3R4KG1tc3YsIGZhbHNlKTsK
PiA+IAl9Cj4gPiAKPiA+IEZhaXphbCwgY291bGQgeW91IHJlbWluZCBtZSB3aHkgdGhleSB3ZXJl
IGFkZGVkPyBJIGRvbid0IHNlZSB0aGlzCj4gPiBleHBsYWluZWQgaW4gY2hhbmdlIGxvZ3MuCj4g
PiAKPiAKPiBIaSBWbGFkaW1pciwKPiAKPiBZZWFoLCBpdCB3YXNu4oCZdCB0aGVyZSBvcmlnaW5h
bGx5LiBJIGFkZGVkIHRoYXQgY2hhbmdlIGJlY2F1c2UgaXQgZmFpbGVkIHRoZQo+IGxpbmsgZG93
bi9saW5rIHVwIHRlc3QuCj4gQWZ0ZXIgYSBzdWNjZXNzZnVsIHZlcmlmaWNhdGlvbiwgaWYgdGhl
IGxpbmsgcGFydG5lciBnb2VzIGRvd24sIHRoZSBzdGF0dXMKPiBzdGlsbCBzaG93cyBFVEhUT09M
X01NX1ZFUklGWV9TVEFUVVNfU1VDQ0VFREVELCB3aGljaCBpc27igJl0IGNvcnJlY3TigJRzbwo+
IHRoYXTigJlzIHdoeSBJIGFkZGVkIGl0Lgo+IAo+IFNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBp
dCBlYXJsaWVyLiBJIGFzc3VtZWQgeW914oCZZCBjaGVjayB0aGUgZGVsdGEgYmV0d2Vlbgo+IHRo
ZSBvcmlnaW5hbCBwYXRjaCBhbmQgdGhlIHVwc3RyZWFtIG9uZSwgbXkgYmFkLCBzaG91bGQgaGF2
ZSBtZW50aW9uZWQgdGhpcwo+IGxvZ2ljIGNoYW5nZS4KPiAKPiBTaG91bGQgSSB1cGRhdGUgaXQg
dG8gdGhlIGxhdGVzdCBzdWdnZXN0aW9uPwoKTmV2ZXIsIGV2ZXIgbW9kaWZ5IGxvZ2ljIGluIHRo
ZSBzYW1lIGNvbW1pdCBhcyB5b3UgYXJlIG1vdmluZyBjb2RlLgpJIHdhcyB3b25kZXJpbmcgd2hh
dCdzIHdpdGggdGhlIENvLWRldmVsb3BlZC1ieTogdGFncywgYnV0IEkgaGFkIGp1c3QKYXNzdW1l
ZCBmaXh1cHMgd2VyZSBtYWRlIHRvIGNvZGUgSSBoYWQgaW1wcm9wZXJseSBtb3ZlZCBiZWNhdXNl
IEkKZGlkbid0IGhhdmUgaGFyZHdhcmUgdG8gdGVzdC4gQWx3YXlzIHN0cnVjdHVyZSBwYXRjaGVz
IHRvIGJlIG9uZSBzaW5nbGUKbG9naWNhbCBjaGFuZ2UgcGVyIHBhdGNoLCB3ZWxsIGp1c3RpZmll
ZCBhbmQgdHJpdmlhbGx5IGNvcnJlY3QuCgpJIGhhZCBhc3N1bWVkLCBpbiBnb29kIGZhaXRoLCBj
aGFuZ2VzIGxpa2UgdGhpcyB3b3VsZG4ndCBzbmVhayBpbiwgYnV0IEkKZ3Vlc3MgdGhhbmtzIGZv
ciBsZXR0aW5nIG1lIGtub3cgSSBzaG91bGQgY2hlY2sgbmV4dCB0aW1lIDopCgpJIHRoaW5rIGl0
J3MgYSBzbGlnaHRseSBvcGVuIHF1ZXN0aW9uIHdoaWNoIHN0YXRlIHNob3VsZCB0aGUgdmVyaWZp
Y2F0aW9uCmJlIGluIHdoZW4gdGhlIGxpbmsgZmFpbHMsIGJ1dCBpbiBhbnkgY2FzZSwgeW91ciBh
cmd1bWVudCBjb3VsZCBiZSBtYWRlCnRoYXQgdGhlIHN0YXRlIG9mIHRoZSBwcmV2aW91cyB2ZXJp
ZmljYXRpb24gc2hvdWxkIGJlIGxvc3QuCgpJZiBJIGxvb2sgYXQgZmlndXJlIDk5LTggaW4gdGhl
IFZlcmlmeSBzdGF0ZSBkaWFncmFtLCBJIHNlZSB0aGF0CndoZW5ldmVyIHRoZSBjb25kaXRpb24g
ImJlZ2luIHx8IGxpbmtfZmFpbCB8fCBkaXNhYmxlVmVyaWZ5IHx8ICFwRW5hYmxlIgppcyB0cnVl
LCB3ZSB0cmFuc2l0aW9uIHRvIHRoZSBzdGF0ZSBJTklUX1ZFUklGSUNBVElPTi4gRnJvbSB0aGVy
ZSwgdGhlcmUKaXMgYSBVQ1QgKHVuY29uZGl0aW9uYWwgdHJhbnNpdGlvbikgdG8gVkVSSUZJQ0FU
SU9OX0lETEUsIGFuZCBmcm9tIHRoZXJlLAphIHRyYW5zaXRpb24gdG8gc3RhdGUgU0VORF9WRVJJ
RlkgYmFzZWQgb24gInBFbmFibGUgJiYgIWRpc2FibGVWZXJpZnkiLgpJbiBwcmluY2lwbGUgd2hh
dCB0aGlzIGlzIHRlbGxpbmcgbWUgaXMgdGhhdCBhcyBsb25nIGFzIG1hbmFnZW1lbnQKc29mdHdh
cmUgZG9lc24ndCBzZXQgcEVuYWJsZSAodHhfZW5hYmxlIGluIExpbnV4KSB0byBmYWxzZSwgdmVy
aWZpY2F0aW9uCndvdWxkIGJlIGF0dGVtcHRlZCBldmVuIHdpdGggbGluayBkb3duLCBhbmQgc2hv
dWxkIGV2ZW50dWFsbHkgZmFpbC4KCkJ1dCB0aGUgbW1zdiBzdGF0ZSBtYWNoaW5lIGRvZXMgY2Fs
bCBldGh0b29sX21tc3ZfY29uZmlndXJlX3R4KG1tc3YsIGZhbHNlKSwKYW5kIGluIHRoYXQgY2Fz
ZSwgaWYgSSB3ZXJlIHRvIGludGVycHJldCB0aGUgc3RhbmRhcmQgc3RhdGUgbWFjaGluZSB2ZXJ5
CnN0cmljdGx5LCBpdCB3b3VsZCByZW1haW4gYmxvY2tlZCBpbiBzdGF0ZSBWRVJJRklDQVRJT05f
SURMRSB1bnRpbCBhCmxpbmsgdXAgKHRodXMsIHdlIHNob3VsZCByZXBvcnQgdGhlIHN0YXRlIGFz
ICJ2ZXJpZnlpbmciKS4KCkJ1dCwgdG8gYmUgaG9uZXN0LCBJIHRoaW5rIHRoZSBleGlzdGVuY2Ug
b2YgdGhlIFZFUklGSUNBVElPTl9JRExFIHN0YXRlCmRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5z
ZS4gVGhlIHN0YXRlIG1hY2hpbmUgc2hvdWxkIGp1c3QgdHJhbnNpdGlvbiBvbgoiIWxpbmtfZmFp
bCAmJiAhZGlzYWJsZV92ZXJpZnkgJiYgcEVuYWJsZSIgdG8gU0VORF9WRVJJRlkgZGlyZWN0bHks
IGFuZApmcm9tIHN0YXRlIFdBSVRfRk9SX1JFU1BPTlNFIGl0IHNob3VsZCBjeWNsZSBiYWNrIHRv
IFNFTkRfVkVSSUZZIGlmIHRoZQp2ZXJpZnkgdGltZXIgZXhwaXJlZCBidXQgd2Ugc3RpbGwgaGF2
ZSByZXRyaWVzLCBvciB0byBJTklUX1ZFUklGSUNBVElPTgppZiBsaW5rX2ZhaWwsIGRpc2FibGVW
ZXJpZnkgb3IgcEVuYWJsZSBjaGFuZ2UuIE9uZSBtb3JlIHJlYXNvbiB3aHkgSQpiZWxpZXZlIHRo
ZSBWRVJJRklDQVRJT05fSURMRSBzdGF0ZSBpcyByZWR1bmRhbnQgYW5kIHVuZGVyLXNwZWNpZmll
ZCBpcwpiZWNhdXNlIGl0IGdpdmVzIHRoZSB1c2VyIG5vIGNoYW5jZSB0byBldmVuIF9zZWVfIHRo
ZSAiaW5pdGlhbCIgc3RhdGUKYmVpbmcgcmVwb3J0ZWQgZXZlciwgZ2l2ZW4gdGhlIHVuY29uZGl0
aW9uYWwgdHJhbnNpdGlvbiB0byBWRVJJRklDQVRJT05fSURMRS4KClNvIGluIHRoYXQgc2Vuc2Us
IEkgYWdyZWUgd2l0aCB5b3VyIHByb3Bvc2FsLCBhbmQgaW4gdGVybXMgb2YgY29kZSwKSSB3b3Vs
ZCByZWNvbW1lbmQganVzdCB0aGlzOgoKIH0gZWxzZSB7CisJLyogUmVzZXQgdGhlIHJlcG9ydGVk
IHZlcmlmaWNhdGlvbiBzdGF0ZSB3aGlsZSB0aGUgbGluayBpcyBkb3duICovCisJaWYgKG1tc3Yt
PnZlcmlmeV9lbmFibGVkKQorCQltbXN2LT5zdGF0dXMgPSBFVEhUT09MX01NX1ZFUklGWV9TVEFU
VVNfSU5JVElBTDsKIAogCS8qIE5vIGxpbmsgb3IgcE1BQyBub3QgZW5hYmxlZCAqLwogCWV0aHRv
b2xfbW1zdl9jb25maWd1cmVfcG1hYyhtbXN2LCBmYWxzZSk7CiAJZXRodG9vbF9tbXN2X2NvbmZp
Z3VyZV90eChtbXN2LCBmYWxzZSk7CiB9CgpCZWNhdXNlIHRoaXMgaXMganVzdCBmb3IgcmVwb3J0
aW5nIHRvIHVzZXIgc3BhY2UsIHJlc2V0dGluZwoibW1zdi0+dmVyaWZ5X3JldHJpZXMgPSBFVEhU
T09MX01NX01BWF9WRVJJRllfUkVUUklFUzsiIGRvZXNuJ3QgbWF0dGVyLAp3ZSdsbCBkbyBpdCBv
biBsaW5rIHVwIGFueXdheS4KCkFsc28gbm90ZSB0aGF0IHRoZXJlJ3Mgbm8gdGVybmFyeSBvcGVy
YXRvciBsaWtlIGluIHRoZSBkaXNjdXNzaW9uIHdpdGgKRnVyb25nLiBJZiBtbXN2LT52ZXJpZnlf
ZW5hYmxlZCBpcyBmYWxzZSwgdGhlIG1tc3YtPnN0YXR1cyBzaG91bGQKYWxyZWFkeSBiZSBESVNB
QkxFRCwgbm8gbmVlZCBmb3IgdXMgdG8gcmUtYXNzaWduIGl0LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
