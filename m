Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B970B9BA1D
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 21:13:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0B59C3F93F;
	Wed, 24 Sep 2025 19:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2279C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758741210; x=1790277210;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=PGuUJ+n+OJdfLV5yTipwnMpEFIlzVd86ld1i4rnpkkM=;
 b=eFfwBroQoLGaVBzYK/F9w/5tCwbq+mRQ/qcHOClqrnrRl4+YsPK0vyWV
 A8D1aAiXe2XOrUprgxC1rjGfygfWMjMhqcnkuxaykBf1n5FGCEAiLVHW3
 5Jizuw05ITMoBKB8USlTv7OA+0rjUjiYViTt6hq/pTPz1CBwe3e2wfzPO
 PNJfs+FohorGZkl1F66K28/FPPHN+uyaIBFC9O8wa4WpVARJ92eGmul2S
 Qs9oTJaaAstEOoarAOC5hPUYgPNto/uQKVfpLc90ClnZ+/fhA4hsZWGPR
 TaPYH1sMdL0oF8EBS4m26iSR5bQeLjBac/iBGv3k06BtmZX9M6QH2AwRu Q==;
X-CSE-ConnectionGUID: jV++x0OMS9Kk0fvt/qOtuw==
X-CSE-MsgGUID: V2lgy/9VQkSPog0KkJY++g==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72475427"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
 d="asc'?scan'208";a="72475427"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:13:27 -0700
X-CSE-ConnectionGUID: PKX7ffxmTHerqfjfiv8U/g==
X-CSE-MsgGUID: 4KppkykVTAmg84lGWrPDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
 d="asc'?scan'208";a="177190973"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:13:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 12:13:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 12:13:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 12:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp11YnQHfSOisLJdXe+4qtHzV1QIIZVPFfOVr4rYm6CdtF8GNybCJFVejJ3me+6qUETTkKVBhNsnXOFkC18qqnuO69g9i7zfoabhfnajB4mKU8RMkg5uAiQKxI4vNBmKErR5LSluU2gGTxgdqgB8kxcCaBAi4EuJ6W7mtBPR5U6qVWupqW6k+qU3DcszUo/c5b/E5tLWv8ArWp9wol0QvDmMeHueviorIyPj6YCyBg8T32yEYOrE0DFFB1wO/8U7xMDYUtWC3BUXWP7irqdcrcsLP7CDN9eTG4fNCScm0MlHMvwhQ86t1CHxMuAmCGAwz9kfb1UkoqBraXVgp855/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7A/HEB90qtE7/0sB+Et3dCMtkr7Qn2Bz4RNTcF9B0g=;
 b=Lzf7eq2sh7We+nAAx2S0P0qCZRvRJevmUzC1jgascIyFfHQT1Yhz6AEAdGsYUGGdnL/T/s4ulDNaOdJNxa1KqSam4QvgzyCK39EvkDyOcYA3wlr1bxgT2D+tSdokBFQdpC2n11EaQiQZkUxpezH2CtciYPkNCTHuVnzWOrR2cB3uYzagy765Bq0zuvDg6MHAauNtUrFyxjMOLezX8m4PZR260usegn5EQGaujqjc4CT7rdHvmC3nhMQ1gyKeGDpyHGmXeVasXekao39KO8BHk/JgTlTIzWHQCFsCwBsWHAJyYAx/RVLE5h2Fwy420KLVt9OeorMaoi6GSiVyShgrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA3PR11MB9015.namprd11.prod.outlook.com (2603:10b6:208:57e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 19:13:22 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 19:13:20 +0000
Message-ID: <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
Date: Wed, 24 Sep 2025 12:13:18 -0700
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
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
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
X-ClientProxiedBy: MW4PR04CA0323.namprd04.prod.outlook.com
 (2603:10b6:303:82::28) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA3PR11MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3737b43e-8b8b-4cd0-1500-08ddfb9e6c9f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjlqejZHK0IxdHExQWE5YkdlQlEySFhvM0lwK3phcSswcTZkeUM1RWd0SHp1?=
 =?utf-8?B?cmtIa051aklzK2gxYWhkdVUwbHpSNDE1MmZCSHFvaER2aVZVWGY0YTBvZ0kx?=
 =?utf-8?B?am9YaGw2b0ZLUFdYaTlCbFM5dDU0ZlVsUG85Mk9hU1hSWWVyYVExRDN5R0pW?=
 =?utf-8?B?SWZKL2VVUmxxQVBDOU9kcVFyMWFJaXJ6MFlMdU9LOFo2Y0JkQm1zVk91QThB?=
 =?utf-8?B?RHczRzJUb1RrNjg2QlgrNis0VVAxWDcwZXFKUHpFWm1LRmliQkVrWGtaTmpw?=
 =?utf-8?B?TWZnSGxVSmdIOHZUc2pQWFhuS01WZ05FOUp5YXRDcGxkQ0ttOExFb0JiVEtr?=
 =?utf-8?B?TUN2cHF5eGoybWxzT1E1d0JnWjE1LzJUTjVEOEh6ek12ZHl2WVlydmRiN1BL?=
 =?utf-8?B?YnpUZEs2OVJjV2V5eUlQK2dQZGVWSjFNZ0pKR05xV01SVGJVTnpjR0FURzlG?=
 =?utf-8?B?TmdXSnpaLzlYZVNCd2l2SmpxdVRzT0o5OGVOa0VsQ2VIWWVLc2hKV3QzTEFt?=
 =?utf-8?B?ck45R2J3WWliNzNEOE5hNXB2UmYwM20xUjRNbS92c1pmUVBrZ2JsVmlsWGZU?=
 =?utf-8?B?TFRGRkVvS012aGhtNDNMczJCMkdVVzBBTzVSUG5EMUJXZTlsSGVtRzArWFRy?=
 =?utf-8?B?Y0VVdmF5SDBTV2R0TE50bjNpc1ZHeFVwUW10anNlSkl2YlJ5bEpSYzRFMG1F?=
 =?utf-8?B?SjJ5MlNPNE1rRVI3WWx2N2FFalc1Y3JaN2pydW5XRnlvcHNRcFpZTU5obmkx?=
 =?utf-8?B?dUw1YkN2VldmeWZoY3JydjFMM3g0bzFTZkNlaWM0cGNtU3NVd1BGY21WZXht?=
 =?utf-8?B?SkxpeXFSTHg1TXlwVSt4aTlTNGNFeUFhTmQyMjFRRmEveHZXbFN5WXVNMU5t?=
 =?utf-8?B?aVVLa2lPYnJ0c0FQcUMvWFo0UFRHRkFjQjNxSlB6TXFzSGNPOG5yQWxGQXQw?=
 =?utf-8?B?djU3NzNsQWFtSkZRdlhPb25vdGJmdzZMVklFTlUxWjRQRWhSSUE4bGN5dmgz?=
 =?utf-8?B?bzFYMWM5cytZQmR0N2tSaGR6SmxiTzAvcFZSWE41dUJDRUxyZVVMajRTQTdV?=
 =?utf-8?B?aHpDUDF0cVpkb21oQ3ZRclZqdnFwclFTd2tFNFNrRVd3bnIvemtsc3hRNit5?=
 =?utf-8?B?aWpFaDk5cU0vbnBLQ2czd2VOSU9MSU9lSUVON2lNZmNVQ3g1RVluSHRmR216?=
 =?utf-8?B?L1gzTTZ0SlY1NXNCSHBLeXBEZ1g5RVdzeDhSTFk5b3pWdkhIZjBzYVNZS2Rm?=
 =?utf-8?B?VmpFay84R1VHQ3lZUUFkTlJsRVRvZHBheFZKRWUvTDRRU0pkTE00WTRXUWl4?=
 =?utf-8?B?V1hBWHZ6dlJ0UjQ3cXRjN3FHMFhVNnNSWVduMS9xak55dVlIaXdlYnp1eUMr?=
 =?utf-8?B?LzFuUEV2VkNpS1JCc3hzOVA1STM3OEY2ZjJLYVpOdW4wNTQ1THQyeVR4SHZw?=
 =?utf-8?B?QVhwbFhrRnJSK3MzRVA0cEZVbzZuVDR2L2c5cnJUdTNOMGpkc1Q2c0V1R1FF?=
 =?utf-8?B?WlNrVXY4TWNrV0w2ZytRL1NjMStaQnFZRHRjbEthOHNiL0U5ZThFNUlZdU9v?=
 =?utf-8?B?Qk5YMGgzTWdJSElUd3pkd2JuOWFaWCthZ1U1cHRTdmN3N1pqYWxSbUhNU2U0?=
 =?utf-8?B?cFZjTmJsUTFNRVJiUW5pQlZ4cGRiQlVabkZlTlRESEVXamlmNHJOd0xMeHFT?=
 =?utf-8?B?M1prV0ZoMmRpSXBNZnZDKzk0T1dxdEZSVFo1Q1dONGJ4dzdKS1dYV1c5L085?=
 =?utf-8?B?c3hIYVRESzRHMUJodDVKNjJFbC9ESGxzbGNBQTV5R0NMbUE3U0Z3OEpoNjM1?=
 =?utf-8?B?TlB3d29hbEorSGNPYlI2SzZFNlBmdU1pb09jdlVFN3JKVHEzSzhuOGVHK2xx?=
 =?utf-8?B?NU81R1JVM1I2TlZORDRGWXVGdEFsb2ZLVno0TXdPYkt1eGpRZllXNUx1cS9P?=
 =?utf-8?Q?lJiMrK8OMR4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZFSTVTV0IyMXNQR2s4T3NUWmIxV01qZDZFK1NpVkUrYlh5S3RSMnYrL3ds?=
 =?utf-8?B?TnlkU204ek1GRWt1cFVaT1lUN3JnRnU1YTB5VzEwS0xURkF4UzZrQ2lKN1Iy?=
 =?utf-8?B?YjhnSjZ3bVVhdzVldG94ZW9uUXhOUUZYS2k0SndTeG51VE9hOTdFSXFqZTlF?=
 =?utf-8?B?eTVGdEsyM3hOaHBNQTNsOSt5NzM0cG54Ni9nWUdMNmtuRk5GRGNUdjF2TFkw?=
 =?utf-8?B?TkNSY29wSnVwUEgvWmN0MWlsV0U5bEhCMjdEVTlUMDAwZlVtWVNMWHorUGdW?=
 =?utf-8?B?dzR1VVExZXlQRWhKeHFqZ2RnMkQrOUhqUnlBSzBDL2RQcnlLOVR6SjJSZjdY?=
 =?utf-8?B?YThoemljSnRRMnVkTDF0MnIrM1VTZExMdHAwYXV0UzkzR05MWGtoaERMSEpa?=
 =?utf-8?B?aXdiUEJlUlVSWGpObExLOFVoeUlTZjVLR3pRK0xXc0tpSUl4UTdrRFBEUlFj?=
 =?utf-8?B?Y2VLYjIwSUU2cmNNNGNrTXYyaWIxVERBandUZU0xbDhMUVMzc2lYSkovSGZB?=
 =?utf-8?B?bWFmSHNvSWw0VDd6V003Uzg1cGhEQWpXYVAzSmc1dFV3bWRXT3NyS2VVcVN0?=
 =?utf-8?B?RmNWV1BDWnVVcFJveE16RXExTWY0OXd5SWtabS9JYXZxbU0zKzBmVFZpcm55?=
 =?utf-8?B?cThiQWlLdnk4NDRkcGdQUlJYVkxrSW1PK0FRa01qVDM2RUxqY2ZjZHJXeXBJ?=
 =?utf-8?B?UmxpZFd4Q0J4bjF3OGxyVVhsZjl5SkxQMHJWNWlLUzVFNDRWVUJpUXE4Q0JI?=
 =?utf-8?B?ZDdwUUE1REcvUURhTFBwcVI4WnEyeG1udE1TVnNBMkxkenNzK2JIUkVvTU1L?=
 =?utf-8?B?VmQvbGtQUDhxb3NvWGpBd3lWc0lKRWRHNGZFT084bW1YSjAzUDlkbkVqRFox?=
 =?utf-8?B?SmVZU3IxZE5hWGNMbFpmWHpQSWZiT3JoTC9uSzhtSFQzbjZXaGxta29Qd2ZD?=
 =?utf-8?B?MFRaS2FzRVQ1dXpBWDE1WUordjVHd0ZmZC90QUxYQlgyOGtvSTNVcWtScU14?=
 =?utf-8?B?SlkwZUlPcGRkb2JLNzlKRmpZMWFUQ0FRMVo1bVNsTExFM0pzTFUwUGVMcDRw?=
 =?utf-8?B?amg1SHpHUHREY1ZqKzBQZ0RMcWMrZXFEVXV3V3hrVk15Uk9JR2daWStYckhV?=
 =?utf-8?B?WkJwWkUrK29oSzdWZDRlelgzYUo5VDJZRkI5Unhoc2IvNHVvMkdhWmVScnBm?=
 =?utf-8?B?MGZrY0s4ZFlRcVZYdW1uTkpEWG1oUHMvSFlIK2RtMWJkYUI1WVBvVDhZZTlo?=
 =?utf-8?B?U2Zaa1cxSzdiVThocDBmcFN6Mk1TU0V2b2gzbm5ObmtqSGMrMTVQOThPckRB?=
 =?utf-8?B?SWFrY0NTbnU1aUdNbnZ3SXloT1p0a1czMG9TdENmMjF5emVVdENaVXNxT1pS?=
 =?utf-8?B?N2Juc1JTUlorWnNLalduTVpCdm9QUlVpV054UGJDaDM0dXhHNllSa2U1SU11?=
 =?utf-8?B?OUxMdWFKZHpOb2xEckdpc1dXbk9NR3ZTQnNOelBBQTRIOVAxNjhvZmZONVBv?=
 =?utf-8?B?OFpTTGpzdVIzNzd2WXVVbzVRZ3p5czVCYUlXOFJhbyt3c2ZQbXRWSkFIUnov?=
 =?utf-8?B?YzBLVGNnM284RUc5YlVQT1Q4VFFOMDFxcmROV0pvQmxKMm9Fdzc3R1c5YkV6?=
 =?utf-8?B?a2Roc0liem9nQ2hucWZKYXMwV0VoTzM3dloyYUdNZURMWk56UmM3bExJUTVs?=
 =?utf-8?B?aS9sYTluM2U0Lzh4Nm1KL2UxUG90SkhFV1NvUTNmUStxSEljbnR2N3NXYUFw?=
 =?utf-8?B?WmkraE43YVlVNENNTi85TGhpZkZjVmFSaGpUcWJ6VUxscDZoTk5MUnBNdytR?=
 =?utf-8?B?SDBwZDZYM0dsRVlCK0wxcHFyeUFVOWh6ek45ZUExRmNkUjh3MGtPS3B5QVJC?=
 =?utf-8?B?NTJwL3dPQzFWZE9pOC9TTTkrU1NycUY4M1JaSzBrNG03cisxTEZ1eU9ocVh1?=
 =?utf-8?B?V2I4SUYrLzA0VGIzMTM5anFHdjliWWs4NGlnTlVaekYwVnBPVEhiOXZseXFI?=
 =?utf-8?B?eHNEZ0ZYR0orNXdVTHJGSjhoSkg4ZzVzSWRxQlp0YzZGRDJ2SFlZZFRXV3ln?=
 =?utf-8?B?QUNpYy80L2ZxVGlSWkVmNXgrUVVXOCtUcHd2cm5sdVJmN2JqbUNqU2xZRzNG?=
 =?utf-8?B?V3RVY3JPdUxjcHVOa3lEelkvT3YvTTZqUFFkYmVGcGh4aFNRMzNxM1NQUHpl?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3737b43e-8b8b-4cd0-1500-08ddfb9e6c9f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:13:20.4050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW1BG7h12UV8PUtZwlyAl1BJTL+FXDBo4D396rsls/6QINTjnSJdus5c70OF66fsQFIKRwGQPdN2+JGsOEL1dpcp3IdpxfdwQzLgz8r3JTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9015
X-OriginatorOrg: intel.com
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>, Drew
 Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac:
	experimental PCS conversion
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
Content-Type: multipart/mixed; boundary="===============2884004935700880639=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2884004935700880639==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------3HQBP092X4ZovoddKl4yq7jW"

--------------3HQBP092X4ZovoddKl4yq7jW
Content-Type: multipart/mixed; boundary="------------cezbLSVVCgFm4dw49RQteAst";
 protected-headers="v1"
From: Jacob Keller <jacob.e.keller@intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Eric Dumazet <edumazet@google.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Jan Petrous (OSS)"
 <jan.petrous@oss.nxp.com>, Jisheng Zhang <jszhang@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Paolo Abeni <pabeni@redhat.com>, Rohan G Thomas <rohan.g.thomas@altera.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Simon Horman <horms@kernel.org>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Message-ID: <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: experimental PCS conversion
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>

--------------cezbLSVVCgFm4dw49RQteAst
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 9/24/2025 11:17 AM, Russell King (Oracle) wrote:
> This series is radical - it takes the brave step of ripping out much of=

> the existing PCS support code and throwing it all away.
>=20
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS=

> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
>=20
> The problem is that the stmmac PCS code manipulates the netif carrier
> state, which confuses phylink.
>=20
> There is a way of testing this out on the Jetson Xavier NX platform as
> the "PCS" code paths can be exercised while in RGMII mode - because
> RGMII also has in-band status and the status register is shared with
> SGMII. Testing this out confirms my long held theory: the interrupt
> handler manipulates the netif carrier state before phylink gets a
> look-in, which means that the mac_link_up() and mac_link_down() methods=

> are never called, resulting in the device being non-functional.
>=20
> Moreover, on dwmac4 cores, ethtool reports incorrect information -
> despite having a full-duplex link, ethtool reports that it is
> half-dupex.
>=20
> Thus, this code is completely broken - anyone using it will not have
> a functional platform, and thus it doesn't deserve to live any longer,
> especially as it's a thorn in phylink.
>=20
> Rip all this out, leaving just the bare bones initialisation in place.
>=20
> However, this is not the last of what's broken. We have this hw->ps
> integer which is really not descriptive, and the DT property from
> which it comes from does little to help understand what's going on.
> Putting all the clues together:
>=20
> - early configuration of the GMAC configuration register for the
>   speed.
> - setting the SGMII rate adapter layer to take its speed from the
>   GMAC configuration register.
>=20
> Lastly, setting the transmit enable (TE) bit, which is a typo that puts=

> the nail in the coffin of this code. It should be the transmit
> configuration (TC) bit. Given that when the link comes up, phylink
> will call mac_link_up() which will overwrite the speed in the GMAC
> configuration register, the only part of this that is functional is
> changing where the SGMII rate adapter layer gets its speed from,
> which is a boolean.
>=20
> From what I've found so far, everyone who sets the snps,ps-speed
> property which configures this mode also configures a fixed link,
> so the pre-configuration is unnecessary - the link will come up
> anyway.
>=20
> So, this series rips that out the preconfiguration as well, and
> replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
>=20
> We then move the sole PCS configuration into a phylink_pcs instance,
> which configures the PCS control register in the same way as is done
> during the probe function.
>=20
> Thus, we end up with much easier and simpler conversion to phylink PCS
> than previous attempts.
>=20
> Even so, this still results in inband mode always being enabled at the
> moment in the new .pcs_config() method to reflect what the probe
> function was doing. The next stage will be to change that to allow
> phylink to correctly configure the PCS. This needs fixing to allow
> platform glue maintainers who are currently blocked to progress.
>=20
> Please note, however, that this has not been tested with any SGMII
> platform.
>=20
> I've tried to get as many people into the Cc list with get_maintainers,=

> I hope that's sufficient to get enough eyeballs on this.
>=20

I'm no expert with this hardware or driver, but all of your explanations
seem reasonable to me.

I'd guess the real step is to try and get this tested against the
variety of hardware supported by stmmac?

--------------cezbLSVVCgFm4dw49RQteAst--

--------------3HQBP092X4ZovoddKl4yq7jW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQgQFSp1zOQVirsQx5qll0+bw8o6AUCaNRCzgUDAAAAAAAKCRBqll0+bw8o6LxF
AP9YN3Ecux9wX5jJjt/lyf1j3o6ZfCoAkE5o3M1fMh63JQEA5LOANQtz9afAnbwcWnuisaWLkgPE
emFvkRCcOjTx1gE=
=6nXV
-----END PGP SIGNATURE-----

--------------3HQBP092X4ZovoddKl4yq7jW--

--===============2884004935700880639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2884004935700880639==--
