Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436DA13018
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 01:40:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 441FBC78F7A;
	Thu, 16 Jan 2025 00:40:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E77C0C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736988016; x=1768524016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fldl1K2uHS3tsStGwOyK6faLfUx0ub7xch57KWHs/hA=;
 b=JUjVH8ffKggagAiMsh72lrQE7Aqa7htfSzQAIWHdSiQnhhGMiMUyB2rJ
 Mpz2gFbbFLa3Rg5g30bpRVFRx36bglJxys3FhJVZZiKa7r5NleluVdNCj
 BXjVVtfxFwKlyW7vENJu7TP5J8xh9l0HX+cBkFoujKQA13uJVKvHJOuvH
 cUZXe4Z40vUnIK4UC5/nAS+ojwhns4aO/7RuEMsqSmq8iIQ0njx6MTgPZ
 3EmzF3o+uZYvEvk21rU9J4Cn6jqr+QMPLfJk7Q4gU3EAA/qgeVg5q6k+9
 FFFBmko/ATIWLCsiEi6FlFSUUh00QoWqf6CCB4AupMMe3228h4P5alCfE Q==;
X-CSE-ConnectionGUID: Pr9wG4X3Tm+vqRpkqPQACw==
X-CSE-MsgGUID: qJNLFSWETNSioQwJJtYP3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62717262"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="62717262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:40:08 -0800
X-CSE-ConnectionGUID: LspXktj9SmeC2M/MP72Zhg==
X-CSE-MsgGUID: /Pkk0GEIQzuYGAZDDotTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="136149801"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 16:40:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 16:40:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 16:40:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 16:40:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiqLpPU2MkD9iMRmOivE+JZt7l2H6JaQ9Sb3KKdY4CbAM8sPfsSBUfLZOBXITdIzQGibooQSywioCO05L9SBw4ZyS6Lbof+QMnVKU5Awh/hE0IHmZbh8iTPwfIf5ntmwsSK1hSsutMWugv1vHZ+GthsVmpPwkgIZMBhg+9EszHd4ho8iZLD9ky9nvaFGSFhLbLN7KU/CBB40GOdp3+crZxQb5pmuBAMJA+Pu+30eJkw1kZ+kYVhz8VAmI5QUHx+3z8D0DML5bSfhVzT8JalA0h7v7xaN4dUPjjSAwc7VHnjzc6wcQARipDXBYTiWNFgJzsghne5zW7XT5OCbPbnHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOQjj1GcoRZq+tYJKmtIWEuKEDoi0nv24+6Buj82dV4=;
 b=JbNNHAGH6CDty3Kj8VYRssRVUn7Rx6LuIa2Wq6HBiD8Po7mrGX1YbXlES5Br9jVP213PDeqI/CKrWyWxj3NVgPnoqaYSAJ3qazlOJKiMPyOARsevSoNkaArOx5tpAIooTrspkmroK8ngAmkHcqwAoFsFBYRBOXXUPPq2cru4S5b2L/sjIKhC4D/KgXCRmKkis5ykqxsXW4mFwvKExW2Ax+304aTELusnhTwz3I4Zz9R7SOwGMvUZ8KZlSB3VNQdfdDjINkSXOhHmBH1yovSTZc8I1bCZi8RXEz9N0cFxm6tpVX0hCmzs/fePT/tsRRKJdJhn8kGmjjCNFCu4vMMtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 00:40:05 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 00:40:05 +0000
Message-ID: <59827630-a2a2-4c3f-80d2-04f9dc100654@intel.com>
Date: Wed, 15 Jan 2025 16:40:04 -0800
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
X-ClientProxiedBy: MW3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:303:2b::8) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dc06a6-4aca-4430-342f-08dd35c651ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2xFRUpoeU5TYmdVdzdvbXRQOTRidzhab0dOY3FKbDZHbXcrcE5oYzk5UVhN?=
 =?utf-8?B?ek1JbXFvMWhoN3NoTmlYZUFKWTU3RDM3Sk5BRWwydDNyTkJiYWhRYitua08y?=
 =?utf-8?B?bWxuUUU0SUtKTmpsSE80UHlHaE1xejdDakk2WVFrTUdYSGNVZmtQU1lBN2o3?=
 =?utf-8?B?TDlZdUVRLy90S0Urb2xQRWlVTjlRQTdsbnFEM0dDMW5UWGZXWTYraHZ4NWc3?=
 =?utf-8?B?U1BNYmJBby9YK0FoWHFVL3lSQkx2aGNqb1BmNzk2bHo0cVhJTVN0T1dUb2Rt?=
 =?utf-8?B?cm1Vay9ObnVRRVRRNDR2amV0TmxiK0Uxc2pIMDdhOW1VMmdET090YVhZUWpx?=
 =?utf-8?B?bkVxN1NBNkNiTDAvWGlDV1dlamw0LzVmZmhsdnhPTTMreGo1ek5MYURuR2ZZ?=
 =?utf-8?B?RjE0SnRMZGVhRzFlbjFPa3NoaExYc252SHM5NVhTNkNJcUtWMnhxT0NibThS?=
 =?utf-8?B?TWNzYkVPTlNJRmNqQ1hIdjJCRCtsSXpFUHdkK1h2ZGlXR0lNM25vS3pPaW0z?=
 =?utf-8?B?SiszTXdBbHllOG01bFVpZFJTZms5czEyN09RMGpZeEc1Z0s0K1oxb2ExWDBB?=
 =?utf-8?B?RUFNWnc1NEdZUWU2R2pRZHFRdTFjMlV4K3lrdHhNdFJudzlHS2xxbDEzcnNw?=
 =?utf-8?B?MkxuMHIxT042c0IrUFpza1dwZlBOVk1aaWV4d3pjQk9makpxOGlmNG5XQzZV?=
 =?utf-8?B?dE1ERFozRXB5UGlIZlF3Zm9JdmsrMGd6M3M1dkRpNTdXQUNPSUpyaDlJNTZo?=
 =?utf-8?B?UGN4dmk3RU1QZ0dkdk1EdWtEb1A2QWZwRkxlSDd1aWxjZU9nR3FvSFdCU3RI?=
 =?utf-8?B?Y2dRaVVLY3cvOWdVcWdkbXZ4WXJJc1RZL3VoOWhkU3hJNG5mbjg0YURIWTVq?=
 =?utf-8?B?ZVFVS2FqRHdPaU1ibTRUYlhqYUxjU1MvNDJDaWowaks2VXNGeWYwVjZsdTlu?=
 =?utf-8?B?Q3dvZGVXTmJtM2tpM3ZwbXNwTzFscVJ6TVVlMjZtdGNaM1pzcEpQcGxqeGcy?=
 =?utf-8?B?ak5ZM3BOWGd6ODNMdnNnZXVObS8xK0JwcnhtbndOTm9kYW83ZStIVTRjY3ov?=
 =?utf-8?B?L1JqRjhOdTBraktXZzUxYmRSSGFpQmhLYWZmaW9qNUluUjRBV0FYRFdxanlj?=
 =?utf-8?B?M1lKbVpZNDZXaW1vVFRRU3NveFY1UXZSR0ZLUXFncXZJNHVLZUFPZjZWbWtV?=
 =?utf-8?B?VmN0aFdtZlBsWW1HUkVXZWJ4V01RMVpkWlV6aSthUXVhVEIyWmlmWXNia0F0?=
 =?utf-8?B?NGQ3THJHc201Ym83a2dsV3ZveXBMaElucHl2ZEVtR2kvWFV1ZjlWcHo0YmpH?=
 =?utf-8?B?Zklta2RPVkpuZ2xXQnIrS3N3OVVTT3M1ajdMSWZ5aVkyTHlPRmJWU3ZHRElx?=
 =?utf-8?B?dEhSU2RFUjVLRDdQZ24wRlBuSC82QkdweWNGekJIOWZWT0NrZ1JzWnM0MkZw?=
 =?utf-8?B?RnNaZWxXZUFWMVdEWS9RTjVPeWNGVnUrTzVqRVExNms4ZHNoVlZEbWhxNmRm?=
 =?utf-8?B?b2tBVjJkSkRnK2JKRHhEVmFqbVpZaTBUZFI3dk5YOUhHejRSZFVhK3Q3U0ly?=
 =?utf-8?B?WUR4K2plVG1GcDV3cHVjdmZqdmtjRlpmT3RiMHF0U25Wd1lWcGs5MFBZdHdk?=
 =?utf-8?B?djg2YjlQQjZuR2NDVnpoMU9wbTNKbzFBQ2hBRnZpUzVnZ05rMm9kazh0L1J1?=
 =?utf-8?B?ckxReTdJSjJwQUM0Uzl4SUFCSlNNTnhKOWNMOHpKYkJZMlp0cGhNZTNTQjBJ?=
 =?utf-8?B?a2xUZGM2TzlGTEloU292eFIralFBeTBuNmJKZlhwTDJCYUhBZ2lBR1J1NlYr?=
 =?utf-8?B?YU9rV3NpYWJ0RlhXb25vNW5xSDdKUzRYUWlkV0lLOHZmRHRxWUNGVDllRlNq?=
 =?utf-8?Q?1doVkvlstlm/g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXhMZ2k0NFFiakJ6VXdVS3BwV21GMXNPdFM4QWxJN0ViWnIyT0V6bXFJbjdB?=
 =?utf-8?B?UVVFbFJwWmo4dHlTejFTaTc1RWJGdjhFTmR1dUNPa2V0OUw2SWNKbnNqczB4?=
 =?utf-8?B?bnN3ZUZHQWhMbkpKbDY4K01vWGcvdk9jaHJmbHNLbWljSTd0KzI1MVpxSXAv?=
 =?utf-8?B?dlFaR21sWHNJMnRxbHVTbDNaVDhGaElxMk4wQTJuQStNNi9yZ3U4cThuVU42?=
 =?utf-8?B?VjZvWkwwN1FXMExLQTI3QnpOdzgzWTNmdFZDTktyR2hhSVc1dXZKVFVEdFRZ?=
 =?utf-8?B?SXRKUzhaR0ZNcDVLcUFZZzBxbTFhdGUyQkd2TVlNQ1JTV3Y4NGM3NlFoQ0pO?=
 =?utf-8?B?a0VoMTgzNkVVWG01by9YUFZIS3VHYlJsSEd4b3Z0cm8vTEQ0cllvQWxEb1NK?=
 =?utf-8?B?Ylp2RmMzck0xRTFpcFhKaFFUelRrOVc1OW1lc2NOczVldWRkaU9wNmFRZmln?=
 =?utf-8?B?a3lqSk5MUjVBbVNKYkZST1JBLzYwdDltd2dEcTRpbFYvNHhrdGU1QmpMY1NJ?=
 =?utf-8?B?U2pIZjliUi9KcC9hRGtRa21LSDdaNTNsVC9ON2lEOTMyV1lLVUFBQlc3bVQ5?=
 =?utf-8?B?TXRubUFnL3prOTRDTFY2S1FSWUtGZWZwOEhIam82aG5jRTcwZmFvc0dSbjBJ?=
 =?utf-8?B?WDNJSkRTNXBmcFY0bmI1RE1PemlYT3Q1VThPemhDelNvWEV2VFV5Z1NnSHN1?=
 =?utf-8?B?aGlocngvVjBxeVJ5aWxlUVdVUGtzOGNQWWV3UnBNWmFPeEZONC9iZmdGd0JN?=
 =?utf-8?B?MFFISFBpRktSQzB3MURCeEFFalQwZnZHZElsKzdmRG42SEJUaGtRcGV3QmMw?=
 =?utf-8?B?UVJYRmUyZjQraFJrbUY4amFXMFdWNzZRdWhES1ZzUVVEZXVVb0lRaTR5NkFU?=
 =?utf-8?B?aHBTOXRPMzJTcVRlRjZGR0dZNFhzQ29xWUs4Z29UTHFqbnAwYTNQdk11QWw2?=
 =?utf-8?B?ZGhvSDM2OFFBZThreGVOQy8zV3AxYnNRTmJLWlBEQ29uL0JGL2ZsOXZIRllY?=
 =?utf-8?B?N2dsRmtMVEgwSXhGcitJcnNBL08wQTlWdDdEaG9WTVRZKzZ0RHRKYk52dUxp?=
 =?utf-8?B?NTFCendma3QyNS9WN3hlc1AvVjVQeTBid0Q3Uzd5MXFWWSthbjV0R1ZsQ29J?=
 =?utf-8?B?UGY0U3U4M0dSTUdOc3JTcy9wdTVTZmZDTXVON1ZkaktDV2htM1dEWFRXd285?=
 =?utf-8?B?S2xNRGtDQWd5L0xJZG5FcW1QeXJGNzRIdVZBUW1mQ3NwbXlmRUJwZUlqRXdk?=
 =?utf-8?B?b0pVT0NpcDZIL0dyeXZpQ3dWSXVydEN5RVVMSWdEVUx0WGQzZm5VanhEclJz?=
 =?utf-8?B?UkdCZENMRmZLb1gvaHZPbjM5L3RlcUlWOHBEanNWOVBUM1ZmNHNRQVRGR2R6?=
 =?utf-8?B?bGhQaDE2Yk5icll2dkhKcTdaT2Y4Ty9Md1YrQnJqV1oyZWhMWVJpNXRydHow?=
 =?utf-8?B?aDhjT2pqQmtXbERWeC8wS1F2NEdUVllaVHhKRTBFekNVR0pBM3J0Q0F6TVA0?=
 =?utf-8?B?alh3U0wzaFRiY2k0Ujhka29iNDlxUVdXYkZhSXkwVFRkTFdncnA3eFV2N1Rr?=
 =?utf-8?B?ZVlGNlVPdy9nekthLy9EUkdLMGgzRGNQQXA3YTBqZUJRNWpKc0VsYVFRd1dG?=
 =?utf-8?B?bkN2dk9tdU1VSGhPUTJaaFBxYTQvTjEwUHVRNWE0L1FZMTVKS0hVYTJKNHNF?=
 =?utf-8?B?K1hqY1Z5TlNPL3lZUzVNMDJGaXh5NGtEWGwwWklIYVd6djYrWlZMdlEvQzNw?=
 =?utf-8?B?MTFpSTlQTkdOazhxRUNUbGwwVTRhQ0JJSXc0RkNOK2hkTjNQU0FDNXk3K003?=
 =?utf-8?B?MlNyMWl1WXlKQjhHeFc1MTNRdWdDbE5xN21UTzFQVWkyVmhnNFhVY2tXNkll?=
 =?utf-8?B?Sk43VUdTaENxbVZqMVV6c3Y3aW1OYlNrNTRiTE54VW5zRno4cDhqdnFtVjcz?=
 =?utf-8?B?aGw2Q3hXK1ZlWlV2L3RJSXlTRlZjUG1YaFNDMUFYa0VMVmx6aGFZcVdONWU2?=
 =?utf-8?B?K20veGFlRDhRUDE4MlhkTWtKRzNWVFJ6cUgrY05iZVBPTnNDMGkrSC9JVkxy?=
 =?utf-8?B?VU9GQURTYlRDSDVwVWowNFNIWDFTVmhDUURMejEvblNlWHMxU3prV1ZTTWFJ?=
 =?utf-8?B?UldmS2NrM2hMZ0hRcVNBdU04cUFtODExZUVxdUJSSWc5bG1EeU94U2V6VG14?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc06a6-4aca-4430-342f-08dd35c651ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 00:40:05.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuUP8Kx6t+wTXDx0MiNcSM2mhv+okeoCQhZbm3igP0UBw7BwDqZcsBmlrywB6wS6dUP3kwfbv03R0emfVz65CUEUixgooTYHjr021ls04VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-OriginatorOrg: intel.com
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, UNGLinuxDriver@microchip.com,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: add phylink managed EEE
	support
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



On 1/15/2025 12:42 PM, Russell King (Oracle) wrote:
> Hi,
> 
> Adding managed EEE support to phylink has been on the cards ever since
> the idea in phylib was mooted. This overly large series attempts to do
> so. I've included all the patches as it's important to get the driver
> patches out there.
> 
> Patch 1 adds a definition for the clock stop capable bit in the PCS
> MMD status register.
> 
> Patch 2 adds a phylib API to query whether the PHY allows the transmit
> xMII clock to be stopped while in LPI mode. This capability is for MAC
> drivers to save power when LPI is active, to allow them to stop their
> transmit clock.
> 
> Patch 3 extracts a phylink internal helper for determining whether the
> link is up.
> 
> Patch 4 adds basic phylink managed EEE support. Two new MAC APIs are
> added, to enable and disable LPI. The enable method is passed the LPI
> timer setting which it is expected to program into the hardware, and
> also a flag ehther the transmit clock should be stopped.
> 
> I have taken the decision to make enable_tx_lpi() to return an error
> code, but not do much with it other than report it - the intention
> being that we can later use it to extend functionality if needed
> without reworking loads of drivers.
> 
> I have also dropped the validation/limitation of the LPI timer, and
> left that in the driver code prior to calling phylink_ethtool_set_eee().
> 
> The remainder of the patches convert mvneta, lan743x and stmmac, and
> add support for mvneta.
> 
> Since yesterday's RFC:
> - fixed the mvpp2 GENMASK()
> - dropped the DSA patch
> - changed how phylink restricts EEE advertisement, and the EEE support
>   reported to userspace which fixes a bug.
> 

Everything in this series looks good to me.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
