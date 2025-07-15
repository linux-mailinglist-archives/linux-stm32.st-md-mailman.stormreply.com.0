Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952DB1487A
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3BC8C3F938;
	Tue, 29 Jul 2025 06:48:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C7A9C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 13:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+xN44higJDYVR8xjYO7I6t5HR5djbaNb/iaiIkZgAYliiNHgmV0azQMXacP/6SGRDTy/eIlKS83wOaOa9WhocU5BNIiiG3ZlWG0V2CYlw+QRQmB1ysBenssQMHa0/XseXeNrND0v2gOrxLZMb9pspPhL8Bp96wp1k5K+YJ+Ov2wXYeb+J2VXD4JPNQ5jtMWlp4uUsmN4EII8SWLFWtnJ9c/HbI9zEjNk3X8zSTF5o9H54yR9ZU3zWjZWucpWyomR0JWQ8et1LWJZf8uJLA1mJFoIcKl22payyD6k1PdKcTjTia3URihbe1jOKEmdgJmQ2BTrK9Oz8FrCvcObGNVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rNGVNFUElU+tLxF1Q1wk/syDe1um4IUbkbhDMi3us4=;
 b=IjBPD8Xj3DCyjcB6UZLvJ12QSgqY3H8lCIjlePnvXN2zIlcUSrNhuC0t7HS3qLWXIHc+KlKtx1CocZHMqvhj40w03YPhgMh604U7uGTkC/CrScZ4YGgYJ1qxQ42oEwMnZSJzuKbk12SUAZJlJh6ZgFakyBZMNrdJrz8ugYXYV7mYqaRY/gvB72mApa2rug5X47aGXNyKnpCyp2pkRDe4CIRZsuJMIZBvlGM+6XxtQEN52WLJhvbH/BNFozFbTWqZwzGs++2mq1TubEtQ9VLgTNPoYnXU/+Bp/y3LKkkanEjg/42uHTjuglxg/vqF6VQsaShrH2Np6rpO1qKEsxUTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rNGVNFUElU+tLxF1Q1wk/syDe1um4IUbkbhDMi3us4=;
 b=GmdOTHFmn9B/X6WRneAx46gQ+qx40wGq206oeLVCIFvauUPB6ETf+b8mUbn9WXmTkLTL8PhnCalirtNL11Pt3cQ/2U0LJftBIlVFNSzzAQ3gEQdJqfdj7IeAUNhxJgZQHPhq1yfPuF+0dKNtdxszcFydiRgJoPhmdv8VJ/TtCbzKOvkYPtbH7cMjHA7mRqbv0PtF5zvXS4gih/b3oM3Ec4S89VP5pYNEeCHJ1a+5iHxWDC6HPXx6diPmKgeP/Gb8ErSS6E/00CYMOeH577DsACX3X89a7jrlwMOoFgFZwc+8z9WzLv38yecf72NIxg13TE438U1UZnQWmS6UWKn2Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by PH0PR03MB6656.namprd03.prod.outlook.com (2603:10b6:510:b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 13:17:51 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8922.025; Tue, 15 Jul 2025
 13:17:51 +0000
Message-ID: <21a0e265-6b2c-4bcb-b0ac-5fd47503f909@altera.com>
Date: Tue, 15 Jul 2025 18:46:16 +0530
User-Agent: Mozilla Thunderbird
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
 <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
Content-Language: en-US
In-Reply-To: <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
X-ClientProxiedBy: MA1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::26) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|PH0PR03MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf7c630-736b-4dff-9c7e-08ddc3a1ffcc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkdvZGNuNTJRT3g0WW82NEFFMlIrdys3c0EyejhtcEliZk1wN21FWHRpRU9t?=
 =?utf-8?B?MVAyR1QrQzBQazNaWFp6VHkzcWU3TTFIZjJzbDMvdmY4L0xrSmNmU0tuOWJv?=
 =?utf-8?B?cU1SdFIrRTZBTFhKZkVWeVFwN0xpdGhCZ1ZyWmJsWWZWZE5UTUVvNzVoQmdD?=
 =?utf-8?B?ODUxN0NKbkpSaFJoRGd0enlBUy9ra05SdzdJSWlqT0NpaEVRTkFIZnh1Z3hN?=
 =?utf-8?B?OXF4MmY4TVBtYTlLMmUvN09PdDFtdCsyNzYvdHdkZUZGa1BaaFdnMmdnMVla?=
 =?utf-8?B?SFdwdTc2V2VjN1MzSkt2M1p2Z0o3RXNEMjRTK0NBZHRFL1hWZWNONXRGWjZ3?=
 =?utf-8?B?UU5mT29mUzViQTFodm1aMXRpTHJ2dmlJOGc1UDdETlhkRUNsQTdrSXFibThq?=
 =?utf-8?B?cUIvOGJLMGZiS0lEZmM0NHVUQWJDMEVnY05HZEhYSS9pUVN4RS9aa0J4VDVj?=
 =?utf-8?B?MEd0RWUzcGoyYkZZZVBQb3ZhdE5XdXdZNklieTVBWmVCUjhkRDRERmNVdEh6?=
 =?utf-8?B?bXZSUlBTRm5oZFhyUGZHMEhubW5EaTBIeFBZOEV2SWNOTkswUmcxMGplczNn?=
 =?utf-8?B?b0REeURXSXNjTkNDNlRveGJqN01wQTVxRDF0U2RPSHlSWGh6elRDWGZMRURS?=
 =?utf-8?B?WU1NUHo4L2M1N1p5Mk1zYkFHTlJmZCtscmZUSWN4M2JQbW9YbFNsQmRYN1Ix?=
 =?utf-8?B?QTF6aVhhQnRSLzRSNWNGTFdhNkZxVjBoL0U2c2RPbFNWVmN3NE90RnpWK0hT?=
 =?utf-8?B?WkxrcWowbXdxakdlU3pOQWVTOEtnYmxQQWxrK2lIZTZnSmtsVnBERkx3S29R?=
 =?utf-8?B?a2lpSFRRSGtvODBCOWVDS2UzUnhmSjNzalZSMDR3M3BrWUxPMU5rMWNLMVB4?=
 =?utf-8?B?WU0xWnNFaUpLaUpscUtrVlpOVHlCbktxcG9jUU0xVWV4UDhVUGFQNC90ZXFZ?=
 =?utf-8?B?L0xpbUZVMjdEaUpFdWQ5OEs0dnBmZlNrTnJGWTJ3OFBHSkVpREp0STJONnQ2?=
 =?utf-8?B?VWVrNC9zNDh2Y2RnK3VMMGxYS3NBS2x2U2xnNEpzNC9lUXgycVphcnJ2Unpi?=
 =?utf-8?B?Rkg5V1JJYXMvTVgxU0JHeFpGR0VIMnhuY1g3cHRQRmRTNzhMcW1jSmtYNXRp?=
 =?utf-8?B?elB2cWgxVUhqdVBMaTFJSTJXcTJ6dG12M0F5UnRZNlVNMHJ6a0RxL01SclJO?=
 =?utf-8?B?NzFCQjRNZG1xcDdLeWQwM0dnSXk4MHF2M1BwLzJBQ0p5MlVUYlQzaHdjNWll?=
 =?utf-8?B?WExncG1RcTRUNjlla0gxVW9DcWtETlQxS2xneFBKTTBsSE1sMlFWenRzNUJa?=
 =?utf-8?B?bVhua2ZCdEQxd3p5VDRrWk1QaGtkMDdsaC9jRFJKQ2x1clZqcjg1UXVuaXdF?=
 =?utf-8?B?ajRlUXNVY1pFZzRFRURDMk9lY05sTktHTDYwRXZ5MFR1LzlZMjBsaHBlTXhL?=
 =?utf-8?B?UW8xTVZIZFhqQkpGZkV6eEtLQ1FISG56YkErcm4raWQ5M0t4NTl2eWJRU0pU?=
 =?utf-8?B?MmgxSi95OWZjMnIybXJYTVRHc1NKNFFUaCthK2h1Z1VGRG9rRy84KzRkcHlW?=
 =?utf-8?B?ZjR0cUdndWtrTE9IQWNKZjVTNkloR0Z5U1BvSEluL2lZT1Zodm42RFJHMlRs?=
 =?utf-8?B?dTc3T3FXN2ZqeWc4UWsrVVhmR1FzVElUUWNWMXVSYzU2ZkVGWEp3SWpDOXc1?=
 =?utf-8?B?ckQrbnlSVFpaZVEvVjgrb0hqQ2VnR3pnYndpSHNiTmRpemlIUExMQUJLbWYr?=
 =?utf-8?B?eElncFI1OHdVZkduTlBoSmJGZjRtYmNxeit6RmVzeXFWR1krQlAxRDFPN255?=
 =?utf-8?B?S0YzWG16bmNEbXBSYUg5R2NaYXREbjUxbGJ6WWhNOHFHWGlONHErS1RTdHBW?=
 =?utf-8?B?YjRlWEtnQmJZdDlZS0NQOU92bXJZdW4rRVowYURkaCtvWWI1dlNHS3ZUMXM1?=
 =?utf-8?Q?/pyaJCjz/io=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnRaVUx4SzFPTlRXdENaM2tmbU9IS3UzUFJRTVhsRU5rbGxzbHM5VUdyTEJD?=
 =?utf-8?B?MWdrVUF0c3FsdjZobEljSFoxMXFwRnJXaVd4Nk9aWVE4c01yeGVzRG1uSHFJ?=
 =?utf-8?B?dFJOTVFoNU9JQmgrQWdKRHRKVXZtZWF5RTBwVW0wMlJjZkNWZEQxY3RPNFc2?=
 =?utf-8?B?T3FBcEwvSFZ4VTVLY3YzODAydDltRkZrYTVTWDZmSk9tVHJoZURFSWZncG8x?=
 =?utf-8?B?TXhHU2FXSUpHLzRRclpPT1NkdlhQUG91cXpodnIzKy9wWmZsSUgrendsM01u?=
 =?utf-8?B?NnpRZGFRVXZWNTBFcWpZeTJ5R29vRkRRazlFWDRyT2t4UTNwNzhKOFBYVWVr?=
 =?utf-8?B?OWEva0Uzc2ZNbFhOM2NHbnJuUkJ0djFRUGoxMFpMbzdMdjcvcWlPUDhKazFG?=
 =?utf-8?B?U01pSUtnS2NxSFpjZVE5YTcwamFlN1pNYUw5Q1ZGbzZjMTg3eWJZVlZaU0dT?=
 =?utf-8?B?U0FPbEZNdlh6OUhBODQ2L1RrT01wVDNTTjFSQ1FLOTN5bjFsNTdLWnFLM2Fo?=
 =?utf-8?B?Q2tZV3lCNmRuVS9Zdno5VjBzRlNmYktrNVNiaUtwSUtWckdhZzVtZGxQbGhI?=
 =?utf-8?B?K2VUVmJHb21wbGFGVC9Va1ZnclBDejAyNUZVQ3ZvMTNjN0FYZnpwc210OGlv?=
 =?utf-8?B?c2Fza1lwNTVBMFJVWFNpcjlXNXQ5QVFDSEYxcERzVVBEVm5kUExxZkI2a1BL?=
 =?utf-8?B?cFI1UlFOVjlNUThJRm1GZkZrYkUwYkpDQy9QUGNaeCtlWXAvZGJZak9wbnNo?=
 =?utf-8?B?S3grZ0ljdUZna2JjNmdkN1BGeFYveDdEQ0dvNFRaMGx0aWRSenRQb0RYaHh4?=
 =?utf-8?B?dnV4OXZGZGxGcytDeXdnUUYwcnN3bGlRbjNsWS9ZYkU0NWJOSlVMTytZRkI2?=
 =?utf-8?B?QW1idmhJWDQyUFBVYzhaaWRGMzE5MDVvcUJpU25KdThTNEtXRzFIZGwrb3VO?=
 =?utf-8?B?WGZqVENseTlGd3h6RmhFa3hOVWdZSlhzSnJpQkhkYkRDaFcwRDZFNkdCRGVr?=
 =?utf-8?B?aGN0eS9tZWVFbU9SakZuRzRBUUprSUp0aWZiYUtJM0MzeWdLTGlSZTRiYW5X?=
 =?utf-8?B?NnFWS0REcS9mSlNtOVgzMkpvR214SlhaVWlabHF6Qm1nNkJZZytrcGFkOHBh?=
 =?utf-8?B?M29oVlBIMFRaRHpMeUVUZ24rRGt6MFV1TnJVRVpFc3lSZU9ZT2RaRFFwM3JK?=
 =?utf-8?B?bkN5UVJCVEZXbmhyMml0SW9YbmhwcVpTVkZuSXMvVVQ2NGVoSU5pZ25BYWRn?=
 =?utf-8?B?UXI0L1R4SWY1TzRxNGFzYTY2RDBETGI3R3NSUDdkU1Z5cWtvenMrUEN2engr?=
 =?utf-8?B?dG8zZndRV2FqNlRHTDMycThhb2g5OGpzNTNCTDVxT1NUTUZFNm5CUTB5NkxC?=
 =?utf-8?B?YS9nSGE1OGFSckdIbTNtbTNFRDUyMTkvTjhLRlMvcnZTa2hhZDRoczBjOVpu?=
 =?utf-8?B?c2Y1bWNFNkx0ZEcrdVppTXZpT3JQQkJJV0ZXOUVOUmxRdnArWFBiRTJLSklv?=
 =?utf-8?B?RGtJTHVMR1JvOEFqbHZpMnkreVNua1lzZlRHN29MaTV2d2VLNHhSdGlBUVVQ?=
 =?utf-8?B?ek5Xa3BkSDZ6QUpON0MxSUxyM3NidkNVcGM1L0crRFBRUUc1anF1SHNBaXpF?=
 =?utf-8?B?SEp1a1F6d3l3bEdUa1FFbk5xSUdRckJYUUVGaU9TdWtJdFRXSWhKcndNUnFm?=
 =?utf-8?B?ZXpSQmpra0JnMnVXaVFuZ1gzTUloeDMrRDJ4MFFUa05ZNmVqU0N5V0d0NzBT?=
 =?utf-8?B?STdDYVJzenY1TGRyMDQzOWlZMFZ2N0duWmtYSHlTOFJvTjluY3dsaWhZTUs4?=
 =?utf-8?B?d3JvQkN1clZITXBxeC9sUTVXdkJQVllvSWt3SFNQTmF1YkZhM0hUcnJCamls?=
 =?utf-8?B?QWRBbkFwLzg4UFg2aVZabkNHK3VHUjBNY0ZqTnRqZGMxM0w1L2JGWWpETGV5?=
 =?utf-8?B?VmptZVkzM2U0Y3dvblRDcjEwenJDdFdTNUw3cG5sNTNjajRja3ZZa3hRelh3?=
 =?utf-8?B?NHN4V1hjWXB6cGltd2dJbDVtcDdIVEg5c2phbVdMdDU3Sy9jdG5nT2R4dFFS?=
 =?utf-8?B?Q1RQKzloc3lMUEZYYm40S3ZwSFBNSkU5TE1BY24wZXFCS0k0S2ZpZXJzSWhv?=
 =?utf-8?B?U215TFZpcFBtRHhmdmxEV1YyRU81OVJQT3RmVkFOMG04Z1NyUWVVazd4M0VM?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf7c630-736b-4dff-9c7e-08ddc3a1ffcc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 13:17:50.9330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSiYKBL7exorEqt6ChefGab+AogIWTvYtcY1o9qSANf6GKFxRW6KZ2vcEbm++A+iNcltqh1NqCT3TT6uexXJ+CZKCC1h0nINy0cKLXZ/qko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6656
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: xgmac: Disable
 RX FIFO Overflow interrupts
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

Hi Andrew,

Thanks for reviewing the patch.

On 7/14/2025 7:04 PM, Andrew Lunn wrote:
> On Mon, Jul 14, 2025 at 03:59:17PM +0800, Rohan G Thomas via B4 Relay wrote:
>> From: Rohan G Thomas <rohan.g.thomas@altera.com>
>>
>> Enabling RX FIFO Overflow interrupts is counterproductive
>> and causes an interrupt storm when RX FIFO overflows.
>> Disabling this interrupt has no side effect and eliminates
>> interrupt storms when the RX FIFO overflows.
>>
>> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO
>> overflow interrupts") disables RX FIFO overflow interrupts
>> for DWMAC4 IP and removes the corresponding handling of
>> this interrupt. This patch is doing the same thing for
>> XGMAC IP.
>>
>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
>> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> 
> Please take a read of:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> This appears to be a fixed, so the Subject: line should indicate this.
> Please also include a Fixes: tag, and Cc: stable.

Agreed. Will do in the next version.

> 
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
>> index 5dcc95bc0ad28b756accf9670c5fa00aa94fcfe3..7201a38842651a865493fce0cefe757d6ae9bafa 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
>> @@ -203,10 +203,6 @@ static void dwxgmac2_dma_rx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
>>   	}
>>   
>>   	writel(value, ioaddr + XGMAC_MTL_RXQ_OPMODE(channel));
>> -
>> -	/* Enable MTL RX overflow */
>> -	value = readl(ioaddr + XGMAC_MTL_QINTEN(channel));
>> -	writel(value | XGMAC_RXOIE, ioaddr + XGMAC_MTL_QINTEN(channel));
> 
> What is the reset default? Would it make sense to explicitly disable
> it, rather than never enable it? What does 8a7cb245cf28 do?

The RX FIFO Overflow interrupt is disabled by default on reset. Commit
8a7cb245cf28 also avoids enabling the interrupt rather than disabling
it. This commit mirrors the same thing for the XGMAC IP.

> 
>      Andrew
> 
> ---
> pw-bot: cr
> 
> 

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
