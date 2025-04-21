Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A594A952A3
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 16:22:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5062C7802F;
	Mon, 21 Apr 2025 14:22:10 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C263C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 14:22:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRwnFS9mr7Vhlmfs8KDcefDOXw1fFR9KQRYyTK2OY/djdfbbBAY1Q6QFbXVCugw2mvMGJPKsP0x5Dfm7JlmfkpkA2zz41t+aMDW1SzQX+J5c5JGUs3vDXsuhWsc74ilTNy4XBt2dGYTIR+PhRHOOlayJZGMhzatpGbgWTp5k8o+KLmh1Ok8GoXqG1l7xHskeXzYrLpZBvFbe6hv8KkRYP3Z+7zCmFITF+VwAFr2YBMf09VxwmAunqntS0/samLh/db37B+SFMwMrUPD1d3PuxaMXxy0P8v0gloR2H0Yd2Xgp3AUS2zUNtwW/zcoBkHtnfrpHBEQI86NdiI2erJLZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DQBNFouXoPqHiI1+BX6PHC2RdOHPww6Di4Pym7eSYI=;
 b=dMChlPrP0jqKpDbYuBZmEDrh1TTpPrPrPIA+9UDJ0+n0PoT3QszprAP/GqKrNekMKsHkUs5ltK0PVHfXMxtDP9cJpy51JiTlAtZplL+fRS/4r0N8G0fx5paby3isc3oX78qh8mxRQ5pMXNKCaCAx9GKIb5q/k8NJ5VGLAG5A3816vib0e+dEA8OKPLuVJ6i6JPQubbk9HSWUnfsRwyQrX2nHFz/ntRglLoexnOZtCOnXR787BGBq0/RIjn8phTfO6v08le3YfJ1ykfxsCQQvP/58zmOPArYwAbPCXRiZA99sUzWBtQ52vHAp/ZrIFijQw0jbSug2mwKuiiPPuXnkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DQBNFouXoPqHiI1+BX6PHC2RdOHPww6Di4Pym7eSYI=;
 b=gQHGZDTcRzkKvCH75Rl47S+bCWVrloxBOC924G3zD7oyulamEXk8JoeJYPMAYB8b46usa4qY86hVGVt3flZhRnVDM42jkS+yf75kwV37I0/BsTaG2eDItr0JBkcZqtjnFblJPwTsZAn+etuTWJTwMDpcraYcmE14t2G6Wk1yYMA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11914.jpnprd01.prod.outlook.com (2603:1096:400:3e0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 21 Apr
 2025 14:22:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:22:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index: AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4A==
Date: Mon, 21 Apr 2025 14:22:01 +0000
Message-ID: <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
In-Reply-To: <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11914:EE_
x-ms-office365-filtering-correlation-id: 293f69b9-0e7d-403f-ac3b-08dd80dfe1cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yWjR7lC4CyHG1xZUrvUUl10eX1tNoRz2KuOIckbO1nNQC85CyHbDoZ8fs66D?=
 =?us-ascii?Q?WGDzWOugq1NIfoXgLb/ShBBNBTOxbuL3DBAiGYSJR1AMgpwdnZCVKh2Is8Ln?=
 =?us-ascii?Q?eW4OIpmoocVJXWankVwE/NJtP2kfv6Qz4LCtt10H2pYC4rRXyuvM1XUtt+hT?=
 =?us-ascii?Q?fyvmw3jDlp423xat8Ij7pXak7sRy56S4KJAOFwiBHeR6xkJY0H/w/kDH8vu7?=
 =?us-ascii?Q?rlN+tPmB6QudJW6I66PNVyF+1diUoFnz10D+/h4VvUXMG3veECW3dEZPHa+p?=
 =?us-ascii?Q?lZVRfHguAA5+bRHBjVl2V5GhSLjPajMJyNUcCtjhXcUa9WZKKy/8i7o7CdyQ?=
 =?us-ascii?Q?8wBD8e/WxY9fMXwf75GltZdxJPmQefcDXRVIBsDKYj1gI/pm9NYx1dQ2rBdB?=
 =?us-ascii?Q?0/jMOs5qwBXuv81BcBvuhy5CbbkpaODxj4mfqZ9qLlagPK7vkYigIonu+Cwb?=
 =?us-ascii?Q?oEPfRaL5SmP3s7JN6lK9gj2tZhaVe8VcnfI5f7pj4VY43RX8Ns4n4lR7hmeB?=
 =?us-ascii?Q?mhIdL3qRWa0DnECA7xjVMRme1xUanZi9Wpmq4r1qhbMxG03RRMYBoxHMHSNM?=
 =?us-ascii?Q?bb0y+m0MCP3Ib6ftew2F63vB3C+uaraTc0P7ss/b0feJrDsBiU0r5LUCqrC+?=
 =?us-ascii?Q?iEY11qQKDEC0oStWsUpYjLQbUQ7qBts+ZtRi8F9neWgx+fDX2R4REFbfxJQY?=
 =?us-ascii?Q?F2p+AUWCCrC6TORJb6K/Om1HNoNoFtYxuCr0MnOHPxwkq+4TT1qUuei5fOMs?=
 =?us-ascii?Q?gxzVV0Sa0FHgmAP9oICnIcXyY1XEL0OiR2Of84/PNHxf75dT3Ta3Qe/naqnQ?=
 =?us-ascii?Q?uy1arJuqO4BupjGZhBAYNswHAYHH1+AtcSrtyjrK8ipZkA6e25gJarhIjyPZ?=
 =?us-ascii?Q?gsp4Tk9oFRk5YGUNEaBwJEoHXQij5Y9GoziM/cuKFpnRK+IHrJ1WurP3ec9W?=
 =?us-ascii?Q?Nuja6gim2IuFipWmATON3Km5AG8r/EtDwsQIae7W8KYRjc2o1zMpjaQkogzh?=
 =?us-ascii?Q?JT6CckUZJ/VoYg7E27E7cNakuX8M8Q8HX4SXIekpb+TTMctvcdVxMvpHTQ1M?=
 =?us-ascii?Q?zs8GaASjoZGFzvmGnBsTJFuFe0ZbMv4e4j+d1I1iLxiMoVXrwhErQ8qr+S5J?=
 =?us-ascii?Q?Wh2OzuX+X8G+V4mqp8Zn8vcbDVDMlVnlxY9HdH+QQLipKSC3Y5UwW0nhnM/R?=
 =?us-ascii?Q?vZtupNqdkNYWTS/yIesJEvla5LVYy5dk8HDxQhKwjK/2CkjIjGfvfyusVMl9?=
 =?us-ascii?Q?H3RVOrWPG4+S4OanJQh0HNW8yToPJo+Y+li0oeyE8xnvYcd7N4PrxJmNPMcf?=
 =?us-ascii?Q?/Z5Qt3JBr/1bqhJz1EbDX33FiPiqj9juGSaUNVxBNq8o2LIHuf33gToiSqKw?=
 =?us-ascii?Q?dL70HD/FQe4NQXuLtV3o5BCz3ztnik8Tr4sYx6cxp+kPOBHKwh+1QKaVKPgl?=
 =?us-ascii?Q?AizUJJbL5claEdjg6iYatrYUwv6nk5R/8ucW+H641bQTsKxOZQ5r+A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BPdtPHrTaJ2BCDlZs37u45L2lVWeovKnqAzKxGNE8wdVRTmIzg/povAZhXlJ?=
 =?us-ascii?Q?KC4zfsEQgZyLnQiUKfbEmAnnDPQYe6Rk/wwhGo0BMknsK1zaKDmi1zIKNLtv?=
 =?us-ascii?Q?70TZ/9AWxycz+mUbaXbD3ovT76xmwZnVWbfHoTHEcef52hRH77MPBPONntwj?=
 =?us-ascii?Q?wOH8XDeH1Lfiv/4EhKX7kzNwmmC9V5ukcsy+UEEt/2Vzoz1RZFNYeM1d8cbc?=
 =?us-ascii?Q?MpW6+DCnlljz5IqgHyBWa6g2qp6h4cR6QB8I/x6BKlqF6p+T+M6POHIzWW5D?=
 =?us-ascii?Q?Afcbes4ldt1NOKZ5qxSvUB6oYJHAmMtjRSRMkoPK1m7Tjp7ZmB3BK2aUHUfc?=
 =?us-ascii?Q?OlF9scfNK1GUfsMHQIo7rz5Fsc7rTQEqmKx0+LZpm86mWtFezv1Erw+xpaRe?=
 =?us-ascii?Q?mz3Y+d+SOahKLg062NJyfpZ/AjPimqq0z2A2VNvSqGC6riBFaS4oRctmZwB/?=
 =?us-ascii?Q?iKgaFP/HZrVCzqe2nxBNggv6XgANEzkmFGqmedNyMIleGXbd0rgY+oyxD3A5?=
 =?us-ascii?Q?uUV3aHCQVGfWclIjOFljS2al1j8/noynb+Pax7iuT/PHcb1aTPY080xgr2Ad?=
 =?us-ascii?Q?7ClqGdOsAP3TUbe/INkedqUZoosc8KsKRmzBfkQHQk2arVgfx3tbatl0+Gx1?=
 =?us-ascii?Q?CbTGIf8lgCzxSiahFurFB3AzilujEH3xaV6sF+3TCsGbglHn3wTlAGvHA5DI?=
 =?us-ascii?Q?i7NdLtIx1/bi7l/hzeX19aqUYkroijbicdeqnHnbySPWyTJkFjfh4chQfkF3?=
 =?us-ascii?Q?Z86uT+mzucKGh1A77MVCK18rnCCe6fIMUGSDi5rWmsceTiwf/fRsjbZq/8rF?=
 =?us-ascii?Q?ILxmBNnpejeq7vOKxBIyl4Uq9eezUSWIanp4qbRmQY+ilZ37G6S0eY6B3g0q?=
 =?us-ascii?Q?4dRaPX8QsZjuioKpe/yVGRZOEDeZk5CJCG+asPm3i4Tgsih1Rp4mQB06GcTO?=
 =?us-ascii?Q?cLV8+cJMoaXaED0kDin3MDSngXAkHfGIKriC6DeNPcLX3hFSq+dUUXJdZhtp?=
 =?us-ascii?Q?9Ti2Lc7RHUSxGIkcbxr9trBhaP80Szu3ncxhOZV2NwxI5wBvU6XFDxtB8ZFA?=
 =?us-ascii?Q?kC2ZoCYziROa6jCjPD5AIImB3Bz7r82f4hFcvvunSb2n3BAKAXFQ96ae64O4?=
 =?us-ascii?Q?0wkkvm4Dx1OvkAn1PKrk+W1xJcZRq7cq3/SqD00XVCM6FlgCtCzygwbtvWPh?=
 =?us-ascii?Q?bzOFtFV4czSLzcvkMsi9HWqFfMkOWaXWgkHjuhHwqbZMTC6Rf8GxRUDozVIm?=
 =?us-ascii?Q?1dJP11NqQyHu7gImIDrDZyN4RSI66kXSECQO/D18dsQfJ6g7HuLoDoaFnftn?=
 =?us-ascii?Q?WbbrdHrOt67uV7amHXr3fjswXQzKHBXPIXJbSCYraABJ8mvAD515Isq1eZW+?=
 =?us-ascii?Q?IPcMYTfczeBQRyTE/vxBg4kqGF/BOTN5Qg6t270SRyeRV90LBWqCK3S+S5cm?=
 =?us-ascii?Q?LY3y7P4AQgYaJH38jVD8GkJ1Vet5hdd2spKOOvyhzNHkGhTCxO0p4/sp4wqG?=
 =?us-ascii?Q?xwYgJ2skzRAW8CieAZDR2x3fvk+QXZSuOHrvAl2oNTiI0YsSKPAPIMyyY6BR?=
 =?us-ascii?Q?v559R5VNaRTuOPV1sWaF3iX1+RvJ9xLDUhAMPuq0VfEDMjD+1Fn16q3cv4o4?=
 =?us-ascii?Q?9g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293f69b9-0e7d-403f-ac3b-08dd80dfe1cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 14:22:01.0917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTBRZUQhVRGdbaVWgIMy6kJlUDo+LXSLe0rnA6q4+XDEbiKxNs56dmR+TgZssDIgtB1bt8TdtHU3Zv9jvoKvLkfoZIwwCX73t8srTXcEt+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11914
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 21 April 2025 15:02
> Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> 
> > > On the RZ/G3E, the upstream support for testing S2R is not yet in a
> > > usable state. So for now, I'll switch to using init/exit callbacks and drop the PM callback.
> >
> > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.
> > I have done below changes on top of [1] to make STR working.
> 
> Can you explain why you need to reinitialise the PHY? The MAC driver should not need to do this, so
> something is wrong somewhere. If we understand the 'Why?' we can probably tell you a better way to do
> this.

Without this change bind/unbind works. But for the STR case, without reinitializing the PHY, even though
the IP link is UP, I am not able to talk the NFS server or ping the host properly.

I checked clock/reset before and after reset everything set as expected.

Only change during STR is, on wakeup we need to restore direction (MII/RGMII) of IO block 
for ET0/1_TXC_TXCLK (IO attribute) in the pin control driver. After that looks like PHY init
is required to talk to server. 

Cheers,
Biju
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
