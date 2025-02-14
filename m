Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41130A35B76
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 11:22:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDBB8C78F64;
	Fri, 14 Feb 2025 10:22:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2057.outbound.protection.outlook.com [40.107.105.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFDF0C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 10:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUDodQuS+iAEk7CGIBV75WElL80X5IurAG4MdGSAogHkYJ9UPXG+DmoQOZfVUkfNrBYL1nnje5m00gR3Zev4ggs09XTCXO805LKNQc7fd1KGlgAiy5t9fFJX/AFlbhh60rxg/+rjv/286mEC9KV84WtkfRaKM5X/yqQ7m4AcS36HT2qO9M3GaOcmvTjtgDWjEP4jODObOmvXIKhAUQyusgbj6x8BScXV//hE0aFQCzMtSa5vGhwF3u4ZncSgIzh6aMosutEc1ypHn7lm3/OXuKiyoqwmktzFWl0CSnDWuR34kEFC3O+MdznGkGCNfdXizvvDBbdR1jbhkQn8G1/B4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ2qge8tIHMz9ALRLNQ4aojG1aGgoFU28SRdXRYfg6s=;
 b=ROBWI/XqfCCibIQgBLca3YTq4X5vkhRTWZvY34wor3Fu6cSKbqHlHss3QOapi7f2cSOjEMFf58kPIA8y8DrSg1osqt9ffM7ILNEYiDRM6A9nhJSxPIT6jQ+FzOrK/JCCH4+vk6NF+A72zSoI+TJmslCDsXrVSM4Y16S5sekkO2Z51T4vVx29wxwvpLcoy610UOY1ECf8VnLvDSgEPjwMITmGw+DiUYei071T8zCv0bXgDi6mAvto5/NcEPOW5GdHw0h0zkiAzY6STOEtygCT7X2/5DsEU4LtPLApYhh7tcWSmS/ihQUoRgNNrmBryyQ6ZwMZ1bucgp3f/w8lBNDv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ2qge8tIHMz9ALRLNQ4aojG1aGgoFU28SRdXRYfg6s=;
 b=Gkz5E9wxootroJJ8eGxdNCjK9CG3Hmbzd4zJsZTa5+PvGWRNpluJkM8BI+r+Ccb1wgywZAEE5+A6DeSL1czQue0THt6RxBJTmIYH+ugubxCYU0O4xfpZaHnhUcvzGGk8G+zu5HB79AOTLlQO/Tw250VsKRkLToJTLJo97805Jc7SCjjvYdf4YcyVTMYNLb76z191kP20+8MFJW9jnoLKnnkeg6CEACH1hg0/Rft5ZLaI6O/c1rbhPdhvQ1nnDhsf6sC+Ab6pHeZgL+5UphXUb0pJIFUDpHQnSd3bHyKRtRQzQ5OaUztmNITe9eVHUeHIjckvLmzg1XZ0hBq/nDVCfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA2PR04MB10507.eurprd04.prod.outlook.com (2603:10a6:102:41a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 10:22:10 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 10:22:10 +0000
Date: Fri, 14 Feb 2025 12:22:06 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250214102206.25dqgut5tbak2rkz@skbuf>
References: <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home>
 <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
 <874j0wrjk2.fsf@kurt.kurt.home>
 <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <641ab972-e110-4af2-ad9b-6688cee56562@linux.intel.com>
X-ClientProxiedBy: VI1P194CA0056.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::45) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA2PR04MB10507:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2d547d-aedb-4edd-135f-08dd4ce17124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEJ2YmZBTUxyeHpZL2JGcVlOUndjakQxK1psMzhXWGlUVHJxUFVPMk5LOElI?=
 =?utf-8?B?STkzRXZPMFdDVkR1aWhvRHRVaUhIMDVvcldYSU1WSitTeVV6dUMyS3FldWNq?=
 =?utf-8?B?aGpUZWtDZjVpVlF5Mys4eHVoa3hSMXhFQ0ZTSnhXb05HeXdPUlRldVgvSlNy?=
 =?utf-8?B?OEthUHZYNVlPd2JqSzlUdTZFNWI3WHBXSzNuNmhaSmozV2g0UFg4WVdoR3Vu?=
 =?utf-8?B?L0tmVkF2aWZjUUhBZlZwbnYwMlk1US9pd2N2Sk9MZTBPS1pYWHFEZW1ySzQz?=
 =?utf-8?B?RkJaU2hGem16ajJvK1FWMEdNbXhaNEpPZGNqMi96bDlaZFg2aDVUQTViRGM5?=
 =?utf-8?B?OExVRXl4YzZ6QWtSNzR4OGJBNGdlTEQvOU1naERuREFJcE1MUG9HZ1drWmZS?=
 =?utf-8?B?Y3hXd1NvNTVWMEt0elhhYmU2dGc1T1pGdGtBY2hnK1VYbnliZjRYRTZlazI5?=
 =?utf-8?B?UVBib2VqSmg4R0J0M0VXbzMxWjlld0NrMzdNK1RQRU5QSER6SHpIZDRYSDZZ?=
 =?utf-8?B?Z3BZNE9vWUR3ZkQ4eDMxV3lDVnh6ZGhKNUtmU09xbnZTcVBYYWM5bGRpSWtY?=
 =?utf-8?B?eHFmSHdTdFZwZHZTY3FHZzhjYUc2elpWbnFvTjVYVS9nWFAvbW4xOWZveXIw?=
 =?utf-8?B?dlFYNlY5bzVQT3BZSXE5b3BGeWRWSzkrS3MySGt6dnpzVGNIeUpZd2xnQVNS?=
 =?utf-8?B?TlZOcGFSK3J5VUdBQm04clltdTVUcEIrY2NoUkFoaHBxazYyWUFjdjl4YzFi?=
 =?utf-8?B?MEtmZkdJNkdDQXpob0VZMDNuZWVIT0UyWkFEZXZ2S1JnZWtVOE1tVEdRV21V?=
 =?utf-8?B?TUNzZmYwNVJPc2dFMzI4V0lwT3ErZTd2c1J5N2kzVzQ3ZzZ3QXdQeG5OazYx?=
 =?utf-8?B?MlNOeVNwcXVMZXorWndGdEluQU00U2VGcGl6SUs1UUFzcFpYbEpNTkp4YXJa?=
 =?utf-8?B?YzRBdjVTakJGMmo0MWNyUnhTS1RuaUlKMUJ0eWpud2tYRTYzdnljLzFUSStP?=
 =?utf-8?B?Q25CaVd1MkJ1UG5xM01uMzFQVGdqTlVWMXc0NVJacDdyMDAvd2FtU3Z1V1Z5?=
 =?utf-8?B?YnJUbE1MUzk3UmMzNVhPMnY0MitJaUI3Tlh5MVZ6STdIWlordkdYb2V4RVk1?=
 =?utf-8?B?MmVadGxJUG1VclpFb2puR1JBUEM5aTdSclhNQkN1a2VFRURaUFBWNlRWYUJP?=
 =?utf-8?B?eE9ueDFpallyNEQ1WXZlbWZ5T1lSL3pWRVdPZ1ZUSW9QWG5xM2J5UlYxRHRE?=
 =?utf-8?B?MkJ1Tmw4aGFKMGlHaU5ERU5hRFZ3TTZ4YkRqVlZNOVZjRzZZSjQ1RTRsN1Qy?=
 =?utf-8?B?TnFkR3duSk90Tk5yZVlzRHZoS2RkMmU2TUJtSnAzNXZsS2o0Wk5zbEw3UFY2?=
 =?utf-8?B?TTRTemZyODhoRWJvY3VFSllwcFZHRmtCbW9rc2tZcnlqTWVUa2JvNjVjeHFp?=
 =?utf-8?B?MGptWTg1b1JkVFJISi9KdGd5dEJoVUVGZDRYSlFqWlk2bm1PemptUHl0UitN?=
 =?utf-8?B?aW5XTGloVWZuYTlmbm1YTXh2VHQrOUphdW1sQjB3bHFUbmlVOTR4MDhaZzZQ?=
 =?utf-8?B?WVd5dDIxR0MyVGJaN1RMZ3lTTUpybjdzSFRjVDZzVnp1dmRkejlWODdXbWpS?=
 =?utf-8?B?U3RJazg4QjVGdkpRaXNhZ3Z6cnJpNWVmc3pJUXBIeW1CQW5qWVVidWYwRW5m?=
 =?utf-8?B?NE4rTHJlT3h1U1lEVm5ONWdrNGVPQk1YV0VBWkw1OFBJVDk3VE5KaG04WDd3?=
 =?utf-8?B?N3UvY2E4MWl5WmZtRHNFNzBDTzlJazhqajhPSE1BeWNUUFMrbXBVUDQvejZi?=
 =?utf-8?B?MFdKOWNOSXhKazQ4WEhTbVNlVUJRRG9sZGJYc2ZleFp2eW5ibGdnclFWcU9U?=
 =?utf-8?Q?qnxy+Qpn0uBiQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1FemVhM0VlaThnNGVNK2dWd3ZBZnFtOG1mWjFnOG4yaERsVVV4NEV4Qnhh?=
 =?utf-8?B?UklMMkRaa3JwWHFiTEZOdllaa3JJdStsWmdlQzV6NmpWa3hnQXJwVTlSUVM4?=
 =?utf-8?B?RGE0bzdON0dqQmtvV3JOTGc2TGUrbkVTT01yVlZKVUZaUXBtbWpxS2lvMkJD?=
 =?utf-8?B?d3krc01QK2V2aDNjd1NydldWMGxlRWpIU0w0YVE2djYwNEoraldtdExnOFhj?=
 =?utf-8?B?NGVSdkZrNVVrelMxU0I0Z3NXMWVKNUF5S1hxbzNaSElqZWs1RmMzNDZZZEZI?=
 =?utf-8?B?K05aWmFoK1JiME40aDRYc2FnMXZaUFBhN0N2QUJiQUFxdXZLVWthWFdBUmRN?=
 =?utf-8?B?Mm1OclhnVkpaUklTT0tPczBUbE5ZRlQxYnNPZ0xZZFZUbXRMUWtET1Fud0Qw?=
 =?utf-8?B?STdiM3dYL1pkMWd2TWFBajB2ZTZ3KzVhbGRBUm9JdXpsNjkzNjN0a0xXRmds?=
 =?utf-8?B?aUp2dVZqZG1LbGZPOHBxbGF1QVdVaFJpczdJbkNkN0pVZmRKKytyOTQwUmZ5?=
 =?utf-8?B?OTVpbWpaUlNybDZPRk9Pei9VZHZFTFB6UStqN1JTcllsUE1RTjNzL3NUWmJp?=
 =?utf-8?B?L0RVOFcyUVZyeit6aFlMQUdXc1JJcE54c3p2anI3emUrTk5WbmRNZWdyOG9t?=
 =?utf-8?B?dzUrOCtRVjhtZk9BN3hBS2NqNFNxQ1RQelR4dUhSekFUR3p3N1FIdkIyeUpt?=
 =?utf-8?B?YmxaNjEwQWhQbFBnSEhKdXJHZW85OXhEUXg5WWNGdmtnOXBkZFprS0dRSTZT?=
 =?utf-8?B?aEZIMTJEK2pHejRncnU1ZkNGY0VrT3lRcyswYVhUdjRsNnZJU09idVlHVEtT?=
 =?utf-8?B?bmp6MkpBb0JiaElJOGJQSytBZXBkZEMzNnpLNG05SGNPZXJjdXUvQmwwMkFs?=
 =?utf-8?B?UzFTNlJ3Q3dNMld1eldiWVhSNXh4blpJUFZyS3JDQWI3b2xxWFh1bEJxTStM?=
 =?utf-8?B?VHlvSVYzZ2EwbWRKV1Fjd0JqZWR4QjU2RmY0bUQvNTVja3BxS05PMUZZVW05?=
 =?utf-8?B?ZWJFcU13L0pLZ01ZMlV4V20rT0JyS3Y5NzFsUTNHVXRKeFVYOGtIVTZRT0Ji?=
 =?utf-8?B?bHgrdlQ1TVlocjRrOC9LNXN3UkpxR1BSTldBWHJtcmk2Q3JHSTNJNVZpMitP?=
 =?utf-8?B?SEdSRmJwdFlSQWJxNTQwNjZlZVdaZm9RTW5ZbWMwc0NEb3VlbFJKVDJpWDgz?=
 =?utf-8?B?RjBsWnBpQ2dxNXRqQXBzam5Ga2tKUERSWHpiWnBqZ0xWcUcvU2hiaWFVU1Ay?=
 =?utf-8?B?SXg1dnYyMW1RSDYyNFR3S0ZiRGNpWHJtUWNkVW52TzRlTTMyaTVyd083aDd5?=
 =?utf-8?B?R0V0TkxhM0VhY0cxSUcrUnlFdjM1QnYrZzREUzFDRXBDM280anZ5UFhGUnFX?=
 =?utf-8?B?MWN3SUxwUEVzZXArSDAxd1R2WHExS0UycWhzTWhESkNDRmZVdWpOS0pEL2lW?=
 =?utf-8?B?WTY2bnZ3ZjZlT2lVUExKZzhWQXh3RnM3M1E3Y1hvUWVwaEtSWnFmV050bC9p?=
 =?utf-8?B?VTFxb2JIZEJsQ24wN1N6aDhSalNIZFhuMFpSZTJzaE1FMmhMVnJSVVpmWjBu?=
 =?utf-8?B?SlpMaU1GL1ZWY0swR0hlVE1TcXVlZmpYcG03MzJhYnlqTm8wWmVjRGt5Yitq?=
 =?utf-8?B?dFd6azllOGhaTlJMenNMdlhHdmNnK2VxUTlNcWszWnJiVk9wYVI2bkFQTHlY?=
 =?utf-8?B?ODNNL1Q0emhPa3F5ZUYvdjc5eFlVODdLbDJDWnhzZXQvejQ3SXJ5YjRGNWxD?=
 =?utf-8?B?eERZMFpSYzZCQkY1UEJkbFY5cWRRclI1cEZaZnQwN3R5WlNIZnZTRWpFbmUr?=
 =?utf-8?B?NmVTSlRvWWExZndpZHd2STF2cmJNVXNCcDIvR0Y2VTd2N0F6MzY1OE5KMlhW?=
 =?utf-8?B?OWtiN1A3dE1GZWNUSXFwNmNYZWRjcW1adWcwUGt0Wm9TSUlhWjdLb2x3Nnk4?=
 =?utf-8?B?NmFNYmpDbnJVQnZOeDZoS1FxbmFiZExJQ3J4TmZKajljYjA3QlRVZU5qMmJQ?=
 =?utf-8?B?ZXlWdEkxRFJKdE5QNS9nVmpYL1NFMUt3ajlOUEJqNWJ6NGtCSEJ5OWxjcVRE?=
 =?utf-8?B?TVNDVS9HcjdjSnBRelB0OVhUU2NlNkNia2hkN3JzZmhQK3hmKzcrbEVMQ3VQ?=
 =?utf-8?B?V1NsUTFFMkdackFXK0tScndOSXBaY1BjV2hWdkVuOWZZTVpwNUZIVGtTTlVH?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2d547d-aedb-4edd-135f-08dd4ce17124
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 10:22:10.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or3r8+niS6Z3kBod8DNdddfMwajuwv2mW7+xkGlEZA4pV6wuMDl9QjD6ixwyvsEr7+3GSD3c+5MRtJe3NBFgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10507
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

RmFpemFsLAoKT24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMDU6NDM6MTlQTSArMDgwMCwgQWJkdWwg
UmFoaW0sIEZhaXphbCB3cm90ZToKPiA+ID4gSGkgS3VydCAmIFZsYWRpbWlyLAo+ID4gPiAKPiA+
ID4gQWZ0ZXIgcmVhZGluZyBWbGFkaW1pcidzIHJlcGx5IG9uIHRjLCBodyBxdWV1ZSwgYW5kIHNv
Y2tldCBwcmlvcml0eSBtYXBwaW5nCj4gPiA+IGZvciBib3RoIHRhcHJpbyBhbmQgbXFwcmlvLCBJ
IGFncmVlIHRoZXkgc2hvdWxkIGZvbGxvdyB0aGUgc2FtZSBwcmlvcml0eQo+ID4gPiBzY2hlbWUg
Zm9yIGNvbnNpc3RlbmN54oCUYm90aCBpbiBjb2RlIGFuZCBjb21tYW5kIHVzYWdlIChpLmUuLCB0
YXByaW8sCj4gPiA+IG1xcHJpbywgYW5kIGZwZSBpbiBib3RoIGNvbmZpZ3VyYXRpb25zKS4gU2lu
Y2UgaWdjX3Rzbl90eF9hcmIoKSBlbnN1cmVzIGEKPiA+ID4gc3RhbmRhcmQgbWFwcGluZyBvZiB0
Yywgc29ja2V0IHByaW9yaXR5LCBhbmQgaGFyZHdhcmUgcXVldWUgcHJpb3JpdHksIEknbGwKPiA+
ID4gZW5hYmxlIHRhcHJpbyB0byB1c2UgaWdjX3Rzbl90eF9hcmIoKSBpbiBhIHNlcGFyYXRlIHBh
dGNoIHN1Ym1pc3Npb24uCj4gPiAKPiA+IFRoZXJlJ3Mgb25lIHBvaW50IHRvIGNvbnNpZGVyIGhl
cmU6IGlnY190c25fdHhfYXJiKCkgY2hhbmdlcyB0aGUgbWFwcGluZwo+ID4gYmV0d2VlbiBwcmlv
cml0aWVzIGFuZCBUeCBxdWV1ZXMuIEkgaGF2ZSBubyBpZGVhIGhvdyBtYW55IHBlb3BsZSByZWx5
IG9uCj4gPiB0aGUgZmFjdCB0aGF0IHF1ZXVlIDAgaGFzIGFsd2F5cyB0aGUgaGlnaGVzdCBwcmlv
cml0eS4gRm9yIGV4YW1wbGUsIGl0Cj4gPiB3aWxsIGNoYW5nZSB0aGUgVHggYmVoYXZpb3IgZm9y
IHNjaGVkdWxlcyB3aGljaCBvcGVuIG11bHRpcGxlIHRyYWZmaWMKPiA+IGNsYXNzZXMgYXQgdGhl
IHNhbWUgdGltZS4gVXNlcnMgbWF5IG5vdGljZS4KPiAKPiBZZWFoLCBJIHdhcyBjb25zaWRlcmlu
ZyB0aGUgaW1wYWN0IG9uIGV4aXN0aW5nIHVzZXJzIHRvby4gSSBoYWRu4oCZdCBnaXZlbiBpdAo+
IG11Y2ggdGhvdWdodCBpbml0aWFsbHkgYW5kIGZpZ3VyZWQgdGhleeKAmWQganVzdCBuZWVkIHRv
IGFkYXB0IHRvIHRoZSBjaGFuZ2VzLAo+IGJ1dCBub3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0LCBw
cm9wZXJseSBjb21tdW5pY2F0aW5nIHRoaXMgd291bGQgYmUgdG91Z2guCj4gdGFwcmlvIG9uIGln
YyAoaTIyNSwgaTIyNikgaGFzIGJlZW4gYXJvdW5kIGZvciBhIHdoaWxlLCBzbyBhIGxvdCBvZiB1
c2Vycwo+IHdvdWxkIGJlIGFmZmVjdGVkLgo+IAo+ID4gT1RPSCBjaGFuZ2luZyBtcXByaW8gdG8g
dGhlIGJyb2tlbl9tcXByaW8gbW9kZWwgaXMgZWFzeSwgYmVjYXVzZSBBRkFJSwo+ID4gdGhlcmUn
cyBvbmx5IG9uZSBjdXN0b21lciB1c2luZyB0aGlzLgo+ID4gCj4gCj4gSG1tbW0sIG5vdyBJ4oCZ
bSBsZWFuaW5nIHRvd2FyZCBrZWVwaW5nIHRhcHJpbyBhcyBpcyAoaHcgcXVldWUgMCBoaWdoZXN0
Cj4gcHJpb3JpdHkpIGFuZCBoYXZpbmcgbXFwcmlvIGZvbGxvdyB0aGUgZGVmYXVsdCBwcmlvcml0
eSBzY2hlbWUgKGFrYQo+IGJyb2tlbl9tcXByaW8pLiBFdmVuIHRob3VnaCBpdOKAmXMgbm90IHRo
ZSBub3JtLCB0aGUgaW1wYWN0IGRvZXNu4oCZdCBzZWVtIHdvcnRoCj4gdGhlIGdhaW4uIE9wZW4g
dG8gaGVhcmluZyBvdGhlcnMnIHRob3VnaHRzLgoKS3VydCBpcyByaWdodCwgeW91IG5lZWQgdG8g
dGhpbmsgYWJvdXQgeW91ciB1c2VycywgYnV0IGl0IGlzbid0IG9ubHkgdGhhdC4KSW50ZWwgcHV0
cyBvdXQgYSBsb3Qgb2YgdXNlci1mYWNpbmcgVFNOIHRlY2huaWNhbCBkb2N1bWVudGF0aW9uIGZv
ciBMaW51eCwKYW5kIGN1cnJlbnRseSwgdGhleSBoYXZlIGEgaGFyZCB0aW1lIGFkYXB0aW5nIGl0
IHRvIG90aGVyIHZlbmRvcnMsIGJlY2F1c2UKb2YgSW50ZWwgc3BlY2lmaWMgcGVjdWxpYXJpdGll
cyBzdWNoIGFzIHRoaXMgb25lLiBJIHdvdWxkIGFyZ3VlIHRoYXQgZm9yCmJlaW5nIG9uZSBvZiB0
aGUgbW9zdCB2aXNpYmxlIHZlbmRvcnMgZnJvbSB0aGUgTGludXggVFNOIHNwYWNlLCB5b3UgYWxz
bwpoYXZlIGEgZHV0eSB0byB0aGUgcmVzdCBvZiB0aGUgY29tbXVuaXR5IG9mIG5vdCBwdXNoaW5n
IHVzZXJzIGF3YXkgZnJvbQplc3RhYmxpc2hlZCBjb252ZW50aW9ucy4KCkl0J3MgdW5mYWlyIHRo
YXQgYSBwYXN0IGRlc2lnbiBtaXN0YWtlIHdvdWxkIHN0aWZsZSBmdXJ0aGVyIGV2b2x1dGlvbiBv
Zgp0aGUgZHJpdmVyIGluIHRoZSBjb3JyZWN0IGRpcmVjdGlvbiwgc28gSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgbGV0IHRoYXQKaGFwcGVuLiBJIHdhcyB0aGlua2luZyB0aGUgaWdjIGRyaXZlciBz
aG91bGQgaGF2ZSBhIGRyaXZlci1zcGVjaWZpYwpvcHQtaW4gZmxhZyB3aGljaCB1c2VycyBleHBs
aWNpdGx5IGhhdmUgdG8gc2V0IGluIG9yZGVyIHRvIGdldCB0aGUKY29udmVudGlvbmFsIFRYIHNj
aGVkdWxpbmcgYmVoYXZpb3IgaW4gdGFwcmlvICh0aGUgb25lIGZyb20gbXFwcmlvKS4KUHVibGlj
IEludGVsIGRvY3VtZW50YXRpb24gd291bGQgYmUgdXBkYXRlZCB0byBwcmVzZW50IHRoZSBkaWZm
ZXJlbmNlcwpiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbW9kZSwgYW5kIHRvIHJlY29tbWVu
ZCBvcHRpbmcgaW50byB0aGUgbmV3Cm1vZGUuIEJ5IGRlZmF1bHQsIHRoZSBjdXJyZW50IGJlaGF2
aW9yIGlzIG1haW50YWluZWQsIHRodXMgbm90IGJyZWFraW5nCmFueSB1c2VyLiAgU29tZXRoaW5n
IGxpa2UgYW4gZXRodG9vbCBwcml2IGZsYWcgc2VlbXMgYWRlcXVhdGUgZm9yIHRoaXMuCgpVbmRl
cnN0YW5kYWJseSwgbWFueSBuZXR3b3JrIG1haW50YWluZXJzIHdpbGwgaW5pdGlhbGx5IGRpc2xp
a2UgdGhpcywKYnV0IHlvdSB3aWxsIGhhdmUgdG8gYmUgcGVyc2lzdGVudCBhbmQgZXhwbGFpbiB0
aGUgd2F5cyBpbiB3aGljaCBoYXZpbmcKdGhpcyBwcml2IGZsYWcgaXMgYmV0dGVyIHRoYW4gbm90
IGhhdmluZyBpdC4gTm9ybWFsbHkgdGhleSB3aWxsIHJlc3BlY3QKdGhvc2UgcmVhc29ucyBtb3Jl
IHRoYW4gdGhleSBkaXNsaWtlIGRyaXZlci1zcGVjaWZpYyBwcml2IGZsYWdzLCB3aGljaCwKbGV0
J3MgYmUgaG9uZXN0LCBhcmUgd2F5IHRvbyBvZnRlbiBhYnVzZWQgZm9yIGFkZGluZyBjdXN0b20g
YmVoYXZpb3IuCkhlcmUgdGhlIHNpdHVhdGlvbiBpcyBkaWZmZXJlbnQsIHRoZSBjdXN0b20gYmVo
YXZpb3IgYWxyZWFkeSBleGlzdHMsIGl0Cmp1c3QgZG9lc24ndCBoYXZlIGEgbmFtZSBhbmQgdGhl
cmUncyBubyB3YXkgb2YgdHVybmluZyBpdCBvZmYuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
