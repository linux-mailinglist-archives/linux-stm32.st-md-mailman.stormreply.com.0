Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DBBA4B46
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 18:47:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD29C3FADA;
	Fri, 26 Sep 2025 16:47:49 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011006.outbound.protection.outlook.com
 [40.93.194.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD6FBC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 16:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMw2+ihVJx8axcgEZF5McRrTHw+GA5VU0rHTdqsmnusVGwDBmOXphcoDHPCNjgkSBntv2kZOl6C1hWQKqrNP8JUsZTK4811YkUQ/SyAycedzMcWtv26IAS570Z0TnRih3G6ndW41HFNEN+JX5Urzx+PyorgvW2CLakbPxdIxyXLmAteYhS0ZKWmQ5vzIWPru8i7dw+jkOr2KkoJ4mer46f2ufmaSRNflCF4TdCkWWjfyyh2e9tMBGwhMd8s8tMAwn7jiaF3S0dmAsFCeTIN0hPF+V+opFSVs4NXCMOFNX2R7cNp0/VXqXecnUoxssVlrLivN2IJPIRvKkzaezKp0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut1Uv7e/hO5bPmHa+B9rNjrEa0C0obWESBpOH/MnuWo=;
 b=ODp5vifhL17fuLoaszTPCA6YL2DwkU+1sXVmHaY0aH5EcNkVm1HUFGGOROuJtq5UvnpQ/8to0PHf83YC/S1JJMxS+fXH19SLSvPxztcJACQaJBTVrASo+dQACKekMEwevmidu+mO3YZ/CJtL7cjLOlckQgMqyeDQSk7LyefUAdTavKkJrIBeWT7h7zfaPXaYd5kqtHd4MR/OxYxNyaFk2vx2hzhQDeRGX3huJzzgwp5L1jX3NYuXpVQjvuzORFMDaQoAd77lEmhdES/Cm6VWP1OFUPtYL+sadLBCb8WaMDrcAyNJDkUlLAdcLNLNysrkglsmed/yqqbQIJtLOPhdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut1Uv7e/hO5bPmHa+B9rNjrEa0C0obWESBpOH/MnuWo=;
 b=ASM74b+FaL2Nr/0gx0vAbw3bZYj+vw9tqatmUhqk9C/MvOR0RCGg9aCU0NeEUAHbjDuSwp1ptZIUEFh3YU82HzL3GTc2wsKkdqO0ASMg5CHnp3R0aojWrA2qffgNkGWwbyQT50RaSAAuTx2lby0I2mjEbWnvhBXli3t6AfEAewK74azIuiKSwMTESbQTw0UJq0Tzz0PUBOrx/WLdYKGrur+YqiYzdWOEdboPAfSoWhk/WxerbkcK4GBfIgxU6O754ra6uR4tmnnmFvYT5L0L39i++SGNzr3gYIHq+6fEqnfQeBbpkxWB4J0/+81OWKQji0/K+NcM/FG4j2RF5r3rBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by LV3PR03MB7753.namprd03.prod.outlook.com (2603:10b6:408:27e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 16:47:44 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 16:47:43 +0000
Message-ID: <1e82455f-5668-41fd-bebb-0a0f7139cc3f@altera.com>
Date: Fri, 26 Sep 2025 22:17:32 +0530
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org> <20250917155412.7b2af4f1@kernel.org>
 <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
 <20250924160535.12c14ae9@kernel.org>
 <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
 <20250925185230.62b4e2a5@kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250925185230.62b4e2a5@kernel.org>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|LV3PR03MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 559d73b5-1685-4ff2-7ebf-08ddfd1c69c7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXBpTEErRkZrOVp3L2wzcC9QTVFsWjJXUW1uZ0kvNTFNUk9tZ2ViY2Q5c0JU?=
 =?utf-8?B?K2pUN2xsUERTL3F4WEQ3cm9QWHBvRVh0eUY0Y2JVd3ZHaXpROU5MWGUxMkp3?=
 =?utf-8?B?Sk1LWUROVlhFWGN3WEc0YVVJS3RnVmhrT1RPbVhwbFJsREFibVFreWE0U2p1?=
 =?utf-8?B?WlhmKzhYR3hMRFB3YnpmUEhucU5HYVdNUFJNLzVJMGkvVzJ5dC94ZU4rUFp6?=
 =?utf-8?B?L2ZZY3c5bGtRQmlGNnRnamdrM0gxenY5YTRWQ1IvWlRYNCtnc1BMalFZaWVT?=
 =?utf-8?B?OWphTE5EOFFMU3RDZjh5VC9ZeGt1WEs2WmhPRldRVmFMMUREcm01UkM3azlF?=
 =?utf-8?B?SHhNNEhzUys3NlBjTGVVcFBVMTNBOFdmR0RQcVNpOFNEZUk3eDIrK21rTWlH?=
 =?utf-8?B?ZU5kREhiVFRlc00xYWl1VG1pU1NKUGc2VStLWExOdXEwT2UzT3BhRTdJYTh3?=
 =?utf-8?B?a2x4aDN1a1ljRnQ3dFU4UGdEVHdkVEVmcFV3QWtZM0lqS2ZnV1Y1U0RPZ2Vz?=
 =?utf-8?B?ejlQOFM2RzdVS0lkWFQ0WWZKRnNFSlVobStIQ2JqbW9mK3I0M1V2c2JyZGIr?=
 =?utf-8?B?VEVWVEVCT3hTaHRRTUZKTEZ6dDIvS2VCVDIzSTdndDNXKzZZQUFrWFdnUzVL?=
 =?utf-8?B?S0NDaEZlMjEybVk3U2JPSmF2NXpEOWhCSW1PUmFFd1FEMTgxdXFiTlpLZHBB?=
 =?utf-8?B?dEM2K2ZJelNjTEo0NGhjQU80dmxIUW5WNFE4VFlUL1c2OWR1M20vb0ZjVGwv?=
 =?utf-8?B?SndyNzdsUjJlbWNGZm9DMWRIbUJWb1hpcXN4TkxhUmFJenR0K1ZLbnNUQ2xr?=
 =?utf-8?B?a282WHFrNDJNR3ZObGttV1llNzE5RTJ4cUxBQnEwYlFpNm84RjhESDVRY3Fy?=
 =?utf-8?B?Ym5WcjcxaXd1TTdCOExtTmJXeTJnNzhRSzhIMXQycTNzRjZnWWtSd1IyNEVK?=
 =?utf-8?B?MjJLNEk2d2piZi9IUkd0N1ZtOTZ6SmxqQllGWDViQ0xKRUpUMTlaWGgvM0pu?=
 =?utf-8?B?WG13VytKWlF6S3U0dUlnMyt0L2V6d3hxa0NVUGZ1VkRuVENPQ3hRZG9jcU9U?=
 =?utf-8?B?dzR5bkRtbEs0Z2Z3TnRkUHJwRXIxMnArcGVNUTVqOE9sVXhoOExKNnRxeG5N?=
 =?utf-8?B?Vm9OZGVCaUxaYTZ1OVdUNmRFakliNmVuR0xSR2dUNVV1Z3lFb3BlV1A0VW5z?=
 =?utf-8?B?WGdPR3FjUnZaRlNHMVpIQkhoSy9RK2l0VUJDVGYrV3FNZDZWbzJHQ3ZQMFUr?=
 =?utf-8?B?cDYvTStVcXBVOUN3ZW1SMWw1UGtlMkxpVTY5dlVKM1pORGVISFFiNjhweG5q?=
 =?utf-8?B?cndGR2FxWTBhWmlnYWZyZ2VQeWEzWGMyaVZmV3RNVEY0TVRCVmN4SWkvMG9i?=
 =?utf-8?B?ajVINW1SSFFGeGszS2tWT2ZGdnJaUGp6L05XNXdlUUVTdGs2RXhSTHJmWTA1?=
 =?utf-8?B?Z3Q5d0N5M3ptTHAxTytXdndvbEhhTGlmd0tiRFRIclgxYjA5TXlDaXRjUVQv?=
 =?utf-8?B?SVkzcFhlL3orcnF5NmhZODZVYStZZDRLWlFDSTMyWjlIUXF1bXNBdmVFS2s3?=
 =?utf-8?B?MmVzdkRFRGkyL1hidFB2UjVOUHg1MlByUStFVHA1b0hzcmNrZlkzdWc2Zmxy?=
 =?utf-8?B?akUzb2N6Y2tRY3lnK1VHVlVIQ1pjV2FYaHIzMml2ZTUwTlJsdGgvWlYyd0RJ?=
 =?utf-8?B?SVVkMGc3eHlDRnBZdFdUcnViVUF0M1JQb1Y4WUZLYWFscUFyTWwvekFudzlN?=
 =?utf-8?B?TTFiVXhYeDNEdEJBV0xTOGVEdElCYVJ5L3NkdGFQRU5WYUtLOHJKbVp1Tklx?=
 =?utf-8?B?YVVQWjY4VzBuRkQ2cTQ1clhzWEN1d0tuS0IrTzd4ZlUzbk0yaGZOUVRFakpI?=
 =?utf-8?B?cngvb2RKQ2FOYlQrSk4wcEdURVpRY1pqZGZmcnFRT1Y0cmEvMFMwTHhZM2JS?=
 =?utf-8?Q?cU57qh3UqyFs38Sv1OxUodzeYILnUgCe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9qWUVKcWRqbFFrSkFaVGtKcVE1U1o1VUZjby9RZ1JaMnJNQ1N2TWJhT0Fj?=
 =?utf-8?B?UG9OeXBnd1dzWjl5RnpzRGxOdFAzT1R2Z1dudUxMSnJoMU1ncDRYbzVIVDlI?=
 =?utf-8?B?Nm9BZ0dJdTJsVU5VR2J2bDBVSkthT3pWWC9IOXRTR2tZNlV1eVNVS1RUMERM?=
 =?utf-8?B?a3g2WEt6c1lKNDNBdG1WSlJobk96cncxSVZiR1V2cG14Y0tZUWMyUUxSUmRW?=
 =?utf-8?B?MVhiVTBBU245NzdzNWVWMDVnMUpJNEZYejJKM0hYaW9JdXMxVzhaVkdZMU9K?=
 =?utf-8?B?K2RiQ1Q0UFlRZ1pKaXB4cEd3RXVKY0NxNEc3RHg3bThWaDhoTkVPa0hyL1Jq?=
 =?utf-8?B?UDJjNFJDSk1yWGlXNldJcEtoQTY2RzFQb2IwSTQ1YmxRayt4QzRlR2tSL0xj?=
 =?utf-8?B?OFdmMW04bHdLcUZsQjN4OVEreWFBUllYQSthZ3k2bTRTZDBpeGpmMkdoNTgx?=
 =?utf-8?B?WE84eXBlQW9WMUJBSGRDN0ZMTkdOUmQvNlZvYy9Kd2ZKU3J3dERKZVNSUGN1?=
 =?utf-8?B?OHNVcHowSnlUWHU1RGNBWWlOWU5WQTA4WFRkejdrcVJrVWtTN2RMK3hvTnh5?=
 =?utf-8?B?ZFphdGdXL1pqRk5jY2gvSTlhWmFIV1FYSXJyNFU1TVVGNzZTSFFkVTVvMCtl?=
 =?utf-8?B?a0Yxa045TDU0K2FlQm9BL2wzajg4bjhjV2plTWNGK3ZsRDJGRlVtaVNXajkr?=
 =?utf-8?B?RjVIR1RHdzZOVlN4WGdpam85OFpXSktxeEN1NU9Ca25FbG9hd1VyUGVQWWVL?=
 =?utf-8?B?Q3ViQ0lkNmlRdUZUMm9IQzNjc3RqU0Z3SFhSVExLOVZIREdtY09qOXBrNUM5?=
 =?utf-8?B?blU5MmVuN0dDMWhGQUVwekVOSWdNblAyVEFEWVE2bWE0MnlwbHRBZ3hOK25B?=
 =?utf-8?B?dGNvMFJ0cXdIZVVpTVFFVkFjWlVkTlR5alR5Nk1zSnhWd0pZWHNLcWcvUTdq?=
 =?utf-8?B?c2kwRUt6VmpQY1o5ZC81UHRWa090dmNpZ0FMc3UwOU0zZW5Wcm1ZVmhGamEy?=
 =?utf-8?B?Q2d2cnA1OVlkUFNpOU5QdnhDV2xiSmY4WTUrWkk1bjlDZnlrZmw2eUhOVjVE?=
 =?utf-8?B?L2hDSVY1RkZsWHJyd2dmMHlYc0NCZVRPdFRzWEl2UC9xVzVFS0EwblVoaVZ1?=
 =?utf-8?B?WHhCbG9TNzkxVDNsMndSbGhDdENWVk1XeGxqTDNEK05wRUJoL21tSXBDMDBN?=
 =?utf-8?B?eTRnTm4rcFpSTzltaHdTZCtxUWlkb1V0RE9RdVYxQnRENjBkQ0JlbnVrVWVW?=
 =?utf-8?B?V2hVODl6MG5rVTNWeXNXcXN4OGN2VGhnTjN5VlBHK3B4dXlMVkI0Vm1mQlor?=
 =?utf-8?B?Q0h6Vk1aZXc2NG4zYkx1QTZHNEZlNjYxYVY4ZXFnZ3l1cG9NNGd5MzFEQmJY?=
 =?utf-8?B?RlBVeWZmNElnd2pUSHNQS2taOGhjSWJXWWpFT2ZIQ1dQU3hrZHVqWXZLUFBo?=
 =?utf-8?B?QzFYZnd0dys5Q3BFL3ZZdXc3WVpNMi9FSVI5U051bk82MCtYU2NwY2M0cHM4?=
 =?utf-8?B?ZEpPZlNFMGRHUmFCbHRXTzR2WUlyYlVrV2NkTGRTRFN0cldFVGgvQk5nbm9E?=
 =?utf-8?B?cEdPcTlQa3h0eUZuQmhodDlJZWtoeXpuNzJPVUd4aVdYWHNwRmxYK29wMHBk?=
 =?utf-8?B?RW1aL3ZQM280bkMvQ2NpOGd0SDJObzlKODN2N2Q1T1JuOVRHdGJneTVPak1m?=
 =?utf-8?B?Z0RnbDF0WmhoMU9GeHo0REV4Y3FKcEpwNWFFVElZN0xMdGdtbnpxMEI3amFY?=
 =?utf-8?B?bGpJTUNydkg1eFFEWWErQ2lqYk80VEozM0w0dkR1YTNKZTBrSisyR0Y2MWFN?=
 =?utf-8?B?c2lIcktNaExWQ2dna1ovVTU4ODRRNXd6V0REMWxaQWZaSVo2MGRaalk0VG51?=
 =?utf-8?B?bG5tREsvdUs0b0daOWJYSVg5bzV3RTBINHd4SkcyVlJ1YTlFd3BsdnJEanAv?=
 =?utf-8?B?eE1LVHRad1NLTXNxSGVhYnlkWTVxNTdRdkx5SXd2alJkaTVicGRRSmtKRWs5?=
 =?utf-8?B?aWU0Q0VXZjNwVGtIaE5IaEY3Q25nYWpVOUdHTXpKZm1VRzBYdUF1b3BXVThl?=
 =?utf-8?B?ODI1NEp6ZTlaMkNaaHN4M3R2ZkxOMWlBU0pSSkpCVnBZQVlGWWEvYythM3Ri?=
 =?utf-8?B?V0Q4VEN4VjRsR1lqdG5zbm1xUzFHNGYraDREZm5IUzBKQ1B2a0VHa3AzYjd2?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559d73b5-1685-4ff2-7ebf-08ddfd1c69c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:47:43.7839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJh3r3jG6zHA5ckryx7s564Ttf/1rJTnWQHpmF9D7w19iZceN0TUwleA3FqIPg201XRY/YYu2vR4geDdV3SpjkbikAEVhKYDmOsIn8sD+jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7753
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN
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

SGkgSmFrdWIsCgpPbiA5LzI2LzIwMjUgNzoyMiBBTSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4g
T24gVGh1LCAyNSBTZXAgMjAyNSAxNjozMzoyMSArMDUzMCBHIFRob21hcywgUm9oYW4gd3JvdGU6
Cj4+IFdoaWxlIHRlc3RpbmcgODAyLjFBRCB3aXRoIFhHTUFDIGhhcmR3YXJlIHVzaW5nIGEgc2lt
cGxlIHBpbmcgdGVzdCwgSQo+PiBvYnNlcnZlZCBhbiB1bmV4cGVjdGVkIGJlaGF2aW9yOiB0aGUg
aGFyZHdhcmUgYXBwZWFycyB0byBpbnNlcnQgYW4KPj4gYWRkaXRpb25hbCA4MDIuMVEgQ1RBRyB3
aXRoIFZMQU4gSUQgMC4gRGVzcGl0ZSB0aGlzLCB0aGUgcGluZyB0ZXN0Cj4+IGZ1bmN0aW9ucyBj
b3JyZWN0bHkuCj4+Cj4+IEhlcmXigJlzIGEgc25hcHNob3QgZnJvbSB0aGUgcGNhcCBjYXB0dXJl
ZCBhdCB0aGUgcmVtb3RlIGVuZC4gT3V0ZXIgVkxBTgo+PiB0YWcgdXNlZCBpcyAxMDAgYW5kIGlu
bmVyIFZMQU4gdGFnIHVzZWQgaXMgMjAwLgo+Pgo+PiBGcmFtZSAxOiAxMTAgYnl0ZXMgb24gd2ly
ZSAoODgwIGJpdHMpLCAxMTAgYnl0ZXMgY2FwdHVyZWQgKDg4MCBiaXRzKQo+PiBFdGhlcm5ldCBJ
SSwgU3JjOiA8c3JjPiAoPHNyYz4pLCBEc3Q6IDxkc3Q+ICg8ZHN0PikKPj4gSUVFRSA4MDIuMWFk
LCBJRDogMTAwCj4+IDgwMi4xUSBWaXJ0dWFsIExBTiwgUFJJOiAwLCBERUk6IDAsIElEOiAwKHVu
ZXhwZWN0ZWQpCj4+IDgwMi4xUSBWaXJ0dWFsIExBTiwgUFJJOiAwLCBERUk6IDAsIElEOiAyMDAK
Pj4gSW50ZXJuZXQgUHJvdG9jb2wgVmVyc2lvbiA0LCBTcmM6IDE5Mi4xNjguNC4xMCwgRHN0OiAx
OTIuMTY4LjQuMTEKPj4gSW50ZXJuZXQgQ29udHJvbCBNZXNzYWdlIFByb3RvY29sCj4gCj4gQW5k
IHRoZSBwYWNrZXQgYXJyaXZlcyBhdCB0aGUgZHJpdmVyIHdpdGggb25seSB0aGUgLjFRIElEIDIw
MCBwdXNoZWQ/Cj4KClllcywgdGhlIHBhY2tldCBhcnJpdmVzIHRoZSBkcml2ZXIgd2l0aCBvbmx5
IDgwMi4xUSBJRC4KClsgIDIxMC4xOTI5MTJdIHN0bW1hY2V0aCAxMDgzMDAwMC5ldGhlcm5ldCBl
dGgwOiA+Pj4gZnJhbWUgdG8gYmUgCnRyYW5zbWl0dGVkOgpbICAyMTAuMTkyOTE3XSBsZW4gPSA0
NiBieXRlLCBidWYgYWRkcjogMHgwMDAwMDAwMDY3Yzc4MjIyClsgIDIxMC4xOTI5MjNdIDAwMDAw
MDAwOiB4eCB4eCB4eCB4eCB4eCB4eCB4eCB4eCB4eCB4eCB4eCB4eCA4MSAwMCAwMCBjOApbICAy
MTAuMTkyOTI4XSAwMDAwMDAxMDogMDggMDYgMDAgMDEgMDggMDAgMDYgMDQgMDAgMDIgNDYgOWIg
MDYgMWIgNWIgYjYKWyAgMjEwLjE5MjkzMV0gMDAwMDAwMjA6IGMwIGE4IDA0IDBhIGM4IGEzIDYy
IDBlIGQ3IDA0IGMwIGE4IDA0IDBiCj4gSW5kZWVkLCB0aGF0IGxvb2tzIGxpa2UgYSBwcm9ibGVt
IHdpdGggdGhlIGRyaXZlcitIVyBpbnRlcmFjdGlvbi4KPiBJREsgd2hhdCB0aGUgcmlnaHQgdGVy
bWlub2xvZ3kgaXMgYnV0IElJUkMgVkxBTiAwIGlzIG5vdCBhIHJlYWwgVkxBTiwKPiBqdXN0IGFu
IElEIHJlc2VydmVkIGZvciBmcmFtZXMgdGhhdCBkb24ndCBoYXZlIGEgVkxBTiBJRCBidXQgd2Fu
dCB0bwo+IHVzZSB0aGUgcHJpb3JpdHkgZmllbGQuIFdoaWNoIGV4cGxhaW5zIHdoeSBpdCAid29y
a3MiLCByZWNlaXZlciBqdXN0Cj4gaWdub3JlcyB0aGF0IHRhZy4gQnV0IGl0J3MgZGVmaW5pdGVs
eSBub3QgY29ycmVjdCBiZWNhdXNlIHN3aXRjaGVzCj4gb24gdGhlIG5ldHdvcmsgd2lsbCBubyBz
ZWUgdGhlIHJlYWwgQy1UQUcgYWZ0ZXIgdGhlIFMtVEFHIGlzIHN0cmlwcGVkLgoKWWVzLCB3ZSBh
cmUgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIHJpZ2h0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBk
cml2ZXIKc28gdGhhdCB0aGUgcmlnaHQgdGFnIGlzIGluc2VydGVkIGJ5IHRoZSBkcml2ZXIgZm9y
IGRvdWJsZSBhbmQgc2luZ2xlClZMQU5zLiBCYXNlZCBvbiB0aGUgcmVnaXN0ZXIgY29uZmlndXJh
dGlvbiBvcHRpb25zIGZvciBNQUNfVkxBTl9JbmNsIGFuZApNQUNfSW5uZXJfVkxBTl9JbmNsIHJl
Z2lzdGVycyBhbmQgZGVzY3JpcHRvciBjb25maWd1cmF0aW9uIG9wdGlvbnMKYXZhaWxhYmxlLCB0
aGUgaGFyZHdhcmUgbWF5IG5vdCBzdXBwb3J0IHNpbXVsdGFuZW91cyBvZmZsb2FkaW5nIG9mIFNU
QUcKZm9yIDgwMi4xQUQgZG91YmxlLXRhZ2dlZCBwYWNrZXRzIGFuZCBDVEFHIGZvciA4MDIuMVEg
c2luZ2xlLXRhZ2dlZApwYWNrZXRzLiBJZiB0aGF0IGlzIHRoZSBjYXNlIGRpc2FibGUgU1RBRyBp
bnNlcnRpb24gb2ZmbG9hZGluZyBtYXkgYmUKdGhlIHJpZ2h0IGFwcHJvYWNoLgoKQmVzdCBSZWdh
cmRzLApSb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
