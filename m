Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A8197B31A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Sep 2024 18:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02AB2C6DD72;
	Tue, 17 Sep 2024 16:42:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44922C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2024 16:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNWkGa6EB3wyKntziDr6at9jQ1GO5KAOQkqSNTOCKnuePGOBX2NHjzGlNtdLmP2bdO1xf6zg97oyAFSej9vHuWt5YxV9ADFPSeQDdBNHep/TVayoIUtdZ96tOWDaA2dgbnSf5UwRrRuaWBV1dRIQjwrO/KaUuLrI0XLwguerFfL6qlQwKECOSnVByZDMaA1xlqNwcMuC/YjW2D0kIuPzl6QkJF4TAQ5tltLEC+Us0afxZr6GgbTcEkIDmnGci840DU5fsjkI6S8TlqKDyK8UbsFNpK7LHzC0wTYWVgacUm4YzmeC8z1nJ7eLnDPk/MiwcJztIncIFic0mrgIWVab0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKw+6S7SzqON/bK+GxEyJcna+fdmcTcNSLZYUOnesQI=;
 b=TM4I5o68GlFc44FDRQhm3kdOwGUlQTSzIkQ8phQPZ1MGEO5Qi0YmUG6g2K2EJO2o9rGY5S9cC6YlxApDRs+UjDs3fUu1FlR97hxt2xNpPGlwaDmo0eVeuOJh11zTau24NCSCPzqVh+S3wtRhAIdpp6EYQTA8CUqUicFIejq/9lXr7xnMuwI26C5rpFM9JScOiwtLIwuu+M/XmGAXJq52Whi6X3lPFkOLNGr5eSYz2ROswKpNlb1ZY/9HqNm8ajn7pnbIDAjTHmMuICC1g609qKUu40XzKVLbr2K/9htMKz7rOWOBPpL7O8cS2x2GmF7alvSKC/ZQrOePy9DQjBmmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKw+6S7SzqON/bK+GxEyJcna+fdmcTcNSLZYUOnesQI=;
 b=TvUg1HVpr6f48zhmxb9XzfmQDr1Eu+KV9cY0l5/FwFzqLyaRV+VL2B55FYUsy1Oa4+P6495ZWb1CKuHR8UmC74IWTGWvrDmilddwjB77nWVpCzYch5tTxHtazp6HwAGoRgmJ9Wf0vwaYIBXs5dRfO4hWkjdFYArbyZTyxOLV4h5iLKTx3VvRPc+qEU8vjSM4O3As6q3Anm0/7P7zjzdkPAxcq3f5SZ8oOHar47+rDEUAD0AbGoSe/OvbZZe5GizulCjkPhmoRg/O0N2wSA0CAa9qwKFL7c30VXT69UtDhGlgpyGkvm1htNl6SwfOSokL7jJ8VbpOTZIfd7D5RIVWVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10633.eurprd04.prod.outlook.com (2603:10a6:150:225::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 16:42:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%3]) with mapi id 15.20.7939.022; Tue, 17 Sep 2024
 16:42:33 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 17 Sep 2024 11:42:06 -0500
Message-Id: <20240917164206.414714-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BY5PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::44) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10633:EE_
X-MS-Office365-Filtering-Correlation-Id: db4d92bd-cc18-4fcc-131a-08dcd737ba4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nmh2R1dhSkRRNFcxS3dNZVhFV1E3a2FVbnV0a21melZkYTZSUEhwYzl0Z1BW?=
 =?utf-8?B?TlpVdzFlbzBiNmwwNFIzWEs5WVJaSFFQdUI2bGZiQ3lGNHpRTEtyY0FoVjg2?=
 =?utf-8?B?akY5UnZUMUpBVkUzTC94Q1RsVkFraUxGLzF3bnU1dmhCMG5Lb3d0WGdTYWlK?=
 =?utf-8?B?RXh6cjNnTE9VWC93ak1ucEhoSzJRTUxtYVJzVVdFNGRPRGduNVltTkpVaXZJ?=
 =?utf-8?B?QzI2Ti9BbVVLVWIyRWJHY2FyRjlaTE1hS2UraG83cXM2dDZXNzdlbjNXM09V?=
 =?utf-8?B?SGZTWkdVZGJFY1YrUnNPcy9namVTZ2ZtTFNMOXBBQ2pqMVNuQUxRcHB5VitY?=
 =?utf-8?B?KytUbVBoSVhzdDFxVHhEaDB6aXp2ZFZKR0pxa1k5cWNkSFVGUXlUT3dVbmlM?=
 =?utf-8?B?YW91TmRtNW81QlNsazExbUpXdFJUK09LanU4eTRXdzRqK2pLRE5sZlNEeWdC?=
 =?utf-8?B?eWJNdFRVODB0aXNwL0l2eSsvSFl1MnZESnN0YkN1MktUMFRNdjd5ZGxRN0Ja?=
 =?utf-8?B?citVb0drUTNmaHlsVjJnZ0d6bGU3MGhHRHlqZ1NDWEZ2bFlNMTl1MTYzTHBS?=
 =?utf-8?B?VjNxbS9aMkVoTXdvZFNpQUVqdDZlV2MxUnBjNEhvTDRmdm5wSDBsUTdXbThF?=
 =?utf-8?B?OTN6UXlJU0wyckJiL3VRSVMrckZzdEdxejIvanBHVVZFM0ZWWksyMXdOeTh0?=
 =?utf-8?B?bHg3VGFyM1NHK0UwZ2dIQ05hL1YweUJtSnduWjI5MkViclJwODYxOGZOSG1K?=
 =?utf-8?B?SDdtQVBTU25kcEFSWm5HbGszdHdyK1pNTlluR2FpWDFFbHF5U0M3Ukg3YzQx?=
 =?utf-8?B?dzdFRFFGMzhVVVdkQklIOVdzWi94WDB0UHdiY0xNeUNVaEl0c3hHbTZ6dEcw?=
 =?utf-8?B?Q3I3SU9FMnhDNmhObEpsQmRhS2JhVjY3Yk5ra1hXM0RFaExNRXh0T0RKSitP?=
 =?utf-8?B?TWdpQ3NSbm9tT3FqQzl0aDBud1htdmVyRERVY2V2YmZBcmw5OFlFRVJBYTlF?=
 =?utf-8?B?eW9QdnFIdElhckpWbkpwZElqZjBCdFFOMHdjUjNISlhBMnVDT3E4UHZKVlcx?=
 =?utf-8?B?RlVqN0E1RXQyY0tGZ01RM1hpVnFKc3NHN2ZHK2N0WXdQNVYzcDlVdXVrSFFD?=
 =?utf-8?B?UklLYjRSY2xCMHU5NVFXQjJrcGpnTWJDQnRaZjJzZlZieFAvRHgrbVIydjI4?=
 =?utf-8?B?VFpYN3JZaUQ1aDA4S3MvbU8yQlQ0aUc4aGhQZnZycGV1TFZJQ0JDMmN3d3FB?=
 =?utf-8?B?bG01b3JnUkJmRTYwb3BhTGQyYXM2aEJHekJBMzdrVXBTVXp5VjlpU05FbUpC?=
 =?utf-8?B?RThNM3BmbFlNV0ZEbXE3RDdIbm5iNkhKeitOVWdlaE5xUXJXblBRdHRMSXND?=
 =?utf-8?B?dDM3YW1HbGVsQm5lQkVZSXlLSjhCYkhjdHNyUGhpdThubm9JcWtoN2xWOVhI?=
 =?utf-8?B?SmtETEZCc2VXeG5ubTNpcVBZcEUxNWFrSHJrL1NBMEJ3K08wNm9SYTVRclZ4?=
 =?utf-8?B?QU5VSVNlTEE4T2hUMVVxNzZLUm1wVm9IbkJvdENJWDJ5NDZWRTVvd2dPcWxO?=
 =?utf-8?B?TjFpVE0yVFRabHJVYXExdkdlTWFZRGg2MVVsS2NvM2RZd2sreUpRWmlaZ3JX?=
 =?utf-8?B?bndLeDQrdkhhZDczR1ZBc0FqV3JOV0JtWVg1cFc4R0U3NHNmU2E5UG9NeFNL?=
 =?utf-8?B?aGdocGtoaW5MQlA0cC9JcHlZVkdDRzh5WlBjUUl3OFp1aVhHc2NMVHo1c0Rw?=
 =?utf-8?B?UGVOSjljWkN5VmdnTmwwaW8wYlowbWFFZUllczQ4UUZ6RGtBMzZ3K0s0UTB5?=
 =?utf-8?B?R3NESjdNZUt3emlSWHhlb3E0NFFOeWRvUGwxVjF1dy9XRE5wc1pTQUpTYWRi?=
 =?utf-8?B?Q0FNQTJESCtrTTExLytwZmxsMFgrMVNxWWkrVmtLMzFsVEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0o2eVJnakN3b1U3ODdoY3prdi8vVnNiYndnM083QVJUMzJ5WDdLNVlINXA0?=
 =?utf-8?B?T3pTa1FhZjgxU3BWd3k3bHdqbmpOVjlFUTJ1QUgvQ04zYk5jS0xXcnlJaFNk?=
 =?utf-8?B?ZThIUXN5anZ2eFNDVVd2Sm1TaEI2WmtYZUNhd0I0bnBYSk55cGQ3UHJ0cG9k?=
 =?utf-8?B?T3ZlL0wvdElWZzg3Q3ZVRHpybmVzSm9XQm9QR0N1alBBN0l2T3BtazQ0L1VX?=
 =?utf-8?B?RWhLRzUvUk0zRW4yVmxpaEdMWmM4amxzaXJqSndOS0h5TnBJc1pOVTc0c0x6?=
 =?utf-8?B?Z0tNdFBENlkxR3VhcENZSEhXalk5dUo2Zmg1ZWpEc0Q4WFZLUEFKN0x6VVZD?=
 =?utf-8?B?V2dpS2J2aC9nUnlFVGpXOUVnNkkwRmJ0UXdwZ2piTysxNEtZZVNDM2FQY3NQ?=
 =?utf-8?B?NzdhdENHWFlKSStRU0ZYeHVSM3cwdjdSMm4ySW5tT25JTllRU0Y2MTc4eHU4?=
 =?utf-8?B?S0tzNVZZelZLYXJEZFFXTXpyQ3kzVFZGazdqV2RpRWJlUWdNUTBlWE5GVWx3?=
 =?utf-8?B?MHpWQm1PQWVuY0N5VXdVaVlkNEhlWTFvelhmdDFLVk9KU0lLZmFQdjJxOWxV?=
 =?utf-8?B?SFdSd2ZieklHaTdTNnN3VTVpLzloZ2V0Z2xHU0hUdWZvRDBFWDNyK01KMlBB?=
 =?utf-8?B?QUVVZk9BaG43ajJSWTlzaGo2SVI3TWc2MHZza09IdkJUcGdTUTdHQkVqcXR1?=
 =?utf-8?B?WkJUN3ZjUzRBdFlQanZSK0xUdElaMDhlRUU3SVVteHNaQzdPaFE3RFZZdjB2?=
 =?utf-8?B?NTRQNno5SEpxWTRPcmlTRW5QYjd6cXQ4UUJwdGxJZHUwSUUyZFl2TE5Ed21k?=
 =?utf-8?B?MFBoVUlYbllqaEpBc1hhSGI3cXV5QU1CbUc2S0NqVEFaOW1XMEpTQ1VFSk02?=
 =?utf-8?B?L2JQbENJdThpTUw3ZENhZXZSN0t1eGRHSSsvOCsrbjd4aWRyR004a0d3cEJ4?=
 =?utf-8?B?WUxwalBjR3dBcXF4YWRjMVIySllCdmhLdkZZMFNSSFJ5Mmg3aytFVldMeUtR?=
 =?utf-8?B?MjBFS1IrbnVZNXJZalVDaWZUdWRNcTZudVV6VzNlY2dOY21PVEppRlRRNmdB?=
 =?utf-8?B?dEx0ZXVteFVwejRDTDlmMG11TmNvSDJQdzRxK1hZSUJmOXFBenMxQm9DNjE0?=
 =?utf-8?B?bGpYZTR6dGx0VHl4a0pRZzcvbit0NnhjanU3a1dxL1RNYlBhWHpxa2xoOGZC?=
 =?utf-8?B?ajdjaXdQWEwwQ1hTSWIwUVFWUldlZ3pjQkV3RUswTVJabk85cml6TXJOK2tY?=
 =?utf-8?B?RXZadzgwNVBJeXc1ME55NkRWT1RUcHdYYTB1TEJUWTNVLzNZMUE3U3BCNlJq?=
 =?utf-8?B?WW9GN2JTUVgyK042eVpIcnJkVndkTlRBaTAvUVNEUVZpQU56WkFES3FkaE53?=
 =?utf-8?B?ejBBbmlOV1JzdWNGZXFaQnRlbU9JU3NUeEpyZ2F1enZMRk9jZ3dxOTdCMncx?=
 =?utf-8?B?cGpCUkdGREgrSVIzekIzSHRYQW1LeTUyZ01KNmtDeFRxUGUyOWZUZWZLNHBM?=
 =?utf-8?B?ZEpuMmhzMUtSaW5pQk11cTR0ajJoVTJiZFVxMkFLQ3pXNkJScS9hTzhjQzla?=
 =?utf-8?B?S0xOYXdpakU3L2RINjI5VU1zWHg3b0kwQ3RVQ0UvYVFmaUpUVVRUUStlL1R5?=
 =?utf-8?B?WHNNMDYwMHdHQ3lWWFA2cXBRRnQ1cWVZTkhDTlJpb2lpUlNFNSttQytVQ3hN?=
 =?utf-8?B?MHlvSVMyVC9oYW0rN3NKUU1ySnF3VjRSRHNrc0hhSEdFekdheTlhWmN3alpR?=
 =?utf-8?B?QW0zR2ZPMlFqUmRKMzZ5Z0t1T1NRUE01RGxxcnc0MVA0cFNvakg2aHlNblJu?=
 =?utf-8?B?V0FHQ0E4VE00aURMei92OG1TVVhsTWxJcFJsT3hHZWxxbTBVUGprRm8zaFc5?=
 =?utf-8?B?N3VFNEY1Vk56c2NoN3FvNWprZ0tOVkhyQTZLeWdoSjZFTnR1dHRMeWpvUzRS?=
 =?utf-8?B?a0cxMklpMzJpN3RnZUU3V2tHb3ZHUWxYVDJqaDZiZ0NzKzdrNHNJK3pxVXdy?=
 =?utf-8?B?SytKSlNpVnNOYSttRUhldXpOWXpOdFFmUzI0Y29ZOUZMdXo2Mlg1OWJnam9M?=
 =?utf-8?B?aHBETmpDc2VGekVtNWRkUndPSzJ0cEtkNTE2YXB2Q24vK29MMDhRSFM1Y2gr?=
 =?utf-8?Q?dHNhxcu1GI2JrXUaPstaqQrbI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4d92bd-cc18-4fcc-131a-08dcd737ba4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 16:42:33.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTlOjNmO9ayg9cmbmJe3UPw1Vv60nD+1zrsyavdG3oFjm2Ev0dxyiAB6ktYpl99F888scrCHYy0WKzqvN3NHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10633
Cc: imx@lists.linux.dev, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com,
 Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac4: extend timeout for
	VLAN Tag register busy bit check
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
dHkgbWFyZ2luLgoKVGhpcyBtb2RpZmljYXRpb24gZG9lcyBub3QgaW1wYWN0IG5vcm1hbCBzdWNj
ZXNzIHBhdGgsIGFzIHRoZSBmdW5jdGlvbgp0eXBpY2FsbHkgcmV0dXJucyB3aXRoaW4gMcK1cyBp
biBub24tRUVFIHNjZW5hcmlvcy4gVGhlIGV4dGVuZGVkIHRpbWVvdXQKb25seSBhZmZlY3RzIHRo
ZSBmYWlsdXJlIHBhdGguCgpGaXhlczogZWQ2NDYzOWJjMWUwICgibmV0OiBzdG1tYWM6IEFkZCBz
dXBwb3J0IGZvciBWTEFOIFJ4IGZpbHRlcmluZyIpClNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWM0X2NvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYzRfY29yZS5jCmluZGV4IGExODU4ZjA4M2VlZi4uY2Q1ZTU0MzRhYzUyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfY29y
ZS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3Jl
LmMKQEAgLTQ3MSw3ICs0NzEsNyBAQCBzdGF0aWMgaW50IGR3bWFjNF93cml0ZV92bGFuX2ZpbHRl
cihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAogCQkJCSAgICB1OCBpbmRleCwgdTMyIGRhdGEpCiB7
CiAJdm9pZCBfX2lvbWVtICppb2FkZHIgPSAodm9pZCBfX2lvbWVtICopZGV2LT5iYXNlX2FkZHI7
Ci0JaW50IGksIHRpbWVvdXQgPSAxMDsKKwlpbnQgaSwgdGltZW91dCA9IDUwMDAwMDsKIAl1MzIg
dmFsOwogCiAJaWYgKGluZGV4ID49IGh3LT5udW1fdmxhbikKLS0gCjIuMzQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
