Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD98BAA9628
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 16:46:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65CE7C78F70;
	Mon,  5 May 2025 14:46:34 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 619ECCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 23:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puq/t9eQsXD5NUE5uc3PxkZK+eoztO/wGwTUl34FCBRXXlEhxVqxRBvgQn/rFxgh2JXKeFn9q4rIwukbPTOCsegdIFSRiG1VcJ25WKjSYlje77gX3nrldXWYy69XllrbsTUyGZkjjniW6VV05qKVGaymTytOlo6uNXBIJjkb+DlIflSgknreln8mm7EiAQckkI1yS8w0Mstbt+eUx+9udLHlPATQ6YxbHhZYSxhSxV0EtDxeURQvtP2DCVGzU5xn8fjVFl6DqM7mCBiWxzq6aKeVkkDB8uRXdGBXo2v/hCe7vGTZPTmTa/sy/stjQZJ2a/Nak5c90EcZyDaGhy8oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vWecc5xVBpX6ngVzLO6G4scdsjbC6dmV9eULon0zJg=;
 b=AwfI9+CAisyeyammHrekCGHE0vWQTGf+YOXeUGrzFUokLxAvQWkCnt4Rk81Pt6YTVPoJVE70UeTFZKRDGrLjhfxMXS8FUzSWl8uNTnDVlvg7kgq+yfviNbimFx0HUsgHmcWbgcr1G/HZiAT18pVJVfbbyikmPrtPy8MU+dNmN05MQkiU2CxNot2cYZ5LHFkB3RsnmkAlXIOVoxMetxNKYtouDrTVb2G3okJ7FHkuBOYZJ7lWtCUi3TUMoFaB2nXEcsseSyxhvcw/x9rjfbqiq/v/+VitdqLcJWPqvKnL0dBZfOszZ1GBdwvZPaH9jBjfCOZ+WiGDt5HIWVnDmO9mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vWecc5xVBpX6ngVzLO6G4scdsjbC6dmV9eULon0zJg=;
 b=1Iz0nfdPhLJNqKZhyfUyPVQ8sYzRGkkOI1jo1U55HDSKSZSegKTt0//QUIZN30NU8DNyuvGfzdL1U6yL0qe3RUR/c08Tkdo+FMr05bE8pLcTea3++xVgKnXPV6E3omnZVAq21ibtEYNLxDI7EiXGwKcr2FMPe21V+H6lvO8F2n4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by CH1PPFF5B95D789.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::62a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 23:56:58 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 23:56:58 +0000
Message-ID: <ab09cbdb-8e30-4720-8ca5-66488922db33@amd.com>
Date: Thu, 1 May 2025 18:56:54 -0500
User-Agent: Mozilla Thunderbird
From: Tanmay Shah <tanmay.shah@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, "Andrew F. Davis" <afd@ti.com>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
 <8c8e9362-c116-4a80-bcb7-a44df68e0bfc@amd.com>
Content-Language: en-US
In-Reply-To: <8c8e9362-c116-4a80-bcb7-a44df68e0bfc@amd.com>
X-ClientProxiedBy: SN7P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::27) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|CH1PPFF5B95D789:EE_
X-MS-Office365-Filtering-Correlation-Id: f17d7588-4623-42a6-6ac5-08dd890bdb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1MzR2VRWUVwNExtdyt6ZjVtUWhYRFhxNzQvY2pPUjlhYm9JS2l0S3RZMmRm?=
 =?utf-8?B?bUhTdGs5Mm5WVUpkRElEWmxHY3ZqUzMyMzlreDBmQ3ptRlNnUU1ncE5udnps?=
 =?utf-8?B?Nk9pekQzNnJzTXhyRldSVGtqM0tEZ3laVXQvdXJuMit5c3RENFIvV3lDRUJE?=
 =?utf-8?B?OVRhMWRaTUcwNWNjL0NLd3IzRVFBL2x2a2lNc1BoWHdpNlZQQTBRejZJR3JR?=
 =?utf-8?B?M2w1ckxCRGw1eU5LclNMWWFsWGlZKzEzaWZZMjNWeTM2NUVhcWt1WHhUTnBU?=
 =?utf-8?B?Nzg5ZERIcnB3Yno3clEwRmYzd0M4enRaanJtVFZpRkNQZ2ZTcitkdkFtNnJn?=
 =?utf-8?B?Sjc4R2xMNUREcXZOUzBrSllUK1VOaSt2Z0pkMVFhcFFSeEh3bDB5N0FySFNJ?=
 =?utf-8?B?RHpFUFZpaVA3aVlJbitWK0ZSdVpvUjVacTIvcEFvMHFOZXR6em1valZUKzVr?=
 =?utf-8?B?SjhJWnpDeXR5bTdiV1IzTnlmTUdDOEdSeEE4ejcwc3FrekZTd05HNktLb2tt?=
 =?utf-8?B?MVRSNmdPeitUY2lnVUxkc3FYbmFiL056dlBieG00RHJTc1IraGZGVE13UldB?=
 =?utf-8?B?dkJIMlBGZVVIYkV5MHhNWVBrZElkcjFPbXNvOS9zY3pWY3pEKzBraG1YSnVu?=
 =?utf-8?B?S3hlTzBJUS90dDdqdXlhM0d4VjlTZTRUYzUwU0ppbnJNRkREUUZYMGJWNFZu?=
 =?utf-8?B?bWVHY21rZHd6a1FDNUpzQ1BqQy9CVjBxMFltc1MyTTJmL0RzVGFjN3M4T3pM?=
 =?utf-8?B?VUhRTXU0dWVUQndGY01FUGxCVVZUaTFGOUM2ZU9UdWlOR2p2QzQyZGtmVU1w?=
 =?utf-8?B?NkRPcHBFNDdYYXNSRTVSV2Y5N3pSRnowNThPcFE4UGlQWWp4dElXV2szK1dP?=
 =?utf-8?B?ZytEY3l5cFhiVmFYQm1hZDZveTNqdG83ZktNUXNmMGFjRWVNOGZ1dTJBTkxs?=
 =?utf-8?B?YmQyRHpUNUpUbzduT1lQL25Ga2RicVpQYjYwRVpRT0RhczdXVk1Nc2l0ZTBj?=
 =?utf-8?B?WnZQTmdEYW5yU3kxY1diOXJMRWo2bnJhTE9IMFZmbFRzc0Z2aGRlcU1kY1Vv?=
 =?utf-8?B?Y0YwY1htVVNONEwyRmNMYTZoUWs5ZEVjdWlUTTBqL1BSWEFEMWwwWDNqSmRh?=
 =?utf-8?B?ZEUzSjNrK1EwSGIyU3RYQ3lWbVJVUzllM1B0ci9ueWdDR3lmaVlEVzNpY2JL?=
 =?utf-8?B?TkZCdUtNbCt3RnZoWWs2UjczV01pUHR1LzFERVFhV2trRW9NTEkzSUhaUlMr?=
 =?utf-8?B?TFpDait2YTAwQ0xMdzVuMjBmMm5MT1E4dTVtWE9qOFI5SzN3eTZwQ3N4YzEv?=
 =?utf-8?B?VXd0Q1FGRGFUaXpEN3BwT3RWbFdZUW5HZDRyRUpNeTdvT2VWNkJId1U2ZTQ1?=
 =?utf-8?B?K1FrZDJLT0h1dUVGbGtTNWNsR3hhcFYxMTRaY3pBK1FqVmp5dHlmNWQ1d0FY?=
 =?utf-8?B?ZmFHQXppdGRuVWxpT1NKMVhhSzF3WG1ZbHROM3BIdXBNUHBuYXVFU2dvMDFF?=
 =?utf-8?B?eEFoTkRnWkpUU0Y1Y1BaV1RNOXFIdzNHaDJpNjJFWXpLdzVRYUFRS2V2RzNH?=
 =?utf-8?B?eFdWQTlXWWY3empvTHlOdGVHUlU1TkQzMUEzSVMvUXMyaHJZbXFUT3pmVVFQ?=
 =?utf-8?B?Q2libm5UamszdzNYSUJLbDZiSEUydExvNGxxQmt1MkhmWGV5enJxakhIMWJH?=
 =?utf-8?B?bWQ1c1RQVEpuT1RlZjZXTzRjOXQxbjdCSzBCME5Tb2lXQU82YzMwai8zZmtu?=
 =?utf-8?B?N3VUdjlHZVNtV2xSSWo5SVZiQ05UMjQ2bFBEMnFCR1NFc0xrazlaR2dwZkR1?=
 =?utf-8?B?Y2o1b04yYXRvLzJzZUxETHA2SDRsWkJpK3hjSVlkNmJyV3h2eFh3ZTQ5QitG?=
 =?utf-8?B?NHNVQ1JQa1h2cW5Xd08zRTF1dG55SHBHOHQ3TWZVc3BOeTdOUGF6R01RdHRX?=
 =?utf-8?Q?TtRCP60T5KQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4956.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFiYk84cXJTTTVjbXJ0NVRXeDM2aFV0ZjJiVnNtNjZZb2h5TDRuZVRzeTVr?=
 =?utf-8?B?LzNySXUwK2JTam5VNHJLOG9GZmI2VHRkbnROUDZEQ0NpL1JOcE5yMUxueWZs?=
 =?utf-8?B?QUx3WFNMclY0S3RiaGJPWnlOajVrR1JzUDgvdVdJMC8xZGNJd3E5OUZEcjEx?=
 =?utf-8?B?NEdSd1NkRTNXdVpOdWFpSjlyVzlYOEtET04xWnFQcXkwT0U3RlB5TVgyREhJ?=
 =?utf-8?B?TytjL1F4aTNIdCtad1dmemRuWjJtL1gxTFpnbklWZHZIRUp2RFNhTy9aQTNX?=
 =?utf-8?B?cVVleFhNUmtOZmhVVzIwVTNzcCt4ckM1UmlWN2I1OWJEUW51TVZYK2RMamMr?=
 =?utf-8?B?REZDL09tcSt5ZVZMUjBCY1dGNEc1Vm1rTXdCbnJlcEQ3MWd1QUd1ZmdvQ1Zk?=
 =?utf-8?B?L1BKNFExMDkxUkYzOGc1WWk2SFcwbjVQMU5WeU8wZFVkcGFQZDc1aE81bFVw?=
 =?utf-8?B?MkxvTHV0aDh0bk5nL0s5aXZ6ZkNISkNvVDlQT1ViRWJ1cTBpVFJDUlhjQ0dU?=
 =?utf-8?B?ZDFvV2F6ZFdRUE0wVlhIZ0x5em8yV05IaXhYa0xQYndBcWx0cllLYlF5bkcv?=
 =?utf-8?B?MHRQK3J5STRHNytUeEhsUnNaOGFQd29scmhzbkRwS3VWMXFvZk93ODNhSE1a?=
 =?utf-8?B?eXZQbnpqQVpXUmo4UnhyeS8ySVlzbGp6bTNoQ1dqTzJCUkRrdnRzbTZ6NXRF?=
 =?utf-8?B?TmFqZGxhd2dRdUFVRHlMbVJBTFkzbm5wenhyMkNDT0oyME5PcnpadTVuejQ1?=
 =?utf-8?B?ZGw4S2ZxaTIxRWF2dkYrNGZhVGhyMWZDTnpuVllYdW9vcTNrN0drQnpsd29k?=
 =?utf-8?B?SVdMUjA0YXl3Qi9PaktIY0NIcnd2dG5hWUQvbVlycFhDb0VEdGNYUjNETGc2?=
 =?utf-8?B?aFdBUUFVRkFFUkRxY1JXZFRFbG9Gc2dhM2g0Q3BOdnNreUMwemZTcmVTOGNp?=
 =?utf-8?B?ZWNRMEtSRTJKZzZzSUZrTjN6NEtZczFKMUtMdVZQdHZEdXBNdzlYbENjYy9p?=
 =?utf-8?B?aUFJYUhJbGF2Nmo3Snk1dTVoUDRYM215YThJb3BWaXFVRlB5eGIrMHVXTzZF?=
 =?utf-8?B?cHppeUxuQ1Y5Q1V2NE9yTUJyM1owbnc4Skx1cE1OWHVuK0FqWEZwZWwrVkV4?=
 =?utf-8?B?SUVGcFlDZFVaa0FqZUVaNURzcU8rV0xxQVQrakFwNXptcCtTZVFObGFHSENQ?=
 =?utf-8?B?bmw0Y2UzZzRXdUpzV0x6Yk1vc1NxaDY1RnkxaEZ0TzQ2d3hmNHYwVEx6MU5K?=
 =?utf-8?B?eGtWY0IxNUN2cGV1a0Y0TENjTjZsNnJHd3JVVWpaNXdCWGFwampxUVFIUXhm?=
 =?utf-8?B?MnBkTE0vYnpLbWp4ZTd0Mk9BMFZvbS9OVmtJemJVK2wvT2I1cUxVWUNaNmtk?=
 =?utf-8?B?RnF1Rm1JTTY5d243Yi84N3NFYk1HMUd3ZXBsYWxINGlCOVZtRUwrMEpudTFX?=
 =?utf-8?B?azQ1R2R4TmRCc0hPWDRQUXR5MEdyNHFjTVNmNUc0Y1NWYVVhMGErLy9UY1dD?=
 =?utf-8?B?dkNnWjd0anQzRFVVY283bHlhTXM3eEJxVGUrWjFyd3FvdDRKSGhSWDZYUTgx?=
 =?utf-8?B?YkRDeS9LbGUvWlc3eG9iNjZ0bkF3ZCtoemVDazRIbWVJMSs3RTcveWJXZm5E?=
 =?utf-8?B?blhKaVl3b1M5cm1iR1dqN3AwMEFocVpDSGc4MldYYkhINFRQVEF4T3NqQXlM?=
 =?utf-8?B?cTd6WXRjQUZqK0ZBTUc3NHpkQ2tlRWtzN1RWN2FJZkFTS2d3N0V2TGl2TWly?=
 =?utf-8?B?NzZIV0tRQU5XYitSSkpFbFRBcGpQTGY3dWoyUThNRlBseGRPa1A3dXJEdG5p?=
 =?utf-8?B?dVkyZ1JtVWtweFVZYnY5dVlJejdlNjRUOTBNTGJvdlJXck9tMVhDNElwQjBk?=
 =?utf-8?B?b1hCWGxMZXE2bXJqdUhvR2lEeUlWUE55ME11VEtrczlxVVlLd3pwL0RxRmVq?=
 =?utf-8?B?WU5CUjFuU2hWZDQ0QUVuT0Z6QmVwSW1wM1B5VTF6MFhXZFRwMHBwN0FYVHl5?=
 =?utf-8?B?UmQ1dnRuSC8wd09yQVU3M1JOYjNkclBMa3E3TTMwZ0JEM3RnYmVCeE5odmlQ?=
 =?utf-8?B?aVdmOUxSa1A2MTJrUlZleDFKV1ZjVHU3N0NTTnBCdGJUR2ZzcVJzZHJsRlNr?=
 =?utf-8?Q?uURVfDPbSGE3eIA8OYokk5eNc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17d7588-4623-42a6-6ac5-08dd890bdb70
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 23:56:57.8250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwNpcm27+iXMVbZ1LXLosPFvnJP//CiBZWpmvskof6c6ZFS4sBs4tYxAEk/kclCf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF5B95D789
X-Mailman-Approved-At: Mon, 05 May 2025 14:46:31 +0000
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravana Kannan <saravanak@google.com>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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
Reply-To: tanmay.shah@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA1LzEvMjUgMTA6NDQgQU0sIFRhbm1heSBTaGFoIHdyb3RlOgo+IEhpIE1hdGhpZXUsCj4g
Cj4gSSB0ZXN0ZWQgdGhpcyBwYXRjaHNldCBvbiB0b3Agb2YgcmVjZW50IGZvci1uZXh0IGJyYW5j
aC4gSSBkb24ndCBzZWUgCj4gaXNzdWUgb24gQU1ELXhsbnggWnlucU1QIHBsYXRmb3JtLiBXaXRo
IHRoaXM6Cj4gCj4gVGVzdGVkLWJ5OiBUYW5tYXkgU2hhaCA8dGFubWF5LnNoYWhAYW1kLmNvbT4K
PiAKCkhpIE1hdGhpZXUsCgpMb29rcyBsaWtlIEkgc2FpZCBpdCB0b28gc29vbi4gRmlybXdhcmUg
bG9hZGluZyB3b3JrcyB3aXRoIHRoaXMgc2VyaWVzLCAKYnV0IFJQTXNnIGRvZXNuJ3Qgd29yay4g
SSBhbSBkZWJ1Z2dpbmcgZnVydGhlciBhbmQgd2lsbCBwcm92aWRlIGlucHV0cyAKb25jZSBJIGZp
bmQgYnVnIG9uIHhsbnhfcjVfcmVtb3RlcHJvYyBkcml2ZXIuCgpQbGVhc2UgaWdub3JlIGFib3Zl
IFRCIGZvciBub3cuCgpUaGFua3MsClRhbm1heQoKPiBPbiA0LzI0LzI1IDk6MTQgQU0sIE1hdGhp
ZXUgUG9pcmllciB3cm90ZToKPj4gQXJuYXVkLCBEYW5pZWwsIEl1bGlhbmEsIEFuZHJldyBhbmQg
VGFubWF5IC0gcGxlYXNlIHRlc3QgdGhpcyBwYXRjaHNldAo+PiBvbiB0aGUgcGxhdGZvcm1zIHlv
dSBhcmUgd29ya2luZyBvbi4KPj4KPj4gVGhhbmtzLAo+PiBNYXRoaWV1Cj4+Cj4+IE9uIFdlZCwg
MjMgQXByIDIwMjUgYXQgMTM6NDIsIFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pj4KPj4+IFdoaWxlIHRoZXJlJ3MgYSBjb21tb24gZnVuY3Rpb24gdG8gcGFyc2Ug
Im1lbW9yeS1yZWdpb24iIHByb3BlcnRpZXMgZm9yCj4+PiBETUEgcG9vbCByZWdpb25zLCB0aGVy
ZSdzIG5vdCBhbnl0aGluZyBmb3IgZHJpdmVyIHByaXZhdGUgcmVnaW9ucy4gQXMgYQo+Pj4gcmVz
dWx0LCBkcml2ZXJzIGhhdmUgcmVzb3J0ZWQgdG8gcGFyc2luZyAibWVtb3J5LXJlZ2lvbiIgcHJv
cGVydGllcwo+Pj4gdGhlbXNlbHZlcyByZXBlYXRpbmcgdGhlIHNhbWUgcGF0dGVybiBvdmVyIGFu
ZCBvdmVyLiBUbyBmaXggdGhpcywgdGhpcwo+Pj4gc2VyaWVzIGFkZHMgMiBmdW5jdGlvbnMgdG8g
aGFuZGxlIHRob3NlIGNhc2VzOgo+Pj4gb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lvbl90b19yZXNvdXJj
ZSgpIGFuZCBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX2NvdW50KCkuCj4+Pgo+Pj4gSSd2ZSBjb252
ZXJ0ZWQgdGhlIHdob2xlIHRyZWUsIGJ1dCBqdXN0IGluY2x1ZGluZyByZW1vdGVwcm9jIGhlcmUg
YXMKPj4+IGl0IGhhcyB0aGUgbW9zdCBjYXNlcy4gSSBpbnRlbmQgdG8gYXBwbHkgdGhlIGZpcnN0
IDMgcGF0Y2hlcyBmb3IgNi4xNgo+Pj4gc28gdGhlIGRyaXZlciBjb252ZXJzaW9ucyBjYW4gYmUg
YXBwbGllZCBmb3IgNi4xNy4KPj4+Cj4+PiBBIGdpdCB0cmVlIHdpdGggYWxsIHRoZSBkcml2ZXJz
IGNvbnZlcnRlZCBpcyBoZXJlWzFdLgo+Pj4KPj4+IHYyOgo+Pj4gLSBGaXggb2ZfZG1hX3NldF9y
ZXN0cmljdGVkX2J1ZmZlcigpIHRvIG1haW50YWluIGJlaGF2aW9yIG9uIHdhcm5pbmcgbXNnCj4+
PiAtIEV4cG9ydCBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vfd2MoKQo+Pj4gLSBSZXdvcmsgaGFuZGxp
bmcgb2YgcmVzb3VyY2UgbmFtZSB0byBkcm9wIHVuaXQtYWRkcmVzcyBmcm9tIG5hbWUgYXMgaXQK
Pj4+IMKgwqAgd2FzIGJlZm9yZS4KPj4+IC0gTGluayB0byB2MToKPj4+IMKgwqAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMzE3MjMyNDI2Ljk1MjE4OC0xLXJvYmhAa2VybmVsLm9y
Zwo+Pj4KPj4+IFsxXSBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcm9iaC9saW51eC5naXQgZHQvIAo+Pj4gbWVtb3J5LXJlZ2lvbgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+IFJv
YiBIZXJyaW5nIChBcm0pICg0KToKPj4+IMKgwqDCoMKgwqDCoCBvZjogcmVzZXJ2ZWRfbWVtOiBB
ZGQgZnVuY3Rpb25zIHRvIHBhcnNlICJtZW1vcnktcmVnaW9uIgo+Pj4gwqDCoMKgwqDCoMKgIG9m
OiBTaW1wbGlmeSBvZl9kbWFfc2V0X3Jlc3RyaWN0ZWRfYnVmZmVyKCkgdG8gdXNlIAo+Pj4gb2Zf
Zm9yX2VhY2hfcGhhbmRsZSgpCj4+PiDCoMKgwqDCoMKgwqAgZGV2cmVzOiBFeHBvcnQgZGV2bV9p
b3JlbWFwX3Jlc291cmNlX3djKCkKPj4+IMKgwqDCoMKgwqDCoCByZW1vdGVwcm9jOiBVc2Ugb2Zf
cmVzZXJ2ZWRfbWVtX3JlZ2lvbl8qIGZ1bmN0aW9ucyBmb3IgCj4+PiAibWVtb3J5LXJlZ2lvbiIK
Pj4+Cj4+PiDCoCBkcml2ZXJzL29mL2RldmljZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAzMSArKysrKy0tLS0tLS0KPj4+IMKgIGRyaXZlcnMvb2Yvb2Zf
cmVzZXJ2ZWRfbWVtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgwICsrKysrKysrKysr
KysrKysrKysrIAo+Pj4gKysrKysrKysrKysKPj4+IMKgIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhf
ZHNwX3Jwcm9jLmPCoMKgwqDCoMKgwqDCoCB8IDQ1ICsrKysrKystLS0tLS0tLS0tCj4+PiDCoCBk
cml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNjgg
KysrKysrKysrKyAKPj4+ICstLS0tLS0tLS0tLS0tLS0KPj4+IMKgIGRyaXZlcnMvcmVtb3RlcHJv
Yy9xY29tX3E2djVfYWRzcC5jwqDCoMKgwqDCoMKgIHwgMjQgKysrKy0tLS0tLQo+Pj4gwqAgZHJp
dmVycy9yZW1vdGVwcm9jL3Fjb21fcTZ2NV9tc3MuY8KgwqDCoMKgwqDCoMKgIHwgNjAgKysrKysr
KystLS0tLS0tLS0tLS0tLS0KPj4+IMKgIGRyaXZlcnMvcmVtb3RlcHJvYy9xY29tX3E2djVfcGFz
LmPCoMKgwqDCoMKgwqDCoCB8IDY5ICsrKysrKysrKyAKPj4+ICstLS0tLS0tLS0tLS0tLS0tCj4+
PiDCoCBkcml2ZXJzL3JlbW90ZXByb2MvcWNvbV9xNnY1X3djc3MuY8KgwqDCoMKgwqDCoCB8IDI1
ICsrKystLS0tLS0KPj4+IMKgIGRyaXZlcnMvcmVtb3RlcHJvYy9xY29tX3djbnNzLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDIzICsrKystLS0tLQo+Pj4gwqAgZHJpdmVycy9yZW1vdGVwcm9jL3Jj
YXJfcnByb2MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzYgKysrKysrLS0tLS0tLS0KPj4+IMKg
IGRyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmPCoMKgwqDCoMKgwqDCoCB8IDQxICsr
KysrKysrLS0tLS0tLS0KPj4+IMKgIGRyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jwqDC
oMKgwqDCoMKgwqDCoMKgIHwgNDQgKysrKysrKystLS0tLS0tLS0KPj4+IMKgIGRyaXZlcnMvcmVt
b3RlcHJvYy90aV9rM19kc3BfcmVtb3RlcHJvYy5jIHwgMjggKysrKystLS0tLS0KPj4+IMKgIGRy
aXZlcnMvcmVtb3RlcHJvYy90aV9rM19tNF9yZW1vdGVwcm9jLmPCoCB8IDI4ICsrKysrLS0tLS0t
Cj4+PiDCoCBkcml2ZXJzL3JlbW90ZXByb2MvdGlfazNfcjVfcmVtb3RlcHJvYy5jwqAgfCAyOCAr
KysrKy0tLS0tLQo+Pj4gwqAgZHJpdmVycy9yZW1vdGVwcm9jL3hsbnhfcjVfcmVtb3RlcHJvYy5j
wqDCoCB8IDUxICsrKysrKysrLS0tLS0tLS0tLS0tCj4+PiDCoCBpbmNsdWRlL2xpbnV4L29mX3Jl
c2VydmVkX21lbS5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNiArKysrKysrKysrCj4+PiDCoCBs
aWIvZGV2cmVzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKgIDE4IGZpbGVzIGNoYW5nZWQsIDMzOSBpbnNlcnRp
b25zKCspLCAzNjkgZGVsZXRpb25zKC0pCj4+PiAtLS0KPj4+IGJhc2UtY29tbWl0OiAwYWYyZjZi
ZTFiNDI4MTM4NWI2MThjYjg2YWQ5NDZlZGVkMDg5YWM4Cj4+PiBjaGFuZ2UtaWQ6IDIwMjUwNDIz
LWR0LW1lbW9yeS1yZWdpb24tdjItYTJiMTVjYWFjYzYzCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+
Pj4gLS0gCj4+PiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+Pj4KPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
