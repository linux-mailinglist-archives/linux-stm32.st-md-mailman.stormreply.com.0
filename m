Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A8A06EA2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 08:07:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E9DAC78F67;
	Thu,  9 Jan 2025 07:07:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F617C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736406448; x=1767942448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=45ONKrXhQREDNDfcMnzxsbtQWfRmxuyltCAWcjQUDM4=;
 b=hxOifrC0Szk2RjMgetCAQWif8YMYXCNg58K91mEpgphMv2fXGf6UaMJi
 7KKIzR5RRpbuSqpzBd7kKhyN+Uy+QJ6zcErVK69+Oc2/PPb3R7oIIPG/+
 CKU98hlZKlf6H4aUJ1ZBqN/QNeIPm0qNIegfvUXPlwH+vLVnU2DJ01bVQ
 nHLuToF8irWawHx4hiL19EgqNpd+Jt0qlUpG1sbCvYlRAkc42+p3Y+oG5
 G1kAaPCo91qOdCF+Jy3KfnGsMJb86gxGPI/uyyy3tafzrFggpNApNT3as
 m0o0l+5q2WhsCnhpYhzzOTwe6IsmnQTA9aNgS2owHcL8XNk37CNdoLE6y Q==;
X-CSE-ConnectionGUID: cdqfI5cASVOTDHlRMH2eTQ==
X-CSE-MsgGUID: LnzDuCa6Qfqyt8e3tfhY6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40333281"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="40333281"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 23:07:20 -0800
X-CSE-ConnectionGUID: YOLrmAm3Rayg9WtxPAGx+g==
X-CSE-MsgGUID: NdiR7HPFTlCHoC7oyIqENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103524701"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 23:07:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 23:07:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 23:07:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 23:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5FYiiW9NCoNYF/pkDVhEAcM2qAKHbeIfs+eQ4pATZg1jP9iQh+eshVoA2XpyUUun/lcsIUfA78lbfVFFL9UxTkg9dISuRpLadWBx29UoKRI8c3p+yr+zs86NGRdvsIT7Fx5rQjueEW3fVJmLTVq80VAzpujYDGiVeEx3aZi59VZCmms3Ck3IuDpOiZfr+aDa3cvgfdMloVJT65NABjFT1R9CFpzvfv2cQ/LNMEe8i5hKKTZ6bBWP9RRZoNP4wQBOe9c19K/Pu8oEC05+6a0C/4avFbGmM9Mko+hXRh7g4U5d3K8kxRcgG73ruv7Q91BtnRLa6kYE72f8AzsSukJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45ONKrXhQREDNDfcMnzxsbtQWfRmxuyltCAWcjQUDM4=;
 b=H2Gizf727tW2e4btVVHXwTNntuRVNAV/141dWJ/iiqmCb2yItKVyEyyvKrlaFbexKfD8ks0URUgAeClF8gNsABaAE8MVeUV6fp8A9lNbnaY52WnAeFuyQs2JZj/vuCo43ryh732IdbNXmwJHqx/wB0r3mf/almGsMEoxCB2H/rcWKYoMFJbhk6ZDjYVeP2mORkP9VAjTI95ZX7yNirqC7rygsQldtXf35JQt3KKtlbRfL1pIXM4joUjrxCr8H5hNDdgoAsvc7ZU6hwxSTcSOV47gzMKU9Gop8Vu3KWboNRk84rnkNXrKWHn8Lnxgks/jSczelPpf0td71sAMpSuoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 07:06:17 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6%7]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:06:17 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Thread-Topic: [PATCH bpf-next v4 3/4] net: stmmac: Add launch time support to
 XDP ZC
Thread-Index: AQHbYELawmQBktcQAUCu97noioT57rMLjMsAgAJ56yA=
Date: Thu, 9 Jan 2025 07:06:17 +0000
Message-ID: <PH0PR11MB58304082BF0EA96D1A74E4C5D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20250106135658.9734-1-yoong.siang.song@intel.com>
 <Z31fXHxWuKNog_Qh@mini-arch>
In-Reply-To: <Z31fXHxWuKNog_Qh@mini-arch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|DS0PR11MB7969:EE_
x-ms-office365-filtering-correlation-id: c2fd9521-b31b-45e2-51af-08dd307c1d0e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QXRDMDlrY2h6QzhLMGVtSU90aU1zcVluNnlXUkNqdXByNzRkWWpUcXB1bzJM?=
 =?utf-8?B?b0F1OUlCYnlMU08yK1JHSGQvVW8zR3B2Nm5ZVW52Y1ArSElrS1VXZVNIWFdh?=
 =?utf-8?B?anBJMnhJSGpIblVZVjlrSzBTQUFTc0Q4dVZteXBFdkloZ2p6WGtQa1I1bCsy?=
 =?utf-8?B?SGR3L21CTitMOHNRSFNIclFwZUtOazZBbjZud3FmMjhSTXJ2M0laaHl6cDdz?=
 =?utf-8?B?Z3pVcm8xcVlteUF3UGw1NktUNFBnU1pEbjN1R1pzSjJGY0pUaFV5eDlRbk5Z?=
 =?utf-8?B?eVF5SXBIa0hmWjNPUnFmUnpoOFBaclp4dmVtRDRBdmhuc3Jwck8yUTdWU2dk?=
 =?utf-8?B?bklOQUE3dklZZW1ZOUVxRThxd0UxWHRuU3d5ZHRzUUttZ2hxWVl1WHZlTEw3?=
 =?utf-8?B?UGc5OVkwOU1reW1vMEI1ZWhzOHBYKzJEQjdEQnVMbm9Tc1JZa2paU1diWU1u?=
 =?utf-8?B?UmM1R2x3MEhaK1VKMFlHbzJPMXlwQThhT2NlcXltbmN6QkNNS1B2STI2LzNK?=
 =?utf-8?B?UFU0anVRaE5PRzRLSXcxYjFYSXpaUC9hTDZ2S1hhcGJDWGJxUmtlaHdiVHNT?=
 =?utf-8?B?REEvc0laYWZHaGxvcUxWYXMzdGpML2UvY0s5T1JBOERoeGlQMUJWMXZxaEtI?=
 =?utf-8?B?NXpVUEFnelZGa2I0a2lvUkdkSHY1SHJsZnkraWhpNFVtVks5ZGIzUEdMUThh?=
 =?utf-8?B?VTUxdGs4TDJ4cTR0ek9MOTVvaDRNOWxwSnB3QWlETFdQaUQ3SkJIc0JpMXM4?=
 =?utf-8?B?Q0JOQ0JDbm9QMVkwK2dza2UrN21oRXFoQzJpSlNFTFBIZlc3VnhJd1dneFNQ?=
 =?utf-8?B?NkxkRmwxSzh4S25HT0VoU2wweWoyNXFUVHk5OEtQdGVwYXhaZVV0QmJnNGpQ?=
 =?utf-8?B?cWRwNjR6WTIzNmduT0xPb0g1WFpOUVlKQ3o4OGdvN1JZc1ZCM0k3WjVLMXpU?=
 =?utf-8?B?dWxER0pSbHlRa25SMFZwS3RoUWRrd2VBOFNFZXVoVVJoS0dRQXhFUi9jN09J?=
 =?utf-8?B?MnJUOVU1ZWVQL1EyMXdkK2NQUXlmTWRreWowVmkvSzBYS3ZxMUlKWWI0UUw2?=
 =?utf-8?B?MnFPSnVjSmRlRE1udmZNdmtrbXRmLzVLKytJdXlab0NzYWlyRUs3a0Y4UVE2?=
 =?utf-8?B?VklPK0wySVNVT0VxTmduNXl0a1VwdlZ0Wjk3T3F2c2l4RXk3ci9nV1IrY3hW?=
 =?utf-8?B?SDBuVUFUTm4rUnRsTExMekxmMmZUWVlxS3JYa3hkZS8xczdaSmQ1cVVjSmdG?=
 =?utf-8?B?SU9uODlNV1RoYlBBOHo5NVZaajBqNVJ6cmtXM2tBZzRFdkJFSWdmdFdNNHNM?=
 =?utf-8?B?QkpmdU45MkpCL3BQdkVPekhzUU1QaGtlbWVrWnZWRDNrRXVjdDhPMy9VMDM4?=
 =?utf-8?B?UTBSQTJJL05JM2JFOUgwWmthOHdXaXdSOWtEb2MrWFJGTDcvYlZKU3UrRWow?=
 =?utf-8?B?clY1SnFDMTQ0S2NlOFhvcUlLc0s2SVRLWVRGWVVVQ1pXT01Eb1YxODFOWWpE?=
 =?utf-8?B?Z2U2V0duUzMramtPYjlQNk02eWlDMUFrbStyempHUmlPc2RuaUtobFVJVnov?=
 =?utf-8?B?bWcrRVdnZysxU25ML1VudVF3U3ZpZ3F2RlFjVVJVelgrRXNqMzFZRWo4ZFNi?=
 =?utf-8?B?TDZhNHZRcUVxazRPdWdnUnhLYVJHNjZMVzlkeDVUZmJwYXVGZE1jcHhlbjIz?=
 =?utf-8?B?QWxxMVA4UFBWZ3Bvc05jZGNtYVFOL1NaRVRWblh2emxEaWFDMVp6U1ZjV2JN?=
 =?utf-8?B?U0Y2QzlpSWlJZ3hXR3BXQXhkZ1ZyZlN1MnUzS0xzUVJoREl3NWtHcnk0bkxG?=
 =?utf-8?B?V0U0TVo3NFpzaVhmTjNncUZCbVpSbFhHUW9sVGY5N2pyVks5ZWxOaHJlVHRP?=
 =?utf-8?B?Q2lhMmMrU2lldXpXL0J4bEZYVTFjTGJDamRKTTk0M2FDOVY1YWxPUngyMkNO?=
 =?utf-8?Q?M9nHRWyfZVeDFh1NJ9uzdq3kJv594UG0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1BYbTg2TkRjcjlUWFJ2eGpJc0N0RFlwRjYxdUFwL250SS8yTHRTMUQ1TUZm?=
 =?utf-8?B?TEZxNGo5all5K29VaDNxMExiVWN5bGZxOW1sSmpyb3VtTEVNRU03L1VKNlVi?=
 =?utf-8?B?WTE0RWRkZitHM1RRSDBXTTFkZTAvcHBWMUU5bStJc0lva1A0aXJOdkUwZ2FM?=
 =?utf-8?B?bHc5ZFV0TktQdWh4ZXgwaDFRdWpiQThuT1lZdEpTaTNvRWlQRlBtZDN0a0pp?=
 =?utf-8?B?dEJmNE15dGlKYUdmamd5di8rSlMzREFEcmY5RTVWS1VUWk5XYXBIRmtQTkNI?=
 =?utf-8?B?T05FVUpHclZEWTI5SEpwYTk4QWNNS21aRTBNenhhVjYrYlpmdEJIS0NocWpX?=
 =?utf-8?B?cGtSS3NLNFZiV2liV25EN08vLzI3WUNTTWFDVmpkZmlEQ05RMkV1VS9QdnlQ?=
 =?utf-8?B?YktZTDJQbVRhRTJnaFdsbzVnZUtJb1BtOE5SRzRqSks4ZE9hSzNWZGRuNjdv?=
 =?utf-8?B?WEpYSHVHR2tYZlJMZU0rdzVPTTJSdHV1R0N3MGRpbVBUUEhXUitrT1I5WHlO?=
 =?utf-8?B?OVRwTXFNYURaeG1iUC9ydWpVUWdvR3AvSjRNT21LVnJUTnYrSE9ZSjZEcy9K?=
 =?utf-8?B?am5GbURIQ2xWTUh2dVBSOFFOWUljdHZDT3dJTkpmb1A4VGNERVRRYkZ3Ulc2?=
 =?utf-8?B?akJkWlJzNzBXNm9XVHNNaUxtb3hHNVZXbndHMUNtblF5cDByMXQrVTNHa3BG?=
 =?utf-8?B?VDJYdXpBZUNtVWFxRFE5VHFJeE9RcjFFUytNOTRoRXB6ejllMWgwWlBJWGRN?=
 =?utf-8?B?emM5MEhUamt1ejJGd0tXUXUxQk02NjFpOURaZWlEY1NjNWZTeWpyYU5aWXJ4?=
 =?utf-8?B?VnhZemhmVVFaMThvTFgwN2tHazRmV3pXcWhWY0dNcGRlR1hxL2ZhbEVmYlBG?=
 =?utf-8?B?T0o0czZRMk9vZUZxOGtKVlRJa1dQSWd3dzBpZDJMZEx0dEVyTXpzWlliRVhB?=
 =?utf-8?B?T2ZtR29HWDBhaWczVzlJWUErUGtDeWFwSDladzRWekJDRUFKbkZVQUdjc2RS?=
 =?utf-8?B?YVpJNW5DQkFPcktvelkwaU9UcTFKbEtxbk5yVGMrYnk3dXlZTnl4TzJKQTFF?=
 =?utf-8?B?OGVMOGx1WU0vZ3BRS2FDNE9SMm1jSjRWQlRWcHBIU1VXSy9XZk0weUpITjVI?=
 =?utf-8?B?Y3Z4ZGtjelJQTlZvdWVMMDFxUStaVVNzNHp4OVlPMUZUbiszMmVpaUJncjhR?=
 =?utf-8?B?THpTRjlsamhSbmpvSkxMWEJGalV3UllJaEI0ZHNuWExHZGRkbFZwbGZYWjhK?=
 =?utf-8?B?aVJnTy9JTVRSZDhPbzY5aVdGSXFidGNMMVhDU0ROa2ZRdlVONmgxU1dnV0V4?=
 =?utf-8?B?QnNqY0piSzZzaE9mZ0J5UFNjZkxZbExrWDhuVlFWTE5KcVRIbDd6RVVnR2Ur?=
 =?utf-8?B?QmxyV3F2MU1mb1FaNFdRSWJ5K1Rkb1NuNzdzYmNMRGd2ZGR1ZjZkMXg4QnlO?=
 =?utf-8?B?dzMySnlCS3ZabGlJUnBEeWJxK2VoeGhzcjFCamFpWGwwZUJSY0RaaGhnWXJL?=
 =?utf-8?B?aVdMbGdqVmxKMWVsQWZ1bWhFNzRLc3BBODNUMk11VXNXMjNqcG1UbHNIVDlQ?=
 =?utf-8?B?ZGxzaHdJKzYzK1RsU2hjVlRmOE44b2hWQ2p0UHJTYVBoOXU5QXgzZ2dXQzZU?=
 =?utf-8?B?N3J2S1h4ejFDUjVrUXFZVGhvdWgwMG9maHZVMHRFOHJoaCtrelhHcy81TnBY?=
 =?utf-8?B?bzRhcGE0dDAzMnpmdzhiL3BFcURQbFJkTjZZSnpYenRhYUwrcmhEU0hCaHBt?=
 =?utf-8?B?MlYrWE80REwwekU2TW15OXFxSUJQQkVLLzFzM05uZDNCNHdpRUQyRGNsSTNr?=
 =?utf-8?B?eGl1ODFGR2FaekdVSmFJTlk4R0lUMlNIbENBZFl5NGlqNjN3enBhQklOdm1z?=
 =?utf-8?B?bEhHKzZtNWtoQWE2Ym1uZGYveVBpSWhLQXhHSFNQNmpJYXhaQzlrdWhKL2kx?=
 =?utf-8?B?N2l5b242RlFhMmdhVEV5OTA4NXAyYkl1QWFqZFJrY2NYaVJKdnhOQzFLQWpq?=
 =?utf-8?B?cmkybUN3RHZMbVRCUDE3WW1YcFIvcC9XcFlWd0J3NEJIUUdSTFVqNkNtZmlF?=
 =?utf-8?B?NkI2TytoR3lldWd6eDNXMWcyWVFhZ1RhWEhSaVVHNmppbDd5TmpmOG9vVVdL?=
 =?utf-8?B?WGxpWDdCS05YY3ZRNXJJTzYvcmNSRndiK3hic2FyTmZUZUR1UzhYY1FDakg5?=
 =?utf-8?B?bFE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd9521-b31b-45e2-51af-08dd307c1d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 07:06:17.7553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9ZpUh1kjai4qOQDXXAjYAq1urRWGLujLuavfA2wWwLUuv23yAvDVbmGg7VF2H2kdhZ+Fn8wvetDHNygvvvzpUZLujyfe6XiERevVem0eVE=
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 3/4] net: stmmac: Add launch
 time support to XDP ZC
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

On Wednesday, January 8, 2025 1:08 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
>On 01/06, Song Yoong Siang wrote:
>> Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
>> Tx metadata framework.
>>
>> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
>> Intel Tiger Lake platform. Below are the test steps and result.
>>
>> Test Steps:
>> 1. Add mqprio qdisc:
>>    $ sudo tc qdisc add dev enp0s30f4 handle 8001: parent root mqprio num_tc
>>      4 map 0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 queues 1@0 1@1 1@2 1@3 hw 0
>>
>> 2. Enable launch time hardware offload on hardware queue 1:
>>    $ sudo tc qdisc replace dev enp0s30f4 parent 8001:2 etf offload clockid
>>      CLOCK_TAI delta 500000
>>
>> 3. Add an ingress qdisc:
>>    $ sudo tc qdisc add dev enp0s30f4 ingress
>>
>> 4. Add a flower filter to route incoming packet with VLAN priority 1 into
>>    hardware queue 1:
>>    $ sudo tc filter add dev enp0s30f4 parent ffff: protocol 802.1Q flower
>>      vlan_prio 1 hw_tc 1
>>
>> 5. Enable VLAN tag stripping:
>>    $ sudo ethtool -K enp0s30f4 rxvlan on
>>
>> 6. Start xdp_hw_metadata selftest application:
>>    $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000
>>
>> 7. Send an UDP packet with VLAN priority 1 to port 9091 of DUT.
>
>Tangential: I wonder whether we can add the setup steps to the
>xdp_hw_metadata tool? It is useful to have one command to run that
>takes care of all the details. Same way it already enables HW
>tstamping..
>
>Or, if not the full setup, some kind of detection we can signal to the
>user that some things might be missing?

Sure. I can try to add the setup steps into xdp_hw_metadata
by using ioctl() function. However, there are some device specific
command, like the number of queue, their priority,
how they route the incoming packet, etc. I will try to find out
a common way that can work for most of the devices,
at least work for both igc and stmmac.

Thanks & Regards
Siang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
