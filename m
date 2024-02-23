Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B8860B0A
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 07:59:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58C25C69063;
	Fri, 23 Feb 2024 06:59:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D36DC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708671547; x=1740207547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S8K7E5yjxuvvTISxTHbHgufa6hsyVOKJxVQDpyRsKJc=;
 b=lYpkS+wSbciZvBCHktGDhvb1evKcJAKsql0vz10E//PThiwHZWSXFbv9
 Vhe2AtGEJALdjAVHEPoZ9QEUDYDMJ61iQr3P3/8fgST9lJoGYMZimoaKs
 1FZXdguKDmXL8qLwbPWNs52tgk2yFKUuXpFeeOfgj0zhiUeAXR70DefSR
 CllcMKxTDtGLI/q8F8PxG2VrFrzhVHqw31SfS5nY8KWXQvm5llzweEp2+
 1bexj001aJiTnkeS0oe+u2F2WUy3f4pkEeOhfajLsHIPQHJ/vk9d/nw08
 /hg6EU5rX1Y0l9nyw7zZEO6u8XF3hRhAYXUjAFcpIciIxRxD+68eKLdWw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13668881"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13668881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 22:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10392652"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 22:59:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 22:59:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 22:59:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 22:59:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 22:59:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMD567a0Rlatz2uBNoW9VE/P9lTXdS6rrWKnYZdC823AZw2NqvEKzi4hk5RZ1BCSlGR5G1ySVRMNvu5CGAnNPy7r0S4RJvfj40IqsqSRiQ5PJjqhZA5u/QbQYsIRGV+CsRTvRYbUKSGJo7w7vPiKf+BJW4VVhayKB3hWdTRLGj9bMVALIvS9+qDvIAWDjPfQBoz0YBCKfrWz0T6kIJCh8eJm/TwfanYDT6Ugzyh63r6wQrjTaSmNNwxFA3QujiqT+f8XE1R6qJiOMnJxtq4WaT7do4LqUJ6XNOIPw7Lk4PGkioxV5viyE+//C+mloW1ZPDyLZrkJc+domXy1lw/Daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8K7E5yjxuvvTISxTHbHgufa6hsyVOKJxVQDpyRsKJc=;
 b=nNlGfGw+81gBJkUOxBGhyizSWf5HYJ/9ioTPPQy71/0rK7y/b3D8W9VylNRSyskafWk3uw7IfEuVnxmK/mrc7R5jiRGSqGcJybjMi7WV0EGkZuMlUGxFaocluN7mAt/9gmzqLovuIAtVIcE9eRR/YM9opEgOJVAyA6Rfx/uidETH4NpItmTu3oz93QGxexxk2d79q7rC6+NcFvbR7a/0PThbD/F4QALWyJXQjmoQLnQRgzev07jYNOgXp6He2s2+dj25gMlFC60a/sn/DAj8ihWAI2+90nwyyLXR7isOFgCZJv5a/EbwMOnwoZHWBgn8EJhon9EVXjIvfYHaKZ7iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Fri, 23 Feb
 2024 06:58:56 +0000
Received: from PH7PR11MB6521.namprd11.prod.outlook.com
 ([fe80::f188:a73d:bdb4:c93e]) by PH7PR11MB6521.namprd11.prod.outlook.com
 ([fe80::f188:a73d:bdb4:c93e%5]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 06:58:55 +0000
From: "Voon, Weifeng" <weifeng.voon@intel.com>
To: Russell King <linux@armlinux.org.uk>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>
Thread-Topic: [PATCH net-next v5 1/9] net: phylink: provide
 mac_get_pcs_neg_mode() function
Thread-Index: AQHaX7wldK1LhNzF+keQLCZ6YcdPm7ELmBuAgAvwXwA=
Date: Fri, 23 Feb 2024 06:58:55 +0000
Message-ID: <PH7PR11MB65210C62342088CF5C484A2888552@PH7PR11MB6521.namprd11.prod.outlook.com>
References: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
 <20240215030500.3067426-2-yong.liang.choong@linux.intel.com>
 <Zc47T/qv8Xg2SA21@shell.armlinux.org.uk>
In-Reply-To: <Zc47T/qv8Xg2SA21@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6521:EE_|DM4PR11MB6357:EE_
x-ms-office365-filtering-correlation-id: bc331a0d-dcfc-4843-3a10-08dc343ce6e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IOLdxGzOJD6ueHZoOffN8kb9tn3n2Dhvq4bGaT8G0PJ7tcvk62ymMu0W/GM2uv9JkMJ3V/2XLvq56SXs578KV0N3fEko3bBd/27ilhsdlrjwsD1j6PZQxh+MBddnDg8EHo5YXemSuDvP8DIYc1b+IQ961hUt6l/Hjnoag+hEX8V3ZC66modWrzJsDX2Y3mRHsUkXVaRn59n8L7NGmUa0h3IXl6mB2lLub3eqClz76e8I5m7hBdXHErgqD6ezKS9zQvI5cWzL90ZDlL7nCb22tfeIz1NmAvza2aWIauWk0NxZuJB3kAtXCN91/chLK5mViyRAiXdesC25FamnZVg22sbB7PWB3ybKE36nma1kybA7J7i9WldrWBViJv5pqAznDGXTE1aebXdfOPe+A3G5xsxA+retjwhiZlssS9CJ8VgwCKzGV7dHeL1l6mvVKKLgEwsYWSdnLIxt5AldFljTBoqR9P+HDcnG7adfN4IvQ7nPolvTdUbWBqTWCmfUzvpE5Y1lq3BBScEOKM2iftoS8O2hLdJOvbhI5cxkHuysgpnMzcGMNPQwEny8zEDwS6vclXlubR0EtdonFI4QYIBUPgyMA7SJjVqyhk92oXM9BMRA98BH7mqYB+/npLrd5dKA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6521.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7/IUgbSGa0Px+952D1zU+IbdN30+Dq5euxdvhssNo3HqPkKrfjTR/p2OLtQS?=
 =?us-ascii?Q?PsN/29hEjzTerPMdl5/+MDPzEbbBJ7wmkVRLYZfEc4/WpC7qFBsAfs/KpqkG?=
 =?us-ascii?Q?7TdeVYotaEaGHIU5tgFg1zq5WSmbGdzdOV9iGwx4ZXMWyjGiEU8Kllx4oBnh?=
 =?us-ascii?Q?MPcsasAfyMv80SuWpoNPiLZqy/aZ6MnkJdzP76Tx/N45udJuj3Ygthl1vP4q?=
 =?us-ascii?Q?QWJuhaLdUzwdlr2UFJCLwbgoC6Sb6wPk/GowYxyiFfIYLg0uhDf9CJ8EA412?=
 =?us-ascii?Q?DE3UgmTu/jvW+3fBZ4GtVfSGExJpawGtz5LkRZxCG3PKJLfRKe27rFkOCd2/?=
 =?us-ascii?Q?daTXFK5AoNZ7tSxkVc0KGIaZh7D1TNmmTc3+hxOAJt4vu+izJgRgupcSE7Mb?=
 =?us-ascii?Q?mIYnZs5CGMhf+ICp1ywR8qFn/BA5xB6g0QB41Kzn2v0oTMzZCtngG3YcnVJ+?=
 =?us-ascii?Q?lAHq7ZeD6Mgyi0qSrmzCOJ77zLmWarmQnMNneCOd9N0QyMuByWFxWaKT+WKI?=
 =?us-ascii?Q?QwIGYSOOaMtihBpCbFS7AZManCCPw1muOLgXbDDZ1s0TcQi4pyXPNBIB5+0c?=
 =?us-ascii?Q?Edi4zAO1G9CZm2Vmsf4hQtenATNy0lpXo3jllDxeE0nkP/eewnDuiE6gjkBe?=
 =?us-ascii?Q?JS1wu7ouslAU1yd1GE++qqxanb4i24QdWG4M8hgO9m65qGyFPcacSmdOMeZ6?=
 =?us-ascii?Q?xbpIp8WRuEkq/NJTZDpAa7Sc4U1m6BLoetiJVTSxjvShS6CCZB4/VVALd4zg?=
 =?us-ascii?Q?RkKomiy0O7yF/OeCNMFKWCaVAuAVRhLLCNRneMCitf7cuAeqIA9bZfJDaKLz?=
 =?us-ascii?Q?n95YrStb5ZdTQ5fqRoZ691UF+AVMV0Nhc0SrB1Uxp3kBpL0vNmhIIoDDupmN?=
 =?us-ascii?Q?1KbVh+qS5t0PEwhvyn9xYmVnJg43rAn8rBFiAaSsryYAogGVWlBVvEaz2MLo?=
 =?us-ascii?Q?PxnSpqGGUBpS92H1fUe7w1RcUQAygJj3rih6Tj3REDHK+/hTGgcUR3YYFRhh?=
 =?us-ascii?Q?+Z9GvpX+DmbSkda3UOJDRwgWG935Khu9L7WW5ObKmJG3m0oHRxTSOFKJ8e1w?=
 =?us-ascii?Q?+gvUc0deQyqbdId72cLYxx4d/DNbbTrMFkTSw+wnYNEGPt5H2WW8FoK43X8P?=
 =?us-ascii?Q?2RG318d46rNI4p+eJWjjx1q7inZfLf0+T/ChdAsj1ZJCZaxJWCuCxonc3q6x?=
 =?us-ascii?Q?oh8BXtSutqGEjwY4TLsjIz+Uu189qjS0WZgUC5XVvKJaXeDbmtklEmFNScQA?=
 =?us-ascii?Q?wGJbXszJATocSYqI5wkbH0TOGmAlBxj8YUap8hfQTGKr4YjU2YlzTx2MXR1H?=
 =?us-ascii?Q?yFw7KE7FLd8b1/4S+CgZ/txwmOCpEfJ9oM+6AMMnHQxgkHh3mZVr7eENHB/B?=
 =?us-ascii?Q?WDFof+otoh+0rGsL8+AHpvXJWvCir8Yd+N1uynx+oOqHgziayteFITaUwZgK?=
 =?us-ascii?Q?FiWe92sHZxXVm7o82AnKU/HH+hIe89xE9G3zFARD2FInFFI1fAFpUkzAE3yy?=
 =?us-ascii?Q?ajPQvhpiSmz6aKMJNyXb6erVeBU3CYEEeYZomk8N/xaGr2lNohcWyjFibdFc?=
 =?us-ascii?Q?V89Pi8tsUXuktogRuYY=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6521.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc331a0d-dcfc-4843-3a10-08dc343ce6e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 06:58:55.6400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7i6imOzmO4Fz1Y0yBHgdsGxUmWh2Jd275CNrKjy9Kfw3fleho0vCIwhssolleZM8VIBSKFtbzkfNGVB0WiVqbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, "Lai, Peter Jun
 Ann" <peter.jun.ann.lai@intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew
 Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark
 Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, "Abdul Rahim,
 Faizal" <faizal.abdul.rahim@intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "David
 S . Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/9] net: phylink: provide
 mac_get_pcs_neg_mode() function
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

> > For instance, if the interface switches from 2500baseX to SGMII mode,
> > and the current link mode is MLO_AN_PHY, calling
> 'phylink_pcs_neg_mode'
> > would yield PHYLINK_PCS_NEG_OUTBAND. Since the MAC and PCS driver
> > require PHYLINK_PCS_NEG_INBAND_ENABLED, the
> 'mac_get_pcs_neg_mode'
> > function will calculate the mode based on the interface, current link
> > negotiation mode, and advertising link mode, returning
> > PHYLINK_PCS_NEG_OUTBAND to enable the PCS to configure the correct
> settings.
> 
> This paragraph doesn't make sense - at least to me. It first talks about
> requiring PHYLINK_PCS_NEG_INBAND_ENABLED when in SGMII mode. On
> this:

The example given here is a very specific condition and that probably why there are some confusions here. Basically, this patch provides an optional function for MAC driver to change the phy interface on-the-fly without the need of reinitialize the Ethernet driver. As we know that the 2500base-x is messy, in our case the 2500base-x does not support inband. To complete the picture, we are using SGMII c37 to handle speed 10/100/1000. Hence, to enable user to switch link speed from 2500 to 1000/100/10 and vice versa on-the-fly, the phy interface need to be configured to inband SGMII for speed 10/100/1000, and outband 2500base-x for speed 2500. Lastly, the newly introduced "mac_get_pcs_neg_mode"callback function enables MAC driver to reconfigure pcs negotiation mode to inband or outband based on the interface mode, current link negotiation mode, and advertising link mode.

> 
> 1) are you sure that the hardware can't be programmed for the SGMII
> symbol repititions?
> 

No, the HW can be program for SGMII symbol repetitions.

> 2) what happens if you're paired with a PHY (e.g. on a SFP module) which
> uses SGMII but has no capability of providing the inband data?
> (They do exist.) If your hardware truly does require inband data, it is going to
> be fundamentally inoperative with these modules.
> 

Above explanation should have already cleared your doubts. Inband or outband capability is configured based on the phy interface.

> Next, you then talk about returning PHYLINK_PCS_NEG_OUTBAND for the
> "correct settings". How does this relate to the first part where you basically
> describe the problem as SGMII requring inband? Basically the two don't
> follow.

It should be a typo mistake. SGMII should return PHYLINK_PCS_NEG_INBAND_ENABLED.

> 
> How, from a design point of view, because this fundamentally allows drivers
> to change how the system behaves, it will allow radically different behaviours
> for the same parameters between different drivers.
> I am opposed to that - I want to see a situation where we have uniform
> behaviour for the same configuration, and where hardware doesn't support
> something, we have some way to indicate that via some form of capabilities.
> 

Hi Russell,
If I understand you correctly, MAC driver should not interfere with pcs negotiation mode and it should be standardized in the generic function, e.g., phylink_pcs_neg_mode()?

> The issue of whether 2500base-X has inband or not is a long standing issue,
> and there are arguments (and hardware) that take totally opposing views on
> this. There is hardware where 2500base-X inband _must_ be used or the link
> doesn't come up. There is also hardware where 2500base-X inband is not
> "supported" in documentation but works in practice. There is also hardware
> where 2500base-X inband doesn't work. The whole thing is a total mess
> (thanks IEEE 802.3 for not getting on top of this early enough... and what's
> now stated in 802.3 for 2500base-X is now irrelevant because they were too
> late to the
> party.)
> 

Agreed. And I have also seen some of your comments regarding the 2500SGMII and 2500BASEX.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
