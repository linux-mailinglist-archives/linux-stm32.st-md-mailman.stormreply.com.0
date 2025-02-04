Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18540A275D2
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 16:30:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B774CC78F83;
	Tue,  4 Feb 2025 15:30:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F7FC78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738683016; x=1770219016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=anJCfJU7OOhWh4LQZmujxpWrKX3dHPgHYbt7a9CeEmM=;
 b=RoNPi6HkaX9z/1Uqqs/4RwXpsLoD/bSFdqXv7CXFuAtgK7m7luNvSzbE
 IQHuSXo080aSwRQJs9JSino1iQGT3lP9HDTmEqTpetMaKNrxaqghMvpfe
 WqPuqqf4Svy+/DYaMneQTq4waecbWM+6j58ap+LeCunHrSUj8ETKVp3l/
 Ne+i3FgfkSZTHUAhkRjpCkzTFg37Li6JEhoNR3jdrEl7SEKKYemVF+PEG
 ptshwDjABRFyHL8TTWUaT8rsAz+RYOFltos71QF+/OML30UXkYUS6YquG
 Gz1X/hlOY+QKKksQR5tr/RLLkpGKD9MdEMBqryybLwLvpJ6qa8ROR3T22 w==;
X-CSE-ConnectionGUID: sxt/Fq8cSoic80t0MTKeOg==
X-CSE-MsgGUID: dHrAKzizRRSZy8VAY5iTtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42053296"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42053296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:30:05 -0800
X-CSE-ConnectionGUID: XyRe4vr/S2mBM7t495xKQg==
X-CSE-MsgGUID: GcVD1CdUReCu38vNleOARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111071917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 07:30:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 07:30:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 07:30:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 07:30:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyp3AE0ym5HUph3XaJ59IF5QKHalfMP80wR8DAlGjDA279/Pn3hPpcol+mIIfjnmKGvjw4VC8G2nCmV05lqC/+SP3ifrSYfHaray/0WjRPE8Ohys/cRB+J2qU0bN8/kS+zH0njUgJrfci/yC9etyKQAwo/kK8bLU0M2QwSTBeK8j1q+MgGAWdRVGmMwfJDmXxopf0TjLlcxW+lM3rXCujKuG1gli5AYTmPJhQQKGqCu93KpeIurTb666+0xpZVheVVXhTFSHwPp6pQJ/CccMzMeugBXWWPuVHzwFguqnJzJLrQFYzouC6B9hR3jHR9ECMu85LzihjIqgqN1uxRb47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anJCfJU7OOhWh4LQZmujxpWrKX3dHPgHYbt7a9CeEmM=;
 b=PUDDnK5wgsGpAdG/ulzq1orthydSPyYws/XxWuda3Hg2yHzF053gGRo0TZA9Ywp2HL5vYxkXusry8cDiGOYoET/Hjfnx80TdIuxFPOqSsBcIrvT5G2zlSpJraPSczYUvmLHH1tdhdhV8bcYgFaMwW4k9UpnEgxNYP/BVmF9tqRYwBuRNKcBcYHB0CY/N6RKhoko3wIIh768VKxI9WO8oLHaj6iuuJMEQZvhDYIHu/lVh3K0d2a0A8LwM3dF/ISnmAxBcBPe9hknnKAb4bkqCWLQf8OmZIslpGD3kVK5jsBo2A2rTH9541/nwEb1szY2BOys1Bv+hmI6Pl+NP+HDMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 15:29:29 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 15:29:28 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>
Thread-Topic: [xdp-hints] [PATCH bpf-next v7 5/5] igc: Add launch time support
 to XDP ZC
Thread-Index: AQHbdp72yuxX8HZUp0ilKWaa9j1bCbM27JUAgAArOGCAABYdAIAACecwgAAKxgCAAAJf8A==
Date: Tue, 4 Feb 2025 15:29:28 +0000
Message-ID: <PH0PR11MB58301AA73FE5401211B36D7CD8F42@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20250204004907.789330-1-yoong.siang.song@intel.com>
 <20250204004907.789330-6-yoong.siang.song@intel.com> <Z6HnaMQvgW+indqm@boxer>
 <PH0PR11MB5830422207B7D3BCB27DA04FD8F42@PH0PR11MB5830.namprd11.prod.outlook.com>
 <Z6IeNumqP1aNAphU@boxer>
 <PH0PR11MB58308B675B0B9B95AEEBF192D8F42@PH0PR11MB5830.namprd11.prod.outlook.com>
 <Z6IvjrnVX2xSFHlh@boxer>
In-Reply-To: <Z6IvjrnVX2xSFHlh@boxer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|SA1PR11MB7130:EE_
x-ms-office365-filtering-correlation-id: 1d050f2c-8798-4720-93ff-08dd4530b70d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mH1WAgSrH9MDupbeNYb8CqDZshyESllf+Q1NO9piaDkQNx24TukjfkdszXd8?=
 =?us-ascii?Q?b0OXb+K2eNX2rzhQSzz31pWbvos2YMr5QyAWzc3wk+jo2QKOiDCWNGILyXg4?=
 =?us-ascii?Q?odBL38uuu0e2VSBCd/MzJCNRe6iGbcr+qVXnuOjFX4FkylMD6rcLAl9jrPKq?=
 =?us-ascii?Q?JUemH9Ti8ekfO6tXdDJDVWYwofk8VUCBXINssKJYCUUO+Uo52Jg36fBSx0CZ?=
 =?us-ascii?Q?/Nyekius3h7zDkQOa9qkuXSsVhJtkCv1Gu1sZYyv6UzinVKMlA0xdeHIJJcT?=
 =?us-ascii?Q?XKeMDqxTxgiy0rTuDfBz3aPKQfOP1upEdYVhJw9qDocvlvaCKqo7dg2Pu79e?=
 =?us-ascii?Q?ZuuWfUcPZLbVHwDZW39XO/d6waxdzNX53ZF1gSNQZVtto8BLaWfIbZGRyJn8?=
 =?us-ascii?Q?Cp9gkraMh112d4Okv8HCM8qyNh67bIr27z0+VzBl0lsz+zG2ZvL1F/rmYhfB?=
 =?us-ascii?Q?h1zRBqQuE1294uN7NVu4DCpiSJOyRgOd/8F3vMFd73ADBjuXsLUk1PXTdQbe?=
 =?us-ascii?Q?xZLsPC11IATUc1IoSTAt1iWbkDRaNlk6l4a1MOKxUQrxjRILJ1J4tKjZUL9P?=
 =?us-ascii?Q?MDq5LpVMYPRV9iz8WREOPlTCdK5UGuu+zsNX+1agnJoFmzQb9yu9ZfVF7H3o?=
 =?us-ascii?Q?jaFyZQAa3I6f+FotO3FLQxBroQlo/yl31IS5B2gAhszufjh65OONeI3KSmPT?=
 =?us-ascii?Q?SwA2boNffayhu9TSm0zutAy6QpzDfj4GIowNF7x+BSnNZtVf/YfrbY/yVec8?=
 =?us-ascii?Q?Pu42I22FP5xLb7zCh6R8h4QBJFvmSiI4TlDjEMZoLCaLpHZdbQdU6m1bz/av?=
 =?us-ascii?Q?XyC/HIpzOy16+kuzaf/FEhLLklP6UqClADlm4GOHj0Dsd1rEBihhfRXSD425?=
 =?us-ascii?Q?zB36sTITey+0dZD6JX1NL8p+BLa7KYnivxXQZrEve2Thp3caSQ5hnA+0ZDvs?=
 =?us-ascii?Q?SiLop6Bwojl9zFW842dJi5eTIWNRA/mP5yyy5jjr27Ky73zXqqOXuhc4nKZG?=
 =?us-ascii?Q?316AXDeaueQI8K4a4jIm61yI2+A7ZUHZQETgTYJU0NiHrwGxpr06GusOkkzH?=
 =?us-ascii?Q?I3LGu5QFNl4x7DMk4GWQLsCvjs+2HoRGG3zibI0ecY7sBhP3SCZjrPY6EuB/?=
 =?us-ascii?Q?/RMaE6FrfRQBN+AmmVPB+qMC7sTJhcKapuJy1sWPgSWAtiCo1Z2FaTXZPFBZ?=
 =?us-ascii?Q?Rvz3RxL1eM5GjUbwCTH1CpWu4j5vJ8ByyD7pK1+GKEREp9pJbk1IHB+p+vPe?=
 =?us-ascii?Q?sAo2UZQfWxt+WZxlWAL4AwyKTH7ZStcwyf7HHmyctFFoAwd94gzq2uKI8av0?=
 =?us-ascii?Q?bpb5eCCst+QYU1v5seqfkiOEo+IAHhhJbdBLc8tUWUpWbHUQ/3xrfuotFYpF?=
 =?us-ascii?Q?abjCs7KlpBlsmOl0VsB/aNv8bTwRgs8DgSu5qCWiHvTqmaOM/Tb/erPGSq6J?=
 =?us-ascii?Q?buMvKreinmscsRTuTFiha7GZCoW0yWUy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u1T3h7fSwzwwThrHHu3oDxSTr2rtCqYtOBmRsunQcXURX/3+99Jpdst2HCtW?=
 =?us-ascii?Q?9alhwq72x/kjVltvbV81zjXHCKxZ6NuG6ybC5eK0gGzc84+egQsZJeHNYyF/?=
 =?us-ascii?Q?c1F2T02Q2FhYkxwgYpjfXOzVsi8PpzdxSv5CfATz8jUExLYGWwGIA+EP7CXB?=
 =?us-ascii?Q?3QRvF5fUqp6Lpb6pCaCEKo5W2T6DsbZYfwpRsxO3sl0hy4F3ghO2PyX53ae7?=
 =?us-ascii?Q?wauLBgCMMlCRB6KgjaUDAgeVRd5+XP6zc7DYK+bb/WRxLQmbteLj4eOmb72e?=
 =?us-ascii?Q?EhAaSkMvEFpygiWos5qgl/UZLddvhi61nLHD2p7eB+nXfSObfbHVm2gtFNkA?=
 =?us-ascii?Q?NJ7X0nr+oxo4kIHEWGgVnM1NoDrfOotPYSEcUo5xqsxsSrJKVg/dOB/9i+vQ?=
 =?us-ascii?Q?HkMVlq35zK9sOEdKIZaHAfSb3RSBmH0tyIAZTbaq47GJHhN9wSZoZNrZBOZQ?=
 =?us-ascii?Q?jfrWUz0Y/9271ppMnLcigEkR3/0YygSbWA4ltw2sm9xxXKb8U+TMoxLX4ccR?=
 =?us-ascii?Q?lYiDd2dp927T0LfAgorfcMkVFlunPvGlsReX2fzWVMK18XBiHxXBculHAiNi?=
 =?us-ascii?Q?/otJq/bs02lbZO80FfV1H+4Lzpj4U6fLahg7VqLKLNJ/QTAfiQMUEl2z2Nfn?=
 =?us-ascii?Q?2WLno9SfAEl75ElFwVI6iJEpDv19zL3qG2le5ebghBLr2XQzFDd4mJ4agodx?=
 =?us-ascii?Q?7UEDnhC9rNyVgIdP/gZq1EO1fwUAD5eLZFta01QW2Bh5jOYT8zrpxZosRzi5?=
 =?us-ascii?Q?AEHqfJJSNVYgovhC5txEMgQu1HyN7tXlWYiJm6GhNRVsWtxO4UAyPT1uHHaP?=
 =?us-ascii?Q?VqevO7gQfR7r0HS9+8R0vNof1bTdSPht9OTGCmZIe49acu0IXsbK74qSLCyM?=
 =?us-ascii?Q?T8SIyiSWVKBpysf4aS7+Ki5Lk82XvqcCpRNeegZpzkeB+7sCukc2xOsEEjdX?=
 =?us-ascii?Q?AbPxM4d7EGyCJoikEHaIVS6GhmMElqz+06+mEimsUXOQqSKklnfdC5d1dLaU?=
 =?us-ascii?Q?zJS5loXQXop0Csg+QdCMXn5e3eNAA2z0O2hOP2n0NKegl1IUhLtgbHoZHfkv?=
 =?us-ascii?Q?gcCb0vcUVu7fxcQs1nRXTe3KHSm86clB7L80pfnQXnQxxqVV0ZIpW2PDQUIW?=
 =?us-ascii?Q?1cxTzXicxZo47Of40+H07POzch1SLJ1rG9AkjeJSYeYCGm2CPy8LAfkTcN7g?=
 =?us-ascii?Q?HxGuV8fJTekf4Lb8D/uRdTZFu9znxR0V34hpwrAj8g4ZBOThTTX0Qk3V1zP3?=
 =?us-ascii?Q?aBmDNcQZ9nHzuuuBzhvZgR01nKheGT3n8SFqf/uglpb9zmjGxN64WXpMXogY?=
 =?us-ascii?Q?nNm4ZUaxEmvCTZ6dB4AqBgoY7Pq7byK5gtdRV8s2/qU15UOf3rY35iW0ccUD?=
 =?us-ascii?Q?Ct24qHpllp4InbLQcsI7nL+XbabpWqqc2og5E+MlNFfxsEeW3j2GLIyJvRIj?=
 =?us-ascii?Q?6P8+DzZcIVkHnEPvJTpVEY7K/cJSOrxxHkkuHitrRlGMo1MBcbKFd9hAMMZx?=
 =?us-ascii?Q?OMrKSAx3urZ6+vXnmO65lTmq79g17OrdHny2CwtktEKhU2gCoVJpTTIsuvwb?=
 =?us-ascii?Q?ljPszFnWYoNIhFvhsOiO2HY+7NDmb13fw4K3ulnTyGLzkOtjt9RePTptp6PY?=
 =?us-ascii?Q?7g=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d050f2c-8798-4720-93ff-08dd4530b70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 15:29:28.7726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKQvotN1FVdJAZ9uBBBaIBJ2GHv8irERDsKa/xHac/P3fqG2GiuL6aviTHf33XqWvUtcftod5XpWNvQf3dKmfy4+V+TyfI9/YXFIoIZDiL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
X-OriginatorOrg: intel.com
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "Bezdeka,
 Florian" <florian.bezdeka@siemens.com>, "Damato, Joe" <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, Song Liu <song@kernel.org>,
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
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eduard
 Zingerman <eddyz87@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 KP Singh <kpsingh@kernel.org>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, "Karlsson,
 Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bouska,
 Zdenek" <zdenek.bouska@siemens.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [xdp-hints] [PATCH bpf-next v7 5/5] igc: Add
 launch time support to XDP ZC
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

On Tuesday, February 4, 2025 11:18 PM, Fijalkowski, Maciej <maciej.fijalkowski@intel.com> wrote:
>On Tue, Feb 04, 2025 at 03:49:32PM +0100, Song, Yoong Siang wrote:

[...]

>> With above, IMHO, we no need to clear igc_tx_buffer::type,
>> Are you agree?
>
>Yes, the contract should be that every routine that produces descriptors
>should be setting the ::type explicitly. Sorry for not being clear from
>beginning but I'm glad we're on the same page now.
>
>I'm afraid this single line should be send as a fix, though :< even
>without your patch set empty descs could be mixed IGC_TX_BUFFER_TYPE_XDP
>type.
>

Agree with you. I will send this single line as a fix patch to iwl-net

Thanks & Regards
Siang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
