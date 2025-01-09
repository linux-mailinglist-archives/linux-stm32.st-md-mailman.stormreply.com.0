Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5CFA06EAB
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 08:09:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF47C78F67;
	Thu,  9 Jan 2025 07:09:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3392BC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736406557; x=1767942557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/H7Rze+eXUO+H341iUhtD0mzZNh0AiyRKCgr5Fwxc1c=;
 b=jq8nl0WMNFdBRrRurstRz0HZtj9S89szvKWZXrUawS8vEf3J+KK3htAj
 qLZfWPPQDRfft4uq92lOAFvuX6ZqyxQIm3zZpMwsFWIUu21k+tT4nNJlV
 GlXtcCJn74LQMGuZeUfA/lBDX/jADdlV4148DHmbIMiEHmLygyc0KsQj2
 WOkeAgEGRMsJYZNA/71iig6R2nfVUE1ffktSbpXHJvuCQGP3RwXu6iPIv
 KRnuAyJ09RmV4KIH7v+ZIrxWrgEIhzL9WPYuMW7jwKF8oubFSa9qwycjP
 iGnq7BKUNwb/hTgAUOORwd4kNwwnxoe1sgSf/s17aZE/VH1Kw/nQU5gtV g==;
X-CSE-ConnectionGUID: oTcbyDK9SU6oRlu37Gl7sw==
X-CSE-MsgGUID: lim9y+nLQT2on396MtCbxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="62030701"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="62030701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 23:09:08 -0800
X-CSE-ConnectionGUID: RP6m90kaTyGyLoAMTAfwtg==
X-CSE-MsgGUID: mjHR1SZNRGq+Egz7ejufqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140636466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 23:09:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 23:09:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 23:09:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 23:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwdc5dMmK0oxWVat8oJ626kwN99FJaefP9ji1VTyL36rZmKVN7LIgTcwMwvPXwrgfcxPoh1EIZ4GVJHTH9llMn6jnsOpbi07U8MmKtq5j9MLYyZeMXZ3+y8Bxv6YDjrbuQnIlUQ3iYOlZvVQQh7bvHySfkoTivKQN13S4kYe7ruvE9Z7eyWmPgc6DqCpzxC8dTh6UoTcvDvWlTbXFYu7n5K5j09qf4GF6eOLGUSKJj/16f91OL5jlp6RCixiV9Di9sWB8cEPO2AAWw8Ktlwmmuitqt8KGRE0TeUXzqBuogHm1I5fr+8mV1Q4vAvA/I2df2gsUa13IJsmEsa/MWXwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H7Rze+eXUO+H341iUhtD0mzZNh0AiyRKCgr5Fwxc1c=;
 b=jcyJJ+iC+r295QjWtXrcEaPdwSzCZMJ6FY6wLpXGllxIcr3iWL1t2eS9zDzcTVug7Sy1rviqIAracpfqNnc+glzrxE3Y7g74QBcUsIX0Hk5IRta+2svE8+1k0GXqHP/ZDGc98ATzYL7hu7VL/FV0M85EiAMdqPFCTXuJ2t+LdquZH/cLoUBpeh/HUuN6EWgwQaDaCJa2gtESmSN7KVAgjoDAzzvDQ3TD7wpzZGZlsYOb3YYlfTzH+8rQ5yvJdPS8Bu9CerTXluIxvdIBERL5fceaX7suyjyKXvg71QN7m2cNj4kZ0dfP/g/Ji/1CJVAmkW577M5eCkZQuGqOF2pg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 07:08:32 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:08:32 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Thread-Topic: [PATCH bpf-next v4 2/4] selftests/bpf: Add Launch Time request
 to xdp_hw_metadata
Thread-Index: AQHbYELePEInRYShVkCncb9Fi5UHZbMLifmAgAJ/iiA=
Date: Thu, 9 Jan 2025 07:08:32 +0000
Message-ID: <PH0PR11MB58308DE8330F4CDE6A954534D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20250106135638.9719-1-yoong.siang.song@intel.com>
 <Z31c_3j9MEP7Z3bd@mini-arch>
In-Reply-To: <Z31c_3j9MEP7Z3bd@mini-arch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|DS0PR11MB7969:EE_
x-ms-office365-filtering-correlation-id: 740d040f-b6e0-4542-1bd0-08dd307c6d3c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZlRtZWhpQmVIMHVTTlgwaHZYOExQZ2N6WTVaTzgwMHIvckxzNERqaXFZbUlI?=
 =?utf-8?B?dmhldGY4WFhuOFRpREhOT3NFcURmU0ZJNzU0ODYvQ1dUY3VCWGRMYUNsMG15?=
 =?utf-8?B?L0xPK0tINlU5ek9xdjBYMGtBRlhTOFk3YkpRakh4R0lKdnRVRWR1WWwwdG96?=
 =?utf-8?B?eEZBM3FQT0JlVGpycEw0TGEzS0lPd2RacUdUeEczMzh6RlB5N0ZIcFFxem5T?=
 =?utf-8?B?SUp6ZVZQcXFhUHYzVEJsVVgxWEZ2N0tWTWd2M2dQWlA3ZGYxYzFzL3N4SmVB?=
 =?utf-8?B?WEoyTlpJY0RYSU8xa1QvTTZXNGpCQXA4dVJJS1N1MGZpa2xFMVJqWkh1a2NX?=
 =?utf-8?B?M0dzckw4eU8zenQ4TGVtZGpTRXhnU1lPTmFqaWl3bDlMbTBCM0hCcVdEU3o1?=
 =?utf-8?B?eHIyTENBNjlrWldYNWhaY1JLdFpMVkQ3YjFoVnhpbEdVbTk0N2FnVmZoZHUr?=
 =?utf-8?B?MklhU0d4RVpXc2NQRHBPeG9jYVkreWFJY2k2QlFuWWRYbW5VbFRDbnBSQVY0?=
 =?utf-8?B?eEdmbEJFL0thWS9SQWVMVWFWaTFiNnQvSlRuOUltMjYyN3pvRVJQZjJVcHU2?=
 =?utf-8?B?bEJJSjdwOGxiTllnd3crZlVQckZyNW41S2xxbERsMFF1S2VmZXd4N3RKb1dP?=
 =?utf-8?B?eDBCcUQrckxDYUViUDcrd3AwV1NXZG1DZUdkWlJ2ZWpDa3dsN3lEZSsxbHF0?=
 =?utf-8?B?djY0YTJiQnBzZy9vUm03NlViVG5aUGdsczRyVysyYTUwa0ZweFRuWHA2dnp1?=
 =?utf-8?B?OGtrTnBYQlpVMHZqTUZlWWR1R3RGb2dzMTlEcW5aSy9DdjhWU1hCTm9TLzJK?=
 =?utf-8?B?aytyODB6V2t6SzFlUFRpQmk4Ykc3UWdaWFdEbHR3bHJTVGxuNmZ5bk5jcmNG?=
 =?utf-8?B?MmVmMVZDZTJFaEJyRnF2MEpGdEYxY1dWWFcrY0ZUR0tSWTI5U2FOYzdsL3N1?=
 =?utf-8?B?TjAvSTFTVWdmZHhJL1lxbHJ1OWF0TnZ5aWE3aTlvRzJMYmxEakFqVVAwLzdO?=
 =?utf-8?B?WFpLWWRVQ3pJclFPSFBlSVU3Rmp1ZTZzYWQ5QkVOOVYrZkJtNFJ0SWxZRlFp?=
 =?utf-8?B?ajczQ04zVDdwVFBUbkRtMzcvTTZ3OEgwNWx3RlNMaFlIaTZ3T1ZNQWwzRUVM?=
 =?utf-8?B?STg5aUoxelBZU0ZQWGRUY1I3QytPbzNqVTlaV3FCWnAwWUxKZmdiQTBhTXpB?=
 =?utf-8?B?RGFYcDYveWYzdmNpUjY3cGJyYThHY2RaQURzMXh5TDR5ZWkvTXlKQTBsVGhX?=
 =?utf-8?B?RHRhK2Mzc1BacVZxWXJjR096UXBVKzhFemlBME92N25YWlF6b0F5YVZXTG9K?=
 =?utf-8?B?S0FIMUFwcktIRDA4Y1JXMmhsVU56N3R2RVllVTdZbGh0NEN5dHo5RWNPQzVh?=
 =?utf-8?B?d1lVaTZJczhjblo1K3hlN1FxMFQ2ZkNqeHNHd2g5bzR4Q2tUS09MZ243VkZj?=
 =?utf-8?B?TkpFdXVMemcxTGgrQk9FMmxrRzRaNWlOMXZWUWlwNTBJQ2lvUkhxdFJiRVRK?=
 =?utf-8?B?ZmlISWVyNWhseGk4VGRURGJyTFovNkhkVncxNEpwdUdpSFdBNDBTZXh2VGZs?=
 =?utf-8?B?Z2JsQmp5ZnpGWFRONjBCRjFkUmN6bmN6Z0Fid1QwTDJJU1o2WWsrMmdiRkJJ?=
 =?utf-8?B?NXprQmdsa2VLTmRXalpLU3cxb2tiTzF2NHlXdjZpMXo3ZFZrd0NIbVl5bGpq?=
 =?utf-8?B?VmRLSE13cGNpTjN1aHpZdUhCN1ZVNVBlS2g4Y08wY2Q1K2VPakswY1hIMUZF?=
 =?utf-8?B?U2RFRElVSEZSUy93ZGpHNjRoZnljVVNvdkRuNm1lbm1HbzRJZ0hJV3FZVk1k?=
 =?utf-8?B?Z3ZvMTlYcis2b3NET1BvaStxdjV6Vm5CdENaVTYwSEZ4N2VLTWdRNVNNekdU?=
 =?utf-8?B?aldLU2FGelNScDNYNFF6b1RyOVVvMUkyVEtaZzhJNlAyMG9MTHY1cHo1MjRp?=
 =?utf-8?Q?Zznoh2BgLmpDRdlUDej8eSTXmzb2o8yE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmM0NkUwTkgvOC9wNUZKSlowV3A4MDZpdFpueTRuRkgrV05QM25MajVNT2FP?=
 =?utf-8?B?ZHVUZFdUSFdLbmlhckthbW54V3lZbFVWZU9IajhNRU5aU0xMNHM2cGN4RzJo?=
 =?utf-8?B?OEZJWVloY0sxL21wTGsyZUY5Yk1nL3NuU2MwbHRZSXliSjEwc0ptMnFGT3lo?=
 =?utf-8?B?MjU3RVZJaFkzLzFPQi9OTVE5VmI2QWNhVVJ5MTdJdG50dWV6elpIYkMzK2tw?=
 =?utf-8?B?WklMeWdNbjYvSHZXanY1bTc1WWpYVkxrV2VBYkFaaDhQN2hXK1ZrQ3VxNS9J?=
 =?utf-8?B?N1ZtcXJpZ0RkeC9GaCtXcDJMZk93SzhVMDlBcXEvb3BGczJRK2xURXFvWTda?=
 =?utf-8?B?S1hZcisxTDZMOEVad1ZRQ2tkc0FWdzBhWUw2Q2FTbjNnV3F1QVN5K2F3V09n?=
 =?utf-8?B?Y3hRR2dUSFZnanV5c0czbnJGR1VCNkJzVTFiMisvKytaaGlZZHZzcDAyMzBy?=
 =?utf-8?B?OFVkdU84Z3o2dkVIcTFHV1ZtV3lmY1Izenl3NGVreW1hZjBEYVNyYVhHSUNy?=
 =?utf-8?B?UjRVL2VYTXhEVmFmclgvKzJENDM1czVXcUV3M1JSUmFmSjcyVXJlMHJuVTJM?=
 =?utf-8?B?L3k2UXl6eEZrcHJ4U2Z2M085VUxNc0xHaVY1RUp0eFlQdFZrQ2F3TFA0Nlht?=
 =?utf-8?B?R3JWSXZoVDI4d3lZQWQrNTBHQzN4M01FMnd6Vkh5YXhBRGhTcng1UXZtZG00?=
 =?utf-8?B?Snd1ZjBxMFRubVhSMTVyUnBaZjl2blgzdzh6UGR1bE4yZk41cDlNc0lqV01M?=
 =?utf-8?B?ZEVZcWJaeTFuUC83a21xblZWVWtnS3FFcFdvTzZPWmFUc0FNMVJyK2hxQnAz?=
 =?utf-8?B?V1NmQVVrc2U4cDhBSC9GWkNFTFc0ZzB3L3ZLaElIUkN2N3NKOGc4RVE2cTU5?=
 =?utf-8?B?UDY1STJmWFdwTmhxRmF6UU04Mk03d09NVmtUME9zc3VyUEdnUDQrWHZNaUNw?=
 =?utf-8?B?WTQwYVRjUXhTelYzdUdOSVdxZ0FtZkh2OU1oa2liaHc0TzRUaldENUlvM3Zl?=
 =?utf-8?B?ZEpBNlJIYjRVMndGOUxXeTVzcHJFdFF4N2NKWEM3d2FkcUhXU01qaVdZZmor?=
 =?utf-8?B?YjdpSmg4Q2xick9jcSt5cGt2YjMrYVdPYmphTVM1SzRkcy9pSmFsOFlObE5S?=
 =?utf-8?B?RHRkcmgzOEkrVzY2allwbURnOEJBaDJJUmdCdUUxRHlKdFZaY3d6Sm9Dejd6?=
 =?utf-8?B?cjRUbC9JZGVKVzhOSTFac25BanhIRVMvZnBYaHZvWGlHaHpHMXZhSVN3U1p4?=
 =?utf-8?B?SUgyTU5saXh0aFpwUjU3TU5HMFJkV0R4ZFo3ZCtGY1JPNnZ0elVIUDhkaG9r?=
 =?utf-8?B?bm9ZUnVvcjBCWkNDMno0K3pkdUx3dWhMWjE1OTZQMk55aS90Tmg2NUNCaGU4?=
 =?utf-8?B?eHdUOC9ERWI1VzFWdlZaTUFVMFdBeHJaTk10cjFsaVhZN0YrVE12U2pRNmx3?=
 =?utf-8?B?Ti9CMGJnazhPZ2xzV2g3N1E3RzJhZzFUdXNPSWtvUElObXhlOVNrcWozVnN1?=
 =?utf-8?B?Si9ZTnNNRE9oTUFidzY2Z3ZQQmZTaDNHeGlCVUt4d2ZrYlcyRCs3VFJKQ0Nx?=
 =?utf-8?B?WGlxdnFLQk5UbnoxVmVueUh2SjZrTm9Ka1Yzb3luRnNNaVRza1JWQnY2ZlZu?=
 =?utf-8?B?S2N3Vjk4ZFU1WWtPMWNCL3I1UHFQQ0h1a1cxMWN3OElvZndab3pOY2dKVXIx?=
 =?utf-8?B?ZitUd0pHbWhZNGRhS0cwaE5oOERjSFh5Q04ycW1ZR1dBRk14YUhyV21ORTRM?=
 =?utf-8?B?d2QzcWowTlNqTGVRcWZ6TWVibHBzZlE5c1EwRjExUks2REdiN1lISWE3bzR2?=
 =?utf-8?B?VlNWWExnZlZVazdDVDBuVTdGSThnQXZZK2I1d25MNW1sbjlkdG4zeU1sQ3hW?=
 =?utf-8?B?amxpVWQwOThmb1RlSm03U0J1N1ZacHpVTngxRWJIek15U2hPWkZtb29DN2pG?=
 =?utf-8?B?alVOYUg5Mjh4UHd2YWEwdUZXbEdIVm91Zi9zbloyWUd4QTZHOHZpQjFIWCt0?=
 =?utf-8?B?aXZhT3QxV2p4TjBXelVyOFo0aUJSclZCZ3k1clp0SWVHOEM2bEZUaHlwYVd2?=
 =?utf-8?B?NmVoRHljaWRzZFZ0Z1lQaWIxMkRveDJqNG5qdDV1amF3eDExYUVCQTVudnZt?=
 =?utf-8?B?eGVtSlVnSExFWDlFYXlNaDBtMmlKVmFCL2RBSWw5Vm1Bb1ZpcDNJK0V0a2Ra?=
 =?utf-8?B?cFE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740d040f-b6e0-4542-1bd0-08dd307c6d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 07:08:32.2601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KUwqoy6RAidVtJHIW6qB7RfZ8HrGwcMtcFNn7b2V2KorbmZ5X5kyEwSfOlljs5Rh1hlDcDysqaYiSDNeEH9CTrTeN5GFK9DqgxUS0AKqoPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 2/4] selftests/bpf: Add Launch
 Time request to xdp_hw_metadata
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

On Wednesday, January 8, 2025 12:58 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
>On 01/06, Song Yoong Siang wrote:
>> Add Launch Time hw offload request to xdp_hw_metadata. User can configure
>> the delta of launch time to HW RX-time by using "-l" argument. The default
>> delta is 100,000,000 nanosecond.
>>
>> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
>> ---
>>  tools/testing/selftests/bpf/xdp_hw_metadata.c | 30 +++++++++++++++++--
>>  1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c
>b/tools/testing/selftests/bpf/xdp_hw_metadata.c
>> index 6f7b15d6c6ed..795c1d14e02d 100644
>> --- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
>> +++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
>> @@ -13,6 +13,7 @@
>>   * - UDP 9091 packets trigger TX reply
>>   * - TX HW timestamp is requested and reported back upon completion
>>   * - TX checksum is requested
>> + * - TX launch time HW offload is requested for transmission
>>   */
>>
>>  #include <test_progs.h>
>> @@ -64,6 +65,8 @@ int rxq;
>>  bool skip_tx;
>>  __u64 last_hw_rx_timestamp;
>>  __u64 last_xdp_rx_timestamp;
>> +__u64 last_launch_time;
>> +__u64 launch_time_delta_to_hw_rx_timestamp = 100000000; /* 0.1 second */
>>
>>  void test__fail(void) { /* for network_helpers.c */ }
>>
>> @@ -298,6 +301,8 @@ static bool complete_tx(struct xsk *xsk, clockid_t
>clock_id)
>>  	if (meta->completion.tx_timestamp) {
>>  		__u64 ref_tstamp = gettime(clock_id);
>>
>> +		print_tstamp_delta("HW Launch-time", "HW TX-complete-time",
>> +				   last_launch_time, meta-
>>completion.tx_timestamp);
>>  		print_tstamp_delta("HW TX-complete-time", "User TX-complete-
>time",
>>  				   meta->completion.tx_timestamp, ref_tstamp);
>>  		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
>> @@ -395,6 +400,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet,
>clockid_t clock_id)
>>  	       xsk, ntohs(udph->check), ntohs(want_csum),
>>  	       meta->request.csum_start, meta->request.csum_offset);
>>
>> +	/* Set the value of launch time */
>> +	meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
>> +	meta->request.launch_time = last_hw_rx_timestamp +
>> +				    launch_time_delta_to_hw_rx_timestamp;
>> +	last_launch_time = meta->request.launch_time;
>> +	print_tstamp_delta("HW RX-time", "HW Launch-time",
>last_hw_rx_timestamp,
>> +			   meta->request.launch_time);
>> +
>>  	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
>>  	tx_desc->options |= XDP_TX_METADATA;
>>  	tx_desc->len = len;
>> @@ -402,10 +415,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet,
>clockid_t clock_id)
>>  	xsk_ring_prod__submit(&xsk->tx, 1);
>>  }
>>
>> +#define SLEEP_PER_ITERATION_IN_US 10
>> +#define SLEEP_PER_ITERATION_IN_NS (SLEEP_PER_ITERATION_IN_US * 1000)
>> +#define MAX_ITERATION(x) (((x) / SLEEP_PER_ITERATION_IN_NS) + 500)
>>  static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
>clock_id)
>>  {
>>  	const struct xdp_desc *rx_desc;
>>  	struct pollfd fds[rxq + 1];
>> +	int max_iterations;
>>  	__u64 comp_addr;
>>  	__u64 addr;
>>  	__u32 idx = 0;
>> @@ -418,6 +435,9 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int
>server_fd, clockid_t
>>  		fds[i].revents = 0;
>>  	}
>>
>> +	/* Calculate max iterations to wait for transmit completion */
>> +	max_iterations =
>MAX_ITERATION(launch_time_delta_to_hw_rx_timestamp);
>> +
>>  	fds[rxq].fd = server_fd;
>>  	fds[rxq].events = POLLIN;
>>  	fds[rxq].revents = 0;
>> @@ -477,10 +497,10 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq,
>int server_fd, clockid_t
>>  					if (ret)
>>  						printf("kick_tx ret=%d\n", ret);
>>
>
>[..]
>
>> -					for (int j = 0; j < 500; j++) {
>> +					for (int j = 0; j < max_iterations; j++) {
>>  						if (complete_tx(xsk, clock_id))
>>  							break;
>> -						usleep(10);
>> +
>	usleep(SLEEP_PER_ITERATION_IN_US);
>
>nit: instead of doing MAX_ITERATION/max_iterations, can we simplify this
>to the following?
>
>static u64 now(void)
>{
>	clock_gettime(...);
>	return ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
>}
>
>/* wait 5 seconds + cover launch time */
>deadline = now() + 5 * NSEC_PER_SEC + launch_time_delta_to_hw_rx_timestamp;
>while (true) {
>	if (complete_tx())
>		break;
>	if (now() >= deadline)
>		break;
>	usleep(10);
>}
>
>It is a bit more readable than converting time to wait to the
>iterations..

Agree that your code is more readable.
I will use your suggestion in next version.

Thanks & Regards
Siang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
