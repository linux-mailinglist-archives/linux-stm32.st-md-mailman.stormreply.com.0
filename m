Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63B7EA90E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 04:20:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC38EC6B444;
	Tue, 14 Nov 2023 03:20:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CA4BC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 03:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699932000; x=1731468000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kofS9R3lsmoy7ikW3BAVQrhE1DHY1H7ED9lCivIwmKI=;
 b=P28MGzUHqgcJ7rkjfoq2Jbr4pEi1626oclO5hAGf+VeJ9fyrJ9z1jJgr
 FPCDeQ00WInndAQ6GEWAjAamrnldhfJquhu1xj2mgmwzNPHeeB92lL5DF
 4HUnQ1WjtGo03ezqqKAMweOYDKxj060m0hA129YH6oEwqlLmqzGZ0nP4t
 D5aJusL4vylMR3sW3q4naq/3tqCpKtaYozemScR/O8aT7yiYNcyv4Ry7j
 XPXlPcboRV2+iorc5cXbQZ5EINwv2iQ32x5oXCywpFCI/CoO1xjLmiWIr
 xo6fvBhp2VCeQdAbfi12Nqjx+InaenYBGvZqVnodWATGM+Qi+Dw2e8fsZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421665149"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="421665149"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 19:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="937901004"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="937901004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 19:19:57 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 19:19:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 19:19:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 19:19:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7Kk3dZG5YS2PJWzsm+WVFIi9HAcxWN6UtKQ2F5xXwN+5Ay3/M2dfRs+gmrP9ogQ+dRigQOUgz/aD1LTAjdIrVovBUlnG8rhonV2GqzdnxNKE4hHvPCkHJoWjT0JOpIxSyu8Z2z0HoUPvK8hyKGZ364ecZlNg3ND/vPAhYPKGBn2tlvj90hiRV7GDu8U+MtauKyjiVdZhvlVDOjfJdoYncS6G2WSsFtWeJnjJWBktarTvkqt1Cm39Km/a8KgWPjmtd330Sg2Z7rxo7Qunfr6DZzM/qtSaJkVjXPtUrAFEKj7St2O27QfzIsdmBc9UdHg2caYNsGHi4nN4aBT5awItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChlTVWo9pTykwV23w6nJFCz/A2TGs8LCNsK/7KVWaDY=;
 b=KEN9CF82/rAaR+H5M2ams4vPruW7EY1wzJcv+wxbC+FxsRkkb/kIR1NsMyNHcZSZFg/VcVwyKY6eVVnQvmyQS6HkiRL9Yyyjx7J+9t0BvX5PyK+IqL5rNqMt4uCOT9VA3g82LWmQPU65vLuRhvDX8opl3rbe2NY3Hp9ThkjE2t7Q0N5pWZabXC/C27Qc0o/KK5lOlHZFA8s6LE3C9bGLcg7cYF3ldkx54vNPvG7SFD3apo/UOhbgMh6xA9ArCTg/Ki2FjoiBWtpVGFr4O4MM179z39tXLXqRqH5HVMfeS+HV2mPjyA6O+N+Ue30Af1d4t9GE34Yu4oejPOI5iIqwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 03:19:53 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::ef0d:a32:5079:f61b]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::ef0d:a32:5079:f61b%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 03:19:53 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Andrew Halaney <ahalaney@redhat.com>
Thread-Topic: [PATCH net-next 1/1] net: stmmac: Add support for HW-accelerated
 VLAN stripping
Thread-Index: AQHaEs9623f8ro5c10mb3iSzTHf22bByQlAAgAbnq0A=
Date: Tue, 14 Nov 2023 03:19:53 +0000
Message-ID: <DM6PR11MB33068CFBB3BEF1F773CEE4F9B9B2A@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20231109053831.2572699-1-yi.fang.gan@intel.com>
 <x4xutfdi3iqo2xdahfu5xpvkgxoogb7bptfmug4cdzjhnsy75x@vu4gzqwxwqgh>
In-Reply-To: <x4xutfdi3iqo2xdahfu5xpvkgxoogb7bptfmug4cdzjhnsy75x@vu4gzqwxwqgh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|SN7PR11MB7017:EE_
x-ms-office365-filtering-correlation-id: 41a547b9-5315-44a1-2f4b-08dbe4c091c9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5VrGzAtqJwwj61QD3IAVr+zE+OnYiSybKLp2JqmjaQwEM8j6zgbNjkXDouy0jFRGsmiocY8zZ46DNFdR9dYQF2BU1UcB5R5or4fTPBtEn2uOJ4ATyM5lMOzMhNGpa5zLycSkaGd1TfE2H783+ZZKT/oghxIaWjtfd33Ve6LK1LTZtCznEMjw7lmak08UHIOPX422zHDRneve60P+u2akF6RcN6YMh3SyRTCros6wI6XimGuxNaLoqGKGSUHIfUJhnYBaRaKfsztlV0VCNbLX7g/hYRBkzaGHw1zg1BSGPD+MSgjDOaBVrhKm9cQjJMoixik3mB9PCYYg5qZJdWg7HBhxoQUdYMNnhMzmEzIPBVQ3OwnMMlEXjoWGERUbbBXxVFFz1lm30BLJKamofUQdx7CVUDoILKxTOM8kZYxzS1HPdrMb1aUqrvFUlbX6iiUcSsUEPi0Kv1qPUON47Ivxmlq0GLRjwNhCLBXOipRo2H5yxQIRqfszUwIgeqJPkpgEDfBSAtsifWBIInpMWUH1j8bos7kj6d0k9V33MhsQcVjkwi7F15RbwggEr85Gw6Dn2xOCRGLdqcCle0Ae2yUlfVrFEvnABuJHN3rofhE8O8zKlO32835QsPNZZG0hect9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(64756008)(66556008)(66476007)(54906003)(66446008)(76116006)(66946007)(6916009)(86362001)(82960400001)(33656002)(38100700002)(38070700009)(122000001)(9686003)(83380400001)(26005)(107886003)(6506007)(7696005)(53546011)(71200400001)(41300700001)(30864003)(2906002)(478600001)(316002)(966005)(5660300002)(7416002)(4326008)(8676002)(8936002)(52536014)(168613001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IyC7GwDiYyWm4t73ezJiVtjzUWx//jYzCEuz8migStEYpqruLTYPljxXOHkV?=
 =?us-ascii?Q?dWMBXLNU7UhLrFZXWXGd3bQIdLbAMwM/ZYEdoCjKBu7HhxIl401XgtJoF9aV?=
 =?us-ascii?Q?zx+nX+kAp2albUPdkHvTkK6HeDU4sJy8DW78daOXghDiHwwgiAHgfstOZD8Y?=
 =?us-ascii?Q?pEDMPbBC0Q/u7rSlqKxGg45ogLgblc3aMmtxxCtufooe2z2JDHyL3o2K9mgP?=
 =?us-ascii?Q?goWNp8ia3eAmb9OBKiBMkA4ZW5eOBUEwILZSqcwXZ+RjlZNxYM7nIQ7QYi72?=
 =?us-ascii?Q?+HtpIfdotkz5nsPBnZhDVHo1lU+ZlR/EwgUvETHt+bhwjAf0fp8pzBRhs9Rq?=
 =?us-ascii?Q?IxEtLD8Ms4+4uMBVw6r63apZsq2nTSHcOagsy+EpEdoVPTs5K8THdPi23Y1R?=
 =?us-ascii?Q?3obY6rGHh6ghZgjFD6XNLvjqw0st1WkWsHNxlhkwhK8dECzggI4wRVC8LHIu?=
 =?us-ascii?Q?j677EAcXJrE6gp5CATzosL9yquFcr9LH3ArfSmkmDcDKYuifIhefXfsWVA4m?=
 =?us-ascii?Q?3M4ev1Rbu73m9mRj3SLdWeVj8CCY+Vae4eoiblz28cDc8+BqBbW2batJUhIC?=
 =?us-ascii?Q?LhP8c/Sy6Zusv4kt0705aDY9Cf74WdUZSedyQ6gXIksVKbzrkps5mKspOPGU?=
 =?us-ascii?Q?2WA8HnLK/K+oULgxV6bxV1h+Oo7kFekshNHtbnzyU9e69fQt3FqWCebD+Psm?=
 =?us-ascii?Q?DTxhYAPpPIHwkRBNnJ58RQn78RRY0qM9/plVnx5dAWIUxxsRjhQfcsDNi+5+?=
 =?us-ascii?Q?SnfMScRG29bbCRdfsfGe6txSpe9VsvX3mtWjahKMESgXYNNp6+urVLpMUGSa?=
 =?us-ascii?Q?kO8C/zOr7g4QYDtiLduP3yEMZWdLT0quzRVPLXo6UzhZAV8pSwtdDqtVcgs1?=
 =?us-ascii?Q?hPxCmxi6PWDoxOQBJoafaO6g+lLpHBPzmWFpI7gQMQOqJlf16mlD/8HyhANE?=
 =?us-ascii?Q?Ev1WmlgF8y3mcsevzwVD9WY/u+33jrrlnLsgcwJ+Wp1P33UJQuboU+1T4a73?=
 =?us-ascii?Q?T6c9GFpDn9kE8rJ8E2CXZYMp5JsknvN16yVGNauf3oCxKzxTSUjdNC8BtMO1?=
 =?us-ascii?Q?+dm+pHMTcBFvRrRHcOlxMPd26oMFQGc3lNBTP05A47xV3TDyJSpNWwUp30r+?=
 =?us-ascii?Q?dfu82wCZ1RaP+5G2cBP/W/2vBA+MBLaZaqJoDeaM5WdKT+hkDKMOyZ7RatDW?=
 =?us-ascii?Q?Zqj+zEh0vrYX4sbq65cE855PigK55Ut5Aw4N/DY70KuFHgfJhp/TR3M0PKoh?=
 =?us-ascii?Q?DDsQJf5K+3xSHzFElfw/VAd4T/0fjXw7Z54FGaY3aK1T+iaNGvmIF+EJE0KH?=
 =?us-ascii?Q?7nuMsmcZJ+6Rk8tsc9S7RM4Tmb+jVm2lHo5OoltAqwuB0dnrcAYgOqmWA99J?=
 =?us-ascii?Q?n0ibJUwYq7ySf2xx56U16ePeGYXYm5VhgNVWGMyex4jWi28aB8kiNMZJjw9l?=
 =?us-ascii?Q?Nz+/izSdfEcZ+wg8dqcAdi3l/ztvU12qf64Es5tNwsJGCW3ts5DgMH2D/DbZ?=
 =?us-ascii?Q?Rf3VQx6f977mYllwYXugwkRLj5ayrfPexopjcKv7X2ycMmeYwBQej/gC7kIg?=
 =?us-ascii?Q?wb1A1RNjoLqlY9OWeaJthpT7/rdc+LQo4fkU2ULZ?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a547b9-5315-44a1-2f4b-08dbe4c091c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 03:19:53.3169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8POS3sPOpJfODZRR2RQxRtDSf4RYyqsZt0xCmXSUtWyT+iH/K7aSBNp4b8AT24wCKcnb5oAMfevLKNunCvEVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-OriginatorOrg: intel.com
Cc: Johannes Zink <j.zink@pengutronix.de>, "Henneberg,
 Jochen" <jh@henneberg-systemdesign.com>, Simon Horman <horms@kernel.org>,
 "Voon, Weifeng" <weifeng.voon@intel.com>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Russell
 King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Add support for
 HW-accelerated VLAN stripping
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

Hi Andrew,

Appreciate for all the given comment, will update the changes and send an V2.

To answer the question "Why making as opt-in per platform instead of enable
for all platforms", our intention is we don't want to affect the platform which are
currently using driver level stripping. But yes, since it is common IP driver, it is more
making sense to enable across platform while user can on or off according to
their needs. I will update this in V2 as well.

Also, I am submitting a number of patches recently but they are all independent.


Best Regards,
Gan Yi Fang

> -----Original Message-----
> From: Andrew Halaney <ahalaney@redhat.com>
> Sent: Friday, November 10, 2023 1:41 AM
> To: Gan, Yi Fang <yi.fang.gan@intel.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Russell King <linux@armlinux.org.uk>; Simon
> Horman <horms@kernel.org>; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>; Shenwei Wang <shenwei.wang@nxp.com>;
> Russell King <rmk+kernel@armlinux.org.uk>; Johannes Zink
> <j.zink@pengutronix.de>; Henneberg, Jochen <jh@henneberg-
> systemdesign.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Looi, Hong Aun <hong.aun.looi@intel.com>; Voon,
> Weifeng <weifeng.voon@intel.com>; Song, Yoong Siang
> <yoong.siang.song@intel.com>
> Subject: Re: [PATCH net-next 1/1] net: stmmac: Add support for HW-accelerated
> VLAN stripping
> 
> On Thu, Nov 09, 2023 at 01:38:31PM +0800, Gan Yi Fang wrote:
> > From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> >
> > Current implementation supports driver level VLAN tag stripping only.
> > The features is always on if CONFIG_VLAN_8021Q is enabled in kernel
> > config and is not user configurable.
> >
> > This patch add support to MAC level VLAN tag stripping and can be
> > configured through ethtool. If the rx-vlan-offload is off, the VLAN
> > tag will be stripped by driver. If the rx-vlan-offload is on, the VLAN
> > tag will be stripped by MAC.
> >
> > Command: ethtool -K enp0s30f4 rx-vlan-offload off | on
> >
> > Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
> > Signed-off-by: Lai Peter Jun Ann <jun.ann.lai@intel.com>
> 
> I'm confused by the SOB lines. Gan is the author and the last sender of the
> patch as far as I can tell in this email. Gan's SOB should be last.
> 
> Since Gan is also the author as far as I can tell, I am confused why Lai's Signed-
> off-by is present.
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-
> your-work-the-developer-s-certificate-of-origin
> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
> > .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  3 +-
> > .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 35
> +++++++++++++++++++
> >  .../ethernet/stmicro/stmmac/dwmac4_descs.c    | 13 +++++++
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    | 15 ++++++++
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-
> >  include/linux/stmmac.h                        |  1 +
> >  7 files changed, 90 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h
> > b/drivers/net/ethernet/stmicro/stmmac/common.h
> > index e3f650e88f82..6b935922054d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> > @@ -580,6 +580,7 @@ struct mac_device_info {
> >  	u32 vlan_filter[32];
> >  	bool vlan_fail_q_en;
> >  	u8 vlan_fail_q;
> > +	bool hw_vlan_en;
> >  };
> >
> >  struct stmmac_rx_routing {
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > index 60283543ffc8..651fee867aac 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > @@ -457,7 +457,8 @@ static int intel_mgbe_common_data(struct pci_dev
> *pdev,
> >  	plat->has_gmac = 0;
> >  	plat->has_gmac4 = 1;
> >  	plat->force_sf_dma_mode = 0;
> > -	plat->flags |= (STMMAC_FLAG_TSO_EN |
> STMMAC_FLAG_SPH_DISABLE);
> > +	plat->flags |= (STMMAC_FLAG_TSO_EN |
> STMMAC_FLAG_SPH_DISABLE |
> > +			STMMAC_FLAG_HW_VLAN_EN);
> >
> >  	/* Multiplying factor to the clk_eee_i clock time
> >  	 * period to make it closer to 100 ns. This value diff --git
> > a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > index c6ff1fa0e04d..6a8d7873b456 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > @@ -1134,6 +1134,35 @@ static int dwmac4_config_l4_filter(struct
> mac_device_info *hw, u32 filter_no,
> >  	return 0;
> >  }
> >
> > +static void dwmac4_rx_hw_vlan(struct mac_device_info *hw,
> > +			      struct dma_desc *rx_desc, struct sk_buff *skb) {
> > +	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
> > +		u16 vid = (u16)hw->desc->get_rx_vlan_tci(rx_desc);
> > +
> > +		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
> > +	}
> > +}
> > +
> > +static void dwmac4_set_hw_vlan_mode(struct mac_device_info *hw) {
> > +	void __iomem *ioaddr = hw->pcsr;
> > +	u32 value = readl(ioaddr + GMAC_VLAN_TAG);
> > +
> > +	value &= ~GMAC_VLAN_TAG_CTRL_EVLS_MASK;
> > +
> > +	if (hw->hw_vlan_en)
> > +		/* Always strip VLAN on Receive */
> > +		value |= GMAC_VLAN_TAG_STRIP_ALL;
> > +	else
> > +		/* Do not strip VLAN on Receive */
> > +		value |= GMAC_VLAN_TAG_STRIP_NONE;
> > +
> > +	/* Enable outer VLAN Tag in Rx DMA descriptor */
> > +	value |= GMAC_VLAN_TAG_CTRL_EVLRXS;
> > +	writel(value, ioaddr + GMAC_VLAN_TAG); }
> > +
> >  const struct stmmac_ops dwmac4_ops = {
> >  	.core_init = dwmac4_core_init,
> >  	.phylink_get_caps = dwmac4_phylink_get_caps, @@ -1175,6 +1204,8
> @@
> > const struct stmmac_ops dwmac4_ops = {
> >  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
> >  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
> >  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> > +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> > +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
> >  };
> >
> >  const struct stmmac_ops dwmac410_ops = { @@ -1224,6 +1255,8 @@ const
> > struct stmmac_ops dwmac410_ops = {
> >  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
> >  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
> >  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> > +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> > +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
> >  };
> >
> >  const struct stmmac_ops dwmac510_ops = { @@ -1277,6 +1310,8 @@ const
> > struct stmmac_ops dwmac510_ops = {
> >  	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
> >  	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
> >  	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
> > +	.rx_hw_vlan = dwmac4_rx_hw_vlan,
> > +	.set_hw_vlan_mode = dwmac4_set_hw_vlan_mode,
> >  };
> >
> >  static u32 dwmac4_get_num_vlan(void __iomem *ioaddr) diff --git
> > a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > index 89a14084c611..a01d71dfed6c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > @@ -198,6 +198,17 @@ static int dwmac4_get_tx_ls(struct dma_desc *p)
> >  		>> TDES3_LAST_DESCRIPTOR_SHIFT;
> >  }
> >
> > +static inline int dwmac4_wrback_get_rx_vlan_tci(struct dma_desc *p) {
> > +	return (le32_to_cpu(p->des0) & RDES0_VLAN_TAG_MASK); }
> > +
> > +static inline bool dwmac4_wrback_get_rx_vlan_valid(struct dma_desc
> > +*p) {
> > +	return ((le32_to_cpu(p->des3) & RDES3_LAST_DESCRIPTOR) &&
> > +		(le32_to_cpu(p->des3) & RDES3_RDES0_VALID)); }
> > +
> >  static int dwmac4_wrback_get_rx_frame_len(struct dma_desc *p, int
> > rx_coe)  {
> >  	return (le32_to_cpu(p->des3) & RDES3_PACKET_SIZE_MASK); @@ -
> 551,6
> > +562,8 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
> >  	.set_tx_owner = dwmac4_set_tx_owner,
> >  	.set_rx_owner = dwmac4_set_rx_owner,
> >  	.get_tx_ls = dwmac4_get_tx_ls,
> > +	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
> > +	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
> >  	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
> >  	.enable_tx_timestamp = dwmac4_rd_enable_tx_timestamp,
> >  	.get_tx_timestamp_status =
> dwmac4_wrback_get_tx_timestamp_status,
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > index b95d3e137813..5a079dae1380 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -56,6 +56,10 @@ struct stmmac_desc_ops {
> >  	void (*set_tx_ic)(struct dma_desc *p);
> >  	/* Last tx segment reports the transmit status */
> >  	int (*get_tx_ls)(struct dma_desc *p);
> > +	/* Get the tag of the descriptor */
> > +	int (*get_rx_vlan_tci)(struct dma_desc *p);
> > +	/* Get the valid status of descriptor */
> > +	bool (*get_rx_vlan_valid)(struct dma_desc *p);
> >  	/* Return the transmit status looking at the TDES1 */
> >  	int (*tx_status)(struct stmmac_extra_stats *x,
> >  			 struct dma_desc *p, void __iomem *ioaddr); @@ -
> 117,6 +121,10 @@
> > struct stmmac_desc_ops {
> >  	stmmac_do_void_callback(__priv, desc, set_tx_ic, __args)  #define
> > stmmac_get_tx_ls(__priv, __args...) \
> >  	stmmac_do_callback(__priv, desc, get_tx_ls, __args)
> > +#define stmmac_get_rx_vlan_tci(__priv, __args...) \
> > +	stmmac_do_callback(__priv, desc, get_rx_vlan_tci, __args) #define
> > +stmmac_get_rx_vlan_valid(__priv, __args...) \
> > +	stmmac_do_callback(__priv, desc, get_rx_vlan_valid, __args)
> >  #define stmmac_tx_status(__priv, __args...) \
> >  	stmmac_do_callback(__priv, desc, tx_status, __args)  #define
> > stmmac_get_tx_len(__priv, __args...) \ @@ -388,6 +396,9 @@ struct
> > stmmac_ops {
> >  	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
> >  				 __le16 perfect_match, bool is_double);
> >  	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
> > +	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc
> *rx_desc,
> > +			   struct sk_buff *skb);
> > +	void (*set_hw_vlan_mode)(struct mac_device_info *hw);
> >  	int (*add_hw_vlan_rx_fltr)(struct net_device *dev,
> >  				   struct mac_device_info *hw,
> >  				   __be16 proto, u16 vid);
> > @@ -497,6 +508,10 @@ struct stmmac_ops {
> >  	stmmac_do_void_callback(__priv, mac, update_vlan_hash, __args)
> > #define stmmac_enable_vlan(__priv, __args...) \
> >  	stmmac_do_void_callback(__priv, mac, enable_vlan, __args)
> > +#define stmmac_rx_hw_vlan(__priv, __args...) \
> > +	stmmac_do_void_callback(__priv, mac, rx_hw_vlan, __args) #define
> > +stmmac_set_hw_vlan_mode(__priv, __args...) \
> > +	stmmac_do_void_callback(__priv, mac, set_hw_vlan_mode, __args)
> >  #define stmmac_add_hw_vlan_rx_fltr(__priv, __args...) \
> >  	stmmac_do_callback(__priv, mac, add_hw_vlan_rx_fltr, __args)
> > #define stmmac_del_hw_vlan_rx_fltr(__priv, __args...) \ diff --git
> > a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 3e50fd53a617..62299ec5179f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3469,6 +3469,9 @@ static int stmmac_hw_setup(struct net_device
> *dev, bool ptp_register)
> >  	/* Start the ball rolling... */
> >  	stmmac_start_all_dma(priv);
> >
> > +	if (priv->hw->hw_vlan_en)
> > +		stmmac_set_hw_vlan_mode(priv, priv->hw);
> > +
> >  	if (priv->dma_cap.fpesel) {
> >  		stmmac_fpe_start_wq(priv);
> >
> > @@ -5508,7 +5511,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int
> limit, u32 queue)
> >  		/* Got entire packet into SKB. Finish it. */
> >
> >  		stmmac_get_rx_hwtstamp(priv, p, np, skb);
> > -		stmmac_rx_vlan(priv->dev, skb);
> > +
> > +		if (priv->hw->hw_vlan_en)
> > +			/* MAC level stripping. */
> > +			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> > +		else
> > +			/* Driver level stripping. */
> > +			stmmac_rx_vlan(priv->dev, skb);
> > +
> 
> This same pattern exists in stmmac_dispatch_skb_zc, does it make sense to
> update that as well?
> 
> >  		skb->protocol = eth_type_trans(skb, priv->dev);
> >
> >  		if (unlikely(!coe))
> > @@ -5817,6 +5827,14 @@ static int stmmac_set_features(struct net_device
> *netdev,
> >  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
> >  	}
> >
> > +	if ((features & NETIF_F_HW_VLAN_CTAG_RX) &&
> > +	    (priv->plat->flags & STMMAC_FLAG_HW_VLAN_EN))
> > +		priv->hw->hw_vlan_en = true;
> > +	else
> > +		priv->hw->hw_vlan_en = false;
> > +
> > +	stmmac_set_hw_vlan_mode(priv, priv->hw);
> > +
> >  	return 0;
> >  }
> >
> > @@ -7146,6 +7164,8 @@ static int stmmac_hw_init(struct stmmac_priv
> *priv)
> >  			 "Enable RX Mitigation via HW Watchdog Timer\n");
> >  	}
> >
> > +	priv->hw->hw_vlan_en = (priv->plat->flags &
> STMMAC_FLAG_HW_VLAN_EN);
> 
> I'm curious, is there a particular reason you make this feature a platform opt-
> in? My gut feeling is that if it's a dwmac4/5 feature, it would be better to just
> enable it for all the platforms who use that IP instead of making it opt-in per
> platform. To me that is more in the spirit of a common IP driver.
> 
> > +
> >  	return 0;
> >  }
> >
> > @@ -7515,6 +7535,8 @@ int stmmac_dvr_probe(struct device *device,
> > #ifdef STMMAC_VLAN_TAG_USED
> >  	/* Both mac100 and gmac support receive VLAN tag detection */
> >  	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX |
> NETIF_F_HW_VLAN_STAG_RX;
> > +	ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
> > +
> >  	if (priv->dma_cap.vlhash) {
> >  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> >  		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER; diff --git
> > a/include/linux/stmmac.h b/include/linux/stmmac.h index
> > 0b4658a7eceb..1cf78e6bca5e 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -220,6 +220,7 @@ struct dwmac4_addrs {
> >  #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> >  #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
> >  #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(12)
> > +#define STMMAC_FLAG_HW_VLAN_EN			BIT(13)
> >
> >  struct plat_stmmacenet_data {
> >  	int bus_id;
> > --
> > 2.34.1
> >
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
