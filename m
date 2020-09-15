Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E226B635
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 01:59:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF79C3FADF;
	Tue, 15 Sep 2020 23:59:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F688C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 23:59:46 +0000 (UTC)
IronPort-SDR: VU28GHGEXdE56VsbARewhOFOVWs9Ors1bqhhm+1RvXgUV9fiNF4NvBFONrcRLt3ftd5ldMZwMd
 xOjB0Fwsc3Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147060324"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="147060324"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 16:59:43 -0700
IronPort-SDR: aWjtRaiYlQRv+CkBlREMP26pAwEHolVrZFApUkvO3B9Q7TSFTTs8xfSGgnZ4CIHi3oNz8z+mx9
 0g8x1S6RwFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="343698736"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2020 16:59:42 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Sep 2020 16:59:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 15 Sep 2020 16:59:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 15 Sep 2020 16:59:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqeQLWzUZRyTGoMpEs4g5jI0xXh2StMbbSaWMnRb+UvPZELlblWSh0HM0IzU+SHM2E+spSB/AuqoX/PQs0/3FY6l7qyWOOyA1ufkA+KhViHrUuaIC4tqGuWuRKMat+phOMdhxxRCbGRaWHxzuLSwxIDOKnuSydnNYq8QTJHi9ee9wxxo9sfCikBkMegV6fn8fysag/0KMobcIXoaw+l/3t+e7ZMeD7V7z04zsJTDU15mdfMNB7rnKri4K9kjqbxUu+pdoip26zBxRqa1q2nuFZNi05/vWztIw0CYu3xSxq1IGbwel9gm6oMVmuE5bVWGyMNeyn5c4OshOdGdPWvW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/skR1lOZBvQTHfc2D3l9Y9H35lJdtJSDQGQIEMPyN9g=;
 b=LA5wNncq5ktVr/5/v71CKfBKn2jxW41cTlF/8ogzLgQZZDk1vKdRvhPIVoOL3dG3Ux+Auq6CytGqXL57beqtxtulgaS3KYhJ6Bk2c4COW4PE3OszKh6gHjyNagWfwJZE9u3OCIoRoFdHeMhiMalK5hCYqC1gFVj0f+qPcEJa1s3BTWmVMtUpy8NoknNGLNILeNA9vRzgdZCH8Ftsb7l4hPlmcFx+jGY5ipuM0JkVBsHLpRezdwlABiNcFJ4oSI29ZHxNW7DOCL6scPPe2uH1ipBfjBbJQF14Ifqke0s4AAc8JzLaCqSXHqx5p7dZRS+dH0xNSkrnljo2zTvkdd5p3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/skR1lOZBvQTHfc2D3l9Y9H35lJdtJSDQGQIEMPyN9g=;
 b=Ln2y2d6zbsHw8x6sqlp7IL6hISd77mFAGb3oJDd6HPiRNCeH7cBIoddv/TZOotZVlK4AgIUHzHnjDYn2yCYPAnAzBxaAmA0WqFjxr1NE9hyk6eyRb7gkYeb9qPOl8AtHzNHTwRF/usweML+rMI3PxrShXb8RmSTPDBsfa0f8qhw=
Received: from BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12)
 by BYAPR11MB2853.namprd11.prod.outlook.com (2603:10b6:a02:c8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 23:59:36 +0000
Received: from BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::742b:754f:e869:ff6a]) by BYAPR11MB2870.namprd11.prod.outlook.com
 ([fe80::742b:754f:e869:ff6a%3]) with mapi id 15.20.3391.011; Tue, 15 Sep 2020
 23:59:36 +0000
From: "Wong, Vee Khee" <vee.khee.wong@intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Thread-Topic: [PATCH net-next 0/3] net: stmmac: Add ethtool support for
 get|set channels
Thread-Index: AQHWiv9XVAl8d3DnkESPbUXj30pQbKlqTSQAgAADGgCAABG1cA==
Date: Tue, 15 Sep 2020 23:59:36 +0000
Message-ID: <BYAPR11MB287046044CA144193135B0E7AB200@BYAPR11MB2870.namprd11.prod.outlook.com>
References: <20200915012840.31841-1-vee.khee.wong@intel.com>
 <20200915.154302.373083705277550666.davem@davemloft.net>
 <b945fcc5-e287-73e2-8e37-bd78559944ab@gmail.com>
In-Reply-To: <b945fcc5-e287-73e2-8e37-bd78559944ab@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [210.195.25.58]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 487e02cd-fd98-4dde-2e20-08d859d366a1
x-ms-traffictypediagnostic: BYAPR11MB2853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB285311342DD3D56360CA31CEAB200@BYAPR11MB2853.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dyMe9mJlbYlJJy2ULEvN+YqFqzq2FYyBNcxFhFGWrY/vYTyZ2nVyjYu6hLcciUKOUSFcXaKRtGh8v+5YDgB49sUgAqfFdEQixUHV66hdEFIT6RgLzLb/4Vv77DB/kkmnyzq6EUbbW6wHs2/lLpY0epW18xT2emLHjJJW9oSfGSorEtRZ7JNBurOTojJTVTtnYH4U9/4tJlv2rKKTyVFwp+JCqG2Q8V4ridhJomg5PSiE8nPkKNqt0kWcfv+0dwgbiNYNxURPmOw5iZiiPXTwHIPP9kei1dCFhNlv64zxlBxiTI/+61n6LhJwk3EQ3Lg58QrZY30ouS+7ABuH6xm5lK3NtUHQWjjsq+LsKifJ+C4NGprIoSocJdSzqIDJW/fGGME96lrXoKJEkjkqnRpXYzm1u+0G9C0J2ZkZtnN6AmhWg6tXo4n4jOFFny8Apqjx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2870.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(66556008)(64756008)(66446008)(66476007)(54906003)(76116006)(83380400001)(66946007)(107886003)(26005)(52536014)(53546011)(6506007)(5660300002)(478600001)(55236004)(8936002)(7416002)(71200400001)(7696005)(2906002)(86362001)(110136005)(316002)(8676002)(33656002)(4326008)(55016002)(186003)(9686003)(213603006)(44473003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AV3FRRM6WEm6JiPrU0nlSUw/lto9EWptf3UMtWXwa6fKE5DSlJSq+hRpah/Mv7hufIqwybm/vsgEMkVFTGIusJQQ3vuC4WCiJR8Obks2PuG9Hmdyw01tJw/zTI/ZT4XPuA4VzFF+PrtbJE1sX1uw9MYC/X4w5RAjxsFCoRZdThfPQ6GDhUBhmMF0V5Xd0pqxOWELY/KDLpuxUqux+5FUzvq1uPc13554Ytm1X1d5XJrUNmd8Be/nhgGOOprkVl19dsJFXd7n0gB4BDXJFjF5qtQ9O+06Ruw3xsRdXl0W0fU3DyQKm2G8jKenEFy67LcUW9rqiBgOT2Flc9GWrkVTvy53xV3bWx967CRjY1HyfCevAuUBSSICQ9RxlqNIP36IUCgz3fWCEl5R1ovN73o56dW/ecyGzrewWoyAszDrGcJkbgwfpW4WNwWMpM+TBKbiXSbfR+q7IE/qzpUg4gihPDRPxY1yE6ZD9YFGDvnrUwAx3x2ynAZI5LFs7CLQlYCXntL/qx8op0ITrJoSEjOQNW1suF4ewvBBQXQFhS+TdBKU49LuGw3Tw/ZtsjLI9Az5DNCxpbKhHohHfcPyjZGIWabdMCQaRV0liDbA2eJt/nkCKzPJRwOrRU1A+ySEyXVJ9GF/VKsJZE64Y0xLLHIXug==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2870.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487e02cd-fd98-4dde-2e20-08d859d366a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 23:59:36.5986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBOGQpo/tEEoa1lkNAaCKkcbzq3oqNLcgMKr/hqWkqqWmulrqYNTu7AHC5zZRs7Uft2BT8+avH8mdNLvvR6umA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2853
X-OriginatorOrg: intel.com
Cc: "Voon, Weifeng" <weifeng.voon@intel.com>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Seow,
 Chen Yong" <chen.yong.seow@intel.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "Vijaya Balan,
 Sadhishkhanna" <sadhishkhanna.vijaya.balan@intel.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add ethtool
 support for get|set channels
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

My bad...

Hi David Miller,

Can you help with the commit message fix or do you want to to send a new patch with the fix since the patches are applied on net-next?

Regards,
Vee Khee

> -----Original Message-----
> From: Florian Fainelli <f.fainelli@gmail.com>
> Sent: Wednesday, September 16, 2020 6:54 AM
> To: David Miller <davem@davemloft.net>; Wong, Vee Khee
> <vee.khee.wong@intel.com>
> Cc: peppe.cavallaro@st.com; alexandre.torgue@st.com;
> joabreu@synopsys.com; mcoquelin.stm32@gmail.com; kuba@kernel.org;
> Joao.Pinto@synopsys.com; arnd@arndb.de; linux@armlinux.org.uk;
> netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Ong,
> Boon Leong <boon.leong.ong@intel.com>; Voon, Weifeng
> <weifeng.voon@intel.com>; Vijaya Balan, Sadhishkhanna
> <sadhishkhanna.vijaya.balan@intel.com>; Seow, Chen Yong
> <chen.yong.seow@intel.com>
> Subject: Re: [PATCH net-next 0/3] net: stmmac: Add ethtool support for
> get|set channels
> 
> 
> 
> On 9/15/2020 3:43 PM, David Miller wrote:
> > From: Wong Vee Khee <vee.khee.wong@intel.com>
> > Date: Tue, 15 Sep 2020 09:28:37 +0800
> >
> >> This patch set is to add support for user to get or set Tx/Rx channel
> >> via ethtool. There are two patches that fixes bug introduced on
> >> upstream in order to have the feature work.
> >>
> >> Tested on Intel Tigerlake Platform.
> >
> > Series applied, thank you.
> 
> patch #2 does not have a proper Fixes: tag format, it should be:
> 
> Fixes: cafebabed00d ("some super subject")
> --
> Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
