Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758C9E5342
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 12:02:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C81CEC71292;
	Thu,  5 Dec 2024 11:02:18 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C919CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 11:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0X2qohuZywZOhZDYP+EPRDkUUpqmyNmEuH9Zadfn7hv5VsQREhCb9kR5ovmE6bVt+hgGVSGICwwKcR0CTJpbzt+FanCBwsaSO0Ukk7Uu6Qa9ONi9qV7mLznLLc2kLOTdsv0xq3obFgqKsI2nQ4tJjtn+wwKsOqbYb2VGvmEJlZdFGf+cDLd8Pbzu3l/3gU+zETIojs+isOHOIO6JUmRhslplz1vjhAe1k+vrvZrOEChboTPIUp3NGq7KYOFfHOdEuBNNiwbqfF4JqTls+GIDzpkZFt3kznrf1IJFpRZH45AJ3cNevopetNd5iPuYePTZaDBKazz4j9d2sEOXnA3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAbqJzjg+5Zot9AIRxBD7sFSQQZdZrnLEPbQFmMYleY=;
 b=FVBtazqnqVIdWC9neghSe08dhFaT766LTMEfdFyDRepfVnFv8F//72jwFkmhpfdUdnymWZ/BIfRfINBCAZJip3gg8W97CVL8eIIA+k4UQ2e/jA5NSRus3iS2BtOuAA79ZDda++nMW9EENY9HMRXH1JZWAq1boYlXNNS0sB0KYwYrhuEcXeiGeh4xZfpEtLOwP7a5MsfQ+toPp12qj7+Qds8kupw0m65mUU1jay9tQsHdKulGunnhZLE+aBe24WKXQlVKnqNu77NYY24LF9Xq5F9nKxEa2/fzmKs3MHAAljBAm4fCbxxAZ6InZ983Gt7m56fj0nPY2fA+xEF1p1PVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAbqJzjg+5Zot9AIRxBD7sFSQQZdZrnLEPbQFmMYleY=;
 b=gAuXO5P17RdK/YqvbHRUsrHbZIHkw5MuCzbA59hRIbg4CQ3yEacVZuNrSTYZe8SnQ9fXKKNSRsC1fftl0U3R0akYF5AS5sYf8jyDb/BEm/XbqWpXwy9eDyhoNDcgiBWqagd/bK6af+TQeGhVNg051NGjPK/kW2LC9/72gp78QtY9Zf4BjyVqedn4k6PQelcsOEnJ7ulMNYDSwB9w7ElxEIXm1rk5T0cnHBcryDQ8baogmkVX5WbfRt7xlbMbCQnMsR6HuvdibcrCONGXmR0WLmnVMN2Kr8e5l+jntwaTz1XCMZiYzpIHtsFTXcnTrYW7NNOlLORHrCJVIMwDGq2FzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 11:02:06 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 11:02:06 +0000
Message-ID: <ddfe8dbf-a2ae-4aa0-ad09-fa5efcb62c12@nvidia.com>
Date: Thu, 5 Dec 2024 11:02:00 +0000
User-Agent: Mozilla Thunderbird
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com> <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
 <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
 <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
 <Z1CFz7GpeIzkDro1@shell.armlinux.org.uk>
 <9719982a-d40c-4110-9233-def2e6cb4d74@nvidia.com>
 <Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
 <pckuhqpx33woc7tgcv4mluhwg2clriokzb7r4vkzmr6jz3gy3p@hykwm4qtgv6f>
 <0ac66b26-9a1b-4bff-94b9-86f5597a106d@nvidia.com>
Content-Language: en-US
In-Reply-To: <0ac66b26-9a1b-4bff-94b9-86f5597a106d@nvidia.com>
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 723c9aa9-10df-434f-a66f-08dd151c41df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWMrZTVYem1nbnZIZUwxNjJUTFZFM2JMR2VKQXFBbTdhVlp4aWJWNzBTQ1hN?=
 =?utf-8?B?YWc1TTFjOGQyd25ZMXVOZ1FIRktMOFJNSzJib2Zna1ZhUEdxdTdkMFJLcEZn?=
 =?utf-8?B?ZTVOU3Jhb0VjcVY3anppZmN2VFh2L3BVNUwzNEpQTE5GbTZhZjFsR0xQS2xT?=
 =?utf-8?B?M08zUzcvNktzbDZYZ2k2c253ZzdONm44Wlcwc1BzcytHcTRScUdKeWM2TE5w?=
 =?utf-8?B?MUdGQklMU29XcG54dzlOa1JSMFVxT095QVp2SU15cVdyOVlwMTFvRVZ1dW5T?=
 =?utf-8?B?RTNYeGlFcDRLQW5CdEdGajNkQjFqZGszaWovdzhyUCtZVno5SnlVT25SeXNj?=
 =?utf-8?B?ekU0d0w5SXVtbXpiNyt0K2V6WVRseXlYU0Z1ZlhPU0d1dGpDZkdnbjUxL1B2?=
 =?utf-8?B?bURxWFk2MlRrdE1pMXF1S3QzSUlmbHRHK29qNFFJNllJL1k4SENuNmlzWHlF?=
 =?utf-8?B?ODhYVW05dGJEOUNURXpIZUliRC84cFF6L0ozRGNWbFBXZ3B1NlRmc09SVE1y?=
 =?utf-8?B?MDVDUEpUS2xlU21ZWHdKOW96K1gvU01JUmxTWnpMalc5T2tSMW9zdEdQQmxI?=
 =?utf-8?B?bllnZGpuVEhVcXRFK3RvY3FYWkx2cFJpd0hwZGNCdUJSY29oRklqZWRvaDZV?=
 =?utf-8?B?RGpBcklQbktpVjRFeDZOajE0STdXY2tHWEt0VzFuM3dFemZ2SC9zcUUvZnha?=
 =?utf-8?B?TEVlY3YzbWxJeU5EbnpnbXcvUjQxcm54Y2Z0YWEyNjVSajNlRmtzTTFSUnY5?=
 =?utf-8?B?UjlHYUwyd0pXckNQYVBkMUtMTHpJcTRZRHJzTHM3dXM0dklJVWo2eUNEam9V?=
 =?utf-8?B?M0w0MGVoMDdldVlycUkvZGkxaXV2aUc4akJiZXM0a0ViL21ZVEdwWExyUjk0?=
 =?utf-8?B?QnBHWE9WdE15R0ZaNk9yZ3g3QTlGdEczM1ErT29qWXQ2cTRMRmY5cVc2NmNQ?=
 =?utf-8?B?NjBsRGl2WFhWekxCLzJEdFRVTGtiMHNYcWNBR1FPNlJ3bGpvU05rUjc4R2Iw?=
 =?utf-8?B?Vmd4SDJ2UHZyNTVIeFRnU3piQkpZS1k4WUpNVDdiZ29hYTByUlRaNEVwQzI3?=
 =?utf-8?B?YmtxZVNlekZ0dkdTT0JZcFJUV1FvRGVJRWZpQzlUMXN3TEFGbU5heXdzclQ0?=
 =?utf-8?B?aHF2MXJzTEZQRENIK3hKeUhNcGtYV0RNWVJyUlRNWFRSVzJPNENOUWhmREIv?=
 =?utf-8?B?Z1BqUkkrbEtKQktjZDJvOHBSM25NbGJWbUthUHRJUjE3c3NOTW1WOVdtVUpS?=
 =?utf-8?B?Ny82dlV6TUNxUEhxVERKMElsR3owT0E1dWtYU2o0cUk0SFE4emlTbWxINmlQ?=
 =?utf-8?B?RWY3a0c3cDdQUnFiclVMbDBZcjJHMDY1MzZaK0p5UGlaaURCU1YxL3ViNW81?=
 =?utf-8?B?WjVTSkVlanFtMy9xUjcxck5BQzMzY3VJK3p2QmFyYm5pcWhBNU41d09YM1Z6?=
 =?utf-8?B?aDlWSy82eGRjQ0hoU3NEZlhJaGg0d1RObnoxUk92RmN5ckhFYkM1a3IvM2ho?=
 =?utf-8?B?THJIcXg1Z3MybmVFaURhMDlaQ2QwcytONXMyNnlseEtqcERBMTdmTHJNVVhJ?=
 =?utf-8?B?ZVpiOTJrNzFGcWhSV1hZaVZIdHBBZVlsa2Z5WWIzWUNJd0FEZmVFWmFnekJi?=
 =?utf-8?B?c3ZZMHhjMi80VVFPSFN2cmI2OHE3VER1OGl4R0xkMmhpc21RRzY3RkhvUWlJ?=
 =?utf-8?B?NEhISFVaQTRlRlpBMUJuRVMvTjRsTTZGSmYxTHRqeGpzakpJaXRqaVJucUFv?=
 =?utf-8?B?U3FOa2t5eDUvWUxZczNGSTF2UnlWVlQzb2tpNkVIYkNQVmxOcVp3YTcxWWdi?=
 =?utf-8?B?SWhleHpHWlBFajNxRUl6UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW9raVpHSWlzUU1OTGcydXFBc1d5SHpkMXhBZFcxNjQ2YXJ6L1JhNy9rZXlM?=
 =?utf-8?B?QWV6VUZCc21zMWNtcmplVHYxUUFJNXkxZmUzdFNGV0MzZ2cvemdtZW1TWk5D?=
 =?utf-8?B?ekM3bEQ0U1liQmM4S0tFUmVHaXlYc2VyMVAzTDA3aFIxZ0xMMy9MQ2hRMlhl?=
 =?utf-8?B?dUhnUmpjQWlGL0NZQzRxeU5LckI2ckFBcTdLVVFlR2tYY2FrNG4yWEd1Q2lt?=
 =?utf-8?B?K0xoTzlEYUxwMDdDbmw1M2FFZGp2aldxRG9VbWxGU3NvUGFaV3BWeDdnZUZL?=
 =?utf-8?B?TW0wNzA5TVRIMlRxM1J2d05kNEFDaW5FYkQ2dHd4V04rQ0lpa0RWZVJVUnJI?=
 =?utf-8?B?TzRrY2tYRmh1YWR5WVdKQ0J4cmI3NndnZDVRR2ZBT1dWVmdUZDN2RlhoVzVk?=
 =?utf-8?B?RUhEd2E5QWlSLzVUMmR3S05ZV1lTUE4ySjVHWWE5RFhCdkRKbWZlYjJTaFdo?=
 =?utf-8?B?b3hVei80VWs4NG1jTERBTHJvMFh3bVV6NE1oUXBRV1pOR1B0V0tqcTgycGdJ?=
 =?utf-8?B?RlBPU3hEcjdMTm84WWtMRTBXak80Vm9EbitoZC96U1BlZHJLUzVRRGhMV1Zk?=
 =?utf-8?B?SzhUN1ZjYW1QaS95UWo3dFRnOU45U3JZTHBhWStpb3drNWFvQnAyNWV5TG92?=
 =?utf-8?B?eWUydVBnYVRqNE9wOC9HZ1F2MEVpVVJrVGdPUFNuSEtFc0s0U3lYN2dRTitr?=
 =?utf-8?B?WGh2MGwwMW1kQWJLV08zMHRTaENHTSsveXo1OVpIY1VsbWFXQmlCLzFrckNV?=
 =?utf-8?B?dnpISFZTNFV2WHJQYW9DZ1Bob2lLaTREREJPS3dVK0FaZEs2bVFaRmd3RnNT?=
 =?utf-8?B?Vm9iY3NJOFBVMGpaTElJY1ZGVHRzWEVPUWlHVEFsVzJBMi9WSXpLREFZV3hr?=
 =?utf-8?B?QU1MRC9DUk5ROHdzSU9TOFhYc0MzeTdySVlhZmRoRHl4RHFkNXM0a2FmM2l5?=
 =?utf-8?B?UDk3b2dpOHpsejBVbE9uS3NUS2pmdWtxbHJ5ZDR1Lzc5bWo3NnIwWS9MMGdp?=
 =?utf-8?B?ZkV4djlkdzRnb2FSVXBseWJrTWFQUW54VXlORTJsTzFVMG84cVVPTU5kd1k4?=
 =?utf-8?B?RDBSTVFXUlV1bUVHM1FHczdFcUJrYy9uQ2tPeS9aSVA1cUM4clhZTUtWRUl0?=
 =?utf-8?B?MklhY3JuZU9RR1E3eXNtVHpWSndaaFpjczh3RzBWN2djdmltdk5EbHhmcFVi?=
 =?utf-8?B?eEZkT01SMTRWdlU3Wjk5RUlHL3gzNFdBWkFWNXlWMENJWlQ3UkN3MmdLZG5D?=
 =?utf-8?B?WlVic0N3SldXU1BBS2RVclRmNll3OGhnT3k1b092Mm8wZVdBeWJQSUY5MU9X?=
 =?utf-8?B?akxaaGN4MjhhQW84YTNjYldiZ0JCdjhzVE8reEQyNTZZS1VCUUNFY3lYUzFx?=
 =?utf-8?B?OE90Y1AzS1lXT3Iva0dXU0FOSDBiOTdTeWQ0WndNU2xmazFCRVhhM2d4SXBw?=
 =?utf-8?B?M1NHSG41VjdOcXdmTEF6c0Jrb09DZ3J2VVhmWnJ5cFpXSFg0MWNaT25yQlhn?=
 =?utf-8?B?ZnpBRDJ0aVdIODcrOVlRTGNkUjRaK1hkZlFGQmM5cWljekFPcVJldWtzNWpy?=
 =?utf-8?B?VHlGQzNscjJvLzlqYlczNU5iZnM3MnRiMUttWUtsZFNFYmV5bVdIWHNpdWRZ?=
 =?utf-8?B?Ym5FZ0FxQjZoUnMrMXVpOEV6SlBtc1luWUtLdm11cWVOQ0N6bXVwZmlESGxq?=
 =?utf-8?B?VU5KRVQ3cXhJck1VaU14Ukl5UEE0QkNXK0wyOUxyYW1WVU5ZbU0wY29zNzN6?=
 =?utf-8?B?ZU5peDU4RmFjOGpzZmc1cDZ5SVBUcHl3VUZvZTJLRE93K3JNL3NtamlETmxT?=
 =?utf-8?B?T2J4R3hLUEM1QWViRTB5QnVTMzRsZHk5N21PcWlaMGpSa1p3ek9RdmtrS3pm?=
 =?utf-8?B?SnZPM1RqOSs4UkRaRmlPT0doRVVyRzh2NUVnTks2NEhIWWVzS3FCdlJIRXVw?=
 =?utf-8?B?am8vNldXVkYrV01wZmNtT1UycURxVmVhOW9oMUdNdEpxUktZa002VzdXa1c1?=
 =?utf-8?B?UWx2VVZhZXhob0doOGpaWDJ3MGo4cFA5Qzc0QUd3eElLRDBlMXFSL2xVMmta?=
 =?utf-8?B?dTREVlh6M2Z1OHk2RG9Ld3ljOTVPbWYyQ3VjN0sxbkhHMmF5bXhsL25xRnMv?=
 =?utf-8?Q?jAxL09XFdy3jR/n/zrgN9tqPK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723c9aa9-10df-434f-a66f-08dd151c41df
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 11:02:06.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpopsH9HHWtutlWdo4Kg3aAhUfk2Hfi58ICOq3r5Nxsw88rIaxo0DDD9XxJM7hCD4ffLWXk2WlbyEzNuN7bNlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

CgpPbiAwNS8xMi8yMDI0IDEwOjU3LCBKb24gSHVudGVyIHdyb3RlOgo+IAo+IE9uIDA0LzEyLzIw
MjQgMTg6MTgsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+PiBPbiBXZWQsIERlYyAwNCwgMjAyNCBh
dCAwNTo0NTo0M1BNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4+PiBPbiBX
ZWQsIERlYyAwNCwgMjAyNCBhdCAwNTowMjoxOVBNICswMDAwLCBKb24gSHVudGVyIHdyb3RlOgo+
Pj4+IEhpIFJ1c3NlbGwsCj4+Pj4KPj4+PiBPbiAwNC8xMi8yMDI0IDE2OjM5LCBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgRGVjIDA0LCAyMDI0IGF0IDA0OjU4OjM0
UE0gKzAxMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+Pj4+Pj4gVGhpcyBkb2Vzbid0IG1hdGNo
IHRoZSBsb2NhdGlvbiBmcm9tIGVhcmxpZXIsIGJ1dCBhdCBsZWFzdCB0aGVyZSdzCj4+Pj4+PiBz
b21ldGhpbmcgYWZvb3QgaGVyZSB0aGF0IG5lZWRzIGZpeGluZy4gSSBzdXBwb3NlIHRoaXMgY291
bGQgCj4+Pj4+PiBzaW1wbHkgYmUKPj4+Pj4+IGhpZGluZyBhbnkgc3Vic2VxdWVudCBlcnJvcnMs
IHNvIG9uY2UgdGhpcyBpcyBmaXhlZCB3ZSBtaWdodCBzZWUgCj4+Pj4+PiBvdGhlcgo+Pj4+Pj4g
c2ltaWxhciBpc3N1ZXMuCj4+Pj4+Cj4+Pj4+IFdlbGwsIGhhdmluZyBhIHF1aWNrIGxvb2sgYXQg
dGhpcywgdGhlIGZpcnN0IHRoaW5nIHdoaWNoIHN0YW5kcyBvdXQgCj4+Pj4+IGlzOgo+Pj4+Pgo+
Pj4+PiBJbiBzdG1tYWNfdHhfY2xlYW4oKSwgd2UgaGF2ZToKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobGlrZWx5KHR4X3EtPnR4X3NrYnVmZl9kbWFb
ZW50cnldLmJ1ZiAmJgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB0eF9xLT50eF9za2J1ZmZfZG1hW2VudHJ5XS5idWZfdHlwZSAh
PSAKPj4+Pj4gU1RNTUFDX1RYQlVGX1QKPj4+Pj4gX1hEUF9UWCkpIHsKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHR4X3EtPnR4X3Nr
YnVmZl9kbWFbZW50cnldLm1hcF9hc19wYWdlKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX3VubWFwX3Bh
Z2UocHJpdi0+ZGV2aWNlLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdHhfcS0gCj4+Pj4+ID50eF9za2J1ZmZfZG1hW2VudHJ5XS5idWYsCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eF9xLSAKPj4+Pj4gPnR4X3NrYnVm
Zl9kbWFbZW50cnldLmxlbiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIERNQV9UT19ERVZJQ0UpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfdW5tYXBfc2lu
Z2xlKHByaXYtPmRldmljZSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0eF9xLSAKPj4+Pj4gPnR4X3NrYnVmZl9kbWFbZW50cnldLmJ1ZiwKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eF9xLSAKPj4+Pj4g
PnR4X3NrYnVmZl9kbWFbZW50cnldLmxlbiwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBETUFfVE9fREVWSUNFKTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHhfcS0+dHhfc2tidWZmX2RtYVtl
bnRyeV0uYnVmID0gMDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdHhfcS0+dHhfc2tidWZmX2RtYVtlbnRyeV0ubGVuID0gMDsKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHhfcS0+
dHhfc2tidWZmX2RtYVtlbnRyeV0ubWFwX2FzX3BhZ2UgPSAKPj4+Pj4gZmFsc2U7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pgo+Pj4+PiBTbywgdHhfc2ti
dWZmX2RtYVtlbnRyeV0uYnVmIGlzIGV4cGVjdGVkIHRvIHBvaW50IGFwcHJvcHJpYXRlbHkgdG8g
dGhlCj4+Pj4+IERNQSByZWdpb24uCj4+Pj4+Cj4+Pj4+IE5vdyBpZiB3ZSBsb29rIGF0IHN0bW1h
Y190c29feG1pdCgpOgo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzID0gZG1hX21h
cF9zaW5nbGUocHJpdi0+ZGV2aWNlLCBza2ItPmRhdGEsIAo+Pj4+PiBza2JfaGVhZGxlbihza2Ip
LAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgRE1BX1RPX0RFVklDRSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
ZG1hX21hcHBpbmdfZXJyb3IocHJpdi0+ZGV2aWNlLCBkZXMpKQo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZG1hX21hcF9lcnI7Cj4+Pj4+Cj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAocHJpdi0+ZG1hX2NhcC5hZGRyNjQgPD0gMzIpIHsKPj4+Pj4gLi4u
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4+PiAuLi4KPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXMgKz0gcHJvdG9faGRyX2xlbjsKPj4+Pj4g
Li4uCj4+Pj4+IMKgwqDCoMKgfQo+Pj4+Pgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdHhfcS0+
dHhfc2tidWZmX2RtYVt0eF9xLT5jdXJfdHhdLmJ1ZiA9IGRlczsKPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHR4X3EtPnR4X3NrYnVmZl9kbWFbdHhfcS0+Y3VyX3R4XS5sZW4gPSBza2JfaGVhZGxl
bihza2IpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdHhfcS0+dHhfc2tidWZmX2RtYVt0eF9x
LT5jdXJfdHhdLm1hcF9hc19wYWdlID0gZmFsc2U7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0
eF9xLT50eF9za2J1ZmZfZG1hW3R4X3EtPmN1cl90eF0uYnVmX3R5cGUgPSAKPj4+Pj4gU1RNTUFD
X1RYQlVGX1RfU0tCOwo+Pj4+Pgo+Pj4+PiBUaGlzIHdpbGwgcmVzdWx0IGluIHN0bW1hY190eF9j
bGVhbigpIGNhbGxpbmcgZG1hX3VubWFwX3NpbmdsZSgpIHVzaW5nCj4+Pj4+ICJkZXMiIGFuZCAi
c2tiX2hlYWRsZW4oc2tiKSIgYXMgdGhlIGJ1ZmZlciBzdGFydCBhbmQgbGVuZ3RoLgo+Pj4+Pgo+
Pj4+PiBPbmUgb2YgdGhlIHJlcXVpcmVtZW50cyBvZiB0aGUgRE1BIG1hcHBpbmcgQVBJIGlzIHRo
YXQgdGhlIERNQSBoYW5kbGUKPj4+Pj4gcmV0dXJuZWQgYnkgdGhlIG1hcCBvcGVyYXRpb24gd2ls
bCBiZSBwYXNzZWQgaW50byB0aGUgdW5tYXAgZnVuY3Rpb24uCj4+Pj4+IE5vdCBzb21ldGhpbmcg
dGhhdCB3YXMgb2Zmc2V0LiBUaGUgbGVuZ3RoIHdpbGwgYWxzbyBiZSB0aGUgc2FtZS4KPj4+Pj4K
Pj4+Pj4gV2UgY2FuIGNsZWFybHkgc2VlIGFib3ZlIHRoYXQgdGhlcmUgaXMgYSBjYXNlIHdoZXJl
IHRoZSBETUEgaGFuZGxlIGhhcwo+Pj4+PiBiZWVuIG9mZnNldCBieSBwcm90b19oZHJfbGVuLCBh
bmQgd2hlbiB0aGlzIGlzIHNvLCB0aGUgdmFsdWUgdGhhdCBpcwo+Pj4+PiBwYXNzZWQgaW50byB0
aGUgdW5tYXAgb3BlcmF0aW9uIG5vIGxvbmdlciBtYXRjaGVzIHRoaXMgcmVxdWlyZW1lbnQuCj4+
Pj4+Cj4+Pj4+IFNvLCBhIHF1ZXN0aW9uIHRvIHRoZSByZXBvcnRlciAtIHdoYXQgaXMgdGhlIHZh
bHVlIG9mCj4+Pj4+IHByaXYtPmRtYV9jYXAuYWRkcjY0IGluIHlvdXIgZmFpbGluZyBjYXNlPyBZ
b3Ugc2hvdWxkIHNlZSB0aGUgdmFsdWUKPj4+Pj4gaW4gdGhlICJVc2luZyAlZC8lZCBiaXRzIERN
QSBob3N0L2RldmljZSB3aWR0aCIga2VybmVsIG1lc3NhZ2UuCj4+Pj4KPj4+PiBJdCBpcyAuLi4K
Pj4+Pgo+Pj4+IMKgIGR3Yy1ldGgtZHdtYWMgMjQ5MDAwMC5ldGhlcm5ldDogVXNpbmcgNDAvNDAg
Yml0cyBETUEgaG9zdC9kZXZpY2UgCj4+Pj4gd2lkdGgKPj4+Cj4+PiBTbyB5ZXMsICJkZXMiIGlz
IGJlaW5nIG9mZnNldCwgd2hpY2ggd2lsbCB1cHNldCB0aGUgdW5tYXAgb3BlcmF0aW9uLgo+Pj4g
UGxlYXNlIHRyeSB0aGUgZm9sbG93aW5nIHBhdGNoLCB0aGFua3M6Cj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi8g
Cj4+PiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+
PiBpbmRleCA5YjI2MmNkYWQ2MGIuLmM4MWVhOGNkZmU2ZSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPj4+IEBAIC00
MTkyLDggKzQxOTIsOCBAQCBzdGF0aWMgbmV0ZGV2X3R4X3Qgc3RtbWFjX3Rzb194bWl0KHN0cnVj
dCAKPj4+IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPj4+IMKgwqDCoMKg
wqAgc3RydWN0IHN0bW1hY190eHFfc3RhdHMgKnR4cV9zdGF0czsKPj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IHN0bW1hY190eF9xdWV1ZSAqdHhfcTsKPj4+IMKgwqDCoMKgwqAgdTMyIHBheV9sZW4sIG1z
cywgcXVldWU7Cj4+PiArwqDCoMKgIGRtYV9hZGRyX3QgdHNvX2RlcywgZGVzOwo+Pj4gwqDCoMKg
wqDCoCB1OCBwcm90b19oZHJfbGVuLCBoZHI7Cj4+PiAtwqDCoMKgIGRtYV9hZGRyX3QgZGVzOwo+
Pj4gwqDCoMKgwqDCoCBib29sIHNldF9pYzsKPj4+IMKgwqDCoMKgwqAgaW50IGk7Cj4+PiBAQCAt
NDI4OSwxNCArNDI4OSwxNSBAQCBzdGF0aWMgbmV0ZGV2X3R4X3Qgc3RtbWFjX3Rzb194bWl0KHN0
cnVjdCAKPj4+IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBJZiBuZWVkZWQgdGFrZSBleHRyYSBkZXNjcmlwdG9ycyB0byBmaWxs
IHRoZSByZW1haW5pbmcgCj4+PiBwYXlsb2FkICovCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdG1w
X3BheV9sZW4gPSBwYXlfbGVuIC0gVFNPX01BWF9CVUZGX1NJWkU7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgdHNvX2RlcyA9IGRlczsKPj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBzdG1tYWNfc2V0X2Rlc2NfYWRkcihwcml2LCBmaXJzdCwgZGVzKTsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB0bXBfcGF5X2xlbiA9IHBheV9sZW47Cj4+PiAtwqDCoMKgwqDCoMKgwqAg
ZGVzICs9IHByb3RvX2hkcl9sZW47Cj4+PiArwqDCoMKgwqDCoMKgwqAgdHNvX2RlcyA9IGRlcyAr
IHByb3RvX2hkcl9sZW47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGF5X2xlbiA9IDA7Cj4+PiDC
oMKgwqDCoMKgIH0KPj4+IC3CoMKgwqAgc3RtbWFjX3Rzb19hbGxvY2F0b3IocHJpdiwgZGVzLCB0
bXBfcGF5X2xlbiwgKG5mcmFncyA9PSAwKSwgcXVldWUpOwo+Pj4gK8KgwqDCoCBzdG1tYWNfdHNv
X2FsbG9jYXRvcihwcml2LCB0c29fZGVzLCB0bXBfcGF5X2xlbiwgKG5mcmFncyA9PSAwKSwgCj4+
PiBxdWV1ZSk7Cj4+PiDCoMKgwqDCoMKgIC8qIEluIGNhc2UgdHdvIG9yIG1vcmUgRE1BIHRyYW5z
bWl0IGRlc2NyaXB0b3JzIGFyZSBhbGxvY2F0ZWQgCj4+PiBmb3IgdGhpcwo+Pj4gwqDCoMKgwqDC
oMKgICogbm9uLXBhZ2VkIFNLQiBkYXRhLCB0aGUgRE1BIGJ1ZmZlciBhZGRyZXNzIHNob3VsZCBi
ZSBzYXZlZCB0bwo+Pgo+PiBJIHNlZSwgdGhhdCBtYWtlcyBzZW5zZS4gTG9va3MgbGlrZSB0aGlz
IGhhcyBiZWVuIGJyb2tlbiBmb3IgYSBmZXcgeWVhcnMKPj4gKHNpbmNlIGNvbW1pdCAzNGMxNTIw
Mjg5NmQgKCJuZXQ6IHN0bW1hYzogRml4IHRoZSBwcm9ibGVtIG9mIHRzb194bWl0IikpCj4+IGFu
ZCBGdXJvbmcncyBwYXRjaCBlbmRlZCB1cCBleHBvc2luZyBpdC4KPj4KPj4gQW55d2F5LCB0aGlz
IHNlZW1zIHRvIGZpeCBpdCBmb3IgbWUuIEkgY2FuIHVzdWFsbHkgdHJpZ2dlciB0aGUgaXNzdWUK
Pj4gd2l0aGluIG9uZSBvciB0d28gaXBlcmYgcnVucywgd2l0aCB5b3VyIHBhdGNoIEkgaGF2ZW4n
dCBzZWVuIGl0IGJyZWFrCj4+IGFmdGVyIGEgZG96ZW4gb3Igc28gcnVucy4KPj4KPj4gSXQgbWF5
IGJlIGdvb2QgdG8gaGF2ZSBKb24ncyB0ZXN0IHJlc3VsdHMgYXMgd2VsbCwgYnV0IGxvb2tzIGdv
b2Qgc28KPj4gZmFyLgo+IAo+IAo+IEkgaGF2ZSBiZWVuIHJ1bm5pbmcgdGVzdHMgb24gbXkgc2lk
ZSBhbmQgc28gZmFyIHNvIGdvb2QgdG9vLiBJIGhhdmUgbm90IAo+IHNlZW4gYW55IG1vcmUgbWFw
cGluZyBmYWlsdXJlIGNhc2VzLgo+IAo+IFJ1c3NlbGwsIGlmIHlvdSBhcmUgcGxhbm5pbmcgdG8g
c2VuZCBhIGZpeCBmb3IgdGhpcywgcGxlYXNlIGFkZCBteSAuLi4KPiAKPiBUZXN0ZWQtYnk6IEpv
biBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgoKTmV2ZXJtaW5kIEkgc2VlIEZ1cm9uZyBh
bHJlYWR5IHNlbnQgYSBmaXguCgpKb24KCi0tIApudnB1YmxpYwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
