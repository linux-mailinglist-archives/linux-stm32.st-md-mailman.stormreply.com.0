Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA63B14895
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B155C36B3F;
	Tue, 29 Jul 2025 06:49:50 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C5D3C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 12:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X26mg6ZIcrX+8jLGASfuLCjvx2anWVM707jBXgq283Zq1u1DfiRiRwGJxyX0C+ghgUmL55UNlPwJKpzaqO470hS9uxmvnNyt2OpJ0zb9SOCHBjXOlG158ut+qUGIxPpHZSb+FwkXEtF0kujlvE4NPRrAodSW9d3dv8BpgFdmr6r2Cz6ZNlScwVCvJCaPj5As48WZa/D4Pof7Wt/HemKIJCBb8V54BvBHVYhdHjKClyu9iQ4eIIoE9ZDE8KwfjFxzOdLf9cXXI2mjEZpseb65WuMefS0191taO+hQ5kLgfKf+evW+Y6j1fcXbddguQobbSajml/RwUTz3MnOhaM29rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF3aXo7s8jSoHZHfH1Y45V2Y5si0+HLXRgDNPqhr5SA=;
 b=S3EjqPWxfYIWK06XUTcmoAUp3Zol2JY7TpGPS/0yAu6qF8wh+13Er0S9MgfKxf1ekmVh/0bq75WDyKBdFKd0M1R2w9ZEL2tc1Tol1boR6NKtdwffnPEVr7QZanoQlgHLUJE6ak9NyhsMhkeTtMQs9WJ/fzG3aUEO21igiYPrEEBWVXU+QmtAc34i+WZMuU/1RnucSk0yntg8S7sU84X9jTzAYQn4XXDayULDhcWIuOBHfSGjuzjKQnjMdHsm7A6O+VS9jvujf/I178uhhnxyogovOXbB5OzkwpP+KzkAi2+qNQvAIJZUr2GdZwhrfJLCwD5CKnxzefLfXUhd5ALgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF3aXo7s8jSoHZHfH1Y45V2Y5si0+HLXRgDNPqhr5SA=;
 b=XyN0+qcFnxReAFai8xTw7mCq2yi5czBdFw1/HdSIpqnXfBsAYpCcqnAF4ptCaz4ghTyAm8bD11g+EnAM45ZGD5WzWi995x/nLADZerPF7HyHpJ9y8hTIxjgpZ3CUrBI4B4GHJyQmr1DI3SR2cflhaZWWSdqiBzwbeZ9CpV+O4PzOtZS5Z7t8CnX3VoFtxai8KQo7+Ygt1i9F4kcuP6wuyNUJt9kdmG2L+UXcngDL79wDrkyUo33mYtnNooIZ6IsymVl2/QYyGdaPwG7FuOinwPIAfFBWbeid4fJKwLsay1hT81Okz+xpX6A0X5CEaFEWRNSU0In/N0cBjesqp/TqGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 12:26:59 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 12:26:58 +0000
Message-ID: <9fe98cb8-f1c7-472c-a619-1ecabd636b07@altera.com>
Date: Thu, 17 Jul 2025 17:56:43 +0530
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <aHib9V1_WZfj3S8M@shell.armlinux.org.uk>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <aHib9V1_WZfj3S8M@shell.armlinux.org.uk>
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|BY5PR03MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c73884-7c76-483c-8def-08ddc52d38ec
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djcveDE5WjlFZXJjTHQvdEhGaTJFakNCeFZjakRrMG1UUFhpNmZYYVFsMHg0?=
 =?utf-8?B?Rll0RnhUeWdlZ0RZbG1RaFJNTVhCMkJQY3NEVGxWQ0pReEVYbENudjVKRGFQ?=
 =?utf-8?B?S0F4eUF5ZHN2UGJ4RFlyR0tXT2dPazExSGt2ZE45RkwzWUZTcVZXbEljcHBG?=
 =?utf-8?B?OUY5SlcvTHVJbG45QlZsck1uamZZZGRSZ1FtdjJjRDd3SWliSTVkYURrdFdF?=
 =?utf-8?B?L21Qb0o2VVhrS3BwTDJZNy8raHBod0xQb2FnUi9xeGtYQlpadk1icHBuNFFK?=
 =?utf-8?B?VTlTMkRlazZHemg1K1Y5TUdlZ0piL1BmdHMvS2lISWRSSkRiZ0Y4RnZBamlW?=
 =?utf-8?B?bHQvelNLWE82TUNidmJpdUNZWjUvaUp3cldiMk1VQVUvaXluRG9KNFBQT0kz?=
 =?utf-8?B?WFlwRzUrb3FxYXlWOW1lbkdPM3BBR2Q1dk5Da0Z3eFU5RXRjVDhFY3hKdFY2?=
 =?utf-8?B?RDVTa2xYV0FCTHBRd1RFdlpvYXdKaDN6MllydDF4ZGJRWUFyU2UzeG5DTXJ1?=
 =?utf-8?B?MHdsaDVmYWZJNENPcUFrc1pCaS9uNGhVaDVGRXhpL29uU0Z6NGtrZ01ZTjdP?=
 =?utf-8?B?ZWsyM29KQ0FuVERaYVBxck91K3k2MHRuMXk3M0xTVUkyRUdiTGp6TGlTZERF?=
 =?utf-8?B?c0VjT3FMeEJPeWx3MzRHOFBCM3hSbHpjQ3B3SnN3djJ2T0VXVHorTC9KQVFI?=
 =?utf-8?B?OGlzZ2pYanE0OXlZczMxdGFzczhyMzRpS2xaQUppRHlJeVkxMjRKZjhXRDVa?=
 =?utf-8?B?ckZBNy9OeEZEYmlZMzl3SlVHdG9qMUdQUU9FMkoyTUpYZys3RWJxem9ORnVL?=
 =?utf-8?B?dCtRcG5vZXV6YjZHeW1VY3NoNkdGYWp4b1FySlRpRENCeGZpVlF3UnhhSEh1?=
 =?utf-8?B?SnZ2eFlPQnk5ODRZNmlYSzQ2bW52NG5LS0V2S3RrZm1rUGRFOEhKSElQUHhV?=
 =?utf-8?B?OFNRT3NEcUVwM2p5ZWJjRERHelVYaDhtV0VwWkRkaU9QNmpGM1JqLzJLSEV0?=
 =?utf-8?B?QmlLdXgzMkdzZ1c0ZUdjMHVqZnVGVUpBZk85OHRvT3NudWE2Uk00clpxY3p4?=
 =?utf-8?B?OU5MaEZpcmRMMlBQOVNRS3kvVGc0Y2krNnZ4bjU2YzluZ2J1bkFueWpENjFl?=
 =?utf-8?B?SUdNR3ROdC81NmswTUhsZ1RFQmdOdm1rempscy9YeTVpcmtpclBTZFh3OWhn?=
 =?utf-8?B?MjZmVlZFWEE0S3BncXl3aEJyM2gxZTQzTWZpZ1cvejlSNG14bjVMS0xETTB4?=
 =?utf-8?B?ZlhBbUpQa2VFZGkzNHJIb2d2bmFkb1J2UVlSVHdELy9XMmtPZnJVTDBDMDE0?=
 =?utf-8?B?dkVFdkJoamlRcXdQM1FqbzlYY2o5VGxVbVVMUll3RVFhcmY2N0hxcTMyM1JP?=
 =?utf-8?B?bWo3WGcrZWdmdytPL2s4RFdYdUFpSi9VOXpmdFNZdm9ycm9pOVd3UmVuK3V0?=
 =?utf-8?B?L3dpbER5bHBhTFhUYlJDZUFyQmdkVmhldXNjZEM5bkpMTmdSNmZ0UU02QWRi?=
 =?utf-8?B?bzhkL0hMSjdKZG9vK1NJbTBYbmYwVC9EeGNQMXNYMVp2eE5qcExJZ2VvdTlC?=
 =?utf-8?B?RStKcnNCbWVYMlljRHRDbmFia055a3I0VFFjZmNTRHhIZTB5R0M3K3Uyd1pT?=
 =?utf-8?B?dzNqN2xiajd1N0thM05Dd2tDMmNra0lyU1VxbWRVYVgvSUZPbTdNY21JK1Ur?=
 =?utf-8?B?cmxMdm5nNmN0SnhwT0JpTnVPbnY0ZVBld0twdEpGZll5cHR2NGo0YzRMQ1Bh?=
 =?utf-8?B?M0lNUzRSeFJpWUwwSThQcVNuOUtuZVp5c2pIM1I2NU5IODlSNmptcVR1dFpG?=
 =?utf-8?B?MnpGd0lXd1MwS2YwSlYvRzN6MzdiN3FwTE91NXovZmVuU1gvRGMvSERaQTlZ?=
 =?utf-8?B?YUVqVHBLU3RBRnlyMVJsRklZRGlKYjNDM0pZRWxsa0Q2SDl2S1NjczQ1WVJF?=
 =?utf-8?Q?zxumegiY4qk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFRmd0lCT2I5emJIckdEWmd3Sll5QmpuQ2hhdy9KTnpaSGtZMzk0ZThJekdE?=
 =?utf-8?B?UllMT2VWUWpkZUp5dUR2N01rNmhNTzFtdlZsVVFpdGxQd1ZKMmRNcnBPd2dK?=
 =?utf-8?B?bTJxLzVTTlluQVBGdFExenVYU2k0UGtJWDM1eHJhVHJpd2d6Y3NvMnQ3WlBR?=
 =?utf-8?B?K3RSMExmNFg2WGI5cUs2MVNTVzlhak92RmR4Q2Nlb1Z6cGNKdjNjRHB6eDdp?=
 =?utf-8?B?d215WXBWK3NSeXhMYnlBejRFN2w3SG93bERUS203UG5uTzRWam56eDhxQkhX?=
 =?utf-8?B?TmswdEx2SG1OOS9pUjFEMFpORklkQkd1d0dHSUc4akhJV2RWVzZPcWVTMzht?=
 =?utf-8?B?QlF3ZUczU2xZaU83b3M2QlNtY2pTUS84SVU4ckdjSW8zNkNESU41UXQ3NVFh?=
 =?utf-8?B?V3lkRmhhQU9xK1B5VHNwVUo0dEQ3Um5Lc0RSSURzWTVNWTdkd0piNUdaOGhh?=
 =?utf-8?B?TUNreTFma2NkZW1HZmU5N0psbzNSaWprMFB4TGNyZ1JKSFc1MGFJV3RXMnZP?=
 =?utf-8?B?ZDRMY1dVb3dlZXkwTDRGSUlvREVGYlN2citDcjdOVDRoTG1iOGxUbVduWjVk?=
 =?utf-8?B?ZGkxazFSQ2FaMWFCWEhoaHR3dGYyZTRtaFVhS05rZ2VnVVdaVGEvQzltSUN6?=
 =?utf-8?B?M0ZyakYrdFlQdUw1TUlwZWNJVXlIQU5zWEh4MlFDRCtUaGdVRGI1a1ZRd1FO?=
 =?utf-8?B?V1V0cHZoK1VjQ3JFRW5QcUpDRDVrNDlvbU54Z2JRZVg2c0ZsazZ3WFVzR245?=
 =?utf-8?B?MzFNdC9UY0x6OWlSekpuYm1PUmdVSjRMYjM1bVZlN1E0ajRuMmIxMnk3RkxP?=
 =?utf-8?B?UDdTWEU0YXFXQmI4TmxkRUM2ekd2bDhPb2NpWHdQT3dlcjdhYVlPQlFreklF?=
 =?utf-8?B?WWZ5YVdVOWRaN2xSM0FQMzVRV1hqZmZJU21IVWtDZ2RhNFdmV1crMTNzQnBv?=
 =?utf-8?B?c1c2NTVvWGQ3T3lNSUJXVlE2OVg4M0c4R1c1SUY1WjFvSzNFak1uNU1vWFU2?=
 =?utf-8?B?MU9HMWdNZnVtQzR5SHEvNlB6aFl5MTY0WW1YRXZ0NGkrMnJFQ01UUzZkOXZu?=
 =?utf-8?B?ZmJuSWxmNndBa2xXVE4wTG1OSnN4VTBEVER1MGlBbVVqWjk5RHZkQW5NanBW?=
 =?utf-8?B?THVheGpxRXNlZDRWanFPWmc3TjBWak9qcHkzRU5zY2xhQ3JPMk1Cd2NNR3Rv?=
 =?utf-8?B?eUxrT3g3Z2Vxb1JSK1lKUHJXNW1RckZKOXNndXZLSUNEc3NNSTg3SncvaGYy?=
 =?utf-8?B?bHFacVo4aEdBWGNya0JJdld5aHk2MXVURHh1TzJMaldSOWNXQm1rNjltOEdC?=
 =?utf-8?B?T3RuSGhPbnVqT2x3Y3pIamZKRGlKaitNako4dStReUR0cUZOUFpjb0doV01T?=
 =?utf-8?B?OGxjZUlsM1ZJS09NRENTcnF3ZG96Q0llbjZqYWE3Yks2NDlQWGhIYXRMRGNn?=
 =?utf-8?B?dmpHVWpoVjd2RzI0ekFjeDVtY0RHUnZsQk5DRlFtcU9YNTJ1VUN3bndPTGV5?=
 =?utf-8?B?b0I4eENjeG1xQlZ1ZzN3dWZ1UTBZRmVkMTdtc2tlWUMrL0tpTkRGcVRib1pW?=
 =?utf-8?B?RTY0U1p4VWE0U3B0UW1xd1hQZ0FMdkh0MUNlRENjNzM3T0dXSmN4QWNETUI1?=
 =?utf-8?B?VHEyZG5aRG91dWl0NCtRYVZDcUYvTmQrSzFkMG9leEo5QXViQ09ZRGdkNGtV?=
 =?utf-8?B?OEtjNFplV1ltZnU4WFRSRm9qTUNKYnlXVmJuWGZSbGs3T25qVWdkQjdYaUFq?=
 =?utf-8?B?QXAveVN3b0V4VXE3dlZ2bmVmVis5Zmt5aE9nazcrV2g1ejg3N09JVzF6bXhm?=
 =?utf-8?B?V3hURUY0L3kxWlJDS0w4R0VMS3ZsRDhjcVdlVkVaME9ud1VoY29ZZXdPUlYz?=
 =?utf-8?B?QjJraWpHU2UvN1dtZlhabjFhRmkrc0FnbDJ1R1dJaVRxUERXZVAzenp2UGEz?=
 =?utf-8?B?ZEFvUmdVcW0wU2hiOG5rQlBDTjErMThadG5PRkdFSHNZdy80UE90RHdqSXNR?=
 =?utf-8?B?SzR4ZkF4REpSOUZSZDI5ZUhEV05VNG5FMWY5bVZ6VHhXQ1ZuZlZ2NytURnpE?=
 =?utf-8?B?Q1VSVnVzOGUwSERDMHBGRjh1WmRTc08xcDJEMWlRcWZYVDZhaHdycE5EVFAz?=
 =?utf-8?B?NjNZS3UyT2VNOFBKdkhob0tlUnFUeUtjN1BOQ0MvWWpIaURxZ1F5c1c1OHBR?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c73884-7c76-483c-8def-08ddc52d38ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 12:26:58.7113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJzL7md7p1X8ivCnBZaZe/NdDmUSbPYHRDH2R4Wk3oxy0J4XTmA0hVo/xoaT8J/3fAZrj+ICJfm2XWqXGTEcUVa40NPmnpAXnId4Yk+cp48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
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

SGkgUnVzc2VsbCwKClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4KCk9uIDcvMTcvMjAy
NSAxMjoxNSBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE0
LCAyMDI1IGF0IDAzOjU5OjE4UE0gKzA4MDAsIFJvaGFuIEcgVGhvbWFzIHZpYSBCNCBSZWxheSB3
cm90ZToKPj4gQEAgLTE1MzIsOCArMTU0Miw4IEBAIGludCBkd3hnbWFjMl9zZXR1cChzdHJ1Y3Qg
c3RtbWFjX3ByaXYgKnByaXYpCj4+ICAgCQltYWMtPm1jYXN0X2JpdHNfbG9nMiA9IGlsb2cyKG1h
Yy0+bXVsdGljYXN0X2ZpbHRlcl9iaW5zKTsKPj4gICAKPj4gICAJbWFjLT5saW5rLmNhcHMgPSBN
QUNfQVNZTV9QQVVTRSB8IE1BQ19TWU1fUEFVU0UgfAo+PiAtCQkJIE1BQ18xMDAwRkQgfCBNQUNf
MjUwMEZEIHwgTUFDXzUwMDBGRCB8Cj4+IC0JCQkgTUFDXzEwMDAwRkQ7Cj4+ICsJCQkgTUFDXzEw
RkQgfCBNQUNfMTAwRkQgfCBNQUNfMTAwMEZEIHwKPj4gKwkJCSBNQUNfMjUwMEZEIHwgTUFDXzUw
MDBGRCB8IE1BQ18xMDAwMEZEOwo+IC4uLgo+PiBAQCAtNDA1LDYgKzQwNSw3IEBAIHN0YXRpYyBp
bnQgZHd4Z21hYzJfZ2V0X2h3X2ZlYXR1cmUodm9pZCBfX2lvbWVtICppb2FkZHIsCj4+ICAgCWRt
YV9jYXAtPnNtYV9tZGlvID0gKGh3X2NhcCAmIFhHTUFDX0hXRkVBVF9TTUFTRUwpID4+IDU7Cj4+
ICAgCWRtYV9jYXAtPnZsaGFzaCA9IChod19jYXAgJiBYR01BQ19IV0ZFQVRfVkxIQVNIKSA+PiA0
Owo+PiAgIAlkbWFfY2FwLT5oYWxmX2R1cGxleCA9IChod19jYXAgJiBYR01BQ19IV0ZFQVRfSERT
RUwpID4+IDM7Cj4+ICsJZG1hX2NhcC0+bWJwc18xMF8xMDAgPSAoaHdfY2FwICYgWEdNQUNfSFdG
RUFUX0dNSUlTRUwpID4+IDE7Cj4gCj4gV2hhdCBpZiBkbWFfY2FwLT5tYnBzXzEwXzEwMCBpcyBm
YWxzZT8gU2hvdWxkIE1BQ18xMEZEIHwgTUFDXzEwMEZECj4gc3RpbGwgYmUgc2V0PyBXaGF0IGlm
IGRtYV9jYXAtPmhhbGZfZHVwbGV4IGlzIHNldCBidXQKPiBkbWFfY2FwLT5tYnBzXzEwXzEwMCBp
cyBub3Q/IFNob3VsZCB3ZSBhdm9pZCBzZXR0aW5nIDEwSEQgYW5kIDEwMEhEPwoKQXMgcGVyIHRo
ZSBYR01BQyBkYXRhYm9vaywgMTBNYnBzLzEwME1icHMvMUdicHMgc3BlZWRzIGFyZSBzdXBwb3J0
ZWQKb25seSB3aGVuIHRoZSBHTUlJU0VMIGJpdCBpcyBzZXQuIEFzIFNlcmdlIHBvaW50ZWQgb3V0
LCBJIGFsc28gbmVlZCB0bwpjb25zaWRlciB0aGUgTUFDIHZlcnNpb24gKOKJpSB2My4wMGEpIHdo
ZW4gZW5hYmxpbmcgdGhlc2UgbW9kZXMuIEnigJlsbAp1cGRhdGUgdGhlIG5leHQgdmVyc2lvbiBv
ZiB0aGUgcGF0Y2ggdG8gaW5jbHVkZSBjaGVja3MgZm9yIGJvdGggdGhlCkdNSUlTRUwgYml0IGFu
ZCB0aGUgTUFDIHZlcnNpb24gYmVmb3JlIGVuYWJsaW5nIHRoZSAKTUFDXzEwRkQvTUFDXzEwMEZE
L01BQ18xMDAwRkQgY2FwYWJpbGl0aWVzLgoKQWxzbywgcmVnYXJkaW5nIHRoZSBIRFNFTCBiaXQg
4oCUIGl0IGlzIHNldCBvbmx5IGlmIDEwTWJwcy8xMDBNYnBzIG1vZGVzCmFyZSBzdXBwb3J0ZWQu
IEnigJlsbCBpbmNsdWRlIHRoaXMgY29uZGl0aW9uIGFzIHdlbGwgd2hlbiBoYW5kbGluZyBoYWxm
CmR1cGxleCBzdXBwb3J0IGluIHRoZSB1cGRhdGVkIHBhdGNoLgoKPiAKCkJlc3QgUmVnYXJkcywK
Um9oYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
