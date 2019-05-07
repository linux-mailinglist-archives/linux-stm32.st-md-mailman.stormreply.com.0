Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E2165B4
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 16:31:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9898CC35E03
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 14:31:55 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40131.outbound.protection.outlook.com [40.107.4.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A51DC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2019 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p7dJeec2rydzXAsQFgVikLcIA0qKJ/k1RuN3ew8/fc=;
 b=gfC81bEt4gHl3B//jwASDBP1MrYb1JqeKoUYaS3261hb/W9Mk7rk6fqD7JoMHs2b2WqG+TWCZsO1dEax2VzQokTn3clvLVm/23syU4J0yHd1gxVgMIOYb+KFSmOl9lTd08+ZYbOOOQ5934s9TPhexHUM9SU3snpV4H2kpVHhe5s=
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB3871.eurprd05.prod.outlook.com (52.134.5.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 14:31:49 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 14:31:49 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "jic23@kernel.org" <jic23@kernel.org>, "David.Laight@ACULAB.COM"
 <David.Laight@ACULAB.COM>
Thread-Topic: [PATCH 2/3] iio: stmpe-adc: Make wait_completion non
 interruptible
Thread-Index: AQHVAbgvhKEqeNeMGUGopQqxfyxbHKZZeJoAgAAWGICAAyCfgIACqXCAgABnAwA=
Date: Tue, 7 May 2019 14:31:49 +0000
Message-ID: <69a00774deb5d5c8f5611855fa354cccbe92a6aa.camel@toradex.com>
References: <20190503135725.9959-1-dev@pschenker.ch>
 <20190503135725.9959-2-dev@pschenker.ch>
 <0aab3e91bb9644acb430a8beba927b5a@AcuMS.aculab.com>
 <1aa6533aa8b1bf4a01c1c5f8d6a208337be6b57e.camel@toradex.com>
 <20190505164409.7976f43e@archlinux>
 <4df31129d19c4128a4bbc5e0575886af@AcuMS.aculab.com>
In-Reply-To: <4df31129d19c4128a4bbc5e0575886af@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edff2429-5768-4af5-3c7b-08d6d2f8bdb8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3871; 
x-ms-traffictypediagnostic: VI1PR0502MB3871:
x-microsoft-antispam-prvs: <VI1PR0502MB38716A831BBC8E868036A6C0F4310@VI1PR0502MB3871.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(136003)(39850400004)(366004)(376002)(199004)(189003)(2906002)(68736007)(36756003)(229853002)(2501003)(6512007)(7416002)(316002)(8936002)(99286004)(6486002)(3846002)(6436002)(6116002)(71200400001)(71190400001)(446003)(2616005)(476003)(478600001)(11346002)(81156014)(81166006)(256004)(14444005)(14454004)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(91956017)(73956011)(486006)(44832011)(7736002)(66066001)(4326008)(110136005)(25786009)(6246003)(53936002)(305945005)(118296001)(6506007)(54906003)(76176011)(26005)(8676002)(86362001)(186003)(5660300002)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3871;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ESKjahfAQepahqpyGtg7Jfk7YuJwd4S55SEFeGtQ5+9dUBfkh0F6PLGUefKgxY0r7DMZzgH8poNX+xoy2NdtVK2J3TaNaoOsn7p6tn/bAwjiZxluIoCNL3nsav3r6USRAAGOdR7/NGXM/fbp//1D8xiXWafZNyj5/WTxzo90ZARcWNkRAe12w8lqfKdtyQtiu8wb4Q+dYZDtIah0zoaqIcHJotjo7Xqx8EOFKVxgPfIXzZs1UGIaChJPTFCGPPVrvXGakLhNqKS1rO6eHFO3irXNUsHfPfbUd1+M4m9IM5LaHMAH1VU6MWC4LyLc4GTl2SmQU20brjPjnNR8od1b2xDNY1OqZnHUMYhRA2nonEFiM701hOjVgDTsVCr7FXisZZ0tykFazQFmZ+lTyazusyUf1YgeYQ07UUgKIcIV21Y=
Content-ID: <EAA6079BD1A28F43886E8BD45814DA37@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edff2429-5768-4af5-3c7b-08d6d2f8bdb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 14:31:49.4663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3871
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stefan@agner.ch" <stefan@agner.ch>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] iio: stmpe-adc: Make wait_completion
 non interruptible
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

On Tue, 2019-05-07 at 08:23 +0000, David Laight wrote:
> From: Jonathan Cameron
> > Sent: 05 May 2019 16:44
> > On Fri, 3 May 2019 15:58:38 +0000
> > Philippe Schenker <philippe.schenker@toradex.com> wrote:
> > 
> > > On Fri, 2019-05-03 at 14:39 +0000, David Laight wrote:
> > > > From: Philippe Schenker
> > > > > Sent: 03 May 2019 14:57
> > > > > In some cases, the wait_completion got interrupted. This caused the
> > > > > error-handling to mutex_unlock the function. The before turned on
> > > > > interrupt then got called anyway. In the ISR then completion()
> > > > > was called causing problems.
> > > > > 
> > > > > Making this wait_completion non interruptible solves the problem.
> > > > 
> > > > Won't the same thing happen if the interrupt occurs just after
> > > > the timeout?
> > > > 
> > > > 	David
> > > > 
> > > > 
> > > > -
> > > > Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> > > > MK1 1PT,
> > > > UK
> > > > Registration No: 1397386 (Wales)
> > > > 
> > > 
> > > You're of course right... Thanks for pointing this out. I will send a v2
> > > with a
> > > better solution then.
> > > 
> > 
> > Isn't the timeout long enough that it should only happen if the hardware has
> > a fault? If that's the case, I wouldn't worry too much about possibility of
> > an interrupt causing confusion as long as it isn't catastrophic.
> 
> The 'confusion' is likely to be 'catastrophic' unless the code is written
> to handle it properly.
> 
> Cancelling callbacks is hard to get right and often not done properly.
> Timing out an interrupt is much the same problem.
> 
> 	David

I sorted it out now, there where also some more bugs I found and corrected.

@Jonathan: I will send a completely new series of patches that will include
patch 3/3 from this series but not the one you already applied. This due to
increased patch number and different order...
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT,
> UK
> Registration No: 1397386 (Wales)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
