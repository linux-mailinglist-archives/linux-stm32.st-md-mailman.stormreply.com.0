Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7B6DE81C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 01:40:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D71B1C69063;
	Tue, 11 Apr 2023 23:40:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B419C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681256456; x=1712792456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ub+luRHB1aFAMKcXXPUUuDMrnGzVkslw+X3kwld1d0E=;
 b=HOJO6jt/IAOjodJZgdfbb2vSJ+22aTOfOs5cHQbK5mC4i4sQbRDCQknf
 f5pQ7M7WByo2yMbRO2k4SE0lAuOEWSzTdpTm28od7T1eeIcLxIrsBCozO
 CTFrP+1G63gbIep5ZXonD2OGax7HX+ElWCxsCkRNlUdHntuWLP16oWClN
 yRoD7hdpUdl0ya5SMbtUl0nqOD61I4knYH8CtmaHer5A5Gm1tDLUJBL0F
 yHjBA7hZ47qE/b2nmB3tixg1S26lYpN6Na/5ohiCgE4QnCMLDEhD1Pm/9
 6iJ1IWJBQxc1P72bkyRavbpAuFp74WbG/p1qOPC8fsr4xG7P6HRy/Wuhs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346435407"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="346435407"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 16:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666139095"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="666139095"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 16:40:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:40:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:40:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 16:40:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 16:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkcaj14MVKQzDDQksd1uZmwmX0HmkqucC96htUWomIsWeINxvIFa5oiehF8zu1K2J1Lonl07RjX4SqkHwI002RKiNE0nrjzRxAIQRkOk4DlBDuhj92IJnNdddq5oEIL07HYeSxOzeF/kw3usHhS3ygzmQUsqKaMGXSdRPzgn811GdTkkfu6dAyt6zeMBpy2DSaaSINW3yY8IFlGyhlXQ+EDFMF3Q8Eb9yHUWLYKdw2aDZbLIE/lCY7g8av70WsDhB/kRIkPVCKB/MD+YvnpYv6Dvm8feaNXaGx1yzo8J4NTfgLNoQ1z7bMsXZzLTwFoPVnkq82+SVyBtMkjbqISVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fp0rdeOdqCqT1LptCsZXgCGtzrYIEl6lYEEVQ+PIu5E=;
 b=SYpYe5VThM1vDiaqcd5EJ0+TutdKXdR8G4b9SCV78bXgWSxUIqoHU8rOK1V8DDzk9Zi9jNh0H1L//3ZZx6yZ0rCxvaWt6kEin6ZL5BhzazivrexXJOIyg1iBefaqcHCXoPEF5YLTpqDbJCAo+79/O+1S2H6VhJD62kRPIaPWZ/R1EAdxkguwZwazsxujTgNTUDKS/kA8IxTJmoQ1E6Nl8cTlLpWT6rjby8azIXFFDdYeyzjqAmoylG0YX3lGfzm4ivUviX1XmD/EpUgiCEB3Yy8wzbSUQSQJtkmYzXhr9juLRnefkBnGJXykqUL78wb+B7g9QpRtAqvtfWi95o/IFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 23:40:35 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c7d6:3545:6927:8493]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c7d6:3545:6927:8493%7]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 23:40:35 +0000
Message-ID: <286f6c3b-2398-56ef-d29f-49321229bdeb@intel.com>
Date: Tue, 11 Apr 2023 16:40:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20230411200409.455355-1-ahalaney@redhat.com>
 <20230411200409.455355-9-ahalaney@redhat.com>
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <20230411200409.455355-9-ahalaney@redhat.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|PH0PR11MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: fb94bb60-82d3-4516-1af8-08db3ae62570
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZT5ojzCNzuVJU2HflXh33GBhz19x2FYdsjRHaieIkscxZI+D7qEmAWvP1WhHSAwgu7SElWfkxx/v5OmDHkrlfthx5zIyu4uSxysm8LbrXAfTsUZutbzHYe8mAaspAz8AXnBjlplfLhoOB8pxBHyl7kTiITrmVHX6EYSoVa9JzbDpLbtqRVT+Y7Li/b+3iePhkdxN5I0lf3oG2wrhAU+SsPDGhcZ1d18eVz8gUU7nOx26iHAFNIDjeOxQtFWCO7oXsNG2YcOVMyecPnLKezqKP575ZOEJWmZROfoEJ2TjcP1DangHmt3CQ5QgVKnHoA4KX8OCPbCAXSRbrV5yZ4Us5OhNfEF1yU41AtR6NwZ/uy2F4Ow1hVmMv7hPc5CYG/2cCqEkZ0Is+58Xaa4JoZl8b8nHZg1MPLvnEawf5YK9HZfO5t0fKbUbxQuW3CKMoKCijffpF1TbZyBB+uPr1MT//VMrp7RHbMZPigOFbnSSBqC3mY01YvhJ8A2qszzR2yCjKdWiCqevXXPHRjnbIZXujF2i3sRY8pkbm28G+G5mH6hrW//bE/F8xM0GQ6Q5fQS26X3agNQOcixUsguwx7EZRGpVzworPcBp9hD9zf1CBPYGdpOd11So82xF9syOlMHOoYrN9QAmMM1v5gH9ydZwsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(6666004)(82960400001)(2616005)(478600001)(6486002)(26005)(186003)(6506007)(316002)(6512007)(53546011)(44832011)(2906002)(7416002)(36756003)(5660300002)(38100700002)(7406005)(4744005)(4326008)(41300700001)(66476007)(8936002)(66556008)(66946007)(86362001)(8676002)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWU0TW9DVDRlL3pHeHhIbG85S1BDV3lHeExhM1loVE1nblVBdGNYN09wbnYx?=
 =?utf-8?B?Wi9RSTZDZXNXejUzOE1qN0Nkb1BJVkNvMloxZ1RWT2RFcTJFS3cwMVdXaTNM?=
 =?utf-8?B?bitSWkdKN2R5QzVxcmlKRjFwU255QmZNWDRtNDIvUUZxQ3JuYlNqQTlzZzJk?=
 =?utf-8?B?M1BuSEZrR2l3NjVrMHFIYmJNWERhOFBhQVA0ZEk5Nml4YkR4NHBPUTR3U09V?=
 =?utf-8?B?OUhDaU9EelBuM3V4WndsZUN6ckVFYVRjOWxIeTV1YS91REJMZ1dDb2FNU1Mx?=
 =?utf-8?B?dDYyVk9HMngyS2VjZnJmbFVjYWNacE1CdzJDTUZHV2tia2FGZjk2bktYR2Vp?=
 =?utf-8?B?TnN1OHgydGwwMmhXajFYZHNtOEw1TTQzcjNjdy9XM3Q3Ulg1S01DSnZucUVu?=
 =?utf-8?B?ajVvSzNVSkdCQjZpN25HbEJINTFVelByK3N6ZEszTDVDeHJyUE1nckhGQllF?=
 =?utf-8?B?c2hxSUduM2hrYjZ0OURvYVdxQUp4aWE5eHZmUWZvZURYVFgrRWFTd3ArOTRi?=
 =?utf-8?B?OVg2eHdFdjhwa1pzVXZTK09ldFZKZk1ZNisyRFJsaFgxRDBERm9ubVJRbGow?=
 =?utf-8?B?QlovczRWajZGOFNIV1dzYWEwamY2elRRN0RUeG42MnFrK3FJNEE3RGZYOUk1?=
 =?utf-8?B?NTdMN2tXR0pNY3NoOTBJQ1V4M1E3dVFGSGt6UDFLQ3A3OEgxY0RicUd0WUh5?=
 =?utf-8?B?SkVsTVFrVnpLSXdRaktkUlFkRUtHZzk3dks0bGY2RTJTOG9aZmZZOFBrL002?=
 =?utf-8?B?ZnRhVGpiZ3dMTDRoZ3pPSDZpYThJRWRSYmQ2ajNWRXU4clNHcFdYSlYyWkIr?=
 =?utf-8?B?WWRVZW5oWXYwSVpQVTBIbysyZW52L1ZCSXJUY0tpdDdpaUNIOWhubDhnRjV3?=
 =?utf-8?B?VjBVMjdScE1qWDE4dG5xNEFFa0dKTUNMRzVkZ25taTlYQjVTL3prV1Yya2Zq?=
 =?utf-8?B?MHgwTUtpTkZWaXRxVzRMQk5hZ2tTdlQ1aEt3eEVTTU9HVWcwbzNydCtNVWRy?=
 =?utf-8?B?NCsveDZhamFVS1hJd1hUbWtBbVozSXJEK1N3bjduQStwNVgxcG50d3paOXk4?=
 =?utf-8?B?Mis2MGs5T0Y2S3I5VnRiaFVCT0pCZ1kzYkxWa2FpZ1dweit2NmRRLzYvazEx?=
 =?utf-8?B?T0dnZGwrVFkvWVlQRGJ0MmtFZ1dlWjBSV2w3SHVId2pCT3RKRjJFb1VUY1VC?=
 =?utf-8?B?bHMzYm1mWWFVT2ppVHJ5SjJyMjRXNDZ5a2VVRERxVElzTHUvVk5UdTFYc0ll?=
 =?utf-8?B?ZjdvMHcrdGNPcWVZTDE3c1VROTRNaCtnN1cvK0h2L2h6VDZqSEpnU1NrM2lr?=
 =?utf-8?B?WjgvSkE0M1ZXRHRIdnJiOE9xNWcxYUVlMlFaRUpvMmdMdUVEVGdmM01GSnRQ?=
 =?utf-8?B?MFh4TWRGRG1xM0FSeVlIOG5DWEJEVlhLQk9CSzRTMEo2OVoyR1RyMTlaTkY1?=
 =?utf-8?B?OUxzS0ZzNTFmS29pcEt6blorL3lXWWxNVmJxUmo5NE45TjJGekNaYzVxcm9l?=
 =?utf-8?B?ZXdFQzlFS1lCRnNpV2xwVDI4dS9CQ1Fnb0ZwYk5OZTNldVp1Z1kzekl4Uzgx?=
 =?utf-8?B?TmgrNWcwekcvVllGWkwwZzE5Zm4yNjRNQkdVV2ZoVVlaRkNCenFjSkJNUHJ6?=
 =?utf-8?B?QjBic0YxeENGN29VRkVtRnFYZXU0NkpUVGRDYXhKUlFSZGRmYWIxRHliRmcy?=
 =?utf-8?B?ZGlGM2NRV2p0RGY4aENQUkcvaDV3N2pWb1R6aFF5UUdHWStJU1c2MWpPd0lL?=
 =?utf-8?B?QTQzOFNiQzMxbHBaUjBLYW1ZRHl3eURPUmxuc2ZhWGliSXpZVXAyQ2VOaE1I?=
 =?utf-8?B?bEJYR253UDBHRmJMdWFKQ2JYdFh3ZUtob3luSlM3bUUyTlk5bWxxbDd6eG9l?=
 =?utf-8?B?Z0VzSkFJQnBBbUZIMHoycDVSMmRGbS94dVhuQ2dJUElUdUR2bllHTUdPV0pS?=
 =?utf-8?B?bitvL1Z0a3dpaHpVY0t2ZG50VmZtSGVEbTI2Y29kZGN0U1Y4TDBDdEc2ZnJt?=
 =?utf-8?B?eGptWDNtWHVndys1SVllTEMrakZtNWVwSCs4MHQvZG1nTXFmNTd0YkpzUkxR?=
 =?utf-8?B?cWJmSlJxbnJqUkUydHJNSDgyN0Nld3RSbjladjBCM3BsdDdva1kyUThmTE9h?=
 =?utf-8?B?TUsydU55WWE5YWZ6ZU9icTE2U1RCanpUSFVLTzg1SFAvY0RkekQ1UFZpYml1?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb94bb60-82d3-4516-1af8-08db3ae62570
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 23:40:35.3945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX6gtYM/K4smFkI0YAtesC70OydDN8UaCPUse3PxdmDOOyHXolxSY18qZuuCfAnKefB0IrVYCcGYz6zNPmDwWUgqgvPBXjOP8YIJUECC4MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5902
X-OriginatorOrg: intel.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 08/12] net: stmmac: Pass
 stmmac_priv in some callbacks
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

On 4/11/2023 1:04 PM, Andrew Halaney wrote:
> Passing stmmac_priv to some of the callbacks allows hwif implementations
> to grab some data that platforms can customize. Adjust the callbacks
> accordingly in preparation of such a platform customization.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
