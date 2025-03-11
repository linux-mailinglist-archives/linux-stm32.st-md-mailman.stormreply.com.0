Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF5A5CC35
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 18:32:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F000CC78F85;
	Tue, 11 Mar 2025 17:32:20 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C054C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 17:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9+0KlaX30sxXhZANQ9+NPmJZBeF9abJS1y3rfzIdAXMMbdeRZKA/LkMI8lCUI1w00j0DZjz/kWKqWxTQp6KPoCutUR6y05iywilTXFBYBTVF51HXNXe9GOkdRrEEryHHdGlVAMffDZ3ZVxhwZqG0PEHidUQliI5QscLBL7qnimcICsIQ3CqmvboF1rnUxRZl1l/8+rAXQ74rJb47nFzVlGYpCRJnxq01VJ6rPkFi/0y6NPcyXRtQm7EgCjHN88fGg68HFjG0ljku8wgPm7pDAIfcjIWg/NqdauSNDB4LjKr6K+0vvumQeNtvx+VbCh1tA1Cls+q2eIb50spM+8Ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp4Fk4E794aeOBm8PCAjuOvi4d4p9fOWScsKDwVzHNU=;
 b=E7VoSP68MyG3WraHIg0AK7Lw5GVr6lbixRUbYCtl6BfTuDOkPwZeInJ1zoR0jdQbvvrQSXSqQkAprd/zd/6UCqlx92Png6/xKPRF0RFyaa83o98N7g30DE7br42ngW/Pk1XEZMYxNHOtMUwUvEsm3GHJkcL0PoMGbWDHGfkDiZx2DnOqCdM7+2Sl4khgbpAIeUe9qoyMwIRMpr/Le1A3zHztk4KZM8yuo99QJl3p72ycU20ggmuRtU9ib2BripWLApjaujBNd7MbhMkNfVryhbOO+VgsSGIhYaTv337r6/vcuJFLCOmD6hHr2YzGZDbv6Q8BNYlWRUpVD3Q4hiIpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp4Fk4E794aeOBm8PCAjuOvi4d4p9fOWScsKDwVzHNU=;
 b=Mv2WE7ndhaOS8wuq/jqt/w5LH88BLQE6x5r0yIuwuU9ViLiLaR/bjJx27T8Mgj/PntRH+SV1WIlxVDqFpR4eThbtjmXPmi1eZ2LepZfijtlTqqwZXK7AibHmsJHUoV3tz0wqgaGaU43l0x8YKisHIC/GecFthStmkohOHpdNijFM/L46IyH6LGVBwgWnauc+bWqQBCGNJWXGgnpLHxNmU3sMHFGR0DB/+KsH5vd8gn7QjfTxb1aUFz4yFmcI1lXr/FP/5ohtWc9wGt/rvLiB2tIl6gSqhZk3Y5DiIRVyukUqYV+Ze2ub4VySY6XY2Sgj8y/LDcrbeyZQVmlJchI1EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB7372.namprd12.prod.outlook.com (2603:10b6:806:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 17:32:16 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 17:32:16 +0000
Message-ID: <6bfc94a7-0215-4433-9f51-1bfb1cdd1e43@nvidia.com>
Date: Tue, 11 Mar 2025 17:32:10 +0000
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <Z8m-CRucPxDW5zZK@shell.armlinux.org.uk>
 <29bc7abd-b5cc-4359-8aa6-dbf66e8b70e4@nvidia.com>
 <Z8sn7b_ra_QnWUjw@shell.armlinux.org.uk>
 <673e453b-798f-4fc1-8ed1-3cf597e926b4@nvidia.com>
 <4fe02d97-2c38-4d40-b17d-5f8174d2f7cc@nvidia.com>
 <Z9BBm6tievFukbO8@shell.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <Z9BBm6tievFukbO8@shell.armlinux.org.uk>
X-ClientProxiedBy: LO4P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB7372:EE_
X-MS-Office365-Filtering-Correlation-Id: 7460ff73-51bd-4e5d-320f-08dd60c2aaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUJ2TDVIVEJhcFNiMnQ2VHgwLzBGVHBQUHhWYXVYY3lTQVB1S1ovWDZaeGIx?=
 =?utf-8?B?c0ZuT0hMSGJqNThJaWxnTlpaSjJVVkNuL3RqdGhGaWxwZytNN01EaFdVVU5z?=
 =?utf-8?B?V2lDaWpjUG40MUx0Ny9YTmFxVFl2N2ZGRnhYN216Rm9pcWdiNkRLR3lwcklZ?=
 =?utf-8?B?UFRGdzlpTXBvZEM4b3ZEejR4Q0hQMkxVMVRRNzZPWmxSOFB4d0w2SmRyYnZm?=
 =?utf-8?B?bllJYWFSOFNWcVg3RHdYVWVoai92RjNkeFo4VmhWQ0FveTQ2T2dTMUhzak5x?=
 =?utf-8?B?TzA1VVhsbFlTdmZwNzBzYngrRkM3cmc3ZUNLSDZiaTBnQjdMemJhNDRGM1hm?=
 =?utf-8?B?Snk5MFY2QUI5djhzVFpZM2tRcFB4V2RCSEk3UjRZZkl3SllMZEloVUNSRWI2?=
 =?utf-8?B?UlJxZFk1Uy9xeHZ6YUFoMEc0dWQ2TFdKM0l2cjE3eWZ5Umx2bENhbFZVcDJL?=
 =?utf-8?B?SVpiSGpoNjgxTWJXZ2RpNUc4Yms2VURiRS96NCs0bHUxa2taY1dheVlXWFFo?=
 =?utf-8?B?UGxidWs0eDVkbzZFSGVFMTdsNHNqc2g1bDc4aTBWK0JkZFhhcUdQMURKaDFx?=
 =?utf-8?B?MlBJVjlqazNXY1daZE02Q2VzcHdyOWk2cFhZMXRpSy9MZUN0SER5MksraGZ4?=
 =?utf-8?B?RXkwZy94eUx3UmQ0dCtvNWdFR0JXWmQzSkZydXdIb0lHZWF2Q2dGZWVmLzlR?=
 =?utf-8?B?elhpTHRCT3lPNk1LajZrU2x3TEkyZ1pkSFBPWWhGRU5YZ3ZWNDgxcGR6Wkk2?=
 =?utf-8?B?d1BueURqeGNVNy9qY3ZyUU1oRDE3QW04M2lvOTdUZ2JEbnlhUG9LNGhCSkRO?=
 =?utf-8?B?YkttMnoxNzJQYVNBa3h2WWFYZ01scmNTczRMR0QrSE9iSnZxd3dPOER2Z1lz?=
 =?utf-8?B?dnN0RG5wdzBCbGprK214WWZpV2ZaQTI2Rng0VTVrK1V4RVV4cGdoRjdVdmIx?=
 =?utf-8?B?aElWUGlHUjYxTWEvNkk0K2hNQ2xVaEdCT0ZJTnY2ZmZRc1pKaUVvc2xKa1p0?=
 =?utf-8?B?OG90VC96d3EwVS9QYmszbkUwZEJycFE0S01UY1p0ZmhmQ3N3SnFsaHhDcmlM?=
 =?utf-8?B?cWJWdVpEckVXZ0RvbHRNUm1KdlRxZGFicm9jWTRVMFA4dEp4QzFGQ3ZWN3BR?=
 =?utf-8?B?RWVhNXh0bkRaV3B5WFhWajl3cE53ODZPblUwZmFHWis2TXM4RXVwR2Y3Z1hY?=
 =?utf-8?B?Q2pPczc1QURGWmdJRUpwVmc2SWNqVHgzdisyd2RpR0NsUWRrNjMvbkVGK2w1?=
 =?utf-8?B?cy9CdlJFNWFaVW9tNTQ5dGRTa01QMkR0ZStLeTlXb25GejdMblp2cGdMOHBZ?=
 =?utf-8?B?QWpmeGo1Y3J1YUZKeXN5VEh2NlpiZnNkQ0RZalJQSURtb3FRQ1M1WXljV3J4?=
 =?utf-8?B?MWZ5a1NnUkJpbnZKQUNRK1NlTUpUeTk4OVFCMEE5L1Nvc3g1azliMHVpVlJm?=
 =?utf-8?B?Si9Fb2lJa3VOUUdUL3pVRzdGeThqaHZjVVJ4VDFrMDF0aHl1ZWRXdnpmcGpr?=
 =?utf-8?B?TnF2R1RPWTVqWXV6amZXcGUyWjBKVm5ibzFDN0c3RTBuQ1RCTmpFeG5rcHdT?=
 =?utf-8?B?ZFlLOWhMUG5tWi9YNjFPMkNyWGMyS0RET3VTY2xJMURtR0pJbGFsTUpheXpG?=
 =?utf-8?B?N29DZUFzYTZ0RVM0NUpEV1Z5SU5Mc0x2UjBvaWdTTkdRbERGS2kvTlRmbEdZ?=
 =?utf-8?B?cFlzSzc5ZW9wZTFGWGF6QnlTcExNVnNMZEpKWVRtK21IWHBtVkFFUUdsRjdM?=
 =?utf-8?B?RGNNaEVydE1uS0pWR0srT2hQQThiZjRkcXZ0WndGZmpvdXNGZnJwRkVldnRr?=
 =?utf-8?B?N1pjWXhUaVRVQXpnOVlqOVZLVFBHaXhPd3FtWUhhL1B3VE9ENWFIZVMrL3BD?=
 =?utf-8?Q?DI9i/U3+Whb/M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFJZVnpaaCttWlBmRW0rN0R3d1ZTNUY5OGJudU15NldiT2laNSs0NURPTmlY?=
 =?utf-8?B?Rk01YzRHNkZWUjV5ejlWWXoycUx3S3lSS3Y1enRlK0x3Qk9vc0FpRmpIT1BQ?=
 =?utf-8?B?ZUd3cHJvTkg0UTBhWEtqaVV3bU5lZWxTK3VSTEptMXJMZ3hFbTV1d0RtWE5s?=
 =?utf-8?B?MlM5OFRTMzB6Y1E1NEdZQnZmdngyRkxVejdNRDVBRUlPV1NueWJrUmdBdERD?=
 =?utf-8?B?andYVEgxSlpvbHh6ZzJxR3FGMTRXWHV3bENEcG5rc0o2a01pSHNUY0RCQTEz?=
 =?utf-8?B?R3hVeDdYdkpEc0ZzcTBmazVIeE9KeHpkaVpXdTVqZnhCcjVtclFyOEI4VGl2?=
 =?utf-8?B?aGROcStyRG56N1FpamtJUnBmc28zTlNVU29IVHJKUWZ4NXFVNzN6dmFqUURN?=
 =?utf-8?B?WW5RSFNnMWhHdHhRNTlId0pLVjE3ajNPMXNaS2d2SEI3SXQ3L2dscGpHMkNi?=
 =?utf-8?B?YTN3TEE4OG1HOUlaRlV6azRNM28va0dPcTVURGFDUUNHUnZZdVQ3MCt0OVZz?=
 =?utf-8?B?UmhzV3Fyc0w1ZUxpWTBvNlZkVU1iVUs0UnBjUDVuRVFyYmUzS2hqOUEzNDdR?=
 =?utf-8?B?TTBxL0dpUWNKdTlnWStGQXZoeGlRNWhHdllhZGMwdEdZbGh2WkRiRjJweUhy?=
 =?utf-8?B?VHZ6NitkUGhWcFJ4eVYrVzRsZ2ErTVFCRVJzTDdNR2xreVQrbVR2Q25SdDVo?=
 =?utf-8?B?NDlMY0kvRWdWNWd4OEtNS2E5Vmh6bTZBc1JMYlpyRzZVRk5hcVduRHp5WkVY?=
 =?utf-8?B?UDdyT0h4aEhPY1FJTldXV2tCQTErbE00N0tyRWU5d00xQ0lubVhlbzBhdG8z?=
 =?utf-8?B?Y2FkNXhxajVuS0x4QXJMcnYwRjd5QzRRdG4yYTllREpjWmxWTzVvWGJxOTZM?=
 =?utf-8?B?NEN3R2l3cldtTklDVklxaXkwOUdEREJhekdnK08zaEFQNXJzSFppU3JsN0s4?=
 =?utf-8?B?Y1QvRWtDM2NUTGJSU1J0NXBCbklZdzVOZzRwSCttT0NDZld4RU1Ma3B3bVFM?=
 =?utf-8?B?NHRsZnhVd3RocVAvZFVFYWhJM1dPYUFqbC96ZFVjcHhpMFBMUDIzZUxCekRi?=
 =?utf-8?B?TzZieWJEem1McGJ4d3pmc2F5aW9NK0R3MUlReDBwYmhYMmwvVmdPY29rRVdY?=
 =?utf-8?B?QVBKU242ejQ1NVgwNzRqanZrK0w4U3JoQkdLNFRsUzhkVlg4NlREN1FjYS9N?=
 =?utf-8?B?YjhYcjd1NGdhZE5hQTg2ZzdDMDAvWkVaNUxmUnRaZGNUZFdRUzBYUGxrTDZV?=
 =?utf-8?B?NXh1MmdsNjgzUlhuc2R3Q2cyM08yQzVGdlNoU2JGZEFibUQzdkRqVGFUUHBr?=
 =?utf-8?B?OGRzamowYmtKTklTa0RiaWlhZHFJMitzUE5pczRGT20yUXAvRzNHZmZXUVRY?=
 =?utf-8?B?eEdOMGszWExvWFhYUDk0b3BsaTA1QjRsc0VJaWMrSHNndi84Z0djYUd2VnJC?=
 =?utf-8?B?aGNsaWJrSjRsNE8zYTFQYXVIR0dHeXVTZkdFcFZpZWxGcXJzN01lZWluTUpF?=
 =?utf-8?B?eVVQaXhTWFhPZUsrdW1KQTFjTnpqTGh2OGVkUmVqOTdKeCtXejBLNFBQbE9I?=
 =?utf-8?B?TW9JbnNxbHJpZldpZVJnQlluSm8zTWJwQWVlNE9jRk1Rd0RnRG85a0Jwb2pk?=
 =?utf-8?B?a1hHU1FJYmJiQkZ1NmpNNzZpNHhiamttQjI3QXBFWVVNaVVBa0U5N0RqRXlF?=
 =?utf-8?B?L1pTeWdUUnBtNDdHSURrRFNnZ1kzd1h1L3NwOUsxMzVFTW1JME0wbk1uc2RI?=
 =?utf-8?B?c3YyVUNKbFA1cGZhT1ZMQzlGbFpUTG1IN3BMMkt4UWExOGJrV2tlV21TNDlD?=
 =?utf-8?B?OEF0RXRsSG51T2ZrM2NZUUJnQ3dpbG16eWhrb2tacGVUQTdYdU9LTWt5UGVn?=
 =?utf-8?B?OFhMOUdqZXUwZ0JSZm1mRXNLKy9ENVhFZ3h5OU9pbzlPR2tCb2kyNktxYUhw?=
 =?utf-8?B?akszWnZOZzRpZ1BOS25LVGU0S3UxY3JvWDh5a005U2dTdzNYWGk2MVNtRGkw?=
 =?utf-8?B?NlFYeEFLamlCSzgyQ21zbUZ3SVkwbUJIMWxzZ0ZKNERReVlwWDFhUWljQ284?=
 =?utf-8?B?NlBOajA5MnhHTnR3S2xrZ1ZNM25RdkVlRUFOUzZoYmdsZEFaQUhoNDU3MTl2?=
 =?utf-8?Q?DJ5SBMk5YWmYzPKbWHG3mSBSh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7460ff73-51bd-4e5d-320f-08dd60c2aaca
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 17:32:16.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcIyC35LkiM+eDI/bIyLBgHeglO6y5ZXfxBZd9w7zbx7ZUE9QGpFzwWAOY5b79QFmjYe8WtsojmRd74cMibPXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7372
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 0/3] net: stmmac: approach
 2 to solve EEE LPI reset issues
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


On 11/03/2025 13:58, Russell King (Oracle) wrote:

...

> I'm wondering whether there's something else which needs the RX clock
> running in order to take effect.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index e2146d3aee74..48a646b76a29 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -3109,10 +3109,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
>>          if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
>>                  priv->plat->dma_cfg->atds = 1;
>> -       /* Note that the PHY clock must be running for reset to complete. */
>> -       phylink_rx_clk_stop_block(priv->phylink);
>>          ret = stmmac_reset(priv, priv->ioaddr);
>> -       phylink_rx_clk_stop_unblock(priv->phylink);
>>          if (ret) {
>>                  netdev_err(priv->dev, "Failed to reset the dma\n");
>>                  return ret;
>> @@ -7951,6 +7948,8 @@ int stmmac_resume(struct device *dev)
>>          rtnl_lock();
>>          mutex_lock(&priv->lock);
>> +       /* Note that the PHY clock must be running for reset to complete. */
>> +       phylink_rx_clk_stop_block(priv->phylink);
>>          stmmac_reset_queues_param(priv);
>>          stmmac_free_tx_skbufs(priv);
>> @@ -7961,6 +7960,7 @@ int stmmac_resume(struct device *dev)
>>          stmmac_set_rx_mode(ndev);
>>          stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
>> +       phylink_rx_clk_stop_unblock(priv->phylink);
>>          stmmac_enable_all_queues(priv);
>>          stmmac_enable_all_dma_irq(priv);
> 
> If you haven't already, can you try shrinking down the number of
> functions that are within the block..unblock region please?

It seems that at a minimum I need to block/unblock around the following
functions ...

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e2146d3aee74..46c343088b1f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3109,10 +3109,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
         if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
                 priv->plat->dma_cfg->atds = 1;
  
-       /* Note that the PHY clock must be running for reset to complete. */
-       phylink_rx_clk_stop_block(priv->phylink);
         ret = stmmac_reset(priv, priv->ioaddr);
-       phylink_rx_clk_stop_unblock(priv->phylink);
         if (ret) {
                 netdev_err(priv->dev, "Failed to reset the dma\n");
                 return ret;
@@ -7953,10 +7950,13 @@ int stmmac_resume(struct device *dev)
  
         stmmac_reset_queues_param(priv);
  
+       /* Note that the PHY clock must be running for reset to complete. */
+       phylink_rx_clk_stop_block(priv->phylink);
         stmmac_free_tx_skbufs(priv);
         stmmac_clear_descriptors(priv, &priv->dma_conf);
  
         stmmac_hw_setup(ndev, false);
+       phylink_rx_clk_stop_unblock(priv->phylink);
         stmmac_init_coalesce(priv);
         stmmac_set_rx_mode(ndev);

> Looking at the functions called:
> 
> stmmac_reset_queues_param()
> stmmac_free_tx_skbufs()
> stmmac_clear_descriptors()
> 	These look like it's only manipulating software state

So it appears that the last two need to be in the block/unblock region
and ...
  
> stmmac_hw_setup()
> 	We know this calls stmmac_reset() and thus needs the blocking

... this one, which is no surprise, but the others are OK. Please
note so far I have only tested on the Tegra186 board which seems
to be the most sensitive.

Cheers
Jon

-- 
nvpublic

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
