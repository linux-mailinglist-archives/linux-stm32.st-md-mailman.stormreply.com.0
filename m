Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 803207D1EF1
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Oct 2023 20:34:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D14C6907A;
	Sat, 21 Oct 2023 18:34:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CE35C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Oct 2023 18:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E08760FC4;
 Sat, 21 Oct 2023 18:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E34C433C7;
 Sat, 21 Oct 2023 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697913266;
 bh=2IMZ7iFSlhjVxu/VTWm4dQq1ViJWvD2O8nqsU123hsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Imz4h9ik9Z0meo1QALRSvieG/apyUw8g88eOzV2t7xUSkUChO9bwvEz7AD8GSWoib
 S7F49bfhcTvXjb9WLbai7uD8PT1U+DLCViKzqyVayRDAXAHql9lzf1TirVYukUo1EP
 Plwo/igPIJqXuE3tIVON21tCwn6h2o9z0BzMiE8Z7fMLrO6SYVpw9ZUMvfVopgm8kC
 GGDBXBZlFIJDsO/h3XmFRuvX6iMoq+T30Er7cJTvxrnF5WJFoXzofjGXGeV8YgkEKj
 Yn0YLepoOX2ERwa5Yg4dPr5t1k1Aev7RLNx2Dw0nxTtzqQwvR2i6j6QsGcwDVHsyH/
 0QUWcSeNZlo8A==
Date: Sat, 21 Oct 2023 20:34:23 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZTQZr9QocS+Qls0P@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 stable@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231010084455.1718830-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231010084455.1718830-1-alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: Fix PEC handling in case
 of SMBUS transfers
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
Content-Type: multipart/mixed; boundary="===============6662594350327600287=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6662594350327600287==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ODTK9yyIQXicmMUN"
Content-Disposition: inline


--ODTK9yyIQXicmMUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:44:54AM +0200, Alain Volmat wrote:
> In case of SMBUS byte read with PEC enabled, the whole transfer
> is split into two commands.  A first write command, followed by
> a read command.  The write command does not have any PEC byte
> and a PEC byte is appended at the end of the read command.
> (cf Read byte protocol with PEC in SMBUS specification)
>=20
> Within the STM32 I2C controller, handling (either sending
> or receiving) of the PEC byte is done via the PECBYTE bit in
> register CR2.
>=20
> Currently, the PECBYTE is set at the beginning of a transfer,
> which lead to sending a PEC byte at the end of the write command
> (hence losing the real last byte), and also does not check the
> PEC byte received during the read command.
>=20
> This patch corrects the function stm32f7_i2c_smbus_xfer_msg
> in order to only set the PECBYTE during the read command.
>=20
> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols suppo=
rt")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Applied to for-current, thanks!

BTW, there are some patches pending from this series for stm32f4/7. Do
you have time for an ack?

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D359230


--ODTK9yyIQXicmMUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0GaoACgkQFA3kzBSg
KbZcAA/8CTJ0qwqy93erVsUOzCzgDrO437q8fryQz8SPGRvQfAysYCmJcG4uccTT
QZ3WUJ8VoX6gWFl63Hql44rvvn6px4vxoLOD+kx3ue+3kuS4DKEKOaQ0mH02eBsv
k3tFT76nnkTCV+10itUJ/EM+GUBsXVX3xoTgG3Rko7u1pQdyt5ro5AFaJX/IAAQe
o5wttCU/pIG/a850p5mfsv3wcl/JHaAG8Lzd7Fss6uTlqfcIAgcwHZs/gygstJB2
01Fim6Be9LuAopCCkI3hh0/keo/BSLqwsXrtvXRV6bRKgcSmvTqJJDkjjxT6a+l+
ABWjG3z88wTtI81VywiR3gFkuRp+InlTbuILncjG+yay4dm0aehL8eNh6STKNRIM
u8ynrhBEIuuAXEQ0/6g43CSQQGpTt4PcPhWyK1vsNlVFGfFSaclRXFQEMh27oARy
GMDdXrH/7lYQ7xeoQPKuO9oYOoTQtbMjC6Mwz6IkY9CpKNQwxxen9rNePrpVdUiV
odjcAizzMb6CPP2A6wFM7LtkbfpozPYHZ9L1/Ujm0D5c7Fb3g9cRTiMWpokDXzV7
4aUNkE6GAPgkPJPulLYoTjphzUfDoRjVJGXoK/cfVQWR6ad3Kk1c2r4HJ+xTQKVJ
Q3quC5MhJKcyLfVEBfJUbL4LwKo19s6gUxTSFvVOW10+s/6/9rc=
=GBVW
-----END PGP SIGNATURE-----

--ODTK9yyIQXicmMUN--

--===============6662594350327600287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6662594350327600287==--
