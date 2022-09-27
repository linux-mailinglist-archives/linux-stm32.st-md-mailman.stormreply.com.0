Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35F5EBB48
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 09:14:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2C01C6411B;
	Tue, 27 Sep 2022 07:14:29 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2070.outbound.protection.outlook.com [40.92.21.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC456C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 01:28:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErEEBnx09SPlHlINa0A+nHax7D8R1GaWzeKOSXedzBnzXxmKYhnbaRRPX2nP0KeV7n6VDaT7P1c/6HvcuwgfS+hHceLhKQm+OlMpPpltFZGTKGk3bcPNTNnNfxNZ0t7ifhlCjX07J2n1H90lidRvIa9zfjcs0mKY7vtYAjpngiV18ztu1QQzmj4r1gwo4D+2+v7OR1+g54ZH9MVS24x4CP7ZWPX4vSZjMe+0dyAmeXgauoXdxCrNaLrd+chYuxvDK3l01M0epSKiWRIZVCGjFiYX/bHxxHTmDnKc7g09sdnuk+U9NeNPpAOQmwVgoealG8uTVdRXduc6Ra9aR0pV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDu9PHrIlIbNQV7C/jLuDPZIngLZZJbDpm2RBlyiuIU=;
 b=lukgrDAm8xuwRzU9RussNCy5QiMYHP2SX4cbUGmZeLkoGw4eQTjRVFNhLofEa3VbS4yEkCB6oGqvOT80LRKR8OPiFbfC2+1sOhqUnraWkznJLMmEbpXA1kZ1ff3xP8HIrfW7jJ1kX5JB1dLbToOQj1gb5uDhr35guqHrnAvNWer7LNbYfeNE/FdNTzJwRKUwzIWC8lv3wO7h5YB0kvf+uzZ2jF48C7GFuE9n/NKkqBKFfm+N+H4lpKde7qeYtlSsbLxgikEAqJXjM5YyfAJIuEirtscPqsF1YtVxedjJdRwnlY1djbxzgtOhnKR8GKRGgv4j5xImcMXnRGnpRYphOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDu9PHrIlIbNQV7C/jLuDPZIngLZZJbDpm2RBlyiuIU=;
 b=MTpx9Qz+KQilwKEJhB6LRyKL/Doez+eNV9d2FZaZ6/PFLAiw5DkXjIIkH51AdLgu7idWh3wpZfPUUxhTdLJ7qSMWU5JHPL/f0ayYg44rMqPcakcg7yxUyYZ6bn4PKcbKjCU7LbFuOhzHl/Z7pOQH676zJnvc522RrHOzKtZ9zLz87lmSlUaPm2McctVy9oixPGNjJCy7XOeQMV9obVRRpnRSwN6cjAFwzxedFMP9cO+NGppD7WrLm4zMWeI+rcwxQZqacYJpVHJr+nOQgjBZ5tqM/+k1qBM7CtJ8qF8TLj1xWFXyr6UKPwMVNIF0wOnxLJuKqtnTbWqDxPhfnxM6vw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MN2PR17MB3887.namprd17.prod.outlook.com (2603:10b6:208:200::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Tue, 27 Sep
 2022 01:28:38 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::9883:9090:f2c6:24e2]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::9883:9090:f2c6:24e2%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 01:28:38 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Serge Semin <fancer.lancer@gmail.com>, "Sergiu.Moga@microchip.com"
 <Sergiu.Moga@microchip.com>, Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>
Thread-Topic: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Index: AQHYxgcwXx6nXz60d0aHoDG+CM/mLq3wyR0AgAC5K4CAAItyAIAAhrbGgAAAHAOAAABIuw==
Date: Tue, 27 Sep 2022 01:28:38 +0000
Message-ID: <MN2PR17MB33757968B536CFF8072474FDB8559@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <MN2PR17MB3375A8ACA1F35E16E3E767C6B8559@MN2PR17MB3375.namprd17.prod.outlook.com>
 <MN2PR17MB337522335D55558DA692A3A0B8559@MN2PR17MB3375.namprd17.prod.outlook.com>
In-Reply-To: <MN2PR17MB337522335D55558DA692A3A0B8559@MN2PR17MB3375.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [tToJeS6TqTRww95fpoKntRo2aST4NSfZJ3ycsE/O1yQ=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MN2PR17MB3887:EE_
x-ms-office365-filtering-correlation-id: 92aeff1f-224b-406c-535f-08daa0279aa5
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gvWEXU/I3aQH3LePj/yhH6+2QYch4XNjZPFhndvGRKd1oMhekxleWv4jYdzffjnAqo9IimYTvPD3xl6TUelnjlBUBJrvevvpjG0kkZ3o+kwDGweSKRkEEQ0v9lJODGV9i/uWhbuzTD5+4kH0DkYbkSzAZgmY6UL0h60RjYa56oVZ4xInpEFhNMCmYClR5nVS5mCTBRucveMr1urG4pbvbYicxN3IkBM931fAfViyBpNzD02ilyfzEab8cTB6N4DrFeG6HpR79H5+XeuLdLE8JdbjAXm4q8eFb+0Ob1hWOkUMHduxqc5TnvsOn47z3nQyS4rcqZQ4gktdnQ2tkko/kd3/MKeAFKY0Wjds69+yAzuLcz/fZb0jNsqCcIVXGmjAoo2mxCTMKHPdsNIGFlG5rrOitalptAsu2BhJyTffB2o8NFQfzgmcaR/VusWb2wHUUGz+ZOiRD/K2XCFoZadCJ6DJYAB1lS++/Mpv8jQ7oIAGbe8O59wQJMctOkLVIpjnimfilgdpdnQ4pcRJu6YIBH87gk1MU88pnMliN/D0VysTYkaq2Chk+G1Frzi+o3vnQvDkrRH3pMl3K5nvu5rc9unzFBVFBFAGrABsiP8Wt8bQ3NuBP6mhI+ZY9Eg4MNBgCuYYiGckSoVrGt8EX3He+gxBdLh+SlX6bp5h9ODTfsK2undOILEEyQpP+tTjOtfr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XKBvm8m+qlaYvTKO/Uw0W1KznAK8DPsSmlQoS57Nct7pf8jvJy3DWaFBkzcK?=
 =?us-ascii?Q?/45Tk6uE/cPwD2CzpfZBJRr/BCAYadO5tGsqccFctiJ2Z/iHoxMul3p3TeWN?=
 =?us-ascii?Q?fc3BcoZmCHiBcYZgaHC3Akl90zBRpNUaMdcY/YAt27Lr5C35kViNCKZOiyjx?=
 =?us-ascii?Q?xNWRiksOMITgdYSmAy7wutYk4WOtWiwIZ3c0DvMMr9hOXkgwjEqPhEdsjxpg?=
 =?us-ascii?Q?2fIAWCf8v1yAkGu372P5XIbXWakQzPqIYnAeJNVp7hFs111jQtMDm+ZIjvzC?=
 =?us-ascii?Q?+srb6ALdJN9LEvyppPrp1AE+XE9tcao2LJNvhPTMQJnuR3PSPBYRxEEg4fYo?=
 =?us-ascii?Q?NCoCYTOesFXc3yROMIYcrr9WBu0qmXg4TX5s02rcNg4i1hofabhysQ89aUOl?=
 =?us-ascii?Q?mGWl24stXiSdwblOZcbzApWrlvKiMDVyuunVR8Dw5ucW0KBprVZnaZifqCPh?=
 =?us-ascii?Q?eDBoOKjMkTal1yU9Vs9Y1gqG5QWP82u28HAdnBdbFEzbFoKeJXFI+HDzwVwr?=
 =?us-ascii?Q?mXyqiNLYckY2l0yTSloPwzHbyGpQjYQDeg/vcajU3qKSKR7XkPXlINPlBeaB?=
 =?us-ascii?Q?/4rCwt/uJYC5IodPND4IatnB4agqjGj6JtiuTeprkZSzqP9R4FczFKuDucAH?=
 =?us-ascii?Q?z2uBkvM/YEUVtymR0QegPU2dW6JTTm7KoFzHNujryVBQqb5E65Hj5VbuuuMA?=
 =?us-ascii?Q?rVuf63qYGB64fua8R1BMkouiDbK8D21Uo0vzbWU8yH4B+RWxAIl/1x4qBFq8?=
 =?us-ascii?Q?7rMe90nGzsP8S/QxheNPTb6wd4g8QHN65ksKvf649xP8ty5CwTKS8t3npbW8?=
 =?us-ascii?Q?nkXa9zD71DZaaTka96ZqF3TlJHdah+MmJdm1VgTOYbVnh7xxBfrOx4ePHN73?=
 =?us-ascii?Q?UnkNCB4lhZD9sXPKtUl3dO/+XlEfe+qCWu1v+rKu8FCkd7igCgDNONKJZCBx?=
 =?us-ascii?Q?qZiS+5xRWVU631CNZ4n2DLbAo3fzICIMGk9Pvk0WWPLlccobzie7e996c/Ck?=
 =?us-ascii?Q?l6hOUUDAoRmChDurLrNxQTFzm8G2Eafevr8iusqwkEH/H5+0bviJO4OyF+yk?=
 =?us-ascii?Q?aX/Z1NWf50cilm7CpUldnbuEX+ThO6MSmhY8CCEp9Tg8BRXJTWdH2fMjjNrV?=
 =?us-ascii?Q?NFR89c9RsaF3zlS28YaJhHGRIMDbkmZeHKBX14lyOnBQMXsLpn2Z1wIYeqQ5?=
 =?us-ascii?Q?9E5DRXUTlTLC0BbrfYd2Z3RobHFw7zwom/U6qSl7P7HK+QZs7Ei4DSeHBQig?=
 =?us-ascii?Q?tx/Zay4hjB/y3Hj9/aRG?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aeff1f-224b-406c-535f-08daa0279aa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 01:28:38.4416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB3887
X-Mailman-Approved-At: Tue, 27 Sep 2022 07:14:26 +0000
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "chin-ting_kuo@aspeedtech.com" <chin-ting_kuo@aspeedtech.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "haibo.chen@nxp.com" <haibo.chen@nxp.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "yuenn@google.com" <yuenn@google.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "john.garry@huawei.com" <john.garry@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "clg@kaod.org" <clg@kaod.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "venture@google.com" <venture@google.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "Claudiu.Beznea@microchip.com" <Claudiu.Beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] spi: Replace `dummy.nbytes` with
	`dummy.ncycles`
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
Content-Type: multipart/mixed; boundary="===============7127330313061188336=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7127330313061188336==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR17MB33757968B536CFF8072474FDB8559MN2PR17MB3375namp_"

--_000_MN2PR17MB33757968B536CFF8072474FDB8559MN2PR17MB3375namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Why don't u discuss getting ur country out of poverty
________________________________
From: Vanessa Page
Sent: Monday, September 26, 2022 9:27 PM
To: Serge Semin <fancer.lancer@gmail.com>; Sergiu.Moga@microchip.com <Sergi=
u.Moga@microchip.com>; Mark Brown <broonie@kernel.org>; Tudor Ambarus <tudo=
r.ambarus@microchip.com>; Pratyush Yadav <pratyush@kernel.org>; Michael Wal=
le <michael@walle.cc>
Cc: miquel.raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <=
richard@nod.at>; vigneshr@ti.com <vigneshr@ti.com>; Nicolas.Ferre@microchip=
.com <Nicolas.Ferre@microchip.com>; alexandre.belloni@bootlin.com <alexandr=
e.belloni@bootlin.com>; Claudiu.Beznea@microchip.com <Claudiu.Beznea@microc=
hip.com>; chin-ting_kuo@aspeedtech.com <chin-ting_kuo@aspeedtech.com>; clg@=
kaod.org <clg@kaod.org>; joel@jms.id.au <joel@jms.id.au>; andrew@aj.id.au <=
andrew@aj.id.au>; kdasu.kdev@gmail.com <kdasu.kdev@gmail.com>; han.xu@nxp.c=
om <han.xu@nxp.com>; john.garry@huawei.com <john.garry@huawei.com>; matthia=
s.bgg@gmail.com <matthias.bgg@gmail.com>; avifishman70@gmail.com <avifishma=
n70@gmail.com>; tmaimon77@gmail.com <tmaimon77@gmail.com>; tali.perry1@gmai=
l.com <tali.perry1@gmail.com>; venture@google.com <venture@google.com>; yue=
nn@google.com <yuenn@google.com>; benjaminfair@google.com <benjaminfair@goo=
gle.com>; haibo.chen@nxp.com <haibo.chen@nxp.com>; yogeshgaur.83@gmail.com =
<yogeshgaur.83@gmail.com>; heiko@sntech.de <heiko@sntech.de>; mcoquelin.stm=
32@gmail.com <mcoquelin.stm32@gmail.com>; alexandre.torgue@foss.st.com <ale=
xandre.torgue@foss.st.com>; michal.simek@xilinx.com <michal.simek@xilinx.co=
m>; bcm-kernel-feedback-list@broadcom.com <bcm-kernel-feedback-list@broadco=
m.com>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; linu=
x-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-spi@vger.ker=
nel.org <linux-spi@vger.kernel.org>; linux-arm-kernel@lists.infradead.org <=
linux-arm-kernel@lists.infradead.org>; linux-aspeed@lists.ozlabs.org <linux=
-aspeed@lists.ozlabs.org>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.o=
rg>; linux-mediatek@lists.infradead.org <linux-mediatek@lists.infradead.org=
>; linux-rockchip@lists.infradead.org <linux-rockchip@lists.infradead.org>;=
 linux-stm32@st-md-mailman.stormreply.com <linux-stm32@st-md-mailman.stormr=
eply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`

Poverty minds kill
________________________________
From: Vanessa Page
Sent: Monday, September 26, 2022 9:27 PM
To: Serge Semin <fancer.lancer@gmail.com>; Sergiu.Moga@microchip.com <Sergi=
u.Moga@microchip.com>; Mark Brown <broonie@kernel.org>; Tudor Ambarus <tudo=
r.ambarus@microchip.com>; Pratyush Yadav <pratyush@kernel.org>; Michael Wal=
le <michael@walle.cc>
Cc: miquel.raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <=
richard@nod.at>; vigneshr@ti.com <vigneshr@ti.com>; Nicolas.Ferre@microchip=
.com <Nicolas.Ferre@microchip.com>; alexandre.belloni@bootlin.com <alexandr=
e.belloni@bootlin.com>; Claudiu.Beznea@microchip.com <Claudiu.Beznea@microc=
hip.com>; chin-ting_kuo@aspeedtech.com <chin-ting_kuo@aspeedtech.com>; clg@=
kaod.org <clg@kaod.org>; joel@jms.id.au <joel@jms.id.au>; andrew@aj.id.au <=
andrew@aj.id.au>; kdasu.kdev@gmail.com <kdasu.kdev@gmail.com>; han.xu@nxp.c=
om <han.xu@nxp.com>; john.garry@huawei.com <john.garry@huawei.com>; matthia=
s.bgg@gmail.com <matthias.bgg@gmail.com>; avifishman70@gmail.com <avifishma=
n70@gmail.com>; tmaimon77@gmail.com <tmaimon77@gmail.com>; tali.perry1@gmai=
l.com <tali.perry1@gmail.com>; venture@google.com <venture@google.com>; yue=
nn@google.com <yuenn@google.com>; benjaminfair@google.com <benjaminfair@goo=
gle.com>; haibo.chen@nxp.com <haibo.chen@nxp.com>; yogeshgaur.83@gmail.com =
<yogeshgaur.83@gmail.com>; heiko@sntech.de <heiko@sntech.de>; mcoquelin.stm=
32@gmail.com <mcoquelin.stm32@gmail.com>; alexandre.torgue@foss.st.com <ale=
xandre.torgue@foss.st.com>; michal.simek@xilinx.com <michal.simek@xilinx.co=
m>; bcm-kernel-feedback-list@broadcom.com <bcm-kernel-feedback-list@broadco=
m.com>; linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; linu=
x-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-spi@vger.ker=
nel.org <linux-spi@vger.kernel.org>; linux-arm-kernel@lists.infradead.org <=
linux-arm-kernel@lists.infradead.org>; linux-aspeed@lists.ozlabs.org <linux=
-aspeed@lists.ozlabs.org>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.o=
rg>; linux-mediatek@lists.infradead.org <linux-mediatek@lists.infradead.org=
>; linux-rockchip@lists.infradead.org <linux-rockchip@lists.infradead.org>;=
 linux-stm32@st-md-mailman.stormreply.com <linux-stm32@st-md-mailman.stormr=
eply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`

You rape infested ass poverty ass dirt niggs
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Serge =
Semin <fancer.lancer@gmail.com>
Sent: Monday, September 26, 2022 1:24 PM
To: Sergiu.Moga@microchip.com <Sergiu.Moga@microchip.com>; Mark Brown <broo=
nie@kernel.org>; Tudor Ambarus <tudor.ambarus@microchip.com>; Pratyush Yada=
v <pratyush@kernel.org>; Michael Walle <michael@walle.cc>
Cc: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>; pratyush@ker=
nel.org <pratyush@kernel.org>; michael@walle.cc <michael@walle.cc>; miquel.=
raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <richard@nod=
.at>; vigneshr@ti.com <vigneshr@ti.com>; broonie@kernel.org <broonie@kernel=
.org>; Nicolas.Ferre@microchip.com <Nicolas.Ferre@microchip.com>; alexandre=
.belloni@bootlin.com <alexandre.belloni@bootlin.com>; Claudiu.Beznea@microc=
hip.com <Claudiu.Beznea@microchip.com>; chin-ting_kuo@aspeedtech.com <chin-=
ting_kuo@aspeedtech.com>; clg@kaod.org <clg@kaod.org>; joel@jms.id.au <joel=
@jms.id.au>; andrew@aj.id.au <andrew@aj.id.au>; kdasu.kdev@gmail.com <kdasu=
.kdev@gmail.com>; han.xu@nxp.com <han.xu@nxp.com>; john.garry@huawei.com <j=
ohn.garry@huawei.com>; matthias.bgg@gmail.com <matthias.bgg@gmail.com>; avi=
fishman70@gmail.com <avifishman70@gmail.com>; tmaimon77@gmail.com <tmaimon7=
7@gmail.com>; tali.perry1@gmail.com <tali.perry1@gmail.com>; venture@google=
.com <venture@google.com>; yuenn@google.com <yuenn@google.com>; benjaminfai=
r@google.com <benjaminfair@google.com>; haibo.chen@nxp.com <haibo.chen@nxp.=
com>; yogeshgaur.83@gmail.com <yogeshgaur.83@gmail.com>; heiko@sntech.de <h=
eiko@sntech.de>; mcoquelin.stm32@gmail.com <mcoquelin.stm32@gmail.com>; ale=
xandre.torgue@foss.st.com <alexandre.torgue@foss.st.com>; michal.simek@xili=
nx.com <michal.simek@xilinx.com>; bcm-kernel-feedback-list@broadcom.com <bc=
m-kernel-feedback-list@broadcom.com>; linux-mtd@lists.infradead.org <linux-=
mtd@lists.infradead.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.k=
ernel.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; linux-ar=
m-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-=
aspeed@lists.ozlabs.org <linux-aspeed@lists.ozlabs.org>; openbmc@lists.ozla=
bs.org <openbmc@lists.ozlabs.org>; linux-mediatek@lists.infradead.org <linu=
x-mediatek@lists.infradead.org>; linux-rockchip@lists.infradead.org <linux-=
rockchip@lists.infradead.org>; linux-stm32@st-md-mailman.stormreply.com <li=
nux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`

@Mark, @Tudor, @Pratyush, @Michael could you please join the
discussion regarding the dummy.buswidth and dummy.dtr fields in the
spi_mem_op structure?

On Mon, Sep 26, 2022 at 09:05:49AM +0000, Sergiu.Moga@microchip.com wrote:
> On 26.09.2022 01:03, Serge Semin wrote:
> > Hello Sergiu
> >

Sergiu, you didn't address all my comments. Please be more attentive.

>
>
> Hello Serge,
>
>
> > On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
> >> In order to properly represent the hardware functionality
> >> in the core, avoid reconverting the number of dummy cycles
> >> to the number of bytes and only work with the former.
> >> Instead, let the drivers that do need this conversion do
> >> it themselves.
> >>
> >> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> >> ---
> >>   drivers/mtd/spi-nor/core.c        | 22 ++++----------
> >
> > [...]
> >
> >>   drivers/spi/spi-dw-core.c         | 10 +++++--
> >
> > [...]
> >
> >>   drivers/spi/spi-mem.c             | 27 +++++++++++------
> >
> > [...]
> >
> >>   drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++------------=
--
> >
> > [...]
> >
> >>   drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
> >>   drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
> >>   include/linux/spi/spi-mem.h       | 10 +++----
> >>   25 files changed, 234 insertions(+), 147 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index f2c64006f8d7..cc8ca824f912 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *n=
or,
> >>        if (op->addr.nbytes)
> >>                op->addr.buswidth =3D spi_nor_get_protocol_addr_nbits(p=
roto);
> >>
> >
> >
> >
> >> -     if (op->dummy.nbytes)
> >> +     if (op->dummy.ncycles)
> >>                op->dummy.buswidth =3D spi_nor_get_protocol_addr_nbits(=
proto);
> >>
> >>        if (op->data.nbytes)
> >> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor =
*nor,
> >>                op->dummy.dtr =3D true;
> >>                op->data.dtr =3D true;
> >>
> >> -             /* 2 bytes per clock cycle in DTR mode. */
> >> -             op->dummy.nbytes *=3D 2;
> >> -
> >>                ext =3D spi_nor_get_cmd_ext(nor, op);
> >>                op->cmd.opcode =3D (op->cmd.opcode << 8) | ext;
> >>                op->cmd.nbytes =3D 2;
> >> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct sp=
i_nor *nor, loff_t from,
> >>
> >>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op.dummy.nbytes *=3D 2;
> >> +     op.dummy.ncycles =3D nor->read_dummy;
> >
> > So according to this modification and what is done in the rest of the
> > patch, the dummy part of the SPI-mem operations now contains the number
> > of cycles only. Am I right to think that it means a number of dummy
> > clock oscillations? (Judging from what I've seen in the HW-manuals of
> > the SPI NOR memory devices most likely I am...)
>
>
>
> Yes, you are correct.
>
>
> > If so the "ncycles" field
> > is now free from the "data" semantic. Then what is the meaning of the
> > "buswidth and "dtr" fields in the spi_mem_op.dummy field?
> >
>
>

> It is still meaningful as it is used for the conversion by some drivers
> to nbytes and I do not see how it goes out of the specification in any
> way. So, at least for now, I do not see any reason to remove these fields=
.

I do see the way these fields are used in the SPI-mem drivers. I was
wondering what do these bits mean in the framework of the SPI-mem
core? AFAICS from the specification the dummy cycles are irrelevant to
the data bus state. It says "the master tri-states the bus during
'dummy' cycles." If so I don't see a reason to have the DTR and
buswidth fields in the spi_mem_op structure anymore. The number of
cycles could be calculated right on the initialization stage based on
the SPI NOR/NAND requirements.

@Mark, @Tudor, @Pratyush, what do you think?

>
>
> >>
> >>        usebouncebuf =3D spi_nor_spimem_bounce(nor, &op);
> >>
> >> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >>
> >>                if (nor->reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR) {
> >>                        op.addr.nbytes =3D nor->params->rdsr_addr_nbyte=
s;
> >> -                     op.dummy.nbytes =3D nor->params->rdsr_dummy;
> >> +                     op.dummy.ncycles =3D nor->params->rdsr_dummy;
> >>                        /*
> >>                         * We don't want to read only one byte in DTR m=
ode. So,
> >>                         * read 2 and then discard the second byte.
> >> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct s=
pi_nor *nor,
> >>
> >>        spi_nor_spimem_setup_op(nor, &op, read->proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op.dummy.nbytes =3D (nor->read_dummy * op.dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op.dummy.nbytes *=3D 2;
> >> +     op.dummy.ncycles =3D nor->read_dummy;
> >>
> >>        return spi_nor_spimem_check_op(nor, &op);
> >>   }
> >> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct sp=
i_nor *nor)
> >>
> >>        spi_nor_spimem_setup_op(nor, op, nor->read_proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op->dummy.nbytes =3D (nor->read_dummy * op->dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op->dummy.nbytes *=3D 2;
> >> +     op->dummy.ncycles =3D nor->read_dummy;
> >>
> >>        /*
> >>         * Since spi_nor_spimem_setup_op() only sets buswidth when the =
number
> >
> > [...]
> >
> >> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> >> index f87d97ccd2d6..0ba5c7d0e66e 100644
> >> --- a/drivers/spi/spi-dw-core.c
> >> +++ b/drivers/spi/spi-dw-core.c
> >> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_me=
m *mem,
> >>   static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_=
mem_op *op)
> >>   {
> >>        unsigned int i, j, len;
> >> -     u8 *out;
> >> +     u8 *out, dummy_nbytes;
> >>
> >>        /*
> >>         * Calculate the total length of the EEPROM command transfer an=
d
> >>         * either use the pre-allocated buffer or create a temporary on=
e.
> >>         */
> >> -     len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> >
> >> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >
> > 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since
> > you are adding a similar modification to so many drivers what about usi=
ng
> > that macro there too?
> >
>
>

> AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per
> byte an arch has. Although, there is no place in the kernel from what I
> can see that has BITS_PER_BYTE with a value other than 8, you cannot
> deny that there exist architectures whose number of bits per byte may be
> different from 8.

Judging by the way the macro is declared it isn't platform specific.
So no, the kernel always expects the byte having eight bits.

>
> Meanwhile, the JESD216E specification tells us in the Terms and
> definitions chapter that
> "DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building
> block for headers and parameter tables." So it explicitly says that a
> byte has 8 bits regardless of the arch.

Right. That's what the BITS_PER_BYTE macro is for.

>
> Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro
> as, IMO, it does not represent the same thing as the number of bits per
> byte that the terms and definitions of the JESD216E specification refer t=
o.

It represents exactly the same in include/linux/bits.h .

Ideally it would be good to use it in all your updates since you touch
the corresponding parts anyway. But at the very least I would insist on
using the macro in the drivers which already have it utilized like
spi-dw-*, spi-mtk-snfi, spi-mtk-nor.

>
>
> > 2. buswidth is supposed to be always 1 in this driver (see the
> > dw_spi_supports_mem_op() method). So it can be dropped from the
> > statement above.
> >
> > 3. Since the ncycles now contains a number of clock cycles there is no
> > point in taking the SPI bus-width into account at all. What is
> > meaningful is how many oscillations are supposed to be placed on the
> > CLK line before the data is available. So the op->dummy.ncycles /
> > BITS_PER_BYTE statement would be more appropriate here in any case.
> >
>
>

> I can agee with this in the case of this driver, sure.

Ok. thanks.

>
>
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > DTR is unsupported by the controller. See, no spi_controller_mem_caps
> > initialized. So this part is redundant. The same is most likely
> > applicable for some of the DTR-related updates in this patch too
> > since the spi_controller_mem_caps structure is initialized in a few
> > drivers only.
> >
>
>

> Agreed. Initially, wherever I was not sure, I just placed this if
> condition to avoid breaking anything in case the driver does support
> DTR. The same goes for your other related observations to other driver
> modifications, with which I agree :).

AFAICS the only drivers which support the DTR-capable transfers are
the ones having the spi_controller_mem_caps structure defined with dtr
set to true or the ones with custom SPI-mem ops. It means that the
DTR-transfers are supported by the spi-mtk-snfi.c, spi-mxic.c,
spi-cadence-quadspi.c and spi-intel.c drivers only. The rest of the
SPI-controller drivers will fail to execute the SPI-mem ops with dtr
flag set due to the spi_mem_default_supports_op() method semantics.

>
>
> >> +
> >> +     len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> >>                len +=3D op->data.nbytes;
> >>
> >> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws,=
 const struct spi_mem_op *op)
> >>                out[i] =3D DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbyt=
es - i - 1);
> >>        for (j =3D 0; j < op->addr.nbytes; ++i, ++j)
> >>                out[i] =3D DW_SPI_GET_BYTE(op->addr.val, op->addr.nbyte=
s - j - 1);
> >> -     for (j =3D 0; j < op->dummy.nbytes; ++i, ++j)
> >> +     for (j =3D 0; j < dummy_nbytes; ++i, ++j)
> >>                out[i] =3D 0x0;
> >>
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> >
> > [...]
> >
> >> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> >> index 0c79193d9697..7b204963bb62 100644
> >> --- a/drivers/spi/spi-mem.c
> >> +++ b/drivers/spi/spi-mem.c
> >> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem =
*mem,
> >>            spi_check_buswidth_req(mem, op->addr.buswidth, true))
> >>                return false;
> >>
> >> -     if (op->dummy.nbytes &&
> >> +     if (op->dummy.ncycles &&
> >>            spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> >>                return false;
> >>
> >> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_o=
p *op)
> >>                return -EINVAL;
> >>
> >>        if ((op->addr.nbytes && !op->addr.buswidth) ||
> >> -         (op->dummy.nbytes && !op->dummy.buswidth) ||
> >> +         (op->dummy.ncycles && !op->dummy.buswidth) ||
> >>            (op->data.nbytes && !op->data.buswidth))
> >>                return -EINVAL;
> >>
> >> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const str=
uct spi_mem_op *op)
> >
> >>        struct spi_controller *ctlr =3D mem->spi->controller;
> >>        struct spi_transfer xfers[4] =3D { };
> >>        struct spi_message msg;
> >> -     u8 *tmpbuf;
> >> +     u8 *tmpbuf, dummy_nbytes;
> >>        int ret;
> >

> > Reverse xmas tree order?

Please take this note into account. Preserving the locally defined
coding-style convention is a very useful practice. It retains the code
uniformity, which improves readability and maintainability for just no
price.

> >
> >>
> >>        ret =3D spi_mem_check_op(op);
> >> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const st=
ruct spi_mem_op *op)
> >>                        return ret;
> >>        }
> >>
> >
> >> -     tmpbufsize =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbyt=
es;
> >> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >
> > So ncycles now indeed is a number of CLK line oscillations. This most
> > likely will break the SPI Nand driver then, which still passes the
> > number of bytes to the SPI_MEM_OP_DUMMY() macro.
> >
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > Generic SPI-mem ops don't take the DTR mode into account. So I don't
> > see this necessary.
> >
>
>

> You may be right, but this part of the code does take into consideration
> the number of dummy.nbytes to calculate the xfer length. Therefore,
> shouldn't this code block also know if the number of dummy nbytes is
> actually double the amount that it calculated through the conversion
> formula?

Ok. This part turns to be debatable indeed. On the first glance the
SPI-mem core doesn't anyhow handles the DTR-flag value. On the other
hand SPI-controllers may have the dtr-capability flag set thus, for
instance implicitly supporting the DTR transfers. Finally currently
all the DTR-aware drivers are known to have the custom SPI-mem ops
defined. So some aspects say for dropping the dummy.dtr field usage
from here, some say against it. I'll leave it for you and @Mark,
@Tudor, @Pratyush to decide.

>
>
> >> +
> >> +     tmpbufsize =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>
> >>        /*
> >>         * Allocate a buffer to transmit the CMD, ADDR cycles with kmal=
loc() so
> >> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const s=
truct spi_mem_op *op)
> >>                totalxferlen +=3D op->addr.nbytes;
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> -             memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nby=
tes);
> >> +     if (dummy_nbytes) {
> >> +             memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes)=
;
> >>                xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
> >> -             xfers[xferpos].len =3D op->dummy.nbytes;
> >> +             xfers[xferpos].len =3D dummy_nbytes;
> >>                xfers[xferpos].tx_nbits =3D op->dummy.buswidth;
> >>                xfers[xferpos].dummy_data =3D 1;
> >>                spi_message_add_tail(&xfers[xferpos], &msg);
> >>                xferpos++;
> >> -             totalxferlen +=3D op->dummy.nbytes;
> >> +             totalxferlen +=3D dummy_nbytes;
> >>        }
> >>
> >>        if (op->data.nbytes) {
> >> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, =
struct spi_mem_op *op)
> >>   {
> >
> >>        struct spi_controller *ctlr =3D mem->spi->controller;
> >>        size_t len;
> >> +     u8 dummy_nbytes;
> >

> > reverse xmas tree?

Please retain the local coding style convention.

> >
> >>
> >>        if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
> >>                return ctlr->mem_ops->adjust_op_size(mem, op);
> >>
> >> +     dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >> +
> >>        if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
> >> -             len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nby=
tes;
> >> +             len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>
> >>                if (len > spi_max_transfer_size(mem->spi))
> >>                        return -EINVAL;
> >
> > [...]
> >
> >> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> >> index d167699a1a96..f6870c6e911a 100644
> >> --- a/drivers/spi/spi-mtk-nor.c
> >> +++ b/drivers/spi/spi-mtk-nor.c
> >> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, cons=
t struct spi_mem_op *op)
> >>
> >>   static bool mtk_nor_match_read(const struct spi_mem_op *op)
> >>   {
> >> -     int dummy =3D 0;
> >> -
> >> -     if (op->dummy.nbytes)
> >> -             dummy =3D op->dummy.nbytes * BITS_PER_BYTE / op->dummy.b=
uswidth;
> >> -
> >>        if ((op->data.buswidth =3D=3D 2) || (op->data.buswidth =3D=3D 4=
)) {
> >>                if (op->addr.buswidth =3D=3D 1)
> >> -                     return dummy =3D=3D 8;
> >> +                     return op->dummy.ncycles =3D=3D 8;
> >>                else if (op->addr.buswidth =3D=3D 2)
> >> -                     return dummy =3D=3D 4;
> >> +                     return op->dummy.ncycles =3D=3D 4;
> >>                else if (op->addr.buswidth =3D=3D 4)
> >> -                     return dummy =3D=3D 6;
> >> +                     return op->dummy.ncycles =3D=3D 6;
> >>        } else if ((op->addr.buswidth =3D=3D 1) && (op->data.buswidth =
=3D=3D 1)) {
> >>                if (op->cmd.opcode =3D=3D 0x03)
> >> -                     return dummy =3D=3D 0;
> >> +                     return op->dummy.ncycles =3D=3D 0;
> >>                else if (op->cmd.opcode =3D=3D 0x0b)
> >> -                     return dummy =3D=3D 8;
> >> +                     return op->dummy.ncycles =3D=3D 8;
> >>        }
> >>        return false;
> >>   }
> >> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_m=
em_op *op)
> >>   static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>   {
> >>        int tx_len, rx_len, prg_len, prg_left;
> >


> >> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8=
;
> >> +
> >
> > IMO it's better to move the initialization statement to a separate
> > line here.

Again. The initialization statement is too long. It makes the code
harder to read. Just split the declaration and initialization up.

> >
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >

> > Does the MTK SPI driver support DTR? AFAICS it doesn't.

I'll give an answer. It doesn't. The spi_mem_exec_op() will return the
-ENOTSUPP error if an SPI-mem op with any dtr flag set is requested.

> >
> >>
> >>        // prg mode is spi-only.
> >>        if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
> >> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem=
_op *op)
> >>
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
> >>                // count dummy bytes only if we need to write data afte=
r it
> >> -             tx_len +=3D op->dummy.nbytes;
> >> +             tx_len +=3D dummy_nbytes;
> >>
> >>                // leave at least one byte for data
> >>                if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
> >> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem=
_op *op)
> >>                        return false;
> >>
> >>                rx_len =3D op->data.nbytes;
> >> -             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dumm=
y.nbytes;
> >> +             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nb=
ytes;
> >>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
> >>                        prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;
> >>                if (rx_len > prg_left) {
> >> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_m=
em_op *op)
> >>                        rx_len =3D prg_left;
> >>                }
> >>
> >> -             prg_len =3D tx_len + op->dummy.nbytes + rx_len;
> >> +             prg_len =3D tx_len + dummy_nbytes + rx_len;
> >>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
> >>                        return false;
> >>        } else {
> >> -             prg_len =3D tx_len + op->dummy.nbytes;
> >> +             prg_len =3D tx_len + dummy_nbytes;
> >>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
> >>                        return false;
> >>        }
> >> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_m=
em_op *op)
> >>   static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
> >>   {
> >>        int tx_len, tx_left, prg_left;
> >
> >> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8=
;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > ditto
> >
> >>
> >>        tx_len =3D op->cmd.nbytes + op->addr.nbytes;
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
> >> -             tx_len +=3D op->dummy.nbytes;
> >> +             tx_len +=3D dummy_nbytes;
> >>                tx_left =3D MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
> >>                if (op->data.nbytes > tx_left)
> >>                        op->data.nbytes =3D tx_left;
> >>        } else if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
> >> -             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dumm=
y.nbytes;
> >> +             prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nb=
ytes;
> >>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
> >>                        prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;
> >>                if (op->data.nbytes > prg_left)
> >> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *me=
m,
> >>                        break;
> >>                case SPI_MEM_DATA_OUT:
> >>                        if ((op->addr.buswidth =3D=3D 1) &&
> >> -                         (op->dummy.nbytes =3D=3D 0) &&
> >> +                         (op->dummy.ncycles =3D=3D 0) &&
> >>                            (op->data.buswidth =3D=3D 1))
> >>                                return true;
> >>                        break;
> >> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *s=
p, const struct spi_mem_op *op)
> >>        int tx_len, prg_len;
> >>        int i, ret;
> >>        void __iomem *reg;
> >
> >> -     u8 bufbyte;
> >> +     u8 bufbyte, dummy_nbytes =3D (op->dummy.ncycles * op->dummy.busw=
idth) / 8;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > ditto
> >
> >>
> >>        tx_len =3D op->cmd.nbytes + op->addr.nbytes;
> >>
> >>        // count dummy bytes only if we need to write data after it
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> >> -             tx_len +=3D op->dummy.nbytes + op->data.nbytes;
> >> +             tx_len +=3D dummy_nbytes + op->data.nbytes;
> >>        else if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> >>                rx_len =3D op->data.nbytes;
> >>
> >> -     prg_len =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes =
+
> >> +     prg_len =3D op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
> >>                  op->data.nbytes;
> >>
> >>        // an invalid op may reach here if the caller calls exec_op wit=
hout
> >> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp,=
 const struct spi_mem_op *op)
> >>        }
> >>
> >>        if (op->data.dir =3D=3D SPI_MEM_DATA_OUT) {
> >> -             for (i =3D 0; i < op->dummy.nbytes; i++, reg_offset--) {
> >> +             for (i =3D 0; i < dummy_nbytes; i++, reg_offset--) {
> >>                        reg =3D sp->base + MTK_NOR_REG_PRGDATA(reg_offs=
et);
> >>                        writeb(0, reg);
> >>                }
> >
> > [...]
> >
> >> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> >> index 78f31b61a2aa..84b7db85548c 100644
> >> --- a/drivers/spi/spi-zynq-qspi.c
> >> +++ b/drivers/spi/spi-zynq-qspi.c
> >> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *=
mem,
> >>   {
> >>        struct zynq_qspi *xqspi =3D spi_controller_get_devdata(mem->spi=
->master);
> >>        int err =3D 0, i;

> >> -     u8 *tmpbuf;
> >> +     u8 *tmpbuf, dummy_nbytes =3D (op->dummy.ncycles * op->dummy.busw=
idth) / 8;
> >
> > Separate line?

Too long. Split the declaration and initialization up.

> >
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > Is DTR supported by the driver?
> >
>
>

> Not from what I can see, but I was not 100% sure so I placed this if
> statement here just in case.

spi_mem_default_supports_op() will return false for the DTR-available
transfers anyway. So the spi_mem_exec_op() method will fail right at
the start and this part will never be executed if the DTR-mode is
requested.

-Sergey

>
>
>
> >>
> >>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> >>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> >> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem =
*mem,
> >>                        err =3D -ETIMEDOUT;
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> -             tmpbuf =3D kzalloc(op->dummy.nbytes, GFP_KERNEL);
> >> +     if (dummy_nbytes) {
> >> +             tmpbuf =3D kzalloc(dummy_nbytes, GFP_KERNEL);
> >>                if (!tmpbuf)
> >>                        return -ENOMEM;
> >>
> >> -             memset(tmpbuf, 0xff, op->dummy.nbytes);
> >> +             memset(tmpbuf, 0xff, dummy_nbytes);
> >>                reinit_completion(&xqspi->data_completion);
> >>                xqspi->txbuf =3D tmpbuf;
> >>                xqspi->rxbuf =3D NULL;
> >> -             xqspi->tx_bytes =3D op->dummy.nbytes;
> >> -             xqspi->rx_bytes =3D op->dummy.nbytes;
> >> +             xqspi->tx_bytes =3D dummy_nbytes;
> >> +             xqspi->rx_bytes =3D dummy_nbytes;
> >>                zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> >>                zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> >>                                ZYNQ_QSPI_IXR_RXTX_MASK);
> >> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-g=
qspi.c
> >> index c760aac070e5..b41abadef9a6 100644
> >> --- a/drivers/spi/spi-zynqmp-gqspi.c
> >> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> >> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *me=
m,
> >>        u32 genfifoentry =3D 0;
> >>        u16 opcode =3D op->cmd.opcode;
> >>        u64 opaddr;
> >
> >> +     u8 dummy_nbytes =3D (op->dummy.ncycles * op->dummy.buswidth) / 8=
;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *=3D 2;
> >
> > ditto
> >
> >>
> >>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> >>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> >> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem =
*mem,
> >>                }
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> +     if (dummy_nbytes) {
> >>                xqspi->txbuf =3D NULL;
> >>                xqspi->rxbuf =3D NULL;
> >>                /*
> >>                 * xqspi->bytes_to_transfer here represents the dummy c=
ircles
> >>                 * which need to be sent.
> >>                 */
> >> -             xqspi->bytes_to_transfer =3D op->dummy.nbytes * 8 / op->=
dummy.buswidth;
> >> +             xqspi->bytes_to_transfer =3D dummy_nbytes;
> >>                xqspi->bytes_to_receive =3D 0;
> >>                /*
> >>                 * Using op->data.buswidth instead of op->dummy.buswidt=
h here because
> >> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> >> index 2ba044d0d5e5..5fd45800af03 100644
> >> --- a/include/linux/spi/spi-mem.h
> >> +++ b/include/linux/spi/spi-mem.h
> >> @@ -29,9 +29,9 @@
> >>
> >>   #define SPI_MEM_OP_NO_ADDR   { }
> >>
> >
> >> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)                       =
\
> >> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)              \
> >>        {                                                       \
> >
> >> -             .nbytes =3D __nbytes,                             \
> >> +             .ncycles =3D __ncycles,                           \
> >>                .buswidth =3D __buswidth,                         \
> >
> > Please make sure this update and the drivers/spi/spi-mem.c driver
> > alterations are coherent with the SPI Nand driver. See the macro usages=
:
> > include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().
> >
> > -Sergey
> >
>
>
> Yes, indeed, I should have paid more attention here. As I have
> previously said,  I simply replaced dummy.nbytes with the code sequences
> you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well
> since I changed its definition. Thank you! :)
>
>
> >>        }
> >>
> >> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
> >>    *         Note that only @addr.nbytes are taken into account in thi=
s
> >>    *         address value, so users should make sure the value fits i=
n the
> >>    *         assigned number of bytes.
> >> - * @dummy.nbytes: number of dummy bytes to send after an opcode or ad=
dress. Can
> >> - *             be zero if the operation does not require dummy bytes
> >> + * @dummy.ncycles: number of dummy cycles after an opcode or address.=
 Can
> >> + *              be zero if the operation does not require dummy cycle=
s
> >>    * @dummy.buswidth: number of IO lanes used to transmit the dummy by=
tes
> >>    * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or=
 not
> >>    * @data.buswidth: number of IO lanes used to send/receive the data
> >> @@ -112,7 +112,7 @@ struct spi_mem_op {
> >>        } addr;
> >>
> >>        struct {
> >> -             u8 nbytes;
> >> +             u8 ncycles;
> >>                u8 buswidth;
> >>                u8 dtr : 1;
> >>        } dummy;
> >> --
> >> 2.34.1
> >>
>
>
> Regards,
>        Sergiu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--_000_MN2PR17MB33757968B536CFF8072474FDB8559MN2PR17MB3375namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;"></div>
<div style=3D"font-family: inherit; font-size: inherit; color: rgb(0, 0, 0)=
;">Why don&#8217;t u discuss getting ur country out of poverty&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vanessa Page<br>
<b>Sent:</b> Monday, September 26, 2022 9:27 PM<br>
<b>To:</b> Serge Semin &lt;fancer.lancer@gmail.com&gt;; Sergiu.Moga@microch=
ip.com &lt;Sergiu.Moga@microchip.com&gt;; Mark Brown &lt;broonie@kernel.org=
&gt;; Tudor Ambarus &lt;tudor.ambarus@microchip.com&gt;; Pratyush Yadav &lt=
;pratyush@kernel.org&gt;; Michael Walle &lt;michael@walle.cc&gt;<br>
<b>Cc:</b> miquel.raynal@bootlin.com &lt;miquel.raynal@bootlin.com&gt;; ric=
hard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com &lt;vigneshr@ti.com&gt;=
; Nicolas.Ferre@microchip.com &lt;Nicolas.Ferre@microchip.com&gt;; alexandr=
e.belloni@bootlin.com &lt;alexandre.belloni@bootlin.com&gt;; Claudiu.Beznea=
@microchip.com
 &lt;Claudiu.Beznea@microchip.com&gt;; chin-ting_kuo@aspeedtech.com &lt;chi=
n-ting_kuo@aspeedtech.com&gt;; clg@kaod.org &lt;clg@kaod.org&gt;; joel@jms.=
id.au &lt;joel@jms.id.au&gt;; andrew@aj.id.au &lt;andrew@aj.id.au&gt;; kdas=
u.kdev@gmail.com &lt;kdasu.kdev@gmail.com&gt;; han.xu@nxp.com &lt;han.xu@nx=
p.com&gt;;
 john.garry@huawei.com &lt;john.garry@huawei.com&gt;; matthias.bgg@gmail.co=
m &lt;matthias.bgg@gmail.com&gt;; avifishman70@gmail.com &lt;avifishman70@g=
mail.com&gt;; tmaimon77@gmail.com &lt;tmaimon77@gmail.com&gt;; tali.perry1@=
gmail.com &lt;tali.perry1@gmail.com&gt;; venture@google.com &lt;venture@goo=
gle.com&gt;;
 yuenn@google.com &lt;yuenn@google.com&gt;; benjaminfair@google.com &lt;ben=
jaminfair@google.com&gt;; haibo.chen@nxp.com &lt;haibo.chen@nxp.com&gt;; yo=
geshgaur.83@gmail.com &lt;yogeshgaur.83@gmail.com&gt;; heiko@sntech.de &lt;=
heiko@sntech.de&gt;; mcoquelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.co=
m&gt;;
 alexandre.torgue@foss.st.com &lt;alexandre.torgue@foss.st.com&gt;; michal.=
simek@xilinx.com &lt;michal.simek@xilinx.com&gt;; bcm-kernel-feedback-list@=
broadcom.com &lt;bcm-kernel-feedback-list@broadcom.com&gt;; linux-mtd@lists=
.infradead.org &lt;linux-mtd@lists.infradead.org&gt;; linux-kernel@vger.ker=
nel.org
 &lt;linux-kernel@vger.kernel.org&gt;; linux-spi@vger.kernel.org &lt;linux-=
spi@vger.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm=
-kernel@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org &lt;linux-as=
peed@lists.ozlabs.org&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;;
 linux-mediatek@lists.infradead.org &lt;linux-mediatek@lists.infradead.org&=
gt;; linux-rockchip@lists.infradead.org &lt;linux-rockchip@lists.infradead.=
org&gt;; linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mai=
lman.stormreply.com&gt;<br>
<b>Subject:</b> Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles=
`</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:inherit; font-size:inherit; color:rgb(0,0,0)"></d=
iv>
<div style=3D"font-family:inherit; font-size:inherit; color:rgb(0,0,0)">Pov=
erty minds kill&nbsp;</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Vanessa Page<br>
<b>Sent:</b> Monday, September 26, 2022 9:27 PM<br>
<b>To:</b> Serge Semin &lt;fancer.lancer@gmail.com&gt;; Sergiu.Moga@microch=
ip.com &lt;Sergiu.Moga@microchip.com&gt;; Mark Brown &lt;broonie@kernel.org=
&gt;; Tudor Ambarus &lt;tudor.ambarus@microchip.com&gt;; Pratyush Yadav &lt=
;pratyush@kernel.org&gt;; Michael Walle &lt;michael@walle.cc&gt;<br>
<b>Cc:</b> miquel.raynal@bootlin.com &lt;miquel.raynal@bootlin.com&gt;; ric=
hard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com &lt;vigneshr@ti.com&gt;=
; Nicolas.Ferre@microchip.com &lt;Nicolas.Ferre@microchip.com&gt;; alexandr=
e.belloni@bootlin.com &lt;alexandre.belloni@bootlin.com&gt;; Claudiu.Beznea=
@microchip.com
 &lt;Claudiu.Beznea@microchip.com&gt;; chin-ting_kuo@aspeedtech.com &lt;chi=
n-ting_kuo@aspeedtech.com&gt;; clg@kaod.org &lt;clg@kaod.org&gt;; joel@jms.=
id.au &lt;joel@jms.id.au&gt;; andrew@aj.id.au &lt;andrew@aj.id.au&gt;; kdas=
u.kdev@gmail.com &lt;kdasu.kdev@gmail.com&gt;; han.xu@nxp.com &lt;han.xu@nx=
p.com&gt;;
 john.garry@huawei.com &lt;john.garry@huawei.com&gt;; matthias.bgg@gmail.co=
m &lt;matthias.bgg@gmail.com&gt;; avifishman70@gmail.com &lt;avifishman70@g=
mail.com&gt;; tmaimon77@gmail.com &lt;tmaimon77@gmail.com&gt;; tali.perry1@=
gmail.com &lt;tali.perry1@gmail.com&gt;; venture@google.com &lt;venture@goo=
gle.com&gt;;
 yuenn@google.com &lt;yuenn@google.com&gt;; benjaminfair@google.com &lt;ben=
jaminfair@google.com&gt;; haibo.chen@nxp.com &lt;haibo.chen@nxp.com&gt;; yo=
geshgaur.83@gmail.com &lt;yogeshgaur.83@gmail.com&gt;; heiko@sntech.de &lt;=
heiko@sntech.de&gt;; mcoquelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.co=
m&gt;;
 alexandre.torgue@foss.st.com &lt;alexandre.torgue@foss.st.com&gt;; michal.=
simek@xilinx.com &lt;michal.simek@xilinx.com&gt;; bcm-kernel-feedback-list@=
broadcom.com &lt;bcm-kernel-feedback-list@broadcom.com&gt;; linux-mtd@lists=
.infradead.org &lt;linux-mtd@lists.infradead.org&gt;; linux-kernel@vger.ker=
nel.org
 &lt;linux-kernel@vger.kernel.org&gt;; linux-spi@vger.kernel.org &lt;linux-=
spi@vger.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm=
-kernel@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org &lt;linux-as=
peed@lists.ozlabs.org&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;;
 linux-mediatek@lists.infradead.org &lt;linux-mediatek@lists.infradead.org&=
gt;; linux-rockchip@lists.infradead.org &lt;linux-rockchip@lists.infradead.=
org&gt;; linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mai=
lman.stormreply.com&gt;<br>
<b>Subject:</b> Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles=
`</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:inherit; font-size:inherit; color:rgb(0,0,0)"></d=
iv>
<div style=3D"font-family:inherit; font-size:inherit; color:rgb(0,0,0)">You=
 rape infested ass poverty ass dirt niggs</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> linux-mtd &lt;lin=
ux-mtd-bounces@lists.infradead.org&gt; on behalf of Serge Semin &lt;fancer.=
lancer@gmail.com&gt;<br>
<b>Sent:</b> Monday, September 26, 2022 1:24 PM<br>
<b>To:</b> Sergiu.Moga@microchip.com &lt;Sergiu.Moga@microchip.com&gt;; Mar=
k Brown &lt;broonie@kernel.org&gt;; Tudor Ambarus &lt;tudor.ambarus@microch=
ip.com&gt;; Pratyush Yadav &lt;pratyush@kernel.org&gt;; Michael Walle &lt;m=
ichael@walle.cc&gt;<br>
<b>Cc:</b> Tudor.Ambarus@microchip.com &lt;Tudor.Ambarus@microchip.com&gt;;=
 pratyush@kernel.org &lt;pratyush@kernel.org&gt;; michael@walle.cc &lt;mich=
ael@walle.cc&gt;; miquel.raynal@bootlin.com &lt;miquel.raynal@bootlin.com&g=
t;; richard@nod.at &lt;richard@nod.at&gt;; vigneshr@ti.com &lt;vigneshr@ti.=
com&gt;;
 broonie@kernel.org &lt;broonie@kernel.org&gt;; Nicolas.Ferre@microchip.com=
 &lt;Nicolas.Ferre@microchip.com&gt;; alexandre.belloni@bootlin.com &lt;ale=
xandre.belloni@bootlin.com&gt;; Claudiu.Beznea@microchip.com &lt;Claudiu.Be=
znea@microchip.com&gt;; chin-ting_kuo@aspeedtech.com &lt;chin-ting_kuo@aspe=
edtech.com&gt;;
 clg@kaod.org &lt;clg@kaod.org&gt;; joel@jms.id.au &lt;joel@jms.id.au&gt;; =
andrew@aj.id.au &lt;andrew@aj.id.au&gt;; kdasu.kdev@gmail.com &lt;kdasu.kde=
v@gmail.com&gt;; han.xu@nxp.com &lt;han.xu@nxp.com&gt;; john.garry@huawei.c=
om &lt;john.garry@huawei.com&gt;; matthias.bgg@gmail.com &lt;matthias.bgg@g=
mail.com&gt;;
 avifishman70@gmail.com &lt;avifishman70@gmail.com&gt;; tmaimon77@gmail.com=
 &lt;tmaimon77@gmail.com&gt;; tali.perry1@gmail.com &lt;tali.perry1@gmail.c=
om&gt;; venture@google.com &lt;venture@google.com&gt;; yuenn@google.com &lt=
;yuenn@google.com&gt;; benjaminfair@google.com &lt;benjaminfair@google.com&=
gt;;
 haibo.chen@nxp.com &lt;haibo.chen@nxp.com&gt;; yogeshgaur.83@gmail.com &lt=
;yogeshgaur.83@gmail.com&gt;; heiko@sntech.de &lt;heiko@sntech.de&gt;; mcoq=
uelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.com&gt;; alexandre.torgue@f=
oss.st.com &lt;alexandre.torgue@foss.st.com&gt;; michal.simek@xilinx.com
 &lt;michal.simek@xilinx.com&gt;; bcm-kernel-feedback-list@broadcom.com &lt=
;bcm-kernel-feedback-list@broadcom.com&gt;; linux-mtd@lists.infradead.org &=
lt;linux-mtd@lists.infradead.org&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;; linux-spi@vger.kernel.org
 &lt;linux-spi@vger.kernel.org&gt;; linux-arm-kernel@lists.infradead.org &l=
t;linux-arm-kernel@lists.infradead.org&gt;; linux-aspeed@lists.ozlabs.org &=
lt;linux-aspeed@lists.ozlabs.org&gt;; openbmc@lists.ozlabs.org &lt;openbmc@=
lists.ozlabs.org&gt;; linux-mediatek@lists.infradead.org
 &lt;linux-mediatek@lists.infradead.org&gt;; linux-rockchip@lists.infradead=
.org &lt;linux-rockchip@lists.infradead.org&gt;; linux-stm32@st-md-mailman.=
stormreply.com &lt;linux-stm32@st-md-mailman.stormreply.com&gt;<br>
<b>Subject:</b> Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles=
`</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">@Mark, @Tudor, @Pratyush, @Michael could you p=
lease join the<br>
discussion regarding the dummy.buswidth and dummy.dtr fields in the<br>
spi_mem_op structure?<br>
<br>
On Mon, Sep 26, 2022 at 09:05:49AM +0000, Sergiu.Moga@microchip.com wrote:<=
br>
&gt; On 26.09.2022 01:03, Serge Semin wrote:<br>
&gt; &gt; Hello Sergiu<br>
&gt; &gt; <br>
<br>
Sergiu, you didn't address all my comments. Please be more attentive.<br>
<br>
&gt; <br>
&gt; <br>
&gt; Hello Serge,<br>
&gt; <br>
&gt; <br>
&gt; &gt; On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:<br>
&gt; &gt;&gt; In order to properly represent the hardware functionality<br>
&gt; &gt;&gt; in the core, avoid reconverting the number of dummy cycles<br=
>
&gt; &gt;&gt; to the number of bytes and only work with the former.<br>
&gt; &gt;&gt; Instead, let the drivers that do need this conversion do<br>
&gt; &gt;&gt; it themselves.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Sergiu Moga &lt;sergiu.moga@microchip.com&gt;<=
br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/mtd/spi-nor/core.c&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 22 ++++----------<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/spi/spi-dw-core.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++++--<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/spi/spi-mem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 27 +++++++++++------<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/spi/spi-mtk-nor.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 48 +++++++++++++++++--------------<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/spi/spi-zynq-qspi.c&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 15 ++++++----<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/spi/spi-zynqmp-gqspi.c&nbsp;&nbsp;&nbsp; =
|&nbsp; 8 ++++--<br>
&gt; &gt;&gt;&nbsp;&nbsp; include/linux/spi/spi-mem.h&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 10 +++----<br>
&gt; &gt;&gt;&nbsp;&nbsp; 25 files changed, 234 insertions(+), 147 deletion=
s(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor=
/core.c<br>
&gt; &gt;&gt; index f2c64006f8d7..cc8ca824f912 100644<br>
&gt; &gt;&gt; --- a/drivers/mtd/spi-nor/core.c<br>
&gt; &gt;&gt; +++ b/drivers/mtd/spi-nor/core.c<br>
&gt; &gt;&gt; @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct s=
pi_nor *nor,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;addr.nby=
tes)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;addr.buswidth =3D spi_nor_get_protocol_=
addr_nbits(proto);<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.ncycles)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.buswidth =3D spi_nor_get_protocol=
_addr_nbits(proto);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nby=
tes)<br>
&gt; &gt;&gt; @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct=
 spi_nor *nor,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.dtr =3D true;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;data.dtr =3D true;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; /* 2 bytes per clock cycle in DTR mode. */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; op-&gt;dummy.nbytes *=3D 2;<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ext =3D spi_nor_get_cmd_ext(nor, op);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode =3D (op-&gt;cmd.opcode &lt;&=
lt; 8) | ext;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.nbytes =3D 2;<br>
&gt; &gt;&gt; @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(=
struct spi_nor *nor, loff_t from,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setu=
p_op(nor, &amp;op, nor-&gt;read_proto);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the =
number of bytes */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbytes =3D (nor-&gt;read_d=
ummy * op.dummy.buswidth) / 8;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt=
;read_proto))<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; op.dummy.nbytes *=3D 2;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycles =3D nor-&gt;read_d=
ummy;<br>
&gt; &gt; <br>
&gt; &gt; So according to this modification and what is done in the rest of=
 the<br>
&gt; &gt; patch, the dummy part of the SPI-mem operations now contains the =
number<br>
&gt; &gt; of cycles only. Am I right to think that it means a number of dum=
my<br>
&gt; &gt; clock oscillations? (Judging from what I've seen in the HW-manual=
s of<br>
&gt; &gt; the SPI NOR memory devices most likely I am...)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Yes, you are correct.<br>
&gt; <br>
&gt; <br>
&gt; &gt; If so the &quot;ncycles&quot; field<br>
&gt; &gt; is now free from the &quot;data&quot; semantic. Then what is the =
meaning of the<br>
&gt; &gt; &quot;buswidth and &quot;dtr&quot; fields in the spi_mem_op.dummy=
 field?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; It is still meaningful as it is used for the conversion by some driver=
s <br>
&gt; to nbytes and I do not see how it goes out of the specification in any=
 <br>
&gt; way. So, at least for now, I do not see any reason to remove these fie=
lds.<br>
<br>
I do see the way these fields are used in the SPI-mem drivers. I was<br>
wondering what do these bits mean in the framework of the SPI-mem<br>
core? AFAICS from the specification the dummy cycles are irrelevant to<br>
the data bus state. It says &quot;the master tri-states the bus during<br>
'dummy' cycles.&quot; If so I don't see a reason to have the DTR and<br>
buswidth fields in the spi_mem_op structure anymore. The number of<br>
cycles could be calculated right on the initialization stage based on<br>
the SPI NOR/NAND requirements.<br>
<br>
@Mark, @Tudor, @Pratyush, what do you think?<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usebouncebuf =3D sp=
i_nor_spimem_bounce(nor, &amp;op);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, =
u8 *sr)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nor-&gt;reg_proto =3D=3D SNOR_PROTO_8_8_8_=
DTR) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; op.addr.nbytes =3D nor-&gt;params-&gt;rdsr_addr_nbytes;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbyte=
s =3D nor-&gt;params-&gt;rdsr_dummy;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycl=
es =3D nor-&gt;params-&gt;rdsr_dummy;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * We don't want to read only one byte in DTR mode. So,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * read 2 and then discard the second byte.<br>
&gt; &gt;&gt; @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop=
(struct spi_nor *nor,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setu=
p_op(nor, &amp;op, read-&gt;proto);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the =
number of bytes */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.nbytes =3D (nor-&gt;read_d=
ummy * op.dummy.buswidth) / 8;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt=
;read_proto))<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; op.dummy.nbytes *=3D 2;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op.dummy.ncycles =3D nor-&gt;read_d=
ummy;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return spi_nor_spim=
em_check_op(nor, &amp;op);<br>
&gt; &gt;&gt;&nbsp;&nbsp; }<br>
&gt; &gt;&gt; @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(=
struct spi_nor *nor)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_nor_spimem_setu=
p_op(nor, op, nor-&gt;read_proto);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* convert the dummy cycles to the =
number of bytes */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.nbytes =3D (nor-&gt;re=
ad_dummy * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (spi_nor_protocol_is_dtr(nor-&gt=
;read_proto))<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; op-&gt;dummy.nbytes *=3D 2;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;dummy.ncycles =3D nor-&gt;re=
ad_dummy;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Since spi_n=
or_spimem_setup_op() only sets buswidth when the number<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-c=
ore.c<br>
&gt; &gt;&gt; index f87d97ccd2d6..0ba5c7d0e66e 100644<br>
&gt; &gt;&gt; --- a/drivers/spi/spi-dw-core.c<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-dw-core.c<br>
&gt; &gt;&gt; @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(stru=
ct spi_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp; static int dw_spi_init_mem_buf(struct dw_spi *dws=
, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i, j, =
len;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *out;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *out, dummy_nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Calculate t=
he total length of the EEPROM command transfer and<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * either use =
the pre-allocated buffer or create a temporary one.<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;=
addr.nbytes + op-&gt;dummy.nbytes;<br>
&gt; &gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncyc=
les * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt; <br>
&gt; &gt; 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? =
Since<br>
&gt; &gt; you are adding a similar modification to so many drivers what abo=
ut using<br>
&gt; &gt; that macro there too?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits p=
er <br>
&gt; byte an arch has. Although, there is no place in the kernel from what =
I <br>
&gt; can see that has BITS_PER_BYTE with a value other than 8, you cannot <=
br>
&gt; deny that there exist architectures whose number of bits per byte may =
be <br>
&gt; different from 8.<br>
<br>
Judging by the way the macro is declared it isn't platform specific.<br>
So no, the kernel always expects the byte having eight bits.<br>
<br>
&gt; <br>
&gt; Meanwhile, the JESD216E specification tells us in the Terms and <br>
&gt; definitions chapter that<br>
&gt; &quot;DWORD: Four consecutive 8-bit bytes used as the basic 32-bit bui=
lding <br>
&gt; block for headers and parameter tables.&quot; So it explicitly says th=
at a <br>
&gt; byte has 8 bits regardless of the arch.<br>
<br>
Right. That's what the BITS_PER_BYTE macro is for.<br>
<br>
&gt; <br>
&gt; Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macr=
o <br>
&gt; as, IMO, it does not represent the same thing as the number of bits pe=
r <br>
&gt; byte that the terms and definitions of the JESD216E specification refe=
r to.<br>
<br>
It represents exactly the same in include/linux/bits.h .<br>
<br>
Ideally it would be good to use it in all your updates since you touch<br>
the corresponding parts anyway. But at the very least I would insist on<br>
using the macro in the drivers which already have it utilized like<br>
spi-dw-*, spi-mtk-snfi, spi-mtk-nor. <br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; 2. buswidth is supposed to be always 1 in this driver (see the<br=
>
&gt; &gt; dw_spi_supports_mem_op() method). So it can be dropped from the<b=
r>
&gt; &gt; statement above.<br>
&gt; &gt; <br>
&gt; &gt; 3. Since the ncycles now contains a number of clock cycles there =
is no<br>
&gt; &gt; point in taking the SPI bus-width into account at all. What is<br=
>
&gt; &gt; meaningful is how many oscillations are supposed to be placed on =
the<br>
&gt; &gt; CLK line before the data is available. So the op-&gt;dummy.ncycle=
s /<br>
&gt; &gt; BITS_PER_BYTE statement would be more appropriate here in any cas=
e.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; I can agee with this in the case of this driver, sure.<br>
<br>
Ok. thanks.<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; DTR is unsupported by the controller. See, no spi_controller_mem_=
caps<br>
&gt; &gt; initialized. So this part is redundant. The same is most likely<b=
r>
&gt; &gt; applicable for some of the DTR-related updates in this patch too<=
br>
&gt; &gt; since the spi_controller_mem_caps structure is initialized in a f=
ew<br>
&gt; &gt; drivers only.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; Agreed. Initially, wherever I was not sure, I just placed this if <br>
&gt; condition to avoid breaking anything in case the driver does support <=
br>
&gt; DTR. The same goes for your other related observations to other driver=
 <br>
&gt; modifications, with which I agree :).<br>
<br>
AFAICS the only drivers which support the DTR-capable transfers are<br>
the ones having the spi_controller_mem_caps structure defined with dtr<br>
set to true or the ones with custom SPI-mem ops. It means that the<br>
DTR-transfers are supported by the spi-mtk-snfi.c, spi-mxic.c,<br>
spi-cadence-quadspi.c and spi-intel.c drivers only. The rest of the<br>
SPI-controller drivers will fail to execute the SPI-mem ops with dtr<br>
flag set due to the spi_mem_default_supports_op() method semantics.<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;=
addr.nbytes + dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; len +=3D op-&gt;data.nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_=
spi *dws, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D DW_SPI_GET_BYTE(op-&gt;cmd.opcode, =
op-&gt;cmd.nbytes - i - 1);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt=
; op-&gt;addr.nbytes; ++i, ++j)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D DW_SPI_GET_BYTE(op-&gt;addr.val, op=
-&gt;addr.nbytes - j - 1);<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; op-&gt;dummy.n=
bytes; ++i, ++j)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; dummy_nbytes; =
++i, ++j)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; out[i] =3D 0x0;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT)<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c<br=
>
&gt; &gt;&gt; index 0c79193d9697..7b204963bb62 100644<br>
&gt; &gt;&gt; --- a/drivers/spi/spi-mem.c<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-mem.c<br>
&gt; &gt;&gt; @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct=
 spi_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; spi_check_buswidth_req(mem, op-&gt;addr.buswidth, true))<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes &amp;&amp;<=
br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.ncycles &amp;&amp;=
<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; spi_check_buswidth_req(mem, op-&gt;dummy.buswidth, true))<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct =
spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;addr.nb=
ytes &amp;&amp; !op-&gt;addr.buswidth) ||<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (op-&gt;dum=
my.nbytes &amp;&amp; !op-&gt;dummy.buswidth) ||<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (op-&gt;dum=
my.ncycles &amp;&amp; !op-&gt;dummy.buswidth) ||<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (op-&gt;data.nbytes &amp;&amp; !op-&gt;data.buswidth))<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, =
const struct spi_mem_op *op)<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_controll=
er *ctlr =3D mem-&gt;spi-&gt;controller;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_transfer=
 xfers[4] =3D { };<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_message =
msg;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf, dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; <br>
<br>
&gt; &gt; Reverse xmas tree order?<br>
<br>
Please take this note into account. Preserving the locally defined<br>
coding-style convention is a very useful practice. It retains the code<br>
uniformity, which improves readability and maintainability for just no<br>
price.<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D spi_mem_che=
ck_op(op);<br>
&gt; &gt;&gt; @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem,=
 const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return ret;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; tmpbufsize =3D op-&gt;cmd.nbytes + =
op-&gt;addr.nbytes + op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncyc=
les * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt; <br>
&gt; &gt; So ncycles now indeed is a number of CLK line oscillations. This =
most<br>
&gt; &gt; likely will break the SPI Nand driver then, which still passes th=
e<br>
&gt; &gt; number of bytes to the SPI_MEM_OP_DUMMY() macro.<br>
&gt; &gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; Generic SPI-mem ops don't take the DTR mode into account. So I do=
n't<br>
&gt; &gt; see this necessary.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; You may be right, but this part of the code does take into considerati=
on <br>
&gt; the number of dummy.nbytes to calculate the xfer length. Therefore, <b=
r>
&gt; shouldn't this code block also know if the number of dummy nbytes is <=
br>
&gt; actually double the amount that it calculated through the conversion <=
br>
&gt; formula?<br>
<br>
Ok. This part turns to be debatable indeed. On the first glance the<br>
SPI-mem core doesn't anyhow handles the DTR-flag value. On the other<br>
hand SPI-controllers may have the dtr-capability flag set thus, for<br>
instance implicitly supporting the DTR transfers. Finally currently<br>
all the DTR-aware drivers are known to have the custom SPI-mem ops<br>
defined. So some aspects say for dropping the dummy.dtr field usage<br>
from here, some say against it. I'll leave it for you and @Mark,<br>
@Tudor, @Pratyush to decide.<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; tmpbufsize =3D op-&gt;cmd.nbytes + =
op-&gt;addr.nbytes + dummy_nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Allocate a =
buffer to transmit the CMD, ADDR cycles with kmalloc() so<br>
&gt; &gt;&gt; @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem=
, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; totalxferlen +=3D op-&gt;addr.nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; memset(tmpbuf + op-&gt;addr.nbytes + 1, 0xff, op-&gt;dummy.nby=
tes);<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; memset(tmpbuf + op-&gt;addr.nbytes + 1, 0xff, dummy_nbytes);<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].tx_buf =3D tmpbuf + op-&gt;addr=
.nbytes + 1;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xfers[xferpos].len =3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xfers[xferpos].len =3D dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].tx_nbits =3D op-&gt;dummy.buswi=
dth;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xfers[xferpos].dummy_data =3D 1;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; spi_message_add_tail(&amp;xfers[xferpos], &amp=
;msg);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xferpos++;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; totalxferlen +=3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; totalxferlen +=3D dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nby=
tes) {<br>
&gt; &gt;&gt; @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_m=
em *mem, struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct spi_controll=
er *ctlr =3D mem-&gt;spi-&gt;controller;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t len;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes;<br>
&gt; &gt; <br>
<br>
&gt; &gt; reverse xmas tree?<br>
<br>
Please retain the local coding style convention.<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ctlr-&gt;mem_op=
s &amp;&amp; ctlr-&gt;mem_ops-&gt;adjust_op_size)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return ctlr-&gt;mem_ops-&gt;adjust_op_size(mem=
, op);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; dummy_nbytes =3D (op-&gt;dummy.ncyc=
les * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ctlr-&gt;mem_o=
ps || !ctlr-&gt;mem_ops-&gt;exec_op) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.nbytes + op-&gt;dummy.=
nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; len =3D op-&gt;cmd.nbytes + op-&gt;addr.nbytes + dummy_nbytes;=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (len &gt; spi_max_transfer_size(mem-&gt;spi=
))<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return -EINVAL;<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-=
nor.c<br>
&gt; &gt;&gt; index d167699a1a96..f6870c6e911a 100644<br>
&gt; &gt;&gt; --- a/drivers/spi/spi-mtk-nor.c<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-mtk-nor.c<br>
&gt; &gt;&gt; @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor =
*sp, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp; static bool mtk_nor_match_read(const struct spi_m=
em_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int dummy =3D 0;<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy =3D op-&gt;dummy.nbytes * BITS_PER_BYTE / op-&gt;dummy.b=
uswidth;<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;data.bu=
swidth =3D=3D 2) || (op-&gt;data.buswidth =3D=3D 4)) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;addr.buswidth =3D=3D 1)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =
=3D=3D 8;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;=
dummy.ncycles =3D=3D 8;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;addr.buswidth =3D=3D 2)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =
=3D=3D 4;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;=
dummy.ncycles =3D=3D 4;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;addr.buswidth =3D=3D 4)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =
=3D=3D 6;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;=
dummy.ncycles =3D=3D 6;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if ((op-&gt;=
addr.buswidth =3D=3D 1) &amp;&amp; (op-&gt;data.buswidth =3D=3D 1)) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;cmd.opcode =3D=3D 0x03)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =
=3D=3D 0;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;=
dummy.ncycles =3D=3D 0;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;cmd.opcode =3D=3D 0x0b)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy =
=3D=3D 8;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return op-&gt;=
dummy.ncycles =3D=3D 8;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt; &gt;&gt;&nbsp;&nbsp; }<br>
&gt; &gt;&gt; @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const str=
uct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; static bool mtk_nor_match_prg(const struct spi_me=
m_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, rx_len,=
 prg_len, prg_left;<br>
&gt; &gt; <br>
<br>
<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.n=
cycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; +<br>
&gt; &gt; <br>
&gt; &gt; IMO it's better to move the initialization statement to a separat=
e<br>
&gt; &gt; line here.<br>
<br>
Again. The initialization statement is too long. It makes the code<br>
harder to read. Just split the declaration and initialization up.<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
<br>
&gt; &gt; Does the MTK SPI driver support DTR? AFAICS it doesn't.<br>
<br>
I'll give an answer. It doesn't. The spi_mem_exec_op() will return the<br>
-ENOTSUPP error if an SPI-mem op with any dtr flag set is requested.<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // prg mode is spi-=
only.<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((op-&gt;cmd.bus=
width &gt; 1) || (op-&gt;addr.buswidth &gt; 1) ||<br>
&gt; &gt;&gt; @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struc=
t spi_mem_op *op)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; // count dummy bytes only if we need to write =
data after it<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D dummy_nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; // leave at least one byte for data<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tx_len &gt; MTK_NOR_REG_PRGDATA_MAX)<br>
&gt; &gt;&gt; @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struc=
t spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return false;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_len =3D op-&gt;data.nbytes;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op-&gt;dummy.n=
bytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;<=
br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (prg_left &gt; MTK_NOR_REG_SHIFT_MAX + 1)<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rx_len &gt; prg_left) {<br>
&gt; &gt;&gt; @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const str=
uct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; rx_len =3D prg_left;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_len =3D tx_len + op-&gt;dummy.nbytes + rx_len;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_len =3D tx_len + dummy_nbytes + rx_len;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (prg_len &gt; MTK_NOR_PRG_CNT_MAX / 8)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return false;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_len =3D tx_len + op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_len =3D tx_len + dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (prg_len &gt; MTK_NOR_PRG_CNT_MAX / 8)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return false;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt; @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const str=
uct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; static void mtk_nor_adj_prg_size(struct spi_mem_o=
p *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, tx_left=
, prg_left;<br>
&gt; &gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.n=
cycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; ditto<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tx_len =3D op-&gt;c=
md.nbytes + op-&gt;addr.nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; tx_left =3D MTK_NOR_REG_PRGDATA_MAX + 1 - tx_l=
en;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes &gt; tx_left)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; op-&gt;data.nbytes =3D tx_left;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (op-&gt;d=
ata.dir =3D=3D SPI_MEM_DATA_IN) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op-&gt;dummy.n=
bytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; prg_left =3D MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;<=
br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (prg_left &gt; MTK_NOR_REG_SHIFT_MAX + 1)<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; prg_left =3D MTK_NOR_REG_SHIFT_MAX + 1;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.nbytes &gt; prg_left)<br>
&gt; &gt;&gt; @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct sp=
i_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; case SPI_MEM_DATA_OUT:<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if ((op-&gt;addr.buswidth =3D=3D 1) &amp;&amp;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (op-&gt;dummy.nbytes =3D=3D 0) &amp;&amp;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (op-&gt;dummy.ncycles =3D=3D 0) &amp;&amp;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; (op-&gt;data.buswidth =3D=3D 1))<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
&gt; &gt;&gt; @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct m=
tk_nor *sp, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tx_len, prg_len=
;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void __iomem *reg;<=
br>
&gt; &gt; <br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 bufbyte;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 bufbyte, dummy_nbytes =3D (op-&g=
t;dummy.ncycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; ditto<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tx_len =3D op-&gt;c=
md.nbytes + op-&gt;addr.nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // count dummy byte=
s only if we need to write data after it<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT)<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D op-&gt;dummy.nbytes + op-&gt;data.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tx_len +=3D dummy_nbytes + op-&gt;data.nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (op-&gt;dat=
a.dir =3D=3D SPI_MEM_DATA_IN)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_len =3D op-&gt;data.nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; prg_len =3D op-&gt;cmd.nbytes + op-=
&gt;addr.nbytes + op-&gt;dummy.nbytes +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; prg_len =3D op-&gt;cmd.nbytes + op-=
&gt;addr.nbytes + dummy_nbytes +<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;data.nbytes;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // an invalid op ma=
y reach here if the caller calls exec_op without<br>
&gt; &gt;&gt; @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk=
_nor *sp, const struct spi_mem_op *op)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;data.dir=
 =3D=3D SPI_MEM_DATA_OUT) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; for (i =3D 0; i &lt; op-&gt;dummy.nbytes; i++, reg_offset--) {=
<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; for (i =3D 0; i &lt; dummy_nbytes; i++, reg_offset--) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; reg =3D sp-&gt;base + MTK_NOR_REG_PRGDATA(reg_offset);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; writeb(0, reg);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; <br>
&gt; &gt; [...]<br>
&gt; &gt; <br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zy=
nq-qspi.c<br>
&gt; &gt;&gt; index 78f31b61a2aa..84b7db85548c 100644<br>
&gt; &gt;&gt; --- a/drivers/spi/spi-zynq-qspi.c<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-zynq-qspi.c<br>
&gt; &gt;&gt; @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct =
spi_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp; {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct zynq_qspi *x=
qspi =3D spi_controller_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0, i;<b=
r>
<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 *tmpbuf, dummy_nbytes =3D (op-&g=
t;dummy.ncycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt; <br>
&gt; &gt; Separate line?<br>
<br>
Too long. Split the declaration and initialization up.<br>
<br>
&gt; &gt; <br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; Is DTR supported by the driver?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
<br>
&gt; Not from what I can see, but I was not 100% sure so I placed this if <=
br>
&gt; statement here just in case.<br>
<br>
spi_mem_default_supports_op() will return false for the DTR-available<br>
transfers anyway. So the spi_mem_exec_op() method will fail right at<br>
the start and this part will never be executed if the DTR-mode is<br>
requested.<br>
<br>
-Sergey<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(xqspi-&gt;d=
ev, &quot;cmd:%#x mode:%d.%d.%d.%d\n&quot;,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode, op-&gt;cmd.buswidth, op-&gt=
;addr.buswidth,<br>
&gt; &gt;&gt; @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct=
 spi_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; err =3D -ETIMEDOUT;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tmpbuf =3D kzalloc(op-&gt;dummy.nbytes, GFP_KERNEL);<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; tmpbuf =3D kzalloc(dummy_nbytes, GFP_KERNEL);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!tmpbuf)<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return -ENOMEM;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; memset(tmpbuf, 0xff, op-&gt;dummy.nbytes);<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; memset(tmpbuf, 0xff, dummy_nbytes);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; reinit_completion(&amp;xqspi-&gt;data_completi=
on);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;txbuf =3D tmpbuf;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;rxbuf =3D NULL;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;tx_bytes =3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;rx_bytes =3D op-&gt;dummy.nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;tx_bytes =3D dummy_nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;rx_bytes =3D dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH=
, true);<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZYNQ_QSPI_IXR_RXTX_MASK);=
<br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi=
-zynqmp-gqspi.c<br>
&gt; &gt;&gt; index c760aac070e5..b41abadef9a6 100644<br>
&gt; &gt;&gt; --- a/drivers/spi/spi-zynqmp-gqspi.c<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-zynqmp-gqspi.c<br>
&gt; &gt;&gt; @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct sp=
i_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 genfifoentry =
=3D 0;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 opcode =3D op-&=
gt;cmd.opcode;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 opaddr;<br>
&gt; &gt; <br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; u8 dummy_nbytes =3D (op-&gt;dummy.n=
cycles * op-&gt;dummy.buswidth) / 8;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.dtr)<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dummy_nbytes *=3D 2;<br>
&gt; &gt; <br>
&gt; &gt; ditto<br>
&gt; &gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(xqspi-&gt;d=
ev, &quot;cmd:%#x mode:%d.%d.%d.%d\n&quot;,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; op-&gt;cmd.opcode, op-&gt;cmd.buswidth, op-&gt=
;addr.buswidth,<br>
&gt; &gt;&gt; @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct=
 spi_mem *mem,<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (dummy_nbytes) {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;txbuf =3D NULL;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;rxbuf =3D NULL;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * xqspi-&gt;bytes_to_transfer here repre=
sents the dummy circles<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * which need to be sent.<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;bytes_to_transfer =3D op-&gt;dummy.nbytes * 8 / op-&=
gt;dummy.buswidth;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; xqspi-&gt;bytes_to_transfer =3D dummy_nbytes;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; xqspi-&gt;bytes_to_receive =3D 0;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Using op-&gt;data.buswidth instead of =
op-&gt;dummy.buswidth here because<br>
&gt; &gt;&gt; diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/=
spi-mem.h<br>
&gt; &gt;&gt; index 2ba044d0d5e5..5fd45800af03 100644<br>
&gt; &gt;&gt; --- a/include/linux/spi/spi-mem.h<br>
&gt; &gt;&gt; +++ b/include/linux/spi/spi-mem.h<br>
&gt; &gt;&gt; @@ -29,9 +29,9 @@<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp; #define SPI_MEM_OP_NO_ADDR&nbsp;&nbsp; { }<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt;&gt; -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&gt; +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \<br>
&gt; &gt; <br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; .nbytes =3D __nbytes,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; .ncycles =3D __ncycles,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; .buswidth =3D __buswidth,&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; <br>
&gt; &gt; Please make sure this update and the drivers/spi/spi-mem.c driver=
<br>
&gt; &gt; alterations are coherent with the SPI Nand driver. See the macro =
usages:<br>
&gt; &gt; include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().<br>
&gt; &gt; <br>
&gt; &gt; -Sergey<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; Yes, indeed, I should have paid more attention here. As I have <br>
&gt; previously said,&nbsp; I simply replaced dummy.nbytes with the code se=
quences <br>
&gt; you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well=
 <br>
&gt; since I changed its definition. Thank you! :)<br>
&gt; <br>
&gt; <br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -83,8 +83,8 @@ enum spi_mem_data_dir {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; Note that only @addr.nbytes are taken into account in this<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; address value, so users should make sure the value fits in the<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; assigned number of bytes.<br>
&gt; &gt;&gt; - * @dummy.nbytes: number of dummy bytes to send after an opc=
ode or address. Can<br>
&gt; &gt;&gt; - *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; be zero if the operation does not require dummy bytes<br>
&gt; &gt;&gt; + * @dummy.ncycles: number of dummy cycles after an opcode or=
 address. Can<br>
&gt; &gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; be zero if the operation does not require dummy cycles=
<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; * @dummy.buswidth: number of IO lanes used =
to transmit the dummy bytes<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; * @dummy.dtr: whether the dummy bytes shoul=
d be sent in DTR mode or not<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; * @data.buswidth: number of IO lanes used t=
o send/receive the data<br>
&gt; &gt;&gt; @@ -112,7 +112,7 @@ struct spi_mem_op {<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } addr;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
&gt; &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; u8 nbytes;<br>
&gt; &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; u8 ncycles;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 buswidth;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 dtr : 1;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } dummy;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.34.1<br>
&gt; &gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sergiu<br>
<br>
______________________________________________________<br>
Linux MTD discussion mailing list<br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-mtd/">http://l=
ists.infradead.org/mailman/listinfo/linux-mtd/</a><br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MN2PR17MB33757968B536CFF8072474FDB8559MN2PR17MB3375namp_--

--===============7127330313061188336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7127330313061188336==--
