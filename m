Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +QSoK3ghM2o/9wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 00:36:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1E69CB06
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 00:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=XJvOgkfu;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC91C8F291;
	Wed, 17 Jun 2026 22:36:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6428DC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 22:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781735799; x=1813271799;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5+iGSe9iWmkYihC4wjdGVswVCSTzqsEk+7tJCH38iXI=;
 b=XJvOgkfu34QJpGyiqNVrc5uwgye5qSbhDCH7QQauraDlWscmSTp1w1pr
 eJZP2OarqlkfYOIABgnJDttyJCMi7TMLrf6/ZFQ2ObiA1xM6QK5gOJa1h
 mF7KFvWtQdyR6KGSJz+rFT0awY3Mr8gvLC+9ACBVeb2XmiSsAFqhCMDBC
 OulZsXigt6glKMEKMYrPL2E03v3DYkJy8yTdL4mNriHcksojvK1Nv73dF
 B9REMzDW0hRVg0hBE6/AhmY+2OJt/li9SDu+3M50MqN4ID6LTrQ099Hq2
 +sslQnG6zyMpQA2KhY/F6AgdpcUFtlP41lGfQxmdrlFiUrTMJw3E2WQkS A==;
X-CSE-ConnectionGUID: BqD6fBJvTcSgPl/vVTQnvw==
X-CSE-MsgGUID: aIUMidT7SgqJGHTIwqgupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86399455"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86399455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 15:36:36 -0700
X-CSE-ConnectionGUID: tnRdIhfqTMOkIKUM+mRbVQ==
X-CSE-MsgGUID: hPuj61biTyOFtvSyF0IY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="250080679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 15:36:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 15:36:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 15:36:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 15:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di6mBd8ssB//WRj9GlgUT55dzO2TNxoYQ7d+QphEeo/7nMrFluq656c4WX5l9DsBiBzzcW15dMTHgTdptQeKr9uzJokllWL28pjh8gPouZCeijWqgBpe+uqsiR8QZp5rdJ0BkdPt7E8pwyHCU+IiXfegtQBiQI8zzi34VvD16LNBtuoCLpL0NBANqyeaKhJSIgtBSYxfIhFAW/uofNb6aU84/dW3Fj+YJflu322vXPsvCneXviuyz9XqGAGSebmD+2Wi5bYR4TT/ImZg26yOqo3FVsarYiNrcUGEvT+nqz0mZboWlWrv1+ZzS92LPevGeAzoBLcRJ0/92GEAaaHb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJhWhvZhcNBIulZ+zg+Vdx8iSYl6FqaJTLG0SfEWu5c=;
 b=hOD96P4pmUiLwtfExAYIVtBBlBqrXOQDm3lkEUW5sfFsFvdSxSAURrLE5DSUs/4nvYZ38uszh07wj2mBzSutaTDjBBYU0OiVxSbrL5l8O/TUSTVxk5MNMZ68kTeuO2mU8FuAnP/lvZIrmIQOOYmheIgHeexDPoyopwvu2M592VMWAq6jUvhaEQGj7IELiaen3qcaHDDCHGRu0bNFsacBN5AcLHweN7TJcEpBfN5bE6Jp2hX6SZU36gJn1i8D/NbKML9+dSUitOvj+ImLgE/0yZ6CKtO7+s2o3kjWYSyrJqfu7jIaJL3DFo9h4ZR3BvcwaRrxiRkD/0lsMQJQ1174PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 22:36:32 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 22:36:32 +0000
Message-ID: <57c31dc1-39e2-4977-9331-5eed20d676fa@intel.com>
Date: Wed, 17 Jun 2026 15:36:30 -0700
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
 <31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
 <20260617135407.6ff54e27@kernel.org>
 <6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
 <20260617150744.05756f0b@kernel.org>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260617150744.05756f0b@kernel.org>
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 432e86e1-00e0-415b-1bb2-08deccc0e184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pxMg4vF1h498QdAqGCeJfj0RoJSDDPM9UH7I2MsZn4KNTJJ2OcHTFk8zUn1nhyvfzhNEJcIjGr+/xe2xN7iCyBEGDPNUt/qsK9C+MOq9DiGzAJ1fMG1K0okXlgsod3ejZxeAmmR4mUEPpX7vK7lmmTVEvVxTL0z56GMcSRAu6VMVtbPJrnExRGHu9v/9rVbrZaV4J4OlpXRP5uCPYko4MdyoVJtw0RhBNwr1qEuOhoJ4B7fitQf9y58L1B4In36gZDiSj7hdgYLYheajkTnhYNN/G6cJV0TcOwgm3qp3NmElF1giucAlNRmLNSjrXdMP4Pa1OimuSYavM5aihbK1V/jw83TsCt4Klyt7an6lahLUZjeegNtgJavea4DFU62RW7SKYDXocRCXrPMzjrk/9mBxfcalh2P5D3BpBgIt1uVGUZKy+iHYA5GB/pPgoOLWG/pMt9O9GMQvnBh2yhw4seMiduoR/2c/k2k7cHXyx64KNjPVIr98pDWfsakcUiOUXMweN1iy1W0hBNdVK/UPeNsjKHtyKSCdiLr3JF2ip8NkFgPRQsJfRjCe6hSg+AXL410hy6CAXVRPOyzQE7DtEwNchZHPuTcoXu+WZ2UNdenjR7Y+dEU6lJXeuenZ5QbrUcnWHBqJQJFHjpgP5DCNc/M/iBU5U9tX28aZLEIld1HrkxT/cZlsrDaiTvli+9xQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7381.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNmdzFpQ29aMjNTYmIxMHRzNUtHZXRXZEdqZU41TW5DZ1VqWTFPNWxPUjIy?=
 =?utf-8?B?ZWhUZlk4UzBNSzJvQWtmNEUvNTYxVW44SjNFUmIwWkZ2SVJjUENmWHpLMnFz?=
 =?utf-8?B?MDRYald2NXJZUDB0dE80KzVHb0VEcGFzMTlxajJvREZvam5nQ2tIdE0vMGE2?=
 =?utf-8?B?c0FVWHo2a2Z1d28vMHBXejlNY0lFY2MrVTBXTEJpR2M0clJ0SkgrempNMGd6?=
 =?utf-8?B?V1g1enFESkZwdGRlUEhpQ24yWEloTysrM1NESDVpTzRmRkFZY2dqTmJCSENG?=
 =?utf-8?B?NzRNS2tTOXJreXpZT0NvSG1VcU9DR3p1ZytZMnRqMlRWcFNiYzhZN0E1bHov?=
 =?utf-8?B?MDZyNEttV1hlYlh5Rk1tNzRpWStxYnR6VnI3L2RFdTJxU3FXMmxrNnAyK1c5?=
 =?utf-8?B?WVZURmg1cFRrSTdwakNJVzB5ZHluWkRMQUxHZlN2UkcvL0ZVOUgwbE5kM2lY?=
 =?utf-8?B?S0t4bmRPQ0Z6a29Rd0wyNVMwTkRMcDI5K2FoUVc4djExM3cwSDU4Nk9TdjFS?=
 =?utf-8?B?RVZPSUt5ajBkcVF3ck9zZ3RveTJrSDVQOEZjdkVoMmUzRklUclJrWUxRQmgr?=
 =?utf-8?B?dTkwWGVWMGp2NVRPVmN5STJIZFVQUWFoQ3k5K2Vka0Q0TTVkRTRWY25pbTBu?=
 =?utf-8?B?OEtUWitlTUVTRHlBbW1GbUd0Tmwyc2ozY0Y1MllwWUdMNkFCUW5ZQnRzc2Q5?=
 =?utf-8?B?NWtsbFlSdUZrMFdFTGdzQUlPZEFqNVoxZEVueVhET3l4VG1yYWkvYldqYjBP?=
 =?utf-8?B?M0hmNU1qK2ZNZlpaUWUvM0plaTlHSE1zb2tDeEdxem5OQnFSeEJyWWowZEEy?=
 =?utf-8?B?WitiSjFIbXFkaERTellpNDUveC9ac1lVWVpoSnR5bld5a3lLUHgrczJTUzU2?=
 =?utf-8?B?RmVPUmFlWUdmRFBFYnE4ekZxYmJaVXBuNElqZEg5NWxhUFNuWlo5TEx6VUJt?=
 =?utf-8?B?YVFKZUZod2diSkFDS0M4eG1uWEtLVkwyOEVvSlBVZDl4UjdtLzMyakgzSXhr?=
 =?utf-8?B?TVVMNzJ2QmJZQkI2S2J4NnZlckcyeDNZNG96UXFac3ZlWklaeU9zZ1hYTndH?=
 =?utf-8?B?ZWZqcHEyZkkyYU96QkdlUlVQL1hGa1pjWjlDOFJNT2szK0IwbWp3eTE5ZkFO?=
 =?utf-8?B?cVkrZG5EUEF2UVR1a2pndTlTYlpYOFVvN1p3SkpheGJMV3JzNWxnN1BTd3lt?=
 =?utf-8?B?KzRlU2pJMFI1WEVzL3AvUWNhSmtob0h3V29wbElMUHN1Ui9JQWswdHBhaUd3?=
 =?utf-8?B?TlFpVHkwc0VqVFBNb0JkOWJpMkZlY1pHd1JmK25nTkZQUEk2V1g3Y3NjUHls?=
 =?utf-8?B?T3lvN1k0aHErcUFQd2hrRTQwQVRpYU9ib2FjZFoydjd3SXlPUlV2cmwzTW1t?=
 =?utf-8?B?MmdTSmlia0dsWTNnNS9pc3NldlZzelpvNi8yREdVcDJkS0g3QlM1REM5SkFX?=
 =?utf-8?B?NGxjeG05aTVPQzVWM2RnZ3NCNlBkOXlTdEdwcElsWEUrN0tnSjN0bXg1OUI1?=
 =?utf-8?B?bGM4aXIyeUFvWjlncGJDQ01XMlNhVHlacWxIYjZNYVBkMEpSQ25qTFVCRTZp?=
 =?utf-8?B?UDIrMnVDYlB6Q1lTTjBFN1V5V0sxcXZoRE9HUHNJMmF2OUxQSlUybGF0Rmxu?=
 =?utf-8?B?WHQ5RDdra0E3eThFT05qVVVjZUFPZnl3T0pRc1U2MSszc21zTDVLc3ZTSHZS?=
 =?utf-8?B?OEtJNXNRc21CU0xmbVBTbmxoNWxJME5RN004ZnBWRUpnTCtPQ1pwQ09aK2x0?=
 =?utf-8?B?cjM3VWJFQlFNZHJ1c0tremV6Zkl6ZHg4eXdXSUF4MWdkUjR4T1ZSQnhTWkE1?=
 =?utf-8?B?dUEvZmNQSVQzVDZRVjArZXM3WTlGQXlBUnR2bVdmVDM4Unk2L3ZhMVVqTlNq?=
 =?utf-8?B?b1R1WEltSDR6R3FiVzhmYmJoNVdkMlFmOHpxQ0dEdmE0V2Rzbms0MUZtODVu?=
 =?utf-8?B?MHpqM0RhTE1OeVZHek9LbGFYSnhwdExTbjNrb09JbWIxdlJIYnFQa1R5WmQw?=
 =?utf-8?B?Y1h1Zk9uSFpQVWlmUjhubVNkWFNyM0NBM1JTZUl3UEdENFBQeC8xS1JPK3lN?=
 =?utf-8?B?VnRvaUZkakFVS3pUZCtuWUo2ZEp0cmMzd0Rxd25hUmd4SVZ1aFkvK2pvU3BV?=
 =?utf-8?B?aUF6bWw1S1JhdGxOVUZwYlZFb0VOL0lrNG4wQ3V2cnJEVWhDdW5pNFc1VlhF?=
 =?utf-8?B?NlhDbjdsc0NvWCtBcGNVVWxwTnd5NHpqZTdKVERJTDN6MUtPc25FT0xPY0Qv?=
 =?utf-8?B?S1p5WmYyLzk1elJKRlFnQWpkT0xWTFA3SDlWR0pOVGNVQlZMTGRYTERXQStS?=
 =?utf-8?B?Q1RTMUN5YnJ3NlF0QjVTY29YOFJ4UXhpSUVyK290aW5xN0pNdWozbHhpYlhn?=
 =?utf-8?Q?z0JNkx0s98CLZOzc=3D?=
X-Exchange-RoutingPolicyChecked: qIghjDl1Ue70u4hN0QZnVBOimUkZszjcFBZvBJknHKSVUJAHY+gb7GDgQzhEiEqVMJ0NRPy8NqJ6kKDe4Heu22oiJOwioas1NBLC0Re1hc4P40EQctAP+gb2o5sSnNKujSfaA2jGDSmcAxR+Y7WYL3FAVXmaPcfsKRWdmm+fDJ2gn/4/a5cNOdkSq7HyK+ZH0p7bGhnz2VCK5oEmjUWCvbUnplJNSPPg0UDMeXw6GuNifE/QEbBPR2Y2OjwXFvJta3fMKV8aroEqCdExlBO3Wj9xhY1zTzR1yDZEVxUqiTrMrbC3sUxqQQjYdWuy+y2VlkZ72n9Y8cGOcANOdr3ldw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 432e86e1-00e0-415b-1bb2-08deccc0e184
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 22:36:32.4493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUUzfoxCQsMvQZ1I0DuR+mmUJVpJyTbLOU3/JjFqemmR25Fi0QeD8ezU7lNrAG0BPT8INlBN+2ov7g8x3e7PaxPMXA5gHTN8I27h8iUM8PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
X-OriginatorOrg: intel.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo
 Abeni <pabeni@redhat.com>, keguang.zhang@gmail.com, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: loongson1: Use
	dev_err_probe()
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-mips@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:keguang.zhang@gmail.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:keguangzhang@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[intel.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FE1E69CB06

On 6/17/2026 3:07 PM, Jakub Kicinski wrote:
> On Wed, 17 Jun 2026 14:26:25 -0700 Jacob Keller wrote:
>> It does claim that it has benefit since you get the error code emitted
>> symbolically. But we have %pe for that. I wonder if dev_err_probe
>> predates %pe?
> 
> I'd argue
> 
>   No of match data provided: -EINVAL
> 
> is more confusing than just:
> 
>   No of match data provided
> 
> the EINVAL is meaningless and hardcoded in this case?

Yea, it is a bit more pointless with a hard-coded error.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
