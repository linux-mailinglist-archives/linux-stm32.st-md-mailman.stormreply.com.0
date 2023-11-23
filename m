Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B737F5C66
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 11:34:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4903C6B476;
	Thu, 23 Nov 2023 10:34:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2D9FC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700735686; x=1732271686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xOYSn7FjOEGSTjCuLJ+SQmSf6Gts0q3oDx67X+o0DxE=;
 b=nGJpHYHotoQqg1U9nMkA1XXBcOuv0H8SPId/ECNLoeMolHquA3Evdxra
 r6vX2SAP9oTEK1yv2NNlT0IkoKOO49f6Zfu0oWmoIASlFVaRUGXo1vinZ
 0+rTKMFrNjXLcqqKAy2w7WVziRKZSgsbnD3q+oYZCnx75k6U/TXgkaEDk
 mc2Ua0Om6fI8B4Rzc/XLncvDcOeX0CADm41cM6C8omI1/Rvouhzrc+pql
 ZcqfGBk5UvzUpnxiQR39VshLHFGIB7Ay0JfWjqi+eWJpKJ6MJHqabuhGs
 +n/5os424kQDLJcNzT5MMu+14rhKGMbPP07T4hRXiKE6PTXeS6eRRqmEC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377269884"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="377269884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 02:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="770954148"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; d="scan'208";a="770954148"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Nov 2023 02:34:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 02:34:42 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 02:34:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 02:34:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 02:34:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqCSB/60vkk5vV3UDkIqUGyvCm3fSPBE8pkcwtaNzQKvdUp1RtK5zhe0/55tljYoImQwUFKFVuo+sI/MoTgMbqiMFMhw+YOjb108DZupcrhCHGuhwOSQ5eo1LDTyaVvouFnFFGJY5zc3HhPqmgIqi+DctB0tDpFSkQ1+AwpR90oMm26xLs3mn3Qn/V56A/X7CFYMyavmCL461IIDLZx/moYWiuxirG6u+v/BSaeOOTX7uXizEGCLtJtM9yANiQ7vaZjQLmP/leHS0fofnHus9Xlwn0H6WUyw4JVwPMy1xnfTsCmbEcmVC8sgHhLMEnd5NbaOgDStPIMUnMNbsjT9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U587A9z2BqkBkfMMlZJCrqOf2mwKk2wr3nD4wJXzYjk=;
 b=lA6r5QYc3ePhhEvYCB5PynYD3FzkE+fZW/s9IZjXf/kq5sppV2H2P517D0jO1BXXpzg6YhaaMGqlNEtpBGg/pK8lruGixEPnoPY8cygMnxDGgya/kRIr/Iqu1IOEBldJpJtZsx2st953YCL34I2sotunh/eASvLGTdLrMrBqPKUPh0XrAyYpcB41jicTF2p4b3W9X1XEch7zu3Vupq7LiQ7prC3i+TfWwGzVjHKsOKTISS26Qmf5q3Cjs2kd0kghGemO3yM4WcA58KRzqrjCjDJH9mM3Ymy5x9CM4i5dfSIQCi94KbjWwulUmtZ+/k9D39t4D/z412WXqP9EraIp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 10:34:39 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3%7]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 10:34:39 +0000
Message-ID: <cf62fefa-c746-4d20-8845-38e3475f0ed5@intel.com>
Date: Thu, 23 Nov 2023 11:34:32 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Furong Xu <0x1207@gmail.com>
References: <20231123093538.2216633-1-0x1207@gmail.com>
 <2c2d0641-002c-4ce6-9df4-bc633e602721@intel.com>
 <20231123182405.00006454@gmail.com>
From: Wojciech Drewek <wojciech.drewek@intel.com>
In-Reply-To: <20231123182405.00006454@gmail.com>
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To MW4PR11MB5776.namprd11.prod.outlook.com
 (2603:10b6:303:183::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5776:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b11b7a4-c81d-4559-bf4b-08dbec0fcc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXOJxgirg+Gj1KlxEF/PtXRNh72smbeUE10gBgseCD3H9VY26k2Nf1G3J5eGchdjzAi+lf2TzHYeC+/VfkQQYzj9Neg630Wl1vR+aYCTQp3LqUsE836kT0S6Bsud9YIMZHqIW26ZwPmN8PGuZQ4cq06OkEVS30uBpHo/TYBMarV6SuDi2qMTyw+ywqbdW88ATU9a3H9UrOHhUrgqklNcJ2PQLLFMIk1d8nIxGx4Ub1R9qGGxRlvDkAq1TIhNyGgIWKhJQ5lno2TVvxTXPh14M6W4fKIwVVR2RWyAMhKprGZOT3n0WT3D1WNXJDVHAI+cjMl1DBnfanc0/eiKpIXIBNvkjqhnyf9FfOVwrT09JuqsrMkjkCvwaDj5Kua0Ulsj96nafc6cO38XNPezp+i7MZjumhLlY/1vDxN/UYaHbYwBB/7tQykPK9FO786+kSQz9ONwOC2bmkbmqptQCWZ95DV0kOQfQrDiVBPUBh/tuYk9j4kQQZ+skOKUSKzCo3vSv4dRRKiWoAFDyjslv6+e4cO4XrGsFSxgtxs6keID2qzzLy3WdTQUVMe6PID1ynO/zthwEC5vs9dz2ilkqwcO8W9PuEQcG7KB6w4iGI2ceH0vbY+XZ6fSTTI7dO+zCReEEBQtO/V2RYzL7j0m6pcR0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(5660300002)(44832011)(7416002)(2906002)(4326008)(8676002)(41300700001)(8936002)(54906003)(66556008)(66476007)(316002)(66946007)(6916009)(6666004)(478600001)(6506007)(6486002)(53546011)(31686004)(26005)(2616005)(6512007)(38100700002)(83380400001)(82960400001)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25RRVlMc2ExYXdiK3FKQjVBeHhxVlNhVUJQRGxLdWhlTVNTeHM1cEhUT1Z4?=
 =?utf-8?B?TXlGY05Id0taVnQ4Wk13NWdnSHg3Vk5uTWZOcm9Dck1jdE5pZlRRNFhJRzVD?=
 =?utf-8?B?M1M3alJpWnFsUFpROVRHWXJqQjY5Y3NLaHVKKzBkNzdPdVlLbHBVWnNhd25Q?=
 =?utf-8?B?b3FQditONXM3WlB1ZGZ5UWRiL1dVRHkyeGFVcGZVOUFVbE5zcnc1VWhsWFlT?=
 =?utf-8?B?OWJwbzBvUEtYOWJmZjRRL3V3alJMWmhoRU9IS0Y4cysrTGxSMjdocnJIbGs4?=
 =?utf-8?B?SFl3dEtDNzQ2RGRLdUdjSi9wckNFNGxaU2hhQXNmR3B2eklpR2ZkKzFmTkoy?=
 =?utf-8?B?SWxBT1NTMWZCWXNMZmVwZitDaUJKK00ra0lZaU1oQzZmTlVmNmFXWExvSHh5?=
 =?utf-8?B?RklHWlVydXpVK2t0TEZFb1d5c0VPWGVoUC9BSDY4M0NrelV3SEhaL0tWSUxC?=
 =?utf-8?B?R1pUVVNCc3ZweE1pbzhLSDFuaWtBa2pZS0RKc0RjR3VsQnB3SlJOaGxTaVEy?=
 =?utf-8?B?K0pDbDFLdXNuaFZOYVphRmdqeDZpOGVzZ1BkK2RQQ0pCVW5neWRqNVdsRERN?=
 =?utf-8?B?SHBib1BNeUd5QUdqMWFYVFdpd0Rha0dseEdLU2xnWmxBMzhSazByK1VNc3Zk?=
 =?utf-8?B?OUZwYWk3WG1SWU1MdFcyMkxOT3VGZHp4MHBwZlJma2VOZ3ZxNW5WSTEvU0cy?=
 =?utf-8?B?anF5czZMY0w4c1RpdXhTV3JTaCt3MllWYXlUaUtBTnhiTmI3aGJGL090MzQr?=
 =?utf-8?B?LzA1VHB2MmtqeStDN3NkNjNqVWM4SFNqMDFqNkJRZEVSVE9TTjc3SStKU2F1?=
 =?utf-8?B?b09wSE1RV2VzVFVZWjZuMzJ3dWRkaXFiRjQ5V0ZKa01TMEh4dlFtTUpycm9N?=
 =?utf-8?B?ei80YmhtWW9laTlWdU1LRXhmbjNDOEM4WDRGZVMwQ2tUVFJrdUZoWEpnMklJ?=
 =?utf-8?B?RlVMSWZZeUllQUFFQmtZdExPZW1Yd3VhRmExeHpiUnhIL2hqakY0bzcvTFZT?=
 =?utf-8?B?Q3RmeVFqU3BsSThIc2lRVVczMHpZUnI0c3JWbU1HdlZET010THh3RlJYZktz?=
 =?utf-8?B?cksrT2tQczgrRms2UnFsRjN6Y0FDVlUyd2p5Z0g4ZDQ0dWhBMWZPNHl4SjNm?=
 =?utf-8?B?WXA4TWJrMENsRUh3ZTN3TnFNM3BFQVlwaEd6emQydU5ZczJRbllKWkh2OXFu?=
 =?utf-8?B?MFV6dmVMRnYyaENhaCt4d3hwamowUjNDY2lzOUFPNTQ4UzJJZHJPSHdsMDNQ?=
 =?utf-8?B?MG5VZCt1WU9RZ09QV0lHeTVKRmxxV1JFdVIxMXc1TTR4alVGZnhnM1ByL3ZR?=
 =?utf-8?B?QVdsd2VMSEZVTzJxSVFlV2djVDMrbC9INjRpejdwZm9CNEtpVE1UQTRuMDVS?=
 =?utf-8?B?ZlA1YnF4QlJsV3dLNkorYlNBS2VGUGRRMWxkamF2WU1TbFR0NnJnQ0FXSmQz?=
 =?utf-8?B?MTM4dks3RHRiMmpZKzNUYXFhS0VPQ1BVc3RudThGYWNNalpUby9Xc2RlVDhX?=
 =?utf-8?B?OXRoaFVlVHNpb3BmK1M1MUsxeTE0TVJtUFFrSEtyUVN4bEUzcW1udUdrRlZk?=
 =?utf-8?B?WE9Ob2VucGQxNWl3bW83TmJqaUEwSlVjVlVTeFNibXY3ZEYrRnZhU3EyVk5B?=
 =?utf-8?B?Z3pXT09VMUV4aWRCSFljQnJGRkFtazEyS0k5SnhPdlZhajdwYkJ0S3JyMWxT?=
 =?utf-8?B?NnZxQTY3N21lWUNYempZeFphMFhja1dWNk1udCs5anVNc3krdTFqZDlqZ3dH?=
 =?utf-8?B?d2UzTzBJYmhVWm5YMk8xSmZ1bHRaM1dvdnhrbXZpVFJlNFh4UkgremJIbUVu?=
 =?utf-8?B?WFNHUUZtUSs2TnlCRWd2VjZ4b1RVYnBPK1BBaU5CUXNtdkxhVmxwajdVWmJE?=
 =?utf-8?B?Ukt2Q3drUDNKNTRWcmlEa0dkQStnZGIyeWp0WVoyeXY1T1MrUU41VjdhcS9X?=
 =?utf-8?B?Vjd3eUJnRmtkbWx4cXhmUjFuN3RLZndVN0Y0V1RmZXo1SitiS3J1Ylg5Ynlj?=
 =?utf-8?B?dE5XNVpHM1BjbVdvZzBZQldObkw4ZTBoUWhaRDFnQ3BKeWNFZm1rd081d3FY?=
 =?utf-8?B?cVAwKzVGSjFoL3diUTlweVRWQUJrVDJnMklhb2RuOHF0R2UrK3NpUjJicTZm?=
 =?utf-8?B?SERkNy9RRmVyMXh5N21IejZSRHF0WjFPRFJYRmE2QjJMd3djZUNmWDZIb0wz?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11b7a4-c81d-4559-bf4b-08dbec0fcc23
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 10:34:39.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quwIYAf3iaqf/oW8MRS8UTbHthXY2N4uUBHIJvrFQZr7ePWDa1tuyshJVPBeLQPX4l07OXKy+TNd3Oegqhc0ZjvujtTecsDAcGvU5vM8WQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
X-OriginatorOrg: intel.com
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: xgmac: Disable FPE
	MMC interrupts
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



On 23.11.2023 11:24, Furong Xu wrote:
> On Thu, 23 Nov 2023 11:17:17 +0100
> Wojciech Drewek <wojciech.drewek@intel.com> wrote:
> 
>> On 23.11.2023 10:35, Furong Xu wrote:
>>> Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
>>> by default") leaves the FPE(Frame Preemption) MMC interrupts enabled.
>>> Now we disable FPE TX and RX interrupts too.  
>>
>> Hi,
>> Thanks for the patch, one question:
>> Why do we have to disable them?
>>
> 
> The original commit aeb18dd07692 by Jose Abreu says:
> 
>     MMC interrupts were being enabled, which is not what we want because it
>     will lead to a storm of interrupts that are not handled at all. Fix it
>     by disabling all MMC interrupts for XGMAC.

I would add this information the commit message.

> 
>>>
>>> Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
>>> Signed-off-by: Furong Xu <0x1207@gmail.com>
>>> ---
>>>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
>>> index ea4910ae0921..cdd7fbde2bfa 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
>>> @@ -177,8 +177,10 @@
>>>  #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
>>>  #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
>>>  
>>> +#define MMC_XGMAC_FPE_TX_INTR_MASK	0x204
>>>  #define MMC_XGMAC_TX_FPE_FRAG		0x208
>>>  #define MMC_XGMAC_TX_HOLD_REQ		0x20c
>>> +#define MMC_XGMAC_FPE_RX_INTR_MASK	0x224
>>>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
>>>  #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
>>>  #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
>>> @@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
>>>  {
>>>  	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
>>>  	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
>>> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_TX_INTR_MASK);
>>> +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_RX_INTR_MASK);
>>>  	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
>>>  }
>>>    
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
