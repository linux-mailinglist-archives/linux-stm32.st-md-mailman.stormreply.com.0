Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588DC04349
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 05:03:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E16C5A4DB;
	Fri, 24 Oct 2025 03:03:35 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25447C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 03:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZyso59T3HjcCBMtvFSMoZD/UaLuGe3aU5LrA9Ir2SuiiZOmLgqRKeT34GWbh7me3ISnEDOFlUOfTsELqrHWsXNYccOWRyQhpGsa+iFyB6i5y1bUCFAqxoh19Om10nssa0ca4EVuViDVRAfn4lI5O7NACnZ+K78sKGiCHNCGxRvS2mkgNet5M6KmwxETK+fi65u1QxqzrHt4hzNQBOBzIiGlWnQJQkSex3lhFqBgtx6Hm9UFyL1OXj1cK/owZ1FOW5z9mWcjN+PKXNAhKTrdS9f+G3tQiDJzucyc8DJOZF11kQAxr/Ly3sstfSNaXkeTRSdFwgURdIqVH6ffq45lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjflppvYtpVdjqfddYua0zLtAmdtGv+i7XvnBLTp1BY=;
 b=Io1bWKZ/jgACvvmeQsAxjo9pF/4fa14+ujNl1nCsGa8/633wiyeOx0ryCd2Hho49y8NJwS3M7hszA347r0gjCRQWETYaPlHC+XSRZXMN0fu5uBSVu6ZdE36EF/M1R77DPIClbCvcbuAfOanvmSd+pPAG1wFgJwbkE7xUq5hY1V+RgPd1ywsO3H/SsCUPBkgL73L+YXazm0Vg0jNYRubmBikU/eILSlBtcBMzujPwXeZkishk8UlVb16kFxYvZdDlVm1R44Idh5O5HDYIxgYatnmL5VnLrD4SklNDkvToIaiC7hrjyQhUFvsoQVqpdlE6e8VjzrkLM5QI9V4mW+Zokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjflppvYtpVdjqfddYua0zLtAmdtGv+i7XvnBLTp1BY=;
 b=AYMfmZX1a+4Qumfke7w0L9u4hYYnRuXPk67bJBo/eS10Pv0ZbHnLreprf7lAIjG4TUdC28cYv1m3MY5svk6oV3q2RQuPzxy4eXAN4+nnPYMn6/xGavBmPsW2DmmX5BB6G0x/UW6hTc4j7EYZtNFj999G3SZuA9WDwJ7BUvRM36D8tFnQm05utb0+axIxaPfump2cgaHtVduSSVN+dZNg4KnpB+DO9NZAKcIGSG5ffqVx4IeKoMouhDlp4OwNe0djxZp0prpKTkCe1C3dwX3SJEaxF1ULspu3QaJd195bhfCTtgrcOXEPcoTm3zJ6rik75/UtMBCV59yoKDpLwKN9gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by LV3PR03MB7453.namprd03.prod.outlook.com (2603:10b6:408:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 03:03:30 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9228.014; Fri, 24 Oct 2025
 03:03:30 +0000
Message-ID: <12fa7c65-c257-4013-baf9-695ff4c2a4bd@altera.com>
Date: Fri, 24 Oct 2025 08:33:20 +0530
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-1-d3a42e32646a@altera.com>
 <aPI5pBXnh5X7OXtG@shell.armlinux.org.uk>
 <e45a8124-ace8-40bf-b55f-56dc8fbe6987@altera.com>
 <1abbcd93-6144-440c-90d9-439d0f18383b@altera.com>
 <aPoJVOUe-ASx1GmV@shell.armlinux.org.uk>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <aPoJVOUe-ASx1GmV@shell.armlinux.org.uk>
X-ClientProxiedBy: MA5P287CA0148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::18) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|LV3PR03MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: dc298d12-a793-41fa-3dc0-08de12a9e920
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm1xQWU1czJzQUdhdENldmFlcnRPRXQ4VHYxN1o4Z0p3RmdoSVdGOUhRTjE1?=
 =?utf-8?B?c1hFYXdJQkV6OGp4ZEV5VkFwMkxETDUrQzZSK2pWdk94R2l6NlI3aU5Ua2E3?=
 =?utf-8?B?dDg1RUxLQ2d4WkUzYWZubzloTVBiTVVJUEdNeGhhUHYxaVFOYXQwUU83dDFQ?=
 =?utf-8?B?QXllSDFIRnh6MHk4bVVoQTZ5MzQvWjYremFQTjFNblpYRGQzRWdSbXg0UHFM?=
 =?utf-8?B?Z2Y2eE01OVRnSnk1Y2RUOXVIblAzcTJldXp2dHZjUWJUamJ2RU52S21ZRzYy?=
 =?utf-8?B?WUpVNHRXN3Y5Qmk2bUhabmgzQXZyTzBPWnBhT0hra0UvanVud25kTlVBWXNz?=
 =?utf-8?B?YjZuRUl6QjhSeWZUcG84WUdHeFd0VC9OZGtWUklWZFBZcTdERlp3NFpldmh6?=
 =?utf-8?B?WWFlenFpRzh5aG5BeFZVM0w4YnN0U2JUZWwvSlVOSC9VM3F6SnBFRVF4QWNy?=
 =?utf-8?B?RjZ2T3dubVA3NjUzd3VtSGFlNVRoYkpTcnpyQkhGazd6b0xDS0U0Q25WTUZ3?=
 =?utf-8?B?cmZuN2xmOW1iTG5PU3pCU3UyMUdJSXhmZkExZUtyT1ZKa1lpRHJOa0ZWT1Yy?=
 =?utf-8?B?MHQxRE12V250Vjl4UXFvM3dPdDlEenZTdDg1WW1hRWVHY0JUTExCYWJuWWE4?=
 =?utf-8?B?SkhhZHV6NlJ0RVRuMjU0SXNBNzVvWnF6a1V2VDg4ZTZwVjZlUXpEUGp2SmZJ?=
 =?utf-8?B?MDlGWGZWdWRWNjg0NG9yR2xyaWg5ZUZLa2lKVENKUkJGYVJTMzBIejBsYUdx?=
 =?utf-8?B?RStEY2c1eGh0MGV2ZkdWRXVNbGdBZEt6cGEyUUdqVTBqeXAzQjZraW5FbHVQ?=
 =?utf-8?B?UlIwQXhLa3lES2xBNXpVUGFiZ01oLzc5dWdvbitXV2xFNkp1NnVzdzdsWFhT?=
 =?utf-8?B?RHE1TnRuazFoZTZWVHJiYXBoYjNMd2xvRzhKRmVXb0tzaUFYNTB3dzJySXJO?=
 =?utf-8?B?UDB1cmFQMW1JUkRkdEkyUElyMTNKWURCcTFwM1B0aldWN1BFZnhiTzY5VTZq?=
 =?utf-8?B?VnVuemhjcTZ6c29ENUh3bE9DSGpiWVQ4SDhOc21xbW96QzBqaXNrekZEMXBa?=
 =?utf-8?B?QmNITzh3dEdETGxNTm9lMFBCY29BemtrVUZRMFZBRkZOaG5FNjBEZlA5bmg4?=
 =?utf-8?B?dWVBUytHZnBmd3BHNHRmT25vUUtVVlBkcW8vVmpnSG5TdWgrc1FuVFp6Nm9j?=
 =?utf-8?B?Zmc4K3djbkhNczJCRUY4bStJdTNqcGVQa3VHenkyUlVPTTBlQS9GTko2eUpQ?=
 =?utf-8?B?TjVoK0NSOGc5OEMrd2dnMDRYeTd5NWxtUmZUblVHb2xRYzRYYzVoZmo0SEVp?=
 =?utf-8?B?MEVBM1M2ZmhkOStOUkpaS3Y3WHkxeEpabGVHeXBCM1JnZ1pXczlXSjB2VEZw?=
 =?utf-8?B?R20xalpNTndHMmIwK01BbUZwdzlsUDB1VG1IUlUxQU9YVHkycUtRdGdyUDQ2?=
 =?utf-8?B?RXUzMGNzZVl6MENubkZrVkcvZjBIVnFVaWFCb1pxWlFESWR2VXF5MHlYM0Fx?=
 =?utf-8?B?WDBwc1RyMGFTWk9ObGRzb0xuRXpTSFVaRWJlL2Q4REFGazJsalhtL2JicnBs?=
 =?utf-8?B?UUtPM3FJT1dOOFowVU9VMFFLMFpjakpVWkszVG01a1pLRU5zM2s4OENzbnhi?=
 =?utf-8?B?MmRGc2JPSXNTaVUrSDRFNnV2UmZkL1JoK1A4a3kycmFGQ0JvWms1RlNBZUo2?=
 =?utf-8?B?QUNJanZka1dKWkVoeDU5N3RQRUJLemVqQTJwd3Y5TUZpRmgrVHFrQ0NrcTky?=
 =?utf-8?B?YkdaTDNtUE56eEFxTW92OHltL2JBcXppUHJEdXFhaHVCNlowYms4c2g5KzJz?=
 =?utf-8?B?cWhoUERvZkhRNnd0QW56ME9mcG4rZ2RuMmRlNFlhQ0I2cDlyWk5qNk5sZVJ1?=
 =?utf-8?B?dEdtUFJsRWhGdnNlZlVpWUROVmFZaU52KzhsQyt4SG04RnJndG00TURHcmQ1?=
 =?utf-8?B?Mk5VVThtSU82SUhqeURIbHlWNm85TU9ab0FUckR1WEpUbWVsOU1jbEQxZyti?=
 =?utf-8?B?c2k0V3dqcjd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZla0VHN0tRZnJuMy9pRlIya2NSQjlPYm5XZ25wNTR1aGRLYWZnWTdoSkxB?=
 =?utf-8?B?WEhsNmprV3NDQXVNQm9HNER5N05RUSs2cThXL09Ja1pUejcwdmd4bWNsb2d5?=
 =?utf-8?B?Qk9BVUpnQkNBZ1BWWDQxQ1JlMTN6enRzcmd0ZUdHUjJpSTE4QURjTkhpTnhz?=
 =?utf-8?B?bVRKYkxzSlZMU25icEhIaTd0YUZIbDNCRytVckNNcUpiaUJVdHpXMUZMdTBS?=
 =?utf-8?B?TE5pYSt3ZGROSVhvcmF0YlMwMElVd0lYTk5GWUsxMnhoQm81WGFPTWFvaEx2?=
 =?utf-8?B?eTFtQ0wwUTVLNmFDN2d5blp1Ym50SW00K1kvZThtNHZZdnJUcDhxaS8zNi80?=
 =?utf-8?B?Wk9xQUdwaTA5MW83Q0pFbHdqNkQ1TkxhelRKNFlCemdUK3dUTENMcnJaNkZZ?=
 =?utf-8?B?ZVFiU0VZR2cvcWxZUHh2aW9Qa0YyMzR0bi9lcVMzMFluYTVZMmhjWVVrT3pP?=
 =?utf-8?B?VlBrbFhIVUNiNTd5L0F3Z1ZoeGloS3pmRmwwUkI5a2JtckxjM1lqZUg2cUtI?=
 =?utf-8?B?VmJPM0xYbUh1Qmx3dDdLMlVtbktCcjVnMkZnUUVaL0JKVi9US1FVbFRNU3dp?=
 =?utf-8?B?dUw1dFVreGlhcXdaQUkrR3NoRjF5Ympwem1veVhpeld3VG05cmoxZ0taeFha?=
 =?utf-8?B?ZkJMcm5DK2d3dkJhUkNhZ1JQOTZZV0FydzlHWjExV3BtSW1tbk96K0xvZGdF?=
 =?utf-8?B?WUc3alQwS3NmdnUzNW1HbVJqczRYNnpXQWRuQUxySElVdlFmZHhtbExmZlFQ?=
 =?utf-8?B?WjE3ZHVRYzlSd2k0Tjk5Q0pwYmhlejlQTkZmQ2o2cUF2d3V0S3FBbXN4bG8x?=
 =?utf-8?B?N0o2RVBzUmdjQTZHNjRFMzQ3dDQ2NDNjZWE1dnMzeWlhcm44NG5CL3hFOVJ2?=
 =?utf-8?B?RVJFQmpLSkk2ZUx0OCtjbnJnN0ltcjhLSmdjNWJMZldwSk0rMWR4MS9KQjgv?=
 =?utf-8?B?S0EvVHM1RmJGODJBcERoL041b0JUU2Q0emdyUzhyQ09RTXErVG5FYkthMG41?=
 =?utf-8?B?WEw0dVhXbkg4THBkbkFtTXduZUVnWm5sQmxwNVlYdjZseERtSnVHZ2FrdUNp?=
 =?utf-8?B?ckNvM0cwYnVwVlBlTGZML09ucnJJRG9KQmJKYmJLeHNBNWo5aDFwYnpHSnpy?=
 =?utf-8?B?MU0vSEE2V0pIUWpUTEZXdDdLSTYyNVA3dHp3OTFoZFdvR1V4cFFIWkR4Nnlr?=
 =?utf-8?B?WHA1cDR5b1BFNStpa09jVzY2QjE4VFJDYzd6MUExV0VDTWNMSjIyaEFLZVZo?=
 =?utf-8?B?UHM5cFZrZmxPZ29JVUxqbjNGUFNLRyt5VTNXcWR6MXdNL043K1NrZzRqUTNR?=
 =?utf-8?B?RDZHdXdnWmdPQ3F6VUcrZU9saHh2QisreHhnOE95TmwzeHdma2wzREg1SHBH?=
 =?utf-8?B?T0Y1VEZ1aEgrZlJkcklINjJ3QUw5SHJ5d0FzYlEzNmtiOFlGdzd0Nld2SzFn?=
 =?utf-8?B?TGZzazFBVDBYbDBQQ0M4Y1NJNGlQV1VGMENKRkFxaEN6SWZKOUZYa3Bod3pB?=
 =?utf-8?B?R3RwZm81a2tCeGd0U3czNC9VUHpQdnRKSGR1ZW95Q2FjbVBOOXo0blFwemYy?=
 =?utf-8?B?bW9hS0hqUlRiVVNRcDZQSlVCK2xXRHYrNG1kcGtERHFBektKSllHMXVYTzhB?=
 =?utf-8?B?R1EvNXZyS3A0K2dnUXJMR3Y3WjdYYjRiS2lXZ2tyeHNaMVdpaVNNN2RLc05z?=
 =?utf-8?B?TklUelZBSjF4QVlVVmJZRUp4cS93TDhPYjNabVVMeTFBbzkzT0JQbm44MEk5?=
 =?utf-8?B?NW5LNkpWQVpjdGVxSjZjRkN4eklaaFdGQkQ4bXVNUlRNN3JERHpMd0lESTdm?=
 =?utf-8?B?Ri90UUUveG01MHlLeWVHNVZkWEI4VTBqMmlIL28zVEFrMElMQ2xIOG1hdnVY?=
 =?utf-8?B?YkF4cXJ1ajZ5aWhrKzZEcVdYRmxSMWhLRllKVzIwYXhRKy80N2lMYjkxY2Fh?=
 =?utf-8?B?YThTVi85RjkrdWw1UEplcTMzQUc4aklKQTRiN3NUZUdNM0xsOUg0SHpqWlRo?=
 =?utf-8?B?eXd1d3VvdTNDWERyZFhPQ3ZzZSt2VHhlUzhPMENXa1JXejdqZXdDMWpYQjNW?=
 =?utf-8?B?UlRLQUMwTjVlN0VDczNpa0libFBqUyt4cW5ONFBybnFxWlJQT2l2SStIUjhM?=
 =?utf-8?B?OElubzE5eXdsemNGUHlGcXRuUzhsTGE4ZWJCTmswaXIvbW90Ky9TaU5MS0ZH?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc298d12-a793-41fa-3dc0-08de12a9e920
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 03:03:30.7105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fayfnmCrJDDvQYaK3T3enRAeIlZjBHCzbHa/mpRFW3KrXAuyqKp7Dzq2wDmBJzAEclHIBRw3WW7qwi5vN37ENRPTM+gc9eRZe/SWCJ5/Vuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7453
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: stmmac: vlan: Disable
 802.1AD tag insertion offload
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

SGkgUnVzc2VsbCwKCk9uIDEwLzIzLzIwMjUgNDoyNCBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUp
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDIzLCAyMDI1IGF0IDA5OjAxOjIwQU0gKzA1MzAsIEcgVGhv
bWFzLCBSb2hhbiB3cm90ZToKPj4gSGkgUnVzc2VsbCwKPj4KPj4gT24gMTAvMTgvMjAyNSA3OjI2
IEFNLCBHIFRob21hcywgUm9oYW4gd3JvdGU6Cj4+PiBIaSBSdXNzZWxsLAo+Pj4KPj4+IE9uIDEw
LzE3LzIwMjUgNjoxMiBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+Pj4+IE9uIEZy
aSwgT2N0IDE3LCAyMDI1IGF0IDAyOjExOjE5UE0gKzA4MDAsIFJvaGFuIEcgVGhvbWFzIHZpYSBC
NCBSZWxheSB3cm90ZToKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+Pj4+IGluZGV4IDY1MGQ3NWI3M2UwYjBlY2QwMmQzNWRk
NWQ2YTg3NDJkNDUxODhjNDcuLmRlZGFhZWYzMjA4YmZhZGMxMDU5NjEwMjlmNzlkMGQyNmMzMjg5
ZDggMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYwo+Pj4+PiBAQCAtNDA4OSwxOCArNDA4OSwxMSBAQCBzdGF0aWMg
aW50IHN0bW1hY19yZWxlYXNlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4+Pj4+ICAgICBzdGF0
aWMgYm9vbCBzdG1tYWNfdmxhbl9pbnNlcnQoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCBzdHJ1
Y3Qgc2tfYnVmZiAqc2tiLAo+Pj4+PiAgICAgCQkJICAgICAgIHN0cnVjdCBzdG1tYWNfdHhfcXVl
dWUgKnR4X3EpCj4+Pj4+ICAgICB7Cj4+Pj4+IC0JdTE2IHRhZyA9IDB4MCwgaW5uZXJfdGFnID0g
MHgwOwo+Pj4+PiAtCXUzMiBpbm5lcl90eXBlID0gMHgwOwo+Pj4+PiArCXUxNiB0YWcgPSAweDA7
Cj4+Pj4+ICAgICAJc3RydWN0IGRtYV9kZXNjICpwOwo+Pj4+Cj4+Pj4gI2luY2x1ZGUgPHN0ZG5l
dGRldmNvZGVmb3JtYXQuaD4gLSBQbGVhc2UgbWFpbnRhaW4gcmV2ZXJzZSBjaHJpc3RtYXMtCj4+
Pj4gdHJlZSBvcmRlci4KPj4+Cj4+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJJ2xs
IGZpeCB0aGUgZGVjbGFyYXRpb24gb3JkZXIgaW4gdGhlIG5leHQKPj4+IHJldmlzaW9uLgo+Pj4K
Pj4+Pgo+Pj4+IEkgaGF2ZW4ndCB5ZXQgcmVmZXJyZWQgdG8gdGhlIGRhdGFib29rLCBzbyB0aGVy
ZSBtYXkgYmUgbW9yZSBjb21tZW50cwo+Pj4+IGNvbWluZyBuZXh0IHdlZWsuCj4+Pj4KPj4+Cj4+
PiBTdXJlISBXaWxsIHdhaXQgZm9yIHlvdXIgZmVlZGJhY2sgYmVmb3JlIHNlbmRpbmcgdGhlIG5l
eHQgcmV2aXNpb24uCj4+Cj4+IEp1c3QgY2hlY2tpbmcgaW4g4oCUIGhhdmUgeW91IGhhZCBhIGNo
YW5jZSB0byByZXZpZXcgdGhlIHBhdGNoIGZ1cnRoZXI/IE9yCj4+IHdvdWxkIGl0IGJlIG9rYXkg
Zm9yIG1lIHRvIGdvIGFoZWFkIGFuZCBzZW5kIHRoZSBuZXh0IHJldmlzaW9uIGZvcgo+PiByZXZp
ZXc/Cj4gCj4gSSd2ZSBjaGVja2VkIG15IHZlcnNpb24gb2YgdGhlIGRhdGFib29rLCBhbmQgdGhl
IGNvcmUgdmVyc2lvbiB0aGF0IGhhcwo+IFZMSU5TL0RWTEFOIGFuZCBteSBkYXRhYm9vayBkb2Vz
bid0IGNvdmVyIHRoaXMuIFNvIEknbSBhZnJhaWQgSSBjYW4ndAo+IHJldmlldyBmdXJ0aGVyLgo+
IAoKVGhhbmtzIGZvciBjaGVja2luZy4gVW5kZXJzdG9vZC4KCkZvbGxvd2luZyBwdWJsaWMgZG9j
dW1lbnQgYXBwZWFycyB0byBpbmNsdWRlIHRoZSBEV01BQyBRb1MgSVAgZGF0YWJvb2suClNlY3Rp
b24gNDQgb2YgdGhlIGZvbGxvd2luZyB1c2VyIG1hbnVhbCBtaWdodCBiZSBhIHVzZWZ1bCByZWZl
cmVuY2UuCmh0dHBzOi8vd3d3LmluZmluZW9uLmNvbS9yb3cvcHVibGljL2RvY3VtZW50cy8xMC80
NC9pbmZpbmVvbi1hdXJpeC10YzN4eC1wYXJ0Mi11c2VybWFudWFsLWVuLnBkZgoKQmVzdCBSZWdh
cmRzLApSb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
