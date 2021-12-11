Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B4471417
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Dec 2021 14:59:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDA66C5F1EB;
	Sat, 11 Dec 2021 13:59:35 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C5DAC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Dec 2021 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639231174; x=1670767174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7RzduVg5yuQDZXjUsqJG9fdNjJ0S11aqRjrLj+L3Ykw=;
 b=Tf3dpBGGHYkKVwnsBdwpbb2bdkQAcY6ZMqmCMCGXfLkABMC8EjLohLjn
 WeEIoOaFvcLUKL+6oyBbhiAXmHKHDn1sqnicxxjKO9XyIyY9m0mr1JmCp
 CqrRdDKpxwDmPLZIGHfIYQbCwiW5JRFmTxt0qj47nPC33f7ANTI6ZZwcP
 oNvKv8Ul8uRy6h9MMdyvOGvrcdY7sR3jhO6NTw88QDQwKKwap5I3zAmoa
 8VVuSPMRARytWGrehUMGv8uiqMLMq55fUYK2c2bjoNT4tWZwy4y+TAJSJ
 Xy3ZvyBMOJT9zG3r25ATO0OaxLjTXIjFIuROkLwbFAd9DdVutXjEsPRPv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="225808289"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="225808289"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 05:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="565762268"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 11 Dec 2021 05:59:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 05:59:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 11 Dec 2021 05:59:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 11 Dec 2021 05:59:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEQDsHH35jh2vhFQL6A00zGt+NGqae8upS3wIv1OD+4JsTFUwmc2fhqiMigd8MwAEqvSaPAPT3+ypzAmaF7qJQVXkpvpW8ZWu88fIxwWaSfdOXaFTXTLT6HZIqVreNGeIYHT97o4lgwWxEQOjKyAq2/ddGINvprQSoD8lUWG5MvBsMRT+QvhMkwYaXhHiBSoPMan6jYEQwhCtd1bci3c6WI5cu3lT4H49S7/b1c5q3EY5hW5XBlAOASvkjmSdkX2IVgJBnk1kFfAVh9xXlTVN1++76etJlJPjva22smX+p2gJ0vlp9PSRsy8fhdQD5xBRHKQYA6imAhBtQR6RlYbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RzduVg5yuQDZXjUsqJG9fdNjJ0S11aqRjrLj+L3Ykw=;
 b=XjdgzLgyxH7Mp+4dgdT7ZaT93P9Zq4wUu0S1gD5TijziODBeDccW8ro1+AwBjkaSvzKRazxGq7wCti9Zi952VnaNfNaF0LVtv35tFAnYWZHOyYR1G1u8iOPIMIy00TbTJa8HGF1JPYHQN+AO+LW0svGnHjcukZ5LA2t96wktX3hljGoKMDY++rTYpbXkzeAKLsO6Ofbq5wSH9YdhOIudNcFkjk19EO2qrUJnxix9ECrJ0uY/EiU4wnJtQ/xyPP2QDA1NYFlwemX4JkQB2ELjR4nSiJGpQ0BgpCZm20Uz0hoIpy732sSwKYqcJODeiHkSbYns5sZ6pvXx92ubGhm14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RzduVg5yuQDZXjUsqJG9fdNjJ0S11aqRjrLj+L3Ykw=;
 b=PebesAlJ0F9esO49rJWRISB+VIbnzkSBwmKMy19snW+LNIMgFg3qNwFmDwDqXCSLDpz1FeMY9buYy+vswtaBJGOgWPRJ97hULLp41oPWQkx0uuTcUbBt29kaObnTTL7Qg40tZIJRppx5ObiV382wbITlj8p87GV0RFzS7fZiwFQ=
Received: from DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) by
 DM6PR11MB4219.namprd11.prod.outlook.com (2603:10b6:5:14e::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.14; Sat, 11 Dec 2021 13:59:29 +0000
Received: from DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::e08d:fd5a:f208:566d]) by DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::e08d:fd5a:f208:566d%4]) with mapi id 15.20.4755.026; Sat, 11 Dec 2021
 13:59:29 +0000
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Yannick Vignon <yannick.vignon@oss.nxp.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "Kanzenbach, Kurt"
 <kurt.kanzenbach@linutronix.de>
Thread-Topic: [PATCH net-next 1/2] net: stmmac: fix tc flower deletion for
 VLAN priority Rx steering
Thread-Index: AQHX7RBbS77e6pkAekizP9E4vauzMqwr7DsAgAFmvbA=
Date: Sat, 11 Dec 2021 13:59:29 +0000
Message-ID: <DM6PR11MB2780874495EC43159600767BCA729@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
 <20211209151631.138326-2-boon.leong.ong@intel.com>
 <e8d3e33d-a89b-bdcf-431d-6759e7b45393@oss.nxp.com>
In-Reply-To: <e8d3e33d-a89b-bdcf-431d-6759e7b45393@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a65da38-9471-457b-3fbb-08d9bcae7341
x-ms-traffictypediagnostic: DM6PR11MB4219:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB421960635F300C6970AE7021CA729@DM6PR11MB4219.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1EflvUEqVtiag6FgLU+cnrVzKI+7744cLOPuzQ5o8OUKPmiWPyDSHcuYas/LGFxOF+06/cVUYEmU1kynWDWWM2Ko2EOsN9pVrH4178JtNghf0jrTYV25BbBUTo3/subCatRCMQqWSEoNfebpM2II8Zb/aHO/0ZjI8XGwfGN86AskSDYCLheyW/W3EZJdVfcrhV9elIRSMyahnUeYwhgQzcUEBLakIljwcJcFrsPMLZn3Jum7KnctTwx+WO0MsGRw6PLIwqFWCQ7yU3Rvvs+QwPQh2vjA02wxKS84cD3KxF2XIcVkgrUPrnuzq2hqN1OSsubeYkIRpt2tDO+Ew7Y5iHch4Hg/gB7sdEp4VfUtwdhxpGgCfTd6PaIC4dSOIhe9uFkXsq1sT52icHtd8H4HuLi3zYeq8fbfg/xbsb2hFAz9pWmkhgnHsPdzVqHiBUKEdeuYXs08jh9YR2O0kkQTgI0tYFuPqQgxa+ORyzy7tNZCqQKwb0xoWZXBzaR+2JXKyfu1qtHMCcLXzs+FCFKWtm7T/DFrEfp1uUQsZ4r4g6J/egBhG7WfYbZjnDzt2UCPoB71thTMmKqHfh4IibQve+v2qRGLEgTNEInGNITiUB52aT4h4loyZFyE7yRQTWBc7s2/FexmiwjTwemylnDq5pRuP29sOovz3cxHKS/tQPGBqiPsXMHqP+kaDHQWLsZCPxWTRA9fDyEHmQd7YGuhrO+E+DhzWDsYDslqZULe5YMn1UUD1w5yldu5dy6YI2Q9svDmHCOzHsC0TK+pTcjDVv+O9QRwWGHdSX9CWSNidBcUZznBan5P//XREAjueoF4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2780.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(7696005)(83380400001)(71200400001)(82960400001)(122000001)(6506007)(921005)(38100700002)(55016003)(33656002)(5660300002)(4744005)(26005)(54906003)(64756008)(66476007)(66446008)(86362001)(66556008)(66946007)(76116006)(316002)(52536014)(4326008)(110136005)(508600001)(8936002)(7416002)(966005)(38070700005)(8676002)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkRBaVUwQTlycHZTMW14M2dQRDZxUkVnVlgxNWhlWWpKUnd1Z3Y2ZEEwbnVI?=
 =?utf-8?B?SkJxNko5a0pkaUNSSFhnNXBadWNXSStnTnM4d0U2b1lpQ0JsQmVLVVZPWldI?=
 =?utf-8?B?N2N4VEpJL29vdHRxVGwraUdSOUNNa2tqK2t2UFJ1Q29rSVVKNkFtYXF4elRO?=
 =?utf-8?B?RlpqV3JGQzk1NzQ2czhlUWFTMU1CM0JhelRxMVV0aUVzcEFKYWU0T2lCc0Vz?=
 =?utf-8?B?TFV3NFoyZU1obFFlZ25aM0FPQ3BzV09aN2p5T05RZDVIMUxkLzVxL1R4bVVv?=
 =?utf-8?B?ajI0WmRnY2xsd3BFTG9iUGRnYmQwenVKYk5DTVNGQmkzeGI0dTErNzRPUGJN?=
 =?utf-8?B?N3FkTU9xUVB1cW1uTDlESG9HZEwvS29iamVZWFBsQTExQTkxdkdZNzFWV3R5?=
 =?utf-8?B?ZDF0MUNTbU9RaWNwVkMxazZUejdLSWpQK25wWHdWbnYxYlZKMHA3M2NoWDNF?=
 =?utf-8?B?VDE1U21jVW9MU09xT1pOU3REenBLRytDS3hCMEpFbmNRVGtRUmh0dGxsOU5C?=
 =?utf-8?B?L1k5RExPZUhDanNIQnl1Yy9va0s3OHUyMUJuOVpJOXk4VmJQbnV0WVdKeTRW?=
 =?utf-8?B?STFYVGl4Y0FBZWFDcHdQNWpSNUw0Y0xFUU9JMEFXb3hFQzlvY2lUbHFuMlB3?=
 =?utf-8?B?MGcvbGNSdU51VG8vbGU0T1NUUEZSZUp4UmVsYjF4dVF1VUMyZzN5N21WVjZU?=
 =?utf-8?B?QVZEcnZBRjAxUzAzSVdpcXpCNWJiMlVDNXNtMTZqYjliUC9MSnEvTDJ1c1hm?=
 =?utf-8?B?REVhUnlKVFJpeS9VUUoxek5ITWRKTUVIaVJickx2Z1RTWDFOVFVvSHpFdkgv?=
 =?utf-8?B?TUtiTUYvRjBWYUlTWGdVZ2NITjhLM0pCYVd3UjRuUWEyZmZqVCtKZ1dmR0tP?=
 =?utf-8?B?SXYyY2tRTVpTakpPUHlHQlAvcUoxVXBFUGVpbTYwWHJmc3Zrc0RWY1NtTFJn?=
 =?utf-8?B?RGVZL3RTbzlhc25hVi9NaVR6cm1vc2h5SlhXN1loM1hiL0V3RVYrSWRIQ01o?=
 =?utf-8?B?dnZNcEpIQXB2a1EzdS9taDRoNXN1ZWdFRW40NURVenlUVm5oRmhTWDB5Q0RI?=
 =?utf-8?B?K0NYYkJWcmpXWGtKZzlTNXgrVDhwTEdBWGZxV2p0dHhBNmowRWExVnJwZSti?=
 =?utf-8?B?aU5Pb3dDVTNLc0x0eFZ4TDZFWWNJd1ZsSlgyTC9zYUsyTml1cXJYYU55N0gv?=
 =?utf-8?B?S21wVVNGcFM3c1dOWVBqMzVVRnozYVJVRHYyaEJKZU9FSzRhcjlJWUZRVlFG?=
 =?utf-8?B?NkJwaDFtUjYwSVpQdkZKb044a3RFWHhOQitvU0N4SGVXRDM4K093SEMzWHQ5?=
 =?utf-8?B?TW1ROEpMVGxwZFp0M3hFaUNoUTA5UW12OHdiVFIvMmJyNm1nclkyOTZHc0Qz?=
 =?utf-8?B?YjdzVjdJaTN0blhDalhIS2hRcjdPMzBCTnhSb2h6UHFFWEZEOVcvelE2bTR2?=
 =?utf-8?B?YnBsYWpwMmpML0RMb25acjhreWFHRC80R0hKMEthUHZXOUI5VmlZem5OQUlJ?=
 =?utf-8?B?ZDFZWmhkWWIrSmNXaXNwc2Z0MjRvdmJKV28rM1BZSm1UV05mYlBheTRtYzdH?=
 =?utf-8?B?bHZDeTA0U1cxaFJwT0xXemszb0R2RFVFZWJYUVlXbDFKaVJMV3RudFhMNTQr?=
 =?utf-8?B?blN0NGc5QUlpYUdBd1IrQXQxcWdXdVh0bXRMODNJYmNWcGJQNmdNNi9qSDF0?=
 =?utf-8?B?U29UclZJOTlvdG1iaytQTmRvSkJTWUdZUU9ma2dsWWpuVzhWWlpmdjlpdjlH?=
 =?utf-8?B?ZGxLZ1hqc3kxWkhiYUhWSEdPU3o0UEtaTGM3TnBQK284emVGdkJ0MVk2TGM0?=
 =?utf-8?B?M1doTjBoRUU0UW5pNmVLN2w1c0JDQ0dhcW9HeVgvL1J3WGVuVTB6Q3NncFhC?=
 =?utf-8?B?V2JsRnV6d0ZWcXZkQjBGbitNZE8yU2ZJOWlnWC81V2JBSDRXUDgvMExoMTNN?=
 =?utf-8?B?ZkpEbklvVDJrNThlRklNUVdLM0tSdGVKL3lwS2Nad2RLTEJqSnkvYUR3NnRM?=
 =?utf-8?B?dXB2TE1yTjJiaFFOcGpBYVVBME11dFphYUc0Vzc3U0xLK1NvY29yRlVoOU43?=
 =?utf-8?B?RjVnVVpiS2d4dk41cDVtRTNDbDNhdDdkL1Z0NnJwMU95MEhGU1hsV3FtUFU4?=
 =?utf-8?B?cXlDSE1hZ0dzSDU3UGQ2eGlMQ3RFWDNxWEpDNXhFUENrN3llZSs3dDVaakQ0?=
 =?utf-8?B?SzZ3R0JaUXVpcDEyVElROVFzMjVIdzFJVVFJVWg1OTNvTVNPaVpEUlZ0cEIr?=
 =?utf-8?B?K2tBTFVHbEthcUJWalIwam1VQWpBPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a65da38-9471-457b-3fbb-08d9bcae7341
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2021 13:59:29.3310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xr1EOJMdcZqhloJ1tHc7cx/Wbj3UdZ6vfHaXaftLC5UCxewnhSZ6gtF1K2jY8E4hRpzdXlnW9MD9+QQwnQBrKNwsYXroJmmMxe+5OXNpQDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4219
X-OriginatorOrg: intel.com
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: fix tc flower
 deletion for VLAN priority Rx steering
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

>I was about to post a very similar fix for that same problem (except I
>was adding support for other packet steering types)...
>I can confirm your patch works. 

Thanks for testing it. 

>Note that a simpler way to reproduce is
>simply to add a filter, then remove all the filters, e.g.:
>$ IFDEVNAME=eth0
>$ tc qdisc add dev $IFDEVNAME ingress
>$ tc qdisc add dev $IFDEVNAME root mqprio num_tc 8 \
>    map 0 1 2 3 4 5 6 7 0 0 0 0 0 0 0 0 \
>    queues 1@0 1@1 1@2 1@3 1@4 1@5 1@6 1@7 hw 0
>$ tc filter add dev $IFDEVNAME parent ffff: protocol 802.1Q \
>    flower vlan_prio 0 hw_tc 0
>$ tc filter del dev $IFDEVNAME ingress
 
Yes, you are right above. I will resend v2 for this patch
to fix the comment given by Sebastian on "net" patch version
here: https://patchwork.kernel.org/project/netdevbpf/patch/20211209130335.81114-1-boon.leong.ong@intel.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
