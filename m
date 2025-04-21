Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D92A952C6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 16:30:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C6AC7802F;
	Mon, 21 Apr 2025 14:30:30 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AECDCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 14:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOruU2AIMM8Vjql3rYcUAL2hBwMIZUsuOYxoyPBhLjCgWl4UIDytRGx2j18z5dBNv7sqWe1QiKhikApL4QgPyHlz+6I1IGuADnbbG+QLiLHqu+sy17PxP+ClZrNl49QETtAzuV8Kl8O0x51Z0SYjVXpUwF+NbtBkYOB5JbPgowcymwDgnBM2mjErVvbyjtX7jzGNYWT/TXANtz9xVD7ZZXunAqW/ea08qiy6Wl72nijXpqlJl95I7dPQkD5cd5jqXdNCi1pMkAjmALO3hwk5K2NLr9ViqD4f7m34gUDQ2ABK/wsud0avaViMZtovwji/l6s5+f8TGIJXnbBWfmDPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMfQmIu4BJtmmZ2orqBz0cpraT3mI3qlPnGRhhHcHC8=;
 b=N8AvLOaWxkt6HT3u8tgIEj8gNYuKLOih4sbHddYxg16gvVGXynk7h3lqN9yflqgnFp2HHdwknrXcypVDdeGWh1+QVBbP/aOBAR9Rg8r/GX2o20/SNDQxslqK+eSTrm9FmatNIETDIlEZTdKeo3F3Ejn9+8T+nQenknis+iv4kZ8ZdFnvJqcHvuCiN58FK7udfG3aKNvYYD7um3pqWJYl2rhStHwgvIXYLS5BOMZPiaiZU08JqimeEQHREMGCRKbufANf5z1mjseDDhjRB0KtNE1kKFFjByL+vKTwF51PM6L+xWOaXan1XBLfFnRlwd0d/mHUG+1fQYPljoszlqb70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMfQmIu4BJtmmZ2orqBz0cpraT3mI3qlPnGRhhHcHC8=;
 b=ef7CMLD2VaPo1iWjzZPPz3L5SadmbW8EAFMmeAadPGcgHGSG62QTzx95y0ygxFtVnMgjNGoH0KV9hpOZwJxJDcVvw9odIeFlMfbwnGNs6s1w0gBHR+h7EQglCFpZu1xLSMJ37an2/6hXaznC07hzN570BNfBVJAlWWUn4wg4YbY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9771.jpnprd01.prod.outlook.com (2603:1096:604:1ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:30:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:30:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index: AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4IAABoxg
Date: Mon, 21 Apr 2025 14:30:19 +0000
Message-ID: <TY3PR01MB11346DD203DEE8A30F1963DC886B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9771:EE_
x-ms-office365-filtering-correlation-id: da74ded4-e385-496f-815c-08dd80e10b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZmcnMk0WeJbo1FsF8C1j0JqQ0jHzYhoZYnRevKI407eiC2BnMb2cagWBt9IS?=
 =?us-ascii?Q?QXCUYfFNkpViJ3Fuxawk94JxuEGN2rpytP4jxDy6Ls/qe4h9/tLlS8C+sF1h?=
 =?us-ascii?Q?lxh/E09iA43xV/vIIQ1oaeQ1HV4fwUYDJOTbRwRNFZntbIuS0bVI3CLplFYA?=
 =?us-ascii?Q?Yl0h462L8rIPGIHWIRKdVNj4lO3idRhrY3R53FNkTWdGX0udRPzmWaVgZwAv?=
 =?us-ascii?Q?MMe3Rvg7l7j3nPrJoqcZZ8kiteU1NMqLTeR950rUwKNBMPTlKMpY6lBs0on/?=
 =?us-ascii?Q?x2Jbc8WyMT2rxOLUmCpnOVkVJfRrkCgmLpYcFOt5RRnXrrlcs/oFRxXnZGsW?=
 =?us-ascii?Q?hvH14w8NFiHyclbKL4zr9bhIZ9HsreVRP/Gjp2H0Ul25mQvhFvLm8N3096i/?=
 =?us-ascii?Q?gVHHdwRJcZ78h3vm4QBbmQGvP+hc+V1glXv6w+6vmgCUqrQioX0qak901poN?=
 =?us-ascii?Q?01oiJXgW3tUj+DmtnX77kGOxI+UQ25X6elq8WdFfsr1NtasKRXYASZp1p5Uu?=
 =?us-ascii?Q?fdteJQ7j97U84gPbbgnzUDnSZgdvhdV0uoVZ5X5rJHjhruTCb7gJ7rDGzuRX?=
 =?us-ascii?Q?CWU4YNOLuHmTSdsDzBCmYX/zvoArLEi9DAX5YcNDRtrngkoObUEWcuWtLgs5?=
 =?us-ascii?Q?MGV8Dv6D8datIRwnRziv+hwIl04jNiUWl+2kUVm0hpFvQx6riFkFYgTYMqqP?=
 =?us-ascii?Q?nr3yHJe77QDm92ThNWxv9Fu4SopVMdpwOoPJg7b7f+AM1TKFtzqT/DA4x/Ra?=
 =?us-ascii?Q?VzxCBYTtjC7n+0/SDIwwPF9/e+WdFVnvRpDbNkaEcKn5z8NgSD8bHWd3R+zy?=
 =?us-ascii?Q?ZgJ9YjGgPbEHxuCqBXVjAFP87b3QDYSqKqLvHTQ/pC743KZ3Qr+GeqbAFCaW?=
 =?us-ascii?Q?KAmRWlzO9hhmiMHeVLhclM83DMuEPAbDuxFqjImZ/ZBotPmW0d/kvxDuirFo?=
 =?us-ascii?Q?QIkztObhoYTVDph8A+ZFhsFLiNkzHCdzu4b2GB5FyXY+N0RoR7ETpcuiGBU1?=
 =?us-ascii?Q?k70iP8wKt/+pEDwnQvWyMxSF4EKwSTr7MzjXIGJE6jSnEOWODLtwnTMX2qHY?=
 =?us-ascii?Q?ydmfz7c4rPtyvrR+sgwvq8MtzHdm3cNAvOgMxn7lkm+ArXw3EqwGEymQr5jy?=
 =?us-ascii?Q?vZrlWFUqO1HnQh0EdpHUkKRs21Z8LYFvTqCFeZLgCfivL2nUMjufYI5Atemg?=
 =?us-ascii?Q?kSfD6XUsxZOxVPqiSSh+9S2cGG2XRbw+45zM94sbnYVjjT09H1psq5q7PMvX?=
 =?us-ascii?Q?UQ90i6liAr7aOx7qQBZ0EBj4M8DT0LMJvGIhAxte6irDvvOnWMrsSCwABAeo?=
 =?us-ascii?Q?yqrDAqqFTY7OxQaBmym/8R9B1tg/fXZFLXLILd8dtkzDgJgipjn43zZewolj?=
 =?us-ascii?Q?gxaRmvAv2cmviSFUzn/bHjcNUSl3+V1PwrTcpcrK9x02f4Isot1apZcJ1ANY?=
 =?us-ascii?Q?Wyln479Cl/iojRvkgnW6Ahdv3iI+RH4z25/3+n1nEEtMFeqL51mfeQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?71LcgRzd+w1FmcR6MhC22aC08B9qOv7lnRXHSXLg1WSv5g8I3iUWDYNzBBTn?=
 =?us-ascii?Q?BSRbPIDEsjjgjNGacgeyuOwRXn4cGl+taZXvQIenmKKfgvo9UiFNpbMDVLKZ?=
 =?us-ascii?Q?z9/JvauiMqbu2Er0yrd23fPvfi5+8DGArE/MQwhdL/zNddW97x7tZPLzrXeS?=
 =?us-ascii?Q?2S6cwaKYDT9ZSoJTNoaS0G7fwNyInkIjvzznaczZvLrDa/0QqwdAy66UMKpX?=
 =?us-ascii?Q?COpTmfs/edBU+5D6ADyTODUM/eZcXnfPgGhZnTWV0+Z/ZJ/4MUDAB16hjXVL?=
 =?us-ascii?Q?UvQmAUxypoI4oevRPvbaStx2QA0EftkLEI3Z9UWRG8xuXBo+TOGxp9T3jPWR?=
 =?us-ascii?Q?RDP8dhSDsbSBlet3NJq7sOI62T3zkJoNqKadivNJ70MCHcYVDyr1A5/qPQx/?=
 =?us-ascii?Q?YrzmNLfecS0+GzaPKzi2dB9geSQi15L6Taf4CkXI+tgSHBivPGEtdqjm2aiT?=
 =?us-ascii?Q?9EgoO2nDxlWyQyLZ0qxwUmDuQrw3C0/mgR5dW8HiUwzaNW+0tbsnkiDdOFgt?=
 =?us-ascii?Q?NA25kaoV/hZbapkn83ZZSXAkQJozzhAr4AHd7gIbPmHlCRXZOcQv7aAVNuKn?=
 =?us-ascii?Q?cPhFv5G+bzrKgoXbb8pCYX5Gicikz0DmWDL018wW5y2wTbSTUUGRG5CmaXWi?=
 =?us-ascii?Q?ekmN+56Rr7p/QbNHwyAjcGH9PXfWSxTKHuV2orEG2qFVOc0l4QFidCl1i+SY?=
 =?us-ascii?Q?VF9GDqCndNTyo0w8Rff8KfFRJv+yOsxvpBKmqHLMcWovoeUirauSf6/nkf/V?=
 =?us-ascii?Q?8jZWLHkeeCJgQXyYRjmvCaDAzFvkgO3UVgReY/MFVv694ViwZj7HaveHFePs?=
 =?us-ascii?Q?e4pM2RF/sPpj83p3uuQA3Osib8AIt50f6Ezkmuv2cSNevoI6Vx8KXmya6m5K?=
 =?us-ascii?Q?ioCGxwlGo7RnhI+J9AwiO1pMisvSN7x5p8f4hiCtaeGSPH7zE69Z5fpI7NX8?=
 =?us-ascii?Q?Z8aDqYwAj5vf1yHgF4qhD7+UXwn9htvibgqxhNzDMSXh0Xl/F0Nd4ULrTMff?=
 =?us-ascii?Q?7Zwl9cys+iTFr/tiqSP7egj+Doq4r9ZN4hRgqdd8tbnwmWW4WtrZePKu6WLy?=
 =?us-ascii?Q?TPF6jWNH8bS5UZH6FTQEZhIFxJFYh0Jl3FQ9pzUfReAePzHNcMzjoxv8uwa2?=
 =?us-ascii?Q?0KmhgXDBzDxBkTEQ04KRRQ+slyXOXGD5CcgkJ2GQaXyFOQulLj6h+9gBqHvO?=
 =?us-ascii?Q?Fhv1nZbrWubabScxhyemXxOwsmLdrvRUzzc10WOrv/nrXsALLz/zfMwj3bk/?=
 =?us-ascii?Q?9FtI4vVz3PHooEV2LlwjfS5744Wopv6nSxvz8GD4+nxkPo6r6enMvdm8hY9t?=
 =?us-ascii?Q?WGVHYKOS+3NOFAssMJrBU8YWU3ygEQtYTKiqBuP22nUvN45p5JDUy4ZomSwk?=
 =?us-ascii?Q?2j2TLwgPeEKnsM7Eje4j5DLrq/31IOIsyt5UQLKLmDNIKRjTkEoeRR63nr6o?=
 =?us-ascii?Q?WTGNlN9nzTQ/JyTHe4rYjqzQ2R19FvjJPO21mTfMPT2lwtmGYviTV1Xwzot9?=
 =?us-ascii?Q?QcMknAz8DPt3LeYY6HQ1Z8i5NQ8Pp0auKQT0FxHGFsDE396GNa7SboWX/tFv?=
 =?us-ascii?Q?BHqOxk9hMs2CB60LUZlnMuGwuwT6MelCDW7XLO8QmoPOZfhoTNrY819BD2tb?=
 =?us-ascii?Q?Yg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da74ded4-e385-496f-815c-08dd80e10b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 14:30:19.9632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCPSJjYo13nVGFsqWs2PEVIPb5kbbwUgeOQkBRVqglflf49HG/i4p2GzU128fKIt7qbseTqV/LHajTY9yN0m4mP5VraAx4a27/QWXUZhmVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9771
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
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 21 April 2025 15:22
> Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> 
> Hi Andrew,
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 21 April 2025 15:02
> > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > for Renesas GBETH
> >
> > > > On the RZ/G3E, the upstream support for testing S2R is not yet in
> > > > a usable state. So for now, I'll switch to using init/exit callbacks and drop the PM callback.
> > >
> > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.
> > > I have done below changes on top of [1] to make STR working.
> >
> > Can you explain why you need to reinitialise the PHY? The MAC driver
> > should not need to do this, so something is wrong somewhere. If we
> > understand the 'Why?' we can probably tell you a better way to do this.
> 
> Without this change bind/unbind works. But for the STR case, without reinitializing the PHY, even
> though the IP link is UP, I am not able to talk the NFS server or ping the host properly.
> 
> I checked clock/reset before and after reset everything set as expected.

Typo 'after reset'->'after STR'

> 
> Only change during STR is, on wakeup we need to restore direction (MII/RGMII) of IO block for
> ET0/1_TXC_TXCLK (IO attribute) in the pin control driver. After that looks like PHY init is required
> to talk to server.
> 
> Cheers,
> Biju

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
