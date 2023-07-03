Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D2745934
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 11:50:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85554C6B45A;
	Mon,  3 Jul 2023 09:50:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F076C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 09:50:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE29B60E73;
 Mon,  3 Jul 2023 09:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4A4C433C7;
 Mon,  3 Jul 2023 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688377831;
 bh=LyukCnfIshSTbAwDJYNp6dcmjM1EfDP7RZS9ZHZjba4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Phu15QnH/sD22ugNy9M24vhr8GopWe4IIkSHl900X+cefSZa7cs5exWNiZbmSshgj
 98Pq8zd2VvKaRxfPXHzXW0VDh54u1tc8N1Qr6ZckDAAdaRUdDDkTPtbn2+8FR1V9jN
 CpTiTgw/8axiXSeouIvV52Okhehg+em9wZmgXfZA73QKKLVtU117fwK6w4OK/EZ6Pj
 Ghw7NBpI9Xf+EzR7Wf+If0mtfsFhKcwkAUsTaDylKV1cjrMwB4HSC3PFQ+g4YVKCeO
 mZPR9sdLkTEg3zHtBk4ie1NA00jbi1DjBnhFzOyaxwrgnrBlB6q/ztLQgkPrLs39df
 Ldmb+TDo8Bh6w==
Date: Mon, 3 Jul 2023 11:50:26 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <ZKKZ4qUw5pKVt1T1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sean Nyekjaer <sean@geanix.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230509132159.4160984-1-sean@geanix.com>
 <ZJV0/cbjn1Qa62u+@shikoro>
 <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
MIME-Version: 1.0
In-Reply-To: <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Add atomic_xfer method to
	driver
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
Content-Type: multipart/mixed; boundary="===============0134471001309328819=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0134471001309328819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WPJgYBpM8zD5lQRQ"
Content-Disposition: inline


--WPJgYBpM8zD5lQRQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Will DMA actually run in atomic mode?

> Atomic is mainly(only) used for writing a single register in the PMIC
> for the stpmic.

And this most probably during shutdown...

> Guess that will not trigger any DMA use.

... so I'd be very surprised if DMA is operational that late. I think we
can rule that out independent of I2C messages to be trasnferred.


--WPJgYBpM8zD5lQRQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSimeIACgkQFA3kzBSg
KbaU9g//Y1yfLkUK08Go/WdUa65GRV80RBI3gwDyPqLJYNsFbsmajpNqt/4XihqZ
RTLxT+tWXSUw4DnFtovhuaucFZcEdtirZLplsCrioc0cNDP5RgYibMuOxsuOig2T
M/BJK3b4iqIZJjiT+Lcs7RyPmvRetYTpyu8w17YPt5pPVeXIbDlcC1AStvCK0ghj
0ulGyX3VjRIgo++Dvcw2/08G5WL6MEB6sm9bvveaT1AX6eDBhfgPPB3l/d/+lBki
Dd+8le1SnuEVfCN0TxLIZE9m9ZZLYTSH1BcBSCJT6SYPBoM7q26OVdAAAoP4uQ9S
M6W3G6zEbHuZ0rTPRt70d2hBqAN40qmPmGZucvxIGoOxMS2rIJ6HRVvbgc3nrK4+
CkQ5PqYb2iIRaEIHposc6ggSgyC15w1pt7lczXZTCakTlgOCRehPMBnipec1n85C
IgzRW2Si1yHZMdt5Oe8zvsvfrLsa/vx3xBzHvPh5Ai7IoCEBIpb14B11lcRDSmVT
pWdFwgYvCy1t6sltEo1k0WaVVKZpmP/AYWGzQzo5QLyg2q1XnTCQ09pJNlkguPsa
lJWc89HAKgOrmnm/r+eHbZQUo3N9KKkRv4FbhMOvUOQK0Vij2R5UX3PLpM6NVPms
zV9LzkqESaPfI7W3j311Gv5hhvyUkGKnh5UeVPgv2OMC6J0Sy/Q=
=qlPi
-----END PGP SIGNATURE-----

--WPJgYBpM8zD5lQRQ--

--===============0134471001309328819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0134471001309328819==--
