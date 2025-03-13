Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B57A604B3
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 23:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 542E2C78F97;
	Thu, 13 Mar 2025 22:49:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9659DC78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741906152; x=1773442152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yoxEJng0RV9gYbaqg8jScDodQxGzmdC8+crJjcHgTPk=;
 b=dDd7P8ORY6kwHUSQwVm1iUYIb6MCt7RlzZNAbqnhcfvmIC35N26sZqPP
 s5g7XpQntqZwVeRpAkqmsKLI01MC6GQTEC6rTN1aRVzwH6TkkX6d8mWDN
 5PSu70vJ4PvMpmCL1MOVgcbLwhu36HuGoHIKrrkqx/+X9OYAvSuRFcUAq
 CUo2/ZLRb2ggXEwlplk6MXBge/aTdCTE0VJxeo0tI1xQnfkd3BUfJh2Of
 VtFIAjFwKhWdgeBsbpyRJJdmyxvoD9hxBcAGTz2C/HNiPG6WY4UbgxOde
 KOuH+nC+h8crrxl5ObZgDv2EXJtmNAxkxbC9qhg87Kem1YYaugbujNcIP w==;
X-CSE-ConnectionGUID: 1ejo+0/GQ1y1s/UDHYWbSg==
X-CSE-MsgGUID: l1eRIpmETX6J3svIXzEPLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54040143"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="54040143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:49:07 -0700
X-CSE-ConnectionGUID: jD1UwVtEQFSaIX1IQLBC9A==
X-CSE-MsgGUID: 74PZ2c/wQJuAulSotiLW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121085124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 15:49:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Mar 2025 15:49:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 15:49:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 15:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWQECOvj8ZBf2nMWmLbykr+s+Vn16xqrs/FOB4G3vWIDKnc7p59FHwdr3ezPeoO1dxNtTmX4UoXfvcffJLSE5F+IosbrjL13gqJT2rqsGIyE501ooFrRinU3wvNqrMAcPsCq76yhb+RgmnTUFqxGeHBn/lZD9EW8Jz2XW1o/NYUWvm9e/tzfsBogn6eerPoHXB4f52Wjw5aOXHegdPf/XQn+w3UyFI7aTQKt213OE7Prvi3Dkgj0TyRAzt+ZDFH9rIcbmEIxVX8FepK5sPh5eH6DM5E7dHgg9glkZI30Tb0GJ7lw/OzWv72BTAynzLorwzn0VcP8c/5ofm9HSNwv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBmo/gQO8PClUSMB01qIXzIgpY1sEahNMtr7xEBke50=;
 b=Gea+y4xreCWcYFObvV0/OYPBZug8dV0977odSVmyr82IK5jQEfV5KC5hCg6a1OCkN+JuSou9kzG5lX9Rp8Geq4wH1OAuAcw+M5SQlCbOUr22pzzW4+6qYSay2NxoOkLA3jv37qdxB/G7b9IIKOz+22j6WVz827JVG8iMHGCyG84BddDmE7qhvsYS41vJTcidKE2VXtRlhmgRAumDzU+NQwZxgQArFLZGNu9Ij6lkMVkFfK55AQDahsI7qOu81wGmC5/b1mzIwrp03jr6tVW/5Y2yG0Xf4o/PX+ilAt3UyiQXfvMefCZ2+saxLOxqXndRtEM2GtLkHu94d5DgKh40dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.33; Thu, 13 Mar
 2025 22:48:42 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 22:48:42 +0000
Message-ID: <73e82f1f-e0cc-4b1e-8436-727a268933f6@intel.com>
Date: Thu, 13 Mar 2025 15:48:39 -0700
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA1PR11MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 86246485-f3a7-45a7-ef70-08dd628133cc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk5kOVRHb0M4WGg1NWhsZDlvd0NRb0g2Y015NHNSUzFXdUxvaGtRNWQxcENs?=
 =?utf-8?B?UXZhc1FMSjNIQVE2akw2VG15bU9qUEZ1cSt0WGlVTkpZdjNMc01kYnZuUTJj?=
 =?utf-8?B?LzBqby80SFY3L1dxNUVXWTIzbk8vcklrTFZEamVSTUY4aDdWcXF2dDd4SkFK?=
 =?utf-8?B?R0ZEK2I1RkFwMWswSjNRaVBKQk5hVjQwZkllR3l1enFxRkZ2d0E4QU95MENn?=
 =?utf-8?B?SldicWVxaVhXNHhJdXQvdVdjS0Y1ZWl0bWlWTjRueHJUYVFHZWNzaVVhV1BL?=
 =?utf-8?B?am9qcElTVFJDTlQwZTE0eERtdEdYQWJnNE9FZHU2WmlkVnFBY2JUY0w0bWlt?=
 =?utf-8?B?dVFad0FKOXVmeDl6OWJTbGZFeFBjeHZENFQvOEZoUHNpelJQMTIvY0EyYXdL?=
 =?utf-8?B?RlA5MGNWejlTSEZNY2FYYk1adERKSkVMUkZud0lPemVpaXY2VVVBQzFZa0s1?=
 =?utf-8?B?NjdTdXlqKzVpcWVCSEVYdHVJZkk5M0FkU2Uveko0NnZ0elZxU2FwU084QUxY?=
 =?utf-8?B?QUJVZEhHd042Ny9iL2ZySVRESGFRTUU3dGRkTjhLaTQzS1pqWlU0N0laMGkr?=
 =?utf-8?B?MS9UZmltYWkzKzRtandmaEQ5TkF5dVlKTGE4SWJGQUNURno5RnUxaW41RjJU?=
 =?utf-8?B?d1QwQzZDZmg0WXN3Tkx4SzQ1VXh3Q05BS2lnNDZ1ZVZPWG1JWDBKakMwakZs?=
 =?utf-8?B?djNIQnhCVGtYVWFFK3BpelFkY1BQazRvZDBTbG05b2pIcVNFVXhoSkdDYVcw?=
 =?utf-8?B?OWRhbldTazVwVUR4bXVPcm1McGhkMm5oRGxIeTZ6bDhMbWZ3M1FWZ2N5TWMr?=
 =?utf-8?B?Z2Q1VHdGeWsvWWIwY1lxeGh2ZzZZaDZuT2ozL3JCYlNQZVlVZkZoOFhhTlVF?=
 =?utf-8?B?aEJHYlYyZkQzczB6bnhySjEwK3NPWkdtR1ZZdXpoL1pWbFJKQ3NyNE5WRysy?=
 =?utf-8?B?YXkyRlpGNW12Nk5CUTVUNElnTnpZTExxSUV3SlNtVXJ5d096d3hrdnMrbWl4?=
 =?utf-8?B?b0JySGQ2cXh5bmdUVG53a1ZqcEIzczhRNC80a2pkb01EQS95RlI3TFp2bURk?=
 =?utf-8?B?eGtuYnRqeWlkYStTTzE2WGs1anBVM0c1T2c4ZFVhcFlwUnd4d3M0cTE4MUtm?=
 =?utf-8?B?SEk3Z3I4WDU4NVl2NXJNZXY5ZkhrSlJmRmUzN3FjUEhJa0dzUEszRUFvTDRB?=
 =?utf-8?B?SGtuK1duZW5ZZzd0bFZZSkNRYnJ6ajBMdlhkZ3RhbTJYVXBiMm42VEhPSm4y?=
 =?utf-8?B?dDlNV1ZlNFZQa01uMXN1VlNybzVOaDZKOHhYenNxL29SNTV1cEVqdSs5M0li?=
 =?utf-8?B?OWIxNm9RVm5lMnMzTWFBZWNRanIvak9RUVJtSThSQmdYNi90Mk1IUlBYWVVx?=
 =?utf-8?B?TDZkWER5ejFtaXJKcEF4VmtNVUhpQzRrSmFaTmV3Nmo3cTdVWDRMaXMxK2Jh?=
 =?utf-8?B?c05yTGFuTG5CNzJISGRRbVNOTkxlRVJUa0l1WlJVT216d3UzUS9iR2NnTjZB?=
 =?utf-8?B?dndWMFEwUVR6K0hBNE9FSU5PY0RDUTcwY3cyVFJLMEtzN25WYzA0a2VUSmtC?=
 =?utf-8?B?Rmp3djAvUWZReEdTUS9rYjhPUWpLT0YzWkVEeTE5aDZhVi9CMVdmcFA0RS85?=
 =?utf-8?B?dHlYaUVqMSsrN1dHRUNiTEhrVzJuRGNaeElQblhpdkxpK2ZGQVo5eGJDemdh?=
 =?utf-8?B?QllYUkQrN09ReVIvamt3c2tjVmU0M044aStkc0p5VDNVMDREejNLN21GZEpM?=
 =?utf-8?B?MzFuSVZZbWttVFl0bnJ4Mmc3Mm9KT0tiMHU2ZnduNnRwV3E1VXpjMmtFV2ZO?=
 =?utf-8?B?V3RzdnpwL0xjUHVwanBjdWd3bGZrOWdOb0FLQUZFaFEvSFF2ZGhLdTdiRi8r?=
 =?utf-8?Q?DsKUqDSQGSJLR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9yVGR6Z2VPUGxXWTB4OGtPWmhhSGhoVERXOS9iSnljb2FvallacmlLaHNM?=
 =?utf-8?B?aU84U0F4ZFlmM1A5bC82TzZMNVFLVnVwTk9uNFI3YVpwRnc0T3B1eHpqdUw0?=
 =?utf-8?B?SmtoU0QxY2dwNkV1NXBhVEtKWjlMOHA3WStOYVo1TG5QdzNpUWNVRGJ5M1dM?=
 =?utf-8?B?MVJLUmFCeGZNc3BSUSswazNxM0dmSU9XY2FqcXVLc0NQRldHeTE3YVZDV2RS?=
 =?utf-8?B?bE9mMjhhWGRUOXJwNUsvVjRwdkFFZmh1SlhiUkI4UlFRYkl3Sm1zRmVDb1Bq?=
 =?utf-8?B?S3lZb0s4bzcrcDg3ZGlHalg5bC96RldCcmVIa0wvaW5KNU9CM1l3YWZGdU1i?=
 =?utf-8?B?QUM1TThJMm45dThEemNJdnA4L2NXVURpKzUzWk9MeFZod3czb0FnczVxa1Jt?=
 =?utf-8?B?RUxkN1ZqR3V6aTIvbThOMk16TGE2N3cyeUFhYkhNaHp0VHZqWUlGeFdmbWhs?=
 =?utf-8?B?YUZHUFIwa2t2SWRqUXdPSFAxZzlPT0xlYTRNWXpqU2V1ZXRsajI5VkFFNVM4?=
 =?utf-8?B?eDJUQ3JOc295L2tNZFk2TllQU3ZyK1hsZVBWb1pXRFRRZ0JpR3k0RXJsSkZl?=
 =?utf-8?B?QkM4akt3cVZrdXVCdmhESEoyWU9iQS9EL3U0aVNtendSOTByQmFpSm8rMjZR?=
 =?utf-8?B?MzRMRGFTeHMwQmtQcmQrNXUzOHhoZm9SdEowWUZIWVgrRWFOajJqY2t6QmNr?=
 =?utf-8?B?Mjl0dXB6ZDR0MG5PUVFHcU9wKzJubVl0LyswT1JDY1REbDRRZnZ2aE1MRlUy?=
 =?utf-8?B?OVhid0RlNnBKMDhPbFAxem5JcENpM1dtR0k0SThweThTUWRSUHhja0xaQ3cx?=
 =?utf-8?B?SXBtRGtyejRCQlFUeVpXbE1sWEhYcTZPZEVycmZ5bUErWFY5QmJKdjVSc0pO?=
 =?utf-8?B?bXVwRDlEOXZsTy9LWlowd1MwbWJ2cjFTRlVhSHRoNXgveksxVUFzVFNVSStG?=
 =?utf-8?B?TG1zakhURlpncDVqQm9GMDN3M05LOXM3Rk0vbHZBNUM0ZTNJcFFSc2xXQzZT?=
 =?utf-8?B?d0ZWbkF1eEwvYktGMHBzdVVvZ2RHbVd1K3FOcGxwQ3F3dzNVSWN5cHBjT3hx?=
 =?utf-8?B?SUQyVWtFM0VrbHZ5eS9KQzhseUxqbUJoazJBMnd0aVhpWG5Tak9EUUNrTUt3?=
 =?utf-8?B?YWZWVndzTHh4S1hNdkwxWDI1UFNPM0Y3cEM2VnBxalVkYVEzMGVQWHJZQkIr?=
 =?utf-8?B?aERzMkdZaE9tRmxhQ1FEb3VDV2VSeStpYnY5MFJ1Vis1QWQ4R3M5Y1pWQXhQ?=
 =?utf-8?B?VUhlNVpRbmNCdFk4VXJ6N2FWZ1l4aHFVanBYYUpKMWkrNW5zVHVBOTZCaTNU?=
 =?utf-8?B?bE95aWxTODRucTJYYzQ3ZytRejR1ZytwaFZhWExrb2V2SUVyazJsMjVWM3Qx?=
 =?utf-8?B?L0s5YkZjRFBEL3NHVHZGSnZwWUd4YktBY3c1SGhNamQrTFA2T3pBdEloU0ll?=
 =?utf-8?B?ektTUDVGWDBxMmNoYm5BYzdVUmNKV1pqOW8weFd3UzJTSkRLRnJ6RzQyM01Z?=
 =?utf-8?B?RTl3Qm1TdW5HamgrYXFvdTBQb2kvYjdWeEQxc3pJNVF4S2E0SjIydUk4dVlH?=
 =?utf-8?B?MGZLNmZDR3hEZTBGaVdjTFB1aUxlWUNtcjYwQ3lkZXQxQkMza3R1VmVDZ2s5?=
 =?utf-8?B?eVJabzJINWxIVVN1SGNRdEtmVDUwV1ZaVFYvNXNyenA1UmZ3M0dJVnZCWXNj?=
 =?utf-8?B?YnZEWUx4ekJpbkhRUXg5dFRWUmZoUjZiZzlWOG5Xclk4VFQwS3EreVBORXkv?=
 =?utf-8?B?UkQ2dFphRWJPcVdYc3hkVXdoRFJKdDdMSXBSRE1tTURTQTBxSEN6c1RQTnpO?=
 =?utf-8?B?U3hIcnd0NmZPYXk5ZmtnWFpDeTFIeXlQWG8xZXRRZENjNGFzZ2MvTnVKREVz?=
 =?utf-8?B?TG5EVTJRaCt2NXozUEdndmNrTjhPamFGbWxiYXY2S1grMGJDdFpDcFk0bUgw?=
 =?utf-8?B?M2wvODEzZFpNbWZJbFMyZmlGOXJ0QnpjNVNBeU1nUUhTQkVvSUloeEcwRFVC?=
 =?utf-8?B?L2R4ODFUWU1rNHJsMVdQZnZySXFCNFNyTnNxRWZDQ0ZBeEttWXM5TE9ldE5F?=
 =?utf-8?B?dDBYa3UvZHhhU3JXSXludVJFRURzRkxvMEpyQlI1K09WMWUwVjFFN2VMQXFv?=
 =?utf-8?B?b3laaEN6eUxwbWl1UUdsM0tXR2RDYjd5TEI5MEpuL29xczNjOWZhYnlYZzhi?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86246485-f3a7-45a7-ef70-08dd628133cc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 22:48:41.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBRnSciGCp3m6ecPTQ8cUZY9GmNEbhRyPcmhqS4hgPaRRly91OTrwz9Xm1MUVaSBSzYLGSICsl3Q0/92eXvixrh0T7mlW2+UUMd7UmdnfgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
X-OriginatorOrg: intel.com
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/9] net: stmmac: remove
 unnecessary of_get_phy_mode() calls
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



On 3/12/2025 2:14 AM, Russell King (Oracle) wrote:
> Hi,
> 
> This series removes unnecessary of_get_phy_mode() calls from the stmmac
> glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
> already gets the interface mode using device_get_phy_mode() and stores
> it in plat_dat->phy_interface.
> 
> Therefore, glue drivers using of_get_phy_mode() are just duplicating
> the work that has already been done.
> 
> This series adjusts the glue drivers to remove their usage of
> of_get_phy_mode().
> 
> Changes in v2:
> - correct subject for patch 3
> - fix build error in patch 3
> - add attributations
> 

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 21 +++++++++------------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c    |  8 +-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c |  6 +-----
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c |  4 +---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c     | 12 ++++--------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   |  8 +-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c   |  6 +-----
>  9 files changed, 23 insertions(+), 56 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
