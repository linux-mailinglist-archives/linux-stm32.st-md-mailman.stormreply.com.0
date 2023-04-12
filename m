Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5AF6DEC2C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 08:59:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4DD9C65E4F;
	Wed, 12 Apr 2023 06:59:33 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C401C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681282772; x=1712818772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vx2zykhVdwWojTU7iqdTJmR23GpiZW2JE/nX9SCH4QE=;
 b=HqltXu8kIjTMdxCtrndlmfD3qJGHf8fyz9X5vHWbd10xasCl2SHdwi/B
 idyhhp8sy7K/y+yPfAeATPOaSi36RaDEcuKo2iTW+FMa5KM5pqlAZ/Yka
 DNdGbwZNRqZRFsRs/ZDyoTfD77n2kjtPa7FwkSI0G0qBwNRZNaJoflMrl
 gwUv1DRJHsW6yKP7VZCKYt9Z95UWnMRyjF4Lfo/ArqUI2/y6+2zE7ylqm
 TDs8keqMElsPv6UKupqdBeZgJ/JDRBNcuTMuUSyZcgXDhR+VpQhWgkIZw
 0OpCzxFlODyoYmTziHr79b2icR2a6ApZTZHUMQR2BXuk6a6NmKNdBopcu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341310906"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="341310906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 23:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778207510"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="778207510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2023 23:58:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 23:58:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 23:58:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 23:58:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 23:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/Dbp9jramlnEbL/9JqVLErnNOb+esB0ASOFiEKE/r7kjqZfbkjo3QMakm7LAvdnPs2/bVyuWAVkyMERRH8n1dtGbXVKDpB7nKBQwFE2OXznuqXo9/DaPmYT9HGgWXd+VPBRmZrUPE+TgqwFIuMRVfLlCQ6XY1qyD2LRfcEuQx0tmxh9wPzlKGvcNN4bz82lorY2RtlPe1g/xrCz3TCmTvaBZ32ZVSOLCoCXbvWUW2/oXwtJeY4x1YTjsLJ9aSY99meag9AlqFimwHtpCYPALyc2BeWhZIoRBrDXshFnOkYpt8IkzTM/+Ai+QOj3gD7zcqz173F/Jf2BC9HpFTeW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmmOoSRxhuBf3GeBJLZPhG1mT/jbhJtk2doUp+AYZFE=;
 b=a07Jugex4hZeq9psLsttD2F5n3durRXSPjHdFrereBMp7L69nG10y3/EA0+APyVxDi34k91kQE3QMOrkJ0OqJ+CyLse8zmZu38AeX+OsiICQr5EvwP84LE0QPUzOKsgOe/wkmLhC0u7GoZF4wW9NH6+0ymscXfg+V98578NulAy379r/3iFmrUD+Mg5KRy0ac0WlhnxNKOQZF6bACEYEULwzGtrxSLrurxU/sSFhfIGzVcnSXjLxIo+1mCDtyi5+pSStoWxXL9BGcJ23BoW6R4QIbUModQR0hDKfTq83TtBeUNEtzVw5R9c3wHKfIr2+j56SKWl//pMv10UuUhIwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 06:58:17 +0000
Received: from PH0PR11MB7587.namprd11.prod.outlook.com
 ([fe80::7237:e32c:559e:55e2]) by PH0PR11MB7587.namprd11.prod.outlook.com
 ([fe80::7237:e32c:559e:55e2%4]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 06:58:16 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Thread-Topic: [PATCH net v5 1/3] net: phylink: add phylink_expects_phy() method
Thread-Index: AQHZbQm97fiPNDxqkEOZqI8+LbFDRq8nPHmg
Date: Wed, 12 Apr 2023 06:58:15 +0000
Message-ID: <PH0PR11MB758766370DD16A5107B1FAB69D9B9@PH0PR11MB7587.namprd11.prod.outlook.com>
References: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
 <20230330091404.3293431-2-michael.wei.hong.sit@intel.com>
 <20230412103812.45e52ab5@pc-288.home>
In-Reply-To: <20230412103812.45e52ab5@pc-288.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7587:EE_|SJ2PR11MB8299:EE_
x-ms-office365-filtering-correlation-id: b5b9bbd5-60e4-4fb1-c490-08db3b234a4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2MUSaE7EC5zEMPCjZY1jWhjExfFet5bIiDmxvfFfFJ3PsIpfawTfkl/V2WjbnuyB5hmH9B9odxf9y/O600BsZD0RlbhgmxfI+XhOwxN7AvOu7kGE9ZQuDFKaNAgvTNgKtDoHK3ThfHK/3Z++POvrJ+SqTYHOZ/7j+1gGXFf8HvdPdjB19xTPMOT5VttUuhsX3YP9U+X+ukw8p8r1Bn1/QD1BoEZrhMh6XOwjm4V3idlAPKrDcKDQxYRYDox9rtH1/Mp373kvYtwKKuxUyaN10uPe0z2m4na2iUHWLfIDohd8nXDg8750+zS558u94WRn0PTjg6ph7kPFh6U0VDXtF7vrfelQCq9KB4MynPQyldAD4JsIx5ivwzk3PA/cWNYBWRQr6oY6wNTZ4DZeL1CQCwPrd23JxwZBUnPcttdhdAv+9Sa7DmtqamaZYqVGZLwPAzby38xzB8v9n86zS7E5m1XzzB4k9nlsi3JJMuQWZzwf2GG4XHD4+YnQkemRZjRq/d9s8u5N/vks/zNJHkzkQbALsJKsRE88HcooKvQStFwJoJs7iGzxhOn7YDZb17+CgoO9qweXoGSLMS095NflqF2arUqzLwdlozA6UtC8jDc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7587.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(71200400001)(478600001)(7696005)(86362001)(83380400001)(33656002)(55016003)(82960400001)(122000001)(38070700005)(38100700002)(966005)(2906002)(26005)(316002)(53546011)(6506007)(54906003)(9686003)(186003)(5660300002)(64756008)(7416002)(66476007)(6916009)(66556008)(8936002)(52536014)(41300700001)(8676002)(4326008)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eWeUsCyLJNhRudN8vE0HxJBqFttfbgbcp0lyPCqqy2XtA/ikfa6gKPHzWS66?=
 =?us-ascii?Q?6RqPiFq64e95nzpXPhurEE+T6b3b/4SauzgXXzqko5k6M9A8i0Ty/nXn7YB1?=
 =?us-ascii?Q?SoEeAiZD/NF9NkcfRPwu2IKxdlaE/jLTMzc4tkEL4BoqBsor+/0vIiJgVQCq?=
 =?us-ascii?Q?frjMzXygwHBlfHdcIkbFz3OrcrUTkszg36X1/g6VuPYJB9WxdlsnvEKF7JdS?=
 =?us-ascii?Q?IEt3SrMIDDU2aNrdkfk68MHOOxE1u0yAR1RRsqMMfshPcWtvEn3cXQb/8zBP?=
 =?us-ascii?Q?RgmTJk84UF5N+T9HzIyF6/INFcv96B01nZ6wMBmKAjeW/+SkPEq1YHCBYPKL?=
 =?us-ascii?Q?uJdAXfW28Em3nobQAeP049trpffQF001V0CgLHOCZKqUuSoPozBrNe9OGi79?=
 =?us-ascii?Q?iG/7J5w7xudcKiDXzRkvu3RX8d9/AxTiYSqzzbdeQZo8KUeQeNKXQ2goxniz?=
 =?us-ascii?Q?oJv4jkCxF9bmjDVBh9AaIgpTLHCGShKu2bIUx9jjhufRa8+HA3ZNCAAW1jlc?=
 =?us-ascii?Q?42w0YeZvP0/o8m5yDzGqq1IP75Hdzoc3MuFYW+EZDAl/f3DshWX4hm0yJH0A?=
 =?us-ascii?Q?7sF+0NcpEwqEJI+qNKXirVPhr0LflHawQr3Fv9onYZCuJskw+nXQaR4YBp59?=
 =?us-ascii?Q?KyJWSV71rzG4ZGQPWm8viJZszdZFaRzryo1OFfdCef0SxMV7BVlM6CLXK0rP?=
 =?us-ascii?Q?ocmKwmdMBNJBJ+/M9Pc5Tc0eHuMeD3/UtmKUZ0J/iBCxf4Lnh4U0K4P2NHM1?=
 =?us-ascii?Q?Ph5ZzVppDhLKMq50PX4tikNPArYpAP91OKx04oTPyjYUnTvtR8DTNxyLlGJi?=
 =?us-ascii?Q?KXwlqEDRVPP0+1RJIk6NWrxAbH4tBTOjai884z4O/9xUov+I99DlVCuFbX8m?=
 =?us-ascii?Q?znzlD2Zrkzc4aYwXeAHAHn1O3/2f9aOaZ1CCnowwiqmVKlrRFVKOye2zp8cX?=
 =?us-ascii?Q?uD5D5F4wMSCSMVaZBMNiO5RciAn3oJqvGj80dr4cymeaU3D3s06lLlvUl67i?=
 =?us-ascii?Q?hyaVkfyRGXcNFHss3GA/+xFkYpjrdLQfQxyB3dscc8otJ/5CvU7FOTBRruPg?=
 =?us-ascii?Q?nIr7zu6NTSUdiJ8lPJCvz9zyDb80KeBSoAExxZu3t7KrvWcTnFDPdbJ5p0Gy?=
 =?us-ascii?Q?K3au7hglVMduObPed3GzHTk8LQHZkx+mT0M4t7ku09M6ffFNN8wcA78R94t0?=
 =?us-ascii?Q?mi2PUkDGfvVc1yEYiagA2jfoMBBquhxV9L4JBISe+u0cREZKsuYbZ/3C3fAd?=
 =?us-ascii?Q?j6fL81edGoSRLlYN1t4rR7PaIh/K0Hq4cJyjXeAq2KaEcDgHcHt9RtX60jDp?=
 =?us-ascii?Q?JvAjvhho/wnZ5sc3WW6IndI+N8ZXQiPnpP/LqlNuV4cMUEJN+Yb3y4BMzDuz?=
 =?us-ascii?Q?LGDy3F6KgIzBwSOBqFv2wzoqAnZfOg2rYwkMVJdaS/xzVe6WbBKNawE9XhmK?=
 =?us-ascii?Q?5qEj+xLkP5u8PDRPCLtg7oeUQ8WCM/npN/vBNMwdLr1uws3PqKu7azB5e01W?=
 =?us-ascii?Q?285w7pz/76CBAlA06ox6rN3G6BqcYOZCild+G94PF1eOk2TRTVVppKILQ1NJ?=
 =?us-ascii?Q?f8S/KbCHbL/yiya7YrHTXqA/SYUirojHr2EEoglx79hJYEMYS6ZsLFQGFEom?=
 =?us-ascii?Q?UQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b9bbd5-60e4-4fb1-c490-08db3b234a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 06:58:15.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLs6iPxInlSZCSTl1eBOJPnTkGhWYggEddjkt8n3fIlpiB9nVTbHpHzM6Gvna3bNaV1Sj8ZIAcyIRLlzFawA0+DI3qnX5v8UuoEldirzYE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
X-OriginatorOrg: intel.com
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Lai, 
 Peter Jun Ann" <peter.jun.ann.lai@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "alexis.lothore@bootlin.com" <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v5 1/3] net: phylink: add
	phylink_expects_phy() method
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
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Sent: Wednesday, April 12, 2023 4:38 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre
> Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>;
> Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; Ong, Boon Leong
> <boon.leong.ong@intel.com>; netdev@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> linux@armlinux.org.uk; hkallweit1@gmail.com; andrew@lunn.ch;
> Looi, Hong Aun <hong.aun.looi@intel.com>; Voon, Weifeng
> <weifeng.voon@intel.com>; Lai, Peter Jun Ann
> <peter.jun.ann.lai@intel.com>; alexis.lothore@bootlin.com
> Subject: Re: [PATCH net v5 1/3] net: phylink: add
> phylink_expects_phy() method
> 
> Hello everyone,
> 
> On Thu, 30 Mar 2023 17:14:02 +0800
> Michael Sit Wei Hong <michael.wei.hong.sit@intel.com> wrote:
> 
> > Provide phylink_expects_phy() to allow MAC drivers to check if it is
> > expecting a PHY to attach to. Since fixed-linked setups do not need
> to
> > attach to a PHY.
> >
> > Provides a boolean value as to if the MAC should expect a PHY.
> > Returns true if a PHY is expected.
> 
> I'm currently working on the TSE rework for dwmac_socfpga, and I
> noticed one regression since this patch, when using an SFP, see
> details below :
> 
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Michael Sit Wei Hong
> <michael.wei.hong.sit@intel.com>
> > ---
> >  drivers/net/phy/phylink.c | 19 +++++++++++++++++++
> >  include/linux/phylink.h   |  1 +
> >  2 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 1a2f074685fa..30c166b33468 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -1586,6 +1586,25 @@ void phylink_destroy(struct phylink
> *pl)  }
> > EXPORT_SYMBOL_GPL(phylink_destroy);
> >
> > +/**
> > + * phylink_expects_phy() - Determine if phylink expects a phy to
> be
> > attached
> > + * @pl: a pointer to a &struct phylink returned from
> phylink_create()
> > + *
> > + * When using fixed-link mode, or in-band mode with 1000base-X
> or
> > 2500base-X,
> > + * no PHY is needed.
> > + *
> > + * Returns true if phylink will be expecting a PHY.
> > + */
> > +bool phylink_expects_phy(struct phylink *pl) {
> > +	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
> > +	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> > +	     phy_interface_mode_is_8023z(pl->link_config.interface)))
> 
> From the discussion, at one point Russell mentionned [1] :
> "If there's a sfp bus, then we don't expect a PHY from the MAC
> driver (as there can only be one PHY attached), and as
> phylink_expects_phy() is for the MAC driver to use, we should be
> returning false if
> pl->sfp_bus != NULL."
> 
> This makes sense and indeed adding the relevant check solves the
> issue.
> 
> Am I correct in assuming this was an unintentional omission from
> this patch, or was the pl->sfp_bus check dropped on purpose ?
> 
> > +		return false;
> > +	return true;
> > +}
> > +EXPORT_SYMBOL_GPL(phylink_expects_phy);
> 
> Thanks,
> 
> Maxime
> 

Russell also did mention:
" The reason for the extra "&& !pl->sfp_bus" in phylink_attach_phy()
is to allow SFPs to connect to the MAC using inband mode with
1000base-X and 2500base-X interface modes. These are not for the
MAC-side of things though."

So I thought that the check can be dropped. I do not have any SFP hardware
to test, if adding the check make sense, you can send us a patch so we can
test it out.
> [1] :
> https://lore.kernel.org/netdev/ZCQJWcdfmualIjvX@shell.armlinux.o
> rg.uk/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
