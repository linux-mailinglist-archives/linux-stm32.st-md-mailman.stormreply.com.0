Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148AD7EDC16
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 08:39:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3EEDC6C837;
	Thu, 16 Nov 2023 07:39:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17E1FC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700120362; x=1731656362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OBk0KZlzXuOkiAZ7r31JPXLw9i70RjK16HgLNag9mO8=;
 b=QtiAOteODOxagDPYz5HTXOrgiW3/SXFsk6G5tzA+pNZRftDG/9Ztkh7Q
 haP2AFB8LXJ3tZ8Ao2ow5BQB3ui4P3oA2dA/oFPfKOf+j8DQTRYjH+usR
 JDZuEi2gHuuT+f5xyg2tF76Bi49NnRjqLPrD4jl8mLbBltD5SUyiDb9gQ
 09sFxif9nanER8rk7sDUAEKY1sTwWvCff/birUT/s9gwgCH+VfcjrC4BC
 vi5atbrHFiQ1+Pan8wdRsT3uS6cshvBLKnhUFCHHXCjwKTnddeBbCVgb5
 7UX6vwduthfo/c1wgE9sb5JRBobASGuH7l6+9ZlgkuZPP4Fe+m6mUhYez w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394951545"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="394951545"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 23:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="909027928"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="909027928"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 23:39:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 23:39:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 23:39:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 23:39:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB4Hz7Tju7WXKOd1SN82DQ3kvb5QPe5rLtDMSfl4EGfxHz57nEP8C1feHxVNaHHVQsTAAnpooblsptVftzFJhs88AvNGfgENn7oooSX3g3U0KNp5vqbCSDVUyjT/CCph9hqhBJHNOht3D80broQZZnK1OiL+rWKoP0XOeZUVpHJ9WMfCiWB80s88FtGTGPB/GtQa72ry7N1qGRBzZ7t7uY/YkN1R04XqESbBGtGdUWX/UOwzDmj1eMheOKogvUwW322AWpq5KEMbvQQLshObMm/n04b+xTbLbXfdCxGkm8jHMl4DvQen1Va67quCgucI4aw+G+cJkQaes8WXxvtDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBk0KZlzXuOkiAZ7r31JPXLw9i70RjK16HgLNag9mO8=;
 b=JQw+ruXEqY6IRFh/RW5djV+XcfsRlfdSIyrAq/32AaNt7093T2Viz/Ey7qMRfk4rq21iGdJm82G4njkz0f97JH3xFa7WoZVaLGULvdjh0xiYpD5UCtFMnrWrthj5Hqvky3wD1pov8K1tNU9ub4uxrjMZUdufpecmDreXB8OLt11tkBXzOWoskqbgBCQHTzq1avXAHuVn/3nqpRJb4SAgRjtBJVhsnrNG/SeCK6cnTk4hG89mX4usH5OgUAAGGljNthRS0Z8AtRvdPG9lTMWj+LBhixLYzv1dvVqD/mFHIgTV4JhsHEqDjDgza+jZ//It6vWqFQLIlRRPdDvozbixUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20; Thu, 16 Nov 2023 07:39:10 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::ef0d:a32:5079:f61b]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::ef0d:a32:5079:f61b%4]) with mapi id 15.20.7002.018; Thu, 16 Nov 2023
 07:39:10 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Paolo Abeni <pabeni@redhat.com>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Thread-Topic: [PATCH net 1/1] net: stmmac: fix MAC and phylink mismatch issue
 after resume with STMMAC_FLAG_USE_PHY_WOL enabled
Thread-Index: AQHaEsouSAsqsnYj7kW/bSLJZaiaMbBxtQQAgAAx0oCACrBWAA==
Date: Thu, 16 Nov 2023 07:39:10 +0000
Message-ID: <DM6PR11MB330673F1441CFE89A8092D66B9B0A@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20231109050027.2545000-1-yi.fang.gan@intel.com>
 <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
 <01aa11e0c8b0aebb1340b5702a42b20c7a7aabd9.camel@redhat.com>
In-Reply-To: <01aa11e0c8b0aebb1340b5702a42b20c7a7aabd9.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|DM6PR11MB4738:EE_
x-ms-office365-filtering-correlation-id: edc41564-010e-4644-beab-08dbe6771f46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LoP1Cqrc3IkxVUTwxtmfSpCHsvsK/xB4MB2nCVJaARh/jLwX93CHnzQtLXHSrDOUo5DSDv6bnLFrtL9E1u0OFGzAHbgzJ1dmTAF9tIkfTiaNZTm9TJRP7me98awKWRskKHXclhGPSDpcZa9llgbtLHSfiQRVCFMaD1ErPasN4JLe910Hq2sm8szP4XW/NLdplrAkOXiEHnDuYC4QIgdSJE6ymiHmFnPZmGVpbHWqM7O44Mp7BZ3kKAa9PKt/706X5DlK1RlJSk4oxkpL17rc+aQU5zsHU7KzktEVs/Ljb0WrZXiRwJNKpQGDU8J7T+toEvB+yEddTkbWT/FwMiKlvGsKG0A5uJrbc49isen081+PjwaohPEz+bOwmCb7JFIGUbZLN3Dm8wMJevEXDJ0jiq+rRTL89s1PWu4Bk3LtSELpsCTpqla7hxUFG3BEet9LU1VvpHUnmDUlo0XbKc533wO8i8S3x4ylT3NWsyxV37CnJa5oFUq7uFkUYJY8FY5wnGsmedw37ZyZ6F25YxQD70LvM36NbwVGw82Y3MNrtML5TdFXd1yNG0m1YSFaZWdvp3RcnYKjwO4q1xIpwMho5ZByLldIbh5bhiC8ksYV+IRMmmi8LWtihlsSJIO95jup
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(136003)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(2906002)(6506007)(9686003)(53546011)(7696005)(52536014)(33656002)(5660300002)(86362001)(71200400001)(7416002)(316002)(64756008)(54906003)(110136005)(66946007)(66476007)(66556008)(66446008)(76116006)(4326008)(8676002)(8936002)(38100700002)(38070700009)(83380400001)(41300700001)(55016003)(26005)(82960400001)(107886003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aCtOcFcxbFJTK01Ud3BjUHd0a1RXWWU4b09ScFMwcEpCSXkrbXVnbU02R1NU?=
 =?utf-8?B?Q2xHdXR1cTIycnpQZ0xPVlRSYVJTYWpFNUJFdTZWNlZEaEVrTm1HakRUNG95?=
 =?utf-8?B?NlBVeDJmdmlEQjNZQVRBejVTR0dxUW9BeENZeTJ0d09OTE02NGFjUnY2bmdG?=
 =?utf-8?B?Z29oaEdBQkFiajg2RForQmFtMnNGL1JUVEdZVnk4ckRGV0lySlpkUlA4NWY2?=
 =?utf-8?B?OFpjUFVtSTVXWTBvdWs2RUc3MzhWSnQwY2VXR1NyZUZqOTdRTlBSMnZZMjIr?=
 =?utf-8?B?ekVaSkgrYlRWZjdGYkRZRit2RjZPQWM2RUdFQUJiM2RXYjR0ckhpWFBnT0wv?=
 =?utf-8?B?d3c1dEo0QnkzZ0hGVVBnTXVDWEFNLzV0cERUbkhwYzR1RHJjcjNsVElmNkdr?=
 =?utf-8?B?RVphVE5lcWNzY2pWOWNMajlNS2lPR1huVjFLMklUMHhsZE81SFBzckZvMDM0?=
 =?utf-8?B?UVhTNFpTTDNYd05XS2UrVWZLRC83ampUTWErUzdDTXFtTDg3YUNNWE5rU2Jh?=
 =?utf-8?B?M0N1bnBQcGVMcVYvczVKSEtjaHlUTGlobllFZjNMRGVSU3pFR3gwb0FVUkwz?=
 =?utf-8?B?NDl0djExa3FTSXJHekdwTkZzTGN3aW5CSjhKT0ZLbXB0eHJhdUtITkU0NWtG?=
 =?utf-8?B?ZTBnK3FhN3VpSUNOTG9TSUUwcHg5akc5Yi9XN0RBWUtpU3dQY1NpWFNNMmpz?=
 =?utf-8?B?VXhHNlVwdHZJSSttdm9DYjBmRUl2Vm1SVWljT01USG5ESDlXdEpmRUI4ZDRC?=
 =?utf-8?B?bThzUzJuSUNoNm9LM3lrR3hseWUvWU51eU43RVNUd0Rab3g3YUJqZGxDdlA0?=
 =?utf-8?B?SU12Z2Q4K3l3ajRWSEpoS0JPc1l1a2MxZGRNSUFpZVNLdytkdFI2Vnhod20v?=
 =?utf-8?B?VzFxcHVBSDU1dWlQUjdBQzFkd1JDeVB4dDZLZkFiQVBOZEVHK0RtbDNVcmdJ?=
 =?utf-8?B?VFp1VUpLWlRZN0lXQVdmUUJDcExDQlZ2Mkp4aytZWkNwc0VmTjlqSzFYR09m?=
 =?utf-8?B?cFNncXVaNTRDYkszemp6dEtCV1d2aHNsWVZMd3JNYnlHT0xLaFlJWEFwWE01?=
 =?utf-8?B?TElOcXJGcytybyttZUVwUkhHRGtjczhVTEdnb3pzOWpsWFBWVEM0a0FkZTk2?=
 =?utf-8?B?d0poNm9vdmFueDhqTng0amtrc0NDOW1PQW5JT1M3UGdrcDc0cHJHa0o1T1d4?=
 =?utf-8?B?clNSTm9sTG1kS3Npc3RiSExIRUdmZ2pRa1Jzdld6Z0dXZG40QXBHS2o0VWl6?=
 =?utf-8?B?QXExSXZrVHY4cHhtdVJDQUpTdk12WDlSODBpTUc5cGFqNTZZYlJIOGZJaTll?=
 =?utf-8?B?TDF4ajQzZVZscHpHblhtUW1MRHNpd0hHMzJlcW9ic2wwaHNkN1piUTVmcUxL?=
 =?utf-8?B?Q0pBU2E5Sk5vSEpKQ1E5WllRQ3JPQWRmbGhTdVE4TDE1RlJjNG9TUTFucS8w?=
 =?utf-8?B?bXljdWV2Z1JtRkdEVXRmOHIvUC9MZDJ5Mzgvam83SDJaZG5aZnVyY1dHN3hq?=
 =?utf-8?B?T3JOMFBQZWFGbzh0QzhoL0MvWVdEOStweHdxdnZSMllpT3pMcVBJaVIzNnFD?=
 =?utf-8?B?TkhMY3VUYU8ydUc3QTgxeFdhS3EvN1d0Nm1DdmJCc1IwU2QrdGhHMHl3Nzg5?=
 =?utf-8?B?NHQzNWwwU1RZazROTElURVcwQ3JhUjBSZ3NEQjRhdTRuY2VMdk1abXd5bDRk?=
 =?utf-8?B?QVEySStLM0xuQmRPdE5NREYwczljS1lzOG9SaWVyQWtMZXZBeWg5K0txZVpI?=
 =?utf-8?B?Y0RCSEdmV1gzeWN1NzRUbE9rRnp3Q2RtNTdZaWxQUlNCcVJtTDBJSk1BbkdG?=
 =?utf-8?B?NmFLUW96a2x0VUJRQWNhaDB0NXFNRGZvZkdPbEREaG0vL3dudDNVclBORTVO?=
 =?utf-8?B?RnpVbVdVQVVKM3JoMXMwME1TT1NHTkEwVnZ0bzZCODZ4bnRiYUdoVEQyYTUr?=
 =?utf-8?B?T0lLZ01hMDR0VmdoaDlJdGFub1RPcXFOMk9aaU9sSnBDVFpGdlM3ajFxdUlj?=
 =?utf-8?B?d09XUkZyRk5SbVl5MXZ2aFdSeVNScmZaQjhrd3FMYXlRa2hGU2Q2OUttOGV6?=
 =?utf-8?B?R3JHUFpzRG5vUlBpWVRZUHlXZC9JRWlpMTJMWDVMb0V6QW5nbk5LQjJtUjY1?=
 =?utf-8?Q?bxKNq2N0YeU+1TKpoEHI+Catj?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc41564-010e-4644-beab-08dbe6771f46
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 07:39:10.2695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcYFW8eXKMZ1TSziK8pzVry1dHjceA+HBpomplFnDg/SNmrHijDqwfPeWt9qLDdn7Mci+0DCujyrPpD9QVGrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix MAC and phylink
 mismatch issue after resume with STMMAC_FLAG_USE_PHY_WOL enabled
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

Hi Paolo and Russell King,

After study the information provided, it seems better to find another way to
resolve the issue. Appreciate for the details given. Will try to figure out another
solution.


Best Regards,
Gan Yi Fang

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, November 9, 2023 8:14 PM
> To: Russell King (Oracle) <linux@armlinux.org.uk>; Gan, Yi Fang
> <yi.fang.gan@intel.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Joakim Zhang
> <qiangqing.zhang@nxp.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Looi, Hong Aun <hong.aun.looi@intel.com>; Voon,
> Weifeng <weifeng.voon@intel.com>; Song, Yoong Siang
> <yoong.siang.song@intel.com>
> Subject: Re: [PATCH net 1/1] net: stmmac: fix MAC and phylink mismatch issue
> after resume with STMMAC_FLAG_USE_PHY_WOL enabled
> 
> On Thu, 2023-11-09 at 09:15 +0000, Russell King (Oracle) wrote:
> > On Thu, Nov 09, 2023 at 01:00:27PM +0800, Gan Yi Fang wrote:
> > > From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> > >
> > > The issue happened when flag STMMAC_FLAG_USE_PHY_WOL is enabled.
> > > It can be reproduced with steps below:
> > > 1. Advertise only one speed on the host 2. Enable the WoL on the
> > > host 3. Suspend the host 4. Wake up the host
> > >
> > > When the WoL is disabled, both the PHY and MAC will suspend and wake
> > > up with everything configured well. When WoL is enabled, the PHY
> > > needs to be stay awake to receive the signal from remote client but
> > > MAC will enter suspend mode.
> > >
> > > When the MAC resumes from suspend, phylink_resume() will call
> > > phylink_start() to start the phylink instance which will trigger the
> > > phylink machine to invoke the mac_link_up callback function. The
> > > stmmac_mac_link_up() will configure the MAC_CTRL_REG based on the
> > > current link state. Then the stmmac_hw_setup() will be called to configure
> the MAC.
> > >
> > > This sequence might cause mismatch of the link state between MAC and
> > > phylink. This patch moves the phylink_resume() after
> > > stmamc_hw_setup() to ensure the MAC is initialized before phylink is being
> configured.
> >
> > Isn't this going to cause problems?
> >
> > stmamc_hw_setup() calls stmmac_init_dma_engine(), which then calls
> > stmmac_reset() - and stmmac_reset() can fail if the PHY clock isn't
> > running, which is why phylink_resume() gets called before this.
> 
> @Gan Yi Fang: at very least we need a solid explanation in the commit message
> why this change don't cause the above problems.
> 
> Thanks,
> 
> Paolo
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
