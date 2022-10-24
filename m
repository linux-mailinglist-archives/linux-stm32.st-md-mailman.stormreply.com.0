Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213960AF5A
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 17:46:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8299C03FC6;
	Mon, 24 Oct 2022 15:46:20 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39A75C035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 15:46:20 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1omzeK-00031R-RG; Mon, 24 Oct 2022 17:46:00 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Date: Mon, 24 Oct 2022 17:45:59 +0200
Message-ID: <2120112.irdbgypaU6@diego>
In-Reply-To: <8d6ddb0d-98be-4c4d-9523-f024c339c8d0@app.fastmail.com>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <2204103.iZASKD2KPV@diego>
 <8d6ddb0d-98be-4c4d-9523-f024c339c8d0@app.fastmail.com>
MIME-Version: 1.0
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Christer Weinigel <christer@weinigel.se>,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Patard <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 soc@kernel.org, openmoko-kernel@lists.openmoko.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [Linux-stm32] [PATCH 01/21] ARM: s3c: remove all s3c24xx support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am Montag, 24. Oktober 2022, 16:27:31 CEST schrieb Arnd Bergmann:
> On Sat, Oct 22, 2022, at 22:56, Heiko St=FCbner wrote:
> > Am Freitag, 21. Oktober 2022, 22:27:34 CEST schrieb Arnd Bergmann:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> =

> >> The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
> >> as deprecated and schedule removal") and can be removed. This includes
> >> all files that are exclusively for s3c24xx and not shared with s3c64xx,
> >> as well as the glue logic in Kconfig and the maintainer file entries.
> >> =

> >> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> >> Cc: Ben Dooks <ben-linux@fluff.org>
> >> Cc: Christer Weinigel <christer@weinigel.se>
> >> Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
> >> Cc: Heiko Stuebner <heiko@sntech.de>
> >> Cc: Simtec Linux Team <linux@simtec.co.uk>
> >> Cc: openmoko-kernel@lists.openmoko.org
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > So many memories of me starting out in the kernel on s3c24xx.
> > But it's no use trying to keep stuff around that nobody will likely
> > ever use again. So with a sad face
> >
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> >
> >
> > though you might want to also include
> > 	drivers/dma/s3c24xx-dma.c
> =

> This was in a separate patch that removes the driver:
> =

> https://lore.kernel.org/linux-arm-kernel/20221021203329.4143397-14-arnd@k=
ernel.org/

ah ok, I guess git-send-email didn't want to send me that patch.
So all is good in that part then :-)


Heiko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
