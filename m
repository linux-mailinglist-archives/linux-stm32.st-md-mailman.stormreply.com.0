Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE29B0611
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 16:45:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA296C7801C;
	Fri, 25 Oct 2024 14:45:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D04AEC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729867536; x=1761403536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vApyV7a0Jjd38CgSzzLlHNeENO28Y+irSLko5ztD+iM=;
 b=O9xEVutb2S/tYcLGZEopBTNLJoLwCdoEQ+HBj7va9nQ31qkbzPWhicuz
 Zw7IuUWF2TxcBX0+Y3vPBwOLjW8vKoju6tTz8vrVHTcz/BZx9OUU6VzJu
 Jw2ERhs3U1jrKkwqHWCzkAaoM8rrvMtWDCgMwMM4Mpob8vwuf0NnCKlcx
 lkY6Dbm/tvbvfQ9Y7Cke+tAFtJ+7GiVpu459xWRRcJNrvVQKNCsWqiOw0
 dZa+P5aiidsp69gEstVun5RLgdLMLjdu/DSibNNbqy+hlGvR0l+Q+BYtY
 M6NRHlmr1RLPtrpfpjlufmzOiAFgSR3P07eNMhpZ8JV5oxVlj6J4g9B1+ w==;
X-CSE-ConnectionGUID: qREh/Pz5SuChG17v593d6g==
X-CSE-MsgGUID: 2a7kYg12TGaVdRgFA7y70A==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29757569"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29757569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 07:45:28 -0700
X-CSE-ConnectionGUID: YC2ubvqsQFW5HsUWn6sGcA==
X-CSE-MsgGUID: KLx/a7kGQLu6FfYDKSYN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="111743270"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 07:45:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 07:45:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 07:45:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 07:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTZXyElRtE3T4yrs/McE7/AH7yQV/rW372JhOjmDU82+8+zM8cguQ5YGifVj8PA9hkn9bi9lMKhOGicrQn4OUvvsQ0FZf4Oqc+WFihmEHCg9+zI1NE+m+M1V4xjdIofW896cMzoNRzi4+MzSVyioMkfWONHy2BsPg8+mpBVFeH9xr/O4oBmsh0xRnDAP0kZq6mXttmcKbCrF+CN78b7W9ukG4fP5/wrS+wdUxAbNJDhJ4e9vD/CIPehHhby9XIWCaAYLxtuf74gkficKkmASy+PJNU9RPgm8tqvwM4p/ST5u/Bcz0L36DLv0UbjnAvdhgl4vvywCepxQDT5wa8r7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGq1IF3uCOJBslqMa/NOsHiGWH5M/FHj3SLOZCFSYAY=;
 b=ul7PFpg/3rsZof5Eq1Rt304gCyhpvr3s2JQl0hLEi+loIAV2fSZ13dwwfZsKzUNF/OeuSAmLoPrmyk/PJbyw9IkF2GQTIzt+9ISGtonsHH0M1/ene9RiGm/+eIHznClMvluuGSycT9P/fnAxbqnxzjXSP7z7MPiMC5ghLjpcvr9KLTFvW9I1+4D9aERp4omyNBNrrltZOdX6oTfcOEb2qdQP/nV0dIxX5gkwTnL//ycorsVlFwidnsyWXV2nDsIvBoRMs9K1FMzyN5HpIHQJ6yNrftEC5WERWioXoeE5tCOgqxYwK1//+VZdVavdx92+C1iETHA0NzGwIstJAkFVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Fri, 25 Oct
 2024 14:45:21 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 14:45:21 +0000
Message-ID: <2b691bea-3b2a-469b-bf5f-5e80b9b9b9a8@intel.com>
Date: Fri, 25 Oct 2024 16:44:55 +0200
User-Agent: Mozilla Thunderbird
To: Inochi Amaoto <inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-4-inochiama@gmail.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20241025011000.244350-4-inochiama@gmail.com>
X-ClientProxiedBy: DU7P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::15) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: d64e2ee1-ac11-45eb-f59d-08dcf503a6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHgrS0NTTTB5aVRzZmp2YnB1UDZlZzhVZ2dFdm53dGU3ZVlld3l3UHErQzJW?=
 =?utf-8?B?andsNnoxU2FsV2t5d2VpTHNKekcvQ2phTExjdG5CQkUzd1Mxazc0dDJhZzY3?=
 =?utf-8?B?NGEwN25VSThaMll4cWd6a1VTbW9zMjBTZk13d3pYZ0lkT2lpSVBVRjl5VkNG?=
 =?utf-8?B?bFhTNkI2My94L0N2MVQ1cXZnTUZQVFN0WllTOE82aFVORUxzUDhudHNYUnpx?=
 =?utf-8?B?STRvOVhSbElNUlhrQmQrdXdCaFkrcW4waXhkQzM4dWlOazQ4TWRMNEswZFFP?=
 =?utf-8?B?QnB6QXIwZFBtS0hVOS9DVmJZbk4wSEd1amJBR2k3VnE0ays0cEpXTEtYNnRQ?=
 =?utf-8?B?T3VyNFkrV0dHcHdsYlBZMEk0SXI3aUIrSXhoOE1PdFdmbTJWaDZvWXZ2ZjBu?=
 =?utf-8?B?M1kzR2xvKzNpOU9STmk4R3FuTzI0bDBvSEgxS0JHZ3h5cjJYaG5FdG5mc3lv?=
 =?utf-8?B?MzZ5V0FBY2h1M1pXMVVaVytSZlV1MzlJZnhWR0RMdkdHOXJvU3BsdFRpOU9V?=
 =?utf-8?B?MGw1RW50NWM2SkMyWkxMSHNHc25rbUxCVXRvdExQMjR5NUhnSjJueCtPcDYx?=
 =?utf-8?B?WVJROWZCeUVZOHFDRGdNN0VvVWxhS1dFQmRlMStRR0VnREhCVGxVNUM0N2Qy?=
 =?utf-8?B?dVZ6MUt5S0Q4emdpdFEwa0x6eU5PbzRzeDNtTGk2Vk1NVmc3SmtzU2tLYm5M?=
 =?utf-8?B?c1kzRExaRDRvcHJpVkVhSFJHSVNKbFh5Z1FNMGpDYitkSUdKd25qUHB5S2Vk?=
 =?utf-8?B?M3hUdEI0YVRNVkx5RXhDZ2plckE0eEVyNXRvc2oyWHVIOWpPRjY1MCtTb2dC?=
 =?utf-8?B?Y0N1aTlKNTNSeS83ditaV284cVdRbFFOSkJ1WTJ5eC9CREZJcTVUekttaVN1?=
 =?utf-8?B?WTFueXpLMXBCQ2JhU21GNUp0N1Y3NHVUMHgxYVdCeDFHZWlERExlQUltbG1a?=
 =?utf-8?B?bGtaTy9lV1ltOG4ydStNRXF2azBDOHo3OHU1amEyRzlSMGV3ZVhia2cxelNn?=
 =?utf-8?B?ZjFjUEZpbHNBblRuSE9oSXQ3d092N1ZMSGJBTGxPZWJOV3JxWUdSWmJqcHgr?=
 =?utf-8?B?ZExCSjlsbElCd1h1UG5HV0VIOXgyN2dlV1llQitZbHNFeHN3NkJvbXlOeXoy?=
 =?utf-8?B?UWxBZzFyMk9aT09HcEZiaWxLcE9oTks4dXpDay9OVWJLRVZMbHBlaFVEa05M?=
 =?utf-8?B?WGVCYkZ3QTBiWFllNWl4eHMwTzJKQ0Q1aGZ4ei9QVEx6bmZjOEdYaEVlbDhy?=
 =?utf-8?B?b3Z0SXVKQnRZN3YrRlZkb1VrZGNSbWRvd1VWbFdmdjJDOTZaSVBjRVg3dU1o?=
 =?utf-8?B?WHk5aUdIc0dlclZGcEpSak43eGFHU0tUV2N3L2M4TGYrd3ArTERObEVtaWtx?=
 =?utf-8?B?Z1RwTmwxRkdDc0tNZTJ5eitxSXlEV0orbEJDeFZjWWxpL1NubkJHMkVTVmd3?=
 =?utf-8?B?TEZJdzdMSWliM0VwY2UzVDZYakRxbDBFZGU4clJBdFk2am5DTWp5YlREbEZ2?=
 =?utf-8?B?UUpQb1hFNVgyb3k5U3UydVVGTDIweUlqZTEydi9QcUwzU05oUDM2emVMQ1Jv?=
 =?utf-8?B?VkJYTTBxZkp4ZitYZExtQjBXVjVkbUpFeG53Y3liRDJ1dXBtOENOcUVmSW53?=
 =?utf-8?B?WjdIcDE5VGd4MU56UG55RTRNckN6dFN2VHF6VzB1NkR3SDRpK21INUpwMWM5?=
 =?utf-8?B?V1ZNK1ozWWI1d1A3YUdCdlZNYlNBUk0wbWxmdVJvTmF6cmFFaFNoRjNiNDR6?=
 =?utf-8?Q?skwEpqIY6Nb1mmj2q0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHV4MWNmTURTdzFWZ3BzL1ZpbWNCb0liWkFJaVFGZGozdUQvWENNZG9aTTA1?=
 =?utf-8?B?VWlkNFhzbzE3RHdIVEdaeDBQaEZ3TzE1SEhMbUlnMFdxTFBka0RwOFJ6REl6?=
 =?utf-8?B?YmZiODkzb3d5Z1l3ektqRGRmbWxqNTJSM0RRcDlrSUhUaGh1a1BNcnpjRzk0?=
 =?utf-8?B?Skg3Q2dDWFdaMWNpcTRVMTMvQys5NjAveGdiUWZEZXlVRCtZbklKOE5Uakt0?=
 =?utf-8?B?bjVIVXplU2tPcFRxNElZZTJISFVJdXowejFEWnpBaDNsNTB2eDlMSGRGMU9Z?=
 =?utf-8?B?K251M0FxZVlUbGF3RDZ1V3hRdG5xdVg1TkdGdzhRU3pZSU1QME9TWElzWENR?=
 =?utf-8?B?QXMyRjJtVEpEcXMrVzkyc0xGejBUbHBIUFRuYTV1anlubldVVzFLKy9hN0dk?=
 =?utf-8?B?S3hvdVI5M2RzTnNuSCsrcUtxVDU0YmV0VmlSTlRIV1F5STRaakVxTEtGeVFC?=
 =?utf-8?B?ZFhUNGRnNEZyM2FIaE50cW55bjcwRW5hdjlaenB2TmVVVmwyKzlwbTRMOWh4?=
 =?utf-8?B?YnVnQXk2ZFF0UFBVSjlQYjNsWlBLeWtObGs2a3RONk1BeDA0UjFzM2ZGcERw?=
 =?utf-8?B?b29ZQ0FncTdhUG5XNUxxUGlUTGNxZnJWemxBQm1lTjN0NkdTM1BNcDZ2OVJ4?=
 =?utf-8?B?bVRqNlFBa096ZVhPTXFqdkpIZEFBTnVXa040aTFURUVSM25iUjhXaG5zTjUx?=
 =?utf-8?B?NWNRUXlRVTlmWFRtM3FNNk9DRU9teGRmci9PL1ZYWWRqQUlSeitUS2o4SlYz?=
 =?utf-8?B?MEpobmlYenAwRjNESzZRWnFpYnNCK1FXOTBlRktYRm43NUNOVXNsZHhtK1pI?=
 =?utf-8?B?RjV6V1lzSFM4dUVqTlZ4SzZLL1R5ZTFacG9mdHBzUHJ0SVdmQW00ZkpaZEds?=
 =?utf-8?B?VUVTekEvYWxZYWE4cXBuRFhITkprdFdYM3lTNW5obGZ1dzF2dnJUOER4dVh3?=
 =?utf-8?B?c1AyTzlMakFnMmkwajMzMXpzZlhLQm9Md2ZGNnlkSFMxd3Z0b1JEM2xVNUVk?=
 =?utf-8?B?MTFjQlhLWVliTDl5aTlHK1gxejI1RktDM0Q1QXFzTWRuS05yR0NUWHRleFVQ?=
 =?utf-8?B?NWM3cnRxdUIzQk5XeEVrczQ5K2FvWWQ5R1lRQUk1SDExTGFldEFRUUZZd3Uw?=
 =?utf-8?B?OUo1cStNa2xpdkEwK2J3REM5dWwyOUFKZllwTncxYzQvMksyK0JkaHZnNHRL?=
 =?utf-8?B?MXBZaHVUdEkwNEEyM0crVjNjSEZRajVHSmV6UWZ2aUMrTjB4MjBIaDRqK28v?=
 =?utf-8?B?U016TTBjSHdjc2JJQlY2QldYdUhVbk5qT09KTEl2VDFXMEtSakZpeWZpbW1Q?=
 =?utf-8?B?SmpJNnpneERabmNvRFNhVmVTTTI5SkxJWlZUbmwwVU90U1BCRzRaZnQ4STd0?=
 =?utf-8?B?cW5SY1Q1RjVxK1U2cmN0TmJmQXJLd3RlVjQ3MnlnNjlWQlJsdnp0MzBuRUhr?=
 =?utf-8?B?UHMvcW5uRnhCK2lxcG1xWVJrT28xMnZtWHZUVHVLT3AzNm8wdWZacDVQZUtu?=
 =?utf-8?B?UlhaT3NKbWhYRGtqZHVyZjkvNERCcDloVTkweEFpNnV3TDFuM2M1OW5qcEJz?=
 =?utf-8?B?UWZ4eDVCQUlQa0YyNy9sWkVqd1ZidHVkbTUrV1E2dnVhM25aSERGYlhLWEJ2?=
 =?utf-8?B?WlI1UGEyNjd1NDBCcFovMnVvQ0hKRHU4TmhDNXN1WTMxMWFvTGdZU2cxdkVE?=
 =?utf-8?B?dlkvdkgyVjQvOGNUb05IM3NpRmhvK0VYQmxyNDZwZUJQWDVjdHJWVjJGdnda?=
 =?utf-8?B?L0hrUTlEMytrdEh4dTgrSHVsMTVLN2lWRTNHNzhVbUMrQXBqbjhzUHhLYU1v?=
 =?utf-8?B?L0ZFaTNQR0poVmt5YVk4UTFreWZidmhVYW5qSXB3Y1ZaU3h6czdFeWpWUHB6?=
 =?utf-8?B?YVBJbnJIMUlHa25VM1V5VDVoUjR0eFJmVzhOYUdLTDBoditlbnZSNHdHejFt?=
 =?utf-8?B?UmExeXF3TUtJTXVlVk96VUticGRzM3FpSVBnb1JWNlhzUTdMRzNjSHFWQkwr?=
 =?utf-8?B?WXk5cVMwWWJpMzhrTCt1MjVOMmNXbjFpenY3bGZ6eitmaHlwTk85anNDb2Jn?=
 =?utf-8?B?ZWh4aFVBNW1MajZmcnFCUDFDSHJhb3EzZGdrd083MG53bitrNzY4YXIrZGtn?=
 =?utf-8?B?QTZMdW1WL0xhcldkZ3FPeHRXSkhtZ1VTR3laNzlIKzl1Z0tkWnZoYm9wMU5Y?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d64e2ee1-ac11-45eb-f59d-08dcf503a6ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:45:21.2893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXDzstZihVBcOsm5aRx0HGKSy/XWnai0Jcs/mLvvRakYNLuHnqVTs0jJjj7prVSGdHae/mUsU15FKoQ4l7KFbnwcRy8eWyIDCyy57eyevSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-OriginatorOrg: intel.com
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Rob
 Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor
 Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Richard
 Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 3/4] net: stmmac: platform: Add snps,
 dwmac-5.30a IP compatible string
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

From: Inochi Amaoto <inochiama@gmail.com>
Date: Fri, 25 Oct 2024 09:09:59 +0800

> Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> to define some platform data in the glue layer.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..3c4e78b10dd6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
>  	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
>  	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> -	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
> +	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
> +	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {

Please convert this to a const char * const [] table with all these
strings + one of_device_compatible_match().

>  		plat->has_gmac4 = 1;
>  		plat->has_gmac = 0;
>  		plat->pmt = 1;

Thanks,
Olek
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
