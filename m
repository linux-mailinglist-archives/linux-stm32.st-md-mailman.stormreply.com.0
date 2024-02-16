Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B618588AC
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 23:34:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E83C65E42;
	Fri, 16 Feb 2024 22:34:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48BEAC6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 22:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708122859; x=1739658859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qkzzfmHeWx2FJXmRUF58EaiCOL0UOjMxT4aoi8nI1ks=;
 b=OBHacMpES/+9eAZXedXBLIUaAWZeQjxAvifUZSVRot2/fZXUC17J1FOP
 oL/HIcQaUackcdWbMwC+3HLWFvuFRVCNDgl6A2SYfBngMOQ2TqTKVdPyz
 5L2eRM7bcSk84vRWL6SNs8ceMt/vW9HmpFW1OauEPIAkuUEIK7weApFfJ
 N/dxT/uoJNPpQ+iXfD2j3ghp2W1+/hOyhUu1wBb+tZTYwwsOF0qddQI5m
 M48eynOYG110rrfLXFmO0FKyryHa9JnWL+zIBCG6EKLrmeeaiBB7DNEYP
 29/hnkoPeLcQwNf9XRzxClhfw6ybpJTA0cVeW+8e3BvW8p8bLDomFu7zy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2145257"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2145257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 14:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4010644"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2024 14:34:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 14:34:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 14:34:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 16 Feb 2024 14:34:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 Feb 2024 14:34:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqse2ucmXhiTP33bZTUV8s1HXBF49vt5EUayhQAuYsXXJBOyzXhjkailAazYAUAzAevFhFTQ58wamnms1qWRHzGQQiptKAI9QBTq+vdR2v+pj7vPX5zzz1AL72ORxV0SqhMvmJEKjL6EdcGCn0tlJ2bjl4jhYklMj2iXB2bZaXMOxwMaRux18OTp5CojD9CjbNOeUNk3ewgHYToIGw71w3rrlhbv9bhbMpQqPcQGkVIdHEnMpxx6CkVgasZ7ndE6+pXu+8yT+14/U0sH6DLAWPWbuaXeLRrdju3c9ypbmdJzlGGySJXvsoS1qrK43EBoVVImcB/FLlZf4INHYpzyyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pn2Ccj7qLBTU6cxIRvtjIFbHxpDJ5r170WrFmXm9FE=;
 b=k28eZT28kyeCMR/qZE+oB4HQ2fdFhuqNJ6ejaFScrsLFy4ai0mEARNC2OjiL9KovpVBEQwJdo7JmEbSeOZKWoL3kAO3lBOoB2Yq2EwGxVdnbLBnnyDCR39N4hC4NFTZ/gxr8ue7rjbl0tdC+uqwZmjalzlWMF6MLM5HEEP4OyPHkGwXzUitI/BPR58PNFaRxRJPl+RgZSfvFNbRycCG7a2GwScZf3cNjtDfV89L2csFOeOKtAZr4i7DJmLCRnpsvAy5R2muqUFI355D/Z4VeY1T6ZpeJhOUBTg3GWo3brij1KM7t4nQ7AT6hwNqs972N7j9SIppi1qknRBHsevkB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 22:34:13 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::d543:1173:aba6:2b77]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::d543:1173:aba6:2b77%3]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 22:34:13 +0000
Message-ID: <f858dfa8-478e-4537-a8c5-2c16603587ee@intel.com>
Date: Fri, 16 Feb 2024 14:34:11 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <hsimeliere.opensource@witekio.com>, <stable@vger.kernel.org>
References: <20240215151527.6098-1-hsimeliere.opensource@witekio.com>
 <20240215151527.6098-2-hsimeliere.opensource@witekio.com>
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20240215151527.6098-2-hsimeliere.opensource@witekio.com>
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: ab43f278-5eb5-4c3d-a534-08dc2f3f668a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATO+4nfrgM3e/YVx94vBN19aoiFmfovEZp2zy2SRBaJoqYGTfyEjpljkPQgZAOFrBTmseEZNanf9POTW15x+bli5e4EQiutMyUgmvLzMD2QQKgq58B6Dv52vIQOnc3ECngKivioWtD6NjXU6iisXTKGeL3R7kzQfvyzMqG1A+LIW0pEmp9PEu7Skm8238ed5f2iZF5vrfdYqRT42Rsa2M8/Zl1EE3sLIJYn6IAd6ubtqZsE51D5LR4UbXQksxfAPihGiCRuUcjS698ua+c+o69hbKravpeQ67k/brgVz2Ffebk7gznK/0x4xmHoy52nTsyLx1acuTt4L/q+Ta8Z+Ut6DKiwEpVy92gihJZwYJV9/AQ22glg5/zrCuNRAhhakWzcEFpI3LANu+QZL8RbCVl8gYxVhEkTB9JOSxI1KLeyVy5rehwK2BZUFGoBCejdpYOK5qqsT2mttbdkAPti+F2IYYVnZadlsCvIaq24DerB4j7sT/Q5x2QKehGjn4b12TN0AZofr/jYLIxeWM4YOTovDC65jAxwSRW/cmaSh+rPuxHilIw+Ycj/qMnfVzouW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(6506007)(53546011)(478600001)(6512007)(6486002)(2616005)(7416002)(2906002)(54906003)(5660300002)(316002)(4326008)(8676002)(8936002)(41300700001)(66476007)(82960400001)(36756003)(66946007)(66556008)(38100700002)(31696002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFN6N0drZnhBMG03Q2xVaExaOWUxdGdsMUx0MkZkanl6RzR1elhDbC9zbUFy?=
 =?utf-8?B?Z1U4NklJRm9oTk9OOXFQbnc2UEJkZnJTbEI4ellMZmtqNFNJSlRsKzNRSDYy?=
 =?utf-8?B?cHlscmgvWFF3NDdyaktTT2s1UmNFS292cENHR3lYazZWZUFIMzlPeG01Z1B2?=
 =?utf-8?B?cWhDTVV3TTg3QXphMzZ1SDNPcFh6Q3kxZ2FkUDhTT2M1VWdPeVcvM3NGTlhm?=
 =?utf-8?B?b3l6bDBJQ3IwbHN6QU1UTmJVN0tUU2dyNDZYNUtSYitBakJucjkzb0kxaUFN?=
 =?utf-8?B?U1FnQThuZEI1MS9lUlowQ28ybHZZQUorYUtNK0FsQzNyLy9EcmtKT3VOTzh4?=
 =?utf-8?B?YWJlaWM3U2Fia1ovOTZKQjNRekJDdzdDY1FxMm1iT3JKSFF2Y2RITll6Tk5p?=
 =?utf-8?B?VUJuNFJQNTdJRWJNNnRjVTV2Qm4rY0liL2V4OWs5WUZaTEsyTVBRWDBKL1Ry?=
 =?utf-8?B?MDhyQ1UyQTFoT1Q0YTVkbDh1cVlWMjlGcHFDblN2eWRzdjh3NExXUjZzYTY2?=
 =?utf-8?B?Um4vczNRaG5lcUppejFjNmczWG9kTW9hMVI4UFc0c2FibUlmUWp6NlozTGRN?=
 =?utf-8?B?ZzFvdWJUWCtXVzlpTVQ0WmorNEdyYTd3VzFaZlhncGxBaHRuQ3dCajNTKytn?=
 =?utf-8?B?V1JGaG91dURsMWxIYjNUS3FzTzBoRUJRandidy8zWkJPL2hrdzVtUlg0UWZ1?=
 =?utf-8?B?Z2pmclExbUQ5MC9Sb09kVzZBSG5hZkQ0S3hsb013VlgxckNNcVdYemJGbUIr?=
 =?utf-8?B?SXBpOVdOakdQYjdSaU9TaThwVFlLR0M1UnkrWnRVbVRwSXR0VVJRN2VLOEJr?=
 =?utf-8?B?VE5KMzgrMGNsZGtVbzdGd2pYNkdkbHlKTENydUZxdnJreGx4eDNpbExrK2tm?=
 =?utf-8?B?N1VJZGFqaDJya082LzVzL3RONXdtYm5leVlzdEd4bUdDaXpoMVNjRjdjT2pP?=
 =?utf-8?B?MFA1aVFCVTR2NVpLWXlsNXF6Rm9UWFB0aHYwWUxGdEc5TU1VclhNbERjUVVE?=
 =?utf-8?B?Y1BvNnJQTmNoN0FjV2pLVzhiS2FCYldjdTh2R0l4N3k1My9EbjJxWXZvczNZ?=
 =?utf-8?B?Y1IyQmhrWUFxVjJ2NXhzYTV1d0N5UEpYWjgxV0h4NHhTY2pJQUZxMFlMTWo0?=
 =?utf-8?B?ZVczYUs3USthdnR4alduc0orYlp6eCtldHFOVk9DcHFkdlZGeENjbVplNjA5?=
 =?utf-8?B?NjBFUXRLVEJYRzlVbXI0VndhakdpRWc0YktpTW02akpKR0ZZMUZVZXNCbGFv?=
 =?utf-8?B?YmR3cU5JZXgvTDBmcGJCajZ5VFRFNTl4N0k2d1RkRWlnTEdGYytrdExGZGlr?=
 =?utf-8?B?QldVa2NJZVorRkNUazBvYkNlOUVEdE9nOU50WHE2THVUenFCaHdKUnRBY3oz?=
 =?utf-8?B?d1lTTmVVRDdlV1R6bFlBL2dBT1dRZDBIcU1qeXhUWlBVeUtDa1FVeStldXZD?=
 =?utf-8?B?ck5NVFg1MERYNnpmZjFkekl6NnBxTzVPTGp4c1V4MUdOa0ltdUZjUFk2aDBY?=
 =?utf-8?B?Y2psdzRZMzl3bG5pQ3AzOGRzcHhhV1hrRCtCMXo0SXlZd1QzRVltcDRzZTVH?=
 =?utf-8?B?OHZBSXFEWEpzT216ZkJVSUV5MXZKbWx4K2k5SFhKb0s5QlVneFdMbTc1U2I1?=
 =?utf-8?B?MFQ2aXNyZXFrbGZwWlBYeGYwRnNFeHl2U1UvUDRlZzJOWVY2QUViT2tZOGhm?=
 =?utf-8?B?bm51bHZaVWp0allHZzd6R05PUDdBaHlSd21sK28wcXBtQkRuSEEyOHM4M0dZ?=
 =?utf-8?B?cVU1cHc0QzJlL21ERmIvdDNaVE05aXFLL08vL1lGdVJ1TDFZcEQyMzVYeTdt?=
 =?utf-8?B?alJ2bWJ2RUpxZmovR3ZLRHFvMUd3cWRqL0Y0UUdlYTRpNE5hOW5zS1FkWnMw?=
 =?utf-8?B?MSs3M0pEbzVnbXppYWJCMUtLTVRHWi9jaDU0YnZSeE1PRFJUd1pPS3g0aDAz?=
 =?utf-8?B?Rk90Skw2STYyQ0szNW5TSkpYNmRvSWNqZmZiaEdlZk1hL3pwalQ3ckJVZm9z?=
 =?utf-8?B?Smk2bmNETEs2YUtIdjRWS0psUkNBUVFuVjlERmU1N2tpOW42eWZWMmN0eXdL?=
 =?utf-8?B?REhpMmRaVDk0WUQ2WnBQSG1TclhtUC9yc2Q5MUVLU3ZMWURpOUhxckFydUFI?=
 =?utf-8?B?bEU5Sk5WTGlycklMamNGYmc0ZTk3bkJ0dXhZK2tzR2pCMWhxaER2d0pTSDNw?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab43f278-5eb5-4c3d-a534-08dc2f3f668a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 22:34:13.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi/3kOa74AuCE64udPk8epLJ7wkKGy/k0VTSKWN1E8KgyP6PlKINs9vbhZ3JrEgJE0gb+M+fQiI2JT9IiU/TfOMarjWTgeMtBlU6CrQAB7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
X-OriginatorOrg: intel.com
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH stmmac 4.19 1/2] stmmac: no need to check
 return value of debugfs_create functions
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



On 2/15/2024 7:15 AM, hsimeliere.opensource@witekio.com wrote:
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> [ Upstream commit 8d72ab119f42f25abb393093472ae0ca275088b6 ]
> 
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Because we don't care about the individual files, we can remove the
> stored dentry for the files, as they are not needed to be kept track of
> at all.
> 
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
