Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A645C35619E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 05:02:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BC1AC5718B;
	Wed,  7 Apr 2021 03:02:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 151BEC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 03:02:26 +0000 (UTC)
IronPort-SDR: n7NtAFkq6PEIEWgmfaNATcZ1MWc5hXWPDFAovXgy7R2IAGzC0QPX6fANwEPtq7Qijsdxuvcvpz
 5+sP4O7Drp5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="180339246"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="180339246"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 20:02:24 -0700
IronPort-SDR: GlTFWRfpMGTt77Sf5ffR4/RLD3Ol2vZ2afHKIFqF4lJc67RkF1S+UYUwsvrM/6uB00mJsu9vfE
 iYOJUTq5nVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="458149682"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 06 Apr 2021 20:02:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 6 Apr 2021 20:02:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 6 Apr 2021 20:02:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 6 Apr 2021 20:02:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 6 Apr 2021 20:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2m0ku68sp5heWciFE74S1+vQFvhPDUHObH83h+0n44/nS9KUOftYCcvI1Z2ILJkmlF/7cbLkv6B/qwB3Nvbk/9Lnkq4VCEgyAiIRuaK+wNfxAR69NA1aAInuKU3xTvI4gLJtItxx+mh+ekzjUDrGbRfnMuXn0tH4r4fXz7SVMNYYXxCBLLi3AZeBqvfrCjWDH0uJE9lA9V8c/prBhSIVqGp8pTjcZlz4Y4Mnujatb9L1Mxk/C+k1FrTODtffGfygN865eMG9jzVLk2HLZl2f1Eg96w6z03MN56VLOPLjtvEFBb4mBU9pN4HPG+FHb82KCBG0td8MI3Zj6G1leNjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq//CI2JitbgZvMCgS1qcwa6JqQomd//r4c3fBWmA/o=;
 b=OdO/MRiS5I9ac3lZfqYAOG4dG4JLlowyi6f+RwC8vZFWqWbfjtqOVnC6MZLXpGuDDp/LSWlNhsqsEolgCCg+MaRtG9IyGQfhzYAVy1JFdLXtvC+JnmGXU8CiQNJREDy0rhI38sC38A5e3+MeezrireT/wCpG5svL8HBVUfMPhbzcOWplCQxnhazCCh/l8X8qjIgBbAS2P/ktTtwDHI1pvMQaxeXz3bITbrv6w7iOuvZVl3lVSkoYHZwtADipi9bXL+EQNmhtqOD8TRQRZ6DU19qKhUpEaY7OxzbkP/GH8AUebXn/K+0yzx/22xZgnhUfrVvxzqHPVc3uMj9PKM2hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq//CI2JitbgZvMCgS1qcwa6JqQomd//r4c3fBWmA/o=;
 b=UC+5nbmgzrt7z4k+RjuLoFmvEe65UVRpwmnj8MuVbYY0f5WVUIY9CfTxpcyaj5OWostHm5S8XhEtTAP1LTzwTed72lF/oY8+89S3azbZFC55hZMcVozq3EQrlz/LxlNsimlfwIpj9MLHhTOjHWeVDM9EYECTC7I86T8lGiTgDQk=
Received: from SN6PR11MB3136.namprd11.prod.outlook.com (2603:10b6:805:da::30)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 03:02:22 +0000
Received: from SN6PR11MB3136.namprd11.prod.outlook.com
 ([fe80::5143:5d07:51b:63a7]) by SN6PR11MB3136.namprd11.prod.outlook.com
 ([fe80::5143:5d07:51b:63a7%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 03:02:22 +0000
From: "Voon, Weifeng" <weifeng.voon@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next v2 0/2] Enable 2.5Gbps speed for stmmac
Thread-Index: AQHXKg/Os9IaztXPaUy24X7Nc4wW6qql5igAgAAULACAAANOgIABLtjggAC//4CAAGteEA==
Date: Wed, 7 Apr 2021 03:02:21 +0000
Message-ID: <SN6PR11MB3136E862F38D7C573759989188759@SN6PR11MB3136.namprd11.prod.outlook.com>
References: <20210405112953.26008-1-michael.wei.hong.sit@intel.com>
 <YGsMbBW9h4H1y/T8@lunn.ch>
 <CO1PR11MB5044B1F80C412E6F0CAFD5509D779@CO1PR11MB5044.namprd11.prod.outlook.com>
 <YGsgHWItHcLFV9Kg@lunn.ch>
 <SN6PR11MB313690E7953BF715A8F488D688769@SN6PR11MB3136.namprd11.prod.outlook.com>
 <YGy/N+cRLGTifJSN@lunn.ch>
In-Reply-To: <YGy/N+cRLGTifJSN@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [202.190.27.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c30b3ef-2380-4dd8-03fa-08d8f971904f
x-ms-traffictypediagnostic: SA0PR11MB4557:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4557C9A108F975DE6049CD9488759@SA0PR11MB4557.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oU+yuxF4lXpUgoPcQFeHlkesSHFahLlmNKlR6ualhbuWY3E61giiTMNI8kr2phkRQBylYcTTM3yzRGHkFBf1PrJmrYy32cZjhED93Tv0qJz+FMvOt/DgOoi883erLyH5PrcS3wzQXZwPpdj6pblLL9G5UKkfCVMNx9gv/2ZNrj1UHF6/wqzCidsm1Dg3KgpEOKGp7jZXAtIT14tmIpi2iPxH0xiw6wbmA9mFuxPdzC1Gt46xHYy1CQhuh4DvMsZOxrvZ6EUr5zaoXeEfL6MwNrwxeFut/IXMqfCeSJGHedi8mImkemiQeE6OXId46IjC7w7hyMD3a1oSIYBGRu9Gvp/PeBYvXmsETOmKAb8cJONBWq7mECB9myk7zOXzaS6GpOsjLFcSMJOBoBucW7SoKZA6PZxRPeZxCn26b+Ix4K4E2ULJUmQEGcZDUll4TeToyKtrlRcDYWOrfJO7KCHCSfxkbhW1XRpEBPwmI+WmwrhioVax35+BArgNS2ylTDRMQd0HOSZZE5BRezWLrluI1nQex382wqYjAXeQ11NyCjWxAlWJRAz7nIdm4rZ+6wLNznOTFcbrBJ/s5fePd7YlWZwuXAJjjM6zoTmfDB97FCOb0HlEkcSQmvE2FAnPy75ODl41IAVy4+8FzOBkNW949BTepUoRyIAV4GhdVx8+M7g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3136.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(83380400001)(4326008)(8936002)(5660300002)(478600001)(8676002)(6916009)(316002)(7416002)(66446008)(64756008)(52536014)(55016002)(7696005)(66946007)(86362001)(6506007)(33656002)(66476007)(71200400001)(54906003)(186003)(2906002)(38100700001)(76116006)(9686003)(66556008)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LdycbZvM7cu4StXmOvcQg1muwmePD7GrYGdUIimVgXOf3fU2MisUKK3dNHpb?=
 =?us-ascii?Q?IM218m+Q281APing6CTADifSrwnCMyuZywvpAIrMhnbhBXtXyOipe/poZIxt?=
 =?us-ascii?Q?Q17IjhMTqGIrQzYBU4NQ7+gR05qCdv9bfh4DypL/vv4fCK7dGVeQVrua9dWW?=
 =?us-ascii?Q?lgbNJ8xC6Ge7W3lGnL5bXVfYyQ+mbaMol0wPEiXamXhSE68c6zfTIeMd3jbc?=
 =?us-ascii?Q?RsVsMZXjkPBbmqacE1CdaM7PCeVYNsWNdornY+SaPTja7Vlz8e9MloY4I99D?=
 =?us-ascii?Q?1NO00s5C0M/Tm2bHRlv5RzPf22ITiwOhPuIRkKc5sKC83/qo4w+DP3IbZ1ZJ?=
 =?us-ascii?Q?zyhMF2zgFR93ADEegGgXyaHQj4R9jMfUvaMxT4VTWLGLV1BQW+gUfdjGklAH?=
 =?us-ascii?Q?4h+uMWmln+SUTdtdlBsJYugS6B20AHsMVCUPzRn5wCWtw5OPUk0hcFjSIrB0?=
 =?us-ascii?Q?knkZZ6wP3/UnjzhxDdQTfxIPa+xJ+SkJFnn/5cfDMafaIglG+nNaXO/1L0pM?=
 =?us-ascii?Q?qVjCkv79MWTmUYXijmbhrOecw9kyllI9KaJk5XCqbwKPEeePl59WjtYBr/sa?=
 =?us-ascii?Q?GN/b7UVCLQCoix8yxmUk5ly5bG79JRHLWT9JIApmCGc5PMuzmAZChyAzJjxJ?=
 =?us-ascii?Q?gw8oBFByFRPxZM356cegwPGwP87QkHEJuAxDV/1iHpcZ+uAPmb2jGMN1Hm6a?=
 =?us-ascii?Q?oRR3r1RPKUcytKJ5CWSU7kj8PCWgmagUHlrnepMv8KSiz5qnuucyVZ38wZ16?=
 =?us-ascii?Q?2eWDdWm5SnoBS4EmgESEK6ifxu8m8uC7Txz86jMmLa6MDdGXm0ZZNEYHKdX3?=
 =?us-ascii?Q?GBwQl3pGn+q7MldPpnpyNg8cbytIQ7s8yRsaIWd9QfWwC07yatpe9r3gi7Of?=
 =?us-ascii?Q?urSU7VxpPAGMKFSkUTayD2mgN7IwXaNIGaeX6sEYTWl3jUHL5Jvs27LVRLtd?=
 =?us-ascii?Q?7T7JMb0TO3Iga6/3YhWtjRITddx29C9kOYHxRrziQl8zyyWt+eIL5GwP1a0o?=
 =?us-ascii?Q?EIz/f+nzQe6bBk50uU8INfYt3T9+aed1SM0E3bV+VTAWgW9yfnXmFqyCJzOV?=
 =?us-ascii?Q?X2bTmaAvyzF4QMYl53cuzIYBf6gv5wyYcmvMeJHz9eEAm6LqAGJArd40/5B1?=
 =?us-ascii?Q?9pVVTGHKbP1kaZCXCOMWJsNkqpEwJff/bpvSBv9jhc2iG9Gwe96DNJK8h3x+?=
 =?us-ascii?Q?QBYO9X1zu2kpDHkOoGXIMDUjWIEZpXz2ROB35n3+OYtcH5E3ABa/bWeEIs2v?=
 =?us-ascii?Q?XKiEB77j9cAk/iXW/H760IkYqYypibP8tS3VfFuay203X9oxb8m6FGcDj5dW?=
 =?us-ascii?Q?LXB5QG5bg2+xxdPyf0AhNaIq?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c30b3ef-2380-4dd8-03fa-08d8f971904f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 03:02:21.9194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ5wlBN+Zs1fp+i/xaYT3ggbEulZ8XlaSabepja/fwe1YBt1CVAhhl4pB/UA/hZNkk22Av+uzcyhGpGXqZ8qBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
X-OriginatorOrg: intel.com
Cc: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>,
 "qiangqing.zhang@nxp.com" <qiangqing.zhang@nxp.com>,
 "fugang.duan@nxp.com" <fugang.duan@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] Enable 2.5Gbps speed for
	stmmac
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

> > The limitation is not on the MAC, PCS or the PHY. For Intel mgbe, the
> > overclocking of 2.5 times clock rate to support 2.5G is only able to
> > be configured in the BIOS during boot time. Kernel driver has no
> > access to modify the clock rate for 1Gbps/2.5G mode. The way to
> > determined the current 1G/2.5G mode is by reading a dedicated adhoc
> register through mdio bus.
> > In short, after the system boot up, it is either in 1G mode or 2.5G
> > mode which not able to be changed on the fly.
> 
> Right. It would of been a lot easier if this was in the commit message
> from the beginning. Please ensure the next version does say this.
> 
> > Since the stmmac MAC can pair with any PCS and PHY, I still prefer
> > that we tie this platform specific limitation with the of MAC. As
> > stmmac does handle platform specific config/limitation.
> 
> So yes, this needs to be somewhere in the intel specific stmmac code,
> with a nice comment explaining what is going on.
> 
> What PHY are you using? The Aquantia/Marvell multi-gige phy can do rate
> adaptation. So you could fix the MAC-PHY link to 2500BaseX, and let the
> PHY internally handle the different line speeds.
> 
Intel mgbe is flexible to pair with any PHY. Only Aquantia/Marvell
multi-gige PHY can do rate adaption right? Hence, we still need to take 
care of others PHYs.

Thanks for all the comments, will include them in v3. 

Weifeng
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
