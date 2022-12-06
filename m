Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B45643C0D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 05:05:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC51C65E6E;
	Tue,  6 Dec 2022 04:05:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C133C65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 04:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670299548; x=1701835548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ruFXw41YqHNRatha58hg1IrbWVgYx9gzZxKPbGjLPOU=;
 b=MpttwZx3PIKbqGMoCvp8lOK5ywfh8bgPRU3HvjYa1xLWMOPs+xel9Ami
 VAV8LIlaoeqJSN+5/rwAxO7cinKfJfs8N4t359iCXuBprkTkCsR5rSvQt
 +HuVnkWJaNks6oU3FhDwvIvUPQmrEOcdRgdg9mrJl4giZDBAcgbcu8CJx
 lUCeLsGPnzpGf/1Lm6duuo4lwJt+2vYdTnRpaGX34g+5341aUsPrVBWNa
 A+rGuJFDYpqRMm7A4lb1+rh1WjCzugvozbMEWGYSsqy0zAKGjfwOoMIpA
 NMgW9/B0UI4f+Ku3aj2CIsEgpIuTYMUX5XhL5SXPkeQCJABLjEiBV57gn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296220046"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="296220046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 20:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="734844638"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="734844638"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2022 20:05:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 20:05:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 20:05:45 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 20:05:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYLWZTGJM68Rtpt3JHPcwkQ/G4giB2LejHq1+22kbez9tgWNXSx/32KykEGiyiieYBMomPzD1YOtSUbBKM5s+yewL5Fw92MHSwi4i3yAhEUoNCGzanQs+9G1AORWkpwqHTyDRq+HJWogma6ZHMH/lHZw4c8kdD1JJi/BnlFmxj/AoNRwGbRfuLp3Ivd4K5cFDO1JUPvi6dpsIAoRUl8GbH97jsb7hGwArsE5Sd8UYdG0zqNogB18+TW1YTcVZ3y+8DWReTVYExZ7Jji/ph4Ox0jn/dyz5bE3HPKMua+4s4xgxuk+5aUVFtbwPXAKnXhicStYXgMroWPU6s7CrcMAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruFXw41YqHNRatha58hg1IrbWVgYx9gzZxKPbGjLPOU=;
 b=nWjkqGGJLIRJ70peCWoeuVxENDwDcJkb96mFE3NWih9mEQGap7gCqCF9fyX+AbpxLV6AEkT3Cgi/+EwNF0175iexrVOKv7XE5gJkCz7KWOkgLK3lMzVaJUfdP5Adq1wFg+P174H7wXXR/+sqI6w9aIW3vT8fzhLnpedT7eekSpSR5BjCZ2hl+hBBiiqas58DVIuLpG3Bz7d4iSSdr3M0oa3G+f/d2A0ZDJBuQZLkhPmGh2cqa4pMEEOAImPE8ZYJ2QO5JMMHR0yqO3OremGeejUuaAeV0x8UoCm56bkRWECUZP+Yxh0yuXXAOyuk6Q2K2VEptFX0Cc+ex4BW2CF/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) by
 MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 04:05:43 +0000
Received: from DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::3cd8:7b78:42ad:fef6]) by DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::3cd8:7b78:42ad:fef6%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 04:05:43 +0000
From: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH net v4] net: stmmac: Set MAC's flow control register to
 reflect current settings
Thread-Index: AQHY/ymhvdEBGqbU9Uuf4VkJqqcsh65P0A+AgAQPEHCABwheAIAFX18w
Date: Tue, 6 Dec 2022 04:05:43 +0000
Message-ID: <DM8PR11MB55903F62C3F513E56DAF7CBAA31B9@DM8PR11MB5590.namprd11.prod.outlook.com>
References: <20221123105110.23617-1-wei.sheng.goh@intel.com>
 <20221125160135.83994-1-alexandr.lobakin@intel.com>
 <DM8PR11MB55909F0270753517565B12A9A3139@DM8PR11MB5590.namprd11.prod.outlook.com>
 <Y4o0wglBDaP5+w49@shell.armlinux.org.uk>
In-Reply-To: <Y4o0wglBDaP5+w49@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5590:EE_|MW4PR11MB6571:EE_
x-ms-office365-filtering-correlation-id: 2aa1f5a6-d7cb-4db5-7e1f-08dad73f254d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0tn/Cabl7mT6yHPlbN5nS6IZ9rrlF1G+c591evliYvOkj0kBkYXJz1BMWY0VXtVUK65oMIQjWmvNi00unAgEH9qKO8aOAENAMD3ludbLfXEvoyODWKIatJ/Q9xHhh6iaN9E7zFSwcf/F+n7QAgiZO+/EKUFUarzDAuH9+vNLyROPRdDblnjdSCGfpZnhdTPRDZcVjAqRXL7t/T4KoXyVs83ZKLAfgtPU8juFxfnsrjSfPjAyzvhl8AkGJVCxd98gHDGSO14RMDYiLIjiKBNwJuOSbl0C1g+ZHwLXZ4S2HjUIgY14EwQnBIY2CL5XxkiJbXsgOcptkXlmS4SmzAxnbJE+GFru0xNdLH2f9O94eSWVkPi9wDNSxTPvGbV5x1Rca/TAQM9blmOPDYAKEzTOkxbDO3efeh7xU1DoNoVlcB/QFDFafmkm7kOEo7bA5u5G2GD664uW2+w83i728hqw+igIBK7S5ntjKLweLZpUYVzatBPfNdkIo6ca4lzn1+wdeSVtiMeySVMStmJzD0BflX67x/azvjksQOqulEXJmuTjk41NZXwRiMIlEVbyaqyMXnTeOWenmKZ69UX/0CRrUaSy3XdgjjQ4GSq4umx3up0ynHxXKxgaO0YgJKIhVuVFFq4BN6hRyX370QZUDKo1iri5L+U26yLzaiKMdxyX7LapZ16alHepWCNMGF8ADAPCQ3+50dyz5C7vlgRFl6A97THkqmMClBqTm0HftnR5Rmc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5590.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(122000001)(83380400001)(86362001)(82960400001)(38100700002)(5660300002)(7416002)(38070700005)(8936002)(41300700001)(2906002)(33656002)(4326008)(8676002)(52536014)(55016003)(6506007)(9686003)(64756008)(186003)(26005)(7696005)(55236004)(107886003)(53546011)(6916009)(54906003)(316002)(76116006)(966005)(66556008)(478600001)(66446008)(66946007)(66476007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cl0W5ZeYPRwN9y3Gwek0vrpMW6E/bn9WcJg/e82DweNqPSxiRbJuoOkcCCm9?=
 =?us-ascii?Q?/qWTskJ4FiBLbevOV6pb9lvE2yMadKqxQg6drrOL7dGOFeUlTiu5BnJduWUQ?=
 =?us-ascii?Q?+VH2IEmZVyjgexhXBI2RHtqh24Tvg2FtqXix65tZ8cw5vpeq9VdmXPqqtJB+?=
 =?us-ascii?Q?9NpZE7bqDB1ZmzxIOhmGQ3yOJQw3UG4mBJIwibObQqgO3tzhN29DUveAiDNO?=
 =?us-ascii?Q?b1Bg12einSUlsGEYrHnax5AKs1Qed6W7MGvl040Ufocj8r/O2byJA0pK8Mj2?=
 =?us-ascii?Q?pln15AdAXtS0V8KN2SBoynOOBnx+vVlP99oUvKm5A1mwteZ+SLAoqiPVph33?=
 =?us-ascii?Q?S2LMyHNBvZGMtFf4vEaKcXLSn7R2WtEwFg493+TfpxpWxO6eXISykJuBIq1L?=
 =?us-ascii?Q?nHZuAOJJd8wQWSDMR4ioxeQ0FdR0rBmHo0Ubp1xUCT84T19VNPYIvY8MRxkk?=
 =?us-ascii?Q?HI1AinqmxLL6/UbUCKj1oNk3txg6BMenITTi36mrFA7dHeEcaBTzsLAVNWf/?=
 =?us-ascii?Q?IhglnQ+2YbUBkAbehxjc4Fcod3wOIy4YY+CXALf5ICnTq0TisJsZT4UmR0Rf?=
 =?us-ascii?Q?kEjN7vDcoMI6Yr6ORf63tDeY3jccTf042Aj6ARDj0a3Gnb/W9NfFl9YSv9h1?=
 =?us-ascii?Q?mrVL1zyUcW3VCFozwJzmIU20+Py+UICDjrtv6Ebw4JdYywol/qrByD3RoFYs?=
 =?us-ascii?Q?0jeiWs17VBn/FOmCD2RvQjF6h3C2SEcUUT8OSuqBst05R0Rr+gHqB1E9mMjD?=
 =?us-ascii?Q?34jQ3HAb3RwwaAEFEyJxUMuNLAW/DLlngd7fjRtS/J7wrYF4xtHaCKk2V1LB?=
 =?us-ascii?Q?k+sUG8mZ6q4oB47xE3MUOU/KYrX+dcnjFcYfBd3DvgBOwykUo7uFBZKAUyKC?=
 =?us-ascii?Q?z8fNTs4t8aCyu1B+UU7DBAQSlOsiWVCbOuj9Sw8troTh9t+4JowcM0+/ciuO?=
 =?us-ascii?Q?SL9WZ7JTanSxZGgmrqRlsFXW/eXXoERhyF6hh6INBgCvltHdva0Z9JgTYZ3r?=
 =?us-ascii?Q?Istk/UHiQJdKiyqt9jHgWLM3imklcKFaAx4yQbTRgomYPDgDwsjPCpN0xKxM?=
 =?us-ascii?Q?QuTQeJrDFJqZkl64k4f1fEwKgWH0OBRqU+AhrpJxR1d229Ided6C4iaCe1CQ?=
 =?us-ascii?Q?xVZrIuEooyOyl4/0BmBWX+AHe100b1xJ6aSoO9+gKbZMcc552Q9BlnVWFonk?=
 =?us-ascii?Q?NcBEsHqlZxyc0haJ33FVl2yW8VPWI3YrLIzuKdunVVgKf+Wmw6Nxahe2zQIR?=
 =?us-ascii?Q?LGmRqxrWDJrxCCMtnA+hYr8NtZtBFt0prchGl70JgL2R68KrTfXDCFr3rM2Q?=
 =?us-ascii?Q?wU+NhETkl+slWdLSJVczZg7eBjkPbk6pJr84PtVy0mEq8aAZNRlVOdi5zcad?=
 =?us-ascii?Q?L8drbOIrwFmrhoDiuXO98eYS5g88GX5p3HN+ZU5O87fWwdjdFyNwWYXicBCA?=
 =?us-ascii?Q?EyDADg10CV/GiJjX1Shyc2AIBrNLeJupmlkX4hM06OtzIHR+QZeP09HWAwdx?=
 =?us-ascii?Q?WweM6xIIqSdkqz6Sm9jcfgwH7goE5mcyfk/dTv/gvYMyoEwP0JoPyJyVAwNw?=
 =?us-ascii?Q?nJ/coPAe10DCWX697FMdP+d89VWYe2Ejy0qrSMq2?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5590.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa1f5a6-d7cb-4db5-7e1f-08dad73f254d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 04:05:43.4624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1th1OHTBmd7KVDMXR4pjsqswN0vYpTyaz8A2ewjMp+tuZbTA3wvxpCwRyvLSkE3RUQhx1iIee4wrxUAHdkp+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-OriginatorOrg: intel.com
Cc: Alexandre Torgue <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose
 Abreu <joabreu@synopsys.com>, "Lobakin, Alexandr" <alexandr.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo
 Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Ahmad Tarmizi, Noor Azura" <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow
 control register to reflect current settings
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

Hi,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Saturday, 3 December, 2022 1:24 AM
> To: Goh, Wei Sheng <wei.sheng.goh@intel.com>
> Cc: Lobakin, Alexandr <alexandr.lobakin@intel.com>; Giuseppe Cavallaro
> <peppe.cavallaro@st.com>; Alexandre Torgue <alexandre.torgue@st.com>;
> Jose Abreu <joabreu@synopsys.com>; David S . Miller
> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Ong, Boon Leong
> <boon.leong.ong@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>;
> Tan, Tee Min <tee.min.tan@intel.com>; Ahmad Tarmizi, Noor Azura
> <noor.azura.ahmad.tarmizi@intel.com>; Looi, Hong Aun
> <hong.aun.looi@intel.com>
> Subject: Re: [PATCH net v4] net: stmmac: Set MAC's flow control register to
> reflect current settings
> 
> On Mon, Nov 28, 2022 at 06:06:11AM +0000, Goh, Wei Sheng wrote:
> > Hi,
> >
> > > -----Original Message-----
> > > From: Lobakin, Alexandr <alexandr.lobakin@intel.com> Any particular
> > > reason why you completely ignored by review comments to the v3[0]?
> > > I'd like to see them fixed or at least replied.
> > >
> > > [0] https://lore.kernel.org/netdev/20221123180947.488302-1-
> > > alexandr.lobakin@intel.com
> > >
> > > Thanks,
> > > Olek
> >
> > Due to v4 is being accepted. Therefore I will submit a new patch to address
> your review comments.
> > Thanks and appreciate your effort for reviewing my patch.
> 
> And on that very same subject, why did you ignore my review comments on
> v2?
> 
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

Sorry I missed some of your comment. Will try to address them in the next submission.
Also thanks and appreciate your effort for reviewing my patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
