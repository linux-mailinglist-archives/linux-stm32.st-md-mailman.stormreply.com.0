Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1782800C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 09:06:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02F36C6DD73;
	Tue,  9 Jan 2024 08:06:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 742E6C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704787563; x=1736323563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I/S6Ehvx6WL8m5Uo2M5gi6H8vc5buRJUwofyLFpSl2g=;
 b=IIBet7UoS+Y+ZqZizwtvvBbz5w+TfcqEKw3y/VRZFVhMNtCQxmHYkgbh
 QbWRUi+g88TyhOcCaYtHNw67eFHWa65rvJ27QlHdvsN8/ezlCRscnXbNT
 AFGzLXnHhI96c1Hx7Zh7bA2/1Wg4DI4T6kKAeWaTqKYaa8e5ek6MVNkGa
 nZelFI25SZxBiuIstOT709N4ma+06mna62eOi5B6L6u69hwiydYEQTIds
 Cv6mA6Y0QLPPC3SyY8TL//HTRfyjks4oc+Nt0/tW+4BhMdz3uA/bqz7Ib
 48OOjXz6Da6Hn1rJ3kiYvxOa3TiMFfWgSMMS+KQ/Xp52VT28Kd4Qfp6YC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="396985217"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="396985217"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 00:05:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="30089979"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 00:05:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 00:05:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 00:05:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 00:05:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 00:05:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLUExDATCocvXQM5bMX6tJhDioQ5vagA+f+Mv3sfxBqIl04IdMD3QUh0B8P8dEMOR3SM1WnzP0CNtfcz98H+kvECi/UCCeKKJisyDL8SYYcHTOQkh4DUqWsWvWt32sMPDz/ygEw2UbTViZK1Kuv1Nzep9fFr4Q7MPL1hrlxFQjIWJYjUnPfpV2zYoKa58YDv2pxVgSxeHufH/2lbEsfafeRLd3S0USmrlHNFkxxhwuSdvM5hgLopDjLC3VPX3oUJQ6JE8+Kc+XDND3NNWkuEO1ra7i+u/ZfPJOZaTTcc9/w24RnSHI5EoJuVGpzGwtg2NEEVWDcZT1ogajAIgOLaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W997zDS2TUekKEpGDDwHl4D8Ur9jd2kKgSB+7kVSgrs=;
 b=LTsXkaTIREa0LgZxTNBA5XQI8ukmGFGl0C+WU9WhJpumUWLkNAxAr+m4QBxBzQA+fuZ626j4v/cLUvOhJXPe4Q88HUXkdRvwl/sZB4ntP4Nuob0W7LjIeGfw53DUFZ2/4YkSrnZGMkNMTwU3DafwDLJb4QLmmNvaiFEXt7922r/76KfCRCpk6X11OU7RAC80gYaUZLrrFfbsGLLgEHi8Y+LiplwnJFOTUD+x8MxUTAvLcPTTHXIU5Li37wziIX0wJQc44yriNy3ghUxWIb/DAaB5f1f7YnbgpvIm/h1iPPq8tmzFbIEbl3OJNCBcbuj6CuraMk+hOFzAouzPh1/jFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5490.namprd11.prod.outlook.com (2603:10b6:610:d5::6)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 08:05:13 +0000
Received: from CH0PR11MB5490.namprd11.prod.outlook.com
 ([fe80::9afc:fa9d:5f42:8fd7]) by CH0PR11MB5490.namprd11.prod.outlook.com
 ([fe80::9afc:fa9d:5f42:8fd7%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:05:13 +0000
From: "Swee, Leong Ching" <leong.ching.swee@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, "David S. Miller" <davem@davemloft.net>
Thread-Topic: [PATCH net-next v2 0/4] net: stmmac: Enable Per DMA Channel
 interrupt
Thread-Index: AQHaP6YxnF9NmwoFNUuQaxKKSG4snbDOkR6AgAAo8YCAACZqAIACRM5Q
Date: Tue, 9 Jan 2024 08:05:13 +0000
Message-ID: <CH0PR11MB549049BD1A6318BF5ABFED8ACF6A2@CH0PR11MB5490.namprd11.prod.outlook.com>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <170464562363.18664.8264531122295136817.git-patchwork-notify@kernel.org>
 <2df9fe3e-7971-4aa2-89a9-0e085b3b00d7@linaro.org>
 <px2f336zjgibl43utjnnljzjweypu5jxovhgthc4xruidvpl3q@yobulxczk7vh>
In-Reply-To: <px2f336zjgibl43utjnnljzjweypu5jxovhgthc4xruidvpl3q@yobulxczk7vh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5490:EE_|MW3PR11MB4553:EE_
x-ms-office365-filtering-correlation-id: 834289b9-00eb-4079-7419-08dc10e9b520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2zzKnNCct53wd7GuYj+uTRbLm8FhxcQguAoBnq+OP4hWo7O4I4XrlLqfygsFfPJnEAJ6F7GBQ6Q7ZAUa+v7Sc32uje6Kj3NjQZsd7tIAd7BopPoGy3s6b20O2W/65VTof1vDSdQo2ki0kAHAhAXZ6ADzVi3g4LxHXuK34sA8//s0rfhaqtwHnyQXbT8dTWR3GyGIakO+mSfXgRti3c9RM2VXAOiDdvS2hG9OZ0DAHGtzvbhnCLm/09ziyC2wbzg/7D4vbST7emCTXmUQTLw6ntRcqTQ2l9FRve7HP/ZhVLKfxg+tjoS20Dp6jDX+VFNCws8i270kfetwGR50oQaaGyumsxc67xQSrwEz4g5Oz+9stprOfg1FfjmWZJQJU5lc5/5JIqjeLlUKYCDvFZqY6VAl0aHcJ87GeJtEYzNjga+KQ3l6v7PuqwxJ/F+zJw4DTOJVmC/K4zeVw6so3RKpJAoq5aKAgCdkhILEJiqq2v8es7z4sceWN2ZmRHbd3Kh9ElUlgFxZdxh/1yQiLKbM3JVOzu9qA5d6spbbP2YleNUtJOpdHqh8SR851ADMbudb7aAlkysQahCkFdyuCgdxl2Ht0RtW9GtjBUETS3QxjmA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5490.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(33656002)(82960400001)(122000001)(38100700002)(83380400001)(6506007)(53546011)(55016003)(7696005)(478600001)(9686003)(966005)(71200400001)(86362001)(38070700009)(76116006)(66476007)(66946007)(54906003)(66556008)(110136005)(64756008)(316002)(8676002)(66446008)(8936002)(52536014)(4326008)(5660300002)(2906002)(7416002)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?skQo+5wgRBt3EsJbpavp9jXuh46lgfuBNbURU2Ngoy/r6JtkmoKyICk/vfUS?=
 =?us-ascii?Q?//1BSeYWOON1YUDORqkBsgnXFx9qE92IW2WMPlwIpIPnQXas1MdL+pEFuQV3?=
 =?us-ascii?Q?c7Vmx0Y4tQUvjuAKryJcyXk6XZMz8OuPF/YqGF5cMeBdznxrCwHjSeG4ud0r?=
 =?us-ascii?Q?N1OfoNd71cmYeTZs7TUKa74b2At7sa8nzFLliVsqdMhCqz0aU4w/y4LMkJ3v?=
 =?us-ascii?Q?Cp9vGPSC0KfBMF9ihfVuyx1PKeyeRSBlY2HsLngMgVSexogGdrSinSdu5T0q?=
 =?us-ascii?Q?CY/f2gNLOCs2VLjwTecrblWN7X5VnUXlUqg1pYVTHIgzToslkP7/gTayn+21?=
 =?us-ascii?Q?RYkBjMsFlwrDku1KL2CVi4shhv4gd7ArGspq0ipW3caotqY0qWpP/BO0cFLK?=
 =?us-ascii?Q?+HEQVdliBzolZ2UgBohc8f7qhGIMVnMDGsqK3ndpu98W39GVo4lCnbZb7sXf?=
 =?us-ascii?Q?LEO3lkiEM5sxIt2Qe5R2yFR6fMYadvQn4iMrv9rvTxUQWmQ/eze6dLaHMbV/?=
 =?us-ascii?Q?dRAalvIE2PfQp77Q6LfE0QWA2NOnxRSBCeydY6VOLS9GL5F+qnR8YvwyS7mE?=
 =?us-ascii?Q?X1PlvwjTPi314MuAr2XeWOoUq7wWAbr3V8baVazWGeClV6S9Fy2eKxdOhhuJ?=
 =?us-ascii?Q?ZGc7CiYpinB42m23pUf4t0NJbh5wy0aXi8EsncFpEAyuu6Ficvz39s+wi5VQ?=
 =?us-ascii?Q?1COU4lhIJrBwcp8Twct6NU+huFv2P5HpMGD6rQAbXrvNQWIXoxU3jLIeg4lX?=
 =?us-ascii?Q?9REODbUgbfy6zTivALgKibG0myZBun4ItbUUiQWJg/fUWQAbSj4sS2eFoH7X?=
 =?us-ascii?Q?UtsxDiDAnf8jSPSjXwgx9VXA4Os4QhYrS6asy9b6y2ETLSspa3levbkAdBbr?=
 =?us-ascii?Q?d3efQBBSA1jCbQu7QdZz54KEySmXjRajGDhGwLL0FHhSHN/NwSa0xS/e9VEk?=
 =?us-ascii?Q?3URFaizpIgdPq0o4RnAINjhq7g2flKtilB2ul+aX0Pw2dc6H0F6D2zM3UYkY?=
 =?us-ascii?Q?/0lQ7yClf0LUa1/Li11c18Od2TSbD/ImDtdsKBmjgEL5Eg1YF5ozv5i6lhpX?=
 =?us-ascii?Q?9ROgNZzp7OlemnGBN1KQDxrgF1stqim2LyLMeB8LQvldRJyor/xaQBlIw/+g?=
 =?us-ascii?Q?nV8u8GQJFl84Lp5CY0la1NIIiZjUoTdTzJXiV2erfwq7el4RbocO9n3KRgUe?=
 =?us-ascii?Q?j0gToKvFqu6BRsi+Z2QBZQmXNCy5ft2QJ+VNhEDiODICyY0oS36bJYTqVIo8?=
 =?us-ascii?Q?Bt5/NY+nlF5Mn+rMkYRFu1bhxe3TANh5duiNqmu/hl8OJoCLCbTc4PTlJ3Iy?=
 =?us-ascii?Q?MtdHcKVfd1xtTn5sA+YqQ9icDzpMpYFkgYylsGLzt330r6gYiHhTIGFQ8nVv?=
 =?us-ascii?Q?wujSOB9hRzkANarcpEnpD79+7ED1qNjYBPe7cGBOs1ssu/ZcnwTJsKXsZhyK?=
 =?us-ascii?Q?a87yVBFTMUfTDoNEgAaKMhRfy1cuEhAJPlcWWmnDELMYQR9cCETmqbdM1d4B?=
 =?us-ascii?Q?KQsgACdOnsnHK+t1sXOeK6X/9C4baQmPGI9tGxFU1svdKu9Xfa0Je1dYP2fP?=
 =?us-ascii?Q?J0aApqg/RmM6zCwIkRXl18Rpdf1cv0gTBStBmN7fDntpqbDEvEIhdp+VdG5Z?=
 =?us-ascii?Q?CA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5490.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834289b9-00eb-4079-7419-08dc10e9b520
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 08:05:13.1929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6A+o+Qpkv0FmBZYmMXQypsVMTNfx03GhXC6x281nVfxt8RRwwbo14Ou0tOqRsLE+uri4rk+xs8QOESpHrNTCmf8ruGYfMqm6M258f81mto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
X-OriginatorOrg: intel.com
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patchwork-bot+netdevbpf@kernel.org" <patchwork-bot+netdevbpf@kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/4] net: stmmac: Enable Per
 DMA Channel interrupt
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


> -----Original Message-----
> From: Serge Semin <fancer.lancer@gmail.com>
> Sent: Monday, January 8, 2024 5:24 AM
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Swee, Leong
> Ching <leong.ching.swee@intel.com>; David S. Miller
> <davem@davemloft.net>
> Cc: patchwork-bot+netdevbpf@kernel.org; mcoquelin.stm32@gmail.com;
> alexandre.torgue@foss.st.com; joabreu@synopsys.com;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> pabeni@redhat.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
> peppe.cavallaro@st.com; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> netdev@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH net-next v2 0/4] net: stmmac: Enable Per DMA Channel
> interrupt
> 
> On Sun, Jan 07, 2024 at 08:06:55PM +0100, Krzysztof Kozlowski wrote:
> > On 07/01/2024 17:40, patchwork-bot+netdevbpf@kernel.org wrote:
> > > Hello:
> > >
> > > This series was applied to netdev/net-next.git (main) by David S.
> > > Miller <davem@davemloft.net>:
> > >
> > > On Fri,  5 Jan 2024 15:09:21 +0800 you wrote:
> > >> From: Swee Leong Ching <leong.ching.swee@intel.com>
> > >>
> > >> Hi,
> > >> Add Per DMA Channel interrupt feature for DWXGMAC IP.
> > >>
> > >> Patchset (link below) contains per DMA channel interrupt, But it
> > >> was achieved.
> > >> https://lore.kernel.org/lkml/20230821203328.GA2197059-
> > >> robh@kernel.org/t/#m849b529a642e1bff89c05a07efc25d6a94c8bfb4
> > >>
> > >> [...]
> > >
> > > Here is the summary with links:
> > >   - [net-next,v2,1/4] dt-bindings: net: snps,dwmac: per channel irq
> > >     https://git.kernel.org/netdev/net-next/c/67d47c8ada0f
> >
> > Please wait for DT bindings review a bit more than one working day (I
> > don't count Saturday and Sunday, because we all have some life...).
> 
> +1. Would be very nice to have some more time to review the rest of
> the bits too. This would be specifically important for the STMMAC driver
> which doesn't currently have active maintainer. What about 5-10 work days
> to make sure that no comment would be submitted? Besides I thought that
> no features were supposed to be submitted during the merge window. Are
> we over the merge window already? (I might have lost track of time on the
> holidays.)
> 
> Leong, next time before re-submitting your patchsets please wait for some
> more time than just two days. I waited for your response for almost two
> weeks.
> 
> -Serge(y)
> 
Sorry for that, will wait 5-10 days before resubmitting v3 patches.
> >
> > Best regards,
> > Krzysztof
> >
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
