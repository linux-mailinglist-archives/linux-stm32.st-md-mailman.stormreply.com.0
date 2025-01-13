Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46EA0B642
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 13:03:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E7D5C78018;
	Mon, 13 Jan 2025 12:03:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E2CCC030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736769820; x=1768305820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ai5qOlATFOPAxxDn6pSDhIZyrtCsb7wvx5CoCLlrLMw=;
 b=TiuFDfLKBx/lOJL49frhdH1JGkqMHT3996AF0E1USVYbvvmw5FRAD3Fo
 APSA99QJrtAD0Hp2Ty1yVeT5mGPBcvqY+jqOf/elE2z7Y87iq/pc8l2S/
 v4Y0dyc9uss1lCwFMUl8f2K7Y99UocAETrydxb+sVtL7eu+vpxKL7lM7z
 jDLxdyUx3AUZdiXxN+CKYdHeaLRwVJuiRX5HZY/jWbAIyH4gppDyagBwv
 zj1q3VgrULIcLQRWPWWs6/BWcEg0XA+xb1BkmSrEexDlY+/zW2eQ1iRwH
 6lURrliNCzGaT8Pkjrvfw2NVu/MEaLVfvWP0DQ43mqP8TZ3aXhL3jLCok A==;
X-CSE-ConnectionGUID: orfJkRI7T8Gb8JoLWBJ3BA==
X-CSE-MsgGUID: HIwlHmmqShCtJQcclmGpfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47693535"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="47693535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 04:03:31 -0800
X-CSE-ConnectionGUID: HQ+cL42pTkqfjgXaEJeHDw==
X-CSE-MsgGUID: 5X3DBsCUSXqC0EQ6ZGoV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="135273710"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 04:03:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 04:03:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 04:03:30 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 04:03:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm2yf3cbZQArk9DdORARaILFk+rLuMljJu9DEWpx+Xy+s2sWAJW9uvysIygqv1Xi64XlfXXlB/SAKYbDzmGMnoUMU7LxKmLtPP8CwfLBNPW3pSmJnjgnFqe5sScPLcRf69Uluvz35ABEgs4Scn2S7/3QwPlp/9rqkP/amKAiswbMlL098Wxy3evZZQRNHnOiYTBVrCLu/jwMlkj/uWOsEQb2LEOlengI8+zYabVQtJK8oE5qpjfzbbaeRl32hv4RLbxgqrHprsYfvOXUTon4y8QTrVBe0C8HodVGrBjV9+/pRQpei6/6DOs+aKoVcZA8uEcU+B5vi0f9XqynGzMBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFcviSFsewhZfpRuSzhj443Lzr5itag4HVGnSd2jT68=;
 b=kP6WcmqetxSxx66DsGBOPw6r88lBOVUl04yGBt4rpYS4CLiK1AaD6Il+k2r6/U5KYgnSj1uiXcAH1HlGwqySFqnN4TJNCvr4wJ03PQuKz8eo69FqRHyCJKyy/3msoWRFJtkh7gHSy1fft49ohxV+s8Zli9sTrg8sFfAHgw5lO/XwWs+U8ozXivjhCveIqtF59u47x1wjU23na19YbdYIc2CNI0GbHnwOlIX/mpRPDnOaPKYGVEeaIgzRG+R6mvgOeGyUnQqzDsJygcAc62mXILCgPNMXsQL6VDf8c6X9cDIerExgmfXCh0iNGJI6O3yyOrBOLrMKeVSddP87Jy9Aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 12:03:08 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 12:03:08 +0000
Message-ID: <054ae4bf-37a8-4e4e-8631-dedded8f30f1@intel.com>
Date: Mon, 13 Jan 2025 13:03:01 +0100
User-Agent: Mozilla Thunderbird
To: Yanteng Si <si.yanteng@linux.dev>
References: <cover.1736500685.git.0x1207@gmail.com>
 <600c76e88b6510f6a4635401ec1e224b3bbb76ec.1736500685.git.0x1207@gmail.com>
 <f1062d1c-f39d-4c9e-9b50-f6ae0bcf27d5@linux.dev>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <f1062d1c-f39d-4c9e-9b50-f6ae0bcf27d5@linux.dev>
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f74640-cf59-4fc2-f2ad-08dd33ca3e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEJHeU41R1ptOHJIRFU1OEdtZ29HV1ROckM2K1hIaEhnMmNjS3dnM1VHZGJr?=
 =?utf-8?B?UjBwMnR0R2Y4MUJWTEkyY1RldnlqL2ZrVEh0S0g2bWU0cEFoazNqTXZKQUcy?=
 =?utf-8?B?ekt5aUpPeXJPS2V1Snl0UllqWU4yZkhqdHhhYkRmTzFHeE8rSGxMUDdVMzRX?=
 =?utf-8?B?Qy9SUWRHaFVUQyttb0E1YUgzKy9PbTRtNVprTWJMR01mRlVxODVSMDUrL3RX?=
 =?utf-8?B?MkhnaU0rVXZkUnF5Qm5LTlVBdDVYNVovTUYxTENhQmV6T1hkOFlQZ2VkZUxj?=
 =?utf-8?B?cnBmVTZsMW1mVjNXbE81Yy9kNk16d2ZxMFp3ZEJGMEtUa2Q3bHpPY1lKUVJC?=
 =?utf-8?B?YW1qdG4zZnE3ZTJXVURmNU0xaERmVWNJMjFHZVVJYjhFRlo2QWVtYWNETE9h?=
 =?utf-8?B?K1ZiR2pLclpjeElDV2NGdHArMDZ0YjRtMTBEQVlNTHlBN2JPcE5pZ0ZHQlBM?=
 =?utf-8?B?SFF0L1RwUXhiOXl6OVhjUEFKcCtHUll6MnpSYkdIbTFrRm1VOUFlTldCMTFI?=
 =?utf-8?B?eFovSVIwT1JLQ0lVSEFiUlBreUgrVTViRlJNR2RrTVRXME45c0Nwb3JhTGxJ?=
 =?utf-8?B?L2ZrY3IvTGhhM3NmS3QzLzV3OVVEU1pUdDFpTVhaV2VubU1RYVpyMTlmZ2VC?=
 =?utf-8?B?UmowVU83RkE2aWlRTk90MUpDUzVwTDVmUnhhZUsyYVpjWDIza01HS09iNXlM?=
 =?utf-8?B?dTlzdytXRFZsSzVFa3VYVWxPY3plRkUreGdoL21vWWVBRzN3K3RxcVRJNGpL?=
 =?utf-8?B?NjFLNVkwT1B6Rk5pTVNYcnFBSHZYdUloR1drNy9PWFRCMnlhWEZid1VacWho?=
 =?utf-8?B?WGxXc25xTU4xaVUyTzVyVkoyU2xic0RpYVVGZEFPSjdlK2x4SGpRbEpOZG9n?=
 =?utf-8?B?aVB6cUlBTEcvSGpjUC9zWjZ1OVAzd0d6WnJhM3l4elZaRGYybjYrdWVaTUF4?=
 =?utf-8?B?MDExdWROZkFxdTJnM3VObHRyMHN4ZHAwTkF0cjRUM0IvdkhmK2F4TEU3ZmFY?=
 =?utf-8?B?RjJ0UmVFQ3V6bkhvV0tYSnNNUVM2YVVmdXpKQW1kOW9sTHZad1J0aTRoY2ds?=
 =?utf-8?B?STBObytxRmNIeTBqa011ajVEOG1hZ0txdnh0THEwcS9JMldWU0Y1ZWNLSkV6?=
 =?utf-8?B?cUtWdFZ5bjBvQ3JqZC9VL2VEdGxkd21zTlZXeDg4bVBxbU5iR0pnWVRTdnlV?=
 =?utf-8?B?VlAzNlEyZDI4cS9KN2Nnam9hSCtnSVlMVFZGeDhBZG4yTzhmeDVWM3hUZ3R6?=
 =?utf-8?B?MlNYQ0I1L0lHY2VvNUNTdHBTSG8wcmR6RENhaEVob0tYRkxIeXRld3lCSWQ5?=
 =?utf-8?B?Y05tVk9RTm1aOVZvZlZraUxNZWtOWXJmL3FSSHB6VzBsU1pmWTdUS01YQ0Qw?=
 =?utf-8?B?UFMzUS83a01SQ1piSms1Mm9FOXpBNmt1a3BtRVRvZGtub1kvQ3RSbk5LaGM5?=
 =?utf-8?B?UW51eFpBQ2RBZ0doWDBsUDA5THBmZDJ5ejNVVGI0YWtJU05yWURxWHFZZWpi?=
 =?utf-8?B?MDduU3NlOXY0dkhjempFVXo4dittRGhGVzgxd1grUkYyYVl5VWhRQWRTUVlG?=
 =?utf-8?B?KzF3S1BFazFsVDUvSFFRaHlWM3E0WnBsYU9sRisyVUxVSy9EZkQzVk90OUw0?=
 =?utf-8?B?UFRmOVpYT2ZDcXdlZDNIdjk2UU5jREtsOW02UFlrRDVoSnFDSHVxSHZnWXJP?=
 =?utf-8?B?OWJMZmVOUVpDalVVOFk3YWRCMk1Galo0eFNhL2gxVENrWVdERTVYRUpuWEIy?=
 =?utf-8?B?UGJsazdRWTRnYndLWHNLS2MrcmwxRmp1OGx5Q2RKR1FwYkdoeUNMRGZkV2tN?=
 =?utf-8?B?dXMzeWo2emg2bFB0QmNwVndSRWNjc0RtOHlPNGNxcFlHREJWN01SalFmR0l6?=
 =?utf-8?Q?2Xg6UmVaQmD+p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWc4TGFLNWh2Y1JNRXZpOWwwY1dGYytqWkJKZ2tKN1htaVZOVXgzMUdCMjRZ?=
 =?utf-8?B?bDlQdE44UDJHa1BTKzlScUxOQVBoeU5tUkNCVmlrSmFvN21PNU5JaHNLZkl4?=
 =?utf-8?B?NWlLVmlXMnFlN2J1MVFTcFA2dkUvRmd2VCtZOXRFdGQ2amRLTTVpQWRWM2tC?=
 =?utf-8?B?UUZmWHZTTHptU2NTUHBFdEJmczB2WEd1Z3B0Y3N2QlhCQmVGeUZQV2FucGJx?=
 =?utf-8?B?M0plRlNaTDdsWVh4aHdsSlZibHM0ZTFoWjZVSEZuWlZtL3hZMDhGcm1VR0NZ?=
 =?utf-8?B?TDFOTzdsTTFpTHB4ck41TndEMUNJVlRicVpHYTVlUXB0UXNXUWlsdHNlS0w3?=
 =?utf-8?B?OTA4RmQ3QjhaVGNVbm9IR0IzWlp2V0VwbHNCdTFCdjZnL21Jc1dHdXRUVGhD?=
 =?utf-8?B?UGwrNnZpa1JLMzUyNU1IdEFPeWF2ZGxMQUZtalVFQVltNW5jdWEySVpuOEZP?=
 =?utf-8?B?WTlpZ3ZjL2VqYjdlT1hWRUg1NnNobWwweEN5cWRwNEJwZFBxdiswSEZoMTFo?=
 =?utf-8?B?eVY1dmY0ZHFiOTAzYzF6TDZ4Zzd4VXNJSzA5YVhoNTE4K0NxSFVuM0tTYVN5?=
 =?utf-8?B?Rys5WlkwZ1FZTmMrSGNIVnhYZlZ6N1VDODhHckczL1JkTEFWaTZLV005NGFT?=
 =?utf-8?B?WHk4KzMzRVFFdm5SNFA5VTFXbVJRYVUveGc0T01Sc1ZZdnU0NHV5ZklFa2pz?=
 =?utf-8?B?T3FRYzh3SzI5ZTBWRlVQcHBIV2luRzg5N21DTTBIdnlyYk93UWJIVkwyMTF0?=
 =?utf-8?B?ZkdpRG9PekxVSkhTcEJYTVFha2g4SzNEdDZnM3BGMjBZMmZCdFBsSjJlaXND?=
 =?utf-8?B?ZzVMY1lCZzlFRlBFbnRXcGM1cGh4dCtFcHJ3eEFNSnc5OXNpMHFIOEMyZUx3?=
 =?utf-8?B?RnhucHRmcWlNZzVmcUs0eXRvZUQzdHh0NlVncUs2K2gzTlBObXRvRzMwYTgr?=
 =?utf-8?B?RThjWlVnSkVDZ3JKMEpaNjVOT0pWWkh1dnpLWkdyOTFMWTVLQnhDTzFzcklV?=
 =?utf-8?B?M1hsdGFnTzByTHI3bTVkU3RXL3JxRGlrY3ZmL0VvSUR4Y2VDNCtQellLaFcr?=
 =?utf-8?B?N0dVTVFwZnpKWnhZR2J5OW9RS3FHMUhFMU1KSnh2SEoySDhhWFhSd0ZWTGQ1?=
 =?utf-8?B?UDZic3V5b00rUm5KbnRvSWtveEJJUWVxb3VPcEIxR2JGRFRFbmxRUTdFTDZy?=
 =?utf-8?B?MHk3ZGNDMGk1T2tBbDFEdlNBbXJ1TGMxbWUwQTlHUTk3TzcrTys0dXFjMWZp?=
 =?utf-8?B?VUtEU0d0VWt3dE84Z2Q4aThZeEN6UUpTbEUzL3ZmYTIvdkZaRTBBRStKaHF4?=
 =?utf-8?B?VDV4aFlIc3dUTmlNdnA0bU5ycUhDVzdVc29WYko0eE9lZndRbld6UDNYY2M5?=
 =?utf-8?B?eGRGbjdhYi96MWp5Q3grN0xpL2NuYWFDUER6SmRjdWVJT0xQRHZpUm0zZGNS?=
 =?utf-8?B?M3IwL3Nmdk5FU0piMnArZ0h3WWdIRHFCa3MzR1BVYnpqTUorbE1aZ1I0VWhS?=
 =?utf-8?B?K1E3Y1dpbFZNNXBEWVQ4Sml1eDNwbVVMSTNJR1V5NDEwZXNKVzlPWkZ5SFJp?=
 =?utf-8?B?OU5LbmdFY1R0eEtSdWJ0ZXd6cGJKY3U2SWN2WWFsNWNjVkJSOStnZUczdnll?=
 =?utf-8?B?UUJKdDBGcGhYYnMwUnhKdG9obHg3bFM3SnRhTE9kTlNjS0Y3cjRPaWxvK255?=
 =?utf-8?B?RVRML3I4bmFBZ2EyTW9Xd3Uyd2wrNWdxSHppd1pWTUxmUkJJdTkyZjF6UG5Z?=
 =?utf-8?B?VEN5emt5Rjlwa3RKbWhVMEpOYWh3aFJpUnFtb2dhRDV1ODA1K04xK3NBM0s5?=
 =?utf-8?B?WE85YlpLeXI3RUMzZU1LdVZUZmNvSHY1OTdhd0xmK294SWZ0VHNQSU5aaW42?=
 =?utf-8?B?VERaVXFselJ5dGtsbnBmVFk1aEtCNENCTG9mVW9Od2VwSUsyWElLWnhnbHNa?=
 =?utf-8?B?YmxrRWxaWllhQTVlK3JlMmVmQmsyVEMyRHhSOUJHSml4a0twNG5Zall2ZGlt?=
 =?utf-8?B?UlFTaGEybVRYY3hZeGpKVjIvK2VtcEk3MHc1TU84VUQ0OUpCVHMzMVR4cHlI?=
 =?utf-8?B?MkxNWTd6b1czY1hwOHZSZmFSUUcrWGp3eUhtUE9GV2NsMUVORFdQNVR1QllS?=
 =?utf-8?B?NGl2dVR5SHZQVExuY1A0cjNrVEp2WGNWR3ZDVkRyZ2p3RVVoUFRXb1FVYVpB?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f74640-cf59-4fc2-f2ad-08dd33ca3e52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:03:08.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1NqRzoBLNrkO0hBz+40/U0YxuxOfIFmExinjBnHwU77kDecdcpPDTGx8gb53YFyPwkrLOBxrUlCVbqj/+yaWCFyOfEOdUOwigB11dljgC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/3] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

RnJvbTogWWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+CkRhdGU6IE1vbiwgMTMgSmFu
IDIwMjUgMTc6NDE6NDEgKzA4MDAKCj4g5ZyoIDIwMjUvMS8xMCAxNzo1MywgRnVyb25nIFh1IOWG
memBkzoKPj4gQXZvaWQgbWVtY3B5IGluIG5vbi1YRFAgUlggcGF0aCBieSBtYXJraW5nIGFsbCBh
bGxvY2F0ZWQgU0tCcyB0bwo+PiBiZSByZWN5Y2xlZCBpbiB0aGUgdXBwZXIgbmV0d29yayBzdGFj
ay4KPj4KPj4gVGhpcyBwYXRjaCBicmluZ3MgfjExLjUlIGRyaXZlciBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudCBpbiBhIFRDUCBSWAo+PiB0aHJvdWdocHV0IHRlc3Qgd2l0aCBpUGVyZiB0b29sIG9u
IGEgc2luZ2xlIGlzb2xhdGVkIENvcnRleC1BNjUgQ1BVCj4+IGNvcmUsIGZyb20gMi4xOCBHYml0
cy9zZWMgaW5jcmVhc2VkIHRvIDIuNDMgR2JpdHMvc2VjLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBG
dXJvbmcgWHUgPDB4MTIwN0BnbWFpbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaMKgIHzCoCAxICsKPj4gwqAgLi4uL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgMjMgKysrKysrKysrKystLS0tLS0t
LQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWMuaCBiL2RyaXZlcnMvCj4+IG5ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMu
aAo+PiBpbmRleCA1NDhiMjhmZWQ5YjYuLjVjMzkyOTIzMTNkZSAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPj4gKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPj4gQEAgLTEyNiw2ICsxMjYs
NyBAQCBzdHJ1Y3Qgc3RtbWFjX3J4X3F1ZXVlIHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
Y3VyX3J4Owo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkaXJ0eV9yeDsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgYnVmX2FsbG9jX251bTsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbmFw
aV9za2JfZnJhZ19zaXplOwo+PiDCoMKgwqDCoMKgIGRtYV9hZGRyX3QgZG1hX3J4X3BoeTsKPj4g
wqDCoMKgwqDCoCB1MzIgcnhfdGFpbF9hZGRyOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBz
dGF0ZV9zYXZlZDsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMgYi8KPj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYwo+PiBpbmRleCAwMzhkZjFiMmJiNTguLjQzMTI1YTZmOGY2YiAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYwo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jCj4+IEBAIC0xMzIwLDcgKzEzMjAsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHN0
bW1hY19yeF9vZmZzZXQoc3RydWN0Cj4+IHN0bW1hY19wcml2ICpwcml2KQo+PiDCoMKgwqDCoMKg
IGlmIChzdG1tYWNfeGRwX2lzX2VuYWJsZWQocHJpdikpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gWERQX1BBQ0tFVF9IRUFEUk9PTTsKPj4gwqAgLcKgwqDCoCByZXR1cm4gMDsKPj4gK8Kg
wqDCoCByZXR1cm4gTkVUX1NLQl9QQUQ7Cj4+IMKgIH0KPj4gwqAgwqAgc3RhdGljIGludCBzdG1t
YWNfc2V0X2Jmc2l6ZShpbnQgbXR1LCBpbnQgYnVmc2l6ZSkKPj4gQEAgLTIwMTksMTcgKzIwMTks
MjEgQEAgc3RhdGljIGludAo+PiBfX2FsbG9jX2RtYV9yeF9kZXNjX3Jlc291cmNlcyhzdHJ1Y3Qg
c3RtbWFjX3ByaXYgKnByaXYsCj4+IMKgwqDCoMKgwqAgc3RydWN0IHN0bW1hY19jaGFubmVsICpj
aCA9ICZwcml2LT5jaGFubmVsW3F1ZXVlXTsKPj4gwqDCoMKgwqDCoCBib29sIHhkcF9wcm9nID0g
c3RtbWFjX3hkcF9pc19lbmFibGVkKHByaXYpOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlX3Bv
b2xfcGFyYW1zIHBwX3BhcmFtcyA9IHsgMCB9Owo+PiAtwqDCoMKgIHVuc2lnbmVkIGludCBudW1f
cGFnZXM7Cj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGRtYV9idWZfc3pfcGFkLCBudW1fcGFnZXM7
Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5hcGlfaWQ7Cj4+IMKgwqDCoMKgwqAgaW50IHJl
dDsKPj4gwqAgK8KgwqDCoCBkbWFfYnVmX3N6X3BhZCA9IHN0bW1hY19yeF9vZmZzZXQocHJpdikg
KyBkbWFfY29uZi0+ZG1hX2J1Zl9zeiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0tC
X0RBVEFfQUxJR04oc2l6ZW9mKHN0cnVjdCBza2Jfc2hhcmVkX2luZm8pKTsKPj4gK8KgwqDCoCBu
dW1fcGFnZXMgPSBESVZfUk9VTkRfVVAoZG1hX2J1Zl9zel9wYWQsIFBBR0VfU0laRSk7Cj4+ICsK
Pj4gwqDCoMKgwqDCoCByeF9xLT5xdWV1ZV9pbmRleCA9IHF1ZXVlOwo+PiDCoMKgwqDCoMKgIHJ4
X3EtPnByaXZfZGF0YSA9IHByaXY7Cj4+ICvCoMKgwqAgcnhfcS0+bmFwaV9za2JfZnJhZ19zaXpl
ID0gbnVtX3BhZ2VzICogUEFHRV9TSVpFOwo+PiDCoCDCoMKgwqDCoMKgIHBwX3BhcmFtcy5mbGFn
cyA9IFBQX0ZMQUdfRE1BX01BUCB8IFBQX0ZMQUdfRE1BX1NZTkNfREVWOwo+PiDCoMKgwqDCoMKg
IHBwX3BhcmFtcy5wb29sX3NpemUgPSBkbWFfY29uZi0+ZG1hX3J4X3NpemU7Cj4+IC3CoMKgwqAg
bnVtX3BhZ2VzID0gRElWX1JPVU5EX1VQKGRtYV9jb25mLT5kbWFfYnVmX3N6LCBQQUdFX1NJWkUp
Owo+PiAtwqDCoMKgIHBwX3BhcmFtcy5vcmRlciA9IGlsb2cyKG51bV9wYWdlcyk7Cj4+ICvCoMKg
wqAgcHBfcGFyYW1zLm9yZGVyID0gb3JkZXJfYmFzZV8yKG51bV9wYWdlcyk7Cj4+IMKgwqDCoMKg
wqAgcHBfcGFyYW1zLm5pZCA9IGRldl90b19ub2RlKHByaXYtPmRldmljZSk7Cj4+IMKgwqDCoMKg
wqAgcHBfcGFyYW1zLmRldiA9IHByaXYtPmRldmljZTsKPj4gwqDCoMKgwqDCoCBwcF9wYXJhbXMu
ZG1hX2RpciA9IHhkcF9wcm9nID8gRE1BX0JJRElSRUNUSU9OQUwgOiBETUFfRlJPTV9ERVZJQ0U7
Cj4+IEBAIC01NTc0LDE5ICs1NTc4LDIwIEBAIHN0YXRpYyBpbnQgc3RtbWFjX3J4KHN0cnVjdCBz
dG1tYWNfcHJpdiAqcHJpdiwKPj4gaW50IGxpbWl0LCB1MzIgcXVldWUpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIFhEUCBwcm9ncmFtIG1heSBleHBhbmQgb3IgcmVkdWNlIHRhaWwg
Ki8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmMV9sZW4gPSBjdHgueGRwLmRhdGFf
ZW5kIC0gY3R4LnhkcC5kYXRhOwo+PiDCoCAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBza2IgPSBu
YXBpX2FsbG9jX3NrYigmY2gtPnJ4X25hcGksIGJ1ZjFfbGVuKTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2tiID0gbmFwaV9idWlsZF9za2IocGFnZV9hZGRyZXNzKGJ1Zi0+cGFnZSksCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnhfcS0+
bmFwaV9za2JfZnJhZ19zaXplKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFz
a2IpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlX3Bvb2xfcmVjeWNs
ZV9kaXJlY3QocnhfcS0+cGFnZV9wb29sLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmLT5wYWdlKTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByeF9kcm9wcGVkKys7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY291bnQrKzsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGRyYWluX2RhdGE7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogWERQIHByb2dyYW0gbWF5IGFkanVz
dCBoZWFkZXIgKi8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2tiX2NvcHlfdG9fbGluZWFy
X2RhdGEoc2tiLCBjdHgueGRwLmRhdGEsIGJ1ZjFfbGVuKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2tiX3Jlc2VydmUoc2tiLCBjdHgueGRwLmRhdGEgLSBjdHgueGRwLmRhdGFfaGFyZF9z
dGFydCk7Cj4gVGhlIG5ldHdvcmsgc3Vic3lzdGVtIHN0aWxsIHJlcXVpcmVzIHRoYXQgdGhlIGxl
bmd0aAo+IG9mIGVhY2ggbGluZSBvZiBjb2RlIHNob3VsZCBub3QgZXhjZWVkIDgwIGNoYXJhY3Rl
cnMuCj4gU28gbGV0J3Mgc2lsZW5jZSB0aGUgd2FybmluZzoKPiAKPiBXQVJOSU5HOiBsaW5lIGxl
bmd0aCBvZiA4MSBleGNlZWRzIDgwIGNvbHVtbnMKPiAjODc6IEZJTEU6IGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmM6NTU5MjoKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBza2JfcmVzZXJ2ZShza2IsIGN0eC54ZHAuZGF0YSAtIGN0eC54ZHAuZGF0YV9o
YXJkX3N0YXJ0KTsKCkkgYWdyZWUgdGhhdCAmY3R4LnhkcCBjb3VsZCBiZSBtYWRlIGFuIG9uc3Rh
Y2sgcG9pbnRlciB0byBzaG9ydGVuIHRoZXNlCmxpbmVzLCBidXQgcGxlYXNlIGRvbid0IHNwYW0g
d2l0aCB0aGUgY2hlY2twYXRjaCBvdXRwdXQuCgoxLiBJdCdzIGF1dGhvcidzIHJlc3BvbnNpYmls
aXR5IHRvIHJlYWQgbmV0ZGV2IENJIG91dHB1dCBvbiBQYXRjaHdvcmssCiAgIHJldmlld2VycyBz
aG91bGRuJ3QgY29weSBpdHMgbG9ncy4KMi4gVGhlIG9ubHkgYWx0ZXJuYXRpdmUgd2l0aG91dCBt
YWtpbmcgYSBzaG9ydGN1dCBmb3IgJmN0eC54ZHAgaXMKCgkJCXNrYl9yZXNlcnZlKHNrYiwKCQkJ
CSAgICBjdHgueGRwLmRhdGEgLSBjdHgueGRwLmRhdGFfaGFyZF9zdGFydCk7CgpUaGlzIGxvb2tz
IHJlYWxseSB1Z2x5IGFuZCBkb2VzIG1vcmUgaGFybSB0aGFuIGdvb2QuCgpJZiB5b3UgcmVhbGx5
IHdhbnQgdG8gaGVscCwgcGxzIGNvbWUgd2l0aCBnb29kIHByb3Bvc2l0aW9ucyBob3cgdG8gYXZv
aWQKc3VjaCB3YXJuaW5ncyBpbiBhbiBlbGVnYW50IHdheS4KCj4gCj4gVGhhbmtzLAo+IFlhbnRl
bmcKClRoYW5rcywKT2xlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
