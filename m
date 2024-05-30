Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC28D44E6
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 07:48:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F08DC6C855;
	Thu, 30 May 2024 05:48:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D390C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 05:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717048116; x=1748584116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yaZv0Y+PLZ3MirOVOMgLbfc2DGi+feG0RwrBUkXS868=;
 b=m4dK/rcXf/FSXrnkHHbOPJl5iQWAQiNa1rbRfs0sLgyWnPM2lVz67cG6
 FbnOJwF7Tfl0ZLn7LK5kK9R+vyw5b3womiugTH2rO4f+3VeyA0Psg+kb+
 PsryefK5KIs3vrmqkk3YHuOoGikfeoBqlCynZmpKVfL7DDt9NmrZTqzI0
 xfSKZ4c6s0bsQYJVsn4Y3eTewhn/jCCfsiKo7t6BMKGwSbo7H8v0fWGu4
 wrtkUF3JxeAN2r+0qRyXMdFDo0a91uTP38ByKxK4f7/S+dmIaDFmazE/u
 JliwAjBuKaei0yCYJWf/acMgCdQRUYg9xwso6how2tz9kURFCYAN6zUBW g==;
X-CSE-ConnectionGUID: d7kv+90GSeClyi/YvMI7RA==
X-CSE-MsgGUID: k0/yxM8xRaO6bzUARecXVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24917782"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24917782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 22:48:34 -0700
X-CSE-ConnectionGUID: otKM2fomQ66JRasoD4bYJQ==
X-CSE-MsgGUID: Lo8tN2avTk6brpDV/ebl7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40130141"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 22:48:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 22:48:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 22:48:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 22:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W12+JTjttI9dpOYNS5FsIdgwycyUayG84lPzwBmEIyxp/zpDPKBOaHiE/qxE1whCtD/g3bn+WEzc+CDwD8oeIRSmrFb+DOtBO0n2/NyaZi43qbhBCK+9fAdC+Ntowa38EWyK93lYCoOCqzl/0yd1FDJurP0h4X1yv9Pe5ys/8n6CHKEZabXzKCBf5gYThaq3nVy9PFS5x8ppz83Du4OiWsRjhLSPdH1RayQh+EwGa96fzWSpGbZfA8opV/KEolmegS12DjiJhfjKbsOv/cpUjnl1GtkCvAMm6OrCeCQP2dbxshKD2+ra2ZyJZIexgzegSBHWz1M419QLiS706Yx+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TjNK0t7XpwBnyObtiVZ5JVxNURgLAfnFhb0W/+mco4=;
 b=V00/X+20iqncO3puq1L07Yu4dp7iDXLnyYV7dAw9l47J7piENZbJjjScF0X7EregrV/g31OGMDlRl6Vk1WiiIw7sK6QqAlvo2YPzlyi79qn/S5orx6jb56go1FIfZDQcfJpy7fPSljv73dX663JBDczJvT8aZUlH2YYTZdGRHiXhrF+oobF0yTJKHGGx4eJb3wZ3QYJEOBW97HwM0zF5InEl+PqmAVB1h1vCOPF9TXto4CaGw8RFeBcx4r5xMsFP2XQliuN80PYEoAV/44yyISC4RPYCFaPEeCKFnntSwTRhz4hBeRp8xtGv5T+BnlIx71pQmXXvO3sIABWnd+ThVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.17; Thu, 30 May 2024 05:48:30 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 05:48:30 +0000
From: "Ng, Boon Khai" <boon.khai.ng@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [Enable Designware XGMAC VLAN Stripping Feature v2 1/1] net:
 stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
Thread-Index: AQHasBkLCj07Z540QUGXqLg1tlacPLGrb/8AgAB3OtCAALcdgIACos0A
Date: Thu, 30 May 2024 05:48:30 +0000
Message-ID: <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <48176576-e1d2-4c45-967a-91cabb982a21@lunn.ch>
 <DM8PR11MB5751469FAA2B01EB6CEB7B50C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
In-Reply-To: <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: f60a8003-973f-4e4d-1ea9-08dc806c22a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|376005|366007|1800799015|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iDUrntGocTGa5ueeKfRdj0WSDtV3uQvcV+kW5hrFCor6CSZOMqSxsh+4yetN?=
 =?us-ascii?Q?f9npcHuEDNApuUTN7JUo2NaXFmzAPiJcz0ZBtvZkfrogg2KiZ/lA+C2Ltu1q?=
 =?us-ascii?Q?RXPw9nHyc11N1Ur5Ikk9CgSTGH2PRGU42uFEebLv7DBM2VwytxesU+vVizWU?=
 =?us-ascii?Q?3isA5DYYk1w8NixUmXz09QydwricioBNqCsakcCIjy7HBLtkdDL+P/Y7r77l?=
 =?us-ascii?Q?hVPRL/cMi07ykxJpVbQp6L1jc3baXLirT7n4YlXNTfiTwjGM+scFVnMJe7lJ?=
 =?us-ascii?Q?rCBDSEwb8MgqJ9yH9PYP94VWvCVjv7sxhOxwMT+PShyGpj3QdFHVtP3pHPRp?=
 =?us-ascii?Q?Me1wAGhA8aVDxbn1OMi2L85+gVo1pt8G39LUpTlgn9tt80jg+UnZGc7L0KgK?=
 =?us-ascii?Q?dtbWGJ0y8nIRdpxUAs+d/3+Me2wA189BUlXPQVBZH+l3/BQZCfPC72O47BJW?=
 =?us-ascii?Q?m+ZkjAq8hsP4U8dZoVzZWbtfe2jxf1h/m7NiMqoZkqqwqvGsD1G0EXD5XmGr?=
 =?us-ascii?Q?zROxqykSPEQs3OGt2eN9NdUtkmu2TPae5zD7iyN0YyZZKKAMy/vYBSbC5MUm?=
 =?us-ascii?Q?zTxX2t5VUHCsOag1Wip4SzwKDe+gSazzVk/e3hdFMzQxJA4CmENcYUslkN1z?=
 =?us-ascii?Q?v30juGtJ5hPlehXmu6alhEoIWrNyrIMgIvyzZlvS23g2g0Zx4IqE2UuynjHL?=
 =?us-ascii?Q?ignkDnYenz/y3IEPNEUni5NC1I6IvjpMs+exQ7sz3pmyAVglk/o7UBcEsBBP?=
 =?us-ascii?Q?xq+n0+FJ/d2GduoYXZXtZkFOGhoZvOopmWcYeIqRTIKbQHpT9lNr8mfs0pW9?=
 =?us-ascii?Q?7Tc4lxPnUWo3IXWpnxvdKP2uvj6zgPN9G6gFsUfDVW2ulMoNy7X0YUMis1em?=
 =?us-ascii?Q?BlNQ/DVbgSpzJr0PiqC0IeDM2mW1ps25OED6MnuJTx6JQEvV5HgCN5nWixtL?=
 =?us-ascii?Q?3w7vxW8LGFmr3jeEGJ2C3EuZaZFCqxXLARuL4DCWOhd8SKjaFCm/zSLWAhEW?=
 =?us-ascii?Q?AT1c4diaNQRbufOlK8FAfpTLsVXJhNtTgtlIl9uE/7axb/FgnTfjVYjchdxr?=
 =?us-ascii?Q?Z2Fm68G0dcCbWYgLhxDwjo4QZrH23+Q26qW6gOSNFBpLZx1+z/NwdCQE0Jek?=
 =?us-ascii?Q?tQL/mQNvPNPNZS8dskIgGHINlZOvvqI5lCM+SiB7bGCJn4pnOBc6jYWbDV0V?=
 =?us-ascii?Q?b5WMBClbpMxuigadlC7NhWUP6VaJfFzn61Ov+tLyTcRoLbA7mGcKEh4gqM4K?=
 =?us-ascii?Q?Zerfw1gHM983ZAuk0w/eIlV/lvc0WKbDyvn9AdqqJ96MHmguG5zHYBQ5M6ws?=
 =?us-ascii?Q?HssNdkWDswpDzuV6/UOVlGw6lPHpTxV4Zs6GgXF4T7ldow=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bvkVTP6kFeUf5Gw0al+6A4daCC66Zs5AyalNzytwaMmriHt8M3bRxeiolrv7?=
 =?us-ascii?Q?8WcnWH5s/QNzuRpcHKlEcKcn9fZjZbf9EkKJMYM534YWmkGIOetQBltiP6sM?=
 =?us-ascii?Q?lUpQSiA24z+zcF5FoOt5FsCo1bxpzCktye2xueG7gAQbvsDiVzsLns41lF3y?=
 =?us-ascii?Q?Q+j82CPZbCwVHBkCbxcME7W8FIWe80uO9Y4krvDcebIi7uPv7o6OHLfmJFWc?=
 =?us-ascii?Q?Ep+ZV5UcpJF2ECTEC5AYUN0beYJqBZHTqEQ3uvY0FIpXiMp5kVcQkY69mkW4?=
 =?us-ascii?Q?ugaGKfQTpNJ77r4muxCUMtZL6PQlf/+O9eB8KsAG74w5VBGJ0gNLzJrt/gJS?=
 =?us-ascii?Q?XjjfBEMaCAu9gL1giZxUj9zP25eLlKCH80XKK3l9q38GrkrBKuLP4tr2E/47?=
 =?us-ascii?Q?xOGEj/R4Lf+bElpD4pTc3m27GkyKTcHykgqGQoAxjBa5kSQz7fiv/iYi8ae/?=
 =?us-ascii?Q?rOPjz7rk4uO/jACHdMgrumDLS23TzGQsf2aPrNJhespFrFRuj7kjgYk9bLp8?=
 =?us-ascii?Q?+Bd8QkFlfrNzY8V4jt7xGsSj0Gcj2FCRYsdsZh2bH6ulL5Kjh9ZYMYoBxxZN?=
 =?us-ascii?Q?0AJ0OoqsNSnggk0tPBphiMlNgkV26d+N10HDAjIYK6/SaERFp9d6Yos7I00a?=
 =?us-ascii?Q?s5uGMTDHx9rIaEO1drkdSbnFo9Egupme/6pNh1C3tBRoQ9WYREcTu7T/pNSZ?=
 =?us-ascii?Q?uS56khR+sPoIpPWzyz8zyjRE+lSJYVCqPMoNOX0nI9QGlYeJECQinZ8ZR/x3?=
 =?us-ascii?Q?k1uY2ZG0WH+Oyv6hLAXJTKvutE/xu165o9GzWk9YkrcC5HTpvlfG/ssKTvjc?=
 =?us-ascii?Q?iRh1K/ND1r/wg6B+n9cCxz9z/Ydcvx3PqdPuhaxUgsPRUjfiOzKzOLeRjhzh?=
 =?us-ascii?Q?RrKlSwhSCIARc46Gf6q+2RCBOae0XWmBEJy/5SeJygiUiyMVrtliUyXkV13e?=
 =?us-ascii?Q?NfF4JdFzQkC4z7PtIqIAnRwGFPWnbXSFgnVJIvY5vqLSOAHKQfMeLWXiZaO2?=
 =?us-ascii?Q?/vhHQi6YHwLTuBNci4QwW8EJ+gwyY8iZ4EYxuVd8uk4xDLcxyNlmVsFpucqh?=
 =?us-ascii?Q?R7yDX6xubcDHOygiJ4ezypavESy/k8CFQDznQD1uoGSO/YHRpeAJGq/1cFAw?=
 =?us-ascii?Q?4dNMgmm3vUQIKNVtXha8gsaHtxTvAtLps/hwvzxAj9johUu4SWyJAvysZTyT?=
 =?us-ascii?Q?Y8k1xI09+89WnAlveHLBYoUWzw/0eRTFDYg6uoIl5Kn0+WJCC6wz25D4nwlW?=
 =?us-ascii?Q?Vo6/93hopGlkc5H8ZZ1y100JbhCpKn2MIYTDKQt7jfL2HwIogNz3FskTBRvC?=
 =?us-ascii?Q?cYeifD+z/Q9FWnrDAsfgWPr2A6aKMQ+eEMhzbnQtfKYvRFd7NFXxmWkerj9i?=
 =?us-ascii?Q?0gD49EX/qdg2m+sRGSTXBycc8lJtLQ/9/qJQkXNtmVfKuFUqkuH9ePOTQg/D?=
 =?us-ascii?Q?BSZXACbWVy+DHQr0y5ENgDVBAMAcX5pLfIEOY72Lby9YowJ41h4PhOh+OikP?=
 =?us-ascii?Q?2T/mFECf3t29xrDlO4xOjeMvzeacPz0HalCRe2AJ1s99hPd8O7nBcqbpy2nV?=
 =?us-ascii?Q?bql5dltFCWtzdSZs/yseYlia+HN2q72avjPpmxXSsJBJPW0Ul2WMeSdQcEYz?=
 =?us-ascii?Q?ynZ41EKor9g4433ls+AXpPb6LaWd70J/bmERVO5CCxPP?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60a8003-973f-4e4d-1ea9-08dc806c22a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 05:48:30.5931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tn391YElnsOYJCoXjeSjL1kNhf7JkVLeijB72vqHCEv+L2gU6ZblCHpodSBvQg70e0Oylycdbd9Y+xgfH90bpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "G Thomas, Rohan" <rohan.g.thomas@intel.com>,
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

> 
> It is well know this driver is a mess. I just wanted to check you are not adding
> to be mess by simply cut/pasting rather than refactoring code.
>

Okay sure Andrew, will take note on this.

 
> 
> static void dwmac4_rx_hw_vlan(struct mac_device_info *hw,
>                               struct dma_desc *rx_desc, struct sk_buff *skb) {
>         if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>                 u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> 
>                 __vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
>         }
> }
> 
> Looks identical to me.

Yes, some of the functions are identical, the driver has been divided 
into dwmac4_core.c and dwxgmac2_core.c initially, so to enable the
rx_hw_vlan, it is porting from dwmac4_core to dwxgmac2_core.
  
> The basic flow is the same. Lets look at the #defines:
> 
Right, the basic flow is direct copy and paste, and only the function
name is updated from dwmac4 to dwxgmac2.

> +#define XGMAC_VLAN_TAG_STRIP_NONE
> 	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x0)
> +#define XGMAC_VLAN_TAG_STRIP_PASS
> 	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x1)
> +#define XGMAC_VLAN_TAG_STRIP_FAIL
> 	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x2)
> +#define XGMAC_VLAN_TAG_STRIP_ALL
> 	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x3)
> #define GMAC_VLAN_TAG_STRIP_NONE        (0x0 <<
> GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
> #define GMAC_VLAN_TAG_STRIP_PASS        (0x1 <<
> GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
> #define GMAC_VLAN_TAG_STRIP_FAIL        (0x2 <<
> GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
> #define GMAC_VLAN_TAG_STRIP_ALL         (0x3 <<
> GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
> 
> This is less obvious a straight cut/paste, but they are in fact identical.
> 

This was Ilpo suggestion to use Field prep and Field get instead.

> #define GMAC_VLAN_TAG_CTRL_EVLRXS       BIT(24)
> #define XGMAC_VLAN_TAG_CTRL_EVLRXS	BIT(24)
> 
> So this also looks identical to me, but maybe i'm missing something subtle.
> 

For VLAN register mapping, they don't have much different between
The dwmac4 and dwxgmac2, but the descriptor of getting the
VLAN id and VLAN packet is valid is a little bit different.

> +static inline bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc
> +*p) {
> +	u32 et_lt;
> +
> +	et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));
> +
> +	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
> +	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG; }
> 
> static bool dwmac4_wrback_get_rx_vlan_valid(struct dma_desc *p) {
>         return ((le32_to_cpu(p->des3) & RDES3_LAST_DESCRIPTOR) &&
>                 (le32_to_cpu(p->des3) & RDES3_RDES0_VALID)); }
> 
> #define RDES3_RDES0_VALID		BIT(25)
> #define RDES3_LAST_DESCRIPTOR		BIT(28)
> 
> #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
> +#define XGMAC_ET_LT_VLAN_STAG		8
> +#define XGMAC_ET_LT_VLAN_CTAG		9
> +#define XGMAC_ET_LT_DVLAN_CTAG_CTAG	10
> 
> This does actually look different.
> 

Yes, this is the part in the descriptor where dwxgmac2 get the vlan  Valid. 
it is described in Designware cores xgmac 10G Ethernet MAC version 3.10a
page 1573.

> Please take a step back and see if you can help clean up some of the mess in
> this driver by refactoring bits of identical code, rather than copy/pasting it.
> 

Appreciate if you could help to point out which part that I have to cleanup?
Do you mean I should combine the identical part between dwmac4_core.c
and dwxgmac2_core.c? or I should update the part that looks different and
make them the same?

Regards,
Boon Khai
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
