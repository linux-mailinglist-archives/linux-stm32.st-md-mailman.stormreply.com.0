Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BC49C43E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 08:23:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F251FC60465;
	Wed, 26 Jan 2022 07:23:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12D88C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643181808; x=1674717808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g9xPlMF850UMu7WxD6YCg7YsYjvnOi8mqF5ny4KEZJM=;
 b=Inqc+tQFUDWxkrK9EWceERV5F3fovHrBEDvmcKjHjCAq/8dSI0ZU4aFa
 VHzkkmJlOubovUVCPUp0JvF09gpZPph1ZUWw5QUcualUjK49Atv/xgJtc
 iLPs66+2SjZfbW6LE3y3BIC1VALJ5uRqdgm9Pc+1b8vzDOIcoyg/PnjKf
 lA8ZODXaeqOVz3KyUkB6j5h3lsE8NC5ahcPnVlTCznECW9mkaXY8OPeDz
 82izXVzcueZj5gYat66U509MfMn/kPl1XJKVSiBlBP0Rb8pkuxx2Jyh1Y
 QpjGY+LwH5omnLjfseEsV09XJWQsY/yA6lK5iBnsdLxWTxsp23fpXShJh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230071104"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="230071104"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 23:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="563330047"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 25 Jan 2022 23:23:25 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 25 Jan 2022 23:23:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 25 Jan 2022 23:23:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 25 Jan 2022 23:23:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWf0urncFqv4sQ8u/Nnx4YOfwz/m9hJGn/8/WS00RaF1vqRNCKgz1qcn6DJlkp4UYnlEdwpwlBaND/6tyB004uI8OWXlUEMtc0r0sj8cD1cRncip2va265llmZIJGF36v8RIyetyJhjA1J3Tt4M1fFoS/EPA4dPaA2OpHsFtqCT4+kEojmg0PoV2kK2i/Tvw2Bbxn6wVfkr5YoR5Grs/F7y9Eb/uZ8QzNpAmhk5LwSkISzsE/9ZZkBG5f28naT57Ki+nwH5GWHoDInqG/2gors/7jmBDDuZp545kgJLiHtRS/QxDls5G+IOlVWN3KHPVx3/f6rGXf1ErK6vaceU2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOYax6r7OrbHP3iyI8Qxpxa27RmwWC17awBQTyC8K1M=;
 b=kRJvW213LD/DkxMC3ypO4BjMAUYCDG4SsSg+EeK9wRjm6Qp4xSIZYkUiFF65yn/qTmsOhDBhcsqFJfv3+pHUFNYa2JkaDWPrps6YPup3bhPxBMzmuADoMc+mVcH8PtkhORQiylLbbLN2hwdmMVZtOHpQT90TyitYsdkeGkhilxQXkubWqi2TfCBfUKzKLePnIQ/3+Hl4gmpoZA3RPBm9SJcm7j9+uOc1dSeDTmOMsH2AguETxiT0qdIGCNDyTN+Cn5HRdpu71wrNehFf6vPUVfM9xJSrUgPoRh8vJonpEuz7B05rkErAzFB8Pau8+j0ZM+9uEk6kqe2rJutCPgrc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 07:23:23 +0000
Received: from CO1PR11MB4771.namprd11.prod.outlook.com
 ([fe80::4843:15c6:62c1:d088]) by CO1PR11MB4771.namprd11.prod.outlook.com
 ([fe80::4843:15c6:62c1:d088%4]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 07:23:22 +0000
From: "Ismail, Mohammad Athari" <mohammad.athari.ismail@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Thread-Topic: [PATCH net v2 2/2] net: stmmac: skip only stmmac_ptp_register
 when resume from suspend
Thread-Index: AQHYEZsS6IdbtbO8OkO3EV0xu+Kh+qx0tC0AgAAznrA=
Date: Wed, 26 Jan 2022 07:23:22 +0000
Message-ID: <CO1PR11MB4771A6297E5E91D063DBDCA6D5209@CO1PR11MB4771.namprd11.prod.outlook.com>
References: <20220125032324.4055-1-mohammad.athari.ismail@intel.com>
 <20220125032324.4055-3-mohammad.athari.ismail@intel.com>
 <20220125201756.1606e1c4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220125201756.1606e1c4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecdcc633-74d0-406a-96be-08d9e09cbc4b
x-ms-traffictypediagnostic: SA0PR11MB4653:EE_
x-microsoft-antispam-prvs: <SA0PR11MB4653028C81F1234744A6864DD5209@SA0PR11MB4653.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MGpBLuWt3/n0bfv7unHB68xgkYW/wKA0Xrau0zpnVCgdaR2FHW8VORwBtEJlLgBZ5QOfFoRJmYNKxHpWSXd4AvymDtOVOCxnnK1QdZXdmGYLmRp5xPDVzjyAb8InHeN0D9U/SflccUqrurLQhHDAFwP3SA2alQ2rwShys1K65TQFYgzeVMBW5aGFcUnBqqKtHHUsvD+8Cv812J7letBveaSw44wywCxl/uRA7HmK+I9+aDybwFxYf/kcjYNIzI2yLcpSWVu84HNVeLhzQ6+jKq+uVyfq/JJXVmyjAexUN1elds2kqkcaW+TCDzfYdm9HEjWPv79pLWK0zhkpnQxC8DQPMdDg7IOkPASQWgOi9fTlML2LEIsqnYO2R3wJKM3N3EUULNoQwgTv0fPa5GFrfMBWLAPLGtBO70XI/vGf8PYJDn3KHzAhVQzTtV6jJtbazOpXUcy0ZdL2WwtUokGFhpAiYfPs14FemP2+0PsSdiKbIbv8KJBAwW0DTGJgF+TRqUHfnZdFOQm5hSJu+QjiXqaJGONp5QVFIfK0Jyv43uw3N7sNRc30nnPPFTQq7CegHJbe7ScuLQYBUB8x0lSUgBak/SSD80QdkmzRz6stu5fD6u7UAbKuZQdLRg2FvhddW+MUHiuGOWy+nUo0+XWUQ1xrgsO2diseG9paIdq+FSJSXMO5W0VywE37qBrOL/rEFx76trodTZpIa/eP12wfKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4771.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(55016003)(4326008)(8936002)(38100700002)(26005)(2906002)(54906003)(122000001)(186003)(86362001)(55236004)(71200400001)(316002)(8676002)(9686003)(66556008)(33656002)(7416002)(83380400001)(7696005)(82960400001)(53546011)(76116006)(66946007)(66446008)(38070700005)(64756008)(66476007)(5660300002)(6506007)(508600001)(15650500001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/FgGSPJ/UVE29BxEZszVrbOmDwYQSYxfuAppHkPkF7aJNLRrHGyWc3NnEUXC?=
 =?us-ascii?Q?ZRpY/ZDinO7ykAraG1uUkESiCg+zvYYObGdKTu2mjBmHJxceizKCBjrzpyA/?=
 =?us-ascii?Q?/lGqi/+mKFGn5R6twYrLfhfH/EKVM/rm8ku74JKUKDK8gq31nh7BsgVoVwL0?=
 =?us-ascii?Q?y+rDIBwqExB1eQvBHQrEDzKDRzFcMbD/pcu8L3sspeJQcgdqH8gN4RaLEq/i?=
 =?us-ascii?Q?g2TIsaUEeP+U/LVpCb+Aoc0iniMS6nEfhxAT4DAXW2w7n5DOI5FDt0/C+MeR?=
 =?us-ascii?Q?IL/TjSb+fAooX/3udFKWlGwy12DZl6GjPAjyZLwj+GSSFxrM5mVk7DOHFPDw?=
 =?us-ascii?Q?z7BxlSihoUtcixoF0KeWOKrJgBGNO7+X6PusLO/seSQckSYaN2np6Eq0HNUt?=
 =?us-ascii?Q?h9VxWvrEPzhYTADMWL+8JwrwmV1vFOC9jC3AKm529TnYYH3ady0xQZbUkHo6?=
 =?us-ascii?Q?kblpYVRlGxNq2PDitKsU6eUNwnbKHZ626YbjUBuWwgbnkohCmLMeXrl6wTSW?=
 =?us-ascii?Q?69RDa6MYxhwB1csPNqRjTp3nSnkAVHectuursrZxa3uvSI5oCCE/k4fGSI9x?=
 =?us-ascii?Q?asMmr4rZfU/EtNJ0486l+40/XObsoozV3AUyxc8FufovhaPQAU8m2b+FB8gh?=
 =?us-ascii?Q?o73zKnkbQegjB6tSPiwkgErNDtBqh5ZTnvXbxixUU0DfT2tlOUjib9dJYp7p?=
 =?us-ascii?Q?po0dmSc3WMpEv7nYU+eLcE8Wal85+RXOmCyGdSS8nn2U5dgUs/eKkwIVV7w5?=
 =?us-ascii?Q?XykwHnxygWrtA19XZ141O2HhnIXsJib3LLZVp1OJlOgm3e3FtRh1oeCPNBCW?=
 =?us-ascii?Q?kajz976j6SE9RaAfdWtnrfGgvkbMbftHakCOdizHoSRCxf799NSXoX02S9WX?=
 =?us-ascii?Q?DfsR/aE76UhvF2LfAeSQ1XC3kiksjGe4bQLHof7BQRUL8XXP7ypEgo3QdVvq?=
 =?us-ascii?Q?407h1kgptDYzDZO0xLCHbt2Ka4FOCj0LNoDb3HrYTs7WsTSyZ4c7E6SDDANU?=
 =?us-ascii?Q?dBX62cwBSjPlg9qdHMW/RQCAjLTpW4Y3LwA5AhsbgbRqa8UKoY4nPNEU5lNu?=
 =?us-ascii?Q?rUvJPHI7Yacbisvr3gJvnR/U8Ze0CWdG85WpI1IDjwqEtWP5dH8aONeRLwuY?=
 =?us-ascii?Q?8QMINcNTT7FAZIfk64qV00oFnPWybcTMVDOidS8pgzx5IWewxIvvkmxsc2z9?=
 =?us-ascii?Q?caTtG4yu8bb0YEQqCmHgpaCIFEyPBjzKfEHIYZAJi1qGPDxKhIKBN2Xt6YyC?=
 =?us-ascii?Q?fhNshXADjxivSuPY45hD4KZBEoW/X7/7/IB23GxGufAj2d942Maww4+73QvO?=
 =?us-ascii?Q?+Yc+anIbVeG9dCf3QnMW08fbW0GkzZBpg8dR/47jhpFG5YRyHe7PnmCyr9iE?=
 =?us-ascii?Q?/VL80Ec60fZgXEFTVKqY+Cbxu+hh6YjKheCSxmloaIi3AXwwcFzxLP4zgrmM?=
 =?us-ascii?Q?L43b1bLL5VoVYUX6AWtumfk6V0Z75oslPqWvkin4L1loetzbAULop8VmPJgD?=
 =?us-ascii?Q?FzB/N6vjAwXR3uhX59mmONNbvjNLUlOvmWcz406bbh0Z1QS33KHM6wFfqz6+?=
 =?us-ascii?Q?UKCIES0a4jrJmMIbt7Iuw6PwOyJQXbj3kpNxDtcds3hqBlBGIEs+I3hVDavn?=
 =?us-ascii?Q?UpN6Z4RPjrDNvU6TBpd9ootMgcHLr1nnkS3Q//Xk5FFPVRsrwp8a92850Czs?=
 =?us-ascii?Q?JE6wDS3uUXi+teD+9NysjOkiie56ax8EXb8eM5yLumEgroclS1NTxWFXIPTI?=
 =?us-ascii?Q?sI177gabvg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdcc633-74d0-406a-96be-08d9e09cbc4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 07:23:22.6820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWM6tBjs9HZf6X+LF1wKE0bHgqIbp0LWw9DSKEguXGkz+OMgWCYs5BkHOPwXzGqXcU3F03crYstE/jELRVYdihx+nSrph2iQA1fBzn35caPSpW9T3odgSWfYXb1SzUMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Huacai
 Chen <chenhuacai@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: skip only
 stmmac_ptp_register when resume from suspend
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
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, January 26, 2022 12:18 PM
> To: Ismail, Mohammad Athari <mohammad.athari.ismail@intel.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> <alexandre.torgue@st.com>; Jose Abreu <joabreu@synopsys.com>; David
> S . Miller <davem@davemloft.net>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Ong, Boon Leong
> <boon.leong.ong@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>;
> Wong, Vee Khee <vee.khee.wong@intel.com>; Huacai Chen
> <chenhuacai@kernel.org>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; netdev@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH net v2 2/2] net: stmmac: skip only stmmac_ptp_register
> when resume from suspend
> 
> On Tue, 25 Jan 2022 11:23:24 +0800 Mohammad Athari Bin Ismail wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index d7e261768f73..b8e5e19e6f7b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -880,11 +880,12 @@
> EXPORT_SYMBOL_GPL(stmmac_init_tstamp_counter);
> >  /**
> >   * stmmac_init_ptp - init PTP
> >   * @priv: driver private structure
> > + * @ptp_register: register PTP if set
> >   * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
> >   * This is done by looking at the HW cap. register.
> >   * This function also registers the ptp driver.
> >   */
> > -static int stmmac_init_ptp(struct stmmac_priv *priv)
> > +static int stmmac_init_ptp(struct stmmac_priv *priv, bool
> > +ptp_register)
> >  {
> >  	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
> >  	int ret;
> > @@ -914,7 +915,8 @@ static int stmmac_init_ptp(struct stmmac_priv
> *priv)
> >  	priv->hwts_tx_en = 0;
> >  	priv->hwts_rx_en = 0;
> >
> > -	stmmac_ptp_register(priv);
> > +	if (ptp_register)
> > +		stmmac_ptp_register(priv);
> 
> stmmac_init_ptp() only has one caller, and the registration step is last.
> Wouldn't it be better to move the stmmac_ptp_register() call out to
> stmmac_hw_setup()? That way we don't need to pass extra arguments to
> init.

Yes agree with you suggestion. Will fix it in v3. Thanks.

-Athari-

> 
> >  	return 0;
> >  }
> > @@ -3241,7 +3243,7 @@ static int stmmac_fpe_start_wq(struct
> > stmmac_priv *priv)
> >  /**
> >   * stmmac_hw_setup - setup mac in a usable state.
> >   *  @dev : pointer to the device structure.
> > - *  @init_ptp: initialize PTP if set
> > + *  @ptp_register: register PTP if set
> >   *  Description:
> >   *  this is the main function to setup the HW in a usable state because the
> >   *  dma engine is reset, the core registers are configured (e.g. AXI,
> > @@ -3251,7 +3253,7 @@ static int stmmac_fpe_start_wq(struct
> stmmac_priv *priv)
> >   *  0 on success and an appropriate (-)ve integer as defined in errno.h
> >   *  file on failure.
> >   */
> > -static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
> > +static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(dev);
> >  	u32 rx_cnt = priv->plat->rx_queues_to_use; @@ -3308,13 +3310,11
> @@
> > static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
> >
> >  	stmmac_mmc_setup(priv);
> >
> > -	if (init_ptp) {
> > -		ret = stmmac_init_ptp(priv);
> > -		if (ret == -EOPNOTSUPP)
> > -			netdev_warn(priv->dev, "PTP not supported by
> HW\n");
> > -		else if (ret)
> > -			netdev_warn(priv->dev, "PTP init failed\n");
> > -	}
> > +	ret = stmmac_init_ptp(priv, ptp_register);
> > +	if (ret == -EOPNOTSUPP)
> > +		netdev_warn(priv->dev, "PTP not supported by HW\n");
> > +	else if (ret)
> > +		netdev_warn(priv->dev, "PTP init failed\n");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
