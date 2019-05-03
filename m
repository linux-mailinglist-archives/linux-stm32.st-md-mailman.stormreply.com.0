Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B65451308E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 16:39:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63520C58186
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 14:39:37 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21908C57831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 14:39:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-113-LyrG2MGFMYeVaRNCuyPBFw-1; Fri, 03 May 2019 15:39:35 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri,
 3 May 2019 15:39:32 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 3 May 2019 15:39:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Philippe Schenker' <dev@pschenker.ch>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, "Stefan
 Agner" <stefan@agner.ch>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter
 Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Thread-Topic: [PATCH 2/3] iio: stmpe-adc: Make wait_completion non
 interruptible
Thread-Index: AQHVAbg3A7HWDrzd+kO5dj2pSSFp8qZZeDWw
Date: Fri, 3 May 2019 14:39:32 +0000
Message-ID: <0aab3e91bb9644acb430a8beba927b5a@AcuMS.aculab.com>
References: <20190503135725.9959-1-dev@pschenker.ch>
 <20190503135725.9959-2-dev@pschenker.ch>
In-Reply-To: <20190503135725.9959-2-dev@pschenker.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: LyrG2MGFMYeVaRNCuyPBFw-1
X-Mimecast-Spam-Score: 0
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
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

From: Philippe Schenker
> Sent: 03 May 2019 14:57
> In some cases, the wait_completion got interrupted. This caused the
> error-handling to mutex_unlock the function. The before turned on
> interrupt then got called anyway. In the ISR then completion()
> was called causing problems.
> 
> Making this wait_completion non interruptible solves the problem.

Won't the same thing happen if the interrupt occurs just after
the timeout?

	David
 

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
