Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51531A1A56F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 15:06:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05768C78F86;
	Thu, 23 Jan 2025 14:06:59 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D815C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 14:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJt8fIWuq0KLkGyQyRPZvMGWbKcCQ4SlNvFOJms/Th9VagqgnVyirTVBl8H5sQEy3QGQeGpBpMl2H+uWxMUTZGpxenC6DTJY12vCYZD8LAlD0KDfVC8V3MTfCqegG8ZC5NqEZyQBJMmfokxAPj4PwMh2S21IeFUu79AjixXxFJ9Z8qcS2A0aCGiEGfBU+WHZjIQZnZTQECFW2J2z1cdaLr75JTtC+1Y6keWMRMGOp9gRmkadqNwGqdDqt49/RrM3U9q9WBBGooiTgKZQU5c7qsQOY/EeAWLdRcd6ZUIZQd56QQdmO12db9cboZyaB4A5L2gdI9v5iAEQT4nt/F2znA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqayU74pEcNiPTJ2AMBfqnTr4Kn7Xm4Py9BVe+PzL/4=;
 b=xbszUg1xr/mV3P28NLZjm1y4MMtzBltwUh5a7b1XMeTAf9tp7FJk0NannklleJ28G0iLHtzNF+tZ049rur2bklYmF648A2NdXCB3amdBbXJS84bIF1uRzE590VO1Q9kVuhPjhpDjT/7iXTPwd0wz7myVbfk6nG32Z/acl91DeBPw4xipfn6hQXbpNonaXzY0Wi7SHKklW2/wZOxyC9jTdorFCqMhz5vL1wa/EkT/D/S0H6tSbxPXNfDzuER4Q5Um434ZlEVUdsFqPahzySs0EP9QPvG57JJCMGFcRvm2lr5LdO+9RQzby4S5H/LiFgeArUCe2QgO5BRwFOdDu3A9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqayU74pEcNiPTJ2AMBfqnTr4Kn7Xm4Py9BVe+PzL/4=;
 b=hP/14hdPhw+wfl7TGm+fA8BdFJgF0au94r1XnUyFa/kmYUSiLy+3VClWhjfOPvguNq5YQYQlvun95mLaOp2T1Z/698En1n0irJQDeNnhyn6FwAFhEwXKMAVEnDxZSBpB8jxrF6Ybxh4/niUeYJfcMfCO/hxWnnw4NgV+oOgeKkrQ3dL9ucNtclaA3zJUlsVbEc9mP2aKy7LfCjzDhUZXkmp4tE41rRUe84Nx29lwgyT+ghFCmpYaHSY8vz5J7BKZ1aILLKWRHd1cfjwhAv8ljzCBdVQDYgI/JaEDmu+iRhTKxY/8Q4SsTBMjE9mzbDLri6NjoavsmsJxz+/+Lo9/wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 14:06:48 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 14:06:48 +0000
Message-ID: <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
Date: Thu, 23 Jan 2025 14:06:42 +0000
User-Agent: Mozilla Thunderbird
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8051e59c-4e25-4792-8a0b-08dd3bb72d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aExTV1JnSlQvMjRGWStvZkJvTlN3eHJWb01FRk9BeW1waWdxT3I4Tk5DWlJH?=
 =?utf-8?B?bXA5RHV3bkVNaWhYZkJrdmVrMjF0ZUhUaEVCRGd3dGF6Vk9XWEFwcmNQVFNV?=
 =?utf-8?B?RHpxVjVCbUhpLzJJbXhLZmhNMDVITllnTFBqUGduZjNycmZwSHpsSFRDV2Qv?=
 =?utf-8?B?Rm9Wbk5aTVFLYi95S3paamxHbjBNL3U0eVNKODVqa2hNSGVXZDlrMWYvYWRs?=
 =?utf-8?B?KzRRVXNKQWtaRVFJUFZjQ3BVWnM1ekVPZjc0bXJNQnVBWjBxbGFBT21xWElz?=
 =?utf-8?B?dmhoOGp3SmRvZ2dhcUpRME5HL1l0VWdDL3NYWnBKZTd3bS83SUdrRTE2c2d3?=
 =?utf-8?B?cnVLamhPb3N0OWk3ZmtYL1BINXlBRWYzTTUvaTZ5U1BuNXRiSS95bDZmMWtD?=
 =?utf-8?B?YVBoWXZhbkJHZUFOSXBUUEt2R2VwMUhYOWU2N2kxYy9kZUxacjA1M09XalZI?=
 =?utf-8?B?T1QyeUlsSSs5TzE5MWJRbXNSZ0JQOU1Ud25iSmFDcmNtcXVQUVdHTnlGWG1F?=
 =?utf-8?B?N2tvUXpON09CK0pFeHJLdkxBYW5TcldUS29nRmVjMDNZY3c4MXBZQitpT3dE?=
 =?utf-8?B?a29WMGdZVjI1YlE1Q1RXTEtpaXdlb05LWlZXOW5VUG85aytGYVdmZ3hURkx1?=
 =?utf-8?B?YVltVjM5OVVoSnhQNzBuRS81MTg2SVpVMWd3QUYyTm42bjV5OHJmd0xJSUl1?=
 =?utf-8?B?N1gwNnRlSysxSHVZTTNvZ3lBVE1TVVVpTUZoY0w4MUJSVEUxaGZzdmtLbEs3?=
 =?utf-8?B?OHMwODdjNWtJV0ZWQmw2Q1YwN0xpeHhkSFh2dXJYZk9NQm1iQ085UlhRUUdO?=
 =?utf-8?B?dzdWQ2d5a3haOVVINTdmV2pIRWJTQjVTSzl0R214b2I4cWduMmFRMEdCeis3?=
 =?utf-8?B?aHF2VEI3amRuRzdlaW9yMFVQb3ZMcTVYZHd6R0F4TjBnK013MlVFRXgxUWcy?=
 =?utf-8?B?cVlqenA5R2JNR0NaamoxZzJrSVBLaUxxak1vWDZRT3prZjE1T2Vzbnc0RUl0?=
 =?utf-8?B?NmhnM1NxTHkrMkFhOVJPcGVBRDdVWXZRYzlHWjVEaExhODZ6Q3pYVDJiZXI1?=
 =?utf-8?B?Si9PTFFUMzNoWmlmKzJwY2lJV01SbnkxR3ZCNlFaY2ZVSE56VmYrZ0dSQllK?=
 =?utf-8?B?cFBVUjZKK25rc3c3QWowaGgvRDhKZE9xakNkNENjUmlEMnJzbTBIL1RpTWZy?=
 =?utf-8?B?emxkZkxNOFM3UHE2NzNERURZR2lpSzZVV3g0VU9DOVJoWk1qdjBCZUZYSEZq?=
 =?utf-8?B?aFlFTmlscFJYTy9Lc2RPVGt1R2NicTZyYkliSm5ZZVFKSVQ5K0RiZUo5VnNY?=
 =?utf-8?B?ZW1zWFF5VTA1dE95dTA4R3VFelllZ3Z3a3VzeVphQzRxSE1ZcC9CWlg4V2cy?=
 =?utf-8?B?NUJXOERvTXlrMDdjT1U2ZUlxNkI2R1l6bUxybDBXb1NjRVBxb0xpTlIxTWdG?=
 =?utf-8?B?NjFpdE82MnJ4MVFPVHJrWUpHcnFhNUp1UGRmTHBibUR6SG95dEp2NkVwdm5i?=
 =?utf-8?B?bmx4UzNydUE4NTh4dFVZOHM2cG4vckc3L09zV2YrSThTSkZsVnc2NEhWOVdV?=
 =?utf-8?B?MzU0dTMyakg2aUd5NUNWdUNkSEVHQVZJdGM3TkdYMDdlSGNqRVBHU3I4c0ZF?=
 =?utf-8?B?ckl5ck14TGNOdFd3clJCbDZ5c0F6VmdtTEUrVFZReVFkcW9jY0RxOEszREJD?=
 =?utf-8?B?VmRya0IzTHl4N0VlS2QzRVlCU2JTQWt2SG9MNmgxaEF1bUNnOTUya242OHg1?=
 =?utf-8?B?S1VFMzQzbE9nUHVkOUtLY29JV1plaVdjNTE3QWpTZ3M3cXRHUDBLZ3J5RTBw?=
 =?utf-8?B?SUhOd2Z5d2tOOUZMNXVUeTR3SElFMTNYMi9OdHNwaDl4M1o1MndURmJkTms2?=
 =?utf-8?Q?0E+08GuirqvCX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWhUV1o2eWFUMlljdmtDWHZQeWRnMHBaSWsvVjBzMGtWdVMxT3pnK0FxZS9S?=
 =?utf-8?B?M2tFUnpqL0JtZVpaaXlpVzlCVzNnTXBycHVEa0ZnNFJMdEUwa1FoMzZBK0Yv?=
 =?utf-8?B?NE12alBCZ2lIZWo0VHdRTDUyMjBBY3JlZEVyZDBRZHd3ekVzMGtvS0hPNCtG?=
 =?utf-8?B?SkJhYkcwZzFVL3dvZGZHamt3aVl6ZCtpMW9ZVFdSS2dVSjJzdUc3SlNDTjkx?=
 =?utf-8?B?WXhPNUNOaWR3ZGgzcDNkNU1ZT2ZnOVMrdHVzclBGYWR2TWFCQUhLUE9HM3R0?=
 =?utf-8?B?Y1NsSWpSMlpKQXBzeFpxbE5oUXFOMEJMLy91U1NBbUV3dDN4MHFYSzRzQTkr?=
 =?utf-8?B?em9WdDJIVGw2V2E1bmRmd2dERXdPQ28yR2RsQkNLUDZ4dmcwZDB1ZVByMnV6?=
 =?utf-8?B?ZHpNemoxOXdtQXNpdFhRMkJ1SVpHdFF5Ump1T1RsRjA0aDVGNVYyV1dESFJy?=
 =?utf-8?B?R1JhWHlrZ3lLSUtzOC96RVN3RWcvV3RRazJ0RERpdW90clkzNHFqMVFVL255?=
 =?utf-8?B?eTJ4TGY4TVJRYklEcEJ3SFFONHJKWWdwZ0NsMk9xaVc3OCsyUGV4dzNDbFFh?=
 =?utf-8?B?Z3lmZWdIdzlUVlVhdzMvZHhHZ0xVVzFxeTNvakZGU3VCN0lkczQ3VklFYnRj?=
 =?utf-8?B?blIrOXlZR0JiVFlTMjJNdHVKZmkxaGtwS0UxME5ITklqQnlqSkxtZzBrbm1p?=
 =?utf-8?B?OXY5TjVNSFhkMkNHSDkreTV2bERvRWYyS1l3NUZ5ejFFNy83SGRmZ0hLUTJw?=
 =?utf-8?B?bUgxZWtRTkhJLzVqaGxQcFY4Y2JCTjdFMGpoWXhoWWpJN2Rzayt3ZlNwUFdq?=
 =?utf-8?B?aDdLc3NqaCtoRGgyOWZkeFd6T04wT2I2ZElLQnN0NDVsOTgrY3VObTM4aTlI?=
 =?utf-8?B?Uy8rcUFNaDRTaVN2MUtRWllLMXlUdHJJZlYyeE42d1F0cU5YQ3dzL2YycjVY?=
 =?utf-8?B?QnBNU3hPRVJuUFYwajdBTWhTZFROOG9xMTBxMHZKVHJ4cUphY3FwV1I0T1JP?=
 =?utf-8?B?TVBtaS8zVDdaN0lIOGM2by9tR1NrVWROVWNuYTBicWJmZmhWOFl4bWNqV3Mw?=
 =?utf-8?B?ZUh5YWFwb3pxNCtaS0NuZTZ3ZXBETkcrdmQxME5FYWhWcHgvWE05ZUFvMDdD?=
 =?utf-8?B?YVgwblBCUmdrdUExaXVqNEkxcU1zeW5kWjBRY1N2b3NUR1Y2bFpFTVlvY1E4?=
 =?utf-8?B?Tm4yZHdTb1pmU0RhSEZSWE5jdUkyNXZIRXYyaTdkc091RStZSUFWSVNINHhw?=
 =?utf-8?B?SmtRc244WURmOWtKbmFZbnpRMFJacERzazBjZTlKbzFERjZOaEEvU28valgy?=
 =?utf-8?B?VW0yV3lxRDJvYmFLUW93Q0ZKZUtxL2MvcjlXU3BxM1RTRkZLTStrczJ2MDdm?=
 =?utf-8?B?VlFwc25VS0xWN0V5bmZHL3FuWHRaZWsxenJhNXJlSlRsMHYyYWxmU0tZQUJQ?=
 =?utf-8?B?Zld5S04ydWZ3ZVp1bXg4d1Q0L2ZnS0c2U2d1RFpubTJ1d21RaTNHM1EyWmgv?=
 =?utf-8?B?TFFxbktka2FaTXVKNGlpS3d0Uy9Ea1doK1FOSTZjVG4yMG8zSDhWZENJL0dh?=
 =?utf-8?B?NG5DQnNpV1JVZTdnY09VeFgvNGVLWFVTSDJMUFA0RW9sY29MNTZ5ckFHbGRV?=
 =?utf-8?B?YnlvcXUyQVVkTDlWS1h3WTJXSG5Mb0FmcnUrOGJaR0VJeDNjcW82QXEyS0dm?=
 =?utf-8?B?TVpINlBFUloxTkxXb0tJNXI3WlEwS3AzZHNBMjgvUnFlM0gvalBKRG5iRzNu?=
 =?utf-8?B?ZEV5QlAzWXlUMTJJaDFMMDNRa0pIOGlkMGhCbTQ1ZzcwV20xNWhoVlByQUFt?=
 =?utf-8?B?N2pwU0F0aTN1cThrVlhpRDBWSnI5T21GaXRYM25vZXBHS0FKd3RTZVpycWRO?=
 =?utf-8?B?TE1SckhVRmpPcEd2TzRZUnUwRDNteFhTbkZQYmVBaG80a1J6NEhZdVBkOEpQ?=
 =?utf-8?B?eTBsaTkrVlE1QlJWcytWSFZtcHE5QzlKTFlGRlFCRTZUNnNxT3RQV083Q2pQ?=
 =?utf-8?B?bWJnUEVvMy9KRnV1eG5qSldZby9qcCtLSzQ4L2s2bS85V3BpUG9ERndXTk1D?=
 =?utf-8?B?dTFVb1RLL1FaM0RIZitwSkVLQ2FFNUdydC9rSStjNlFqSENKRkVGSlIzZ2Fw?=
 =?utf-8?B?ODhPSlBMVWdYdGtPWXcvbGdnNElUSnlndGhwamJKTlRSR0J3N3R3NmlUemx2?=
 =?utf-8?Q?t6Ium6N8CSCNJl/6XEhFzteqFZ5sXeWCkoBfznbjostH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8051e59c-4e25-4792-8a0b-08dd3bb72d59
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 14:06:48.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWrBiUcsHDQx3TLBmroAUUp+dqccqwaArLPyrmfyD2jK7KovSHFsTPrao8Q1FWK6TAuhavGOTdhRia4JCEB1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

Hi Furong,

On 15/01/2025 03:27, Furong Xu wrote:
> Avoid memcpy in non-XDP RX path by marking all allocated SKBs to
> be recycled in the upper network stack.
> 
> This patch brings ~11.5% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, from 2.18 Gbits/sec increased to 2.43 Gbits/sec.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
>   2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index e8dbce20129c..f05cae103d83 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -126,6 +126,7 @@ struct stmmac_rx_queue {
>   	unsigned int cur_rx;
>   	unsigned int dirty_rx;
>   	unsigned int buf_alloc_num;
> +	unsigned int napi_skb_frag_size;
>   	dma_addr_t dma_rx_phy;
>   	u32 rx_tail_addr;
>   	unsigned int state_saved;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index acd6994c1764..1d98a5e8c98c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1341,7 +1341,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>   	if (stmmac_xdp_is_enabled(priv))
>   		return XDP_PACKET_HEADROOM;
>   
> -	return 0;
> +	return NET_SKB_PAD;
>   }
>   
>   static int stmmac_set_bfsize(int mtu, int bufsize)
> @@ -2040,17 +2040,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>   	struct stmmac_channel *ch = &priv->channel[queue];
>   	bool xdp_prog = stmmac_xdp_is_enabled(priv);
>   	struct page_pool_params pp_params = { 0 };
> -	unsigned int num_pages;
> +	unsigned int dma_buf_sz_pad, num_pages;
>   	unsigned int napi_id;
>   	int ret;
>   
> +	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
> +			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> +	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
> +
>   	rx_q->queue_index = queue;
>   	rx_q->priv_data = priv;
> +	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
>   
>   	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
>   	pp_params.pool_size = dma_conf->dma_rx_size;
> -	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
> -	pp_params.order = ilog2(num_pages);
> +	pp_params.order = order_base_2(num_pages);
>   	pp_params.nid = dev_to_node(priv->device);
>   	pp_params.dev = priv->device;
>   	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
> @@ -5582,22 +5586,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>   		}
>   
>   		if (!skb) {
> +			unsigned int head_pad_len;
> +
>   			/* XDP program may expand or reduce tail */
>   			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
>   
> -			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
> +			skb = napi_build_skb(page_address(buf->page),
> +					     rx_q->napi_skb_frag_size);
>   			if (!skb) {
> +				page_pool_recycle_direct(rx_q->page_pool,
> +							 buf->page);
>   				rx_dropped++;
>   				count++;
>   				goto drain_data;
>   			}
>   
>   			/* XDP program may adjust header */
> -			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
> +			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
> +			skb_reserve(skb, head_pad_len);
>   			skb_put(skb, buf1_len);
> -
> -			/* Data payload copied into SKB, page ready for recycle */
> -			page_pool_recycle_direct(rx_q->page_pool, buf->page);
> +			skb_mark_for_recycle(skb);
>   			buf->page = NULL;
>   		} else if (buf1_len) {
>   			dma_sync_single_for_cpu(priv->device, buf->addr,


We have noticed a boot regression on -next when booting with NFS. Bisect 
is pointing to this commit and reverting this on top of -next does fix 
the problem.

I only see this on Tegra234 which uses the 
drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c driver. Tegra194 which 
uses the drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c driver 
appears to be fine.

I tried booting without NFS and the network interface seems to come up 
fine. It only seems to be a problem when booting with NFS. However, I 
guess I have also not stressed the network interface when booting 
without NFS. Have you tried booting with NFS?

Thanks
Jon

-- 
nvpublic

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
