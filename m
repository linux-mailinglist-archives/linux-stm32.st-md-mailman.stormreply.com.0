Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA49F7D00
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 15:21:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33A84C6DD9F;
	Thu, 19 Dec 2024 14:21:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB7F8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734618070; x=1766154070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8NnTjY8u1mMKYvtVA/VPsKfrh//lhrRqrd5DWc2VzxM=;
 b=YPaVTeaAgxqGEmAF+dBYBZqHWqqjbup3SO1oyxxL9Nwj93/r3BmABFOB
 LnOCSmVtORwHfeYlODChMJhOZHHu2vG519AwN25LLp67MLqY+CQdl0XWe
 HO8q7IcbUTX+Psc26CK4hz5oeq6NFCuHIfy79wfVPpi5PqrPc3tbyu7Wt
 B7GqAhlR1T6aydoCcjid0MtnYiZJwhZZN2zIh+S9CQFEMahwPCLmP5A16
 S+sy107oL7thCzWV2OFv5J6dNj7ovtjxqLWXmWicMx7zhyteGIgopEtU8
 F1eDROm8EAN0r6OZQoCwAOtJHRJsrLgwxW2RmdZKQqo0TLEbo1alB/CmN g==;
X-CSE-ConnectionGUID: qcbzpkbfQtmMp0k0BMBH1Q==
X-CSE-MsgGUID: AibWGEoSTjeQB4nJkVF9sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="37970529"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="37970529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 06:21:01 -0800
X-CSE-ConnectionGUID: iX++/BDbRV+lQ5oBbhJxnQ==
X-CSE-MsgGUID: TmiaTZh2QlGR1R83mnEl5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="103189039"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 06:21:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 06:21:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 06:21:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 06:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLgE3pailSxUplIj8l3S2i6Boq2/yf7yENYUs9IaL30PFl8pmKOdGBePcw7rWe1VhpeZtX+adTwDiypmCLawLgjraFjjCCMFdOFZ+JaFpyun/0pnI9FIal8Z7nkuUWlzQlkd3RNGaeIgjpm1FfINYXIeOkan7LaUXabzxjgRF+Hes6tm6z3UglWjAgVOpg5rwUql+tncgeBVogQujQqeho6Bi7ZtnWYCeRWtrG+QBjz6WNnvbEXk8z7WX/Li6lp+Bsfee+MQlPz1V658SlUgfvQA7NcBjQk+39SJs2Fh931TcPzOGyBgEXCACOnPrbBAQ//PqU+vZKWl7RAYzZt6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlTyMsUzoJuvxvsAhQ0KAKrURcI1SFnOecTKiVBoWZo=;
 b=DWcqOmyTeyZ1os1GIb1aZ5qCzYWLGn6IWuMkeWwaA1UnstottzjvboPTE4KAt3xhr6NcO0VQ52TDyqUMwSH+0Og+icQX4F7f5sIbcfbM+1AmQbuCZ88dks8HLzz6Vc+VU5dsC2db+rL9imUOzofMSlx1cua0BQBQiuPSOvPQv4Vk7/TToCp7S6zO0aQXDs3BE6QkzbKnWYSlp/wAR70VRZ90fjLzq/qeM2tvmT74dR0xfAs7FSd9tOjM9nqRyfj6TcvULBI/HQbAzlHcyE1swuU6ikNupOryhXAZMtokd7Vxg3pzIfz8DAINj9xQ2gdZ51pQ51b4hj/iE0xp9HlxAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 14:20:45 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:20:45 +0000
Message-ID: <0c349cfa-909f-4c91-90df-8e56d93a7ce1@intel.com>
Date: Thu, 19 Dec 2024 15:20:06 +0100
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20241218083407.390509-1-0x1207@gmail.com>
 <b2ae6b80-83e3-4b22-8301-c91569c89494@intel.com>
 <20241218164206.437fcedc@kernel.org>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20241218164206.437fcedc@kernel.org>
X-ClientProxiedBy: VI1PR07CA0232.eurprd07.prod.outlook.com
 (2603:10a6:802:58::35) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 283d6e92-da5b-42de-bffb-08dd203853c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzNHSEsrelNiUjgveHNEd0NUbU1TTWJWeU5NdHNENGVnVEc3K1N2dmV6dVVH?=
 =?utf-8?B?a1I4bW85TXlCY1pZVUI3a0FYdy9WQmoxUWdHWG40QjMrOW16QWF4RXZrZVdM?=
 =?utf-8?B?eHNBSnJXajNMQ0JRVEJKWGJqQjFQdFBmN2pGanBENGlxbEZxaXpmVm5NemNX?=
 =?utf-8?B?QWhsaCtodnBRMWxwdVJNRHVBUDNkNllwQjAySXdxQlNXbjRobTVRVmVITVI5?=
 =?utf-8?B?RktXSUhxQUJZYjIxRTFVaXErUyt1dkU5MmQ2TWNnUStzc0FkdmF1Ny8yR0hy?=
 =?utf-8?B?R1lsZmF0TkR5ay83Wi8xMERxMTc3UTFURENNYkpiTFRnZE14ODFlYUpPaUtl?=
 =?utf-8?B?RjF0QUJpcmNDSmJXaXlCQ01WT21ZTnpENC9xVEpVck5pVERBczdrS25GS0kz?=
 =?utf-8?B?OUJ5ZUlvWGFocjFxRkt1cmdqa3ZxbnFTb2k1YXkrQUFMajROcmIyaWJweWRu?=
 =?utf-8?B?bWdTWmdYMWtpeWd6MFFvOFVpRkplVGR3Yi9BeC83dmQvekxta1pId2dQT0JS?=
 =?utf-8?B?RWlqR2ViUkNSUDQ5TitsMXZUM0pQbkxBVm1nQ0U1N1RhVUxRV2ppNUtwcWFy?=
 =?utf-8?B?RDF6WHAzYVg3cGh3eHlVTnNJcmFSczhGM1B1UU1sZFlXcG9EUngxSFZraysy?=
 =?utf-8?B?YWpWdWFCS1hvQ0xqN0plT0hzUTE3NmNtMG9wMDllVUlRaVAyeDYvSURPMWh5?=
 =?utf-8?B?VHIzVTdXSGtlQVhkN3JMSFZBdVFMM1VUcnkrbmxPaFdwLy95R0NjN3RJS3g4?=
 =?utf-8?B?MXkvdUNRdkFTMWRaOXNPMnlYQnowU1pnUHhiMlF4NFJPU2tVVUdROGVSZCtU?=
 =?utf-8?B?WVMxZURjMFFqSWI1VkJkdFo0d1Q1eVlmTjZrZTVXSWJiSlN6QW1mdXlPV1B6?=
 =?utf-8?B?K3Q5djVGTW00clI0cERYMlgwemZpTFNwWDNzNEg5UmFKdHEzL3JIbDEyTjNr?=
 =?utf-8?B?VVpEU2MrOVdyM2tIVGJIc3MzT3F1eXNvSHZXTUdXNjB5YjJZQnVYci9pMDJO?=
 =?utf-8?B?eXNQQko0SEd3S2JScDM5NC9WL0oxVWxETSttRyswTXhUUTE3QnlGWTVYeFVC?=
 =?utf-8?B?Y3lrNFZEYjhoNmMxR1JOOE5WSFhnN3BwOEtxY0cyWmhTMnV2ZWxqbnNCOW54?=
 =?utf-8?B?U3NTVkxJWThjL09sWG9rei9FeklndktUeXkwMkx3YVVucmlyMlB1ZDQ4K0gy?=
 =?utf-8?B?d1BrRzFha0xFLzJCVjJKRUkrUXZSU093aHFmdWdSa1h6enNVWU1MQnJPQzZI?=
 =?utf-8?B?ZG1YdnhvTUJ3dHpwU05sQk0xS25jTnRkWlhYaVBNWStoM3gvZVZsMjJZa1Rj?=
 =?utf-8?B?Ym9nYjFicURXUkxnalNvWDRLUUgxZTRKQVFCZnNzRVpIQ3BRajFNZ0tMWkFn?=
 =?utf-8?B?ck9iYm93YTNXVmFjV3VNaTZvYkpNNU1Kb2JQMnoxaFdyamJNZXIra1hXN0Fv?=
 =?utf-8?B?dk0yR3lmanJ1QW1kS2ZHeGY3NHZ2WmEyejZHSjFyQnF4REpiazhRZ3JmNDhV?=
 =?utf-8?B?U1ZFaHRNdFRJZGdRY3JXR0lWMHJJVysvc0VSaGRRNjJ0dm10L1I2YitSMzRl?=
 =?utf-8?B?RUgzaTdneER5SnI3bGZFR3JZbHhSY1dkS2t3SDZRTm9rMjZra3Axajk1T01Y?=
 =?utf-8?B?UkE5MmR0bHVVRUVJSTlQZ3NMeVlUaGhsZW9oUWhuUG9RaHpjZU9iYTNmYnNr?=
 =?utf-8?B?c0tPS0NKUktIMXIzQVgxeFpvcy9MRVpKU2xzZTdvWnBGN3N1NjRrNXVydzlO?=
 =?utf-8?B?NDFjamhYNUxlOTFnVy82NktydG1sTVE2Rytra056amZyc1kwQ3RJNDNlOW4z?=
 =?utf-8?B?UUN6MURYUkFjdlB1WVVndFlmaFZuRy9IaEJPRzh6TnBXT0I0aW5DNFFFMnRC?=
 =?utf-8?Q?RbXmTsPOjBgI0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2NtNVh4TnpZek42dTJlLzBjdjhubjRIdWVyWWFvbHZqNzQ4cU10Z1dlVlRI?=
 =?utf-8?B?NENKNHpwMThTbjR2Rjg3b3hvYnNxVitDWm1kMG5vTWZ3b0xVZ1I3Vi8yMEhP?=
 =?utf-8?B?QXo5MmE0dXpNTnRPTkFmVVNJMTZwNTBVSEpvcDdLdlJGTFhhcGg3QVZtQzRG?=
 =?utf-8?B?YmxUNzFaNllUYlhUUFJobFJLUXRZaXhmWVg1b2UrVlJ6eUw0Ui9WZjlEQW1F?=
 =?utf-8?B?UjdTdSs2d0tEQ1ZkbG5naDEvWUl1YkhsSkFLVThIbGJxekFOaXhEcHFHU1d2?=
 =?utf-8?B?WENzdGJENkFEZm5sN3dZdVcyU01DYUs1eENVS2pNOC9JanVNZFdHd0h4UERi?=
 =?utf-8?B?SktlVkVNT0tlVTd1cG11Q2x5ejAycUt1RWlTaVpMVXl6cjBZbWZad1NFb004?=
 =?utf-8?B?ZVZVMTVmVXMrVVV0UDRXaXpuRFpBaCtqM09ETUZTK09yWHJNT3dRMWtJdGt5?=
 =?utf-8?B?eHNsNjhsdEszNGp4OXhGbTFWaTNUVisyUy9CcllLTk00cWhJaTJLRFNSRmZz?=
 =?utf-8?B?UWNqUWZMckdHL0EwVEpLYXZ5VXFNdlp1V2VCMnREVVBTdXpEMXl1SDBzMzlO?=
 =?utf-8?B?d2lZbWtRZGNRalhEOUxBaGhMaU1FY1FybGIvR0VhNlpGeG8xTXNzVVp2RFVE?=
 =?utf-8?B?SmM4SXp2QklsZ2VDaURQbU15YVpxQmloeVlDdHEwK0FtM1pJeEp6NVRnVmU1?=
 =?utf-8?B?S1Bvb0ZSVmgvOXNrQm4yazZuNXdha2VOZDFRVHFuRzNmSE1EQWNYVCtiYnlN?=
 =?utf-8?B?S1lKZU1ockpGMUFyK2pnbjVFQTBGTnFmaFBsUVFzL3BuQlNUdUJLSzhLcU55?=
 =?utf-8?B?OG4xSEd2aDdid3RVeWFVRUFvb2YycGFHaTdYRG55NERMVkVTbVp0K21yWmc0?=
 =?utf-8?B?b3lycUJhQzIxdHp1UWFTSUY4Y1ZHUEREeHVzQnRpQ0dwR3NYbmlqdDVvc3pY?=
 =?utf-8?B?bHZrZGVKOFI5ZVZab2RuanZMR05KblZ6enJXY1I5WThLZVlXQTh6dVFFUXNC?=
 =?utf-8?B?U1BBK09XczF1enpjc1c2Mm1Yd2tzeSsrSGhGZjEzczE5K042M3NtbGExSXNQ?=
 =?utf-8?B?cmQzYnRnMlFIQytUd0hCRGpaOXg0K0JwSnZ4bzFEL3VPRU9hVTJxYlBjb0xY?=
 =?utf-8?B?Nmx4RE9LNWtlNlhpWmZDTVl5MDdSS1MrYTcwZjVhYWJEQVdPWEJHV3hnWGt2?=
 =?utf-8?B?dFdESUw5V3lIOE1sRmpXSDZueGFnWVAzZHlMSjRqMGxPWGJoUnpqM0N0MkhK?=
 =?utf-8?B?RTE4ZU1FUldYMDBRendmUjFvQmU4eXFnTllrRzhZU0lnS0o0UnhQcWFicEJI?=
 =?utf-8?B?VkFQMFRGQ2tyTGdNc1JoRy8xYlNvcjd0Smw3MVp2N1l3TFlSRXdIb251UEh0?=
 =?utf-8?B?OEx3NlQwZ0Z3MDc1RFRjcE9rVDUxMlQ5Z3FIek9iaHEvcXBQVDF1c0tWNlNT?=
 =?utf-8?B?Zjc0QnpTcXYrNjJ4VENpNUJZTkZjU2VYbzRLQVVPdUsvbms3MG0ycGpRK1Rt?=
 =?utf-8?B?ZDZxYjc0Rnh0dWdxdjNDN0xQaXV0SmNMNFFQVVZ5UDh3Y0NGRGthaVk3MUlh?=
 =?utf-8?B?dTNOQXVRemk0WUFrVnZJak9rOGpNU2E5bUxFdmJ6VUg5NzQrTStMYThIL1dP?=
 =?utf-8?B?bGUvU1Z3Y2lqR2tMRXVZWGFPWEZhbDA2Z2lvZU56THNmQmtxdFdSNnBaeGF6?=
 =?utf-8?B?TlVGanI1NW1SRHJqait3YWNlZDk3eU1JVjBVU1BSdUtyOXJhZk5jK3FBT3dC?=
 =?utf-8?B?UXI2cTl4bVBrMVo5akppRnNOS3FUSHdBUWxKdXI4am9lbU5WaVlLV21CT1FJ?=
 =?utf-8?B?RFFaUFMyTWZwRDA5b2p6T3I4dkpVTnlZeXowVGg5NFB1V0dLc3Rxdm8yOG1T?=
 =?utf-8?B?WkF5Yy85RzViM0Nhc05RUmJncHZydGN1UGQ0dFlYTGh4VFl6MUQ4bEJxZm9I?=
 =?utf-8?B?d1o1TTZhemtGOGgwRTlCOUdGMnd2T016QTl6c09CQ2Y2RVI1TG9HVVBFdE4r?=
 =?utf-8?B?WjZjODZ1V0ZmYi92TGpBTnRNbkducTliZi9uWmRJcFNocTdNVWI1bXgwNmZL?=
 =?utf-8?B?dVZMYWZjU1JRSk53SWJvSDFmUXU2K201eUhmK1MrYWZqRmNoZWNzZittSFdK?=
 =?utf-8?B?ajd1bXVyZk1Gd2FNSjhnbzM5RzF0eDQxSE5GWUlFL0Q4SzFRODdrdTJIb1ht?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 283d6e92-da5b-42de-bffb-08dd203853c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:20:45.5164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq08yUIArJljsmLE4H97p2j/+8WhOiqKr0oYewKREUVCwjxgOye2Rbn2p2JrrGxaEk4xpGCuoXoh8EnjyC1uZYlxhNQsdVcIKdN90JIHfm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-OriginatorOrg: intel.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop useless
 code related to ethtool rx-copybreak
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

From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 18 Dec 2024 16:42:06 -0800

> On Wed, 18 Dec 2024 16:48:38 +0100 Alexander Lobakin wrote:
>> If sizeof(dma_addr_t) == 8, you're clearly introducing a 4-byte hole
>> here. Perhaps you could reshuffle the struct a bit to avoid this.
>>
>> It's always good to inspect the .kos with pahole after modifying
>> structures to make sure there are no regressions.
> 
> Pretty off topic but I have a dumb question - how do you dump a struct
> with pahole using debug info or BTF from a random .ko?
> Ever since pahole got converted to BTF modules stopped working for me :S

Hmm...

I have this

CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZSTD=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y

CONFIG_PAHOLE_VERSION=127
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y

enabled in .config, then I just do

$ pahole path/to/module.ko | less

and search for the struct :D

My pahole is korg Git HEAD.

> I never cared enough to check as most interesting stuff is built-in
> in Meta's kernels but it annoys me every now and then..

Thanks,
Olek
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
