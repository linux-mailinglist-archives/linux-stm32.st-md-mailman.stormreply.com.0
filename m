Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D7A5E11B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 16:52:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70823C78011;
	Wed, 12 Mar 2025 15:52:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 045DFC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 15:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+C6Tpd4Lp2GoKwh0+JYRQJjf3GzEPX6VFS5vDtSDyvraV4iwmK7qzDYouvU20tgME0ouAumMHw7CACES42qR5UUG7fkF5lpXxn/QlQb4AiHO0jRT4y3nPhYprtdu6YELIiz0vFgohpTD5mVK9O6tuD/qmI2UIhf+/vrADnxxIRNdiqI36AQ8Eu8t6/vVNkqRhrSfgMB3FfUFvnXGHjSNHOw6IuQ1ZGRoZgGkUpIYfsibB9D/lPphZS1RVf99SGcBk/DS6fZvmej/9TUKv/zvtU9vGDVrxrV0dhFxEkK81rUNSSwy90wk5U484Bvd9aOtaMsE5GYH++eQx4yY+osrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov5t6cJSulQvtamNGQtd1mFFPhPtGp8Re9lUEpd8Ans=;
 b=aclsHTuashUrfU0Ze29H+gYRrcBZsSKhXOY1E5c6AMojNJD4hUYIKhdYsTOfolSpVEj3q/9Mg4ywiM1sXztl475ECanSgfbmnXAAjHCf4C0A9nEW/b9mQkv0IoEWlmrnb+lCRJNlbAO3zz55IeaBMTpPhvk8PbEtOB5F7HQr3Th5hugaSibHu1auTJTCJIXSGdqJvhkqP7iHOgXTS4zVtt9FZY3xm0UYfETSk9BWt8uXx8/AoAGEIvQc06yTR0wkuGLxeSU3uDawkuO5TL56jGMnXeGzVFH8mkvWRUrR9g3lulUSfsMG+9CDKIpSBRoBBee1Ia2PX4MYd9ia3tgtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov5t6cJSulQvtamNGQtd1mFFPhPtGp8Re9lUEpd8Ans=;
 b=IRaFzG0HaB+Wa2Dd1aweVOje8a5oNSDZRtLJWfn8fISdeCY1bCF+zCUP+EVMBiMnkRFj2x7Ub0IxNxD3a4+oaa/YShwHXOkFmH8Wn+vq3A+ltQpD3Io0XmfYIbZW2RifmgScBNK5yQaRxkMA9IQkUnNj/5K5LM38l7mECqq3ffpxIqzpaKHyQcZ3EvVq6Q0A5jOpOpB5sjr98LJg3QEFaYUiGhicGEaw6K8oflKyGVMA+zgF4hSH+8aoUFQznpzfHiyqUhX82Mjp/mOtkWQ685FiuS18DZAcTVleUaCubT2dTRLCIh/o95V947HP+L1zXfqxUTajgAIk6TemExeanw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 15:52:49 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:52:49 +0000
Date: Wed, 12 Mar 2025 17:52:45 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250312155245.fdntan3nml424ufe@skbuf>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-11-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-11-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250309104648.3895551-11-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-11-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR02CA0049.eurprd02.prod.outlook.com
 (2603:10a6:802:14::20) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: fef8725d-811c-4255-50b2-08dd617df0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWlMdWRIR2tmNW9qUmMxRVM3c1hOTDJVUEY3bWgzWTNWdXEzNXIyRGYvQ2ly?=
 =?utf-8?B?YW1IRElTaHFVekpkbWdjYlVRdkxPV2FMVmlwMUdjdzREUkNDVm96TzQ5ZkZB?=
 =?utf-8?B?elVFWEVTOEpoY1FIVVRUTzgvT2drQS9tUWdLeWlhT3gvRzA4S0lrdllSQkJ6?=
 =?utf-8?B?MmJ6MVc3bG5qb3lCYndvelhmM28wT1hQWHMyT051Z3lUdnlteDc0UnBpY202?=
 =?utf-8?B?bDBCRGl0NEtDdi9CS3VWWm1RRzJmMWw0S1BLbVE5K001RFhUNFEzdXFLQmdh?=
 =?utf-8?B?QVFOY0tWQXU2MzhrOUl3WVQrNUpOOFh0Z3lVTmJZcDFMbSt6U3ZpL25mZ3BC?=
 =?utf-8?B?eVZsSTk4L3d5QW82OVpEMWRQQ2xRRkw0TDBNVWRDUHgrZmxNZ2g1VzlBdVZy?=
 =?utf-8?B?dHVOYzNYc0dCSkJxMkp6NmYzTmxySXg5VXEzTlhCZytmRTFSc05vMDFHZ1Ir?=
 =?utf-8?B?ZmR2bWxqa0sxSG84WUtuUTVGS01iTzQzcFZBdWpOYTBqTjBSRi96bnE2cTJF?=
 =?utf-8?B?enl0YTBOVVA3V2srNlpvWm0vSTJSSEttZFRpcmxmRlY2RWd1MG5SNEVTUXlS?=
 =?utf-8?B?WlplME9yTlhoS2YzeWsvaFhyK0VhaC95Nmc0Z2dEVmhCbE1SMUJCbFZWdlhz?=
 =?utf-8?B?N3lOZHlJOFBQbmZ2VkVFdU9pMzJjYkZIZHVyWTl2RUR5eDdHaWtTVXdnMUJ0?=
 =?utf-8?B?LzZIRis0RlNON3crcG1LcjNNSGJxNGdKMkdBV24vWjJmNXlOT3k1a1JCcm8x?=
 =?utf-8?B?SHV6L2llZzQrVUZaY29uVTRqZUdGcWFEdW5uSS9ZMWtOUG5TYyt1ZmVtRzgv?=
 =?utf-8?B?UGhrV2s4SnU1M09qUzdMd1hZUUZWaHl0M2lzeEd2VElmNHVHSVYrT04yZGpu?=
 =?utf-8?B?aldnSGgxYWwyeXMyaURDdElvMWtUK1UrNGhZQzRMK0gyRE04Sjh4dTVqZUFi?=
 =?utf-8?B?dUF3OVMwbDROMnc5YUxoV1BIR003cjJNNFFlcENsaFZPK28xV2VaRzZRZmMy?=
 =?utf-8?B?VGNoTE9IMTNsdmlZeVZYWDlpYWt6L3hibVA1U2YyeHVBb0VvWC9HR3dhSjZE?=
 =?utf-8?B?NitlM2t5a0NOeHQxMXNUMlVmdXZtN2tBRFkxbzZiWnNpOVJDdUR5UE1RMURN?=
 =?utf-8?B?NjVBUnVhZ084YldzUTNoQnFzUkx1MmdoN0VyQVJCY2ZrSkd0MDN6eTdIcEI3?=
 =?utf-8?B?RmFsVm80aS9JcEd5YitaeHduRnpKcE00NnVQVnNURENGb3puU05kK2VkeVBB?=
 =?utf-8?B?Y1loYVk5cHRocTFZa1BsMk9lU3dtMDFIK1VXMkJwZkIzd2l1OW1XNkk3RFNR?=
 =?utf-8?B?ZHNON2ZubUdaMGlMNmN2QTE3eEVVWktEY2pRYmdua1JXbFNPR0hKL1JaUlIr?=
 =?utf-8?B?NzRZM2hoUlhyYU4ycWRYYWlMdmVXeUVmNTFhK1dVbTNmQkFTVHRCa0V2QkVW?=
 =?utf-8?B?VGJOeVUxUUJzcHdyQ1lWbmprL2lHSVJMQUpya2xTMXIwcnJKSVBpSmRlQU03?=
 =?utf-8?B?Umt5eG5KNE5PYXhQYVF6V0RDcktneHk5YUNuSDF4QU4zRVRPVGpzSGdmcVJX?=
 =?utf-8?B?NmR3dTlINm1tdmZEQ2YwaS9aWTZ6cUJHM1NtRjVDWmhDRldkcitYR3lseGNO?=
 =?utf-8?B?ZWl6YzJDMjFlUkRnK1ZJRUpaYm5Hd2FpeXpmMW9wNkFSQTJTU0xVZFFLN3pW?=
 =?utf-8?B?ODdQekQ2bXltVGtzKzhTWkVyVmt1a1R2NDh1Wmt1d1RUUUd3VWt4YXpPcytM?=
 =?utf-8?B?d2ZIelJVSEp0Zkt0Y2VUNjg1bzhVcGZNSXJ3NzRwc1Q5Zjg5YXQ4TnZ5dzRv?=
 =?utf-8?B?RnlnaFFMMHNsLzJVVGZhOTNwNmpaay9SYnJoWGhSSVdPMWM5M0Z0NzJhSDVU?=
 =?utf-8?Q?KcUfdGtYjmFWM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZZT3oyYXNJWXlxNGVlNDJtcDNGZlJMRzJVemE5WWh0YVlVRi9NbllrTSsv?=
 =?utf-8?B?d1VtRTVEeC9jVVVHNWNXZm1CL1F5Z1lNR3V0ZStxTmNjTlZaUzNrZnZLRzVY?=
 =?utf-8?B?Q0FOVnlMSkMwUmNja2luWHk0U1Y3dG14cEYwV0NjY05PMFZwMzZWS291MnhI?=
 =?utf-8?B?ejhJa05QcFZ1OEVvWitDdThRb05LQ0JxMCtDSmRaQlhaM3p4Mm5VcDNmYlM3?=
 =?utf-8?B?NGM3TGhDRXNPa04yNzVuNnpLdzVZWXNoKzl0T3RVaW9KTGwvY2JiZWFJZGlE?=
 =?utf-8?B?YlJJeHhmajJONE43VUxBSWsyT214SjVWdW9Ea1ZoOFVuUmNGWFdGSVVIWXN6?=
 =?utf-8?B?dEkxd28zOTBmd2dlSmY3Qm9JdjRZcThrelVXUmtwaktYMmdpdGF6NW9HTW9X?=
 =?utf-8?B?UDFGMmI0am5jcThWbVgyL1ZjK2RqK1BrUkZxQklteFJHUTBET2pKaHJidHBH?=
 =?utf-8?B?dDduZjZpNUtkUDdXd2wzMndiT1hZNlJBVkx0RFpOZ1FWeHlwWlBvTGswSUlE?=
 =?utf-8?B?ZjlGdGk4a0NZTExkQXI2SjdmczRZQ0RKUkJvS2lLRnQxTlZWN3NudzVIdUE2?=
 =?utf-8?B?V3VOQUZIWHhDa2NRSUFXbHlZOUJuY3VCNGVGMEFpd2pOZ0hxTmZmZkNqdjZ0?=
 =?utf-8?B?M2dCRnVwM05yeFZTc1lZTDJOUXd6R040d1FMMjVuSHVuRW1nekNqcVJ6VENl?=
 =?utf-8?B?ZWhqbjVmRmY5YVorRUVWanZ4amxac0JpUmt0VnNndGdCUExXN0s0SW9LMjFn?=
 =?utf-8?B?NW81UlFUVVg1ZDZvazA4OTd1M1Aya1ZzTWpQUWJtUVNzNjAyVHE4ckQzcENY?=
 =?utf-8?B?UFZoMDRUN0dmS1hvNFFxSEhjZVUzQ1N0dnVoV0htZ0FrR095cmtGdnJLRGVq?=
 =?utf-8?B?NjkyUHVnZG5mbm15R3loMnVmQlcwWGYvODNVNGNGRVRNMTJLaVpkcHpWMEgw?=
 =?utf-8?B?WXFHUStaRS9QWHU3b1hQcUlYbkphbWZtMjhWeUQwK25Sa21KL3VGb3ZWUEVL?=
 =?utf-8?B?eG90VjltVnRHcGh5cU1yekJEVUdRbkh0QlV1cC8xV0lIa2xsVURQMFpvUlJp?=
 =?utf-8?B?azVZUXluSGIxVTlCVVA5bGU5NkNGRXplT1UzcyszU2pTNmkwaEI3RzlROGZN?=
 =?utf-8?B?N1JyQm5hUUYzR29kRUk0ZUxwMjBWY3BKNENvbXc3K3Z6Sm1qWnpGQWlDV2VR?=
 =?utf-8?B?WnZUb0NIVW5TNlBORC9Eam9DQjYyRDVZczRqM01NU2x5N1JCbHV5UVRNbjBL?=
 =?utf-8?B?THAxVm1CdWp1b1d5K0kwZkRlMmpqZXJpSktZNVZobUs0cEpnZndQbFh5Z0pH?=
 =?utf-8?B?VStPWGpGRnBiZDI1YitpS1BPeE5oY1dkeG5zQVNFSEcxd2orU0h6ZzRuV1ZU?=
 =?utf-8?B?RFYrTkZjSDdieFZNQ0p1Q2E2WU9QUXRjOTNMb3FZZ2IvWkhzcDBCTHoxRzVp?=
 =?utf-8?B?VXZPUFZzNDJBMUZjdG9INFFhakFST3BRbmRRQ3NRN1JTWEczRldBWjZwSEp5?=
 =?utf-8?B?NEFlYWJNNWVOTUZmVTh4SlREUHVJWGQ3MmNZZG1jcmRJd3JOdno0OFA2eDQy?=
 =?utf-8?B?M0pJSDI1UGRxeXhCMmtwYUZOS09GTW5OcGkyOGc4YktST1Q3eG9hYUN6bnNL?=
 =?utf-8?B?a0JlY1ZPQWd1OGh0OGxHYmxKRFVRc2QxanpQVk5vK3JqUEtHZnU2UzhwRUls?=
 =?utf-8?B?WkNhV3lGY2NocVhsWDB4UXhxcEJkVktuVDE1UGw3dHBQZzU2U1loVlNueW5j?=
 =?utf-8?B?Qkp3K0cveGx3RGxOTU1mUjNPSDROdmlaRGg1NjBmNVhETTRjbDFUY3FwUVo2?=
 =?utf-8?B?MDNnR21MdzhZZTE4T3RvQ1RTWmVEZ3VsY1hzR3kzT3pzdmVYMENDd2tjQVVw?=
 =?utf-8?B?VysxRjhYY2l2SU1ESmlCOG1YbW9kQzVzaFIwTW1IMWtYTDY5Zm5IdFlNcmcz?=
 =?utf-8?B?UXovK3hEUVRGYk5Tblp3SDMrU1U1aEdpMlphZlFmZ1ZuQWZoSWlkc0lWdW1y?=
 =?utf-8?B?K3ZsRVBndUNVMFdUbUNLS3NLL0lZaEV1cXlRU1lvYllkaGVFZ0trQUx4emNy?=
 =?utf-8?B?U0VLZEY4ak9TRHIxTnpaNUZMV0t5OEdrWXhNT0ZCbnAvVW95MURTeFJBMmFi?=
 =?utf-8?B?cDVTYWprcEZXSndENnpwWDh4QUY1dHZISGw1NnZRM1JGWHU4cFVTMjM3SEg1?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef8725d-811c-4255-50b2-08dd617df0cd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:52:49.7789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwFMJ6U2CT1l8sbcl5UEo1QNLpigaKz+vNYyCbgO3SLOdbJOIwkaDHxKcGmWCngYCJOTLCnAEF0LN1dcwdGqtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
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
Subject: Re: [Linux-stm32] [PATCH iwl-next v9 10/14] igc: add support for
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

T24gU3VuLCBNYXIgMDksIDIwMjUgYXQgMDY6NDY6NDRBTSAtMDQwMCwgRmFpemFsIFJhaGltIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGUgImV0aHRvb2wgLS1zZXQtbW0iIGNhbGxi
YWNrIHRvIHRyaWdnZXIgdGhlCj4gZnJhbWUgcHJlZW1wdGlvbiB2ZXJpZmljYXRpb24gaGFuZHNo
YWtlLgo+IAo+IFVzZXMgdGhlIE1BQyBNZXJnZSBTb2Z0d2FyZSBWZXJpZmljYXRpb24gKG1tc3Yp
IG1lY2hhbmlzbSBpbiBldGh0b29sCj4gdG8gcGVyZm9ybSB0aGUgdmVyaWZpY2F0aW9uIGhhbmRz
aGFrZSBmb3IgaWdjLgo+IFRoZSBzdHJ1Y3R1cmUgZnBlLm1tc3YgaXMgc2V0IGJ5IG1tc3YgaW4g
ZXRodG9vbCBhbmQgc2hvdWxkIHJlbWFpbgo+IHJlYWQtb25seSBmb3IgdGhlIGRyaXZlci4KPiAK
PiBPdGhlciBtbXN2IGNhbGxiYWNrczoKPiBhKSBjb25maWd1cmVfdHgoKSAtPiBub3QgdXNlZCB5
ZXQgYXQgdGhpcyBwb2ludAo+ICAgIC0gaWdjIGxhY2tzIHJlZ2lzdGVycyB0byBjb25maWd1cmUg
RlBFIGluIHRoZSB0cmFuc21pdCBkaXJlY3Rpb24sIHNvCj4gICAgICB0aGlzIEFQSSBpcyBub3Qg
dXRpbGl6ZWQgZm9yIG5vdy4gV2hlbiBpZ2Mgc3VwcG9ydHMgcHJlZW1wdGlibGUgcXVldWUsCj4g
ICAgICBkcml2ZXIgd2lsbCB1c2UgdGhpcyBBUEkgdG8gbWFuYWdlIGl0cyBjb25maWd1cmF0aW9u
Lgo+IAo+IGIpIGNvbmZpZ3VyZV9wbWFjKCkgLT4gbm90IHVzZWQKPiAgICAtIHRoaXMgY2FsbGJh
Y2sgZHluYW1pY2FsbHkgY29udHJvbHMgcG1hY19lbmFibGVkIGF0IHJ1bnRpbWUuIEZvcgo+ICAg
ICAgZXhhbXBsZSwgbW1zdiBjYWxscyBjb25maWd1cmVfcG1hYygpIGFuZCBkaXNhYmxlcyBwbWFj
X2VuYWJsZWQgd2hlbgo+ICAgICAgdGhlIGxpbmsgcGFydG5lciBnb2VzIGRvd24sIGV2ZW4gaWYg
dGhlIHVzZXIgcHJldmlvdXNseSBlbmFibGVkIGl0Lgo+ICAgICAgVGhlIGludGVudGlvbiBpcyB0
byBzYXZlIHBvd2VyIGJ1dCBpdCBpcyBub3QgZmVhc2libGUgaW4gaWdjCj4gICAgICBiZWNhdXNl
IGl0IGNhdXNlcyBhbiBlbmRsZXNzIGFkYXB0ZXIgcmVzZXQgbG9vcDoKPiAKPiAgICAxKSBCb2Fy
ZCBBIGFuZCBCb2FyZCBCIGNvbXBsZXRlIHRoZSB2ZXJpZmljYXRpb24gaGFuZHNoYWtlLiBUeCBt
b2RlCj4gICAgICAgcmVnaXN0ZXIgZm9yIGJvdGggYm9hcmRzIGFyZSBpbiBUU04gbW9kZS4KPiAg
ICAyKSBCb2FyZCBCIGxpbmsgZ29lcyBkb3duLgo+IAo+ICAgIE9uIEJvYXJkIEE6Cj4gICAgMykg
bW1zdiBjYWxscyBjb25maWd1cmVfcG1hYygpIHdpdGggcG1hY19lbmFibGVkID0gZmFsc2UuCj4g
ICAgNCkgY29uZmlndXJlX3BtYWMoKSBpbiBpZ2MgdXBkYXRlcyBhIG5ldyBmaWVsZCBiYXNlZCBv
biBwbWFjX2VuYWJsZWQuCj4gICAgICAgRHJpdmVyIHVzZXMgdGhpcyBmaWVsZCBpbiBpZ2NfdHNu
X25ld19mbGFncygpIHRvIGluZGljYXRlIHRoYXQgdGhlCj4gICAgICAgdXNlciBlbmFibGVkL2Rp
c2FibGVkIEZQRS4KPiAgICA1KSBjb25maWd1cmVfcG1hYygpIGluIGlnYyBjYWxscyBpZ2NfdHNu
X29mZmxvYWRfYXBwbHkoKSB0byBjaGVjawo+ICAgICAgIHdoZXRoZXIgYW4gYWRhcHRlciByZXNl
dCBpcyBuZWVkZWQuIENhbGxzIGV4aXN0aW5nIGxvZ2ljIGluCj4gICAgICAgaWdjX3Rzbl93aWxs
X3R4X21vZGVfY2hhbmdlKCkgYW5kIGlnY190c25fbmV3X2ZsYWdzKCkuCj4gICAgNikgU2luY2Ug
cG1hY19lbmFibGVkIGlzIG5vdyBkaXNhYmxlZCBhbmQgbm8gb3RoZXIgVFNOIGZlYXR1cmUgaXMK
PiAgICAgICBhY3RpdmUsIGlnY190c25fd2lsbF90eF9tb2RlX2NoYW5nZSgpIGV2YWx1YXRlcyB0
byB0cnVlIGJlY2F1c2UgVHgKPiAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gVFNOIHRvIExl
Z2FjeS4KPiAgICA3KSBEcml2ZXIgcmVzZXRzIHRoZSBhZGFwdGVyLgo+ICAgIDgpIFJlZ2lzdGVy
cyBhcmUgc2V0LCBhbmQgVHggbW9kZSBzd2l0Y2hlcyB0byBMZWdhY3kuCj4gICAgOSkgV2hlbiBs
aW5rIHBhcnRuZXIgaXMgdXAsIHN0ZXBzIDPigJM4IHJlcGVhdCwgYnV0IHRoaXMgdGltZSB3aXRo
Cj4gICAgICAgcG1hY19lbmFibGVkID0gdHJ1ZSwgcmVhY3RpdmF0aW5nIFRTTi4KPiAgICAgICBp
Z2NfdHNuX3dpbGxfdHhfbW9kZV9jaGFuZ2UoKSBldmFsdWF0ZXMgdG8gdHJ1ZSBhZ2Fpbiwgc2lu
Y2UgVHgKPiAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gTGVnYWN5IHRvIFRTTi4KPiAgIDEw
KSBEcml2ZXIgcmVzZXRzIHRoZSBhZGFwdGVyLgo+ICAgMTEpIEFkYXB0ZXIgcmVzZXQgY29tcGxl
dGVzLCByZWdpc3RlcnMgYXJlIHNldCwgYW5kIFR4IG1vZGUgc3dpdGNoZXMgdG8KPiAgICAgICBU
U04uCj4gCj4gICBPbiBCb2FyZCBCOgo+ICAgMTIpIEFkYXB0ZXIgcmVzZXQgb24gQm9hcmQgQSBh
dCBzdGVwIDEwIGNhdXNlcyBpdCB0byBkZXRlY3QgaXRzIGxpbmsKPiAgICAgICBwYXJ0bmVyIGFz
IGRvd24uCj4gICAxMykgUmVwZWF0cyBzdGVwcyAz4oCTOC4KPiAgIDE0KSBPbmNlIHJlc2V0IGFk
YXB0ZXIgb24gQm9hcmQgQSBpcyBjb21wbGV0ZWQgYXQgc3RlcCAxMSwgaXQgZGV0ZWN0cwo+ICAg
ICAgIGl0cyBsaW5rIHBhcnRuZXIgYXMgdXAuCj4gICAxNSkgUmVwZWF0cyBzdGVwcyA54oCTMTEu
Cj4gCj4gICAgLSB0aGlzIGN5Y2xlIHJlcGVhdHMgaW5kZWZpbml0ZWx5LiBUbyBhdm9pZCB0aGlz
IGlzc3VlLCBpZ2Mgb25seSB1c2VzCj4gICAgICBtbXN2LnBtYWNfZW5hYmxlZCB0byB0cmFjayB3
aGV0aGVyIEZQRSBpcyBlbmFibGVkIG9yIGRpc2FibGVkLgo+IAo+IENvLWRldmVsb3BlZC1ieTog
VmluaWNpdXMgQ29zdGEgR29tZXMgPHZpbmljaXVzLmdvbWVzQGludGVsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBWaW5pY2l1cyBDb3N0YSBHb21lcyA8dmluaWNpdXMuZ29tZXNAaW50ZWwuY29tPgo+
IENvLWRldmVsb3BlZC1ieTogQ2hvb25nIFlvbmcgTGlhbmcgPHlvbmcubGlhbmcuY2hvb25nQGxp
bnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaG9vbmcgWW9uZyBMaWFuZyA8eW9uZy5s
aWFuZy5jaG9vbmdAbGludXguaW50ZWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTogQ2h3ZWUtTGlu
IENob29uZyA8Y2h3ZWUubGluLmNob29uZ0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2h3
ZWUtTGluIENob29uZyA8Y2h3ZWUubGluLmNob29uZ0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogRmFpemFsIFJhaGltIDxmYWl6YWwuYWJkdWwucmFoaW1AbGludXguaW50ZWwuY29tPgo+IC0t
LQoKUmV2aWV3ZWQtYnk6IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
