Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1uMLOWBbF2qRCQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 23:00:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 675315EA495
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 23:00:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C23C8F290;
	Wed, 27 May 2026 21:00:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CFBBC8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915615; x=1811451615;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1iTVy0KZz4Zc8Nt9pKLX/oDtBnCMF42lhNA254B5zVM=;
 b=M9KX/nq1cCN50HdXEW42Cbfr6dU0Z1tcXkqZu5E5yVFyGMkvfamq8sQc
 n8CiLPapeBWzWg00/5AAtc4764+EjFUNeBVTDi85cVGLhYGph/t9BVCyW
 qHLBA+3cDFNQnfYAu4wMq+RoWHD7OL+rz8a2THEYaTUgi9R+lkxnGhjkp
 L6iqDGB+k3GzO5Os6vr4HCAP9rwiX54oU7JGOHfgdp8qwohTHqTtKSlWj
 t/ukYsADu4GX5laUCavgjORmu5p1HYmXWtwZfjyBB5j0epXICzwa9A2CL
 r5yjmwVyw1bGRsJekN6rHNCHavaoxsBQvHir9BLiE6Oh2ZTYEHxOWC1RO Q==;
X-CSE-ConnectionGUID: MeJAHbuvQ2y1BiL4diHq0A==
X-CSE-MsgGUID: 1iQkU02OTGCHLEC0imzrwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103432376"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="103432376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:13 -0700
X-CSE-ConnectionGUID: iwlTqQxvTxGpRmy5/+eNug==
X-CSE-MsgGUID: WciRI5TxQxKoZrVW5F6mog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241318379"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:00:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhPsnJ1Xqp6PLxooLktnBMpG0CLT6T9nqdNcO5Eqjqfb5UH3wvtBVRkECoKpHMZJXaBDqQo5K40l4Gwplv6hFSQLiz6DlrKaIdH6KN7aieYgLbkBfP6KDe0i8hp/yPCwq7mOkhdixJz0FM3arV42z7PrMhpYxliLwP4yv0JdO4dc2Wlz+5k+PV/9LvuPePNzOFmE1EILo+oEBdRn8ny3CxInLSbWXSj3rwejVqq08JptMDKSNaptoV0NBmMPaHDRa8BHiYS2Z6HXLQmsbFcs1CUxHyYdHdThya4QwsyrC8qmcoKly6I+yPdXqfhxtKaeygxi9wGvvpt8xo+KzThIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmOM3B6/fMyJClXESpVsWn1OAdqExUzsuIZkzBYaL48=;
 b=XJVaeL2N/J2wcfrFwaNMmLn3Cn9/OGrElhkHyR78kCzAbp2R8gv8l97SGbnrPt4g8oUufEN4Zg0hr25m2+kmE4ohiHZ3Mj3SdRq17AXb6hTzWdG7y7F+GdkCO77RO1FR/V1uLJOE4jYs8acQvSjH8YEE093rmWzoZtXB0WxBJ7lQSMzgFuOtEZd+YEahW6DVbLYWiZ1bREavR6WETJWXRxCqEiW0aB0Qv2cGRGQV+gTsElO13/7+sIe8biSSSGgSHnZYxov1e2g1lhIE86d3bIlKS76MaFYuKsDwLnKZUO2yuAIO5+HxsdC4sFqDEkSxIDU/+qbK2XNH9lf46nNBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by PH7PR11MB7514.namprd11.prod.outlook.com (2603:10b6:510:276::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 21:00:06 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:00:06 +0000
Message-ID: <f6eca916-72a7-44cf-bdaf-4a4a06294023@intel.com>
Date: Wed, 27 May 2026 14:00:03 -0700
User-Agent: Mozilla Thunderbird
To: <muhammad.nazim.amirul.nazle.asmade@altera.com>, <netdev@vger.kernel.org>
References: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|PH7PR11MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: dcab46b6-7768-4f51-134c-08debc32ee1a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8eLSJuRKBXnfosyUc8tVM2EOLmSzpyucC5DGBcXDXEsZZ53mP/DGS/LdjZIDAxzQgyOAwW7eBaeV5b1Lp8MuN7tihYy2Bt20sxw4ic7vWUzb4DHGBA+pxL2dg8/Npnv9WurdslEX4zjWXIMTOa0FAendVs5XEk2RhrLG28eC/k6mE7p5ZKsLV2fMu18s9MT0gKIa+vjl7rmKGjphVBD0ZqBzPIjEZhuckPV93bV+hPIKFL2J5PeG2Yc2b+1/+qB33B/zugtVB37RQurHV8qdJWm7FPrIcUGOSBw72AfJlyw22kD5zgQEuivO5R8gIG9jtuopSS3j6MrQJZDhZg7DZD5pD97sbZuG+ZYWdjQy+o+5lpBTOpDTDLTH3cwotEUzYFKOPlHGY0aOjr8Jnt2rD5Uz6YKoi763mcMWuqJrtB0hJ2h2saAdFdEfZcmHj/rRuo/jaFKQoIoBW+dP8EN4wxhLotGfJIenxRkwOyayA9qRIqZcQhcs6t8QXrJkxVQ7rK6VVwtkvC5DerHIEOqFJD58zDfVqF2PqeO5UAftBtLra/qE9JW/WlfMbTJgNcLR3WKakbjpZ7twMWGObfIkqwmmqyvUJKQ6o66UdaoB7bh82X2/b3u0nECDppMy2WKXyzM/MC+HsLwZXP/mh5oRlQCqVZijWBNwdHC1oavUSNmp1zV5scJn/f+tNsVe5OYj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7381.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZGNnRRRHd2eEpzbnFQY0o2aVh3cCs0UGFuWHZFT3dVNmxPRUFQUU05bGxH?=
 =?utf-8?B?anYvL0lkcGpob0FhNzRqSGRCR0RLcG84K0ZkM0Fna1B4WEdXbW5ReVN5dXZH?=
 =?utf-8?B?T0JwWnJuR2s3YlJhc2ZDblVRMGR6R1c0LzFrYVhXeGk3OStlYUllTW15dWZD?=
 =?utf-8?B?UDN0ZVh1NGtSeVpqMTBkSkdIaXB1aEVCRXRzM0tqWlJnSVd5cHhvNXlKRjA1?=
 =?utf-8?B?UkpLTUgxV2RKK2hpM29iMlIxK1daNnhsZTRmNFNaeVZ1eEkvZWFxdFZITnBX?=
 =?utf-8?B?WHg4NFd1NjlCdnE2cWlzMDh0M3V4V2ZMOEtrK2VNRlZ4Yk42dWw0YW5JYVZX?=
 =?utf-8?B?QXl2SGQ1YlYvT0hhRVJlbGZzNWhBSjRkd1J5dTY4QWZST3FLN3ZiTWdrN1ox?=
 =?utf-8?B?aFl5eGliQ0daQ0FvR0FtRVU1amc3NmlOOTBkb3lsSkd0NzRGb0tPQ0JrcjNX?=
 =?utf-8?B?UGdNQnFYd0JsdytCUkNqUjlEemR3bDdhck9nek9HNGd0Qm5TTnV3VDR5U0o4?=
 =?utf-8?B?bmlkWGNIdVB2SExseWhpeit3cVVBOWtaWEVVT1ZGNWdZNGpPaDNDajFYeVBR?=
 =?utf-8?B?VDhicVlHakJwa3B2WDJndS9EVmhSU0QxbWUrRDk5QTBiZENPMFRHTGhMQ3hw?=
 =?utf-8?B?TXdIQU5BSU4wcnUwV1ZpeWxpYm5tZkJ5NkFOcGlxeVMyTkR2YnV0a241cDRS?=
 =?utf-8?B?N29JWURBOGt1K2NDZXU1M2NCaVhCNW1lWXhrZ0NFRnlTRk9Xd2lENHZSMTZP?=
 =?utf-8?B?WTNaK1czVkFBQjRtYUszTHMxbDlnKzlCdzdsVjdyMEg3TW10cVRmaDJrUURR?=
 =?utf-8?B?U1VleDRiM0lOUXArWmZEZDh2ME5IZzdtckZQK3Q2U2F5bUVVWWo5RUc2M1FF?=
 =?utf-8?B?S3l6QW5Ja0tPa3dMdGNOaENpaVl2bEcxcVkrcXRITUNsaVJwU3BjMmpCVGUv?=
 =?utf-8?B?SDZLeklUL2IyZXR1QzNBV081ekt5UFhjOEZ3WVJRZlBTMzZYTHlLU2h1bFJV?=
 =?utf-8?B?OE9iZVd6b0FzR0NUdlYzSWpzaFpSS1R4T3graTNnNzRjcTRxd3dWRXc2U2V1?=
 =?utf-8?B?Uk9MYzlLdkdFdjlaK0pDOWMyVlhaNFBDWVNQWjhzYU9MTWlWTWVNaUZUYzhp?=
 =?utf-8?B?dm9UbTc0S2RLOHIwY1NuZ3NtQWJMNlpvem02cGJJN0lNZFAyak12NVg5a01a?=
 =?utf-8?B?R0RKVWdZYjliVTBlc2IyZDR5VnMzaHY5SGZ2UjZVY0lLdXByUm1zSlVkQkxX?=
 =?utf-8?B?cmR4UkVIdWhnS3NLUHdJQ0RjUjhIY2JoeFhTeHFtZ0lncEFJZXQ4L1ZWdTdE?=
 =?utf-8?B?MnhtbVJEWHlnakcrZGJIR3BYVzJjUll1dS83Qkpwa09UTWNUakQvd0J1ZUxU?=
 =?utf-8?B?b1FtQnRLN0swTTRhMDh1VVBQa1VVRlZIaHhSNVZVblFqT0tqbloyOFhXTW5r?=
 =?utf-8?B?NW5hQ0o0TTJMdmtQQzBiUXNTaG93WU9qdXlzbkl2eDd5M1FZeitlcGtMY3N4?=
 =?utf-8?B?cUJqVmZJQlNCR3RwZFpSVDVhOFdvamRmcWFmUkF1QXpzeWhwWHBTZWhVUjE5?=
 =?utf-8?B?RHNwalUrVGIyZnJsRCtxZmVmdDN5QUlRck5PR2hsdTlVbDl0TTBvNDNtSmkw?=
 =?utf-8?B?QXlIM3o2V0duWHpMNU43MFBzSW9WaE16U0d0Y1JtaTM2REQzTnJmSjV5WEhQ?=
 =?utf-8?B?RnFmWkNDR0c2RzhyeGlLSVR4MTY3TnUvZXhOTnZWbEp4cmc4Ui9XWE5zY3I5?=
 =?utf-8?B?eGxKYURUZTRDbHpaK20xTWVMNWxDTkk2UGZlTFJsU0UrMWF3L2M0QWQvN0dt?=
 =?utf-8?B?YzBXb3RaQmRmYllkVWdFUHc0NVBDdE9ySVlmaXR2WE55cEV0ckpzcDk4WlVO?=
 =?utf-8?B?eE9XQko0MlNQM3p5NUU5V09zVllINHVFUjlZSzQrdUZjNEdzaC9ycGJSdTRD?=
 =?utf-8?B?MWgwQTZRWlF4cEg4b2NXSWl3aFZkZ1lpK2lrTHZkMHg0N3YxNHlxN3QrTFZU?=
 =?utf-8?B?R04zTGQ4UTkvNzY2QXViKzNvcWsvd2c4TlpUeVV1MDduSXR2MmszazhWYTRL?=
 =?utf-8?B?VGlnTjlHeFJ3Mkx1QU1OZnR4NUxlQy8xT0gwQjhzM2swNjBZamVZWGdxejVT?=
 =?utf-8?B?ZW5rcyt6K3AxTzdkWnlHSkZtcVFHUVhjN1NSTmdub2QrY0F0NVI5T0xVd1N5?=
 =?utf-8?B?VmZQYzFFTWFRK2V4NVJmY3RFNnVDZGZRTmxQVnZsaDl6cnVpQmdHaWNJUHA1?=
 =?utf-8?B?UVFDK1o3eHhOYWx6YTFjNDZ2N29ZYjFkdEJFYWJiT2Nwd2htdEpTNnhaU1dj?=
 =?utf-8?B?a1dNNTNrT2lkdjhoL1ZFVUJVQmlZbFNtR3laQWxRMGVvNmljNWR6QT09?=
X-Exchange-RoutingPolicyChecked: J6Wo6Gmn6uy02d7CbjMsnQR7WXXXhSaFbGDZIhsFwQcBwHWlL0wUEGdUEZKlHFMHw2+JFLYNTpUP3Gm8jy09ExMpiUYNkFUwvFJKmU/r0B2CGWJT6CyoQK54R10pja/hvjONBjpLfgOxcPLLO0QVUZAaw8UBhsEkwkxWqz1o+g24Oj/NvIvwLtYRgsZToC46uhDjursU+oV16dUbPAlfatNpOBem5Ze0QHpCRcAbfUFcJ5C2cTYd14XXzn8IgNZ7/kvSdXR7Kwra0aUKlrquFHNUPxSZDNWRiXq4O71TaR1YUYFh4pNDuq6y4JJS+BvZ0VVKJlKYRVppFbN2+ZpWXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcab46b6-7768-4f51-134c-08debc32ee1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:00:06.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUZ0cTmTHFSFe9U4QMroAVkGRIQuK6v7lUO0BdhpWkrmFQi8o3lTAQR0WQt+ELlSaRaFkLllVLFtwDGCyh9c4kzTA008nLbx6YbxCih6O7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7514
X-OriginatorOrg: intel.com
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Improve Tx timer arm
	logic further
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,intel.com:mid,intel.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:muhammad.nazim.amirul.nazle.asmade@altera.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.685];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 675315EA495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/2026 7:33 PM, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Calling hrtimer_start() on an already-active txtimer is unnecessary
> and expensive. Skip the restart if the timer is already active by
> adding an hrtimer_active() check before hrtimer_start().
> 
> This avoids redundant timer restarts under burst traffic and ensures
> NAPI is scheduled within tx_coal_timer microseconds of the first
> packet rather than having the window reset on every packet.
> 
> There is no race concern: hrtimer_start() is internally serialized and
> safe to call on an active timer. In the event of a race between
> hrtimer_active() and hrtimer_start(), the worst case is calling
> hrtimer_start() on an already-active timer, which is identical to the
> pre-patch behaviour. The meaning of tx_coal_timer is unchanged.
> 
> Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
>   Before: ~45200 pps
>   After:  ~52300 pps (~15% improvement)
> 
> Additionally, ~10% improvement in UDP throughput observed on Agilex5,
> with hrtimer CPU usage reduced from ~8% to ~0.6%.
> 

Nice improvements! Appreciate seeing the data here.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Changes in v2:
>  - Expanded commit message to address race condition concern and clarify
>    tx_coal_timer semantics (Andrew Lunn)
>  - Added performance numbers to commit message (Andrew Lunn)
>  - Added Agilex5 performance data with hrtimer CPU usage improvement
>  - Added Tested-by and Reviewed-by from Maxime Chevallier
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions()
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..35da51c26248 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>  	 * Try to cancel any timer if napi is scheduled, timer will be armed
>  	 * again in the next scheduled napi.
>  	 */
> -	if (unlikely(!napi_is_scheduled(napi)))
> -		hrtimer_start(&tx_q->txtimer,
> -			      STMMAC_COAL_TIMER(tx_coal_timer),
> -			      HRTIMER_MODE_REL);
> -	else
> +	if (unlikely(!napi_is_scheduled(napi))) {
> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
> +			hrtimer_start(&tx_q->txtimer,
> +				      STMMAC_COAL_TIMER(tx_coal_timer),
> +				      HRTIMER_MODE_REL);
> +	} else {
>  		hrtimer_try_to_cancel(&tx_q->txtimer);
> +	}
>  }
>  
>  /**

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
