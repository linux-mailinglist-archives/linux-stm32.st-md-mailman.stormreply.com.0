Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97623AD78C6
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 19:16:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 416D8C32E8E;
	Thu, 12 Jun 2025 17:16:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7457DC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749748616; x=1781284616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jSO47aWG4zPjRLPXyy2z/Gwop0515yapDEivDzyu8QU=;
 b=DsViqGAK9rgvaiB2EDJdZRhUzQ5eEbbv2JN8SDwzuR+D5lPWKPOWEZ1u
 EKXYLfZAw2JCIpaWtA8Hyfjxa8jR23Wo9A94ZGp76KDyuCpco3PW75Ih6
 AaqLC6Vgo8vsAZX4xYkmwSnViB+5Dgaag6RYJFBhvIWJje9LA7eilftos
 d3Xt5FblxSprIYvs+1oF3+5+g779SNvwNGmO5EvKBArL6PyGud5hERJ+m
 llGZnF89B7xM/doBOiK3cuzJwfku21k6L/r9upUms7K15I0MoZ7FDLC/W
 4bHcLAWdpEiT+Eot5P/7otvNdEotQ/worfN50Blo4ZVRMiS1nYeNIuERy w==;
X-CSE-ConnectionGUID: zxPkuCofQ8eFSXXEhIkvbA==
X-CSE-MsgGUID: DAngW3woSIqLfBzhxytxrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51929403"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51929403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:16:54 -0700
X-CSE-ConnectionGUID: eIuNhwGkTKSgGn6Nk+Av5A==
X-CSE-MsgGUID: eI+1gr9fQ5qILqa6sWQHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147472928"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:16:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:16:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:16:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPBaQMRJXvW8UkZZGxf5t81LnLN/fVA/c8JhqVfwe2S/iTsPeDRbDzZghVtZDVvYRHi1p1j2siKzD2XreG0w4S6pAbe1DILRZiTPW+FpAjLsxQzzU40uCztrgxubzJYCe2lXKav5T8OmyYWMNrT4tazl2sYN6KhOXd1aFKIYkeia1E5KnnTcVnuEWc9GaGFCEeVT47NNxk9XuijjHsz04/QwfvbNoYknZbc30ylcdmaHzWI1BtOaeSFaKTJhVygstUQtQcGQVpSeoiWiHvssb1Wj3jWLHk3+OdLLQqEvYrgI60a16yvZAbwZECF+8J20nYfUant5Ov9kPT5CBxsotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbtCCYqY6nCabSLdVwHFc5Kb1/C9edTa+18krewunoE=;
 b=PwYxoaQUARypwIbex1ShEictB8Vkn0FKglaFq0Z/yk5eTOF+tz0xks+CNJkNXbtpGwS/nJIQ+imn+bSz7KcZeaY4BII3ZIu+mV0+GCTOe9pBJm8AO7EpaLojlgnYe+XkVmaKGLKMMKoetBWaulFKMM9bPBAMCCDdH/99z4DioKFSLh7pcQo8yjZpaCgmt99kMYZMbUGJyVXBsFkT6OwpmwjChU7MPr9doS6G5GGGMc/D1+DwNUrEpswp1QavQaDfbyypm/rAcKAChmvKQWv8EfqZkje3rYVXF2Iv6HvSAcfGBmIA4LhtZlw8J0+uIIaDcGUcaKyHBx62gwC56/gg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 17:16:22 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:16:21 +0000
Message-ID: <a949b277-cc53-4709-8de7-38e3db3d9c9b@intel.com>
Date: Thu, 12 Jun 2025 10:16:17 -0700
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <E1uPkbT-004EyG-OQ@rmk-PC.armlinux.org.uk>
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: a66adc63-edbb-43d1-9813-08dda9d4d96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZElDbzVURTZvYlFCWHBVT1hlQ243alZNZ1hnQXYvZXVNRFVzbC9QaXVRaEVu?=
 =?utf-8?B?b0lqU2NKZkR2Uzl4dUtFNXdtb3EzeWxyeEdzZTdLcSs3UzZPa1RxOGxOTWVS?=
 =?utf-8?B?cEpDZWRGaUZmNlhTeG5iNVJmS0NwMUlEb1E0WlFLVlFTRzNtb0lQOGhhcDk1?=
 =?utf-8?B?RWR3bVVPNGFsMHhFQzN2dmdnWjlVRXkyT24rWXd1WWhvM1hpdHEvY1c5Q1hZ?=
 =?utf-8?B?OTAwUjJQRXRvK3c4YndMKzFRaXM2b1pLVk8vNUw3OWxpUDBiNldZcC9Kb2k0?=
 =?utf-8?B?ZERzTUNEM25scDNOQ0UyY2ZFaXUxQmo5S3VMYlpBUG9LVzJDdDZKNTRoU0Vl?=
 =?utf-8?B?T0dOV2lGeW9iZWhuSCtuK0lURFEwSGV0N0JOTTVpbWo1cWhJdFNGb21VVExv?=
 =?utf-8?B?Y1VGQXBQaGRqbjNkTEdrWXpNSWlqMWhUSk9ZV09kcVd0cHdKQ2J0RTlXeXZD?=
 =?utf-8?B?ZnBtTENWVVcrY2lKU3NNbytXb1RNR2NmTmM0TG1VeDI3cC9Ca1M1RnJ6TG5u?=
 =?utf-8?B?elhLMm93ZTgxZjdNakZwMWxQSlBsOVBLTHBXMXVwV3h5VW9hNnF6bnV1Ly95?=
 =?utf-8?B?elJoTFBSZ0FuNml4Y3N5R3VKY1AxK2lzNWVnUGw0bmZvcVd3a0FuVUQvSmhm?=
 =?utf-8?B?NjJaTFdwZENyM3JiQTlQT3VzUWpnMEhXRHV2Q1BIVkR6K1laYkZvb2JJN0R3?=
 =?utf-8?B?LzVmU2xtakEwODNFa2lMdVJETzN4NzZaOWJzcXJVMG5MM1UyelR0bGliZXds?=
 =?utf-8?B?R0NjK3d3MXR6dUUzc0JOWWpId2tseWNWL0lpZklHN1JnMXJmeHUrRDFRSlg1?=
 =?utf-8?B?Q0dtNGZXR09GaE0wU0lwazhHNDdtTzVxRUwvbTRIUjVsYTRBemkydVRPcHdx?=
 =?utf-8?B?dG80d2E0QzBsSk0xWS9yZ2RROTNCM01jOGZpNWlBUDJpTWlaREpDVzJJbmFZ?=
 =?utf-8?B?eEtzWXcyeFMrV3F6R25sM3djekh2QkVDZFR5cWQzQlFVaUN2K294azZ5MGEx?=
 =?utf-8?B?TUtSRzI3YXFGVFdSSThDUlJaNVJFd2ZtMEVQbGpWSUpLcHo0NjU5RGpVUU5C?=
 =?utf-8?B?R0xZYlV5ZjA0K3FEbndMcXNCMjBsNTRUV0oxZ2VxaWU0bndEaFV3WTVRaGUw?=
 =?utf-8?B?QW5tdGRJMXF0c3J0Y3c0TkU5RjRKT1pqVUQvd3NScnVRWG00ai9tUVFMZERT?=
 =?utf-8?B?d0g2RHc1U1B4LzZXdk1ncEQ4ZVZkWnlFWDhpeHlvL29uZG42ZHFyRTdVVHVi?=
 =?utf-8?B?ZHFPOXFZckdTMjVmVlpZYzVGekxEUmxvY1A3UHMybXQyQ2Z2N3kwSU5iZnFZ?=
 =?utf-8?B?c1hCckdyTitwK0M0aEI3QkN1ZTIxNUEzamYvc2xaMThSMlZEcjJJZkluVzQ0?=
 =?utf-8?B?SmdFRUVzZVhYVkNPSzMvc3hCbnovVjVQNmpEOW5qa1d0dUk1WFgxVy9KQU1k?=
 =?utf-8?B?SDI2T2M3NFh2ditoaGc3b0wyRUFUQ09BNE1naWthY21acUF4WWM5WHl3bGx6?=
 =?utf-8?B?RU1QeWtzZzRuMkhLNlBPN2FlNm9qV2tOODV2SkZ2aEUrS3ZBUDNDRXhldXAx?=
 =?utf-8?B?akdTV01CZmE1aHYzMU5BN1F1NUVrd1p1NjlQa1dqU1h3dEhvTGExUzBqZTd2?=
 =?utf-8?B?UnVDVDdib3E5aGRqdGtIRkRBdEFGdHJ3U3V2QWk4ZmZmNjVqOWNhTkJDNXJI?=
 =?utf-8?B?NGdDbDJLS3BhYWNTeEg1OEEzVllCM29FeXFDcmdhOXQzQTFzNEF4UmRqNVgy?=
 =?utf-8?B?VnFhOHRiUXJwdVNWK01pa290d1AwMDd6Wkl4cWxUcHRUejdHRjdOZU8xM1JM?=
 =?utf-8?B?ajRRV2NvUCtWdkdQMnJQMDVDQmJuWXpZOGlPbDJ3djRLSXBZSUsza0F1UUNu?=
 =?utf-8?B?MURVdzF1WVkrQnZtWWcrM2NQVFJ5cjJvRlVRa1RaUXJ1Vnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0tjOCtTaS9HMzZvc3hSQ1ZXS0o5dkhDRzVWNVYwZFRoaGcwbUdvcDQyZE5w?=
 =?utf-8?B?TEI3MnJxcTRkeXEzREpWV0lBd3JTUmtlNFkzQ1FPZmRmYUtHVlZQcHJnRzJp?=
 =?utf-8?B?aXpsNndBU2tzcUVjRlgvZUd4WW1HQmNVeEp3ZytQQW1sR0tsRmZ3TTJobVFT?=
 =?utf-8?B?VHUyanFzTkRGYXc5ZWk4V3JvMmgwWUVvU2JuRk5QQkVvY1NlYjlKc1I4QmQ3?=
 =?utf-8?B?VFJ5ZFpFMytRNjU1Mk9DTjJKTEVTOHFlMHZJdVhNdnFycCtpVHhXSmNac1R1?=
 =?utf-8?B?SHZtNm1xdzdkZWRXYVBlZ3dGL0hVa3NzZkVlcHVZS2psZ0o5QXJwa3V5WmlV?=
 =?utf-8?B?NTVaRVhwU2s2akd0RWdhZXFtQi90Y2xnOUZnRzg3MmpRd1NPYTc2KzNtVDYz?=
 =?utf-8?B?bTk3R2xxeGwyRXAwZkExbHVCY0s2WGYwcG8vTW5LaTZEckxka09XNFh6M3F0?=
 =?utf-8?B?WVQxbmU4bWVYdzVncEZqUmJtQjRWczBJRlpnSXd4VlhoNUF1Zm1OU3prY29F?=
 =?utf-8?B?bUltM2FpSUZXcDUzbGRxU2c2WnkxV3pURDUrQmhlODJmVkFNYVV0VWZKeDNG?=
 =?utf-8?B?UU9WanliaDZPd1YzZzFiWmN2b3d4QkZsS0lMcFBQUFNPS2ZkNjQ5SlFVQnhE?=
 =?utf-8?B?T1NuT095ekU1RGEyZ2Uwa1NTRmNaK3F5Vnh1bFliRER4eUNTMTEvK05aSUFO?=
 =?utf-8?B?aW1pOFZGczk4SFFlelNTVmdMR2Q1NXJveHZJL0NFdkt1WGwyQXBGY0h3N0RV?=
 =?utf-8?B?aVppeFJvNnVqWUVIak0zS0lYY3RHUG1DRTF5UkpFSXlUdkt5OTZVWllhYmg4?=
 =?utf-8?B?REljaVNuQkRmZjZxVWFsdCtGR2tXQ1FrcTZOeXlWZ2tmaW5sTHNXcGpObW03?=
 =?utf-8?B?Q1J4blVZTFJUbjB3VlZYY0lUaTZ5c2h5QWpiNG9ZSVVScXppOXp2a0VqVVNh?=
 =?utf-8?B?dDVSZmd3SUZHMFNHWlJZTmg4d1hsbTNlZ3NoZGpXNnNKZWVrRk9nYmpOU0lk?=
 =?utf-8?B?dHEyd0h2eUF1WGpteityRHhrRGc2MDB4bFY3ZWdnU29GeU9IZzRtdktEMEc4?=
 =?utf-8?B?dUFnUThEcll0K0swVjBERFFiNCsrYTRVdk8vQVVzSkI3MmFmS0JLeWpqcEU0?=
 =?utf-8?B?NmNBd1pDNVFERUZKNGthQmo3NUQ4bTZSQ09hTEExSFhTbUVvVm82NGwvM1Br?=
 =?utf-8?B?Q1JrOE5EcTc4ZDdPYW5JeVRxUTczYnRDZ2EyeEYzREZPcGtqZFZNTElsQVIv?=
 =?utf-8?B?bE1yZG96dXgrelVTbklNY2haSU5XbEhWaHVRWWdGN2tEZE1XMDNhclFvVjE1?=
 =?utf-8?B?WHFGczVzNWtlbkNUbDh1REJKNFRYRERiRDRyNFFla2UvYVF0Wm1aMVVtY1Jz?=
 =?utf-8?B?enJ3YkJQem1YdmdhaVlIRnlZRUZMWi9XR2RYdDhzMXpFL1ZUYU5LeFd6ZFBY?=
 =?utf-8?B?bGN4WG1MY2VaYWRYbEI2WlFHUUg4TkExcGI0OXJyQitocmlscWhUWFBIYVVT?=
 =?utf-8?B?VzdVb2pHVWZXVkhlTGJmZUI5YlE2YThROGxJODZFNzI2c0E4ZlJnaU56V1do?=
 =?utf-8?B?bjhZMVkwZExyTFFnT1lYV0VCVGtIeWxvNGJZVzJIR0lzTlV2L256ZThvV2N0?=
 =?utf-8?B?S25DdmFQWE5aQ3NGRURrZmdxRkN1UmRSbEZraXF6NmRDU0liemlQcjRPY2dk?=
 =?utf-8?B?RVBUTFRCaGF4V3ZVT1ZzbkEwTnFYR1c0aHdmQjJzZGlNT0dUNXQ1b0lrZ2lM?=
 =?utf-8?B?U29wc2s1SnBjUGNHTE1TdjU1elFWUzk3blNBektIRDNrSzR1WW82TlpXUUFk?=
 =?utf-8?B?cTZUaEZDVUpIRkpMVW9qZU92QnYzallLb1NwRjA5WGFGQnE5cENyZGx0Q1o0?=
 =?utf-8?B?Q3lCMWtDSWFkL3J6bnVTTUR3emM2K3E4YldZVjlCdmxVeWpnRmYzTUs3MFNV?=
 =?utf-8?B?b1RRaWtCTFVkS1h2bkljMFhBN1hpbE42YjE4S0MvbkM5Y0tXNTJ6L0t4RmxL?=
 =?utf-8?B?N2JZMGNRS0hhTlpJRS9FNmtvU3NRVUpwWllHaWtGbWw4N1FhYU5JMWlHcG1E?=
 =?utf-8?B?UW9GL3JZVkZSZkJ1YVZSN204SjlKY2FXbENsZXFrZVN6ZWJRYW9wQzViWC83?=
 =?utf-8?B?YVZSWWZoL3l6RkhJV2ZGbmRFM0c3aCs5d3BKNlNxY1J6QUNtYUJibi9WRjIr?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a66adc63-edbb-43d1-9813-08dda9d4d96c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:16:21.8436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Frwb+07B3oxhHcECjoGIIlxH7jrxtG3RpVcNFJ8pKtIB6RlMtZEbhrHXSJCNbZrJXvcmOAAYSMQJqGQjAeDRNEZv3txjL1vB4GXTAr4W8Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
X-OriginatorOrg: intel.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric
 Dumazet <edumazet@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: remove
	pcs_get_adv_lp() support
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



On 6/12/2025 9:16 AM, Russell King (Oracle) wrote:
> It appears that the GMAC_ANE_ADV and GMAC_ANE_LPA registers are only
> available for TBI and RTBI PHY interfaces. In commit 482b3c3ba757
> ("net: stmmac: Drop TBI/RTBI PCS flags") support for these was dropped,
> and thus it no longer makes sense to access these registers.
> 
> Remove the *_get_adv_lp() functions, and the now redundant struct
> rgmii_adv and STMMAC_PCS_* definitions.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
