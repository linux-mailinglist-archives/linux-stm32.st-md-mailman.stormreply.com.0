Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF195B38E68
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 00:27:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BA26C32E93;
	Wed, 27 Aug 2025 22:27:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE7FDC32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756333655; x=1787869655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/TJgE0ZMjPVWMmPxLBw9GOde1sDI64Mvb9MEMm/GWrM=;
 b=NrfTXODl0TwkuWbqp0VL5lUuQCXpwyrlQawYIuAe6deRRWpfBjM8hP9M
 56+3DHsUNqx2tXTAghBYQ4JY75SUmbj6BJ8Nxodb6yxGLeP2HLSgP3ofa
 nMU1dnGELhFWk2y4kRdS631VodaauS6y5wfLbMYE4r3mkfUdWjvs4K9gv
 R7ZdiOql8T1P+F6Fm3gOtcNuD2B91xZTw34QIyjSmWbs1nMnMM5Y2PjTW
 yN7rFELv2zuSgEYC4dmPWVqDVKoLt+nP0rAWz2uezfDHsV7Jo341kKUve
 uTFu3lfXtb0rHEMUvnksueMPy9efKhF6zMXgunBMOtz2SsAlJM6UrnhSB g==;
X-CSE-ConnectionGUID: c3ry+ug1QUqpNSkkvn55vg==
X-CSE-MsgGUID: 1xzBXad1RKuH2UAxF6Go8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69307451"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
 d="asc'?scan'208";a="69307451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:27:33 -0700
X-CSE-ConnectionGUID: IvjljfZaTTSXSX0HP2BriQ==
X-CSE-MsgGUID: r6dtxv2gRWWomIBYzizGGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
 d="asc'?scan'208";a="169857128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:27:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 15:27:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 15:27:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 15:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKa3mDoKN8CNjbV/P3FWATyuuFthk4EPyIcpNVEe2iKCcQEz7D9RIDZH/eKytGXqKPKyYJoSQOyhQDg7zj9P+YPAX/7gmP1aByQE8Ai3kyyk37LQrjI9dKR95xtxdq4j3tslFUFY5CyZFHaF+ijHko2f7E70nIkTeUA/10jA8neyUTLYPBK7zUmk0bUQYI8a8S7fhFSzWkHj/jOxNarNFKc7AQyLLMHEKR0MXU3pfgjb1X6xfDighdozBj/M4WuoTczmqtGVqjNB8j+SFXC/apaSJkbhNDwUlwZdC66wnRA55OD/Li7KL31UlN0Q03c9SaDDicbcM7s51Ny6EjAXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tghrl7gdajS/WeYCpbBZ0ItW09ZYo+zk6okszSRwIp4=;
 b=CmeE15bAsQwHmFQersjisfgBvnmMHTb0CvpdTClsLHXx4vZverI/iBMafk2ahJZqE+4/qxPXUGobaWvkevMQAQHX8c88QBMF09eY5R+XNkcN1omdgc/5yaXTweEFAwQOFd9aOIHYG/Jun+hB0jXMMc7NJXeN9zgwTsHihMlT/Rpxiz72b6vBKBLXyz+MVKaKniZo0ZVNTeGidWETYvih+nnCDg3fd5VH0ygSNhHxoasn4naRp5wA3II0zs/nMFZ7Fu63S6wHlSGgczfl+cZZ3vwTEfFuhkqwynKOFxcuqcHcVVOEnumJ34CATL3HGxLqNadoBuTvRJOFfKmowJZDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Wed, 27 Aug 2025 22:27:29 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 22:27:29 +0000
Message-ID: <0abc4efd-a44b-4277-ac00-af6893a8c8ed@intel.com>
Date: Wed, 27 Aug 2025 15:27:28 -0700
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
Autocrypt: addr=jacob.e.keller@intel.com; keydata=
 xjMEaFx9ShYJKwYBBAHaRw8BAQdAE+TQsi9s60VNWijGeBIKU6hsXLwMt/JY9ni1wnsVd7nN
 J0phY29iIEtlbGxlciA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPsKTBBMWCgA7FiEEIEBU
 qdczkFYq7EMeapZdPm8PKOgFAmhcfUoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AA
 CgkQapZdPm8PKOiZAAEA4UV0uM2PhFAw+tlK81gP+fgRqBVYlhmMyroXadv0lH4BAIf4jLxI
 UPEL4+zzp4ekaw8IyFz+mRMUBaS2l+cpoBUBzjgEaFx9ShIKKwYBBAGXVQEFAQEHQF386lYe
 MPZBiQHGXwjbBWS5OMBems5rgajcBMKc4W4aAwEIB8J4BBgWCgAgFiEEIEBUqdczkFYq7EMe
 apZdPm8PKOgFAmhcfUoCGwwACgkQapZdPm8PKOjbUQD+MsPBANqBUiNt+7w0dC73R6UcQzbg
 cFx4Yvms6cJjeD4BAKf193xbq7W3T7r9BdfTw6HRFYDiHXgkyoc/2Q4/T+8H
In-Reply-To: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
X-ClientProxiedBy: MW4PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:303:b5::22) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b800e0-0c2f-4072-e3ec-08dde5b8e876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1pLQjVPVXlPVEI3L3dHZmVuVmdZVm9oejlRZUxVK3NZeXJnVzRnU2VCL1Ny?=
 =?utf-8?B?cHZEczluanVXd2hPclRuOGFvUGxVcm5XWHBUc1c5QWU4bmlUU2x5ODcwNFYy?=
 =?utf-8?B?TzRwYmFCTXRqSncycFJkUzZnY09hYm01Y3A0cVRVSGQ5dWdvY0dZNmU2bGdk?=
 =?utf-8?B?VWMwbXJJUytBeUJ0QjdoWDkxckF5NzltZk5YQUIxU1ZLYnFuT052am5lSVF2?=
 =?utf-8?B?QlIwYWs4bTBsb2QwZEFzVlR2bkxJZURMVjhjZThjVTVXbkhHMXVjai9FQ01R?=
 =?utf-8?B?dE5MQVphdEFYcVRqYXAxSU53MG5kbGRyNjYwczRZbzRtV1J2aDlIR0JJVTlO?=
 =?utf-8?B?S2o4NUtSUkNVMGY2R1ZpeURBL1dyVDBDRUFoSWwrNGZtZ2h3d09kVlBPbERD?=
 =?utf-8?B?L05WZHNLVDJGazlJUytjaG9mMlpXM0xxTWJxOVA2VllxUy9IcFJXTHBqOUhP?=
 =?utf-8?B?UnR2TGR3SjJ0TlR3VVpCSFZDVUcycUo1aWNURTM0eVVkWm9IWFVmUWp3NzVu?=
 =?utf-8?B?TDA5Tlp6a0RNSnJOREEvSit1NXhoekhPVFNLWVUzK2tsWE9tWEcraWVWUFdG?=
 =?utf-8?B?ZTA4ZTRXMzlsLzZMSTluSUV6VGlua0ZYMnRBN096bEdmRXVscTJqS1M0NDBq?=
 =?utf-8?B?QnRBY0JBUDQ1eHI5a2FTQ1dKdEYyT2xveklnVnZwUmdFMVJrTFhJY1F5Z2hp?=
 =?utf-8?B?WnZBTXlBdk1WNEhhMmZkZGMwVmZLR25DakFTeUVFQld3WkhoVExpdTlwNXI0?=
 =?utf-8?B?MnU1WmpTT2ZJZVhDbFdRVFA5dXlVcGJlQXdmeElnNUtzd2FWK1hlK2dUVU16?=
 =?utf-8?B?S0hVR3NoYkMwazBLQkl0cmQrMkV5WGNTYkR6T2dVelNOL29wSjk2ellRMDF3?=
 =?utf-8?B?YWJkb0JXTkFpWk9xN0tVVVQydk82K0ZKTStic0RpejhVcmZ2S1YyOEx5V2RJ?=
 =?utf-8?B?OGJ3Kzk1S0Exb0pqNlRoTVphalVoUDRFUkE2c2I3aDROWGNQdDZvanM3R2lt?=
 =?utf-8?B?S1dBV044KzNiS1hLVmZscGw2NkdlN1JKV2kwbERwK3U1eW9uajJ3b25wd0Y4?=
 =?utf-8?B?TWtQamNxSTFRdDRuM1J6Yk9vZmhYZ1BOYjdvMjhPSnRSTG1aMkpRaHZSc21k?=
 =?utf-8?B?SGJ3ZHMrNUZvcVd3WE9zM3F4WllIWmVHcXRjcFJVLzROblZBSFpmUG1EK0ZL?=
 =?utf-8?B?RDJISUhORVpxUVIxeG5FSVdUWG9lUjE5NmdveHlPRlNpMVFSZXB4RVE3OGRC?=
 =?utf-8?B?LzN5c2pJamVhMUNoMkdGZWlJTW5teWVkY1VDVjhHb0RlSDBYRFlhZ3VpZ01x?=
 =?utf-8?B?VkYrbWliaFpNaTBuMEVpVWt3RG93L1cvMDJjWGluSXNjZ0paVnBDSjF5NFRY?=
 =?utf-8?B?SFNvd3NvWDBnQ3U0N2tIemJOWnJoWUhNNUU1WS94YjBFdEVRcDFtVFVmTHJM?=
 =?utf-8?B?N0RTZ2YzYmgxYXNZNDZCc0FHYU9xUm82dFZUK1psZEpPMjdXMjdDK291SHcv?=
 =?utf-8?B?MUcwcjVsODhpMzd2VVVTNTJvSWs1RDVFWWdiMUt2c0tlMUJxNGNzYXVrRW5F?=
 =?utf-8?B?RDRqZjUreVFqSzNnQS9UbS9VMEVVbzAzS1JJaFlONm55cHA5RlVKRWZ2VjVI?=
 =?utf-8?B?VmhTcUN6dURoNXZGUjJlN3plVXdlLzNmUjQ0YWwwK3JDenBqck43RXNxdS9z?=
 =?utf-8?B?T1UrVzd6RjJ5MGR0LzQyeUxGdE1JUVQ1bTEzQ3B3eHk1aHFzTnA0eHNxS1dy?=
 =?utf-8?B?NklGM2VveVJuWHltc2V2UHRkaU9tdituS1EyU1pDeUpKanlJZ1pOV2NJLzFz?=
 =?utf-8?B?WlpmdU9ZVEtPOVcxTGNHK0dGbEl0MFRiOUdxZXVwajlVVmVoZkJzbUJxVkZR?=
 =?utf-8?B?RFQrb0VDeFlnSm9oRDRrWGQzT05mcnRVUmVHaytPdzNTeVM1VXBVRGNzNCty?=
 =?utf-8?Q?XFrU2vcJLNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pBVDJvWDVFNzJOSURYaGNkUzlhVGpIaXQyVkkyRVRINElrSFFUQ2Vxb25M?=
 =?utf-8?B?Q2kyS3dWR0FmY0RKcEtqQnkwU3ZkWWk3UGd4WDZZa3JXMStFVTE5c1ROYVBv?=
 =?utf-8?B?Q0tyK2xnUU1IemFlYzhTWVVMekNHQTBNWGdzR0Nrb1RLZmVWWXFaT3Y3YnRX?=
 =?utf-8?B?Z1ZucGtQVGwxaXFZREg5SDlDSzgwTlArWUpDd0g1Yytxamt6RER0dTZ5bXZG?=
 =?utf-8?B?MitDSDU5QUpHSlpvUnJGTVViN29tRnlxT3dRZ1AzNk5tQ1BEVzM5WlNVakx1?=
 =?utf-8?B?dEFKMmYrV2V0WC8vV0NhenJ3WmFOOTZVVXRLeFUwYkpUV2RhR2t0cEF2RFY1?=
 =?utf-8?B?MHA3amJDZERrNUc4ejM2MlZJTTdaL3ZxNklNRGsyK24rRjRlZ3hEclh4bWxV?=
 =?utf-8?B?NW1aSmJoQUptTTEzK3FQZFQ0TTFKRXBmZHdmMGY3QWt4VGRKQjNTRlR0WEND?=
 =?utf-8?B?VTlZUjA3a293TUZRU1cwWHVuRVlab09TeDFQNFRqNnd6czdkN0VYa0UvTEUy?=
 =?utf-8?B?OUNEbStLVjcxOEFFQ3pnaVZ1RTFFaVpIbUI1TVFhQ3JFWTM3NzdqM21QSy9z?=
 =?utf-8?B?REdzNDdsN3duMmpiS0pIWk5pUy9TN3BlM1ZxTDFZNkV2Si9tbnpJZ0VmZHZX?=
 =?utf-8?B?eFBjaXZCcGlBbGl2dXZRRXpXZytZanpOUU5ESlViRFhBaml6SG83aG9KR0pE?=
 =?utf-8?B?OG5BTlBEYVBFdys5R2lzcGZyM2E5cTFXR0VzTW1WbDFXNkVJUjREUmcvM3hQ?=
 =?utf-8?B?LzRncHZjOWxTa0ljaDh4QU5iNDhZUnpuaVUwODZpR0U1N3I0RkhrWVVjb284?=
 =?utf-8?B?WHJnM1NkeDhPRzgrcWdHZ1VsRDlQNTREaW5lbzBHQUpSeWNLUWhyTnVZKzhG?=
 =?utf-8?B?b2xCZi9CcVV5Szl3THM5TkZ0eW5MMWZlMkk1dGNXRmkreEVFVGV1bWlrR0kx?=
 =?utf-8?B?Y1VBYTB4QjRscFdXWGFLcVhzTXhlM1Z6aDBRaVZPd3NOTlF5U2ZkMWd2L25K?=
 =?utf-8?B?YkRCa1ZKak5kOU5FWThKTzZrMENQVWNYaUhPTjBSTGxRVFVHY1pLRXprYmdm?=
 =?utf-8?B?WHJjUHNTTkJlZ21PMFA1Z3RIOW95azA3ZVpVWlQwSmMvN29qU2V1NFBibFQ2?=
 =?utf-8?B?VlBjbWdDQUJDdGJQZmNvTmtlOGUveUdDQlEwdkJ6WHFqcnNvalJab3RlZWlU?=
 =?utf-8?B?UStZeHJjRVk0ZFA1Zi84ekgwR2habkxyMG9iOE4rRWJQK3lkQ1gzU0FDSkI3?=
 =?utf-8?B?L3lZNHBNeWtLZEVDZFkzRHVkbFIwL3RTY3lZeGlhREdvT0h4dE0wakY0MTd3?=
 =?utf-8?B?aGNPd2xTTlhJMC9xNDhhZUFTOXR2TEF1cWtDaWpvWVkwbkhWZUtBMlJzcVJQ?=
 =?utf-8?B?MElHUVp2YmNweTR1VlVzMUJFRDRSSjh4elEyc1NZTGduK21ML052UjdIYVAy?=
 =?utf-8?B?NlZaNVpwWVpFM0pWWDFoWDF1R2hZTGV3TnpnMlhkcTdUYi9VNnEwODh4WkR5?=
 =?utf-8?B?TkpPQVpmVzVFQUdOS0dVa3ZoVTRLczBLeS9mdHNGbENoOExvVHVGdjgrSFdn?=
 =?utf-8?B?ZjBBOEJBYUhRbzdVQUJHZ214QmxBaVdvRi9VVGZzNU1vanUwekJaeVBycTFT?=
 =?utf-8?B?d3o5Yjl4TWhuL1pWNFEwNzhMMGtZbXUvOXJhMTlycWQyU1FPSzhRQ3JrREl5?=
 =?utf-8?B?OXNJWUhrUy82REM0M24rbDNjS3RNdzhFUEJ3N1l3RzdMU3NLSFUxZi9DZys1?=
 =?utf-8?B?TTRjS0puVjIvMFd5aHZWU3FhcENBaWFjTXJFZkdMbG5wVE1wNWxjVTZRSk9s?=
 =?utf-8?B?Y2Y2UjFtOVRQU2NvMlMvY1ZVM1BoZm9pbkE5UDAyamR4WGxWVGhIbXc0YVNU?=
 =?utf-8?B?UzBTYkZybERVVnZiTFMvU1FsdWtGQ0c2b09IeHpFU3oxQ0NNcU83WkMvU0xk?=
 =?utf-8?B?VFdENWJNVzdBTGcvK0ZVYUJBWWtDYllSRGFpOXNGYy90KzJYTC9COGs5ZGZM?=
 =?utf-8?B?TXpvdk1hcDdUVi90TmhXczlDYW16eDZUWUppUHN2RU5QOURHS1RRdnFmWnNL?=
 =?utf-8?B?U1F1ckRxWXkwMGlQbmFSRE5rN2UwM25GZFIyVjBUL1c0YVFKVjl5SnhQUUFm?=
 =?utf-8?B?R3I5WThkbVpxNVNmUXVnZkNBQitYMnJxVFk4UkhxL3FBVUgwNjhPenIvV3Rh?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b800e0-0c2f-4072-e3ec-08dde5b8e876
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 22:27:29.7599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQpzpkE5+b7ffIBOj45DrPeB9rWAUQb85VUZBdz9evaZZ52epFAIjdCwI5NuclKig0AtH83WNzTprPoSPUQ9OOeoMDghsWLDwvtD0IntEfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
X-OriginatorOrg: intel.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric
 Dumazet <edumazet@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
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
Content-Type: multipart/mixed; boundary="===============4877327112114234228=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4877327112114234228==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------90hyeuUuxuV7xko0Ze0ElxEU"

--------------90hyeuUuxuV7xko0Ze0ElxEU
Content-Type: multipart/mixed; boundary="------------nid3GnRBuDWxwfJBpWGws9si";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <0abc4efd-a44b-4277-ac00-af6893a8c8ed@intel.com>
Subject: Re: [PATCH net-next] net: stmmac: minor cleanups to
 stmmac_bus_clks_config()
References: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urBvf-000000002ii-37Ce@rmk-PC.armlinux.org.uk>

--------------nid3GnRBuDWxwfJBpWGws9si
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 8/27/2025 1:54 AM, Russell King (Oracle) wrote:
> stmmac_bus_clks_config() doesn't need to repeatedly on dereference
> priv->plat as this remains the same throughout this function. Not only
> does this detract from the function's readability, but it could cause
> the value to be reloaded each time. Use a local variable.
>=20

Even if the compiler figures out its safe to store the access and reuse
it, its much more readable to use the local variable.

> Also, the final return can simply return zero, and we can dispense
> with the initialiser for 'ret'.

Also good cleanup.

>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 27 ++++++++++---------=

>  1 file changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 429a871d7378..88f5d637f033 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -149,33 +149,34 @@ static void stmmac_exit_fs(struct net_device *dev=
);
> =20
>  int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
>  {
> -	int ret =3D 0;
> +	struct plat_stmmacenet_data *plat_dat =3D priv->plat;

I did notice the driver was inconsistent in whether it refers to this as
*plat or *plat_dat... Its slightly shorter to use *plat, but I do think
*plat_dat is a bit nicer to read.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

> +	int ret;
> =20
>  	if (enabled) {
> -		ret =3D clk_prepare_enable(priv->plat->stmmac_clk);
> +		ret =3D clk_prepare_enable(plat_dat->stmmac_clk);
>  		if (ret)
>  			return ret;
> -		ret =3D clk_prepare_enable(priv->plat->pclk);
> +		ret =3D clk_prepare_enable(plat_dat->pclk);
>  		if (ret) {
> -			clk_disable_unprepare(priv->plat->stmmac_clk);
> +			clk_disable_unprepare(plat_dat->stmmac_clk);
>  			return ret;
>  		}
> -		if (priv->plat->clks_config) {
> -			ret =3D priv->plat->clks_config(priv->plat->bsp_priv, enabled);
> +		if (plat_dat->clks_config) {
> +			ret =3D plat_dat->clks_config(plat_dat->bsp_priv, enabled);
>  			if (ret) {
> -				clk_disable_unprepare(priv->plat->stmmac_clk);
> -				clk_disable_unprepare(priv->plat->pclk);
> +				clk_disable_unprepare(plat_dat->stmmac_clk);
> +				clk_disable_unprepare(plat_dat->pclk);
>  				return ret;
>  			}
>  		}
>  	} else {
> -		clk_disable_unprepare(priv->plat->stmmac_clk);
> -		clk_disable_unprepare(priv->plat->pclk);
> -		if (priv->plat->clks_config)
> -			priv->plat->clks_config(priv->plat->bsp_priv, enabled);
> +		clk_disable_unprepare(plat_dat->stmmac_clk);
> +		clk_disable_unprepare(plat_dat->pclk);
> +		if (plat_dat->clks_config)
> +			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
>  	}
> =20
> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
> =20


--------------nid3GnRBuDWxwfJBpWGws9si--

--------------90hyeuUuxuV7xko0Ze0ElxEU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaK+GUAUDAAAAAAAKCRBqll0+bw8o6C+x
AQDRa8ivo/ThH7LC8549b9APrUJ0EKz8C5V4rhQAVBtD7QEAlLM3ngnR7DtIyNlyLOWCekR+WBc/
b0VXL/usiEK6kAo=
=0zc+
-----END PGP SIGNATURE-----

--------------90hyeuUuxuV7xko0Ze0ElxEU--

--===============4877327112114234228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4877327112114234228==--
