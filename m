Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AF984C73
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Sep 2024 22:55:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C73AC78002;
	Tue, 24 Sep 2024 20:55:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D28F1C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2024 20:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiVrCYVoru4Hft3M7vCgExIRuQ7IjtwzZZZfT//wpTTHFstnDa7JJ15BCd+RI5iwyZmWihkfTCNT6MKt5TUM46gqy/aFnSmLopE2PMwnLwDl0K78wuoIKVaHoqX+OpynSqTtEQ3fgpdrUf3hRoWzHGqGKm+/lNnld0OrKsigX5UXBWmV1KByvaAHjYcSbkXf/zEkFi6dcZ4GX+3CeUI1L5MeH3Itd+cZDTCy9RQSDddjF1kwntuZmj4egIfOMNhVnJt1QLrURaleaqxxugl+c7vLI+YKaRiOmZSaa9W/4Ewra2ubZqPQOf5BRonl8+2F+CwtVKbq97vZGu46+1OnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tra+UPZqQsNzz/9oVTpxv2ung86t+AcusOp7s59Aq5M=;
 b=aSBJFGJt1C33h426UQd85EcGK/02lh6n4OyTswXoJ1l5ww7HgNKYIdj2nqyNp9saIjoR2f3gG/a47VHiO8Q4BNJ3HaztGAyLNV+D9PzTyMfMAdYvaGcCZzHJftAV6EM+BgbWJFBAjaLLX22NhAtWsIrY8B6gyTwwJpJxHn18L34f3HB36cgipd6F8fiyIsVl2TwsjrB+i6eV5t0I5Ciejx9qYnEdesosYwu9JsL9QbkznsxRPcWEjh/ssXpOXh2LDkvRzjA4emgJ8M5diLPKNQXQlCcDU2Hl6sOPBC/CJIRtVedDVpx/ejHAtnYA/j1LArDPoUK1DJX+h7HMhxivFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tra+UPZqQsNzz/9oVTpxv2ung86t+AcusOp7s59Aq5M=;
 b=Yuv55yjEFzPDkKNcS+sQ4SKK5SIpMkaEZRf+LdBwRLAVu0pqnFNGlL44xKaOIAqOpE6JmWRdqBBjLuxaMASX/HuxE+c4viWvA7ycZE/qjj1rJlr2hf61ZsZnRJjTO601g9ZXf/ATrlT0VmCDygUOYESSfpiB8DtRu6VUC3ktwKkSVYtOz3jvj0t+neeNZslgEbgPZBgwTb2ZVCQDmlB+X/JBRGfZgkLRdtboVleWJJvclGj1gMU1i/ouWdm6mLBDrKzNI22f28pFzncoyIZTF4xndm20IgWu4fitEo7GxxnX0X1KXcHv/0xYI0ddBtHtpjyn4zhmb+qbQpoo/QJnpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 20:54:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%3]) with mapi id 15.20.7939.022; Tue, 24 Sep 2024
 20:54:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, horms@kernel.org
Date: Tue, 24 Sep 2024 15:54:24 -0500
Message-Id: <20240924205424.573913-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN6PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:805:66::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: eeeb987b-58d9-4f17-a0b9-08dcdcdb21f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K25PWEVuVHhGOEw2dEtvTUFBNzdQekJhcUZENXM2eVkwU2c4QmFSMVE0cldq?=
 =?utf-8?B?K0pidFN1OVNJTzk4WjNIajRlaEprbkdQRXNtQzR3QXB2aStkdGRNNk5MMzYy?=
 =?utf-8?B?UFBHQjFtNHp2U21nNnV4dDhPR2FRaFQzWGlvRzZvSWM5bVZJSTdoT1IrR0Nt?=
 =?utf-8?B?OXZYVklsLzlhV25YQ0psZXN4b0R6aDhnMlBFZnhHVVl3eGtmcjZvNzl5T1cx?=
 =?utf-8?B?WDB3WXZMQ3hpdmhiOEsyeC94VWFaMUYwaHQ0cmJYVDRxdmRBYUZkNmVRbTBh?=
 =?utf-8?B?TW8rb0RBY0dybEpjSExxVGlYZ2F6anl3eEtCWUdaZDJ0d3dqQnF4NHNsZmN0?=
 =?utf-8?B?MXdVcFdiS25sSXNCWXNOSWk1alA4VklYbFRQTXVmc2lnYkk2ckZKYm9Ibm5u?=
 =?utf-8?B?N253WXlYeHNsbTNYSmcvQ2syUW9BU3R0WnFZV2R4QzROdEIrdUtYcWd6MnNl?=
 =?utf-8?B?eGdpOEhvR01pVm5vc0tFRUFlQjlnWVZaWXdoOEpuS1ZUNXNHSjBURVVlM2dp?=
 =?utf-8?B?MzZ1WUxuUjEvVjMxTzBFRjNMTnZFS3A3dTJuUzVqYkV4eUpFRjUwNGV3cnNv?=
 =?utf-8?B?M2pKN1AwdWtiVkxVRDBmQXdOa2JnZG5pL3RZWVJZNDlpLy9CakRPaERSb1NR?=
 =?utf-8?B?VWV4UDVmTzZQb2NDak9IM2pEQkIvRUpBN3N1UmdKcmpFSWxCeFhVUGFWcFAy?=
 =?utf-8?B?emhrVW1kK3pYQ0w1NEoxdWVDR1dwV1NBU3JJSEhYNmkrSDVYaWpEOWtCaVZN?=
 =?utf-8?B?MFZJdlk0TmhoQ1hOUTZ3RnB3UDgrNkFZSm5Edzhzd0cvLysrQ1JQcG92Tkdk?=
 =?utf-8?B?VTUrbk0ya3Q2dHo3QlNyaksrc3g5bG1VeCsyNUlYVERQRlNQeUNBK3lYYitv?=
 =?utf-8?B?b3F3Q05ZSVVsWUZheVVibFFPamJ4bkJTYWNiUm92TmZRTk1nYldnYnpQSDlL?=
 =?utf-8?B?NWZIUFFYVzZlV1dVYTBaMnZteHJEZ2ZRT2tpMHAybVJkbUFJN1VzWlpMYU1r?=
 =?utf-8?B?VVQvU2VwQWRmV1EvOFU5TFpWeU5TbzRQaU83OGZ0aFBnNWFBUk0zeU54WDlN?=
 =?utf-8?B?cUQ1d3FrRXFBQ3oycC9SQm5jVmxwMFJIeU1KY0lOME1XTG9EeGVFL2p4a3A0?=
 =?utf-8?B?TDMrRFg3azBtYnRLTnlrQUZlRUFEc0d2QXJzWW90bzdMSWQ2SFBDN2lmUnlQ?=
 =?utf-8?B?akM4V0Q2VWdZdnZwQmpYeHFCLzVYUTdCMzFJVTc4cm5ZWDZualh3Q0NKL1BZ?=
 =?utf-8?B?WXJXMVJuRTAyQmp6ci8xQlAvMDRsWDZvL2NYUlRDZDFldmFnYTlnZG9GSTN2?=
 =?utf-8?B?WktnZEltL0V0TGhTUDBOWW96aFJwWS9ORFdKN0RIeEZVajRjVGVqaTJmdjBa?=
 =?utf-8?B?VEdCcytoYU1Ub3BHQmtOVXRLcVo2T0xZQXRyMEZjTmV0NjRxMndYTVJtYzZX?=
 =?utf-8?B?dFY4dGhFN2w3VzY3RWFENkY0allKTytYNERnQklVWmxQL1ZTWlA0bTFCOUtl?=
 =?utf-8?B?SlZxK2ZxR1pmMVJFVDg5dmRYaHAydjZESjR3QU93bk5aK3dLRGtkSHJFZDdM?=
 =?utf-8?B?bE9Oa1d1RjZXTFdKcGxIa3ZqcnQ3WnduZmtPWVhLRldteVhQRzFSLzUvcytF?=
 =?utf-8?B?c0pqWHMzQlVJV0JaOVZTRlgzR1QzMGIzZUNyWDByNTdWVEhhdFVNdlp3b3Ju?=
 =?utf-8?B?N1RXTGZYNUdzUjI3OUVpSFhROSttV0Y5WmpYRGRpWUdqbktBb3RmRXB6ak1p?=
 =?utf-8?B?V2VlanNTY0RLNS9NY1A3RHRvSHVNVVczRHljMVViMzNQejNYTHhmM2ZNUmdx?=
 =?utf-8?B?ZWl0cE5iMGpZS1ExSDNjZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFhM1EvSkllZGk0SkVEK1dmMWRzOGRNUDhVWjZRVm1tMFVPNmNRRkZpait3?=
 =?utf-8?B?dFQ0clpxSTNmSnVDb3REUm9ubmx6azI2R3F0RHIzOGltWitTcFlGVksxTmti?=
 =?utf-8?B?K1hsQW1DbDRya0N6UVJ6aHE4UW9Qb2xrNUQreHNHY1RMVjdROHhrckxFQnFr?=
 =?utf-8?B?SE1SQWlmZDNWaGVDTjRLUU0yNVljZDVYSzVWMlJvY1E0UEs1R0VOeWFneXFO?=
 =?utf-8?B?QTV3Z0MwUjRMTXhkNmVZdTkxTG9kdmhScGE0Y2RwdFNNSjg5bFJtZG9PTjkw?=
 =?utf-8?B?dGhTM2JMeE1Gclgxa05UT2pNUmJjUkw0YnpZN2loak5vUTZGUUpPWWl5S290?=
 =?utf-8?B?V3JhM1RKQ3N5djkvQWJZUEtua3d4SVBsclJvUTJGbjY0VjdscVRqdTBScCth?=
 =?utf-8?B?aVBHL0ZXQ1RDLzRLM1hxT3RqQ1IwdkUyN1I0bWpzM2dyVTV6LzFCbXVjVDJr?=
 =?utf-8?B?MGJqT0Z0S2txR1M3b2l3TXRUZi9NL3ZxeS9yMnhBRC9lRXpOSUh0L0xWZGJ3?=
 =?utf-8?B?Ny9MUFFmNldLc3ZKelJYY3J2LysyYnJ0OHVZL0t6MTZpai9sT3BJR0tpSEs2?=
 =?utf-8?B?Mm0yM3NIQXMyLzJvdGYvQ3RLWmZaS3hiZXlJSjIzWmhoTHlZWUQ5cmFQOXRK?=
 =?utf-8?B?S1cwYWRGWlAxR0ZXWDdDWU5oSG9ZbWorNXA1SEo2eWlQdUttTFJsbTNKMnpR?=
 =?utf-8?B?UDk0YVM3b09ucnpTdFZpL29MdzU1c1A4dE5LelB0SWNMQ0dlb20wcFFDcmRk?=
 =?utf-8?B?N2RXU2N5WEVKL2lLY1FOUkdMUmt6bWE1dm0xMm9DNkYwNnZRMGpiTFN0ZG1q?=
 =?utf-8?B?RUo3VXIyRGpxZHdDM0FEMmdibjFSelBta25xUmlkU3QyV1hhc3JrTyt1Um9v?=
 =?utf-8?B?YmZNMUg5TFJxWXJUSGNBYlBYR0RESGdBVCt3R3NGenJ5cXhLTTVWN0VISVda?=
 =?utf-8?B?ZCtUa1JiZEJIVzNtYTlBbHRUeWNHVTdxREU2K09KckFCczZBMUllczNCdE9y?=
 =?utf-8?B?Lzc0SU9xNjliblNSb2dDR0pNYWhaUXh1T2NNbGVCaHg1UGh2SDBkWHE4UXRZ?=
 =?utf-8?B?cnZSTXdaQU02V1B1VXcxSGlmZG5Xb09mUDBCalpVckZ2eDMrNktyUWZzL2d5?=
 =?utf-8?B?ZTBiVUFKK1YwVWtaSGRUemU0VVBsQjkwME96NDRFUi9pZTVXVE5rcWhvMmFh?=
 =?utf-8?B?ZVFvdkpBdElONkszSyt1a3c5NGV4R1dpNkFkOEYrcHZ6dVJUQVArWnRyYWh4?=
 =?utf-8?B?eDEvNXFxUGE4cllBcUZZaVI3d2hEclFrQzgyZGxwNktkTnJwVFNMc3dOWVF0?=
 =?utf-8?B?TnRraGdSTXlHV3djcTlJSDBkOSsybU1MV1Q0QitvVVNENVRicHVIVzkxL0Nw?=
 =?utf-8?B?WlEvMUFWTGVZeVhCaEtPY1owekFjYVVOWEtsdFRnYTcwM25ZV2FPclBickJq?=
 =?utf-8?B?L2xqZVNpV2pmODV0MDJFQldtNVBJZG12akFkekFLcEVQT2JndmJlRXc0OWJz?=
 =?utf-8?B?RUVacURtQ2huQlRaN20wbEoyVkVUYmlrU1ZhMThVbFZ6bHlKMlZBdEdPZmJU?=
 =?utf-8?B?R3I0Sm5XYmFkOVVSR1ZwUHBMM0c1MHVjQkJYTHg2MlZLV05oMy81N3BpdEd3?=
 =?utf-8?B?c3BiUzdlNVRNa1d4aXNZLzBKMTRBb2VVem9EVzFhOEVvSDhuWnJza1FucUFW?=
 =?utf-8?B?bzEycGdrRXJtL293QitxbmZ5a1REQmZMWHUzN3l3RjJSTWFzR3l3UkU3bUlP?=
 =?utf-8?B?T3czcU5oMVc5d2VwalRyanpFWTVXWTdSQTdRaFNYWHBxNWdTYy9WdTBKVjZt?=
 =?utf-8?B?RHFHSW50VnVSRGJWOE1nRXl5RUltNlZURGozRlpPT0drZUhtYXlBUCszTVJN?=
 =?utf-8?B?RjZyZVB4YXFnMyt5dS90b3VDR1pjajhrblFvVy9mWmNJZGxFNyt0SDhVVm1j?=
 =?utf-8?B?N3QwWVhnVkdDNG1HakwwVXpvMlZIWEJjR0JrK1hoZEhRTnFOSDhJcUZhUXRz?=
 =?utf-8?B?eTBHdUdaZjVuSytndE5qWHlIanJ1TW5nN0ZXelJUcHNTdkF3ODZ5ajZDTVc5?=
 =?utf-8?B?c1RTVExHUTFoUlFwT3ZXZ0JVZy9ibytiRWFXV1Z4aVh2eDNXeDlrUU94RUlz?=
 =?utf-8?Q?fH2gB7yzr4sLi4C72dcVoY8tp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeeb987b-58d9-4f17-a0b9-08dcdcdb21f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:54:50.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+TJFphoI8TZDJQ9IIEeR7ewjweVYzGHUGL7sQis0W9g8DcnyR0R+DsJqXUARoWO4PvpYQElFu3+c1GDHimU0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384
Cc: imx@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-imx@nxp.com, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 net] net: stmmac: dwmac4: extend timeout
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
dCBmb3IgVkxBTiBSeCBmaWx0ZXJpbmciKQpSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJl
d0BsdW5uLmNoPgpTaWduZWQtb2ZmLWJ5OiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAu
Y29tPgotLS0KQ2hhbmdlcyBpbiBWNDoKIC0gZml4ZWQgdGhlIGNvbW1lbnRzIGFuZCBSLWIuCgpD
aGFuZ2VzIGluIFYzOgogLSByZS1vcmcgdGhlIGVycm9yLWNoZWNrIGZsb3cgcGVyIFNlcmdlJ3Mg
cmV2aWV3LgoKQ2hhbmdlcyBpbiB2MjoKIC0gcmVwbGFjZSB0aGUgdWRlbGF5IHdpdGggcmVhZGxf
cG9sbF90aW1lb3V0IHBlciBTaW1vbidzIHJldmlldy4KCi0tLQogLi4uL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYzRfY29yZS5jICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfY29yZS5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYwppbmRleCBhMTg1
OGYwODNlZWYuLmU2NWE2NTY2NmNjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWM0X2NvcmUuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYzRfY29yZS5jCkBAIC0xNCw2ICsxNCw3IEBACiAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L2V0aHRvb2wuaD4KICNpbmNsdWRlIDxsaW51
eC9pby5oPgorI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgogI2luY2x1ZGUgInN0bW1hYy5oIgog
I2luY2x1ZGUgInN0bW1hY19wY3MuaCIKICNpbmNsdWRlICJkd21hYzQuaCIKQEAgLTQ3MSw3ICs0
NzIsNyBAQCBzdGF0aWMgaW50IGR3bWFjNF93cml0ZV92bGFuX2ZpbHRlcihzdHJ1Y3QgbmV0X2Rl
dmljZSAqZGV2LAogCQkJCSAgICB1OCBpbmRleCwgdTMyIGRhdGEpCiB7CiAJdm9pZCBfX2lvbWVt
ICppb2FkZHIgPSAodm9pZCBfX2lvbWVtICopZGV2LT5iYXNlX2FkZHI7Ci0JaW50IGksIHRpbWVv
dXQgPSAxMDsKKwlpbnQgcmV0OwogCXUzMiB2YWw7CgogCWlmIChpbmRleCA+PSBody0+bnVtX3Zs
YW4pCkBAIC00ODcsMTYgKzQ4OCwxNSBAQCBzdGF0aWMgaW50IGR3bWFjNF93cml0ZV92bGFuX2Zp
bHRlcihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAoKIAl3cml0ZWwodmFsLCBpb2FkZHIgKyBHTUFD
X1ZMQU5fVEFHKTsKCi0JZm9yIChpID0gMDsgaSA8IHRpbWVvdXQ7IGkrKykgewotCQl2YWwgPSBy
ZWFkbChpb2FkZHIgKyBHTUFDX1ZMQU5fVEFHKTsKLQkJaWYgKCEodmFsICYgR01BQ19WTEFOX1RB
R19DVFJMX09CKSkKLQkJCXJldHVybiAwOwotCQl1ZGVsYXkoMSk7CisJcmV0ID0gcmVhZGxfcG9s
bF90aW1lb3V0KGlvYWRkciArIEdNQUNfVkxBTl9UQUcsIHZhbCwKKwkJCQkgISh2YWwgJiBHTUFD
X1ZMQU5fVEFHX0NUUkxfT0IpLAorCQkJCSAxMDAwLCA1MDAwMDApOworCWlmIChyZXQpIHsKKwkJ
bmV0ZGV2X2VycihkZXYsICJUaW1lb3V0IGFjY2Vzc2luZyBNQUNfVkxBTl9UYWdfRmlsdGVyXG4i
KTsKKwkJcmV0dXJuIC1FQlVTWTsKIAl9CgotCW5ldGRldl9lcnIoZGV2LCAiVGltZW91dCBhY2Nl
c3NpbmcgTUFDX1ZMQU5fVGFnX0ZpbHRlclxuIik7Ci0KLQlyZXR1cm4gLUVCVVNZOworCXJldHVy
biAwOwogfQoKIHN0YXRpYyBpbnQgZHdtYWM0X2FkZF9od192bGFuX3J4X2ZsdHIoc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwKLS0KMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
