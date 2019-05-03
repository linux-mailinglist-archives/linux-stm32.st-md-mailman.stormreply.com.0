Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1592141F1
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 20:41:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9024CC5F1E5
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 18:41:32 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50135.outbound.protection.outlook.com [40.107.5.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2662BC581A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh4TWYCzlC9xrPM3UNENXZxpnGU5mMj6FMHQ1Y4TBk0=;
 b=Uhm4PoxnO1NrfEwqpXK4NpMeSuPFObQfQfUksbq25tDwjf2jZtDa3FQsZwHELXjlvo5rhrJ31FBz7ZTOjEVdYj+qIDy2+vUAmFJNo2XEeOXoE3nJecYMXtHvqdRptPAEmfHzev/FJw7BMPV7Hak6ePlQa+e8nA7gDm7kRqZ265w=
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB3997.eurprd05.prod.outlook.com (52.134.18.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Fri, 3 May 2019 15:58:38 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571%5]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 15:58:38 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "stefan@agner.ch" <stefan@agner.ch>, "jic23@kernel.org"
 <jic23@kernel.org>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "David.Laight@ACULAB.COM"
 <David.Laight@ACULAB.COM>, "lars@metafoo.de" <lars@metafoo.de>
Thread-Topic: [PATCH 2/3] iio: stmpe-adc: Make wait_completion non
 interruptible
Thread-Index: AQHVAbgvhKEqeNeMGUGopQqxfyxbHKZZeJoAgAAWGIA=
Date: Fri, 3 May 2019 15:58:38 +0000
Message-ID: <1aa6533aa8b1bf4a01c1c5f8d6a208337be6b57e.camel@toradex.com>
References: <20190503135725.9959-1-dev@pschenker.ch>
 <20190503135725.9959-2-dev@pschenker.ch>
 <0aab3e91bb9644acb430a8beba927b5a@AcuMS.aculab.com>
In-Reply-To: <0aab3e91bb9644acb430a8beba927b5a@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eff7935f-2724-47bd-6700-08d6cfe034ef
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3997; 
x-ms-traffictypediagnostic: VI1PR0502MB3997:
x-microsoft-antispam-prvs: <VI1PR0502MB3997C1CABA11DD642F92660EF4350@VI1PR0502MB3997.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(346002)(39840400004)(376002)(396003)(189003)(199004)(118296001)(186003)(2616005)(476003)(2906002)(102836004)(6116002)(11346002)(66556008)(4744005)(4326008)(2201001)(76116006)(66946007)(68736007)(6506007)(64756008)(305945005)(66446008)(8676002)(86362001)(6512007)(73956011)(91956017)(486006)(44832011)(7736002)(7416002)(66476007)(26005)(446003)(71200400001)(71190400001)(8936002)(6246003)(66066001)(53936002)(81166006)(6436002)(81156014)(2501003)(76176011)(25786009)(6486002)(256004)(478600001)(36756003)(316002)(229853002)(99286004)(5660300002)(3846002)(110136005)(54906003)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3997;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: myoox2xZjx8TtCFEYinRg24d5HwpcC9H2dir7ZMbDkf5CouobEi6Lkpt+fZFzqmo+Vq7FqRqClsAClDejNUVorIb1akDCTqjGHCTgdJC8CQeM37Q79IQqF9T1AymM6NLcKts+B7rwXyK/ey16QKsqRgEQe74v4eHHflZDgiHm/uLblxjZSfuAJ4lUDxPYfiQBi3NwJf1BNOqK10mGRo2xc7ivc86qom0N+qdj7Xpv4NcxI/gpl11NEivhx4uwN4hLN4LFLf1mj26egxcY1I4JLxukluh+gXL2bEIU1pDa/KdNoPOrX2rZuwLnzx5BvWthX2wD9uo/NEFzzZ30a8hK5R7BxuMlP1MNGjY/GaiJhkm3RUXny4zrK2QD9k7ZdSSRiQw593HlQgO8So1slHGMwiUmojvyOFRdpRZTuHa4t8=
Content-ID: <30EE247C42402344A09AFA35C0A279BA@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff7935f-2724-47bd-6700-08d6cfe034ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 15:58:38.5291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3997
X-Mailman-Approved-At: Sun, 05 May 2019 18:41:28 +0000
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
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

On Fri, 2019-05-03 at 14:39 +0000, David Laight wrote:
> From: Philippe Schenker
> > Sent: 03 May 2019 14:57
> > In some cases, the wait_completion got interrupted. This caused the
> > error-handling to mutex_unlock the function. The before turned on
> > interrupt then got called anyway. In the ISR then completion()
> > was called causing problems.
> > 
> > Making this wait_completion non interruptible solves the problem.
> 
> Won't the same thing happen if the interrupt occurs just after
> the timeout?
> 
> 	David
>  
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT,
> UK
> Registration No: 1397386 (Wales)
> 

You're of course right... Thanks for pointing this out. I will send a v2 with a
better solution then.

Philippe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
