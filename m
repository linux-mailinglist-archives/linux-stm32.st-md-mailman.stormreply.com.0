Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B95B59AC
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Sep 2022 13:52:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39923C04004;
	Mon, 12 Sep 2022 11:52:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37775C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 11:52:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFDF461199;
 Mon, 12 Sep 2022 11:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA9C433C1;
 Mon, 12 Sep 2022 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662983566;
 bh=AvA6TgPUAVeyXLqYp+8Bg4Oa2Z6Als9d4E+bEmPak0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZM0/drk+x0laRAb59LlFYkv6q5lTomulnBKT1HsEcB43LFDNJwPfNPbDjWnHDPzi
 RwDZABlj4xgXfi7MmWA0qn92sumOh3IAcLL0RN+7OnntmFElFj990/TZKbnj9K9Dv5
 wfnoTx9yc33qw8zzeNakcZWiLEvV5ytVS2LNmvJfCLu8NjCuw9DWT/Nsd8vUhylkLa
 LuZCtQtHZwlrxuN8SSMfWy62JPnha2LPZa++3+hRjac2Un6MP0v7umWZXq+73g0qDR
 WcCGg6S+ssMSKy3GhN2mTtpp8aZBPhmEANjBKGUJynRwNRGF7VPaGEwgWSQ3OFsQjf
 JMq/0PxULG+mw==
Date: Mon, 12 Sep 2022 12:52:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Sergiu Moga <sergiu.moga@microchip.com>
Message-ID: <Yx8didL1aFc4XxGa@sirena.org.uk>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
X-Cookie: One FISHWICH coming up!!
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 tmaimon77@gmail.com, benjaminfair@google.com, kdasu.kdev@gmail.com,
 richard@nod.at, chin-ting_kuo@aspeedtech.com, michal.simek@xilinx.com,
 haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com,
 linux-rockchip@lists.infradead.org, tudor.ambarus@microchip.com,
 john.garry@huawei.com, linux-mediatek@lists.infradead.org, clg@kaod.org,
 matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org,
 andrew@aj.id.au, venture@google.com, heiko@sntech.de,
 nicolas.ferre@microchip.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, avifishman70@gmail.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, claudiu.beznea@microchip.com, pratyush@kernel.org
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
Content-Type: multipart/mixed; boundary="===============5282396543544201619=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5282396543544201619==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsMpd7wbAJx2xcTL"
Content-Disposition: inline


--tsMpd7wbAJx2xcTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
> In order to properly represent the hardware functionality
> in the core, avoid reconverting the number of dummy cycles
> to the number of bytes and only work with the former.
> Instead, let the drivers that do need this conversion do
> it themselves.

Acked-by: Mark Brown <broonie@kernel.org>

If this gets applied it might be good to have a tag in case we
need it for any SPI updates.

--tsMpd7wbAJx2xcTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfHYUACgkQJNaLcl1U
h9BR0ggAgkV1J8/o/vgLngoRQlQriv74OFxhNN5+lL+Ue4so/rZcuKbaX7fW6yVN
5WwRPm0joSHJslzR37N/Q1ajnX5ZooQm33WIVzToQBU0liUpwIC9pn84Em0ebD1T
yRd21CVYYsPcwrRr3STSzjZpMq+CRQMfe4hvBOHirS+hQqQ9gnfpQ6NJyhkF4w6P
rUiOb9TYvfLqi8usgPC20TbdPjQxz+a3LoKzZokU2CgnnjSTUTRHf9BfCfuyOqZE
18MRkCDY7zUwO7D580ojgXe0kAAIQIxaN4QAZSG6e/hC9BziHeHJOMua0S56E4Xw
WIP/Lcq6BWueOZUfZglx7aACizALEA==
=BL9e
-----END PGP SIGNATURE-----

--tsMpd7wbAJx2xcTL--

--===============5282396543544201619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5282396543544201619==--
