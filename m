Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5CA44273
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 15:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6992CC78F9B;
	Tue, 25 Feb 2025 14:21:25 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2BF8C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 14:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSQm8e2lbdLMG0W8vrdE86J0dyAxgRDdVzvKfJZfWpYueQQoeQ3DWSoOfavQk7pU+KkPE78IkxSPF3tpbgSwafgL9rcBZApfYgFN3QIWZvGWRg9OMmN9nHKGEQeXY1+R8J+RRS6ztXD+tLKRXIT9BdOKnPs2tEIioUKrtzv1MPSosZ4/abn9gCrq9vrk+kBAQD/R03aKfp7E2Rkn7F+m4+ZF6uRbb7Ei01kTP4BeVP/nNnbL0FIlRDSb5aiwCjlaQ8/8G2v05KwUwwyHZV+Yzi6r9d/JmdHScWQdRG6imOb6COzqEgDZrY2D7beYTIPC7RcgStlGvzu7rXCFKkx1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3cl0mYF1Tw6ztEBysd6MbBFFKn2Jv3whEDlQfgPMs8=;
 b=johJMWE2YgzLh1OuuyVmHGnUfMhERuhoRrW3VY0KM8OdFQBJc7gxIu0bM+J9+R7q/W77xtCDzxiNDSLt7XSpjuOahjZp8LbZFHd5DiMevbFTSr49VoopXewKgCAeb9yYk3EEcryMOJ62a3gKjoBcAIK5/c/yZ1P/V6L2c/S9w9KpdJRzqQZtUqcC2/H/Aq901hUSVaj/LLzFbl/Sj6Jm7PAAGVP2NATJVDbYVT23LXUf6sTEmmwOEuwK3gvnGwil0ewpnYN7QJr5vWPbP10oMd3esuLe8ypt+YNdd+cwR2qok8cQSZzEii88S571JjdYtLrRSDAwb+lCCOCZK+kigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3cl0mYF1Tw6ztEBysd6MbBFFKn2Jv3whEDlQfgPMs8=;
 b=oCx2znV3B+ntfV8g+smLf9OoL6P9iX99peH0HfcylNAg2EbEyJrW5AGjU/vncG4JboDuSubg2CTARmCSBWaB5qvDOz3Yji4/st4n9WjAO+CsvJlfCBA9LLNOinqxybFlhJ2Mp2+nARZfDBW988yQOoIUujRx1fsp+MocHuse02Kdhqu4zNe1MKaggnRhOvXt5iZbmRsMHNqmxc9eBza0UTqUoF0t9xczRIm3dZ2/RKsgVJ8wrFrmVexm5tb2/3/sGCf3mS5nkW2hFDu8OGI8ROsX9y9FHXzXJwz2VduAM4fgYq+465ZqbzAY8ly6KbmuIQWeu8+kZf/RfHTeGtypzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Tue, 25 Feb
 2025 14:21:16 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:21:16 +0000
Message-ID: <31731125-ab8f-48d9-bd6f-431d49431957@nvidia.com>
Date: Tue, 25 Feb 2025 14:21:01 +0000
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <6ab08068-7d70-4616-8e88-b6915cbf7b1d@nvidia.com>
 <Z63Zbaf_4Rt57sox@shell.armlinux.org.uk>
 <Z63e-aFlvKMfqNBj@shell.armlinux.org.uk>
 <05987b45-94b9-4744-a90d-9812cf3566d9@nvidia.com>
 <Z68nSJqVxcnCc1YB@shell.armlinux.org.uk>
 <86fae995-1700-420b-8d84-33ab1e1f6353@nvidia.com>
 <Z7X6Z8yLMsQ1wa2D@shell.armlinux.org.uk>
 <203871c2-c673-4a98-a0a3-299d1cf71cf0@nvidia.com>
 <Z7YtWmkVl0rWFvQO@shell.armlinux.org.uk>
 <fd4af708-0c92-4295-9801-bf53db3a16cc@nvidia.com>
 <Z7ZF0dA4-jwU7O2E@shell.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <Z7ZF0dA4-jwU7O2E@shell.armlinux.org.uk>
X-ClientProxiedBy: CWLP123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:59::27) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e70885-0438-43d3-3cda-08dd55a7aa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG9Rb2c0dWE5WkJGYlREQUdNSDVOR0dZMEVFemdZbm1TT2RUdTczNkN1ZGN0?=
 =?utf-8?B?a0wwN3kreFo4Y2xJUFViMS9Xdk5kYkh0MW1oazhpdTNYbUN3Qjc5Sk9NamVJ?=
 =?utf-8?B?UmRLUjJGOGlqWitxeVV3VnZNNzk3bnFXNzhHZDJud294Nk9xMlArNXhtb3lE?=
 =?utf-8?B?ZUlqWXdKRGw2aGNsckUzSU5XSUcxSjFMd3BRTWV0MW4yektBNWN2dHVSdDUz?=
 =?utf-8?B?TjlxSkxkMDVMVWwyL3lNcjBqVnIxM29hOWVFcWtweVVjaDV0RFNCRkRLMHNj?=
 =?utf-8?B?MWw2RVJVTEVyLzlkcndHRUN6Rk9FbEpVNWE1TjlncTVOVGlIYVRzQWh1bm1u?=
 =?utf-8?B?T2svd2dzdmdtV3ptK1lEZnduc1pLTHY1dU9neVhsVlJ1YXhxMnFRdDM2b1RX?=
 =?utf-8?B?TythRUtYOUZndGl6dlR3NXRHc1NxY1F2WmVJU1dJbGozRWUxOUtWcWMxWnRX?=
 =?utf-8?B?L296UkJCcUlTb0FzejdydjhDcDhRMnJVVXFEYTI4TU13eTB3L05WdHNyT3dU?=
 =?utf-8?B?MlFZUHZZZXdZd20vNlY2b0VHM3dvd1cva1dGL2VWN1IyaGlXSXQ1RkorL2sx?=
 =?utf-8?B?WDFsNFZaUVNDWUw0MW5RRFhBYXdBR2lPVDJHOW51YkdsWDFveEsyU1BXY1la?=
 =?utf-8?B?ZFhHNFVWRHVCRlRrUHJ1ME5GUE8ranpQTGtOWnVqVzkwd2hYU2tWVXpBSW0w?=
 =?utf-8?B?SWxXcWNGTnlMN0VGblQyR0RKTHNubmVDdnMyZmFaK01WOFEybHlDRzNwVjAw?=
 =?utf-8?B?L3JWV09KbTVEMmlEWXRSaHgwWDhhcmh6S1dyRE1pUWQ5dmRmYVpqYm9obGds?=
 =?utf-8?B?aE9nN3YzZ0wyWGx6VGZ1QjdPMkxhNmtmV0FKM2RMZ0NOOXEvaGhYaHNEU2Iy?=
 =?utf-8?B?YVI4cjQ2bktPRk0rKzN3dS9PRE9uNFVITG1kcEsvTUdKYTBvYWY5c0RXLzFX?=
 =?utf-8?B?NUw0TWR2Z21qTFdVYVU4Q0F3bWUrVUc4aGJQbU16WFN0MjZtR0oxTEJQakRU?=
 =?utf-8?B?UHJCOFRvU1RJd01tUmdLeDZNZHIxRDVFNVd4eTUrZXI2QVMzckYyeHhON3R6?=
 =?utf-8?B?TkVjR1U2ay85aEdkaGtuNjNuc1IzTm9ramRlaS9wVHBLbVA3NDlvRWRLWll5?=
 =?utf-8?B?alpmdk04VnBCY01wMmlMQVBpL1Q2WHVTNjcyRXJKYVdaQXVoTzVYRWk3RS9B?=
 =?utf-8?B?elZaNXRuVVRWU3BqdUJqLzhYdlNnMWVVbGwwVVVkVlpPNG82QVJISFlNU2Ew?=
 =?utf-8?B?T002SGUyNEgyd3BnbUc2dkxJRlhIaVJXMmtLMERyS2FsZDhsQmMrYXd2dDFj?=
 =?utf-8?B?N3FTd1hKQys1eTdBa1dEeXptN0cvY1lsZUdrVVZrYXNFNjZ6SndORDVVRGV6?=
 =?utf-8?B?eXYxOUppUGVQN1hGQlR2YXdyLzJtVFYzb1ZyVlNGQjVWZ1ZQWG9wc3JNMDZa?=
 =?utf-8?B?U0NJQTNiNnVzRGs0NkZhSGFPMGpLdForRXc4emRpOWdFSmtnRWZtZ3F3Q1p1?=
 =?utf-8?B?a3lWVlhIbElGMGVwL2VGSm9oditxZkE3OVlvVXZvNG40UjlxQmJyVFJCOWxo?=
 =?utf-8?B?cGdLT21ZQ2pzYXZkd1NkVDQxeVhhYVBVcGtncEJRNm0vYXBjSlN4bk9IWUQ3?=
 =?utf-8?B?VzVxMXdjR25JTnRHM0tRY0ZMNlBjbkl0bzgxWDlVOXQzMyttb1IzaERHbUg0?=
 =?utf-8?B?M09jTSt6R0Q4TzdiMXAzZ3MxWHR6SzZ1bFFqUWNnV3JSdTVWUWFmM05jQXZp?=
 =?utf-8?B?N0lQT250WGRNTkQ2Z0pVeFNJUC9IbU1GK2pEZittUW9mNlRSRkUyWGpDc2Y1?=
 =?utf-8?B?aHo0c0wvSkxiZ2lHNnZFODJnR0dTeU1Fb3RHU1VLaHU5aEU4NWNieHVyMmI5?=
 =?utf-8?Q?CXulxPokJ/+jl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RSWkFjR3N0aXMxemhkZlQwS25Kclg4S2JzSjNMd2JLYmNiSDRUeW9KTHhS?=
 =?utf-8?B?NXhIbmtmMUR5MEhNYmxuY3dMUkFCZG1GRzZRa29DMWliVDBpR25zelBOMENi?=
 =?utf-8?B?eVN6L3B2dzVyM1RPUWIxY1pNSG56TmtMSEM3WFJHMm5BRXB2emlROUtOSnVk?=
 =?utf-8?B?WVRmVWc2R3ZvS01QVUMrSjFWMHVCcjNqRC9uYytQRC9QMWRNT0h1aWpNcHk4?=
 =?utf-8?B?TUZOQThpRXZzc1o4WlBSY09sWmJvM25WR1ludVZrZmFxamlzQ3dWQUxXaTZJ?=
 =?utf-8?B?VFZXSG4wS0NGS0wzcGhzeDRsbG5xdng2SVh0cEJ6cTZSeXpzdlp4NmNrbTUx?=
 =?utf-8?B?VVNUeGlpYjZTUXhrYnFQVTlZR3g5KzlCOFgvSmpmWml0RmZXS0pWQ1FWYitN?=
 =?utf-8?B?NlB6bFptMXd5bVlkejFLV0RhS2R5emQ3c0pERVpKSE05aWNPekR0SGhJdGZQ?=
 =?utf-8?B?TlhYOEVoNnVlM0xUdXZzYWlEU00vMDFJOTd4ZURLMmFyTUZpY2RaNHlmZkRQ?=
 =?utf-8?B?c09kS2czZE5rbjNhNGZOaEx6Vk5VUmJWY1A5bnQvRzhVUDlpSFZ5dUROVURH?=
 =?utf-8?B?cTZCNHFneVdrdmZFVTlSSjhLSEsveUdpQWEzNlB1QmxrWmZyb0syRDgvQ3o1?=
 =?utf-8?B?REtnRVlMQ1RUbmdueDVVZTd3bG96SEtFMHgyWW5yTjczQktzQjRvZTk1SnBK?=
 =?utf-8?B?VEhBTDVXSS9HdkZsbjBXSzAvMlVCRk5hMHp2MENGblBvaUdFSW9FWGdrK1VI?=
 =?utf-8?B?emM4MENUNXFvakZYOTlZV3FLNzZid3lBcGdRUnVwMGVmT1lxb2dQVmZyaVJ4?=
 =?utf-8?B?aG45ZnAvOHU1bjhtTjJmcEJWcHVYaUxUZEtkQlAyRmJoNkJ0VzU0LzVOU0Er?=
 =?utf-8?B?Qm94K0xCWWF3eFBEYWYyelFQMkFyK1pYa01KK25ZYTVPNmJkKzBxd3lXVWtG?=
 =?utf-8?B?RS9NV0hWZngwazVFNlI3MCtxUXNrZU90Yk83Y2VidjYxbkQ2eXYrQkVVMW8w?=
 =?utf-8?B?OVlqb1ZqZDE5dVVYY3cxSDNsaU92K2ZsNU9uRkRoQ3ZtWThXSlZXZDFQZ3B6?=
 =?utf-8?B?ZFZTVTJEMm8rZTc5cTJ0WGxXS0gzdnpPWjhOdnVnUG41TFpKVVk0bktjTm8w?=
 =?utf-8?B?ZXMyWk5FNC9Rb3ROZ1dHTEVtZ2tSUU9kRFQzQmlhTWdKc1FKSnVEQlpKSlhD?=
 =?utf-8?B?aDZqcW5UNHpqZVd5ZSs0RVo4RnBOblFmWFNRVEt2eC9nM1pveElONG1CWFRJ?=
 =?utf-8?B?NFcyZVFUamJISSs4OG1LUzN1MXhsMzhhQ2JFVk9CUzJRWjU2STE4aDhEcG5X?=
 =?utf-8?B?MW9LRWxDTzg3ZTBIbmovM1pCc1JOUTBXcWtaUlJ1Z2dRTXdSS3YvSURhbG85?=
 =?utf-8?B?aGxad1REY2o2cHNhNDVNY3Z6dnliYUhhR2ZtUndBTVBtT001RW1EQVp5NlIz?=
 =?utf-8?B?Tm1rczhRemc2NlRoMi9uamtlbWNTbjI4UHdoc0N4dGk2V2lPOW5PNFFuZXNY?=
 =?utf-8?B?d0hVNHQrVFdYNjFlVERpOFpSQjRRdHdDK3Avb0k3UDNVdDRFSUdSZlkwUldk?=
 =?utf-8?B?TjQxeCs4b1dqNmlGYWJuTThpWWFlS2JhRjdZbjYreENhTy91Q0RGN1o3Wis1?=
 =?utf-8?B?em45d25iSFA1YS9uaXRlVnBvcEcrMWNXL3BwY3ZPNWtvWlhyekxvS05KaVhJ?=
 =?utf-8?B?MFNkSW1xOVRodWtvMll3ZnpMTEc3Wm92M1lpd010SXM2dlloc0dYZE5VOXpk?=
 =?utf-8?B?ZC9RcHh3M3JyRVliWnlsZWdFcm1ibmdCdkNUYkI0d3E5VHM2VzhnbU5IeThU?=
 =?utf-8?B?UHg2QkxIVnljUk4wRHg1R0pFMElEZmZGMlJHQWtOWVpRcTl5Nnd5YlNxbTNF?=
 =?utf-8?B?UmVqckttTGUwQU9OTXF1VFNHd1dnTTkrUVR5RkZ1S2hjV0pTQ2hMcyttbkhk?=
 =?utf-8?B?NDZ2MjgreWN6bXZTMnBqakhPTExyLzNabU5vZ21EOVlSckZQdkpGNXlYYWFK?=
 =?utf-8?B?T2dBMENjSDNiTXJBOGVGRU5Pb0dsRmROV2hVTUdUUG5SVzJjbzlMQnJ6L1c2?=
 =?utf-8?B?aWg2Qmp3VlgvZldIUURvVDZIeDROdDYrZ1ZOODZjNVk2OGJRZUVOZnFuaW52?=
 =?utf-8?Q?+ibhw3NQYbqhnqhqVXkrT+/jO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e70885-0438-43d3-3cda-08dd55a7aa4d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:21:16.2853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaQXDQAw1pIS16uyVYZCC9x3ouzG4WxJ+kx75RY7P+g9OWpIQ1UEoWJFKuPpYQQ2aUzyzEfjMwkDU8vlsLxaTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 UNGLinuxDriver@microchip.com, Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: convert to
 phylink managed EEE support
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

Hi Russell,

On 19/02/2025 20:57, Russell King (Oracle) wrote:
> On Wed, Feb 19, 2025 at 08:05:57PM +0000, Jon Hunter wrote:
>> On 19/02/2025 19:13, Russell King (Oracle) wrote:
>>> On Wed, Feb 19, 2025 at 05:52:34PM +0000, Jon Hunter wrote:
>>>> On 19/02/2025 15:36, Russell King (Oracle) wrote:
>>>>> So clearly the phylink resolver is racing with the rest of the stmmac
>>>>> resume path - which doesn't surprise me in the least. I believe I raised
>>>>> the fact that calling phylink_resume() before the hardware was ready to
>>>>> handle link-up is a bad idea precisely because of races like this.
>>>>>
>>>>> The reason stmmac does this is because of it's quirk that it needs the
>>>>> receive clock from the PHY in order for stmmac_reset() to work.
>>>>
>>>> I do see the reset fail infrequently on previous kernels with this device
>>>> and when it does I see these messages ...
>>>>
>>>>    dwc-eth-dwmac 2490000.ethernet: Failed to reset the dma
>>>>    dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: DMA engine
>>>>     initialization failed
>>>
>>> I wonder whether it's also racing with phylib, but phylink_resume()
>>> calling phylink_start() going in to call phy_start() is all synchronous.
>>> That causes __phy_resume() to be called.
>>>
>>> Which PHY device/driver is being used?
>>
>>
>> Looks like it is this Broadcom driver ...
>>
>>   Broadcom BCM89610 stmmac-0:00: phy_eee_rx_clock_stop: clk_stop_enable 1
> 
> I don't see anything special happening in the PHY driver - it doesn't
> implement suspend/resume/config_aneg methods, so there's nothing going
> on with clocks in that driver beyond generic stuff.
> 
> So, let's try something (I haven't tested this, and its likely you
> will need to work it in to your other change.)
> 
> Essentially, this disables the receive clock stop around the reset,
> something the stmmac driver has never done in the past.
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1cbea627b216..8e975863a2e3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7926,6 +7926,8 @@ int stmmac_resume(struct device *dev)
>   	rtnl_lock();
>   	mutex_lock(&priv->lock);
>   
> +	phy_eee_rx_clock_stop(priv->dev->phydev, false);
> +
>   	stmmac_reset_queues_param(priv);
>   
>   	stmmac_free_tx_skbufs(priv);
> @@ -7937,6 +7939,9 @@ int stmmac_resume(struct device *dev)
>   
>   	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
>   
> +	phy_eee_rx_clock_stop(priv->dev->phydev,
> +			      priv->phylink_config.eee_rx_clk_stop_enable);
> +
>   	stmmac_enable_all_queues(priv);
>   	stmmac_enable_all_dma_irq(priv);
>   


Sorry for the delay, I have been testing various issues recently and 
needed a bit more time to test this.

It turns out that what I had proposed last week does not work. I believe 
that with all the various debug/instrumentation I had added, I was again 
getting lucky. So when I tested again this week on top of vanilla 
v6.14-rc2, it did not work :-(

However, what you are suggesting above, all by itself, is working. I 
have tested this on top of vanilla v6.14-rc2 and v6.14-rc4 and it is 
working reliably. I have also tested on some other boards that use the 
same stmmac driver (but use the Aquantia PHY) and I have not seen any 
issues. So this does fix the issue I am seeing.

I know we are getting quite late in the rc for v6.14, but not sure if we 
could add this as a fix?

Thanks!
Jon

-- 
nvpublic

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
