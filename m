Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A5120547
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 13:17:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F86CC36B0B;
	Mon, 16 Dec 2019 12:17:06 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C516C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 11:34:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5CED7ACC9;
 Mon, 16 Dec 2019 11:34:56 +0000 (UTC)
Message-ID: <c52eac760b84b5518453df501fcbefe332109b7c.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, broonie@kernel.org, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, baohua@kernel.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Mon, 16 Dec 2019 12:34:54 +0100
In-Reply-To: <20191212135550.4634-3-peter.ujfalusi@ti.com>
References: <20191212135550.4634-1-peter.ujfalusi@ti.com>
 <20191212135550.4634-3-peter.ujfalusi@ti.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 12:17:05 +0000
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/9] spi: bcm2835: Release the DMA channel
 if probe fails after dma_init
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
Content-Type: multipart/mixed; boundary="===============1868364757119639639=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1868364757119639639==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-sXE7sJg+XY/TFzJstkte"


--=-sXE7sJg+XY/TFzJstkte
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-12-12 at 15:55 +0200, Peter Ujfalusi wrote:
> The DMA channel was not released if either devm_request_irq() or
> devm_spi_register_controller() failed.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---

Thanks!

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-sXE7sJg+XY/TFzJstkte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl33a94ACgkQlfZmHno8
x/6CCAf7B+B8hZxRZRMeLVd8ul40vOlcF9rYKCysCJeIolLp9Y2o4IzUDv0K1mel
0z35UloEsK0lerWCQzf9nH6RbxBqfEE5NbQ/N2ewB9/+Ko1YXB/JkhbMx8ApqqoR
DFhBiIS9MjrKzpffIY1Wa8f2TRngNKJAGbUVYX2lpW2zhRpqDSaa61WWra+KzbNK
vBfmnO3NwN69bN7vqN//ES4MonAbxXm7HGwyI8okIzlwc+rZWympTUBgpwXfGGeC
R1OHlJZiexWOW1LID7wjOPAeYbbGEatKio3MBTOAU+Ccx1JTDzjlKx0AtwIqyKTd
Oc2YpUm1LThjhmtRyLB1OXGc+8edpw==
=JoZp
-----END PGP SIGNATURE-----

--=-sXE7sJg+XY/TFzJstkte--


--===============1868364757119639639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1868364757119639639==--

