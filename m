Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA50A35CB0
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 12:38:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFBCDC78F8C;
	Fri, 14 Feb 2025 11:38:28 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51EBAC78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 11:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZQZ8B5rGiaPtnUtBd/ISpDbABvaSIKXpHsDARgLfSKfZmhtHoEfS+InVp4NQ4f8JE+YL2dFGmXGNg3pKfl4vDtPp6jN4QXo/a3RF6lrg5ySKbaMg+vTNdT7gNmU9m6Wnhk8olZUUbrZAhPxF4aIjoq30XItxqIgUwrLKWXX5o379jxEH/L/eH8hHC9EK6kixHOHMUUf/LsSABcKFRpm+Kw0BCkLyYUNNxDWXg+E0kvZTDwb1icqvdYE1DdMeUtY1PppMJHBJhB/8+/qlSVm+fFYva8Bx7kgU7SAXVpbf70nRPW/UCq36G/2VBZXTZzLmmYgwbSeItwUPybIycEfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLbPMuLVk8Qk8Paa0RTfoiuPc/0vN19NH0kDJjR8Ggw=;
 b=O+f/KyrPw0BmFNFD8OTpuIN9ysf6qO32yzRlP3hPy2bDLPV+jzDk5yqRz2vvc/neblxvPDbn+tH2j9auq1wHGkMKznjTEJUxTU2r7l6G1pJzcZXFdgeB0kwq0PE71fHdpfsXlpD7JRvwRenZUDFYc2EJ0NsTqvLt1QEveywq0aZQlK398E78I2vGmLH9lqLjIB4vMqggqs9aZWRXhncjYm16I5nutNvosKOQ0JQaESoEX17+ap/DXo+VgZeQb5KiE/eEnWJNCE7qIHwzDDPqIMic/iqdZqkmJKtvdDg1G57rBnBuZqSvGhCqrKa6oL6XYPos3zd3Y8ykJ1SpGl3JWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLbPMuLVk8Qk8Paa0RTfoiuPc/0vN19NH0kDJjR8Ggw=;
 b=dnHc174NcxvTcxv4gMMBhhc/zIOD8GBqAs48g27sU1XTQrGVcjlHoJG9hHKsd8eqdELC0wzfNBXy60PyQEC2zyh/19uI8FkJHctYoIo1eeiVa5jNpSkF4QbN37yYqulA4ZfsHGThzj7PpXrs7KAP8UdFb2gcuMbcpNHi+Uizd0L3vkl5tr1yOuxkqvcrOGGWC2e4dMbzLAlVuqJiLXpfOfbYmXBSOlzLhSLwBqpmvJ3lmVcxxTAmCGzTzLraqKJyIPrM/muYhg98E2fkjvi8DDUKQ6T8+kNhLuO01clp8XV0Z+gIBsMmhYGS43Slc3i/b0W6XmbFfMqhJ5nQC7YPpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI0PR04MB10733.eurprd04.prod.outlook.com (2603:10a6:800:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 11:38:20 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 11:38:19 +0000
Date: Fri, 14 Feb 2025 13:38:15 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250214113815.37ttoor3isrt34dg@skbuf>
References: <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home>
 <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
 <874j0wrjk2.fsf@kurt.kurt.home>
 <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
 <20250214102206.25dqgut5tbak2rkz@skbuf>
 <afa50e3a-914b-46b6-8401-0589b6099f68@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <afa50e3a-914b-46b6-8401-0589b6099f68@linux.intel.com>
X-ClientProxiedBy: VI1PR09CA0123.eurprd09.prod.outlook.com
 (2603:10a6:803:78::46) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI0PR04MB10733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed60cca-c3ba-45db-5c8a-08dd4cec147a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmVHZnNTbDMzUWErTm9icEJWSStCL25aTjRURUtldU0yeWNvbjA4MTNVUTNw?=
 =?utf-8?B?c1BXT3IvZ2t2b09TcDdIRjVvczJ6cldsY3JQYWlBSk9sS1RLNllEbkpVN1Z0?=
 =?utf-8?B?ejF4eTY2ZGhZS3JtYnRNQWgrbzJ6MmJSN3JXKzg5TGluS2ZkckdBdGNkbzFr?=
 =?utf-8?B?Zm9ZQXlhMUo1emRYYUFWRDh2RWc2Wk5QM210REw2czdYZW44THo2Szg2QzZa?=
 =?utf-8?B?Nkh4dmY4aEhTaURBM0YxOGpmRWgra05JVmVXWEdtZjBVMTFaRFdKbTBNTjlS?=
 =?utf-8?B?clQxZmhnbDd2clBtOEZDYk1WbUV0aUt0YjF3RzBoUG5sUiswU0xKNlJMbWxP?=
 =?utf-8?B?cnBTNGxlYkpwUGFHV2lWTHg0MG9EWUdVY2NXSG1WeGhGYnB3RnFmemwxQlpw?=
 =?utf-8?B?dTdqSHBkUGhDVlF5Z3ZhSnVDRkhBOC9nYUNzUXNiVExsT3VjNGpZc1haOEZ5?=
 =?utf-8?B?a1lwM2tETHFRV1hBQzY5Ulk3bVdOK1VwY2lUb2ZzK2ZweCtROTh2QlM5aW5X?=
 =?utf-8?B?MlpLUjFPQitRQ2REM0Z5amlaWk1uek4rWDl1ZEFrLzVTSGpNK2ZEMHFMMk13?=
 =?utf-8?B?WDlsMEVVSDlESHlGQmxLdDhRc2F2ZC9XUnpheTNlVHJPbE9CTCtCVEtMbFg1?=
 =?utf-8?B?dlhaWW5IdGhBaGhuWGJJSjFEUE1mTVY1bmwwazBBVjh4NjRvU2dTYjN5b2t4?=
 =?utf-8?B?R1JwSE5TdmY3UmxqbXJHanFsUjJJZ1ptMEZiemZWOVYzWlZTZmJkWldlR3hO?=
 =?utf-8?B?Wi9hSU1HRmRJMFh1eGZROElUQ0YreHl0SytMMUIybW9KMXVQVEJGREFiaGRk?=
 =?utf-8?B?QlZnZVh4S0owOUxmVFJpY0JQTlVqaEVrWDMvem5KUGNRYWxDVkY0Ly9yS1hP?=
 =?utf-8?B?eVNSaW5Fei8waVQzU2RQbmNMSUcxNi9hUXdoTkljZ01JOGYwQ2RmSFo3VFZV?=
 =?utf-8?B?TUpDTmsxOXBRS1ExbkJXbWlhdER5d2EwSTN3S1IxNGtpc1RSRlE5NWYyWk5o?=
 =?utf-8?B?UWVQMEt3ME9id2ZsWnpicDBmaWYzeGhIWmNCMkpXTEZ0WnhXZUxJNGR5c25M?=
 =?utf-8?B?NkdTckJWd1FNcWV3c2xlZ0huQ3pCSE9FSUVXbXUvQ0FSeVR6bDV0ZmNGK3RQ?=
 =?utf-8?B?VEYySHB3eGtPSXZUTHZrelI1VWg0TkhscU83Vk1laVl0SENSVENSUllrcExL?=
 =?utf-8?B?SzlyRFNCNEsySVR0cHVRQ0hpZDZacHNIVkxyRDJ3V2YxY211Z25JdThGUGh0?=
 =?utf-8?B?YkhBbkl6SXNONkNRSFFPNDIrVEd5dGVTZnEvdHZPWVlJdGRxUW1qSXcwK1Rs?=
 =?utf-8?B?Vm4rZDRYeXpiNWRBYzNkc1RjcXhiS1dBeHFaTUZrOEJNblREakFCLzczeXBa?=
 =?utf-8?B?OEVWRmU2YzgzVFl0cnozeGxqVDF3cXpLNVRqRHRkT0cvQUdhdkp3b2h0MU4w?=
 =?utf-8?B?WjU2VFg5VWFVL3g5WHdKNlJZSE9qdEEwdEdJbVkzYm9XNWFVa0lHRkUwSEtR?=
 =?utf-8?B?dG9uMFVBUjF0TUlWZHg2OEhxVk1pN1NrNmJhMUEwT0xkSy82alhINTNVMXA3?=
 =?utf-8?B?SEZLTm9nSHBaRCtmT1lBZnRReWloZTkxY1pGc3JxalBPTDhpaldMUXFZekY2?=
 =?utf-8?B?R3lQWitMNmpBbGhWOVNoQ2dpUTA2Y1hSRmtCOXo3YVBxNzFJbDA4SmpjUm9T?=
 =?utf-8?B?TTExb0lrMkZacUs5ZnNzaEZVSGhzMFVNSGN5ZEdtc202a21Na2lEcjZTUzlT?=
 =?utf-8?B?SUc4QTMxNmxQbFNSanNCbnFlVU1vSnY0MnNuZ3JYQVBwdDR5VXNETWhTNVM2?=
 =?utf-8?B?WG5yODlmdERZMDF1M1ZLYzJWcWh1N2VZdGZqamJscnlUL094Wk5KSzdIZ2l3?=
 =?utf-8?Q?WG9JPPzNiXs+S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0MxUDFiNVVQVUZOVllUY3NYelcyWTJETHlEVUNaUWNuOGVxLzhINjhlYkkw?=
 =?utf-8?B?SWtMNkdkbm5MWGNQL0tydmFHazE0Z3NDeUFhalRnNUYwRzBHQzRjdTc0REk3?=
 =?utf-8?B?Y3R3QWt4UTUrNDJpaXNOaWE5eFZyNGtkd2h1MTJvdXNNL0lhS0hYdjlKbVhh?=
 =?utf-8?B?SHd6dUxCRXk4aHdSemx1S2RhRWFhZ2d6UWsycDY0Y3hKVnZMT2hkbk9MOVFS?=
 =?utf-8?B?TVBFcjN2eERUd09ocEdKaFo0RnZPLzhlYVEydUIyTm1BdXFmMnJOdy9NVkpr?=
 =?utf-8?B?Tk1nUjM4TGZqam9RZHlIVW1PZSsrTlByU0ljdk9pZ3JIS2R0R2IxRzFlNUJj?=
 =?utf-8?B?NTBnc05OZnNGMC9wTEV3MWU2K2wxZnVIY3RnWHlqU1RvM0U0eXhvU08yNkd6?=
 =?utf-8?B?VlQxQVFEdDRLV0Y4S1BRa01rcmwraVhFY1puWXBTck9zdzY2NW9QZVBJMDlE?=
 =?utf-8?B?OFVPVWF1aXF5Q0ZFNWJTTHZoNTFnS1B1R3hTYlJiSGc2aGtOODV1d2JpR2VU?=
 =?utf-8?B?Wk9TaW9CNm8yLy9Ha0NzMFByK2l4RFhzZ3RzVStxR3g3NlJrcUU0VWNuVUdy?=
 =?utf-8?B?Qjg3T3pta1psaTkwQWg5M3U4Tk5pQ2JVclFwQ0g4UkswVlhUYmZEZE8vcTZB?=
 =?utf-8?B?OFhXRjVVY3F4VnE0aFZYTnhLRXBaWWM3OVBMcjZ5dUdTZlFtTTdLcm44c1NM?=
 =?utf-8?B?QzRqS0FVOGR1L2JtM3FWdjhZcnhYRkVYVE5odVpHdnhLZDEyL3U1Q2ZnSHBw?=
 =?utf-8?B?bGFjU2RwUy9TeFU0OUh1WkVaaGhOaC9zVGRUeGR0Z2hVUHB3WWpSeTY1VFBZ?=
 =?utf-8?B?MmJBZmpyTkh1a0pjaklBeTIvZEJPTnlNSDZnZkZsc24zdjcvK1NDK0djZzQy?=
 =?utf-8?B?ZmlYWWc4eXZBbWE1VlZTYkcxZjRINncxaExpQm1yeEpwendkNnlHcU54UnRa?=
 =?utf-8?B?ZmpJMk82d2VUU1pENmIxNVUvTS8ySjhwbCt6N0VrUWlURkVFczFtdkdlenhZ?=
 =?utf-8?B?Y3BEa29UMWpwSitibzIra2p6WXNha2U4UWE3Y1ZwRmxnMjJSU3hlVXhXOVBF?=
 =?utf-8?B?eXZHSURBd20xejZqMThDbmF0SjlxVW1ZVWRjNHhEZTB0MXdGai9XY0VDKzlj?=
 =?utf-8?B?OXJwdUFUOUk4cC9KSGpmZk4xMStOLy9kZDAvVldhY0cvdDdnb1IxMnpVN25i?=
 =?utf-8?B?K2JCTUFMUnhDRzI2Sy9sd3pGWndnUTJqL2YxbTNVK3h2cXBza2tWYitxSzVM?=
 =?utf-8?B?MTFWeVkxQjYrNTV1U01SK0J3dUxjV0lZSFVvZ3o3VTE2cTdDTWV6dFdUZWhp?=
 =?utf-8?B?WHByNWhUMzhvaWQ4M3pST0hYVzlCQXAwNTZkRGtTRlBYSzNkUHBKRnQ0VXJv?=
 =?utf-8?B?akZUbDRjM3NVWU1tWWtzcnpLUkRMMlVoeUZBSmFXdUlUWDk2c0ZDZmdnMVdm?=
 =?utf-8?B?OWJtdk82bkxtVDNJRjQwelBVSENBUit0OTBhbFcyTklON2dWYk1HODdtdFo1?=
 =?utf-8?B?RmFaL2NYajdzNXd5MzVsdkVPcE9ZdlBnRUxhQmJ5ajZXUGk0a3N0b0J2ZWRD?=
 =?utf-8?B?alZRMGJyWHp2ZlpmL25DTEZXUkFlS05VaVVEUHdabEQvSnV6YlpraEpiejJy?=
 =?utf-8?B?bzcvYkVjbXp3anFWWDQvYnh4RlZlQkdvbVNETjVuc0tsYVBMeDBxakZiQWMz?=
 =?utf-8?B?N0JPYTRrT1JZdWpaREFIN3Q2cnduY3lkYlViTms4aGk2T0lWdWZLL1hUQnI0?=
 =?utf-8?B?d3hiM2dIazBNTFlkMkhsTlFXZktMNUVDNzVUTkpFNlpCUFpTcVR6RzJmcCs4?=
 =?utf-8?B?RThQdVBrN1JjdVpsQ2Ywd3ZmZGxhYm8rc2V6V3dYclgyTE5WTFhTMStCZUJq?=
 =?utf-8?B?enNVL1JUN2o4NzRvMGFnZmpDM2J4aFBDQ0FYUDZ6K0EvYW1rREVjTjV3RjUv?=
 =?utf-8?B?aXRhYndvLytHMDFDZk9jZ1lid2NtRjM1cDRkUS9qMUV2TjhVMUcvS0xRR0VX?=
 =?utf-8?B?dXQvSjRrSEFvZHVqaVF2Wmk4SnFqZ3JHSEx2ZUhuU3VBODFxVVhBVk5VM09Y?=
 =?utf-8?B?M1dxNUMyRmdxcTBiVmIyQW9PUEtDKzRyeU00cEhTVDdjOGhmRkwyYVk0TFl5?=
 =?utf-8?B?SlBVNnJVdHI4allsMThhZDRHc0tQa2xwOVUyWUFhb0lJTkZSajZNMnFhbllY?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed60cca-c3ba-45db-5c8a-08dd4cec147a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 11:38:19.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5RjD17W91CMeuV2tLmWdGNRyhdFOjqzHadgbGOo764WW3EdRbNfDhQvQ+Tp0dyiNNFfZQ41Hhrn9fvx1vcChw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10733
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

T24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMDc6MjA6MDhQTSArMDgwMCwgQWJkdWwgUmFoaW0sIEZh
aXphbCB3cm90ZToKPiBPa2F5LiBJIGNhbiBsb29rIGludG8gdGhpcyBpbiBhIHNlcGFyYXRlIHBh
dGNoIHN1Ym1pc3Npb24sIGJ1dCBqdXN0IGFuCj4gRllJ4oCUdGhpcyBhZGRzIGFub3RoZXIgZGVw
ZW5kZW5jeSB0byB0aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGlnYyBmcGUKPiBzdWJtaXNzaW9uIChw
cmVlbXB0aWJsZSB0YyBvbiB0YXByaW8gKyBtcXByaW8pLiBUaGlzIG5ldyBwYXRjaAo+IChkcml2
ZXItc3BlY2lmaWMgcHJpdiBmbGFnIHRvIGNvbnRyb2wgMiBkaWZmZXJlbnQgcHJpb3JpdHkgc2No
ZW1lKSB3b3VsZAo+IG5lZWQgdG8gYmUgYWNjZXB0ZWQgZmlyc3QgYmVmb3JlIHRoZSBzZWNvbmQg
cGFydCBvZiBpZ2MgZnBlIGNhbiBiZQo+IHN1Ym1pdHRlZC4KClNvIHBlcmhhcHMgbm93IHlvdSdy
ZSBzdGFydGluZyB0byB1bmRlcnN0YW5kIHdoeSBJIGhhZCBpbml0aWFsbHkKc3VnZ2VzdGVkIHlv
dSdkIGJldHRlciBkcmF3IHRoZSBsaW5lIG5vdyBhdCBqdXN0IHRoZSBNQUMgTWVyZ2UgbGF5ZXIK
YW5kIGZvY3VzIG9uIGhhcm1vbml6aW5nIHRhcHJpbyBhbmQgbXFwcmlvIFRYIHNjaGVkdWxpbmcg
aW4gYSBzZXBhcmF0ZQpwYXRjaCBzZXQuCgpJIHdvdWxkIGV4cGVjdCB0aGF0IGZvciB1bmlmb3Jt
IGJlaGF2aW9yLCB5b3Ugd291bGQgZm9yY2UgdGhlIHVzZXJzIGEKbGl0dGxlIGJpdCB0byBhZG9w
dCB0aGUgbmV3IFRYIHNjaGVkdWxpbmcgbW9kZSBpbiB0YXByaW8sIG90aGVyd2lzZSBhbnkKY29u
ZmlndXJhdGlvbiB3aXRoIHByZWVtcHRpYmxlIHRyYWZmaWMgY2xhc3NlcyB3b3VsZCBiZSByZWpl
Y3RlZCBieSB0aGUKZHJpdmVyLiBTbywgaWYgcHJlZW1wdGlvbiBpcyB1c2VkLCB0aGVuIHRoZSBz
Y2hlZHVsaW5nIG1vZGVsIGlzIHRoZSBzYW1lCmJldHdlZW4gbXFwcmlvIGFuZCB0YXByaW8sIGFu
ZCB5b3UgZG9uJ3QgaGF2ZSB0byBoYW5kbGUgcHJlZW1wdGlibGUKdHJhZmZpYyBjbGFzc2VzIG92
ZXIgdGhlIG9sZCBzY2hlZHVsaW5nIG1vZGVsLgoKSSB3b3VsZCBhbHNvIGV4cGVjdCB0aGF0IHlv
dSByZXBsYWNlIHRoZSBjdXJyZW50IHBhdGNoIHdoaWNoIGhhbmRsZXMKcHJlZW1wdGlibGUgdHJh
ZmZpYyBjbGFzc2VzIGluIHRhcHJpbyB3aXRoIGFub3RoZXIgb25lIHdoaWNoIGV4cGxpY2l0bHkK
cmV0dXJucyAtRU9QTk9UU1VQUCBpZiBwcmVlbXB0aWJsZSB0cmFmZmljIGNsYXNzZXMgZXhpc3Qg
LSBqdXN0IGxpa2UKbXFwcmlvLiBXaGVuIEt1cnQgYWRkZWQgdGhhdCBjb25kaXRpb24gaW4gbXFw
cmlvLCBpdCB3YXNuJ3Qgc3RyaWN0bHkKbmVjZXNzYXJ5LCBiZWNhdXNlIG1xcHJpb19wYXJzZV90
Y19lbnRyaWVzKCkgYWxyZWFkeSBjaGVja3MKZXRodG9vbF9kZXZfbW1fc3VwcG9ydGVkKCkgaW4g
dGhlIGNvcmUgYW5kIHJlamVjdHMgdGhlIGNvbmZpZ3VyYXRpb24uCkJ1dCBhZnRlciB5b3VyIE1B
QyBNZXJnZSBzZXJpZXMgaXMgYWNjZXB0ZWQsIHlvdSBzdGlsbCB3b24ndCBiZSBhYmxlIHRvCmhh
bmRsZSBwcmVlbXB0aWJsZSB0cmFmZmljIGNsYXNzZXMgZXZlbiB0aG91Z2ggdGhlIGNvcmUgd2ls
bCBsZXQgeW91LCBzbwp5b3Ugd2lsbCBoYXZlIHRvIGltcG9zZSB0aGUgcmVzdHJpY3Rpb24geW91
cnNlbGYsIGp1c3QgbGlrZSBLdXJ0IGRpZC4KSSdtIG5vdCB0cnlpbmcgdG8gYmUgbmVnYXRpdmUs
IGJ1dCBpdCdzIGltYWdpbmFibGUgdGhhdCB0aGVyZSdzIGEgY2hhbmNlCnlvdSB3b24ndCBzdWNj
ZWVkIHRvIGJyaW5nIHRoZSB3aG9sZSBmZWF0dXJlIHNldCB0byBjb21wbGV0aW9uIHJpZ2h0CmF3
YXksIGFuZCBpZiB5b3UgZG8gYWJhbmRvbiB0aGluZ3MgaW4gdGhlIG1pZGRsZSAoTUFDIE1lcmdl
IGxheWVyCnN1cHBvcnRlZCBidXQgcHJlZW1wdGlibGUgdHJhZmZpYyBjbGFzc2VzIHVuc3VwcG9y
dGVkKSwgaXQgd291bGQgYmUgZ29vZAppZiB0aGUgZHJpdmVyIGF0IGxlYXN0IHJlamVjdGVkIGEg
Y29uZmlndXJhdGlvbiBpdCBkb2Vzbid0IHN1cHBvcnQsCmluc3RlYWQgb2YgYWNjZXB0aW5nIGl0
IGFuZCBub3QgYWN0aW5nIG9uIGl0LiBCZWNhdXNlIGlmIGEgc2lnbmlmaWNhbnQKYW1vdW50IG9m
IHRpbWUgcGFzc2VzIGluIHN1Y2ggYW4gaW5jb25zaXN0ZW50IHN0YXRlLCBpdCB3b3VsZCBiZSB2
ZXJ5CmRpZmZpY3VsdCBmb3IgYW55Ym9keSBlbHNlIHRvIHBpY2sgdXAgZnJvbSB0aGF0IHBvc2l0
aW9uIGFuZCBub3QgY2hhbmdlCnRoZSBiZWhhdmlvciBpbiBpbmNvbXBhdGlibGUgd2F5cyB0aGF0
IGFyZSB1c2VyLXZpc2libGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
