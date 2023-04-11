Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9766DE832
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 01:42:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64E28C69066;
	Tue, 11 Apr 2023 23:42:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F62AC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 23:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681256570; x=1712792570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Vk9EzIv30HkPnigih7IlZ6Iq+GfdqLTKjIkrPa1UEg=;
 b=YbK8U+bz9IDKmZAh/uvk53UTvNz+XkgRfa6xrydqwZBQHGP8zU9K/91L
 X8nMECdWje3LHplz9jHYY3GxTK3CpjeKqA7uVtKzPc+dTUAFkjZA16POt
 USONCQVwwemg1cG+0ochOse94lyHg9J83p42KH4zl21s8qMcEHMRhami4
 qEfil4Ubz5xAwHo9qCDXs7Rd8WA9cd0UZjSZXgotY7A2RL16kfhonesBx
 IAdg++fvfjU5TfU8Jlz1+WRllEl8I52Hbf1H3vka86ZUXeGB878oiNeWA
 xKs2o5hnOKcit8rA5V88XXdYepEw0Zw7iJi1spQVHZGbY/xSK1Ll9mlEZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406586635"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="406586635"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 16:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812770877"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="812770877"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 16:42:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:42:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 16:42:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 16:42:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 16:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqb4oARC/JMLPNM2JehOmiMUizvy6127s2iK+L8yL7kuzLiN96xLHTMH9n1MWjbXpZC5502YSKQdNFV35w+KRW6ovxsAXpLODu88ZPkVCinEL21RPEccsjQy4W3jKKW6VNw6YzucOMfV9DyVHXmPN8UFnqvQwzKQZxMbc21bgG4eCkCKjww99WgBXPTRo6IJkdmTYr9NqZc3ibt2L+6ssYlYJM9Qeqn6d6tsUcvOTLVmSvRhq+CZk2M+kKevGsxHYGm6u07IGklfskTmpXlnPNehKFVtXsGi9XRPrP51zb8QygXf9nNBZTbIl/8haaMfWS+9nwihPzEGz2Q5osi95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4R+f1LPI3hQ+0Ybnj5yBLaw6C/OINJaGEO/AokY1Zg=;
 b=nrKjVym1C2imm4WB3QKDuRUvmoVSMRjq7EVlYhQgJuMYtw0CcHTj++QZ35F+ItNM/xGKu+r4p2tc5L/bOc5WrK8Ro4/ig6iyvjuBN3PBfNnp+VxvEayhTNCD5j7gyB2Eb+w2d21tPplU2Xy330VTaYsE+EhtnjyUTTSBX13u6O2jRoUtQOPAdr4AJCxvFUOD/+PxgYhF8IMBO9Uz/EkiCkUxSWKlyunAr0bsMh6PKuHWWIbShEAtBrX1L66oM1tM9JmEDi8+0YmF5to/+cQdGxQtBhospu21/U3ueKVh0tEmAH2NXsM75aMCpOzrU+PMMVmy1Y38nMn2TDz3nt6lHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 23:42:39 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c7d6:3545:6927:8493]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c7d6:3545:6927:8493%7]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 23:42:39 +0000
Message-ID: <f2acb0ea-90ea-dfbf-6367-c3d44f0e8436@intel.com>
Date: Tue, 11 Apr 2023 16:42:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20230411200409.455355-1-ahalaney@redhat.com>
 <20230411200409.455355-11-ahalaney@redhat.com>
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <20230411200409.455355-11-ahalaney@redhat.com>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 6179e9b3-b3fd-4570-ca40-08db3ae66f49
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ns/3IwpvQQdc3UZ57OKkkinnBu7kAdMvecpwdfc0In7SIwOC36+DVJ+Sv0E3wdQsGuvZgQXu1i9TtYueDhEVyulWlhSzJAyURXNvd8Qub7yTA04sbkLl9kf7Ht8pFE2TWHOeS9l9YZmXE2ApqkJ/HM9k8t+83jsMceh3GutUl5QZ9m1cbgF8EL5Ru16ZnLV0xtWypHxIerX8agqJiSlctlNCTkwhOclavt09NBKP0M4eCjTH00J/7+zxg6gcpmW6+mlAvkeglU3QJV24WjL9JNz9k4k/yHY1Cbaln8L8jU/eXJhZEygfJJX2vKKUVE8c5PYGG5X/yijJzU2mc+Tv2/Q9e0yYMKtOSJoovHTKzNewJfbvEglvMmu+mHPMjLTaqXUb1IX+QMVbJtQwy/VBvm80ZbeshPOxSeIaZZQNbHDpYoUNdnV5tN2gi4wssReLAxujo0KvFKlcLot3cR1rJ8chJ+feikRX2GwLRzDXsTcU8iCVZqG9JPWSJTYOiXPuDs3aK8z1mA267qasHrQ5xbXzojYX8m6krvyaskADI6Q/W9gC0G7AK3JDeTs2leRttB5NjrEO8LLkbNaR9+HudxlrSUvqQS+5koVRa5ulKtrh51YfRRXHuOJ062ofNGVtWiRkcMikWYnMsRqXULKNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(4326008)(86362001)(2906002)(7416002)(7406005)(5660300002)(31696002)(31686004)(66556008)(2616005)(4744005)(66476007)(66946007)(186003)(44832011)(82960400001)(53546011)(26005)(6506007)(6512007)(6666004)(6486002)(36756003)(38100700002)(316002)(8936002)(8676002)(41300700001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWREWGNBek9XV0hraEd0RjlKWmt4aDhuRXBxK2lxRXp5aGIzRmFBZWZkVlla?=
 =?utf-8?B?ZFYxK0VSNWNKMkp3WkI5L3JBTkppSzUvR1lLNkg1QjdDVEhsY1NGd1ErY2xB?=
 =?utf-8?B?R1NRNW5WWngydkZrbHVQMXF2U2xEaVZLMmZQM0p3S3BtajgrQy9tVmU4cnox?=
 =?utf-8?B?OUV0Sjk0cGpXVVhTQmcySVRyV21POFJHWjEzOXJLZHA5dUhnSXorL2kwRVpX?=
 =?utf-8?B?dkZlRlRra2tOVUhzM2RxeFJCK0E0NTRzSVYvUnVSbElrMXQzL0svb3NOWlg2?=
 =?utf-8?B?aHFFS2ZYWjBHMG8vTTFkcmpJU3RkOGhRZXc0bnAyQ2tXcUl5Tm04QWdRR0lw?=
 =?utf-8?B?eit3UlQ2azh3aGtyNDN1OVFIWGt5REVVcTVtWUxKdGYrUldzOGw4dGcxU0ky?=
 =?utf-8?B?VG8rK2V0WUZGdXBIOWxwS1lvOWFFdWdPbzRSaVVEWGJlSHo2MGQ5UW1tOExt?=
 =?utf-8?B?ZUh6NDZhZVJzTXFsa05wd2dkei9tVlczSkw0RXREVDFMVjVlRDBmYkRzWkli?=
 =?utf-8?B?aFByVHlyTWdwOFV2cGFtbGhEOWhVWGRGeHVOOWEveldlNWd3MjVPZ0x4STAw?=
 =?utf-8?B?NU1GWTA0aVNMWWIvMjlZUVJEZkM0ZG1lV052NmxpZXdXZ29Cc1BzMWV0cEhp?=
 =?utf-8?B?SXRwWDFNcHp5KzBSME9LVjFUaGF6eXdjOXVPWnl5Y1BWdmYrQXZoMzRnbGpE?=
 =?utf-8?B?WjZ2d1dkOEhPd1EzYy9OTmMraU5WQ1pTNElPbWE0WjRGKzlic05yK2RvbklL?=
 =?utf-8?B?YmFzS0lzQ2YrR0pPSFNpbWdITFpuSzY5WktsUlZnb3JqVHhoVkpZdmUxYTVl?=
 =?utf-8?B?cFZCK1NudmNLaHVWcXZoejRydy9ncWxBOFNMMmxSQmFiWk1oeHBBSjcxekRs?=
 =?utf-8?B?MDZWdHBRRjFqVHUwd0NEd2REZXlZWHJ1TnRhVHJOcUoxSzVZV1R0dnh4QzBQ?=
 =?utf-8?B?eDRXbEVOMWJyTnc2eEdrQmhUSDVidTBlU2l2WG4yNVUwMHRQTHlTV2VURzVE?=
 =?utf-8?B?YU1sOVZuRHhyRlVTZ2V5dzZVcUtWQ1dMczVsWlJSalhUOHMxYzZYRHUraU1q?=
 =?utf-8?B?TUE4TVZsaDRCS3RYYVYwcWdsMHFCdlBzemJvSHFMTzhXb1M4Mkw1RVNCT1Jx?=
 =?utf-8?B?cDNEUDd2WlJqT1QrczNvcUsycmRHbWNxYU0rMEJQbHo0N1g4SFFFM1JIS083?=
 =?utf-8?B?dGp2UWNEK3JKNTBNU1o3Z3pVVmZFa003UVppN1IrLzk5NWxuTno3SmhRYmtI?=
 =?utf-8?B?S055bEZ5NWZjWExLVFZTeWNTK3laNGhPL2RuWExidWw0WU5zSFgxelY0c0k1?=
 =?utf-8?B?UnZ0VE1MQlFDaGtMSk9qZ2FHT1ZzZnMwb2dpdFBwLzM5Yi9ubWRpVk1veWpG?=
 =?utf-8?B?aTlCQXdoN1Z6TDEyRlNLaDNsVUpLYlRqK3hJWXBxK1lyek03cDB3QmZBZVkv?=
 =?utf-8?B?Z1FKYTNKOERVUzdVdHM3ZXhTUXppbk9lUTlNNFdUNmh6M1V0SUZqUTRYWDdj?=
 =?utf-8?B?RmozZ0FGY3ZZMWNVbVFzcW52S1dWOGRJL2VkUnFZQS9ZejNrSHQ2Q01pWWZh?=
 =?utf-8?B?T2RzMEorS2Zxclp6MkRhUWZJR1dBRHVhOUk0S0FlWGJnT0g5WHJHSGR4VVo2?=
 =?utf-8?B?c0RDNlJlNjB2MzlIOXFiZVVabUFVM2poSGRCajM3Y3JMb1lMSWxaT011N1lH?=
 =?utf-8?B?djJQZ0dFWTY3bUZ5YThJWE1TRHk1VWVNU1hPOXZyR1puYTVSRE5vcDRIWlRo?=
 =?utf-8?B?Tk5mRFFNdXVjU3RUQTlCUW1mR1R6S0QyN0VZUEM5NjdJVmd0djA3UmtGbm1S?=
 =?utf-8?B?bC9YL0lrQWdIWDF5amtBczExbmplOEV3NDc0cWJKcVNFd3UxNGtrNnYyblVn?=
 =?utf-8?B?MlNTbWZvbDduSzVJcWcvcVJhQzhETktLWkRPeFBBY1Z0ZjlWWENHaWFDTlhx?=
 =?utf-8?B?R21XR2dzcGF4S242U21iUWsrU2YwMWNGSFFTWHd5NitybDlkZWxnbWNqK1Ew?=
 =?utf-8?B?dGtyRVpLS2pKek9KbWVjcEYyWDFaRnR2QTZqdWJLMlk1ZUxod1BVb0JRN3py?=
 =?utf-8?B?anZhbmljNGFLd09jWGdNZXBKWEkxZzlaaHBhYnVaM2NWVmdWcXVSc2hBSWhS?=
 =?utf-8?B?OEV6OXBUSXp5ZXJYaGFwdmNlQzNZKzBlR1V5T3lvUmdqN0QvOE56UWV0MTlj?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6179e9b3-b3fd-4570-ca40-08db3ae66f49
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 23:42:38.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCDnL9mN9JJO8PTx94wwYQY7ccijzT9+mCLYsUPN66IsFbbfirpgJEHNFnZ1HTxwDe+XGkFIIc4e76AiiurlSfJOy9XGmVuf4SXHKok6/5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
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
Subject: Re: [Linux-stm32] [PATCH net-next v4 10/12] net: stmmac:
 dwmac-qcom-ethqos: Respect phy-mode and TX delay
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
> The driver currently sets a MAC TX delay of 2 ns no matter what the
> phy-mode is. If the phy-mode indicates the phy is in charge of the
> TX delay (rgmii-txid, rgmii-id), don't do it in the MAC.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
