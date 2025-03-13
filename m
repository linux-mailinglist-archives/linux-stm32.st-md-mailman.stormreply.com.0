Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6AA6046D
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 23:34:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A44C78F97;
	Thu, 13 Mar 2025 22:34:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D716BC78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741905269; x=1773441269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fB6AmsY3KMUk80PXuy/JIEo2BZvjtEfqKRHrVbpSHvw=;
 b=oG6W6Y528oHeAyXyYp8agDJueJj5f9QKlfUVbZQkdo5QxCRvSHyotY72
 S5fxJlvM7TSGedRw/bUTrVKta0u8ti0URKcjyPqbUt/jN7w3jnn+nzTPE
 JqbyS+jJue/5qPTAwvI/b/8E5pofejw89QifsO7Ly5Z7p6W8tvku1iQ6C
 NIJA9pbb0HB/g4LOofJ90PxJHKSEHuasFMaj5F57DPnp7IOOmxmZUdD0y
 xpDAOomktLNw+CkgYc5zTxeoGjtGChnWgjlVgANkfzm73luihsR/K8WH0
 Nv5I+FLBPTwq7RUJa5wNDUc8RuCMtrE9rNu8GPoUOr4Y/+FA/ArB3meIA w==;
X-CSE-ConnectionGUID: +43t/g4aSpm0nrE8ZiA3cg==
X-CSE-MsgGUID: PNWFf/gnQp6gIGHVlGVKmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53253055"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="53253055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:34:26 -0700
X-CSE-ConnectionGUID: VmsfrS4qQ/WBWU85r/yxeg==
X-CSE-MsgGUID: 1GDUsetMQsCS0KAbe/Cb+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121593052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:34:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 15:34:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 15:34:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 15:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC98W6xKISBpcTqJR/qLd0OVSnAoH5LIsBWpmmWbJkD5VdvSvX8aTmIWMwTJxlKWK+dubtZrbew6QhbYlq92Ir1mVQty9QOAaRheewMSKwch7w59/DpxiSGpCarq+p5Hg8Zw/Q8Aic8vrUpc+bkDmSu0GYnCiUUYDoyOe1vKV2qc2XwfBDHLgvvtIhRa1OGIW6qB0pwcnM+zxssUR+t5TCo4PXlO5o62iLyoF+nTiFrw0RNAx8hAw0YJbByKA0gRmYxBxVvLwVoyi44vD6DlklfKmMBXCzjWaeBqAxQlN7GRbFUme+aorM8IPLFa90ZOIhHKvWVW99O6ISSUUbC/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqyfEWiF8ExqvRW9Paa/PRypE9unRN50u7oGfZzQSYA=;
 b=vgGTIhOJZvMRfT0gMwOW5ywoKuisB/L6wz8YnnOsxfnqinvvFpbvdHmyaFyLdYqL30XtAVEEemiEg/y7keB8VTB6XNwL0Mns9IEbyk3LFXyD/DEpZ5CRZgW7nbsM4eU1cbD3EcXaJw8jf/pvqd0hqLKyotgZ3WBotKsCKg4pe9C+3Qx1hw+teqCMmQuMZTSy5LQSV7Cl2f5V3fdn9zStcsIXvj6C2U9JTte0vLgtT2secu4TWEhVw7KHLPAlMe6/ne4lgZdWmKCeK9rntVbHlpHcVsiT+DQazO8ZkeKHKzE0qt60rgyEUkMVY0BNXNldq/WK6ly+FFSX4fjJvwk7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 22:34:06 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 22:34:06 +0000
Message-ID: <8979079d-4afe-407f-ab49-85246601fea2@intel.com>
Date: Thu, 13 Mar 2025 15:34:03 -0700
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Yanteng Si <si.yanteng@linux.dev>, "Huacai
 Chen" <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>, "Serge
 Semin" <fancer.lancer@gmail.com>, Philipp Stanner <pstanner@redhat.com>
References: <20250313161422.97174-2-phasta@kernel.org>
 <20250313161422.97174-5-phasta@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250313161422.97174-5-phasta@kernel.org>
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS7PR11MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: c37951bc-920b-4f3b-bf5c-08dd627f29e7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUY5TjVHQzVBRUFPeVpmQmo0TlFJdjhDT05YWVFRTUxEUjlReVE0SktzbUdr?=
 =?utf-8?B?a0xPZ0ZWVnoyT3BiMjFsZ0hYTVZocmx2bkV0eGNqV1JuamVyYlV0Y2hac0Vr?=
 =?utf-8?B?ZVUxQi96V204Y3Yyemp5UFloUmRjeUZLYWVyS0QyWHB1YnpyeUowRGtkUnhT?=
 =?utf-8?B?S0FiYUp5bndOOFhmTVI3aVNVTzh0RU1wUEUvSDRjTnN5SGZrTmZvK3pvb1Y0?=
 =?utf-8?B?TXcvNE9YL1JSRzJIb1lKeGdUeHVGanJ5NkpuSGpkbXlIQklYTkh3bER2SlNw?=
 =?utf-8?B?YmF3MVdUbGlCaUJLRkI4L1J0Q3B1VER0ZGVQMHUrMzZVN1B5ZTZLVXVTYVQw?=
 =?utf-8?B?Um1QWWZSSnQvcHY5K1BTSmQ2OUY4dERadzNmSlB5eXFIRzdLcGJMdHBVMms3?=
 =?utf-8?B?OVRrdHNVUHA0OGJqendrU29nQkh3a2s4OHJOSGVaS29yN0FPVk1DdWV1V0V2?=
 =?utf-8?B?N1M0b3hiRUYwVkl6MEFHbzV3bkE1KzVoKzZhWCt4bkhRbzVnc3ljamZFY2FH?=
 =?utf-8?B?WUk0V2VlSXpsMG1UeDBsNjFlcTNZMU5Bb1FjZ20xdkNaakVJK2EvWjhkZ0c5?=
 =?utf-8?B?UmNPMmJCc09qY3FrT3l5QUJMSlkwYzQzVDd6OHFiUGVxTW5JTkNsQUFxeXZr?=
 =?utf-8?B?Vy9pdTQ4WFdDc0FUNWp5dXRLNVFWRWt2UWMrV2xKb2tUN0U5Uzk4d2V1NGtS?=
 =?utf-8?B?MkFodzF5QkFFZjVkM2Z0ZjVENUdtRnVONWMvaWwvU012M3FuNFR4UXFGakxa?=
 =?utf-8?B?VjhTdWoxeFl6VHAwSXdNVkwrUjZkMXV5enYxUUgybzdNYk1ZKysxaHA0WFd0?=
 =?utf-8?B?SUYvOVdyVWZTSTkvVWlUZThLU2FaOW9QZFhSSEw3K0tMSWRnVlhtV3VRVUpV?=
 =?utf-8?B?V2NMaExBWHorbTBiVjFscjRxQnhlR3gzdklzUzRFbE45RldJM3RuWEZ3MWZ1?=
 =?utf-8?B?U0IydXg5NnFqNURhQWwrSnVGQ3lHKzhSYWNLbms1aXcwQzBFelhkL3ZaR2hD?=
 =?utf-8?B?WUlCajhTSkU5OGluTjc5Y1J2aUoxMzlqcVdrVTQwVDlPc0FRZEFrT1pUT09W?=
 =?utf-8?B?dC9tZktwd255aTBzeCtiMmUvUm9NS0xGcmtrNVJYdlk1NFFjVGh1elVWMVVn?=
 =?utf-8?B?ZzZqbElRK1NZTldYeFZiVjU3L00ybFcwcVlNdUcwRFFkY1hiZHE0WkZBTy8z?=
 =?utf-8?B?SUU3SEEwS2dzZVU1Q3JSYWdFUkE0bmdsRURYdUVBNkZZVHcvdlpONVY0bktE?=
 =?utf-8?B?QXhLbSs5V3VlVGFwbElVajFjeERGNUc2WTA5Y0M1YzcwZlYvR1RuWGNlNEk0?=
 =?utf-8?B?aXNCbzlvdFVKeUdnZnprVWpYaVR1RURLcDMwdG0rd29aN0VQdmxoQllqN1Zk?=
 =?utf-8?B?dW42ZzhyRzUwMFgvdXllblhSRWVoY1F1VzNKUjJkcFFtMjBDRWhxMm5rMUZH?=
 =?utf-8?B?TW9nZkdWWEo5emZ4eHhrdng4cHBQalZEQ3ZTMDRNQ0JHM2swbVlFRCtuSXNN?=
 =?utf-8?B?amJRdHFVRTA2cFh0UDlyWmVxTVNVOUtJWEh1ZHNhdTBHa3dGMEpVaURQVDBu?=
 =?utf-8?B?KytXZjlVa29FZ1cvQWZDbXkrV1VtSi85WmJKWjFHNUthd2UyK283T1ZoZmhl?=
 =?utf-8?B?UzZDNk1DeWlLT05HQkoxYU5rZDEwR0wwb0liK0RJNWJvemxXc1ZSTG91cTdZ?=
 =?utf-8?B?bEdrK1RnTVJmeENBY2k1QjBHaExLZFFxZzdWdjYranFZZEZ0NldkSU41RTA5?=
 =?utf-8?B?cTZ4VHdKemlnYUVZeFdJdDRyS2gvcXR0YlV3Y1FsdW1DU3lEc29hVGY1Kzh0?=
 =?utf-8?B?bHg3aWNiNHdzaXZvVHpGMzZ0U2owaTREQ0xSZEN6MVNHOTVhVTM4eWlKK3Ny?=
 =?utf-8?B?SUZQUkk5dEdOcUpIYithQWVpbkYyY3dYK3ZUQXFEeTZOS3p6dGtDOEVSbW52?=
 =?utf-8?Q?TRfiYQimsl4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1Q1U0pkNEhwWTlPOEU1b0xCMEVucVgzc2lrWWpxS1NBbmNKbkJrcVl5NjVa?=
 =?utf-8?B?a3dJQUMvdjk1eHBFV3pmdkJsTnJ2NEYrVGxFditBVVdnNkI5QndmYU53aHFt?=
 =?utf-8?B?S25KZU4xUUVKb0hGUVlLcGc5RTdpVzIvVHhmWk1kazVLUkpTNEViLzlQYjVh?=
 =?utf-8?B?VHJXK3VCU3k2c3BhZGxTeFp6Nm92L1NDRWFVR2gzMUcrcHR6L3hPam11L01D?=
 =?utf-8?B?ZktKckYrVFQzcUE0MUJKU0l0NUpvc3A3M3h1Zk9mRFo5b3k0RUk1UndGL2lV?=
 =?utf-8?B?R0pBYTJIK243U3ZkbFltVWEwVDVRNzdYZG55YVVXbml0ZGxiVmpIOHRmczM2?=
 =?utf-8?B?VjhBa29xWlB5OHdGbHBmcWNmOWMrNkt6YU1FdkN2WnlEUnF1WnZDYWtKVHVP?=
 =?utf-8?B?Rm1mZFpsLzBTOUZkM0ZyemFuTU9nV1pBNWNON0ovMmU4VXpZdmJ1aE40bFhq?=
 =?utf-8?B?WlEyMEZLVll6UW5sOVlELzBjWHJSRE5xZlFrWXc3OUE1SVNORzJ5VDJxNStj?=
 =?utf-8?B?QkdyajE0blBCNDlialdZOENnck5PNkVoTEZuOHVNQzlOZFMyQTJDaW4zbmV3?=
 =?utf-8?B?QlBtVHJ3S2VzbFN6SW1YRUhMNmhMS3d3ZHZCRVllU1FUaG9jTGpkYkkzbGJF?=
 =?utf-8?B?N0owdWtmRWRKVVZONTBRcjRMQlNIditBZXZnU3E1ZTBUTVFuL014R25PcGMr?=
 =?utf-8?B?bUJTa3lTSXM5UXRrV0tDOXFXOHBLS0U3dzVxYXplR054a1JFQXpYaW9zN1hW?=
 =?utf-8?B?UFpqeDRqUnVJYzJOM2JhS25yNGx0UlJiUXVObnZZQWZ4UUdmVGpIOFVWdzh5?=
 =?utf-8?B?YkE4d3VYalFaeUJpMmpZc0pWczR6cVFVNC8reGEzL3BwRWJVNUR3akFkS1hi?=
 =?utf-8?B?OVUzNVhEaXZERUI4UUMyT3lSMmZCQklwMWlZem5YcXQ1eitMbVdvZTdvLzVB?=
 =?utf-8?B?QWxQZXlaWi95YWkzeXhRQmhmaXBiWGYyNzVlbWloekI3dERSYUVnV2l5bVJw?=
 =?utf-8?B?S3NQRDIrNk55RVFHVHZ5N25EVnNCWTd5b2s3Y2E1dUdpNE0zYkpmYVJMNEEz?=
 =?utf-8?B?OVM0YmplWEJvVUZ3UmEyWFhPWmRUcnNnWnZQd0ZDRk5yNmMrVXUzQ0RWSldT?=
 =?utf-8?B?djA5bnpFTDVOTzJhVjlhbGRvOXpqV2ZEQUYzck5aVTFOQlZLdnA1TjFTZjlX?=
 =?utf-8?B?RWxVb1MwWCtjY1BOZ3BJODltUUNzS0pjU2Z3K3dtTmlleTZjVUUveG5SbC95?=
 =?utf-8?B?WVBrbkNqQ1pud3FrVk4zMWhtSmhlVzBKbzJ6aXQrVGpCeTNiaWNPOVVIUWtT?=
 =?utf-8?B?UEJHamJvdXQrUWdRUzF3QUxMcXA4aEY2dEtLUG5VODB5UXA5N3pDb3A5WENU?=
 =?utf-8?B?elBmdlhuNURpR1hsdVhPb0hTVm1IRjV1YWRSbVVuVTBjUGxCMENvUmc3bGdk?=
 =?utf-8?B?eTI1aGliN3pieG1GSkJKbnpXMzlhcjZJNjdkOWVTTWNQczlnTVF3SVRwQy9N?=
 =?utf-8?B?cGFtOHJHakRpMGg3VEhmU1Vab1Q3V0owQ05DbkN6MGJHY3hpRXhMS2t6VWl4?=
 =?utf-8?B?aFhweVNLOVdoRGtrVVZXWHBiY1pMLzFNM2RZMFZRTG05c3NwYldOaVJxTWlp?=
 =?utf-8?B?RVFJak1PSW52ZEQwZmNiZWh0NTVaODZuQU1JOU15TFMrWVArN3hta0VKRWsx?=
 =?utf-8?B?dVUxU04xMVdNSjQrYzVxcTN1RHZTMm9EaEJFMEpydXo2YlRVREMzWTBWYVR6?=
 =?utf-8?B?akw2OTlYVU14S3JtNEpoYVdFOUxxOUhaREkwRmdsVVdzSUN2cTV3QWFsbFBy?=
 =?utf-8?B?UWxqYURCRUNnODhPeVJTaXM3YjVSUnRPV1Z6NGRNeFF1eVdmU2pqQkI5K0c0?=
 =?utf-8?B?RUdOVmRTYUNrMVFiTlQyU3ZPVVhxbzR5MGlhVkRKbWlmNHZHS0oydWVJSzFB?=
 =?utf-8?B?RlJZTVN4RFpKdzIrd0lmK095Um9Bc05mT0hnTFlRakVCT0RXVUFsMzF5SkUv?=
 =?utf-8?B?TWFKR2ZoQlplUnYwRkh5N0h4RkE4bVhpTmQ4Qm5oQ1hVQk5ZZE9iSEpLTkhp?=
 =?utf-8?B?MHpRcGZVL0JMTElkY0FHSlVIMmJKSWgvK3kxelFtNzk0ditCbTN0UG9tSnA3?=
 =?utf-8?B?WTB6cEZIU2pDWDlQVmJDQjVrOGRtVHUvU1NXdW9SWG50OERqc3VFZ0Jjd01p?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c37951bc-920b-4f3b-bf5c-08dd627f29e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 22:34:06.0955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+LZuRcnRBM8sYDRkiOayN4YX8ZUWjrXKyn9FhEFt++b8mrchmPCRscvmbCc6i8sLdralEvb46NXKHmZ8lk+Uyu2hcMJJ2h2UumAfrtALGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry
 Chen <chenx97@aosc.io>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] stmmac: Replace deprecated
	PCI functions
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



On 3/13/2025 9:14 AM, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The PCI functions
>   - pcim_iomap_regions() and
>   - pcim_iomap_table()
> have been deprecated.
> 
> Replace them with their successor function, pcim_iomap_region().
> 
> Make variable declaration order at closeby places comply with reverse
> christmas tree order.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Tested-by: Henry Chen <chenx97@aosc.io>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
