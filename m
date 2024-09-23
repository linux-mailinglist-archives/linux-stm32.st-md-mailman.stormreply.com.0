Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9997F1AF
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 22:26:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC330C78006;
	Mon, 23 Sep 2024 20:26:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8413C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 20:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAUyXT8L9i1Jz3ePD1hk0maJ6/s7gOU4r/54ww+AhWGM0mHOByQ6k6qU29cSEco78yMyQXgz7QLTupdiHZ9WgV8LzUm9Pue0FdQrD0JmaT8moOHAVPedNqX+0n9A0Dj8AeOQrefrQGBRxiCSo6A+iGuzk8adz1XcfzrR+DmwFEKlKywgsrWlU35ZKzmj3saXSiU7vO1vn78nXX2TCuPyXAmZqxyDuH2GQaNIEigcPhG5lh6P6QijDOCtquynj/WH9u6nl0y12RaUNk0hjdMKpBcZLzlmbOL7P8GQUZ6KZaOdoUrtgh3nJO9XaeQpkRK+rHUvdWeQVBSQ8pnZbagd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsFWuFPHEuGXtwrNoNYoFEcb8XyclW9WHWBmuh889K8=;
 b=S1WZK+wMkzbKpWXGhRHLOQjSbWmaGdpiLj0gavetZEI1yq2JU//qiJUn13RDGBkJ8FqTOoBK2FmEaDtmB4SEerh/8AE00vf8Ae1sFcuPNNt24mQGZvcafRAKpI7E0V7O8fpwWjwiNYK1LVuXdEW0yJLIYSUpXyoiH0ghwB3d8QJF0Se98HKhqLkL256UNeVxIKS6hJpEDSPTcSUDVrtOrBIMtMEmRS/KpZaO1yUEPr0yO9GEqffvke78kYJHtW+iicas3skxJwBqSo/yqQBkvcBRsZn/RIsnH/PPpUEouk1kDiHKiDglzLfiKKu5zU2/pGrh8tr6i2DlJJsrrEHEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsFWuFPHEuGXtwrNoNYoFEcb8XyclW9WHWBmuh889K8=;
 b=RotayVLB4SVNYB/kuyr16U/5nggfchlZDwoAh3A6I4d96JUd8fUxbmUljkUPNVkzVDEJ7cz3P5vQLgShF2jHQDh/6/8doTY+zRKqp0NTB2rDiqSJLT51RIS8tw3XMKCZdyCgZEuJdrZyNkvonmOA+AYcF08VRSIfxPOP+gyIsnwneE5s/hXmQrPtbyAEj6IA9i8NS4x2eUoUSASwcUP+guAgd4dPILFNeIQyR4EC6LOwKJghtq+0OEg9cu1hbFRSa0e442UUY1GNTSQjSd0Q2/PmusgSCFcIm/VIGN8inWViKWoFoF7CyJ4UFrzZ1Wr5uQXxmOtoVdF3b+vwMZ6Rxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 20:26:24 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%3]) with mapi id 15.20.7939.022; Mon, 23 Sep 2024
 20:26:24 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, horms@kernel.org
Date: Mon, 23 Sep 2024 15:26:02 -0500
Message-Id: <20240923202602.506066-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: d48173f2-e8f1-4a24-d860-08dcdc0dfe8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmtENVdHUDNYcGtrMExTK0JYeFdoVzc1Ynh1RzZWeHRickxQaUNRM29vMFdZ?=
 =?utf-8?B?Zlk2SzEvWFhFbENOOEt5eTJSVGthT0lISXVHZ242TEl5bk03S2N3dXlIcisw?=
 =?utf-8?B?M1NjZzdqZWRzQVZVVGJ6YzhIQTFnblZjdFIwbEJaaTVrekdSWWdlSU92SVd6?=
 =?utf-8?B?RVlDK3FsQ2pjNEIxKzJTbEdSWWo5OUpUcWcwMlh3cFdKQTZrcU1zY1FDcklj?=
 =?utf-8?B?c3NTbm1FN3ZBV0VuMHBQdHhCNzYvVUkwaUdITzJoRzVWaUZXUm0vOW9ZblBN?=
 =?utf-8?B?OWVoNDgzWlBaRDVocUJSNFNNd2x3d0NWK01PSmFNakdwSW5CZWV1ZGRLbUgz?=
 =?utf-8?B?YVFHRUJDLzZDT3JYVXN4ZkRpazJjNGVUWmkvd3JsQlM3SXRBRy9WMDNZb1VI?=
 =?utf-8?B?STdPZ25jby9xc3o5b0Q1SEt0UEpnRmpnU0tRSDJROXVuWGFaNmRYTmNMRzlW?=
 =?utf-8?B?WHZkNDlVcENsWWVNMFBTck9XR3puZjU4eUpSVG10VGQ0cmwzbytLV0YvRURj?=
 =?utf-8?B?R1hyb0tyK085OFpMc2dWQ285TmRpWWhlRXV4VjZjWG5wV1dNdzVwMHlCQlQv?=
 =?utf-8?B?OUlYNCs2Q3hXSkptNzQrZGdZWkxlT0dDZjBsWlkxNjNydXdkTCtETGZWRGpL?=
 =?utf-8?B?UFo1Q2lqM2JTM0ZDUEUyd3Y0eU9IWVRaRXAxZkYwVVZaMmoyc1hlRDFKUmtt?=
 =?utf-8?B?RER5ZzNWTlo5U21BaVJKVWFoeEZDaWUvKy9FNU9wQlV4Wml3M09obG5IdjYw?=
 =?utf-8?B?b0dXYXlYMis2VkZjNGRNZnF3RXJzbG5wVnEycXdVd21sY2N5d3lwTzRQY1dE?=
 =?utf-8?B?U1VBZ1JCdlQyTEcwTUt4KzNMUUEwYTF6VGZKOElEQkhZN2E0a0R3T3hGUnFq?=
 =?utf-8?B?am5LelJoU0hxdHlyTDY1ckZGRmxpb1BKdmFjbFVTQWd6eWgycmx3OGU0NDQx?=
 =?utf-8?B?dEtNUFRldnduakJ1bzFQcWRuRWFMVzRGS0dmNThQZlZaekJqNlpsRS9aYjcv?=
 =?utf-8?B?dDNZUlE4b3NTSEhzenNBOGthY3llWHd2V1ZuV3EzWlZrdUxneVBUYTFDS3Jo?=
 =?utf-8?B?QktnT1M1SnZPL05hWXpQdkdoS21nQysvV3hPUTBhQWpuZTZ1SkF4dGhDS0lx?=
 =?utf-8?B?VHQ1SUR1TjI5bkN0TzIrVFhwMWRmVFBBYzZQQnhDQkxzY29PTTZuU0dFM2tG?=
 =?utf-8?B?cFd6MlJuRmlZZEpWMnp2UXdLUWVscytRZFNtMXppOTIxbGk1TVc1V2pSOHhy?=
 =?utf-8?B?SFY5TnMrNDh6ZTRvR3YxRDVQYXhGUU9mNFAvVm5RTWo3SThwQmgvQ1FuQXZT?=
 =?utf-8?B?VzBHYUF6RXh3TkhvcW1rZTJvdnF3SHEyN2RHYkhuQnFHQlhvRmJJRHBScXpY?=
 =?utf-8?B?QU41RlhSc0owYUV2WUlCcDl5WTdnbjc4U05HQXE0ckJWMWFjNGdtY1h4WFpR?=
 =?utf-8?B?RE01SW56YnZaN1FQTFhYZUlIV3UzUDR3eDQrcm5kMDJkNERJV0Qxbm9vNmNP?=
 =?utf-8?B?NWc1dWw0Nk9ma3pHbjhQRGZ4VE4wdUFnM3lKcEtEUktaNERLV05IS2tXcHhv?=
 =?utf-8?B?KysxeFRhV0NUUVZVYXByMWpPZlpFdHlDNExldUVZQ0ZvUXZKYzVSbHA0bEl4?=
 =?utf-8?B?SzZBRDZjL1dEMm1mOFNiVDBtZVJ0RUJ6SGx4NkVka0xUeHVQYlp3THZYaUZh?=
 =?utf-8?B?TWhGYmJHSkErQ0dDRTlKT1JMeTd5ZVhReXBDdXhjUGhaUlFmRGNCNjhzT2R5?=
 =?utf-8?B?dUJ1RU9jRk84QjN3bkptSnFuRHdCRjk0RmRFZWpBY0tPZFZOZ0F0U3Y0aVRC?=
 =?utf-8?B?YTRIUDFoMXRReHBGOEYxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09KdTl2ZzV3cEZxMHh0eG1YUWxSYUpQdEg2NXpnQ1drRVhmYktVNHRGODZj?=
 =?utf-8?B?bmgvSXhjcEVvNUlSOWpucEJtM0kxbS8vdnNtN2kzSm5uUWtPQ2VwNW5DczVR?=
 =?utf-8?B?a0xQV0djTGZUa0hpL2RydVFuM3FOUXJTK0hVUWhXUXB3YWdxNmFPV21PQUNQ?=
 =?utf-8?B?cis5RnYxVG9pL1VncTNXWWtnYStjWWdoM2JISjU4bk9TTXVkQm44eDBkdHNl?=
 =?utf-8?B?MWpnd1BoT2ErTk1hMlNKMG13Mi9RK0RVdWxZRklaTXF2Q2ZNVHZIeXZtZjRU?=
 =?utf-8?B?WmNpY3ZWRmZmNlE2dnZxZ1Bhcmc4eCszYmVSU2V5SkhzZTBTVGNIZ3VmQnow?=
 =?utf-8?B?S25WK011RlhLN2lKT05UU2tSbXNDY0dTcDczUmVMaEVrRUhtS0QyZy8yc3NJ?=
 =?utf-8?B?RXpEWUc4dEhkRm9relNiVTl3cGYrdG91ZEg3enF3RDdDVXU4ZnRtOVRhOHI2?=
 =?utf-8?B?ejc0ZE1EZzlVbHJWWGhLbDkzQ3FjQUo0RmtVZHdMeVArZWwzN2VtMEhONGJM?=
 =?utf-8?B?T1dSVU9HUTkzdE0xK1FxQ2wrQ2JLMVBjZmNtZUptQmxXeVRNWlZCK3M3SUt3?=
 =?utf-8?B?MlQ1ZVFzRU1CY2lCcElXS0ZFVUZWUDg2YWRadmJMeGpSMURDM05wWGtpR1gv?=
 =?utf-8?B?STl3WGdpSk1ncmNoOEpaZWx5VW9NZkR4bS85QVQ3K3F0WkdaVFRFaXRrc0Q0?=
 =?utf-8?B?aUZIR1JZSmlSNGpBRTlxUFhqYVl0Y01WRzE3QmRZSVVqSThtenkrUnpZdUY0?=
 =?utf-8?B?SGk5UktNQVl6Z0hUakRodE95OFlmcFdIRDlzZnhrLzByU1RzOTM1TitsS0J2?=
 =?utf-8?B?eDJqcG5admpiZmcwSjYxektTK0JDZ3VrbWV0ZEZzM1MxampGODY1ZE1OU2x5?=
 =?utf-8?B?SW52RUNMM3ppQ0NCT2RJLzNqOUJWNDMvKzRTNFU4SFFDWldvQU43RDJjeW01?=
 =?utf-8?B?UThvUUF6SXM3dTJtdFJ3Z01WdUNKOVRmQ28xMno0Z3BudGdsKyswNDdtOFJ5?=
 =?utf-8?B?SnNRV1RlWnhKRTcwb2JXUkJQcGFOMHowcDI3bHB4WUtHZnNzYWVLc25VMlQ2?=
 =?utf-8?B?L0JtRG51eWNFcVgwYnFndVVxWTY2SnU0U29JYXdRQWRVdE9vNGxtcC9zdG5l?=
 =?utf-8?B?VGN1VmlvV2lzNXpNZDR5bndYTWREVVJaUzR3NkdyQzJqdnFPUGtmbnM1Y1pM?=
 =?utf-8?B?MDk0cEE5N3BaektQZ2xFZWprNHViemxsWlN3YXlMenhMTEhpNzgrWms1Yzhl?=
 =?utf-8?B?by9odDZ2K01IVkJDYVhJTTJ1Um9PQjB6UStaRnR1RDdsaG9BZ24vWGx6OHI4?=
 =?utf-8?B?YVBmdThkbVZlb0ppUnl2SWUwYUV0TlB5VnJQT1gwN1NYUStpY2ZYakx2RkVU?=
 =?utf-8?B?YzFhQ1d5ajkzTko1TEtJa1ptZmt3aGJ1cGJLcERuaWZzeDhwOVVMN3NGZjBm?=
 =?utf-8?B?TlhlM2ZkeVVEdWNlVFdjUnBiVTVFV29xQStobGx3V004djc3WDI1VTh5c2c4?=
 =?utf-8?B?OFFRRmVRN2RVVnFCMFVDelNvWklhdTMxb1ZDQW4vV2orNlA2RHYwZHdwd2dE?=
 =?utf-8?B?UTBrcnFQRWwrSkcvY2g5RDI0TVNQc3B1WHBoQjE0cThGK0tuaDQxQTUwV1ZZ?=
 =?utf-8?B?MjNLdzAyTW4yTjFzTVJBNDVwS3dyeG04UlZrcjFVa1ByZWZkc3RFY2pjVC9D?=
 =?utf-8?B?YUFlNXlkNG1jTVZBUU9tMjIxVkdwMXc5LzI3N09JdU1OaFViSlpjWG9SdnRD?=
 =?utf-8?B?a28vSlI2WmhlRlRSelUzTTV2V0RxZEFMYkZHeFYrOWtoeGNLYjh3Nlgwazkv?=
 =?utf-8?B?aXRWMm80aUcyRzRvVy9Kb1d5c3FEWkJJTEVqVVVhTVBUMGlVU2oyZVluQlhC?=
 =?utf-8?B?VE96Z1hPdzZLVW1uZVNPNXBJeVlqTDRJcExLR3JoRklQVmVCZmRaYVptUkc0?=
 =?utf-8?B?MHRiNm9qanFlbHNRblJNaUwzSTZ1Zk02T1ZWQjRaZ3Vub3orVmgvSDdWNlc1?=
 =?utf-8?B?cDkzdFEvRTgway9pR2UxeHJyR1Njb2hJZ0VCTUR6U2haWjZkZWNRajlzN1Vp?=
 =?utf-8?B?dGwxV2I5ejNSMW02YXhlTEJWYVlJdGNrTlBwR1kzWWl0dmNuVE9KbnowQnJY?=
 =?utf-8?Q?gf/z8PlZ34eHVtAwGFGyYWuH9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48173f2-e8f1-4a24-d860-08dcdc0dfe8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 20:26:24.4125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grdxQdAoLRCaQXyIhHdIod67qvVMk/rZ4coJPzYXhbku9qQGm+yyfy/lRY8kmkqPXteP14ZHat0ZmZBn0jvSNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567
Cc: imx@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-imx@nxp.com, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 net] net: stmmac: dwmac4: extend timeout
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
ZW53ZWkud2FuZ0BueHAuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPgpSZXZpZXdlZC1ieTogU2VyZ2UgU2VtaW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPgot
LS0KQ2hhbmdlcyBpbiBWMzoKIC0gcmUtb3JnIHRoZSBlcnJvci1jaGVjayBmbG93IHBlciBTZXJn
ZSdzIHJldmlldy4KCkNoYW5nZXMgaW4gdjI6CiAtIHJlcGxhY2UgdGhlIHVkZWxheSB3aXRoIHJl
YWRsX3BvbGxfdGltZW91dCBwZXIgU2ltb24ncyByZXZpZXcuCgotLS0KIC4uLi9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYyAgfCAxOCArKysrKysrKystLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMKaW5kZXgg
YTE4NThmMDgzZWVmLi4wZDI3ZGQ3MWI0M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYwpAQCAtMTQsNiArMTQsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9ldGh0b29sLmg+CiAjaW5jbHVkZSA8
bGludXgvaW8uaD4KKyNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KICNpbmNsdWRlICJzdG1tYWMu
aCIKICNpbmNsdWRlICJzdG1tYWNfcGNzLmgiCiAjaW5jbHVkZSAiZHdtYWM0LmgiCkBAIC00NzEs
NyArNDcyLDcgQEAgc3RhdGljIGludCBkd21hYzRfd3JpdGVfdmxhbl9maWx0ZXIoc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwKIAkJCQkgICAgdTggaW5kZXgsIHUzMiBkYXRhKQogewogCXZvaWQgX19p
b21lbSAqaW9hZGRyID0gKHZvaWQgX19pb21lbSAqKWRldi0+YmFzZV9hZGRyOwotCWludCBpLCB0
aW1lb3V0ID0gMTA7CisJaW50IHJldDsKIAl1MzIgdmFsOwoKIAlpZiAoaW5kZXggPj0gaHctPm51
bV92bGFuKQpAQCAtNDg3LDE2ICs0ODgsMTUgQEAgc3RhdGljIGludCBkd21hYzRfd3JpdGVfdmxh
bl9maWx0ZXIoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKCiAJd3JpdGVsKHZhbCwgaW9hZGRyICsg
R01BQ19WTEFOX1RBRyk7CgotCWZvciAoaSA9IDA7IGkgPCB0aW1lb3V0OyBpKyspIHsKLQkJdmFs
ID0gcmVhZGwoaW9hZGRyICsgR01BQ19WTEFOX1RBRyk7Ci0JCWlmICghKHZhbCAmIEdNQUNfVkxB
Tl9UQUdfQ1RSTF9PQikpCi0JCQlyZXR1cm4gMDsKLQkJdWRlbGF5KDEpOworCXJldCA9IHJlYWRs
X3BvbGxfdGltZW91dChpb2FkZHIgKyBHTUFDX1ZMQU5fVEFHLCB2YWwsCisJCQkJICEodmFsICYg
R01BQ19WTEFOX1RBR19DVFJMX09CKSwKKwkJCQkgMTAwMCwgNTAwMDAwKTsgLy9UaW1lb3V0IDUw
MG1zCisJaWYgKHJldCkgeworCQluZXRkZXZfZXJyKGRldiwgIlRpbWVvdXQgYWNjZXNzaW5nIE1B
Q19WTEFOX1RhZ19GaWx0ZXJcbiIpOworCQlyZXR1cm4gLUVCVVNZOwogCX0KCi0JbmV0ZGV2X2Vy
cihkZXYsICJUaW1lb3V0IGFjY2Vzc2luZyBNQUNfVkxBTl9UYWdfRmlsdGVyXG4iKTsKLQotCXJl
dHVybiAtRUJVU1k7CisJcmV0dXJuIDA7CiB9Cgogc3RhdGljIGludCBkd21hYzRfYWRkX2h3X3Zs
YW5fcnhfZmx0cihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAotLQoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
