Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C4A39A69
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:18:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C76A9C78F8B;
	Tue, 18 Feb 2025 11:18:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB22C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739877513; x=1771413513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nv9j/jhlIBYKZvAExZqDu9hD20cq5wfUhm7Z97lJI8Y=;
 b=UzmXYlGH12ipYi+1ItvwSZTVMpWMThT1DoG2fhp4uKaYAB/omIHtT0j5
 EC842BPEp0jorPHPQGaic+iE4+xDM9+FSbGU8lcGf6JGNmVHlst2woag8
 yKO9j8wM6C3HeM3Hx2VV31KeluusbNRAOi8eT8h0K0gmp8Aa9SiQih7jD
 CD91xvJqounZ00P3IhhQSDbUkhG4n8LUUq0Mlc/FkfNZlXM0T4MuxFKNH
 RG19FcwkaLrK/IOmermWfvhEnWfjg2PJxutT1Wav8ClFC68jgzOw/X12U
 QzViBmRSeP5RJCTLw63h0Kw7bQk1YGDq0okXkxA3xJ5FtZyP6qa3Xe8eK Q==;
X-CSE-ConnectionGUID: WsTi1ztJRkK9Ald9Z+L6pA==
X-CSE-MsgGUID: dh9KIRZrRcaI5JlFQo0SBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40821898"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="40821898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:18:31 -0800
X-CSE-ConnectionGUID: MwZmx/osScKWIFwxo46zbw==
X-CSE-MsgGUID: 5zc0tmB8RDeSuWoSPdd4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="119353870"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:18:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 03:18:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 03:18:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 03:18:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg596YtmIVjqNHJFzBuAIA+zIzUZY3I1cpyRCbBoP2MUgPJll3itf/20A5If1PWjQd0UwoMjWP74nQ9SYPa6LuT7MbXg+tFhi13eczH4Rdl3/NkqDcWqxaDnc78LqRNO3XGMRM7P51DdCCiMwn0NYBxXLbRnpVDJiFgqZZwpLM5rhDg0AVC9s3kyqCeibpJVOIaQnGhXa+e2KAPt3TJaEPwPZM9ldlYpvHPmDlbkZOl/zKPPHprvMdbfYpmF/c3i3XXYbGmOyuzSVLW000OfSIyPeFQ0K2zBwv/GITlWdtqXBLFhwK3V8Cldk71cBdiP1DY/TyU2jOr4yfAAKBJZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+2DdJxMvfzICHli/7eT4dw4uuMoakB6TaUQ43EYK7A=;
 b=oYiSh7a58zWVkb/THnUB7Ay1PzU7DlSs83RHouHRwl0YXWh/WhkbnG9d8IEz/Yya9wgy9QUiyKjeAxr5B3CcfPIr/p+lxJtPzcoDopjfeytgLuSKkaT7yaEQjakM5TeU8hnb46J6Pbg/voVJoU0HMneuxjGoZKaxBVCABNvsIBgCJf8cHD/XBBNVTSeHcNr1NwPljSp+cNsmcPUCjhtwHGb4BC+vFfAjEoXIIBR1oRGH3iKc1LTkJVusoZ+yRnDIJPVz/a090eoAhzLlwQmXh0SHssNjI41WDy8Ql7PJ8UNMjwqnnOCn8I8SjNaR0294/LlRBZFAXVJKPlmUdHgvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by SA3PR11MB8075.namprd11.prod.outlook.com (2603:10b6:806:303::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 11:17:47 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cfa7:43ed:66:fd51]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cfa7:43ed:66:fd51%4]) with mapi id 15.20.8422.015; Tue, 18 Feb 2025
 11:17:46 +0000
Message-ID: <ce9f7693-355a-4049-98a8-b8bd25b4d3e1@intel.com>
Date: Tue, 18 Feb 2025 12:17:35 +0100
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 <netdev@vger.kernel.org>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmD-004ObA-9K@rmk-PC.armlinux.org.uk>
Content-Language: pl
From: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Organization: Intel
In-Reply-To: <E1tkKmD-004ObA-9K@rmk-PC.armlinux.org.uk>
X-ClientProxiedBy: VI1PR0902CA0028.eurprd09.prod.outlook.com
 (2603:10a6:802:1::17) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|SA3PR11MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: fa304af4-58cb-46c9-6357-08dd500ddf16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V09GRWlkNkZzMHo5ck5MNWE3Y0VNTzgvcjg3WDlXUUZBMXJuM1EycUxIeHJx?=
 =?utf-8?B?TU5aQlJPYms1S1BlRWhtUHRZUURkekRXcFVJWFVucVVUZGFXQlp3ZGw3bTlp?=
 =?utf-8?B?YmU1R2xDc2RmQ3hLT3RhamdBczFDZWVyZVp6aWtta0YwNmZ6ZjRCcGlLQ3VU?=
 =?utf-8?B?bHdHTXZOSmhuZXY3QWRXQk1Vc2Y2a1h6WnFIWWtCL2dkZHR5QnVIRzRSZTJo?=
 =?utf-8?B?MEZCU2tpR0tzeXlVRmQzSTViVUxXRS95YmNXMTV5YWdoZytOYW5tNVpjWng4?=
 =?utf-8?B?eWFBdG13eVA2VDhidmMvREEwcDR5QjU2V2M3bDNmcHV2YlU4WWRLRVZQM0Y0?=
 =?utf-8?B?eGg1SDBrVGNlUGJ6WU5XNk0raVNNVS9qRHQ0T0I3ZXZwNVdIWkc4KzFyZzd1?=
 =?utf-8?B?WU5JQlZsZEFGSFlQUHFlNjhBbWFXZlcrL3hVdzY3VW1lSUFXck82WkdDQnJl?=
 =?utf-8?B?RzlkZTdjMGg4TndrMExpQzZKUGhkSEVKRE5RTjROZ3VkREg1UXh1UmNiUGRt?=
 =?utf-8?B?R0Y2eUZMKzhNSVN1dHdBczBpbngvTDZTWURrdXhNdWx2NWZUbGsxSVlZcWpa?=
 =?utf-8?B?d0MxMDZHbnlhV0xLTExvY1pUbGZzUkpFdUJmeHpVM3VXN1F5b1RZaytlZ1lz?=
 =?utf-8?B?ZWJ5a3RiNk1RbmlmaWhQaWxXWm9wNnpaSTdDa1pzOTlkRnF6VWxoOFl1RHZB?=
 =?utf-8?B?Ly9ub1pFbWpqMzhhYkdQcTJSZDhpYmJhWTRrWm51Z0U0UnFpVXdxZmRZNHkx?=
 =?utf-8?B?VFpoSk5nT1ZaaXNaTXo0RjlZT3VOM3d0VExUUE9JTkxwNlZHMXE4V3d0SGpo?=
 =?utf-8?B?UWUwTUxJNWpLWDVZZkljRXRQZlpRSElvNVRycmdLVmxvTy9iTUxlbWUyYTVm?=
 =?utf-8?B?ZUdHU28yR3o3dXMweXVWeG1IUC9yaFVYRWc4T2dqclplTm1nVWEzWjhoUzFU?=
 =?utf-8?B?VVg5TDhxQjRLajBTSWoraXFaYjdLRUkrUXIyOHNMUHArYW95d1lNVWM2M29z?=
 =?utf-8?B?UE1pYmNiVHdTTGNsZTFJUUFxWktkY0pCeGNYbU40L0RLSVN1bERucHlOYmoy?=
 =?utf-8?B?UVhpUkR3cmcyR3NRbFZLYVRKV2kzRVF1aTRTeUljN0tMeGtJUFRvZXVDbmVu?=
 =?utf-8?B?a1k5em5Vdk1LS0Z1Z1NLWUIrV05lKzBZMVZYWGlXMGNZU3BaaEpRVEZFWjNu?=
 =?utf-8?B?WjV5YW90aHlhSzBZL25DRVRUUGhaSFllb2VKOTgyQldmZmo0VnNjTmRrdW1B?=
 =?utf-8?B?eWlBRGxTa29YRitvZUtUeTEzV2paSGd4cFQ0RXdlampyMVFJR3dQd1FzRlRB?=
 =?utf-8?B?N0ZibU1FUk9VRndTeVhBWmJTNHhNVC9wZzFaSE1KQ2lOQklGMXNYUHhmWW9h?=
 =?utf-8?B?aWw1alMrWm5qV2RhRFBiSXlqNkgrUzFVUGRDWUFKcGtvUk5KaDl3TElZNUlX?=
 =?utf-8?B?M2lzamRRaUhrNEF0c1F2RHo4cXQ0YXVBVERZVkx3T2dIREFLQytZUC9vMjlq?=
 =?utf-8?B?QzR4TklETDN0OHdKQ2Mwd21GdkxhcWlJbG5XUFBUTEtxc2JIeUg2Wlp1Q1l0?=
 =?utf-8?B?bXoyay9QNUFiMlpqeFJKazU1TU5zcUY4ZkVDbTZUTnFiV1VBTng0WFFNWTFa?=
 =?utf-8?B?TDhGd1JjS0c4SmpHcWUwZnY3aWdjWTI5UkVHSWVtSWYwVnpuSDNxSmNzaDd6?=
 =?utf-8?B?QnFCdDZnSzZkUm1IcW9zWXYrVjFhYmtIYzZDL2l6VGswZTJyZ0pTL00vVTRL?=
 =?utf-8?B?Q0d3cVFHMVd0U1AyZGNYbHFpd0Z3RllIZVNvK0p4d3FONGVkSzRES25rSW9R?=
 =?utf-8?B?cTlaNE9TQkFnVlB1NERlUjQzaWloWGVIcitUeGYvZkxHQlZrUzA3MzgxTkJZ?=
 =?utf-8?Q?AQOJkkoDHI1dO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6682.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG92NHc3YmpXOERoQU9kblIrWmxvWTVMNlFBRFJXVWFSMmFheFROTVA1TVV1?=
 =?utf-8?B?TmtabjNQZXFPZ0VtNHJzNVJLU2lGV0g4Z3Nab0dQS1VCSWx2K2xoREFpb2s5?=
 =?utf-8?B?TEx6dWsvYWx6WjVyWE9neEhQbCt0UkdncHhUbHJoR25hQkxVb21vMHd1TWhO?=
 =?utf-8?B?OWhJRnlqQXZNN09OdzJJV1JmZkJwa3k0MDh2QzdjbzJLY1NqQzhEOTRpYSsw?=
 =?utf-8?B?aU5GUVRBVUZ6c1lFUEdlLzFUb0xMVnpxMTFwOGR3NHg4RmFyOFhRU1BDMXB4?=
 =?utf-8?B?MGI4cnVobThKNDNWUDJVd05nSm1Ic3o0UzRtZllZdm9Va2RCa0JmaTNZMkxV?=
 =?utf-8?B?MTJCeEMyYUZ5RG5SNE1lMngwV05Yci9NOUFpR3NCZ2lnUlVyTDhUUWc3L1Fx?=
 =?utf-8?B?ZnBzNCtJNmd5WVp2d3dPNll6Rm9SSTROSjBqSms0VEY3ZmFUUFpvZEROS0k3?=
 =?utf-8?B?NlVCNzF1dTVha3BSZHd2bEdqdGsvaFpqSStienhQWDJsTEJiZXMzT2tmUXd4?=
 =?utf-8?B?NUkrVnp1R3VNU1Axa1VlTk9zUnZhbWFCOTIyaUhKL0I1aENnQnRvajhRZmx6?=
 =?utf-8?B?WlNoQXFXc2E0bDBKLzY3dTlFOStSSXFNRDZ3eW9WTVdIR21oWjFReWQxVjNs?=
 =?utf-8?B?YS80U3pMcTNvcU9hekw1MnRPaHdsb2hHWWRsVTMySU5YaHdYb0ZGL1Y2c3FE?=
 =?utf-8?B?MDhra2w5Z0VKZXhWTjhTcVc4bk1RS1ZCSFUxQzBMcTRFWndFaXE0UCsyQ2Zl?=
 =?utf-8?B?dGk3ck5XUU1Xc2JpSVdwV1c5YklINmw0Wm5xWkw0cnhZOGJuaml1clVTc3ZG?=
 =?utf-8?B?U1pZcnZGcUg3Z2NaTWxBS1NBTGJVU3Rzc0xDNGJQS2pqRW44cGRFelpZbWVm?=
 =?utf-8?B?YnBlYmxOUTBmK2ZHTGMzYktUSGlKT2w5M1pBQnF5UGFreVZ6aHJMR3NEc0Yx?=
 =?utf-8?B?dC9LRTFaVDRQVUhWWVdWdnlrYWFRRGxXKzUwb3lXblNvM2RtKzZ1ejBhWExI?=
 =?utf-8?B?TzZpY2VtNW00cm5ybExqTDFRN2s4RTFTM3pwSTQ3cjFDL1J6SHo3VU9pZHIx?=
 =?utf-8?B?SmNmcE10aGROeW1PZ1ZHZ3IyZm1SVnFrdUt2RDhESkpHRnRtK2UzZDJvU3hh?=
 =?utf-8?B?U3phb0xZWFJyZDM0MVBsc2QwWVMxRm9scHVSeEppRjdrTGtzRXRNTUlyWEhN?=
 =?utf-8?B?ZUdYYURnYWJWVXhZN21NUFJuWndwRVREeFlNc0o0QXFFQTVFc2tjaVlLUFBr?=
 =?utf-8?B?TlRsK3JqTlRDdEVyekpvOU9RL0l1dk1ZeHV2NlROL2N1cndLYmU3M2JPR3B2?=
 =?utf-8?B?bWlFc2NDRzhac3U3d0VHT1ltVkV2Mlg5cDhsbEpKM2MvZ1h5NE9qbGNXVkRv?=
 =?utf-8?B?c2lpbVlWZEdreEIvZjRxRDZ5RVZkei95aC91Q2k4Y2daTjBTZGQ0MlBuUlJ3?=
 =?utf-8?B?NHVjTGtoOStVMEMydEVtN2tZZUw4NGp4U2RVSGFscmNBWVY3QS9hZTdWOU0r?=
 =?utf-8?B?MzJpYXdmSmJ0NDcrUTY2SHJVUDZkN3hJSS9iRGNmaXczeHNwRnE3UXNPc2Ji?=
 =?utf-8?B?VUtUT0ppaU0wTzRob0FkSUdSbEJXeE1mSUJZYjZWWG5hODlnNkgvQ3Nybkhq?=
 =?utf-8?B?RVRIVjl1WnJyTTUra0pjMlFUeWEvQzcyRjRsa1NzWXdOMVpiN0xIbjZTM0pk?=
 =?utf-8?B?S3JnSHB5b3lxb0lYOUx3YlE0TVdYZ1VyM1crbTlZTzFhZGMvYitYRHJ3NDFW?=
 =?utf-8?B?MWFrWDFKWlhNNG1ENXBxSHY2bjZJRk9GRzFYTWV4cHlsWHdiZDJ3eGEzTnZp?=
 =?utf-8?B?YmZUeFpwa1BtVE1yNkZncWRtWlZ5dE4zTE92U3dNWVZ2OVlkVnlJcmZ6ZUE5?=
 =?utf-8?B?TnZCVmRhK1kxVEN6UGFpNWFKNEVjZURZVS9pejE4ZG9qNWw5UG41TFl4NDVh?=
 =?utf-8?B?Njlxb3dMeDBnNVl0SW1pK0FvYzN1VGhrSmEycm04VXFKeHFZOG90K2M1NFEw?=
 =?utf-8?B?V2hpeFJUTm9XMklzdTd0bGZXYkVWQ0ZTV0pjMUVUd0M3RmtDSjI3TUpJbGFk?=
 =?utf-8?B?YWV2ZDM3MkFTTVFuVE82MlpvYWI0V0JNMmRFcGp5M3kzd0NQVlQwbStJN0Nx?=
 =?utf-8?B?SGE1TDhtZE8vRkZHZ3FZcUl6TEcvNFpJZnpSb3U2YXdDVWNndzR3eUladytJ?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa304af4-58cb-46c9-6357-08dd500ddf16
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 11:17:46.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq6xwKwpvDrWuZlfYLRldVaZhn70LXzfcq71jpeJ6xLorAQ9gRuQshcRwwr8CXF8RFhk12r1R0kkH3k6ypca/tbwZ6cHHMdQMUog8CBNg3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8075
X-OriginatorOrg: intel.com
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@pdp7.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: clarify
 priv->pause and pause module parameter
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/18/2025 11:24 AM, Russell King (Oracle) wrote:
> priv->pause corresponds with "pause_time" in the 802.3 specification,
> and is also called "pause_time" in the various MAC backends. For
> consistency, use the same name in the core stmmac code.
> 
> Clarify the units of the "pause" module parameter which sets up this
> struct member to indicate that it's in units of the pause_quanta
> defined by 802.3, which is 512 bit times.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index f05cae103d83..c602ace572b2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -283,7 +283,7 @@ struct stmmac_priv {
>   
>   	int speed;
>   	unsigned int flow_ctrl;
> -	unsigned int pause;
> +	unsigned int pause_time;
>   	struct mii_bus *mii;
>   
>   	struct phylink_config phylink_config;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fd8ca1524e43..c3a13bd8c9b3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -94,7 +94,7 @@ MODULE_PARM_DESC(flow_ctrl, "Flow control ability [on/off]");
>   
>   static int pause = PAUSE_TIME;
>   module_param(pause, int, 0644);
> -MODULE_PARM_DESC(pause, "Flow Control Pause Time");
> +MODULE_PARM_DESC(pause, "Flow Control Pause Time (units of 512 bit times)");
>   
>   #define TC_DEFAULT 64
>   static int tc = TC_DEFAULT;
> @@ -865,7 +865,7 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
>   	u32 tx_cnt = priv->plat->tx_queues_to_use;
>   
>   	stmmac_flow_ctrl(priv, priv->hw, duplex, priv->flow_ctrl,
> -			priv->pause, tx_cnt);
> +			 priv->pause_time, tx_cnt);
>   }
>   
>   static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> @@ -7404,7 +7404,7 @@ int stmmac_dvr_probe(struct device *device,
>   		return -ENOMEM;
>   
>   	stmmac_set_ethtool_ops(ndev);
> -	priv->pause = pause;
> +	priv->pause_time = pause;
>   	priv->plat = plat_dat;
>   	priv->ioaddr = res->addr;
>   	priv->dev->base_addr = (unsigned long)res->addr;

Reviewed-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
