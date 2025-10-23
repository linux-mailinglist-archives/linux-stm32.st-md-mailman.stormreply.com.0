Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E072C024C8
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 18:03:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3893EC5EC5B;
	Thu, 23 Oct 2025 16:03:44 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6437FC555B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 16:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+GNETWHhOcVN7D91sUWSDwQDOa6La2vbmcMcMl7Mt8J9tFdXCxQkC0oticHpdYhrBurn6q86H5xwIWogGBd4Khx0UQ9qQFPjFHrdiqM2t5zIySGQD0rGdeOV+0lRt7bj2If5mnho/m14pyEIA9FLAKfcg8VUNnCnlVfr82l++Z1gqKLSNKCOLUkUEBLhXA4AQWj/6ph1vtoxlvFa9Kkh85Qsz3+UyerikNH9Ir8MSPERyvjKU9DUraA7NKNKtKV5qBHALy2JeG3s34Y4OSd00r7T5tleRqAjMsJsPF80Oh+jt+V67LzvQBT+Fzay1jzESPaGFjAj6hE+UaWf8vz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiQYlWzGxAzcmDxQx21R/s857ZIvlRsCxnCwp8B5EGA=;
 b=tPXMPe9xvZNxxHZ96siw899xQbNWfUeB23TyuLW1BXA5pkeBxRWf+x9BbzxpFLLB51KZUmB3hOZFgjvdlDvFfLMuHpX/CIa5Buee7Y7CEK6FEhFOf2veIpgILS3RGVhl9ByHke2/4js8TgvTv2ZMQuRh8co/EO55Ai9MTTzO+cKggo1tU3+KJyTnN/Nr3F3NipHp1emmxYzj2CwbEnZcBqyvFj49MRZVNi5XufNiDSz5EnXN6EIelhlMFm30Tq466eON71mhzfYV4RQGJyUUijSxcgGqXx40QPHvSZNL0cmquOWC+wluMKmnKNV42nU/Tvrmdl1HlwCnxR2wz+Pv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiQYlWzGxAzcmDxQx21R/s857ZIvlRsCxnCwp8B5EGA=;
 b=UrjEPilYie9qGp/jqmGGWXmDrsP4H/8nbqb+cISOVMmPPLdQ0FkLEXnad2ClBhow1nCb3XcZTgzgaeY+ktoZC/EtbLSiC3Hc/iqDBubZeWJfqGnFPp90Cb8ShEKXk65SiXpBsrUehtEUlQ97YBtwBzQw6RZVt3IdfdbhId3gA+3x8LSL1Elyp2i0DqhhLj5F8Q3C3wpGN5QG5gvZOlEd8V0ScpXor5viaUXrBxBUvC7BqSt+vaiXqBQXGzm3Jxf54XX4BTkapMELI2y4uziuE49toRJdWuK+2DF+8Xdh/bHEMG8QUs4+LyNiXFMT/BAzwtGgA7qD25CNVOglt2T2jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CH2PR03MB5368.namprd03.prod.outlook.com (2603:10b6:610:9d::22)
 by SN7PR03MB7260.namprd03.prod.outlook.com (2603:10b6:806:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 16:03:38 +0000
Received: from CH2PR03MB5368.namprd03.prod.outlook.com
 ([fe80::ccdd:249f:7a8a:648]) by CH2PR03MB5368.namprd03.prod.outlook.com
 ([fe80::ccdd:249f:7a8a:648%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 16:03:37 +0000
Message-ID: <e24d26a4-8c3d-4673-97a7-eed23f54c08c@altera.com>
Date: Thu, 23 Oct 2025 21:33:26 +0530
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
 <83ffc316-6711-4ae4-ad10-917f678de331@linux.dev>
 <0d3a8abe-773c-4859-9d6f-d08c118ce610@altera.com>
 <aPoKiREmRurn-Mle@shell.armlinux.org.uk>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <aPoKiREmRurn-Mle@shell.armlinux.org.uk>
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To CH2PR03MB5368.namprd03.prod.outlook.com
 (2603:10b6:610:9d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR03MB5368:EE_|SN7PR03MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab7bfe4-d2c7-424f-fbd0-08de124db9bd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzVoSUgwSnVGMXdGZlNmODVXWnFINEFDTjZqNkE4TjY4Y3VHRmt4RStpbG95?=
 =?utf-8?B?VVovMGFFYWZRUXlZai9xdlYyV2ZWYVYxQjhlK1hyODhKUVk0YzZ3SURuTjZD?=
 =?utf-8?B?ZzF0Z2gzUDk0cVk0YUFERTRIRW8zcFRaTTZRcmNrTDNsT2t0TnRRa1JVVDly?=
 =?utf-8?B?L0R6V0ZxbXd4Ris3aDNHNGpBVHNLTkVJZHlSemhvSXVUQ2ZTNjhnVmRFY1FU?=
 =?utf-8?B?eVFTenpmWXRCZ3phVGtFaTdDVTNVNnBjQUtRMEZ0TlJicWo2RCs4dXRQY01L?=
 =?utf-8?B?dlo1dDN1RVRoRWkwVkMzdENNUWtyQ3hZTVNKNTBHK0lVZjJWZUJ5TlR2VkxT?=
 =?utf-8?B?dFhlQlR2ZFdIMExBcHMwTWQ0dTZOZ0dkdWs4cVpxSlRRQStOM2o0SkttNGFN?=
 =?utf-8?B?c1BKaVd4VmJBV0ZUQW9GNXR4MTVJY2dFOVUrcmo1VXN5cWIyMzBjRklML2JP?=
 =?utf-8?B?N3l4RjU4ZnFndTk5dTNFdHgyYTY4di9naUxyemdpSFRRZnZQT1padnNtTDJR?=
 =?utf-8?B?TFlXa0J5T3JMQ1dCdU5VbzNqVEhFd3NQbThFNnNKaXltUHJsREZiVWFld3Yx?=
 =?utf-8?B?N2UrWXorbEtKTnZ4Mk5ZUlRDaTd4S0lETzltZEs0TldvaHZ2L1ZCcWRZekc4?=
 =?utf-8?B?OWo1a2NjMmhjMmxiY0V2NitKY3ZFeVBIaERGU2twZXkvb25UM1hBZklFUUdC?=
 =?utf-8?B?L3RoQmNHZmc2eXlTejkvTUwwT05oeGxhVUswdFpuUmJJN2c1WTM5ZTh6RlRl?=
 =?utf-8?B?MVJyNTdXUmpGMk5saXVSUFpsY3VsZXUxdkRPTVovWElnS2hHS0I5WEZKeE1s?=
 =?utf-8?B?RHZPVW5JSzNVS1Q5aUUzNHpZK3hxOXAxNWwyR3h1RDRTbzMybVRDVTFIZGpx?=
 =?utf-8?B?NGxCazBKQUJEa2pMclgyNUtkSUg2b1lzVVEwTWdxaUF1VjRJSzlVZjU4NHVa?=
 =?utf-8?B?SmZsTGpKOWVuUjhhWVc5ejhETnRsV2l2QzZtTGxDbmpaeld2NjNab0k0QU1I?=
 =?utf-8?B?TFJLVHRra0UvR0RRY3E0MndCeGp4RFZtR2cydWhJVUphVlJ0OEFkcnNWL3RT?=
 =?utf-8?B?TUlBSkVXNitkVmlqTlNScnZSd1FKdlBqRWx1ZUx6NTNoQS9VaFhnbzJBa2dX?=
 =?utf-8?B?WWg1aDlSOHczM2JQWmJ4Wit6cEdLSkJLMkJsNHoxY2JteEFucndGM3VMcEpH?=
 =?utf-8?B?QUlyVWs5aithRGZFZ2hEb3VnbVZUdkptWnhsYXVPUVd3R2paZ29HTzZLbFZE?=
 =?utf-8?B?TUZ3aDRPMWNuaXArQmgwK3dpdE9wWTBmMUZ1cUdQRHdybnI3NkN5WmxFUW5t?=
 =?utf-8?B?Wm1xa2ZtRjFkN21hOTl6UTN1WW1XUDE1K1V0U3h2M2FVdWttdThZRk9YVjhW?=
 =?utf-8?B?MThNRERxTmRJRlFOVU5hTmdYaDdnZVBNVko5UkRCeHo1TFdsVC9DV1BHb0Z4?=
 =?utf-8?B?Rk9LR0ZqWmJKc09qcEw0V0ZoMWJmNWsrcWlGNkxqaW1YQjVSR1dWeVdORncx?=
 =?utf-8?B?eXNkL2ZTVmIyL1hqMzhMaURROSt3T0NldkE1V0g2OXhVVXhBVFlkTU12RjlE?=
 =?utf-8?B?a1JJdzJZQU9RSnRGNjhEbk5hNW8rWWQ2TUF2eTVMeHBPdUdYQjBQbENjRGg1?=
 =?utf-8?B?eHREMzd1dktRd3JVb3lXSWV3TFZVWGFxaSt0U1ZkbGxwcDJZMFBDTG9nRUZR?=
 =?utf-8?B?a0VjbHpUVHJlUWFCTlAxT2hIcUgvYzBLMDJUMFZmbFFmS28vRXZ3WlloUWJu?=
 =?utf-8?B?UVZXdWc1T0piSUd1dXpkWlJJRjU3YmhqTFpaUVZwTXN6OXJjWlExQnp1bG16?=
 =?utf-8?B?cmhkaUNnZ2M1L0Y4SjBCQlNubVdpYUhqSytyYXJtOUdYeUJMNW4zY2d4YmlG?=
 =?utf-8?B?ek9rT0NUMUs2NlovSGZHTHlIUVZBRVlPeUFtS0RvaXlYOVdmaTArS3lkVjgx?=
 =?utf-8?Q?lUU10KLEahlwake+fyyoqT6OXRb+mH5X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR03MB5368.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXMrRlBpY2k1WC9MVS80RE1oOUV4RnFGRHJzOTlXVVd4V1JtWk9GNWhQeTMv?=
 =?utf-8?B?NDJJZzYvanlZR01vbk1ndzc5d1cvRk5pMnZmWllWdEtBV3g3Q2QrRS9Od3E5?=
 =?utf-8?B?TnptK0hTWUkzai82UlZIMGtHWkVkb1dNTDNpYml4WmpMRnliMVNVek1OZ2Nh?=
 =?utf-8?B?K2pJdVNJQys1cnpmWFRVellBUXhyZmtzNkd6NHdSanl3TUkweXBBSzF1eFZp?=
 =?utf-8?B?K1ZGMXdocUNiUFpib1ZQRzAweUg3L1plMUw3b2xrakRVaytTOFJDdW94OENM?=
 =?utf-8?B?NDBqREFFS3Z2UjN3VkJWd091WGN1ZVcvZkl5TWhFcGpjRXhsSUJBa2VaWUhz?=
 =?utf-8?B?VmN3OVd2UnFuR01uN3UwcFZEOTFWTGNJNC9nK2IySW5zTjFrc203aG9maE5Q?=
 =?utf-8?B?NTNRRWlRSm1GRkVoUU1COW5SWFhseCtFS05VaTZlUlh2d3E5UDFzTFJLNUph?=
 =?utf-8?B?UjI0bTJWa3Z6NlFWR0NON3pGa1FqRkMzSVpGeEx4WUZ2K0Y4dE5RbkxVT1NW?=
 =?utf-8?B?STBjRHU4WE5LaHBHOGlHWXNTVW5EMWVpZ1lkdG9GVVNzS0ljdm5qa1RNTkxM?=
 =?utf-8?B?UmpjOTdMdmxTSVB3Wk5BRStOSGFvaDFOaUVicEZuS1NWbVYvcXdYSSt4Zlkz?=
 =?utf-8?B?SWxJM3BnSEVhME9sNVdGM1FHR2tEcGIreVNyWWRRdHVwWU92UXpHaVBobTVu?=
 =?utf-8?B?cmxROGxIWEpWSTZPYloweW10RmlpRW5vUnUxZVRGVUFTRk9xUnZ5MlgyM3Fz?=
 =?utf-8?B?V2NNOEw1U1VPUTRmOUdXdCtIcS9UZTdVRngySCtYTGF2WHFuZVJjS09KRGJk?=
 =?utf-8?B?OEJVUERvTWVvWmdvMnlEa1BmM1NSOWkyeHV3S0xOM0pXZHBGaGlkdGQvZUla?=
 =?utf-8?B?aVpNbXBNSHFuUWNiNEMyMm5iT0NvNVpWd3FnVVo4ZUNEQXlab012QmpYY3dL?=
 =?utf-8?B?WEc0ZWkvV1crZjh3ajI0aHNCblp2NFg4STREamJoK1hvTWJJTHZyNW5iM3h5?=
 =?utf-8?B?a0FHZmd3bmtxblV0TTlaWGx0ek1rdWlYR2dyclpYQjV6bVZJUTRONEQvMkxn?=
 =?utf-8?B?T2FsTlpPTC9aeEFUOWRrV0wvaGFyOG0wMlg5VFVSWnFDcTZ3VGdSNVd0dmNM?=
 =?utf-8?B?V2tGK1k2QjNrcWg5L2lRMFlXaVZGTVBhM1RMSExOaSsxL0M4ZFg5dU1SSkdh?=
 =?utf-8?B?UDF6ekMwd3crY1hEZG4xUlQwRkd4ajJJQ0JCMm1VSUlreDYxSkFEcS9iZ1NN?=
 =?utf-8?B?L1NjTmxnRnVVZ2V4Vmh2cERKbmNLclZmNWNlSzZ0TzJWQWg3R01rSDVzVVRk?=
 =?utf-8?B?VGVjdndBVVFQSHlMS2pvclNnTXE3cENpcVZnTUJyeFBna21LblBvYWd5VlFz?=
 =?utf-8?B?d0d1bkZ0VFBMelU1Z3hWRTBHdzdrYitSU2JRRjZITmpPR1VndEhKNTNHNE5p?=
 =?utf-8?B?MldweElOYmFveWhZL1g3emhGYnozMWlwdDE5dTZKdXBEcjZnOFhFSnR0dnV1?=
 =?utf-8?B?clg3dllWaElHVmpET3NJYnNWL1d2UU9FeG5Uc3MwTHJ3UmNwZC9lWDRXbDl1?=
 =?utf-8?B?SGxRYXhZT2RQWGVXSmlEVlJPUG9qajJocUU2YXRJWEEveENwdXdYK1lCL05j?=
 =?utf-8?B?aXNnK2hYajJJSldLamlMNU91cEJPYkk0REc2VzJiSFV6MFc0eGdDZi9JK3Y5?=
 =?utf-8?B?UlA1MVJvWGpnL0NSbHE5QUFyV0hpNmhxUmdCa0pZL0ZVcTVIQUREblQ3UERm?=
 =?utf-8?B?R09PWDJGS3dkVXFGaFJsQ3lseGdqTkR3ZVh0M05XZHN5V2pQdGZ0RnE2Zm96?=
 =?utf-8?B?SGd4dW1CK0hEZ1NnR0g0aW8wRGxDN2tLTEd6OHZyYU5zZkY1UGtidnVSMzZE?=
 =?utf-8?B?QnFyTnBOYTExaktFM1RtTFJpQ25hYnJxN25IZzZ4bTRGa3JWd04yenEzWU9R?=
 =?utf-8?B?NVh0TEcyRVpKcjVBMmc4TWFaTFpZaWh1aU9aWlh5MXJ5UmpZOHMwZE5uY0VW?=
 =?utf-8?B?a1ZHanhxT3hDR1BOTnFhbzdiZ3R5cVcxUHp3UFZLeTA5UmhaNmdTMEpaT0do?=
 =?utf-8?B?SXB5eGZWTTgzbk15QndUVzZ1Y2Q1S2FqQWoyeEc5OGc4SEx3b2k5Y2NhQVRx?=
 =?utf-8?B?TnJEdW9EWXdtWmdVemZSU093bU9ickIxSEhvSUk1T0RIZzd6R1RCK2lzVGxm?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab7bfe4-d2c7-424f-fbd0-08de124db9bd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 16:03:37.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A86lRv6R1woUj9opZE/vWWX1jmoO+XrN4xKs4MRXfrgd24cN0bFwl8Y0+l+fFPNLILPBd3jc3+bRXjF9CP7Py4HzWcfq7g/GG1fHbQyKqTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7260
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN
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

SGkgUnVzc2VsbCwKCk9uIDEwLzIzLzIwMjUgNDoyOSBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUp
IHdyb3RlOgo+IE9uIFNhdCwgT2N0IDE4LCAyMDI1IGF0IDA3OjIwOjAzQU0gKzA1MzAsIEcgVGhv
bWFzLCBSb2hhbiB3cm90ZToKPj4gSGkgVmFkaW0sCj4+Cj4+IE9uIDEwLzE3LzIwMjUgNTo1MSBQ
TSwgVmFkaW0gRmVkb3JlbmtvIHdyb3RlOgo+Pj4gT24gMTcvMTAvMjAyNSAwODozNiwgRyBUaG9t
YXMsIFJvaGFuIHdyb3RlOgo+Pj4+IEhpIEFsbCwKPj4+Pgo+Pj4+IE9uIDEwLzE3LzIwMjUgMTE6
NDEgQU0sIFJvaGFuIEcgVGhvbWFzIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+Pj4gK8KgwqDCoCBz
ZHVfbGVuID0gc2tiLT5sZW47Cj4+Pj4+ICDCoMKgwqDCoMKgIC8qIENoZWNrIGlmIFZMQU4gY2Fu
IGJlIGluc2VydGVkIGJ5IEhXICovCj4+Pj4+ICDCoMKgwqDCoMKgIGhhc192bGFuID0gc3RtbWFj
X3ZsYW5faW5zZXJ0KHByaXYsIHNrYiwgdHhfcSk7Cj4+Pj4+ICvCoMKgwqAgaWYgKGhhc192bGFu
KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2R1X2xlbiArPSBWTEFOX0hMRU47Cj4+Pj4+ICsKPj4+
Pj4gK8KgwqDCoCBpZiAocHJpdi0+ZXN0ICYmIHByaXYtPmVzdC0+ZW5hYmxlICYmCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBwcml2LT5lc3QtPm1heF9zZHVbcXVldWVdICYmCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBza2ItPmxlbiA+IHByaXYtPmVzdC0+bWF4X3NkdVtxdWV1ZV0pewo+Pj4+Cj4+Pj4g
SSBqdXN0IG5vdGljZWQgYW4gaXNzdWUgd2l0aCB0aGUgcmV3b3JrZWQgZml4IGFmdGVyIHNlbmRp
bmcgdGhlIHBhdGNoLgo+Pj4+IFRoZSBjb25kaXRpb24gc2hvdWxkIGJlOiBzZHVfbGVuID4gcHJp
di0+ZXN0LT5tYXhfc2R1W3F1ZXVlXQo+Pj4+Cj4+Pj4gSeKAmWxsIHNlbmQgYSBjb3JyZWN0ZWQg
dmVyc2lvbiwgYW5kIHdpbGwgd2FpdCBmb3IgYW55IGFkZGl0aW9uYWwgY29tbWVudHMKPj4+PiBp
biB0aGUgbWVhbnRpbWUuCj4+Pgo+Pj4gV2VsbCwgZXZlbiB0aG91Z2ggaXQncyBhIGNvcHkgb2Yg
b3JpZ2luYWwgY29kZSwgaXQgd291bGQgYmUgZ29vZCB0bwo+Pj4gaW1wcm92ZSBzb21lIGZvcm1h
dHRpbmcgYW5kIGFkZCBhIHNwYWNlIGF0IHRoZSBlbmQgb2YgaWYgc3RhdGVtZW50IHRvCj4+PiBt
YWtlIGl0IGxvb2sgbGlrZSAnaWYgKCkgeyc+Cj4+Cj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhp
cyBvdXQuIEknbGwgZml4IHRoZSBmb3JtYXR0aW5nIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gCj4g
SSBzdWdnZXN0Ogo+IAo+IEZpcnN0IHBhdGNoIC0gZml4IGZvcm1hdHRpbmcuCj4gU2Vjb25kIHBh
dGNoIC0gbW92ZSB0aGUgY29kZS4KPiAKPiBXZSBoYXZlIGEgZ2VuZXJhbCBydWxlIHRoYXQgd2hl
biBjb2RlIGlzIG1vdmVkLCBpdCBzaG91bGQgYmUgbW92ZWQgd2l0aAo+IG5vIGNoYW5nZXMgLSBv
dGhlcndpc2UgaXQgbWFrZXMgcmV2aWV3IG11Y2ggaGFyZGVyLgo+IAoKVGhhbmtzIGZvciB0aGUg
c3VnZ2VzdGlvbi4gV2lsbCBkbyBpdCBpbiBzZXBhcmF0ZSBwYXRjaGVzLgoKPiBUaGFua3MuCj4g
CgpCZXN0IFJlZ2FyZHMsClJvaGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
