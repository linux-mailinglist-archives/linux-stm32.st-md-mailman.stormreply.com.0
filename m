Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F904A06EED
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 08:19:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB693C78F67;
	Thu,  9 Jan 2025 07:19:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C1A8C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736407180; x=1767943180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k6s7blhLaUfC+O5ahIz8LO/JFcw1Wi+UBmoRM1ujZlA=;
 b=iR4IQdyifuUvuCyKfuZuRaklcQfq8JHUZqRRlQNbkLiupGxbQ0kH3Lx7
 KnmN8EnwAd+NFmfezPxZDl7xhjp8FXdBLnviIBLlHYE8vPh57B8EuUH+1
 /uC123HWk69JIGGultbFo/VqaGD5NLnvHuM+XqR5AiXc0vnX6K5lw5zfz
 eFjDJrw+oEh/T3fkPf9DzupOgnqlgTINUe+s2JYsiMC0OspE+GLzUQ8BR
 vKHJOChv1fsmYh5UxyrkrqBEfNRrjmaPAVgqBldsZfOLJrgqpE1aDXhL3
 5sxdbRDcFcW7wC+pFoA3gN3BGjOKhktGhUthmqf0mYt2gYQ5otejtnRX4 w==;
X-CSE-ConnectionGUID: UH5bjNuuTsmjyoUNlxPD5w==
X-CSE-MsgGUID: r33PyUZ4Sg+yz2QyQW12QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47321513"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="47321513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 23:19:32 -0800
X-CSE-ConnectionGUID: LJtmf1qdQy+UaMxFa5YnMw==
X-CSE-MsgGUID: 5RapiDxFT4SdcOaTqlqdkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107365822"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 23:19:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 23:19:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 23:19:29 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 23:19:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUzmi5jrOlK9xkJwam7Mns8llJrDXm7rD9PNPAo+l/gANNCYxOf0cvznNgio5Ml+7ABU9j8xeJvBqyMmZw/NmqKv4BYhqH4xxpekOENQ34/t995ZNf9q5OBhQmzzoli3k6TbkvFNmokey/fwMg9Rvi4AGKJxdsap7I58bJvsVu8Bwp04+G91faLWguV6V24A1y3229nEvhLFLwagHMJyF0byhZk0QY7TuiQXNmeWcjzd5xuetn4g1ri+psAKFuhWqNmLqZIVIQVIJ8Uc2D8E20MvQTbJYhLQFtYCza9inMt4IlLxSYcm33+tv3SXzISAWfs1knR5px+861h8FKzM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6s7blhLaUfC+O5ahIz8LO/JFcw1Wi+UBmoRM1ujZlA=;
 b=qkK7N7ussb+mpECj8vrShguhYRMPEBlsr7OpVqbCSQi52vF9RZQ81dw5kuUHq8uXSTglsGADrcTNnQK+xZ6HLv6UKIU1sMumVG8A2dAdVh5jB9+Jox+WYHmP83Jb7GLKKDRNBYJfcN1DNXypz8TMnfX+y9VknHxNA6FiLav+sClWSwxwp45GDe6AIZZYbsuubWUfx8afrlSrJoelub/wNcS0wOVk8IESkeZ8ENWhQEf+7NzFqW/mftsOXA6r59FBTJkgfvxZpR7CJNR67pqFO31pBu7XL9msWtkFqiGi9xvFeKLcxRAmyl2A5mbOeIekvxkSHBIXS7EwVj4UHp/T9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 07:19:26 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:19:26 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Thread-Topic: [PATCH bpf-next v4 1/4] xsk: Add launch time hardware offload
 support to XDP Tx metadata
Thread-Index: AQHbYELJmBa3r24x8EG4EXd8V3eakLMLh+iAgAKCPJA=
Date: Thu, 9 Jan 2025 07:19:26 +0000
Message-ID: <PH0PR11MB5830D33B679A0ACD3FD6E23CD8132@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20250106135606.9704-1-yoong.siang.song@intel.com>
 <Z31bQ6xEkyQvbutN@mini-arch>
In-Reply-To: <Z31bQ6xEkyQvbutN@mini-arch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|CY8PR11MB7825:EE_
x-ms-office365-filtering-correlation-id: 8829c4d2-185e-49ad-3c83-08dd307df2fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a2M5ZVFKRUlWYldBUlZYS0FESVRKeHNKZWwzY08wUGNwSTVUMFpEc085ZVM1?=
 =?utf-8?B?TWo3YzBkVWllTmEwUUJLeTM3NHlDWldIR0lBUkw3UGt4NjJDM2ZLdzlxVEgz?=
 =?utf-8?B?anpEWWNWRXNsSUJWTE9yRnk3Tm5GL0FPZVBhNnBadjFyS1I3LzBhVnQxbG92?=
 =?utf-8?B?MXVVWDVoYS9ZcVRvMzdyWlAxRDdmN1B4VzBUb0k2USs4MjdNMTQ4NDR2UXVN?=
 =?utf-8?B?YS82Zi83WGQ0WERFV0lYclg0KzVMTXRoUCs1ZkdkN1hVSHFTNlhqc1ZBNS96?=
 =?utf-8?B?MWcrci9mWkE0OWdXc0JFMnZuenZHSTZqS1gwWnRjN2hZa3lmcmlTYlA0eXZI?=
 =?utf-8?B?aXVqR0JreTNlOXQ0LzkwR2RVMENhYVNFUDA3YVN5UDE1ekJsQkRpNFJZa3lF?=
 =?utf-8?B?aFByQ1JWMUNsdGNQYmJtNXI0dnlRY3dnOXBkWVZlb2dhNjJST3h0Qy95S3Rp?=
 =?utf-8?B?WkdVT3FOdHExZm9aYmJ4T1YyV3BtNnFYNTF4QVZVZzV0RnRncjNnazVjanA4?=
 =?utf-8?B?V0tOcHM1ZVRJSWJqUHAwK0RNMVFOS0dqdit4L2x2d2lVbzBEdXptcjdnZStY?=
 =?utf-8?B?TDllZWJhTE5Hd0hLUUE3WkpROEppbGNyV0FnTGJ0NzhBRWdzZWVqU2RaLy94?=
 =?utf-8?B?RnlDUG0veS91OHBzY3hKUXk2dzZNcmtZR3ZYaDQxQzBtMjhhenJVb1pxYUdB?=
 =?utf-8?B?ZmhHNDZhYWRCejFlSENCMzBUUVYzRXk2NEFLME9xTE5sTnJZOHlFVyt4VzRV?=
 =?utf-8?B?Z2ZjZEVUMlZqbTVlek0rWGluYzZTZmRLUW82TTYxNVN3QkF2WHEvS3VSbjJv?=
 =?utf-8?B?aXpDcHZUU0x5dlp1U2VNWnVpem5IYnoxSkg4UXl3Zi9wOGxyYUFub2RMaCtw?=
 =?utf-8?B?cUNHTkhXQUdpaVVDcUdYUUJuUC9jaHFQM3JGaTJURkNYOFBEaXY4NE1Mb1BH?=
 =?utf-8?B?bTl6ellWV2NvdEx0RDdzRHdLcTBnM2N0U1Uva2N5RVNSVFZBRFYrMWEzRTNj?=
 =?utf-8?B?ZmJQcC81NUFEOWd5YjZabEl1eFFvSjJQTGJ0U3I4a2Q3eW8yNzY1WThDR1Vo?=
 =?utf-8?B?eVFNcEF5WEovRTVFVURDaVFPUUlrOXVLZFBEYkJjTWkyM1R2SzFVTVp6WmxS?=
 =?utf-8?B?YU1LVExrYmZyREM0TkRMTXRZRVBSOEhHeWtHWUNnNE0vWHc0R29YNGYrTEF6?=
 =?utf-8?B?dW9nWlFRZTUvS0tuZm9OVGNKNUVKemRyZXUyNkphNFdQTzhEdEZ0NCttejRK?=
 =?utf-8?B?T0JXdHhVUU5adTBvMm1HM2N0UTY1cytMWUV3UG1jZXVMTTZsdkJFVlo5N3lL?=
 =?utf-8?B?RHYySXdteng1bXhKWTRlcG9GbnV0dmVlTUlnbEJNaEdDUXpDbzIxNGZOV0xG?=
 =?utf-8?B?L0NoQmJHeVJPUTl5Y250WVpReGEzWjlrQWIwNlNTVmpxQ2d1MDdoL041QjVz?=
 =?utf-8?B?QU9WbkhPd2dGRGtZdHZxRWZ1V2REZjc2dG0wRjYrcXNUTFM2c0h3OWJBUVho?=
 =?utf-8?B?SW9GSDU5ZU5weHppNE52SzNka29IaFNKS1phWFB1MTJMRU8rWithbHM4NVFQ?=
 =?utf-8?B?RjZjNGIrZWVvUnVBUWVLdndrTHBIOVRhUnBUZjh0eDVoOFRxSUFhM0Y3Tmlr?=
 =?utf-8?B?TTFpSEFNbm5JRG5HSDBsUDhFbHhTZXpNVnlYN0JFN0p0RG1wOU1kTEEyU29B?=
 =?utf-8?B?bWZyWXQ5S0RNSVgxcEJVMzNGb2JiaWNId2M0UlJaY2dOWkpUWEZtODl4RkFt?=
 =?utf-8?B?YlQyV1dWcXliVWxJc1o0eWxmK0ZTTW1OZ2xkYk0wb01pMzNCaXd3WVlLNUdC?=
 =?utf-8?B?cGM2NHRwTHZmZHlPTVdDUHVmOFl6NytZd1JBdmJtUmtsTVBTVlZ0RENZdzdK?=
 =?utf-8?B?RlNnNXo1WXpXMTQ3SFA3aFRzMFZYNkFoaWh5RnNaeFRvS1NGSmpoNmM0enJQ?=
 =?utf-8?Q?mN4Ek9ApT6a6bmiGXf3Pv7UZE6sCw7dy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0pCdzNxWmx4TnBDQ242VG5qa0hoRk1mUVhJZ1lGMTQ5K0E2ZUZoVG82MGFu?=
 =?utf-8?B?dWxIRVhRVTNIRXVFQ1RMSHFTTmtmdlVCUEx0ZCtmbzV0eXRGUlB1d25PdjhC?=
 =?utf-8?B?d21KcWl0dTNtTklZS0tuczdMcGFkMHRwYnNLYXBVQWJGcE05bm1aWG1tZVAz?=
 =?utf-8?B?anFWbk9QN1JOalI2MElrOWkrbWtzRXBQMm9QU3d4QkVxNkJyeVdTSHpnZUN0?=
 =?utf-8?B?YmVTbGtnQm1jS210Q2ljM3lXTkpLMzVVczQ4KzJWaGpzUW9HSFdsQk0vT2dq?=
 =?utf-8?B?N0E3UCszTnVtZ1VuSVVpOGZHRkxTbllTblJhdENDMFlKNVVBV1piRllmaFpm?=
 =?utf-8?B?aGc4OTk5QytQRWh3T2RTcVJqUUplbjNQQ0k1c2MzZ21UMzBhMUE1cTdqNVBj?=
 =?utf-8?B?L1RpQjFYV0Q1endTK0dnMmFodnRWbmthZ3ZYZG44MUhIUEZ5bTMwRXcyeTly?=
 =?utf-8?B?N3FuTWlvT3ZITUZhY1d4a0pSRGdxUjhOTFM2QU5vdnBwei9aOXpVNWFLOEV2?=
 =?utf-8?B?OUxsZUxrbE9YMmJ4TUljYVBNN0Z5ZnNmcVluQ0VUU21RMUtUS1RFVDZhSmJI?=
 =?utf-8?B?OTRGeFBuczExZG5tS2VXNmdIMGVodnhGa2pXRkpZMVNhMDlBUkt2Wnd6MnlT?=
 =?utf-8?B?Wlh2aTB5clRRMTVOYlUvdTZVNzRLUTJpMG8zaEVPNFgwOUlJaGxDcVhUNEFx?=
 =?utf-8?B?aHhZcVpSVVk1Uk1sNC9reENTNTFBK3hsUWE4SnVaK3YzRWhWR1RrNVkwemRt?=
 =?utf-8?B?NlNQRlA5cngyZ0dONzdBYlJJNWdpS0hGUDRNeTFUZlM2cFgzVVg5eldBQjlO?=
 =?utf-8?B?elFFN1ZUY0VOZDc3K3laL3RLOUZxakVKSUkvUUEwZ3o0amo4eUE3OEJ5Nm05?=
 =?utf-8?B?Y1pwa1dFTlhUR1VCdTdsWUtyNXZPZVVwdUxKald6eW5yajNCbzd6UW9uTUQy?=
 =?utf-8?B?Nzhldm1nUnpYbHdlWnJYY2UwYTBJZ2JGRDNZcVltY01ONmNrbzlwa3Y0S25G?=
 =?utf-8?B?bm00OUJSZERHN290UU9DWGR3ZHh5QmRBQlV6bGpiczJYOUZwWERhS1ZRbUN5?=
 =?utf-8?B?RGgrZkoyRUpIWEJxVzNPQUxsZ1hEanRTZC9Jd2JyQVR0K0g4L2ZFVUlGWVJr?=
 =?utf-8?B?K01qYlhueFdySXZwQWw3by9RbTZ4SUE5RkNqZnpnR3R0NWxYbTJKdmsyeHdw?=
 =?utf-8?B?M0xFUWFTVnB6U3B3VFJUckVQMS8xR0lhS1VONFJtMm0xeDRRZFBrZmRQenMy?=
 =?utf-8?B?bjJEUW5haFlaYmVjU3UzY0FnTEFIQUtCL0dPcTRkVGo2WnJGRlIway9xZU1a?=
 =?utf-8?B?NC8rVk5FVjZLTlJLUzgweU9FL2V2TFdpZmp6Nys4V3JmZE1xN21uQzNBNWdT?=
 =?utf-8?B?WHhiL0NJR0dVMWdmdzMxTTBmekV1elovWVlXME1VWk1WMStvelcveXZ6em1t?=
 =?utf-8?B?WDc3Q2R4TjFkZzFRc0RSQWQ3YU9LdUhpVjdSMHZ0UXpXMUpneWxjNVM3Vmph?=
 =?utf-8?B?a3Vuem00TlI3eVk5TWkramk3d2wwdkdlVk9NK05ldnBhL0R0azY4QVo4K09I?=
 =?utf-8?B?Z1FlVXg5dDlwWEQxelRRZ1NyaDc2NTRtaXpGTWZmdStJVzhpZ3RQOEpkWEQ3?=
 =?utf-8?B?V0lPUENJdk5CNFNLYUpPUG10Nmh6MjVOeDlpeFUyMnRzTGVXYW1DQjhFd3Zp?=
 =?utf-8?B?M0lWenRSUVNmOHEzUHQ5QXRVZ3BDRTNUNjJXTU9nYWc5VEx3Sm5KaFNsWWdC?=
 =?utf-8?B?bjlUSDJGTkVaem9FQVZUYmxEMlQ2eW9taVY4YVJ3aUlBSHQ1S3g2Q2NTZXBO?=
 =?utf-8?B?QmpQRmUrUEw5WFFVdVBDME9wMkY5WnorZTVsYXBuTE9GbE9uTHFOVnNvY2pH?=
 =?utf-8?B?d204RmthSkFuOW1JbEV0ZWhhbWhwNGwyM0R3UE10UGFXMmoweXVUaVFpRmg0?=
 =?utf-8?B?QTZGOE5TTGxkVEJiNURBWUduTU1WN3c3N0t2U3BYSUlVSUFoT0RtQUcrOTl5?=
 =?utf-8?B?Q2l3b1FObFk0ZHZYVTBLTDZjdzhDaGxWWXNMN2RnZW0zcXdkaFJFZWZkVGg4?=
 =?utf-8?B?RlRaQjgyMUcyK2wybGRpNW1mSnBFQyt5Zy9mQ01ETlE1eHdVNXFRS1BKdW9j?=
 =?utf-8?B?bmhtRllabUhIT25waFdrcEl3N21IQUxMMUFwUXZQeEE0bUlEUk9wYnJQdjVx?=
 =?utf-8?B?bWc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8829c4d2-185e-49ad-3c83-08dd307df2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 07:19:26.1829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqDDKLEgqxKWg6J0dBoSivwmTPRNK7+e0Mco1Bz9ssAiWUye0AF6vD+6U4yYLI9Tnl2oNJEUsQBQnyr/92/HdIme+32SyT0LilEcKmdIS7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
X-OriginatorOrg: intel.com
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "Bezdeka,
 Florian" <florian.bezdeka@siemens.com>, "Damato, Joe" <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, Daniel
 Jurgens <danielj@nvidia.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Eduard Zingerman <eddyz87@gmail.com>,
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bjorn Topel <bjorn@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 1/4] xsk: Add launch time
 hardware offload support to XDP Tx metadata
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

On Wednesday, January 8, 2025 12:50 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
>On 01/06, Song Yoong Siang wrote:
>> Extend the XDP Tx metadata framework so that user can requests launch time
>> hardware offload, where the Ethernet device will schedule the packet for
>> transmission at a pre-determined time called launch time. The value of
>> launch time is communicated from user space to Ethernet driver via
>> launch_time field of struct xsk_tx_metadata.
>>
>> Suggested-by: Stanislav Fomichev <sdf@google.com>

Hi Stanislav Fomichev,

Thanks for your review comments.
I notice that you have two emails:
sdf@google.com & stfomichev@gmail.com

Which one I should use in the suggested-by tag?

>> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
>> ---
>>  Documentation/netlink/specs/netdev.yaml      |  4 ++
>>  Documentation/networking/xsk-tx-metadata.rst | 64 ++++++++++++++++++++
>>  include/net/xdp_sock.h                       | 10 +++
>>  include/net/xdp_sock_drv.h                   |  1 +
>>  include/uapi/linux/if_xdp.h                  | 10 +++
>>  include/uapi/linux/netdev.h                  |  3 +
>>  net/core/netdev-genl.c                       |  2 +
>>  net/xdp/xsk.c                                |  3 +
>>  tools/include/uapi/linux/if_xdp.h            | 10 +++
>>  tools/include/uapi/linux/netdev.h            |  3 +
>>  10 files changed, 110 insertions(+)
>>
>> diff --git a/Documentation/netlink/specs/netdev.yaml
>b/Documentation/netlink/specs/netdev.yaml
>> index cbb544bd6c84..e59c8a14f7d1 100644
>> --- a/Documentation/netlink/specs/netdev.yaml
>> +++ b/Documentation/netlink/specs/netdev.yaml
>> @@ -70,6 +70,10 @@ definitions:
>>          name: tx-checksum
>>          doc:
>>            L3 checksum HW offload is supported by the driver.
>> +      -
>> +        name: tx-launch-time
>> +        doc:
>> +          Launch time HW offload is supported by the driver.
>>    -
>>      name: queue-type
>>      type: enum
>> diff --git a/Documentation/networking/xsk-tx-metadata.rst
>b/Documentation/networking/xsk-tx-metadata.rst
>> index e76b0cfc32f7..3cec089747ce 100644
>> --- a/Documentation/networking/xsk-tx-metadata.rst
>> +++ b/Documentation/networking/xsk-tx-metadata.rst
>> @@ -50,6 +50,10 @@ The flags field enables the particular offload:
>>    checksum. ``csum_start`` specifies byte offset of where the checksumming
>>    should start and ``csum_offset`` specifies byte offset where the
>>    device should store the computed checksum.
>> +- ``XDP_TXMD_FLAGS_LAUNCH_TIME``: requests the device to schedule the
>> +  packet for transmission at a pre-determined time called launch time. The
>> +  value of launch time is indicated by ``launch_time`` field of
>> +  ``union xsk_tx_metadata``.
>>
>>  Besides the flags above, in order to trigger the offloads, the first
>>  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
>> @@ -65,6 +69,65 @@ In this case, when running in ``XDK_COPY`` mode, the TX
>checksum
>>  is calculated on the CPU. Do not enable this option in production because
>>  it will negatively affect performance.
>>
>> +Launch Time
>> +===========
>> +
>> +The value of the requested launch time should be based on the device's PTP
>> +Hardware Clock (PHC) to ensure accuracy. AF_XDP takes a different data path
>> +compared to the ETF queuing discipline, which organizes packets and delays
>> +their transmission. Instead, AF_XDP immediately hands off the packets to
>> +the device driver without rearranging their order or holding them prior to
>> +transmission. In scenarios where the launch time offload feature is
>> +disabled, the device driver is expected to disregard the launch time
>> +request. For correct interpretation and meaningful operation, the launch
>> +time should never be set to a value larger than the farthest programmable
>> +time in the future (the horizon). Different devices have different hardware
>> +limitations on the launch time offload feature.
>> +
>> +stmmac driver
>> +-------------
>> +
>> +For stmmac, TSO and launch time (TBS) features are mutually exclusive for
>> +each individual Tx Queue. By default, the driver configures Tx Queue 0 to
>> +support TSO and the rest of the Tx Queues to support TBS. The launch time
>> +hardware offload feature can be enabled or disabled by using the tc-etf
>> +command to call the driver's ndo_setup_tc() callback.
>> +
>> +The value of the launch time that is programmed in the Enhanced Normal
>> +Transmit Descriptors is a 32-bit value, where the most significant 8 bits
>> +represent the time in seconds and the remaining 24 bits represent the time
>> +in 256 ns increments. The programmed launch time is compared against the
>> +PTP time (bits[39:8]) and rolls over after 256 seconds. Therefore, the
>> +horizon of the launch time for dwmac4 and dwxlgmac2 is 128 seconds in the
>> +future.
>> +
>> +The stmmac driver maintains FIFO behavior and does not perform packet
>> +reordering. This means that a packet with a launch time request will block
>> +other packets in the same Tx Queue until it is transmitted.
>> +
>> +igc driver
>> +----------
>> +
>> +For igc, all four Tx Queues support the launch time feature. The launch
>> +time hardware offload feature can be enabled or disabled by using the
>> +tc-etf command to call the driver's ndo_setup_tc() callback. When entering
>> +TSN mode, the igc driver will reset the device and create a default Qbv
>> +schedule with a 1-second cycle time, with all Tx Queues open at all times.
>> +
>> +The value of the launch time that is programmed in the Advanced Transmit
>> +Context Descriptor is a relative offset to the starting time of the Qbv
>> +transmission window of the queue. The Frst flag of the descriptor can be
>> +set to schedule the packet for the next Qbv cycle. Therefore, the horizon
>> +of the launch time for i225 and i226 is the ending time of the next cycle
>> +of the Qbv transmission window of the queue. For example, when the Qbv
>> +cycle time is set to 1 second, the horizon of the launch time ranges
>> +from 1 second to 2 seconds, depending on where the Qbv cycle is currently
>> +running.
>> +
>> +The igc driver maintains FIFO behavior and does not perform packet
>> +reordering. This means that a packet with a launch time request will block
>> +other packets in the same Tx Queue until it is transmitted.
>
>Since two devices we initially support are using FIFO mode, should we more
>explicitly target this case? Maybe even call netdev features
>tx-launch-time-fifo? In the future, if/when we get support timing-wheel-like
>queues, we can export another tx-launch-time-wheel?
>
>It seems important for the userspace to know which mode it's running.
>In a fifo mode, it might make sense to allocate separate queues
>for scheduling things far into the future/etc.

You are right, user should isolate one queue for scheduling things
far into future and use other queue for normal traffic.

>
>Thoughts? No code changes required, just more explicitly state the
>expectations.

Agree with you, let me change the name from tx-launch-time to
tx-launch-time-fifo to explicitly state the fifo behavior.  

Thanks & Regards
Siang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
