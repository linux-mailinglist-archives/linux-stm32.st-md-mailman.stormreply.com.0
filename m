Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4A3B5A04
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 09:48:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D632AC57B53;
	Mon, 28 Jun 2021 07:48:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F104C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 07:48:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="207723423"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="207723423"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 00:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="475471580"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2021 00:48:53 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 28 Jun 2021 00:48:53 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 28 Jun 2021 00:48:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 28 Jun 2021 00:48:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 28 Jun 2021 00:48:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxZnfveujkkVn+ExtwUjkTkVfA7HEsv6ILo6PeyxGVghBynFuNNyIUISQIg/uAAaymOc2XCX4dlVY9qnggeyH3dllUFaKOBkJmVx0ryH530TVywBammBX7fpM430z7Jr1PPyXzbkeQY99n5zupes5mV44f4W0EDUWnJP3CV36QgMCpyOOS9Rz+fuTVgj2xIZrCDHklRR6VwJgTqiULYm5MDkaY2EH9GqzCkd7c2QwNXTyrDiwUNWOX+uXDfZG6Oe0QnyxryBd8VypcrVh0z+IozOs9u3S8s8YOFR5lIZJGIKuIZkH9aNuSymS8jDZZDG3MZjoXBZpIlQDq39CTVQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CsKS6iGiJLURmrEMdZMxibf/eu//yRdtXt8MMlPOjg=;
 b=LcONCtlRLTTDu4t+q5lbYJMaIiflu4woh76e9101Ebtb503ryLjK2C2jGecJm6SGgeNOZyCai0ZkS7IGiK8COCmQM1PZXx7ROoR6j9KuGakj6+sGsbqH/uzsZ7yaYWYsdjbnzJBSup1GtsBPEpvxSqDi/VnBuO+ffnmATTpXfgonoADztwEy0WXvB2SgnG/sf6AdjBn44EhZKpjOLQ8GdNI7XLeUtBVN03fe1g94xRLYmSgf3N5dv9zCQvyxJBBFzFZnB92PdbvuI2XDKmlsZNA1iy9KwpmWgW22G0SgI7eWPi7wyeqBhjQVyI4xZC8mH4umftjHCLBr0xa2ZXCTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CsKS6iGiJLURmrEMdZMxibf/eu//yRdtXt8MMlPOjg=;
 b=K2K4i7Wj66l3gB0y0ANJ7W5R49nSD4nEx5S0dp/UNI0Jmm4gq98TKHBxyzBw8C5o3Epak53zTheIvbGKr/BvryrTfK43bzaT/klJvamEVoWV+aLJjZT7KaQsjT9JqAywJQwfLy69hoYWcOSFyHn6wOSCyXyD7pRw7wzilRKGZGk=
Received: from CH0PR11MB5380.namprd11.prod.outlook.com (2603:10b6:610:bb::5)
 by CH0PR11MB5458.namprd11.prod.outlook.com (2603:10b6:610:d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 07:48:49 +0000
Received: from CH0PR11MB5380.namprd11.prod.outlook.com
 ([fe80::d52:3043:fef4:ebcd]) by CH0PR11MB5380.namprd11.prod.outlook.com
 ([fe80::d52:3043:fef4:ebcd%4]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 07:48:49 +0000
From: "Voon, Weifeng" <weifeng.voon@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next V1 3/4] net: stmmac: Reconfigure the PHY WOL
 settings in stmmac_resume()
Thread-Index: AQHXZoJFBtZ0uXgSn0S7qboFjm+Joqseb0UAgALh+bCAAK/dgIAA5rbAgABIGwCAAagL0IAAG12AgAQcoAA=
Date: Mon, 28 Jun 2021 07:48:49 +0000
Message-ID: <CH0PR11MB53801A190BCEE45428039AC988039@CH0PR11MB5380.namprd11.prod.outlook.com>
References: <20210621094536.387442-1-pei.lee.ling@intel.com>
 <20210621094536.387442-4-pei.lee.ling@intel.com> <YNCOqGCDgSOy/yTP@lunn.ch>
 <CH0PR11MB53806E2DC74B2B9BE8F84D7088089@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YNONPZAfmdyBMoL5@lunn.ch>
 <CH0PR11MB538084AFEA548F4B453C624F88079@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YNSLQpNsNhLkK8an@lunn.ch>
 <CH0PR11MB53806D16AF301F16A298C70C88069@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YNYF7XCyCIuwT0mT@lunn.ch>
In-Reply-To: <YNYF7XCyCIuwT0mT@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [161.142.208.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b2f2049-ddcc-417c-8921-08d93a092af1
x-ms-traffictypediagnostic: CH0PR11MB5458:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH0PR11MB5458486F76FE6F953410F3AD88039@CH0PR11MB5458.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: utYPd97Npu/ka4AlvUcLoiytY1owEvurCx/tQuVSjck9+S6Fz6UjyR+2b7cuPluTNkAnD0WtBw5cBpmG/0ImBSzd8b/DDMUcfuHqWiqx+7JX2pGFNw2Zl/diXVFxCJrh4R+WGdRZGJE04IGdKxyHY+u7hMSNySE1fmy7hL+VYB08+/2G6A7IXt7GRzX3DreCE7KxHx9dyHv9jWPAfOtGYCtnEQxmHW4njGGl94zXV4QWZGTXKRhqv9DwycSFRC5WYKCxvMV5wHrulFYB0qP4Jfvs6b4pT6103eaalnCbAccctKai6sopr/FbET4Jdx582DkwF4wCRLzms3b+Y76GeiiN4GQz8dts56gBC+2nuokPKE57D+/leqxdtNh7aSqZ5bfWoTT9dRjtjmZW9Ns1UdvPuFr69NZO5V8t8cHrYbO+bryyEFQx0ePxpSHNOw+KRq0fxorR8nyV2OjTZP7JTW9c5Z3k8oXTQx4AIZnk+OayfB0SQd2nKVymN5/52drmyajUhYV4dVNcDr8yo85E/d1MBQao2mn4ihXnEJ2Dr96CfEyYX7c0nqNmXN++vYFbswICdWn5MJAHjcqvkZZwAaDkDeAIujQxRQFKgRX1prU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5380.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(366004)(376002)(136003)(71200400001)(7416002)(8936002)(54906003)(2906002)(122000001)(478600001)(4326008)(38100700002)(6916009)(8676002)(316002)(52536014)(186003)(9686003)(55016002)(26005)(5660300002)(33656002)(83380400001)(66946007)(86362001)(66476007)(66556008)(64756008)(66446008)(7696005)(6506007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tYFFzZqocrAaHkXnGW3xFNHsI+xX6xItCJyFgOeEtlzCi4UgGQIkuFd9XQeR?=
 =?us-ascii?Q?g2raEOdbvPfBFN4+lc2FSQTMWADw8swnQzM2w9gfcaDSTzwGAkGzBrkdN7U+?=
 =?us-ascii?Q?30iUN19lVVUcw2eUYA+TL6bRf93ytoP8x/MnVAIlJAnqBtvWzNAtSuNQSXcR?=
 =?us-ascii?Q?R04+aHEts7eE+NWYmMaeKARRAc8Ir4CM8cPjqp9riLUSE9jIrVxq5gVA7b1u?=
 =?us-ascii?Q?F5nlcbW7MswBKNsjaDK6OSJ74StmGQxgLGIsg0yRkGY7mdXKDQbFEGtyQwCe?=
 =?us-ascii?Q?Wj9jvYtUH/vh9Kym49wM7Ui8dWtOFsN8+Iegl8E8Ls8gNTXxNO9SWn0IaVQe?=
 =?us-ascii?Q?Xoug+v+WtlSUUcTFAcM8/x5N30AZpU8x3jrttTMIzeYromULowB4pA+cEZJJ?=
 =?us-ascii?Q?lzKRCJPiyi3XzfrYXW0sGvbLRToeHNiXbCaPbebVSgc9T9V9yyJcvv7EGTgP?=
 =?us-ascii?Q?0trQtxHr2fmGAQSf+mAAAr4hZPXETBSO45pbGi246d99aLAUn68wK1/qyjCF?=
 =?us-ascii?Q?QlBQOTiV4asRc4D3OgG7akSnkR54WDMMOVu8sJhtJeJsTUIvwvx2Y2V64tUu?=
 =?us-ascii?Q?rjsj4G7ybJqVGCRxWG/WzCLlWPtE6El95AE1bocOCDc5iJ8wZRT2LQlB7skx?=
 =?us-ascii?Q?r/qIwtQbwU0SgiCxbLr+PAZ+Z6PBpr3Dj1IyXmvRYsiTJ/dfb44YjJREsCQx?=
 =?us-ascii?Q?PkKZMv9uMob4foo3sq48hhpBdeoGf98LnJbDTlLhKcNd6Qt5SsBaa5DmV8g0?=
 =?us-ascii?Q?Xqa4eLw3Kwj7EB6ZhoGFyfnqm+a0Fomypagt0Sg5kvkcdTvGSA4VEc5uvDCe?=
 =?us-ascii?Q?vc3Wd205xIqJd/EyxsysnIleuy+GJNDaFehDrvb5XnQbDhfP00Ue7+ciinpW?=
 =?us-ascii?Q?mZbirqnezNsFSKZvX5CT1PcP13HagNd7geS2t3f37tKNGP6T/ExupugUgMaG?=
 =?us-ascii?Q?BO9zK3idSDQCf28VzB+4zpBGGxBQtqF86QUTJSgDNAC+c4yFPOT9rHpNgMxS?=
 =?us-ascii?Q?7Xjtcgw+iCUmjzJ5GGoMsNzNr+dk4EctNmoB4zqacbzktmx0uQtB4KZYte2h?=
 =?us-ascii?Q?kBgOV/yl5G7b7qW5fQuEZMrI24GFONs48OujZNq0suiY/rzEhGd7O6utccVO?=
 =?us-ascii?Q?OltZznkK9LdJcJUI6LQIzAt7S+QuykdgdVjp/WlR8TUO9LLxAuwBbxIGt0KQ?=
 =?us-ascii?Q?TL0o5Rl7P+gVqx0SMcC/NctQyhHN9BeZvRmifU7BX/7tMj59I8x/1MUoFssU?=
 =?us-ascii?Q?JBtDNYFemLK+aSH+Ojz3JzmJ1NT52Dp/yIOdouQWx44v77ZLFv1JIWxaQ0Lx?=
 =?us-ascii?Q?6iLMP1JAgyEMtAbBi3carcOW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2f2049-ddcc-417c-8921-08d93a092af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 07:48:49.8010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdustVh3cGU+gBQ1noGuvFLRP9LzBIIvMUW6xPsB3gcEC77rG0koVYlAgWur0B7RJ6BnLNOJpNeUnDvWYt9fgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5458
X-OriginatorOrg: intel.com
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>, "Ling, Pei Lee" <pei.lee.ling@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Ong, Boon
 Leong" <boon.leong.ong@intel.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next V1 3/4] net: stmmac: Reconfigure
 the PHY WOL settings in stmmac_resume()
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

> > I would like to rephase the commit message to make things clear:
> >
> > After PHY received a magic packet, the PHY WOL event will be
> > triggered. At the same time, the "Magic Packet Match Detected" bit is
> > set. In order for the PHY WOL event to be triggered again, the WOL
> > event status of "Magic Packet Match Detected" bit needs to be cleared.
> > When the PHY is in polling mode, the WOL event status needs to be
> > manually cleared.
> >
> > Ethtool settings will remain with WOL enabled after a S3/S4 suspend
> > resume cycle as expected. Hence, the driver should reconfigure the PHY
> > settings to reenable/disable WOL depending on the ethtool WOL settings
> > in the MAC resume flow.
> > The PHY set_wol flow would clear the WOL event status.
> 
> I would still argue that making use of a WoL interrupts and PHY polling is
> just wrong. But i assume you cannot fix this? You have a hardware design
> error?
> 
> The problem with this solution is you need to modify every MAC driver using
> the Marvell PHY. It does not scale.
> 
> Please try to find a solution within phylib or the marvell driver.
> Something which will work for any broken setup which is using WoL
> interrupts combined with polling.

Yes, I would not able to fix this as the PHY WOL event signal pin is connected
directly to the PMC. And, I do not have the info why the HW is designed in
this way. 

But, I totally agreed that this solution is not scalable. We will drop this
patch from this patchset for v2. We will find another solution and most
probably in phylib as this behavior most likely will be similar across all
other PHYs.

Weifeng
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
