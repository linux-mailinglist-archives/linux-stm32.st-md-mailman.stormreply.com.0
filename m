Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCgZBnj8wmlXngQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 22:04:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A500D31CA82
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 22:04:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FC1CC87EC8;
	Tue, 24 Mar 2026 21:04:55 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20FEEC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 21:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhm1ggTMED5jEjbnCAo/LFzREnMRU9rSqyNqJuVYaaU+C3fhE1fRPE5E0kABrcNlOYQk7eX5CZiTarlj3V3bWmcc8XMz7a5UMbAnPQfBQXhmehlQ7GKghm+38flmmljHrjC9DpvCmuce2oOwcUgLAaChOYY3XFFdZmH1tICWmDQeHJDy0yLlWlzc/cr+6isOCodIb7O9wmrKoxzJgo642ki0yvBZ6YCoc+39Jk7wConvi13bkBpSzb0+x6g5HxB8KIZiAmDJCwJ/y2QG+GmPe0rZsxjzgw7m/5Q8sJUPECn+7yDbJqugx+9aaKOvTosQYqghQP3/GR4Qi+56eCnk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnBSK7v97b5CLLrPgOyZBfAhZjXIFld1Q7LJunoIU8s=;
 b=tMKzeGxhT8tdpZvIyIV//BXv4afc4Xe55+c7gel/7wduKQXepIuDy3l3IEC25q2VVATKAmBzbkYezCmsRVdhoat17+A/ClUf1ccPd1I+zFRJFmfPpT1o/2sarNBkPXh26GqFJWAaFD0pjqRzzfosLz6FEx6jTUk4aBihLJ26gInPCs7QxmIiYkPHfJq7tUDs9yGcOGWlEvtJueT6lrNz5EA407b6GD422L4uMX1cIcdM9An+UZo8w5WjgjWBjPTsJRxyK0MnRUdzAEsAk0/l9xSIoDBmVcXInJqkNJy97K5u/kD2etqpQ822mgvR5M1YQqz+W/ks6ELhd/taBz6e+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnBSK7v97b5CLLrPgOyZBfAhZjXIFld1Q7LJunoIU8s=;
 b=YL/N6p6wWKxbIftX08QnCglYrw1RQLn/RAayREM7nebL61q06TDi8KyiCA+0O7NA4Sewe4Rcb2QLUxb6XI5tPx8W5pDhKyHTh9lbIogI11yfnq/727INT3PJKwULIGgRVDSEqwjI7POUzIzw1vAFr4tXh541/FrKW+8aqaxnZ0jql7b2KiakfeM9SQk3/vr0UlVbOJv0cwZpfubHWFrCqLgslqOJEGmTHZFAkuT8QUmJuKJUX3WiPEy35Nzt+jO7ckOsup+pifh/oTnvCf1loDtrCdfZt2tD2eTXevzXBM7ryIhS+rw2VPNBfNyxQoVjHB58/V2Gu7cJGJU9ffnW8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 21:04:45 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 21:04:45 +0000
Message-ID: <0debe6f9-581c-4093-ae4a-9025bf1a7760@nvidia.com>
Date: Tue, 24 Mar 2026 21:04:37 +0000
User-Agent: Mozilla Thunderbird
To: Atharv Dubey <atharvd440@gmail.com>, Till Harbaum <till@harbaum.org>,
 Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jean Delvare <jdelvare@suse.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
 <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
X-ClientProxiedBy: PA7P264CA0483.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dd5e14-14ed-435a-87dc-08de89e8f9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dCrRxOp1CMBX0KRuk/p+QxXqheZAL2wfrUNtxGG9J9c3VIR0CzDRPvKH2d9XECheJaMM4iAHvOwlyV6q2dSdM1iDclqAgCQW6wa74P1IlxHcborT703UfwoUVfLIE5I4YbEYe9Wdt7lHIPv+CzLMQLdiKZ50l+ZnL+gyCKLoeVdZ+csBLu7UyUyaJcz0Vyoda4tzjvdJ2tfGaVipKOkNEvsh7OPV8+BfuWn7KzoBbXxX4wHs8wvT8sc815szHHjN2EByEhhcEovr6QQyrapZn6VjmVTi2ds0aG+KsI487F573a+g86hhGKn/AtSWfcbWZL5kQOZOSM2ICokpkJ6I/GQmzRux2ASQub5wsDy2dYbN3YSkrPkfelxAUytkUTp+ROYxlQ85oWMRd0T52pcBVvjhvYDVaDxZijHacIFBc10+yx0H5SO0AdBJYYsuZkuHgryppDXuRjdCjdtCXesTWsdfb8bmuGcWU4UVKGRuKvj533MSAsp36mQpnaC0dMIw3b2EsBIKiS77rqOpdjCurv/+aDmiQnw/PKvS9vkrlFle/0O2BcjNX7dsyFRNJZLyNvoG/dtLWUDo43FnCssoBjZjH5QUOfgglDHJ9QWIO+9bx9lfeSBlb9dvgfrpLES0hfd5e9+RWbM7rG0Ba/ND7v7jgJbbTk7qcZua/adAFzF3TqEUc0sta/PgSFX5iecySJhjXFDHT1rb95nDNKAQDIpJqRcfVj+x+JnS6H9S8e0m5P2d07MyyqYBRlV91kTQQS1+j2undXX1T3f0tSkXdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS2PR12MB9750.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDRTZkh2UWM2UFlHbkpnN1B4L2k4UVBmMk9lRHN5Zy8wWGdwRWVpbnYxNGta?=
 =?utf-8?B?Z084azlWVDF3Sy9mN2p0ekhFVmNDaEhxSy9jU29ySEZiVHVmaVlHUDJqaFR4?=
 =?utf-8?B?WWdPcWZyY1YwQkJaUWk4NFdlbnNCdTFmUFNXeitOQ3hQNUVNcG14Mit0V09I?=
 =?utf-8?B?RFZqTnVVak16UHlxYUovT1BSK2pJaXNwV3Z6Rzg5b1lYV0FWWWdIV1hrRytr?=
 =?utf-8?B?VmgvTUhFWUhDODJuSE9kWTNJVmRZWFNTUDJLT2ZodC9BUHdEYVNQOE1PT3NY?=
 =?utf-8?B?K3F1a3VFMVkzeWZ6aStzOUFXVllyK0pKdDYvWXlkc3Q1dUVOSE5VZGZ5QUZY?=
 =?utf-8?B?VVBtRVlSdmZVcFBHSG9mZTRVVis0UjdsRnAvcFUyM25qazhLVlVROWV5OEoz?=
 =?utf-8?B?eU5kR256d3pjVGNabGplZWZMT1RVUjZCWGVTUElKdktLT3k1RFlXVlZQZ2Vm?=
 =?utf-8?B?bittOEx2anJnNVo2aGhwVmthU0FKSUxESXByd2xoL3hLNTZOQVJsaFZHSVVu?=
 =?utf-8?B?NllEVndaL280WnYwbEYvMFY3KytvUHVYVWhHYlQvU1dUb1R1ZDNVSEZES095?=
 =?utf-8?B?SW5PejQwZ0lNckVVOVVpOHZqU2lDNEdvU3Q5RWtiOGY2UGtHM29yektzSllh?=
 =?utf-8?B?R2Z0V1ZtZy95SEI1WGU3eFJ2d1IwVW9QRnV3eDRndkFoY0QyRE1NMFBWUDk2?=
 =?utf-8?B?MWxVV1E2ZzBRNVpDZzRiZmh1NUZYSE9GSVdyQ200WlpZYktiUmdzMUxYaE5O?=
 =?utf-8?B?d3BUcGdacVFUR0tmT1ZTTkU5eUFBSURYd0loaEJYMTNTNklhaW5QVUZMSXpJ?=
 =?utf-8?B?ZXF5N0s1Y0VkNkJKK2hpQ091Z0loUGZSQzE4cVZnMHpXMFRvUU44YzFFMjha?=
 =?utf-8?B?S2daeWx6YW9lQTd1ZU12QzY3ZjlaZkU0bm85Yy9vYlZFQW9nVkxjN3J4MDFz?=
 =?utf-8?B?cXlmeUM4dnBicXNCSmFjK0dmTWRQOHBDa2tzU3lNSWRCQzQ1OHh2S0pmenRY?=
 =?utf-8?B?dGlGNzZPREJxWklhQ1JCaU9VOXRycHBwbFlsNDJpTDJIZFNkZGRSQ1orQ1Bi?=
 =?utf-8?B?SGc0ZGhBWjVxQWRIZ0szb0xvV1lJYkozSjNHSjZRaEtJNndoNVd3SmFnS01X?=
 =?utf-8?B?aDREMkJlUFh2VlIzWDJsL0FZS1JBcnpESnpvc2lzMkYrbVovUU51WDRWQUEy?=
 =?utf-8?B?LzQ2TXpkbzdWQ3crbGg2UC81K29xampvZWZiVlN6TjZydmlUY2xSeHhjZjlT?=
 =?utf-8?B?cEdPRDNrY1gvQzAxZ3hrRTdQR21TTWdQNHRjaGlHam42WmJhemkzUHplTFdl?=
 =?utf-8?B?am4zRnRDRHM4N1JMZzhzMnBPTXNpcHJ0OHFwcDlGa0ZHODVkQ3JKWjZBRzVm?=
 =?utf-8?B?VW94Wnl0djB0M2NZa3JmbS9BemttZ3B3K0t5VEJXVEFRU1F1RFhRUStJMFRq?=
 =?utf-8?B?N3dCUzkybjlKUWtEVU9YcXZicmowbFdxMnZVWWRUUkVEY2hzSzNKSlZjSUov?=
 =?utf-8?B?dmUvbjJpcFZlbjNxVHJXVWMwRVdZb2I4dHNMb2ZqK1VNdXZic2xMWHgyZjha?=
 =?utf-8?B?RWJHcWlHWmR0eUVkcmloUzRZdnZ1aGtnWDgzMjBhTlBwL2NGSHlRL2JNUjNy?=
 =?utf-8?B?aWtyRW5jM2s4MEdEWmozUnlrSFg5WWhQREp5Qk9wSjBUekduc0NWcHVBQ3FY?=
 =?utf-8?B?RzVFTVNJVENzM2dKNlNoT3dEeUpHSW13d0VETFRlZ2tPZENpVlhHTXpBYTZk?=
 =?utf-8?B?ZS9hUEJRbU1aaFpMV2d5S205OXRSd3FaQTR1L3RPZ1B0MWZ5bVYyVUpVOTh1?=
 =?utf-8?B?V0xKeWdod1lJNXBXNU80UHVzN080VnZzWk1lZTVycGcrQndWTG5wSGpMVGdp?=
 =?utf-8?B?UWpKT2R0Qkk1WFlyekJmQlJKQUxCTTlNVzVPc3hBMkxmRXRPWlVWMzFQL1Vh?=
 =?utf-8?B?QW1XTTNCT3JVZ2FiR2JRT0p2d2hJcDhjVTN4WUFTM25iYmh3Qjk0c0VwbUY0?=
 =?utf-8?B?bHozOHFSVVRuTzMyVGlwc1RyaFJKNmI0MFlVbU9vS2RjOWt5UTBkS1BjUjlr?=
 =?utf-8?B?UzVWMkp1VU9GaDdTVWFmaGpRN2p4UUlnaENNcGc1TldRMGhjaDBBdlgvRitM?=
 =?utf-8?B?dGwzSkorS0YycHRQaWxXRWExOW83RkZEUUNkZVY3MWlTeTFYSndKbkY1Z29J?=
 =?utf-8?B?U0R5QmZLRFFoZWcwQTcyK0xENGFDaGVXa2VUaDVCVTZwWnloT1RkbllqamNo?=
 =?utf-8?B?emhEdFNXSGRzWlJWa0w2c2tyc1daaVZWTGkxdmFtaVJRVmc0eGYxcjl3ZTMr?=
 =?utf-8?B?ajVUbktCdXVqYVJDdXhYb1VFV3dXVm1pWDBZNm96SG56c05wdHRKeWx6MjQ2?=
 =?utf-8?Q?T7ge7fgnTXjAkskx24hkx8Cb0QYis+LDI2Jr/oiN+kSeI?=
X-MS-Exchange-AntiSpam-MessageData-1: 2sXMbZGQWzeN8g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dd5e14-14ed-435a-87dc-08de89e8f9e8
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 21:04:45.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEhHCc9WDWTwX+Hr1PygNKIaYtDq60un0uUrZTKmP/+kVZfyyLVpqG/PRg8temI/BdJsCUyY85UiP8Tt0RsR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Enrico Zanda <e.zanda1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 02/10] i2c: tegra: Replace dev_err() with
 dev_err_probe() in probe function
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nvidia.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[Nvidia.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:atharvd440@gmail.com,m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jonathanh@nvidia.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com,harbaum.org,kernel.org,nvidia.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[Nvidia.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.938];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A500D31CA82
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes



On 24/03/2026 18:26, Atharv Dubey wrote:
> From: Enrico Zanda <e.zanda1@gmail.com>
> 
> This simplifies the code while improving log.
> 
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bec619b9af4e..51d15fca82fc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -575,8 +575,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
>   				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
>   	if (!dma_buf) {
> -		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
> -		err = -ENOMEM;
> +		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
> +				    "failed to allocate DMA buffer\n");

So this will never be a probe defer, so why bother?

>   		goto err_out;
>   	}
>   
> @@ -588,8 +588,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   err_out:
>   	tegra_i2c_release_dma(i2c_dev);
>   	if (err != -EPROBE_DEFER) {
> -		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
> -		dev_err(i2c_dev->dev, "falling back to PIO\n");
> +		dev_err_probe(i2c_dev->dev, err,
> +			      "cannot use DMA, falling back to PIO\n");

This is not right.

>   		return 0;
>   	}
>   
> @@ -1953,7 +1953,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
>   
>   	err = clk_enable(i2c_dev->div_clk);
>   	if (err) {
> -		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
> +		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");

We have already got the clock and so I don't think that this is needed 
either.

>   		goto unprepare_clocks;
>   	}
>   
> @@ -1979,7 +1979,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
>   
>   	ret = pm_runtime_get_sync(i2c_dev->dev);
>   	if (ret < 0)
> -		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
> +		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");

I don't think that this is needed either.

>   	else
>   		ret = tegra_i2c_init(i2c_dev);
>   
> 

-- 
nvpublic

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
