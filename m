Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC8B2FB28
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 15:50:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D1B1C3F956;
	Thu, 21 Aug 2025 13:50:19 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6984AC3F954
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 13:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwPHR46snTqx4fS8p6ecOPZgWGGGGdQd6jyPr1msPM9os2/iSoaqP+NnPliHr6z6iNiK8c3xLSykC0GJ1eqW2wAc+DV0mO6eVTYnmutbYFjMUdaaw2PE7XCisgSibYm+T4nwh1QGVJV8on9TXdSZM11NMPAtF/Z3kkkPxjh2oFnj67W349GVy0+ysvHdQowi+1RCs6DA8O5s7cJGACVouzHxin1ZFNEyZCzwgSEYgOLJ9EegBsNygmD/yD6x4+h/2FxIo/8Vgm82WknyJRsc4diminAyF3ugWeZMd+PdN/JJ49Flv5bXQvrdLIn60wE56H+aF+lbDBWQkpYdh5iKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f6v6sQeS4drVythDSBE5EBBTcjXR6tVJmUZ6rE72bs=;
 b=Lt8iNRSTEnae7p2cz9Ul1ds01BaCXdkuaHZk/w07BCYuZ6sjBNf+fX7jgrlXIME/l1iQAp4KmvwP+oormU76UdngmHVNKcSHm5HlX2LRLAf+6VCvJ2oNlP8icEhQILwRlSe6fs0VQkadxew1jZJFD07QJt2mLYjTc2w5A6CJBmx1OovS19NPiMJ8esLjozr/2Yk1LtQvoaOVBXRVZkHLJo4mhYtaJDIe6CkuOqgQnbo51ZACF0t+0jmwziffkVyKuKEwqY+52AUADisF9l8oXC1OZMVd6TLpMVvAT4JKiMtgsUCbRAMY9GPfeS1BVDUdXdzxWfklfM4zH/x7CCMuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f6v6sQeS4drVythDSBE5EBBTcjXR6tVJmUZ6rE72bs=;
 b=KSilKAbcoByt3PUIsYg+zR/vLd6oyGZAlojcwbXud1nAoiZieBvBLxM11gzGYmUaM88bQ/ZgwX3F/zPLPLxfTMMHecMGmMPj8rbn5NjmHvcbNKcDcYPAFZZg5ohvaXUhOhrES2Bw7v//is++k9YuYV/brgXzyxlzJ4zpR+V45KnqzYGUJvCqoKcC/5bOzBnyXqkljiSzRpvv4Vpj800SR4Nmyvuz/QJrgqKj5xUq/Civf5jnPNBUoxqoWMR7WDmJFOy+SMByt5q+8z+4RVr+t+w4w+TXbgJnOMw5rmVFCgJDaFdhyI5TVs8cTQIzJtvREPukkm8KKYIqO3/WgdF0EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by BY5PR03MB5142.namprd03.prod.outlook.com (2603:10b6:a03:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 21 Aug
 2025 13:50:13 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 13:50:13 +0000
Message-ID: <feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
Date: Thu, 21 Aug 2025 19:20:02 +0530
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
 <20250819182207.5d7b2faa@kernel.org>
 <22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
 <20250820085446.61c50069@kernel.org> <20250820085652.5e4aa8cf@kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250820085652.5e4aa8cf@kernel.org>
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|BY5PR03MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: a34e6734-ca42-4bce-2d94-08dde0b9a6d4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFVOT2lyOUw5eHlrR2ZNNXhKK3ZaZGg0bFZBM21ldUIwTmxMOGdXdVhXcmk5?=
 =?utf-8?B?UjJDbWtjNjE1aFROREp6OGNjN2dINjRmcHo2MUtRbUJTNjdUdWhneTg5YUJh?=
 =?utf-8?B?RDFCeURicHZDa0dhajBGZ0tNTEFManhmclVkZTUzQ0tmWk1HUkJlWGE5a0Qv?=
 =?utf-8?B?b2pSUjlaL3Z4cXhnY040QXEwY3dWN3FxKzl1VStPUzFGVUZUMUhpbGd3SUQ1?=
 =?utf-8?B?N0lCNGZsSjFnN1dkZWtRaVkyQlpYVTRmZXZaMnAvRElPSmRENUJWWGM5YUFw?=
 =?utf-8?B?NVBTN21BQk5GR09qemhjOEoybUNSNEplaVBhQUJoMWFpTlppY21qYlVBZmUy?=
 =?utf-8?B?Vm03ZXJSQ3ZtWHVFNG12S2lNby9pNXordFozd3hOdjQxc29VV3VETU1EZUI3?=
 =?utf-8?B?azE1UlBVU3M0MHAvN3NxL2hMV0syNHc2Wldkc0U4WndVcGthVEVLRHVGRW5m?=
 =?utf-8?B?Um4rdXB1UG5oUnI3b2o3MEVqZWllUlBqbGZiSEYzOHAzWG5mNmRPVzFDdWxR?=
 =?utf-8?B?RG5JOTZndnNkSFlodWpHb0lIOWpNUmZuemJEaUNYbmk5b0JIb0xlTS9kcUIv?=
 =?utf-8?B?SUU2V3U0V0dkNkZlUC9NTThWZlBheUpjMXN6bHZWajQzdTVwOTBTYnFWUjZs?=
 =?utf-8?B?N2I0MTNYRkpGOUdIcHQrSEYrOVUvUzJTVWZHYkhHUlRPbFhRTVhCWitBdE91?=
 =?utf-8?B?bHdQUldVL2I2cmdKZGVYV3J2RWRlcG9jRHpOUml5bUl4Z0EyTkQ3RTltcWhO?=
 =?utf-8?B?WVBzWVRCQW9rQ3hPR0w5YTk0NEZ4L1F1bUpPOFJhYmtDcXhqeE1HWkxyTUFO?=
 =?utf-8?B?L21wK28raUk3VDRJN2RYOVZMbkJROGhBeGhmUEM5YzZRZmUwZ0o0VE9TVkhm?=
 =?utf-8?B?US93aDQyRU1Lc2NRSVpFS1VVa3FZcXZweDdLZFYveXZNYnY0VjByL0dtTW9l?=
 =?utf-8?B?blc1R2JaZmZEVnY5U0o0S1M2YWRGNURHQkhKeGFWOER3bTllZHBoNjA0V0ZM?=
 =?utf-8?B?djVtRTdpYVF6WmJjckt3aUN1UVNkblkwcTJTS29jZXlMdUk1ZHlDOTVyZTQv?=
 =?utf-8?B?TmxWM1BUQWcwOEpCcDBGOTloUys1SDJxcjArWEdGVnJoOFFQTjRCOTl3N0Nn?=
 =?utf-8?B?WDVLaUtYY2ozS2RJZWkzMTBhcWMwcVc4MTdpYy9RWE5TendiR1JYRnR4Q0tU?=
 =?utf-8?B?UzFKVWJpTEVDTGluSWFhWnppelQvU1VqbllhM1k2ZEhCbFFLM3RmMWsxbHgv?=
 =?utf-8?B?L3dqSVkxd21qMmJuUzRwbDRRckJFV1lzb2hVd0RGbG1pbXNqa3dMUG1aK0dC?=
 =?utf-8?B?MUlDSzI3SU5BbkM0VHdyYXJ6cjBPaW5QYWwvUHdCNGZZbnVtT2crb0V3Q0V3?=
 =?utf-8?B?U21UbklST1hvWXFrTk5UeTg1WmpkeUptOHdRYkJFV3NHb2NuNldOQjdaRmNN?=
 =?utf-8?B?MzliUGpRZkpyQTBVVCs1YjJ5VFlHNGFHK2dEYmZDM0c3ZFVuVkRKc1hteDU3?=
 =?utf-8?B?R2k5UXNiVU1Ta2ZRSG9lQTVPSFR6dEV1Y1FFNlVGL3UxbGx5MXRIK0VvMXAv?=
 =?utf-8?B?dTg3YXRNZW9BK1F5Zm5PeTIvelVwdmhOSHBJbnFTVnhOaHB6Vyt2UGhuTE4x?=
 =?utf-8?B?QUg2UkxYKzNFMUk0STFLeDBJeEVrV3Y3YVdlWlhXQzdITkFpc3dYVjZaQndQ?=
 =?utf-8?B?VTBnSEVielhwT0J4M3Y1LzhjRFVLa0Z1R0lHRndJNFB2b3BOMFlLWHRwK3BU?=
 =?utf-8?B?UmdzOGh0VTRzQjdUUW84T3JZMzAycnFrbXJ5THpDRWZ5VVRGNVp6am4yL0g2?=
 =?utf-8?B?TkY3NWFFZmhBNmUxYjRHeEl0dzBYeitBSWtQN0xDQXpuM0VEZ1pxNzFqVStO?=
 =?utf-8?B?aFlkYmJ6SUdqVm92VUs1S3B2VVJLOWFzei9OY2ZMNGpnWEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVITUpxY0NJUy9CUlFWSXAvQUR6ckRXVDdLcklMRklJemh6WWZjSnpYOHda?=
 =?utf-8?B?Y0h5WHR3M0liczhSTzl1RGxhaWh0SnNEc05Ceko1WWU2SVV6dVRZbGpFMHlz?=
 =?utf-8?B?Zyt4VFVlK3BUdm5VT1BGdGFIc3E4VFFwY3ZzcWFiaUFMcUJNZEV0QklzdzRE?=
 =?utf-8?B?Mm9qSDFmQzNwUEEyZVpmKzI3OTdpdTFkS04yNlJvdDlNUU05N3EyTDVkSVBy?=
 =?utf-8?B?WHg2OXZYU1Y0dlZaejIzMDVSUEZCeFg0aE9EQTc5YnZ6cTNnNTdyZEFnc2VK?=
 =?utf-8?B?YnhacUpxRnNyaGtzMlp3VlFZeDZOcGpKWnBFbHpyMXRPd1J6L0svOGkrTnMw?=
 =?utf-8?B?bGZMdUYzUy91M09MbGJhNmlsRFpyTXd6cWhxV0xBblY3dDRPUU01bFJIRlUr?=
 =?utf-8?B?Y01icHg5cWlSSDVkeml5VkU1WkdaVkNSRWkyaWNQckd1QXd0bStySHRoNzdR?=
 =?utf-8?B?UHF2RWl2dCs0VDA2b1IxbUJReEZGSEV5UndnUTJaZXJqMVpZanlGVE1ESFdm?=
 =?utf-8?B?c1k1dXo2YUxXSDg5RG9XWlJONGwvbitvN1VsTDJrOEFGamR0L3l6UVdXU3B1?=
 =?utf-8?B?Mlo4M0pER3pXZVBGTDBvV3JLUjhNdXBKYjNDcXJnVmJTSjJpVmFZSDFaQU14?=
 =?utf-8?B?TGlJcTc2QS9pclBqblVpL09ySmdOTkdSUXB2ODlSMXd6SFR5end6NDlKQTJt?=
 =?utf-8?B?OTlYYXdSTjEwNk5uVng2NEFldnhpNHRlZ0k5Sm9qK1U2aEJKRlNPY2VsNkFZ?=
 =?utf-8?B?OG9LRWFvQUFpaEFpNlVhdkZ5OWxYL0J6UVJDVHZZakNTTkZ0MkwyTndUbnhT?=
 =?utf-8?B?NEw5cStMWWZQL3NveVdMM0dSa3RNMGhEalFndTNyZjVOa2tkamlxTVEyaTY5?=
 =?utf-8?B?cjNnTW8vT2dQYzdkMXVHbXp5VlYvTm9nUTc5cGhuRzJRanIyeUlkanpUL25r?=
 =?utf-8?B?OGFnaDZ2VXpiYW1NT09MUTROaCtHd05ySVNrQWtuVStCaVdiS3dYbE45SmYv?=
 =?utf-8?B?K2h3L1hpYjExUnBBVFhKZWlFdHBRSWlpdmpLUnJzMjE2YmFLTHRJTlBDUE1X?=
 =?utf-8?B?UlE5eVlEaDQ3RnZpUW1aMU92QzRVWEh6N3dOaTNGMEliTGZZMjI1bWtTTFFi?=
 =?utf-8?B?eDdBTWtQL09qdVF4QWh2L0JQQW9NL3krYldBM0VURitZdkF6OGxoekZWTnVO?=
 =?utf-8?B?MU1sOEs1d1lVYVlRZGVEQ3l2OUFOSzlMU3RPakFJcVVYcjJFL3ovMWFQVGgv?=
 =?utf-8?B?eDYyZVR5U1hub2thWkM2M0cxbnd2MTVha1dzTy9DR3dFbWZDQ3RhNlgvTnZI?=
 =?utf-8?B?dVNXT1hvUE43MllnMXBoRi9aamUzSkF2L1dkRVVPMUlDdElwNllSK0VvL292?=
 =?utf-8?B?N2JXYmM5NFRoMElhQnBJeUxsVjgvZER3K21tVzdjMDlMdVFZNUdsMGxvZjM0?=
 =?utf-8?B?a1JUTzBHc0J6SFJUUE92NitoMGZ2Q2pHNUZibWVTZ0RsQm1HTU5PYnMyT2hF?=
 =?utf-8?B?TEx6dUJKcHlyc2N6eWJ4d0Z3blpmbGp4OEhLTVAvcVZHTmI2ZkRGbTVVaWJz?=
 =?utf-8?B?bHVQZGpITVJBZXdxNFhSVjI0dm04ejZvSTB5bkcxNElDMXRBOHF6SktJZkFW?=
 =?utf-8?B?WEMwVEtQYmpjT3JUeFB0YWlvSllBT1AzRTJRVDZwQ1BobjF2UU1FbFc4QkZC?=
 =?utf-8?B?OUt2aGFkUUVTYllBVm9SNFo4WHJLTGFIdmV2TlExdFF0TGNhMzlpU2dZSE9q?=
 =?utf-8?B?Tmx2OWdWb0tvQTB3UjAwQW9IblI5TncvTWh4THkzUEVpQndpUTkxL3FPUld0?=
 =?utf-8?B?R085MDRxenVES0ZuVUFzbzF4aUhVeTlhSmZYUjREY2pZUTFNb2RFUERyZ1hO?=
 =?utf-8?B?MHJsNGxDRnQ0Y2Q5Vmt4RzNvN2tDZkFtT2szMFczLzArdnFHdHlnRGdFR2s3?=
 =?utf-8?B?VXZGRllqWnFveEM3VTRLb1UzQjN5bXkvdlNxMkIzM2pWZWxCOEtLTHhYYkZW?=
 =?utf-8?B?NitVc3F3aUdmQXBoTkF1Z2R1WERoUlI5Q3BFUTVwZi9XSW9kaFZyYkRWWUlP?=
 =?utf-8?B?cWdMWWEwUTdFSGJxVUQxeEQ2WjF0eFhjSFJPcTcyazVhOG9RaHQ0T0RYMjN5?=
 =?utf-8?B?eGpwZ05zMEdOOG1pM2ZnczdxL3JWaGVCZnZGOGxXbzF0VUV6dmRhOW5GeExw?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34e6734-ca42-4bce-2d94-08dde0b9a6d4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:50:13.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdqymmbu7I4Pz7sNIZSzOxjC++V7cchmmfoEj7lSIrfA3DJiDlhhWpzu5Ub/G0ZqJ07ff2AWh8/ifDVAOJ9vZ41c6kX/YSuaZHhz06v9uLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5142
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

Hi Jakub,

On 8/20/2025 9:26 PM, Jakub Kicinski wrote:
> On Wed, 20 Aug 2025 08:54:46 -0700 Jakub Kicinski wrote:
>> On Wed, 20 Aug 2025 12:44:18 +0530 G Thomas, Rohan wrote:
>>> On 8/20/2025 6:52 AM, Jakub Kicinski wrote:
>>>> Hopefully the slight pointer chasing here doesn't impact performance?
>>>> XDP itself doesn't support checksum so perhaps we could always pass
>>>> false?
>>>
>>> I'm not certain whether some XDP applications might be benefiting from
>>> checksum offloading currently
>>
>> Checksum offload is not supported in real XDP, AFAIK, and in AF_XDP
>> the driver must implement a checksum callback which stmmac does not do.
>> IOW it's not possible to use Tx checksum offload in stmmac today from
>> XDP.
> 
> To be clear -- this is just for context. I don't understand the details
> of what the CIC bit controls, so the final decision is up to you.

Currently, in the stmmac driver, even though tmo_request_checksum is not
implemented, checksum offloading is still effectively enabled for AF_XDP
frames, as CIC bit for tx desc are set, which implies checksum
calculation and insertion by hardware for IP packets. So, I'm thinking
it is better to keep it as false only for queues that do not support
COE.

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
