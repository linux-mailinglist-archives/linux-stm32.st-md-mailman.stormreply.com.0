Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9508FAA6B
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 08:05:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7D80C6B460;
	Tue,  4 Jun 2024 06:05:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA68CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717481148; x=1749017148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9cLTA9gxwNuoxWsT1m2uuV4fMK9lUhJoNixF0Te3PoY=;
 b=CWZjnNvMeMChvqbtbItmcq9l9ZZRmldvI8PhAo4IsSc/ExmxEin1vZHy
 mJGSuGpXLlo1OxH4R8U313QQO5we+kzGo1G88PUP4cu/q0gSpwZ7AFJhX
 nJb6ojNZF5ffUtuYTS0LamOEI4XFxmO2PrXf7EWISXIHyZMy48KooCSRh
 unF62ZJcnB6Yx6yUpHwGhZWwz80Ze2mtu004JRoHLSn/X08SvFmB/Q1Ol
 5MpPnkEDRIc78dmR9YdNsejpziTs1C2x194qHcA9HXJNY808bVmDnoVn/
 iNHmCXPzkLMRrMuH1pgotEP1hBilDUSmnhAlyijNldqqCGoiK3T2xzZyb g==;
X-CSE-ConnectionGUID: v6BmqhB8Qr2Pj6X0mKqOLw==
X-CSE-MsgGUID: JPueJxkCSIqsGmqPFMNH7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13949935"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="13949935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 23:05:40 -0700
X-CSE-ConnectionGUID: QbWboP8eQi6w8HTMApOEWw==
X-CSE-MsgGUID: HTfLggyFTCKp+99EbC4y4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37105220"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 23:05:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 23:05:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 23:05:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 23:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVvitG/F/dNm5gDnefRQdvrY1Cp454HgEhhJ+jPZ1iwKQqPgrzaLFhsysd7SW8d2rT0xML0gXpBN7RiFmVzmFz9ggriLM6iyJQ8kc3bWib0dj7oDYbsutIeZ0ZsKWvmolypLYaYq452lMROtCfss7UcEJi1zh2F+EHaV0GxG4kZ56R3vlUbFN9ileoqdm+nBdtl1CYzQaLM1HgwWw0+NwJTSSBRHYFoUXjimPuYAbfS3GW+NXb1soIBr6v6HkJo2g3JwAwvrf4hITEIzMMw6q6uTc5W/d+hzL9e7qEajGr6M980q2R89cnEtmkwNkGB08yE6Sq8kjiKs2fQDJmkd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6EO1Rr98gyp5uY6pUBXo2zpl2GOPdHCsukQ7zW9NLM=;
 b=nhxwBQ7IoTY7ZuvF2uKhmVG9Vo7qOcnT9syzEvyVNiNlMYEVlVd5g3jmjEeAF7tuJQtoJyLUhz/ryhV7QJNm14W1r9rQyz963LgxMN4txyKLl3Qx2zx8MagwJhRT16Tz6eskBm9PtvxIIsfUy+yJxNXQOpTYmLhvkE87VrHgjSddOarroA45yPRuXxKsQC2PJdApnJL3kWeKm1ShDitwiFrvsRSYc9PJqHhZN7sUx6FdVIsXBGjgidPXAvDt0oQu/dLKCL4v1iR2Szevobvhhy8dtqoXY8B8B18HGt6wpnS4Osi3yU3fIPB5878JIk59ceSsqPaIgFAEPNBLQcNB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5748.namprd11.prod.outlook.com (2603:10b6:208:355::12)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Tue, 4 Jun 2024 06:05:36 +0000
Received: from BL3PR11MB5748.namprd11.prod.outlook.com
 ([fe80::4de:65ae:ca8f:f835]) by BL3PR11MB5748.namprd11.prod.outlook.com
 ([fe80::4de:65ae:ca8f:f835%5]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 06:05:36 +0000
From: "Ng, Boon Khai" <boon.khai.ng@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Thread-Topic: [Enable Designware XGMAC VLAN Stripping Feature v2 1/1] net:
 stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
Thread-Index: AQHasBkLCj07Z540QUGXqLg1tlacPLGrb/8AgAB3OtCAALcdgIACos0AgAA0dwCAB3I7sA==
Date: Tue, 4 Jun 2024 06:05:35 +0000
Message-ID: <BL3PR11MB57488DF9B08EACD88D938E2FC1F82@BL3PR11MB5748.namprd11.prod.outlook.com>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <48176576-e1d2-4c45-967a-91cabb982a21@lunn.ch>
 <DM8PR11MB5751469FAA2B01EB6CEB7B50C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
 <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <322d8745-7eae-4a68-4606-d9fdb19b4662@linux.intel.com>
In-Reply-To: <322d8745-7eae-4a68-4606-d9fdb19b4662@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5748:EE_|DM4PR11MB6165:EE_
x-ms-office365-filtering-correlation-id: c4705648-a379-40eb-cb4a-08dc845c59e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|376005|1800799015|366007|38070700009; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?EuftZEtTDOznYKLyKTmERnPyBtyA4V4KAiWa3EeY9k6jyEzsUsLbbyFHvA?=
 =?iso-8859-1?Q?XMfbHlcmCse5PUcxo7dxWmn5/6R8EtDODkAHXRifrTn1Yd6FynudjolMvz?=
 =?iso-8859-1?Q?SHaANtzP08vv/9Ae3l7o6DVVeC5AdEI1hir7Oe5k5XNnt9dN++RT6TE0Sc?=
 =?iso-8859-1?Q?og6AyRVncnuA0CPYV9R1AIUQnPZpwYBIkDMDTcX7V+28xqsgMDS3nXyS2D?=
 =?iso-8859-1?Q?skevJvrEr6Mb2ILHOqH99SkcA8rD4+HnLsyje5C/+l1xHOLYHVZKL/wY6Z?=
 =?iso-8859-1?Q?OvYw1XkbzK3OPg8sfcmjFLIaS4mI8pD9MIJMT9H3ii1lVpjo1/YhtcyDXx?=
 =?iso-8859-1?Q?dvy+hEY5xOd6e12LHzEz6oZOJcCcMmbUqVK9a+ngESKUZ0w7vYm99AI8vl?=
 =?iso-8859-1?Q?+Jvgr7dw9+ue70AD7Yqk+4Cw7Jv+T/4Yb9Z7TtSU0P/Dcp+OvtWIMr4GBi?=
 =?iso-8859-1?Q?RzjlHkW8pPMcicZGG7ToKNHDbfOeufF/mVY+ApNVMKY6QuIaGj+pmC7xYQ?=
 =?iso-8859-1?Q?DyQKkH20hwF13NJYCEdWdkhcQQsF2GJaNKWuzoJv56oq1Aexo0XClDpSkV?=
 =?iso-8859-1?Q?+41YaHb9Lh9xwQTU2RPFblqq/Fhuc2yHhsSDtmmTDMhfLpKoUkotKXesHq?=
 =?iso-8859-1?Q?Vyrh4t1eNUwHxZ4fjH6q9I/NJrcd6UDa9IzFnrqYm5a2yakaImb5Dc9D38?=
 =?iso-8859-1?Q?qI9G7vFRtKF356Be/srdQn2BuIonFRYjgWLPb0bk2aqykZC8VQ7/5rr2Iw?=
 =?iso-8859-1?Q?6WQKEGpQnGV6Iwr1oPp6sRyQAkBbddHCnRhJVXDgPueXxhNfJ9FLp+i0Kx?=
 =?iso-8859-1?Q?B08LvRk1Clz+Y4UjnfP5Kz1g7HwR7WKa0GA8iojaelNEyKYaFNUX5hvKjg?=
 =?iso-8859-1?Q?AtnYZo9oUpu4g04GAxMn6iIdIQcuJ3/6j5oQgZdqHBbgZDBbA+7XRa1fEd?=
 =?iso-8859-1?Q?TJaoUVnSBmbObbPQg2RN23Ff7kC8WvC6gM8S8mGuk1RiqLvRcLQFj0RhnA?=
 =?iso-8859-1?Q?P/87seBeFGh6RZwXXREu1KMCOEQIlImwODSY9JWY+uHfHZ0n1DuoMZpQeI?=
 =?iso-8859-1?Q?ISzgpSi4sn/QfB9LKu2/3r90s01GBbqZMNgWES58FyDLvDutU5oGdTAd1I?=
 =?iso-8859-1?Q?dW/gQ8i+D+60FgNpTE4x5iZeOFetxuyEdOenT4VEJJ7YULFdjcwIZ7WuXG?=
 =?iso-8859-1?Q?cIwL3UBYwfDu7q+lAiVwmKRoj/y6Co+g2az75S5euPuh6C+ge8/NZjhdLA?=
 =?iso-8859-1?Q?oU3KotKtMVLEqPh63qHGTLQsTcJ4Xkk1IkQRL1D5z8lWpzcX3r0B+P6ycX?=
 =?iso-8859-1?Q?2R49ZNd9XnigvsBdO5wC+gT2+ZF4FxJz2Di/ZZkabC385hzDCuQKoy8Obo?=
 =?iso-8859-1?Q?3NzVXYdRKaYh4pfLVG/suA8C3yPYOtUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2zfqMfi2/WiMygIREk5pi1V64umL3Sm9lpwosWlMjzpEMDtbAZ2ogmCFm2?=
 =?iso-8859-1?Q?IxCEDCHXU6PV9WMvoJATvz8ULHnCFbVY1Fgx8z9Zc02H3hTNhHdw8mARGb?=
 =?iso-8859-1?Q?bsz9YfpOvcBd9BBFJpBoZRwtIGTWPpdbBWWAY0HKAlazdlz9UqTD+nmcmm?=
 =?iso-8859-1?Q?rKwWTQKHX8XSzbU+d3uRf9Np4C65fr6RalWxS3q/JB5CIYqN8o8PJUrNiw?=
 =?iso-8859-1?Q?aq+GaIbpbSzOnq5JsMwa9tn3u2R0jc3PG/gYl0k0wcUz1DpOZFNDZsqZH6?=
 =?iso-8859-1?Q?AWjrKAa67rPjwhdOt+3wbhVIIOMbyoReDDF+XXH1tK/hWFyBOtRevZ0bvH?=
 =?iso-8859-1?Q?JYqs2+Wfl8pxmrIeTomsaZ0+hDsko+SWV07ypBgxi5Z48ey7MawfoBsPTZ?=
 =?iso-8859-1?Q?vTjW6hin6Oa+IDdcOMH28i6tm8Lav4zA2O6xHSwYuf+S7qrEV05sF3UxUr?=
 =?iso-8859-1?Q?o0HoDVpMdV8y05YLAakD+lpFT2b7pn7s1fphmeaSXXLzQGyLvKH11eEXAy?=
 =?iso-8859-1?Q?6FNV8zk0P92h7UrAcoG17gChdvMhnldrJJH2nxGTUDv7S9Wtkm7LTGkfmf?=
 =?iso-8859-1?Q?Pa9du6hxjxo8FyIsScxbz0hxKHIcstM3dd9k84mXMlMi/p2VHTbHgLCCMy?=
 =?iso-8859-1?Q?3YqvgoRP9z2IIzfrcHQlA9r4DFcqVo7M4upi8Q1ykBimc/9EBna26leLN4?=
 =?iso-8859-1?Q?PRP0bpE+WrtDuJxQCl0U2LoSUlLvE8QNQDet/L3Kpj/da9R1M4Zi+8e5uV?=
 =?iso-8859-1?Q?HjTccUDLP+1Zx5Cs+d6O2WV9ycsrUt4mI98CKm1eRwPjIAPK2kzXkzcMsU?=
 =?iso-8859-1?Q?9hoQGezdC3bCrfHfWXSTxKXqgN+KkrLhz/2X0pnKDimT9ZVKI3gxvBFpdQ?=
 =?iso-8859-1?Q?ZD97c2kvsyn9yrXLmUuvMWFpSKyFAZSPY376P0sqZ0m+fZhmPOcDVdZafU?=
 =?iso-8859-1?Q?6ghWm/2fYIRiywaBiw7D2XgC0jzynsNtoNZkAq+4y3mGaT2DtJQvkn0bID?=
 =?iso-8859-1?Q?rMkS3AXkhsbalYDnWki2bq7l0HCT8SvtlnzP2IIANcWyGk2NC89z0DoUPJ?=
 =?iso-8859-1?Q?tFKkQzbzXyTZzsRL5elGDRpDVVyQv1CGHz/WmfmdL3evRwcJdE/O3wAswb?=
 =?iso-8859-1?Q?0zDncImdUMEARkQbD6KyrNhWBCldNdSYaK6dBVtUGR3o1xbs0qXlmQQDc0?=
 =?iso-8859-1?Q?VeN9u7l8mBT0J7pJV8GCGNAxVorCEGa9EHQKl2FAIzmzHVKm1Sw7vtAwel?=
 =?iso-8859-1?Q?GSbYryAlYwwxYChHgJECfXxLVCDhAv3Fj9STFWnEvcrcuTJ0n0UrqLRhYW?=
 =?iso-8859-1?Q?4GkhCphhxeNsD9zOsgU2Jx5XwYPPxWTpoEZK8v/xnc+Ozz/Gl5ThhnRt8/?=
 =?iso-8859-1?Q?+2XwALUMSBw9NYL6XiZa0UMliY7qjweaTJkiwu1HKKOVehU1qN5e3dP9c+?=
 =?iso-8859-1?Q?VO8AgDyBPRZ5CSoRNY1OvOk5YnSTtq+A7hZvxby2sP/BME/pJes0onW2tr?=
 =?iso-8859-1?Q?k89YCZBY2B/vrdxC0H7KZ8wfxme5PYU+65SlX5xmRKbxhm69PdT6HG46gy?=
 =?iso-8859-1?Q?XgyzjEq4b3v3e30/ieK9AYkzabesTbdy6Cjtxk6FWjUV0xBtBioZDc1a8E?=
 =?iso-8859-1?Q?XHBgbDQ3r4YtsKE1+UFdu+Nv+pgMHENE9N?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4705648-a379-40eb-cb4a-08dc845c59e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 06:05:35.9656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jy0Hpa/nLzViUqDND2sZbD/xJ4mnx6dkYA2T5Xx9CJNaDRm5NjbAWA8cOa4UtyTmLqEBP1rhB6SDi8rfJ4x7SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub
 Kicinski <kuba@kernel.org>, "G Thomas, Rohan" <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 v2 1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN
 Stripping
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

 
> You should generalize the existing functions into some other file within
> stmmac/ folder and call those functions from both dwmac4_core and
> dwxgmac2_core.
> Do the rework of existing function & callers first and add the new bits in
> another patch in the patch series.
>

Hi Ilpo, do you mean I should create a new file for example,
stammc_vlan.c,  and move the common vlan function inside?
so that it can be called either from dwmac4_core, dwxgmac2_core 
or stmmac_main.c? or maybe I should just consolidate them into
stmmac_main.c?

> Unfortunately, it's hard to catch copy-paste like this from other files when not
> very familiar with the driver.
> 
I totally understand that, while I think Andrew has already call them out
In the previous thread.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
