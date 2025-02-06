Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93141A2AC0D
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 16:04:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 324A9C78006;
	Thu,  6 Feb 2025 15:04:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D60BC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 15:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGyskRDpqffktCFKRReimNwXYO7jx47DBTcqhZwYeOcAnNzW5SHKuLiy4NgoItLZvFwHMLtRuFLJEFPcJGrJSbtJqxW636TDi8T7Y6BBczkpWTrkJjsiF0+cFZ5x5W1twQnnch9s6qiJMIIsJl2quOt4vs1+DZAN87KycUvS2wYGAu/Olu0YYxXMFYtfiqiCRQWRtrpuAgyjglP7Gn74eHSfGtRY4jXHJG6oD7x4+MfhkcSWpeL1fj8d6bGLaUlQHlSJTYYDJRNitoMJoFx9WoBxmwM+dXqhybYRp37mJbXSSlNKVz4JTJhWE+a/B0iyocbk7w0UoWhFsiORxpvKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTtSVK0+vPoN//qdkuO94h4horigWqVPU0eUgn/OJXI=;
 b=cevzlPkVVXKbRcPGz6xTreFW1Qik09JodRICrth3S+f4NFxGSe8yWqqSPIv8xAvY1SnsEAN7QhIt5Ny92rIESKZclTy+oukBkstjbiwZBRdOsy/FfieYXiitRDAfT87FkbmzniDOLah0ZQfXavfsU9s9GCyE77YNgEm4nkCLVWR/9uw7J2Sk00bRhLh2YUL6k2/mm/jd6Px7+G1JUdQVmri9YeUkFN9/vBCBsXR1WrbZkxKKbJiWf+1UXPkPObfjy/JOa6Bsyr4E71GcdR5w7dzq8ZMwKhso1tkBxqPIPB6z+thCnxZtADbt7DIiPgJvWlPmqb1G/6rLwL6hb+0VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTtSVK0+vPoN//qdkuO94h4horigWqVPU0eUgn/OJXI=;
 b=aXfMfU+97sXQcY3IkpfHVYJX4Ri4C2xUXKGDf+GATQr2Q0LSqtyedQ5N3KIytsePSVtilMvFQU6R76mNkttyUMvLDMgCIrMW6S57N1kZKkWYlYRhmphq6Y6RY6wDOp1ei/BIvv1FJ2hovLmqU8uwHImrrbnA/7lLj8ei1rlupRkopRkpw2hJyQrAnhcg+CkHps0iYBOwUwSf1k7j3Nfrz5MayhCx2PB/Ytq3vJM2p0bAzPA04E+hMXt4Ozlgo3VhT0alOmoLfHIym6BuDUqaMEhnSD3hcCKVsmp1SXsDFMp1FWVpYXJ98E15kkAhumc9vDygdlw+yD8rJwCPIfz1hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 15:04:14 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 15:04:14 +0000
Date: Thu, 6 Feb 2025 17:04:10 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250206150410.u4rehwxnnuhtcfxr@skbuf>
References: <20250205100524.1138523-1-faizal.abdul.rahim@linux.intel.com>
 <20250205100524.1138523-6-faizal.abdul.rahim@linux.intel.com>
 <20250205171234.cuscjpzdyc34ofbn@skbuf>
 <6bf3f4b2-efee-41fe-97b3-cb53eca4dfed@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <6bf3f4b2-efee-41fe-97b3-cb53eca4dfed@linux.intel.com>
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
 (2603:10a6:802:15::19) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: af6a6446-1f62-4308-9b83-08dd46bf8510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXlLaDl3YS9CcEpnV2ZKb0JWWlkxUE9TdDR2bGJ0VVd3N1B5UVY1U1dkZDlw?=
 =?utf-8?B?ZnVQdnZGcWZWeTUybEVLZndXOW1DaXg4TjZ0R3pkZ2Jhbmt0b2d4VHJiK3h2?=
 =?utf-8?B?eGxzS1VtNHUwY0hiRlRNeUVuWXQrWi8wRlNxaVlaWjFlbm0rZ2svdlRzMUto?=
 =?utf-8?B?QTNDM05OQ3pZZGxET3Zwa25RSFQwbjZUNDlWbFFpMS9MVU03NVlDUnNzaHcw?=
 =?utf-8?B?a29tc1NBZEUyOXl0NnBYWXgrQ0x2TXE0c1V0TVF4MU12d3R2MmczSGFRaDV1?=
 =?utf-8?B?UWEweEtIaE1QNEVjVnlZS3lWTFVsTzdhbjlqWkNFU0p0WUluVGlRZ01IVmJj?=
 =?utf-8?B?NE5pdVZTM1B6R1ZQL3UxazJGQVBLTW5GS1R6ZW11SDJaM3pQVHlQQ1Zpb2FC?=
 =?utf-8?B?OW1VcnI0YTZ3eGRUblNER0pOV2hxS3pGMG9BMVRxcE55QXJibVFQZjVoK3Vi?=
 =?utf-8?B?TnBYWldMUDVqSHhtZmkrYUZZcWZTSHdwckZiM2tDZlVBcTNoM0ZYRVU4M0dV?=
 =?utf-8?B?NmhzVFdKTEpyY2gveTZEenR1QW5iNEZRaWxuQ2wwN2JqSk1NNVR0Q0JIc2RV?=
 =?utf-8?B?Um1GbkhqTE9MS0ZQSk93ZktCcVhOT3RBdmNEdGhmVFRCbHVTUlp3ODR6RzR1?=
 =?utf-8?B?L2NmWkcxVU15RSsvUWVSZ2lIV2I0TWlKVDNIZm5MN05raXN3YjJjSjBnM2xv?=
 =?utf-8?B?WU0vZFFIRytSOEVueFJmSVV4KzJrMHArZHR4VEs1aWVKNEU2ZWJGMndNdzYy?=
 =?utf-8?B?M2lhL2tVU0E4NzJqVk55cWN4YXJDbWtCUXBES3NPTHdzQzNvSkVzK1MxczEz?=
 =?utf-8?B?Q3dxNVY0SkdVeW1xMUxvNFdZZjcwODduM20yK2xFT1pQMExKWEtrZW1zaUZB?=
 =?utf-8?B?UVpCby84UGI1bkJ5T25HT3JiWk9YcnBwSG9rdTR2L0VWOVpQOWZMR2dUMUYy?=
 =?utf-8?B?QWpCbGVOS3ZXOUdybndVTElad0g1L2haLytKZ3NKb1h3OVVMTFNlL0JMWEpQ?=
 =?utf-8?B?b0NFUHkrT0VLUkRSanNUVjVhNjkwYzgrM255VC9YMmhFa1BIQjVsc2dCOXhq?=
 =?utf-8?B?NzRhMTR5RjQvWnJYSlFJYTY3NUVZWHZFNGx3L0FhdG1VenpRcEFudGt6emRZ?=
 =?utf-8?B?Q1ExSk9Ha21WQkgvcUV4czZTREdRR1VzYXlKUnZBUDNKcGQyUWhBL2pMb3Nm?=
 =?utf-8?B?WldwWlYzT1NDWWJmR1BaWWFWSW4wZ0RmTHllWWNTUncyOWZSaXcyajhtZTNH?=
 =?utf-8?B?aGxPRnQ3RkF4MHFzMWUweHRCZTNDRXhJSUZnVCtGNGtjSmtROEpldWFteGNx?=
 =?utf-8?B?d2dIZHR6RGNDT2hzb2lQNUVoQllvcDFnWDgzTkNZWld4ZXk2VEdXaEFhb2Vv?=
 =?utf-8?B?QmlDTlkxUjR6OEswVnJ4Z3lBWVEwZHZ3eXBweGJ0NW9kYndSMlZaWFR6cVA2?=
 =?utf-8?B?djh0VWNvNjdGT09QVURJZE5mOVFsWFRhMEx5NVovUFE2ZHR0NzcwSEF1QVNq?=
 =?utf-8?B?aFVyTS9jMGlFN1ZEZ2hXRWFqaXR2N3BSYUk2S0Z3YUZLdVFhK1lYc1pmOFNv?=
 =?utf-8?B?TmJ0Y2s2RkJvb004ZzlSRGFoSkpjd3FWSUp5Z2NZYTZEOTdUOU43YzkxYjlh?=
 =?utf-8?B?WDNremFvYTBQdnEwUW5XdW5aakg2d0lKNVpjSTUxM25lSzZnL0x2a2VwL3c4?=
 =?utf-8?B?U2tHcnRzMmhMaGpzK0lBMkRMWjVNTDdpQ3hxaG90T0JmZWg3TEVhM2MrNWdD?=
 =?utf-8?B?RFk0WVFpMEVrancydThQNXhwRjV0d1VHSnNZRlUyKzZQUnhjakg2bEtnS094?=
 =?utf-8?B?L0J0VjNjeG1HWlN0TmZpQVhlSTFiYnQxUXJOTkIrc2tTWWg1S0NvSDNLaG9T?=
 =?utf-8?Q?YdBapmsTbouZx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1pobGN0M0RvMzVtSUJxRGF6N2EwYUs1MkZISWx5S3Z2TUlTRlFUSEx0YlR0?=
 =?utf-8?B?Zi9SZDUwY0d4WHRkbEdkTkxMd1pVeGZLY1p2eTdrQWNvYnhkY0FId3MrZnhV?=
 =?utf-8?B?NExCUUxsTkcwYkhlZEZBK0J2UXZVK2JhV3dSNDRBVEZXbm1rcWtaMWlMMkxy?=
 =?utf-8?B?ODc3cmNRSGJJM0VlVmdCcEhDbTN4UERBTnpFdzZhWWljS1lLNDhtdnJ5b0Zv?=
 =?utf-8?B?WThPSUNyc2k0c0VHZStEWDJPSElQanhVR1pab2V2MjlWYVhHeXhBZHJLVVBT?=
 =?utf-8?B?YVdmTmtNQWJJUzFRYzN1SXhlaUFxK1pjcWlITk5XMHVRc3duZEpKZUYzL05u?=
 =?utf-8?B?aXNlM2ZpZjdVenRIdHhYN09NOUNneDJKTEVSWHJRaU5oSCsvbkV6VThSUVVV?=
 =?utf-8?B?MG1zanNadWswVVNlYVgzT21QQ2RER1cxRXVkazRHb0VldERnYjJiVUdCcGZh?=
 =?utf-8?B?RjdUNGRVdml5WmdWVit2VlYrUXNqZ0Z3UWtoWWUrVGxUV2ZXMzJaTG1NMm1v?=
 =?utf-8?B?YWNWQ3h1Vi9kSVZPdDBhYjgxTXlHRmpRbmVMVjU0bEJaZ1lUN0pMT2dseHM4?=
 =?utf-8?B?SEZ3TDBOckU1NjJwOHVvSzJpOFZwekxVUHl4aS9Kd1FuRTBGbkFsdjEzRnZp?=
 =?utf-8?B?aU83RzU5MXVyZ2QvWXVMU3FkcXphclNoM0xPQkZYbkE3c082QmN2aTlUUUNq?=
 =?utf-8?B?YUcvM2NuWHIzY01VNVVRMy9oT2Z4N0szRmdSejZOR2h0ODMzTmNzV3ZDbUlj?=
 =?utf-8?B?YkdIUWFZb2JSdXlEVTFiSjBDMlpxY2x3YkVEb0RwTHlKOFEzSGpBbzB2VXcx?=
 =?utf-8?B?SURRUUZyL0JMVXdQWDZ0SmNHR0JiZVg3Z1RCMGhaRUpIN3ZOL2pGUGdMSXZo?=
 =?utf-8?B?L2d3MXI2bnFJbVIzR3NDcHlDNU9VZ1pabEU5bEIxOXp6ckd2QjJCNXVaRDRY?=
 =?utf-8?B?M1YxejJhSG4yWHNuOE4vT3BhRWwxVFQ0R1JldXlleDFlRkVkVXdUd3prM2dF?=
 =?utf-8?B?TksyelMyZ0pIejU5bVpaaEYxWnFldTc4a3JqM3F5Q21DTXB4RXlRcUhmWWZV?=
 =?utf-8?B?alc5R2VPMVBvK3MvYzR1WG53TDZGZmorcDBVelN6RjhObHJNOGpNVW44SWF5?=
 =?utf-8?B?RWJyZ0Qwb0xiYlVIK0NSTUkxSWpCT1BFM1pURGs3VzM3WFlLK1Avc0pEaTQ4?=
 =?utf-8?B?b1Z2YmkwWXlPaXBuVjZrTnVpSHRhUkRMTmJmdmdLbVBvQTYyRnFoNHRVWS80?=
 =?utf-8?B?YzdCT1gzaE4xNEl6TTV4cTNnUkVobE5tc0ZyTkZDenhBczJNM0Y1L1JQSzUy?=
 =?utf-8?B?enJSOXpJSFh3d2hMWjBCL092TnlGRnJCUWJvTXRxK3JsbkVxMXJ4N3AyeDBH?=
 =?utf-8?B?M0hNSEg0bnkxYnB5RG5UMnJjWkJDV2U1QVM2ZlNNUzJ0d3d2RzRueFdzUWR2?=
 =?utf-8?B?ODBZN2pkTFo3bXBVVU5XcndFUkRjUzdvRFVzUURqczU1TDBBbk1oQWROak1i?=
 =?utf-8?B?dWdCOVRCU2pKTTF3Y2JLOXhlN25vOG1CZERJSURESi80ODU0MVZzM3VXU3dI?=
 =?utf-8?B?ZDdtSUlObzF0MGNsTExyc09GTjZxRWM4WnFKTU5obkIzSVFhd1k1MFY2RnNC?=
 =?utf-8?B?RGp3VWY0UTR5MVFhcjh0dmF4a3BzaWRsQlBxREpDdWY1cVNjYWYweGhxZTMy?=
 =?utf-8?B?S1pRWW11RTVxeTdHTDh2Zml2QjY4MmNFM2JIYXpERG8zMERpTGlHOUQ1UzlT?=
 =?utf-8?B?TFp1cEFtM0xCa3c3OTFzLzNnb0tDYnQ4VDdnYmhBYTVwQW94ekJieE5BM0Fx?=
 =?utf-8?B?QVZ3OXBCNnYyZU0yOU1rVDM2d2pQN21TUXVObWtiM0d4SEhWZnFOTWVhb05j?=
 =?utf-8?B?WExuNnNKc1ZmZGtLU1hhMnF6WkZGM3hyeDBDbytuaHZQTGFndEtsZDBaWHgz?=
 =?utf-8?B?dW5zcmtLWlFTc0ZPejMrWnA4bWdTQkUxZzMwSy9id05yZThpTXpBK1dxK3lE?=
 =?utf-8?B?OEFzNkxhSzQrenpFZmtYelNXSkdmS0U3a2Q0SktuVS9kdlROVGU2YkZEazUx?=
 =?utf-8?B?anM2SUh2NTZ3N1dUeE1rNnFFaTRtYWkvQldrNUdONk1WaXNDOFUvaWNzMmNv?=
 =?utf-8?B?Sk1OQkkwemJSTUVDc0hIeW5BYVZ6YWpSZGI3eUZVRGZXaU41djJjaC9OamFN?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6a6446-1f62-4308-9b83-08dd46bf8510
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:04:14.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD/bPElEacaXgMx3G4hLgcyAPeOicOJuFxj/kzn5SoNalmR1IZQRN28kyqyFSWK6YoyWvhLW3oGXvq3Exixr9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Tesarik <petr@tesarici.cz>, Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v2 5/9] igc: Add support for
 frame preemption verification
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

T24gVGh1LCBGZWIgMDYsIDIwMjUgYXQgMTA6NDA6MTFQTSArMDgwMCwgQWJkdWwgUmFoaW0sIEZh
aXphbCB3cm90ZToKPiAKPiBIaSBWbGFkaW1pciwKPiAKPiBUaGFua3MgZm9yIHRoZSBxdWljayBy
ZXZpZXcsIGFwcHJlY2lhdGUgeW91ciBoZWxwLgo+IAo+IE9uIDYvMi8yMDI1IDE6MTIgYW0sIFZs
YWRpbWlyIE9sdGVhbiB3cm90ZToKPiA+IE9uIFdlZCwgRmViIDA1LCAyMDI1IGF0IDA1OjA1OjIw
QU0gLTA1MDAsIEZhaXphbCBSYWhpbSB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaCBpbXBsZW1lbnRz
IHRoZSAiZXRodG9vbCAtLXNldC1tbSIgY2FsbGJhY2sgdG8gdHJpZ2dlciB0aGUKPiA+ID4gZnJh
bWUgcHJlZW1wdGlvbiB2ZXJpZmljYXRpb24gaGFuZHNoYWtlLgo+ID4gPiAKPiA+ID4gVXNlcyB0
aGUgTUFDIE1lcmdlIFNvZnR3YXJlIFZlcmlmaWNhdGlvbiAobW1zdikgbWVjaGFuaXNtIGluIGV0
aHRvb2wKPiA+ID4gdG8gcGVyZm9ybSB0aGUgdmVyaWZpY2F0aW9uIGhhbmRzaGFrZSBmb3IgaWdj
Lgo+ID4gPiBUaGUgc3RydWN0dXJlIGZwZS5tbXN2IGlzIHNldCBieSBtbXN2IGluIGV0aHRvb2wg
YW5kIHNob3VsZCByZW1haW4KPiA+ID4gcmVhZC1vbmx5IGZvciB0aGUgZHJpdmVyLgo+ID4gPiAK
PiA+ID4gaWdjIGRvZXMgbm90IHVzZSB0d28gbW1zdiBjYWxsYmFja3M6Cj4gPiA+IGEpIGNvbmZp
Z3VyZV90eCgpCj4gPiA+ICAgICAtIGlnYyBsYWNrcyByZWdpc3RlcnMgdG8gY29uZmlndXJlIEZQ
RSBpbiB0aGUgdHJhbnNtaXQgZGlyZWN0aW9uLgo+ID4gCj4gPiBZZXMsIG1heWJlLCBidXQgaXQn
cyBzdGlsbCBpbXBvcnRhbnQgdG8gaGFuZGxlIHRoaXMuIEl0IHRlbGxzIHlvdSB3aGVuCj4gPiB0
aGUgcHJlZW1wdGlibGUgdHJhZmZpYyBjbGFzc2VzIHNob3VsZCBiZSBzZW50IGFzIHByZWVtcHRp
YmxlIG9uIHRoZSB3aXJlCj4gPiAoaS5lLiB3aGVuIHRoZSB2ZXJpZmljYXRpb24gaXMgZWl0aGVy
IGRpc2FibGVkLCBvciBpdCBzdWNjZWVkZWQpLgo+ID4gCj4gPiBUaGVyZSBpcyBhIHNlbGZ0ZXN0
IGNhbGxlZCBtYW51YWxfZmFpbGVkX3ZlcmlmaWNhdGlvbigpIHdoaWNoIHN1cHBvc2VkbHkKPiA+
IHRlc3RzIHRoaXMgZXhhY3QgY29uZGl0aW9uOiBpZiB2ZXJpZmljYXRpb24gZmFpbHMsIHRoZW4g
cGFja2V0cyBzZW50IHRvCj4gPiBUQzAgYXJlIHN1cHBvc2VkIHRvIGJ1bXAgdGhlIGVNQUMncyBU
WCBjb3VudGVycywgZXZlbiB0aG91Z2ggVEMwIGlzCj4gPiBjb25maWd1cmVkIGFzIHByZWVtcHRp
YmxlLiBPdGhlcndpc2Ugc3RhdGVkOiBldmVuIGlmIHRoZSB0YyBwcm9ncmFtIHNheXMKPiA+IHRo
YXQgYSBjZXJ0YWluIHRyYWZmaWMgY2xhc3MgaXMgcHJlZW1wdGlibGUsIHlvdSBkb24ndCB3YW50
IHRvIGFjdHVhbGx5Cj4gPiBzZW5kIHByZWVtcHRpYmxlIHBhY2tldHMgaWYgeW91IGhhdmVuJ3Qg
dmVyaWZpZWQgdGhlIGxpbmsgcGFydG5lciBjYW4KPiA+IGhhbmRsZSB0aGVtLCBzaW5jZSBpdCB3
aWxsIGxpa2VseSBkcm9wIHRoZW0gb24gUlggb3RoZXJ3aXNlLgo+IAo+IEV2ZW4gdGhvdWdoIGZw
ZSBpbiB0eCBkaXJlY3Rpb24gaXNuJ3Qgc2V0IGluIGlnYywgaXQgc3RpbGwgY2hlY2tzCj4gZXRo
dG9vbF9tbXN2X2lzX3R4X2FjdGl2ZSgpIGJlZm9yZSBzZXR0aW5nIGEgcXVldWUgYXMgcHJlZW1w
dGlibGUuCj4gCj4gVGhpcyBpcyBkb25lIGluIDoKPiBpZ2NfdHNuX2VuYWJsZV9vZmZsb2FkKHN0
cnVjdCBpZ2NfYWRhcHRlciAqYWRhcHRlcikgewo+IHsKPiAJLi4uLgo+IAlpZiAoZXRodG9vbF9t
bXN2X2lzX3R4X2FjdGl2ZSgmYWRhcHRlci0+ZnBlLm1tc3YpICYmCj4gICAgICAgICAgICAgcmlu
Zy0+cHJlZW1wdGlibGUpCj4gCSAgICB0eHFjdGwgfD0gSUdDX1RYUUNUTF9QUkVFTVBUSUJMRTsK
PiAKPiAKPiBXb3VsZG4ndCB0aGlzIGhhbmRsZSB0aGUgc2l0dWF0aW9uIG1lbnRpb25lZCA/Cj4g
U29ycnkgaWYgSSBtaXNzIHNvbWV0aGluZyBoZXJlLgoKQW5kIHdoYXQgaWYgdHhfYWN0aXZlIGJl
Y29tZXMgdHJ1ZSBhZnRlciB5b3UgaGFkIGFscmVhZHkgY29uZmlndXJlZCB0aGUKcXVldWVzIHdp
dGggdGMgKGFuZCB0aGUgYWJvdmUgY2hlY2sgY2F1c2VkIElHQ19UWFFDVExfUFJFRU1QVElCTEUg
dG8gbm90CmJlIHNldCk/IFNob3VsZG4ndCB5b3Ugc2V0IElHQ19UWFFDVExfUFJFRU1QVElCTEUg
bm93PyBJc24ndApldGh0b29sX21tc3ZfY29uZmlndXJlX3R4KCkgZXhhY3RseSB0aGUgZnVuY3Rp
b24gdGhhdCBub3RpZmllcyB5b3Ugb2YKY2hhbmdlcyB0byB0eF9hY3RpdmUsIGFuZCBoZW5jZSwg
YXJlbid0IHlvdSBpbnRlcmVzdGVkIGluIHNldHRpbmcgdXAgYQpjYWxsYmFjayBmb3IgaXQ/CgpP
ciBpcyBpZ2NfdHNuX3Jlc2V0KCkgLT4gaWdjX3Rzbl9lbmFibGVfb2ZmbG9hZCgpIGNhbGxlZCB0
aHJvdWdoIHNvbWUKb3RoZXIgcGF0aCwgYWZ0ZXIgdmVyaWZpY2F0aW9uIHN1Y2NlZWRzLCB0aGF0
IEknbSBub3Qgc2VlaW5nPyBJIGRvbid0CnRoaW5rIHNvLiBNYXliZSBjb2luY2lkZW50YWxseSwg
YnV0IG5vdCBndWFyYW50ZWVkLgoKPiBJIGJyaWVmbHkgY2hlY2tlZCB0aGUgZHJpdmVyIGNvZGUg
YW5kIHRoZSBpMjI2IFNXIFVzZXIgTWFudWFsLgo+IAo+IFRoZSBjb2RlIGNhbGxzIGlnY19yZXNl
dF90YXNrKCkg4oaSIGlnY19yZXNldCgpIOKGkiBpZ2NfcmVpbml0X2xvY2tlZCgpIOKGkgo+IGln
Y19kb3duKCkg4oaSIGlnY19yZXNldCgpIOKGkiBpZ2NfcG93ZXJfZG93bl9waHlfY29wcGVyX2Jh
c2UoKS4KPiAKPiBJIHN1c3BlY3QgaWdjX3Bvd2VyX2Rvd25fcGh5X2NvcHBlcl9iYXNlKCkgY29u
dHJpYnV0ZXMgdG8gdGhlIGxpbmsgbG9zcywgYnV0Cj4gdGhlcmUgYXJlIGxpa2VseSBvdGhlciBm
YWN0b3JzIGFzIHdlbGwuCj4gCj4gVGhlIFNXIFVzZXIgTWFudWFsIHN0YXRlcyB0aGF0IGEgc29m
dHdhcmUgcmVzZXQgKENUUkwuREVWX1JTVCkgYWZmZWN0cwo+IHNldmVyYWwgY29tcG9uZW50cywg
aW5jbHVkaW5nICJQb3J0IENvbmZpZ3VyYXRpb24gQXV0b2xvYWQgZnJvbSBOVk0sIERhdGEKPiBQ
YXRoLCBPbi1kaWUgTWVtb3JpZXMsIE1BQywgUENTLCBBdXRvIE5lZ290aWF0aW9uIGFuZCBvdGhl
ciBQb3J0LXJlbGF0ZWQKPiBMb2dpYywgRnVuY3Rpb24gUXVldWUgRW5hYmxlLCBGdW5jdGlvbiBJ
bnRlcnJ1cHQgYW5kIFN0YXRpc3RpY3MgcmVnaXN0ZXJzLAo+IFdha2UtdXAgTWFuYWdlbWVudCBS
ZWdpc3RlcnMsIGFuZCBNZW1vcnkgQ29uZmlndXJhdGlvbiBSZWdpc3RlcnMuIgo+IAo+IEdpdmVu
IHRoaXMsIHJpZ2h0IG5vdywgSeKAmW0gdW5zdXJlIGFib3V0IHRoZSBmZWFzaWJpbGl0eSBvZiBt
YWtpbmcgdGhpcwo+IGNoYW5nZSwgdGhvdWdoIEkgc2VlIHRoZSBiZW5lZml0cyBtZW50aW9uZWQu
Cj4gVmFsaWRhdGluZyB0aGlzIHdvdWxkIHJlcXVpcmUgc2lnbmlmaWNhbnQgZXhwbG9yYXRpb27i
gJRpLmUuLCBpbnZlc3RpZ2F0aW5nCj4gdGhlIGNvZGUsIHJ1bm5pbmcgZXhwZXJpbWVudHMsIHJl
dmlld2luZyBjb21taXQgaGlzdG9yeSwgY29uZmlybWluZyBoYXJkd2FyZQo+IGV4cGVjdGF0aW9u
cyBmcm9tIHRoZSBTVyBtYW51YWwsIGFuZCBjb25zdWx0aW5nIG90aGVyIGhhcmR3YXJlIFNNRXMu
Cj4gCj4gUmVzZXR0aW5nIHRoZSBhZGFwdGVyIGlzIGEgY29tbW9uIG1lY2hhbmlzbSBpbiBpZ2Mg
dGhhdCByZWxpZXMgb24gc2hhcmVkCj4gZnVuY3Rpb25zLCB3aGljaCBjYW4gYmUgdHJpZ2dlcmVk
IGluIHZhcmlvdXMgc2NlbmFyaW9zLiBNb2RpZnlpbmcgdGhpcwo+IGJlaGF2aW9yIChpZiBmZWFz
aWJsZSkgY291bGQgaW50cm9kdWNlIHNvbWUgcmlza3MgYW5kIHdvdWxkIGxpa2VseSByZXF1aXJl
Cj4gYWRkaXRpb25hbCB0ZXN0aW5nIGFjcm9zcyB0aG9zZSBzY2VuYXJpb3MuIEZvY3VzaW5nIG9u
IHRoaXMgcmlnaHQgbm93IG1pZ2h0Cj4gZGVsYXkgdGhlIGN1cnJlbnQgc2VyaWVzLCB3aGljaCBp
cyBwcmltYXJpbHkgYWltZWQgYXQgZW5hYmxpbmcgUWJ1IG9uCj4gaTIyNS82Lgo+IAo+IFdvdWxk
IGl0IGJlIGFscmlnaHQgaWYgSSBleHBsb3JlIHRoaXMgc2VwYXJhdGVseSBmcm9tIHRoaXMgUWJ1
IHNlcmllcz8KCk9rIC0gYXMgSSBzYWlkLCBpdCdzIG5vdCBhcyBpZiBJIGNvdWxkbid0IGV2ZW50
dWFsbHkgdG9sZXJhdGUgdGhlIHdvcmthcm91bmQKeW91IGNob3NlLiBXZSdkIGJlIHB1dHRpbmcg
YSBkZXBlbmRlbmN5IG9mIHRoaXMgZmVhdHVyZSBvbiBzb21lIHVucmVsYXRlZAp0aGluZyB3aXRo
IGEgaGlnaCBkZWdyZWUgb2YgdW5jZXJ0YWludHkuIEZvciBleGFtcGxlLCBJIGFza2VkIGlmIHRo
aXMgaXMKZmliZXIgb3IgYSB0d2lzdGVkIHBhaXIgUEhZLCBiZWNhdXNlIHdoaWxlIGZvciB0aGUg
Y29wcGVyIFBIWSB0aGUgaXNzdWUKbWlnaHQgYmUgbW9yZSB0cmFjdGFibGUgKGNsYXVzZSAyOCBh
dXRvbmVnIG9uIHRoZSBtZWRpYSBzaWRlIGlzIGNvbXBsZXRlbHkKaW5kZXBlbmRlbnQgb2Ygd2hh
dCB0aGUgaG9zdCBzaWRlIE5JQyBpcyBkb2luZyAtIGl0IG1heSByZXNldCwgaXQgbWF5IGRvCndo
YXRldmVyIC0gdW5sZXNzIHRoZSBNQUMgcHJvdmlkZXMgYSBjbG9jayB0aGF0IGlzIGltcG9ydGFu
dCBmb3IgUEhZCm9wZXJhdGlvbiksIEkgZG8gd29uZGVyIGlmIGFueXRoaW5nIGF0IGFsbCBjb3Vs
ZCBiZSBkb25lIHRvIGF2b2lkIHRoZQpsaW5rIHBhcnRuZXIgc2VlaW5nIGEgbGluayBsb3NzIG92
ZXIgZmliZXIsIGJlY2F1c2UgdGhlcmUsIHRoZSBjb25uZWN0aW9uCmlzIGRpcmVjdCBQQ1MtdG8t
UENTLiBJZiB5b3UgaGF2ZSB0byByZXNldCwgeW91IGhhdmUgdG8gcmVzZXQsIGFuZCB0aGVuCnBp
Y2sgdXAgdGhlIHBpZWNlcywgSSB1bmRlcnN0YW5kLgoKSXQncyBnb29kIHlvdSdyZSBjb21taXR0
aW5nIHRvIGxvb2sgaW50byB0aGlzIGluIG1vcmUgZGVwdGgsIHRob3VnaC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
