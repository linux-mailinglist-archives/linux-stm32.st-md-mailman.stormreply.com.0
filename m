Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15297C090
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2024 21:35:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4CF7C6C855;
	Wed, 18 Sep 2024 19:35:33 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A811BC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2024 19:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDyEJ/XZQTIQgmKj+EXUFFdHUn6IgBnYZFxKc9ZZiL4DU/TSg4qdW7464In7MSiH59cXJuCziF5vgFcqniNpBY4sf255MZWSQyxUMrKh5LpUb0SV9eC4TBhqfvSWxkvoBsyeBi0kE2J4PZkOJuCMAWzK5quOpq8dkF76h4KBXMXJCu5MV32GtFT3rUKFYQRnCMfofjzWrKNGjiYb5aa2rkCRU5yfWdQg5SUTrtjzb/BNJwcY5uYsL/3MdnkVqaVCIQ71YbW8QGgu6HiGYB/IbP1ZOdsFsUY2qca6jgDwcV2zc6fphsXb4606MOrCoFb2kMMuomHH8gh6k6xsljDeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5/SM/0l1qlyf2sZmxs2dMvV6GRHGhExzB78rxEp9Jg=;
 b=q80lD84eNziV8KUT+H8qw0P4g06s3cAwyBRTNs3nWEwB9Bd9cJvMt6wXExO9MRFDsRhXm7hdYIu/koq6mM0Copq/9MOyn3q8oat565BrH8iy7esDfBkIuFgsqsDcnNLMZ+Mid3PpWm/+4SA6mR1kuJM3LCf/ja4NRDbqwGnADIFSFTRNGyRmOZlfVxTpb4SthBCO0FyLf+pmcHaIUp9eweiUzILvOz4ae9ZUZPI6C2m/zdyIy41zn6veCkGbrN+YQZ02v8JqduyQkqr6tVGPXDoSsItRM8A2+OVI54R3Z18HJHlXLqZ4ZvmJ0bCM+e8BcAhoTG2FcimiNRt3aQRwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5/SM/0l1qlyf2sZmxs2dMvV6GRHGhExzB78rxEp9Jg=;
 b=gOzCvwjKOhNYSeOa/C1d8Jcwv5z5MUwiyP08EE6elImZYZGu3E0heO72ye9IBcP1AZ3VIzuvFek38Su19tTNRwR58eVWrNZhCxR71/5NMWNSglQHUL/6JAJNcZeQMNLQrdvBoOdYuu6qiGcRdLzXwQQNeWG4GcHDjiuPwJSKp4L4KY3fLYpLklC1U3gLlHL+P7DhuUQyeb+K4rQX7xM17d3D9t8qLpiGpLHBENI3bxH8eRTOAr/FliWa4ma1AxbKlMcP+gJNvZiUqM/XyO5YpFwFhMafbpnz/xSq8wDot8r895OYWmpTz5qEhltuev8w1ttSaskhsXeyxvJqXKJtRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI2PR04MB10764.eurprd04.prod.outlook.com (2603:10a6:800:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 19:35:24 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%3]) with mapi id 15.20.7939.022; Wed, 18 Sep 2024
 19:35:23 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, horms@kernel.org
Date: Wed, 18 Sep 2024 14:34:52 -0500
Message-Id: <20240918193452.417115-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI2PR04MB10764:EE_
X-MS-Office365-Filtering-Correlation-Id: 6750c744-e610-4099-1f3e-08dcd8190a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEUvNHNubHdBdXc2ZStSUHpGbGZaZ1BNRHFaSU9XckZTZzAxdjBCRHZCOWY5?=
 =?utf-8?B?ZDFtakRSUmZaTVBKd1VEd2M3WERTZGMzNzR0dGNRbXk5Q05WYnd1bWpOSnov?=
 =?utf-8?B?ZVgyM1JuYXZEcGViamsweTJiNktQdi9yQmNYZmdlVTgxU2tjN2hrWFR6UXBp?=
 =?utf-8?B?ZEs2KzVycXZ3VmR4Z2o1NVZHTUxXNjE4U2ZWb3VqUzhGSzg3UTZGNXQ2cU1x?=
 =?utf-8?B?ZlR3RDl4dmlGdVBSK3o2d21tdTZzaTFkbnNWdVpQNXBzZEZOWDR0dVJSYVJ1?=
 =?utf-8?B?LzJUYWNRZW9Pc0hDUmY1eXlaWVJZUHNTTHc2TFloNDhYK2lJbkhoclVlVWNu?=
 =?utf-8?B?ck1ham9DK2IwUmhlOHIrS3NYcEI0ZWdOZjBPVkJDeWRGZytCWGpUS21RSGYr?=
 =?utf-8?B?dlk3SHVVOERTdHpza2RNTGlRTTRkNmQ3N1NWQkkrRUpTT2lXazVCY0xhTmU4?=
 =?utf-8?B?SVc5bll5MkFFSWNOQnorU3JGMGR6bE1ydjVSTlN3U0JQZDJwNDVjME9lMnRT?=
 =?utf-8?B?dGtJMW9UOTIvZjZNMlpZLzF1SVJlR2wwSHJ0Ly93OXRPZzFPUURLTVZHWFdW?=
 =?utf-8?B?NitsTExnUzFtVCtiQVB3NXFidWd4VGhUc1dINlpxR0Q4YTU1SUFZNWdRRnc1?=
 =?utf-8?B?dG9NOGw2NjJYRTNQWjkrbFdMVHZTZVdjVWp2aWdnb2pJM3hTTGgvZWVPRXBY?=
 =?utf-8?B?elFocUorT0R2U1BCVTVCbmtZZ0xETnBGQWdrYnJ3UER4VmJkbVdaNjlBM3Jy?=
 =?utf-8?B?K0NZejQ4SjVWQXEwZXZlSlgxa1hSWnF4ZG9OeHdxdU90OXlXM2dIZ3JNM2Vu?=
 =?utf-8?B?QzlCU2NtZVFOVnprQWZqU1B6S2ZscFlHMlBjNnVMOXlMNFIyaGpld3kyTnZy?=
 =?utf-8?B?NzdVZ1RyK0pJdUMwUlN4bUcvdGxhQ0NDRXlMVkZ4YXMzVEl0VlpXUGYyVU53?=
 =?utf-8?B?bytkcFhMem1TWUN4NVFMbFBubXp6YkRUelZqSnY5R3VrOWZ5VjNRc09YdTVF?=
 =?utf-8?B?MVpqZTd2blAzSWVpazVmMlJEdzFKTEYyd1NMUm5FMzhFNkhsbjhkTklPd2Nr?=
 =?utf-8?B?TW5mT3BRbWNmU1FxQ0lFRFNYaXQyd1BjK3JhZDQrajBuNFdmM0YxY3JpZGlE?=
 =?utf-8?B?RmM1MVFiaDU4ekd5cG5KTnhyNnBIYWVrUVIvQm1BSU9ETnp5VmtOV3BHRFVX?=
 =?utf-8?B?dVYzOHpacG5qS0FQdk5rNjBac1ZHaU56cTUxc2R5VzU1dXIvaUdHL3pPVHdW?=
 =?utf-8?B?N3VFa1pPOGhKVXdmZmpQSW5aN3R1MHFmWHQ0UDRwckNVM1J4TGUrcTNJeUxH?=
 =?utf-8?B?MkVuMGpxamI5b0RmWlkwTEhlVUY3cnM3ejNxYUtuaC9uYXBpeE5ZQ0t4V3Fp?=
 =?utf-8?B?NU1LWG81cTI5RjdGbzBoclp5Kyt0Z2c1RjRQQUdzZ1ZXK3hhUkVoVW8vcjgy?=
 =?utf-8?B?VEdNVzVLZHRaejBKMnR1SktuSWdXdmdvMXB5bTdxcEdwVURKTXIwek9nL25Q?=
 =?utf-8?B?NktjUk53T0l0U0wzWXhwemd1Ymw5VXVTY05Fc2RHKythNE5teE1MNmY0UXFt?=
 =?utf-8?B?SjlpVkNrWm5oVVFrMjhOaEd4RlRGUHRZOE5sRUN4Y2p5UzROZ1pZVWtRQ0tE?=
 =?utf-8?B?S2N3ZEFHckdJMXJrOU9KMjVIZXBSVEJsUTZLWitPVmJBYU5HNisxSE5tRkdE?=
 =?utf-8?B?UlVUMDY1TTdHaHlZWTNjVk9xdGV1cGJsSGVYVlFnQyszbDZBdkdWTzFLamNY?=
 =?utf-8?B?YmoyWWZ5aXk2VVFWa0lQS25wUkJHa01BeUUrbzMvcTFUYXpQY3Mzb1Mzb1Mw?=
 =?utf-8?B?UGZYaU9odEpKcW5teHhUQ1c2ZnEyckk4ZTBlR3lsWHJDZnFjdXZ5TW9mRjl5?=
 =?utf-8?B?dVN1bXJybzdqM2Z6WE5uRVdlME9Sa09NSTVPVk5WQUx0Smc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZSZXRxMzAzQ09Kc1VzR2xmT0oxOVNweVBKME91emxzRlo0VllEUWJwSXJR?=
 =?utf-8?B?NlVaQWNoV01qMWtyS296ZitCd09zdmJxSU1WaDFNeVZreGlZcDh1ejB2Z2Vi?=
 =?utf-8?B?azFlcTc1Ni9mVC9GWE1oZGtQRjFxYVljS0ZFRmNGVjdFbmVnaEFIdUU4Vi8w?=
 =?utf-8?B?NzNnY3BlWFJLdWdlbGptR0xFTHdLb3pOTVBpRHVZZkZGSm9TcllxdDl1N0J5?=
 =?utf-8?B?eEFaNUlYMjVidlMyYmw5VU5BdVUwTldDQ29iSnVncnMyUmtzTUdZUjNDNFhh?=
 =?utf-8?B?b3czZjcyMmdqK0pVM1Zkcm9waFlEL1U0czM5dUhLWnFndGR1d2RZODBzZnRP?=
 =?utf-8?B?ZzZqTkdieFdZV2Qwc01Fb1JPdzVObnAwcTErbUYzbGx0NGkrTWVjNGNNWXhv?=
 =?utf-8?B?YVlweVpib0prZ2dua29FU1NTeWFPbG8xS251NUVYY3AwbzZPWmFwbXQwRUta?=
 =?utf-8?B?RjhJSWRvaWJiSGFyb3kxRWFRYnRHT0VETCtKRnpRRkVJN2l5UUtxNzJ4S016?=
 =?utf-8?B?RXR3RU9HN1lzTXNQdm5zT2NnaW84WFg2aytrMnVDMnVzQUl4ZFJ6WFp3YjR4?=
 =?utf-8?B?YU1wTStFVGxvTEVGYTFNeEJYRTlOQUpHTUtsOEg3cFppTWRMejRkUnltYXZ5?=
 =?utf-8?B?clVZTmVUUldCeUpRTnF1V0M1ZzdacXppMVdpQ2xLcXBtU2pFRzZMZ1JZNnhw?=
 =?utf-8?B?czI5WFkzRjRMeEVrRUhEK1ZpYWd3dGZqRnJWNDI1ZTAyU0RraFVKTDEvR28z?=
 =?utf-8?B?ajdHak1ldVQyemw1eXMrdThlTno3bUo2VVVOTHp5c3dyL2ZndUFneHNSdXpF?=
 =?utf-8?B?b2JuQzlhMTZzbC9vZ2h2R1RaNHgrbnRjNmt2WXh2Y0IvT21kSlZYc1U5VXNa?=
 =?utf-8?B?VGtnekxBT1VCMWhaNmVxdXp2eDBhMitWVXRhSWU0bC8zMnZGcUJzU013a3E1?=
 =?utf-8?B?aFlDUWdqeXNoajBrMFJ4NVJCNnh3WmZZUWZWRWhYSUN0c0Y1L0dwT1c4R09O?=
 =?utf-8?B?bGVRRjlObG1ST01zZWFhVjFWN3dPOWJHVVJLSjg4TEVoalZjR09kL2ZLY2pD?=
 =?utf-8?B?bzlKWFBuZXZVQlNVQjZXd2MwMG9SY0tCVkV0K2RFUHdPMXhPSmt1b09QMCsw?=
 =?utf-8?B?SmYyL1FLMWI5QVlqdGdXU3cvSFVOdzhWc3NsZm02RVNRVEVKSmtOWHRkUS81?=
 =?utf-8?B?TGsvNFpwMDlqZHYxSy9Bcm9JeU96YWlyQ0gyVFFsVzVBWU5OUUVwVU9kSDdw?=
 =?utf-8?B?OUFoUG53MzlLL1ZWZUFGMHdDd0lXd09zcHV2aStkYzl2dWtudWdUUGVBcWQr?=
 =?utf-8?B?SVptdDdaQjUvM3dZVmVNL211NTB1cUUxT2JHc2RVN1ZvdEFsSE5xQmgrSWp3?=
 =?utf-8?B?RDRFbTVjemZNVkJuMG00UEhrVldBcUVwQ2VkS3B1djJwYnJGb21TZzBBTWpz?=
 =?utf-8?B?ZFh3eXExcTUxc00yZzVKUHlqUS80Nm9mTTN0bGw1d2UwMFdjSHp0eVF0WEFN?=
 =?utf-8?B?cFliRGJ6SnRDWVEzYXJzK1RYbDRuWU5aQ3ZJVEQ5QWFlTkFCWDFYRW16NGxC?=
 =?utf-8?B?eDFkaGp5T1VBUWVkODh6Z0dDeUY0MDFxTEtkWTJvM2RPNTI4cHZHVW1DSUZx?=
 =?utf-8?B?Q0NZcjU1UHNtaFZra3Y4anFIU3dwZ0pCQmsyMUV5bkFwaGFmRjBxNGRvRTVU?=
 =?utf-8?B?OEY0Vjc3b241TEdLRFhpT1BabEVjL2VZVzZPdWtQNm54bzNPM291OWFaOS9Q?=
 =?utf-8?B?TzEvSWF1ZUdGM1pXY0NtN25XZU1qd09yM3lLRmd4MHNOVXpHWnZ6eXVQZWw0?=
 =?utf-8?B?d1hzeDZXNkhITjRacGxiUkhmNmpBVW11bklGOGF1ZW5LWnFPRkJjNHdZV0pS?=
 =?utf-8?B?UXQvU0ZGK1d5ckFHSzhwWUdGZ1BjczJjcDJlMXovVUxVZkpOSlpUVEZObi9H?=
 =?utf-8?B?OEVCZG81TU9GZ1B6M3M4OFJ4andGMmU0V0U4cWdsYUZBRUtiWHcvc1JTN3J4?=
 =?utf-8?B?aTN6N2FRMnA0bk05MWZkSHpIWjV6RVhqQklRb1pnQVFvVmx4OExlVGZRUVNL?=
 =?utf-8?B?ZnZJUmwrUW40L0hNNk15Q3FvWkxGWG5DdE4wU0hDMDBWaEFjVHNabkZZcTl0?=
 =?utf-8?Q?9hB0YvnQbIuxVlZg4CSA1Kchd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6750c744-e610-4099-1f3e-08dcd8190a17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 19:35:23.7930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gRCBvQ9cEodzeJXxQiYIOLhLXR5/ElMNjj8/JbMPCCL6GB5aQ0ZMV53EzmiPPUPtcCsJ3NfZHVOZQmQs5FCtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10764
Cc: imx@lists.linux.dev, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com,
 Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net] net: stmmac: dwmac4: extend timeout
	for VLAN Tag register busy bit check
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

SW5jcmVhc2UgdGhlIHRpbWVvdXQgZm9yIGNoZWNraW5nIHRoZSBidXN5IGJpdCBvZiB0aGUgVkxB
TiBUYWcgcmVnaXN0ZXIKZnJvbSAxMMK1cyB0byA1MDBtcy4gVGhpcyBjaGFuZ2UgaXMgbmVjZXNz
YXJ5IHRvIGFjY29tbW9kYXRlIHNjZW5hcmlvcwp3aGVyZSBFbmVyZ3kgRWZmaWNpZW50IEV0aGVy
bmV0IChFRUUpIGlzIGVuYWJsZWQuCgpPdmVybmlnaHQgdGVzdGluZyByZXZlYWxlZCB0aGF0IHdo
ZW4gRUVFIGlzIGFjdGl2ZSwgdGhlIGJ1c3kgYml0IGNhbgpyZW1haW4gc2V0IGZvciB1cCB0byBh
cHByb3hpbWF0ZWx5IDMwMG1zLiBUaGUgbmV3IDUwMG1zIHRpbWVvdXQgcHJvdmlkZXMKYSBzYWZl
dHkgbWFyZ2luLgoKRml4ZXM6IGVkNjQ2MzliYzFlMCAoIm5ldDogc3RtbWFjOiBBZGQgc3VwcG9y
dCBmb3IgVkxBTiBSeCBmaWx0ZXJpbmciKQpTaWduZWQtb2ZmLWJ5OiBTaGVud2VpIFdhbmcgPHNo
ZW53ZWkud2FuZ0BueHAuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKIC0gcmVwbGFjZSB0aGUgdWRl
bGF5IHdpdGggcmVhZGxfcG9sbF90aW1lb3V0IHBlciBTaW1vbidzIHJldmlldy4KCi0tLQogZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYyB8IDE0ICsrKysr
KystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
NF9jb3JlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfY29y
ZS5jCmluZGV4IGExODU4ZjA4M2VlZi4uYTBjZmEyZWFlYmI0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfY29yZS5jCisrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMKQEAgLTE0LDYgKzE0LDcg
QEAKICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvZXRodG9vbC5oPgog
I2luY2x1ZGUgPGxpbnV4L2lvLmg+CisjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+CiAjaW5jbHVk
ZSAic3RtbWFjLmgiCiAjaW5jbHVkZSAic3RtbWFjX3Bjcy5oIgogI2luY2x1ZGUgImR3bWFjNC5o
IgpAQCAtNDcxLDcgKzQ3Miw3IEBAIHN0YXRpYyBpbnQgZHdtYWM0X3dyaXRlX3ZsYW5fZmlsdGVy
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCiAJCQkJICAgIHU4IGluZGV4LCB1MzIgZGF0YSkKIHsK
IAl2b2lkIF9faW9tZW0gKmlvYWRkciA9ICh2b2lkIF9faW9tZW0gKilkZXYtPmJhc2VfYWRkcjsK
LQlpbnQgaSwgdGltZW91dCA9IDEwOworCWludCByZXQsIHRpbWVvdXQgPSA1MDAwMDA7IC8vNTAw
bXMKIAl1MzIgdmFsOwoKIAlpZiAoaW5kZXggPj0gaHctPm51bV92bGFuKQpAQCAtNDg3LDEyICs0
ODgsMTEgQEAgc3RhdGljIGludCBkd21hYzRfd3JpdGVfdmxhbl9maWx0ZXIoc3RydWN0IG5ldF9k
ZXZpY2UgKmRldiwKCiAJd3JpdGVsKHZhbCwgaW9hZGRyICsgR01BQ19WTEFOX1RBRyk7CgotCWZv
ciAoaSA9IDA7IGkgPCB0aW1lb3V0OyBpKyspIHsKLQkJdmFsID0gcmVhZGwoaW9hZGRyICsgR01B
Q19WTEFOX1RBRyk7Ci0JCWlmICghKHZhbCAmIEdNQUNfVkxBTl9UQUdfQ1RSTF9PQikpCi0JCQly
ZXR1cm4gMDsKLQkJdWRlbGF5KDEpOwotCX0KKwlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXQoaW9h
ZGRyICsgR01BQ19WTEFOX1RBRywgdmFsLAorCQkJCSAhKHZhbCAmIEdNQUNfVkxBTl9UQUdfQ1RS
TF9PQiksCisJCQkJIDEwMDAsIHRpbWVvdXQpOworCWlmICghcmV0KQorCQlyZXR1cm4gMDsKCiAJ
bmV0ZGV2X2VycihkZXYsICJUaW1lb3V0IGFjY2Vzc2luZyBNQUNfVkxBTl9UYWdfRmlsdGVyXG4i
KTsKCi0tCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
