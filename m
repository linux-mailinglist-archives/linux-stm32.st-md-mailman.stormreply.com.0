Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204B462F9A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 10:28:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49244C5EC74;
	Tue, 30 Nov 2021 09:28:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1294FC5EC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 09:28:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB65DB817F6;
 Tue, 30 Nov 2021 09:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D2BC53FC1;
 Tue, 30 Nov 2021 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638264487;
 bh=TgTB+HvwgE1K6uTIqH5Mm8brLfCpRDbgZBQvLIL6PNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MabxmVv7aCXsEKQFvEeVFu97DbMxV/cvLNON0JOyB10fQ2cSbY1H5b97NOouaVYrJ
 5e7mDIWn/sh7BskppfifvCT0mM2B/hRW8cbCoyfM2dW0VyQQdO4ZfUsfAdxLRfkloQ
 YMGnelqkifHMhiKAmDw807yLfEAy5lxOpEdyuUUmmy/YSEjI2NH7MQEZaGeDTE8Rvs
 P7hjLSfnYdbz+Bhwr0OpsR1BzOu5QR1h8ogwlXzW7kVugNvFxwbvqwkAI6GlQsmXbw
 87w+uQTOBEng266LTV5B+4et2tzlsN4w03iuGWe+pZVUgV/JLpzp24IhoMLoBfF2C9
 V8BsBD+3Pf4xQ==
Date: Tue, 30 Nov 2021 10:28:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaXupH+h2PU+YUlA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-5-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-5-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] i2c: stm32f7: use proper DMAENGINE
 API for termination
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
Content-Type: multipart/mixed; boundary="===============4115511929807648185=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4115511929807648185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9BKR1twofcV34c05"
Content-Disposition: inline


--9BKR1twofcV34c05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:32PM +0200, Alain Volmat wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async.  Here, we use dmaengine_terminate_sync in
> i2c_xfer and i2c_smbus_xfer handlers and rely on
> dmaengine_terminate_async within interrupt handlers
> (transmission error cases).
> dmaengine_synchronize is added within i2c_xfer and i2c_smbus_xfer handler
> to finalize terminate started in interrupt handlers.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--9BKR1twofcV34c05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7qQACgkQFA3kzBSg
Kba9bxAAnolHWrz96xTiK4AAyN69kypXX4qth+xsvFARDQpkOIv02CFxNE877QgF
8RsfYdvGMPb7fvB5gBebN8o15gETECfW6YCNRI++V6GtO2XqbjcDFv5dfP/X7Gmf
WTM2uh3efg2yMq9C6gVDPWStys1ZumDxZadMPSN1I78N0On3ySkLepBZWDHgi2jh
LA5PnsyCCosTF9a7zWTet+sWzsxFxcnwb83QAnv8B27BXUeH+9Z0KWaS7HYV8kP/
vyPZ5KhkqDwLn/xELfJEjvPcVnOX3BWUEo7QoI1RkrRFhjdf8cooRvgqKfnJ9de+
+xwpNgeEW948YKQcapM4m6p+/CsUWwBW5eXmzh5rkSF5ZfFk/skj2DZR77Xo288w
F0/Ar1BqbVDai6jSuKgigSoPhLajIY8W0tw2U6EzB3E/gINtUZ/GwMtI7S8Iucbc
VE4Bmirx16B5cr9ki9lhFJa1Pg5qUYNBS/tIlqHcGiXFUf+iE/Qq0KfPjNQZ59xP
nN1oTeWHGHdHq/Jx4vs9PA/opRKt1eSgvHs5vV/bYPcWxjb5WhibzDx96KPGCOwo
dduUZxp5lcbBgTMPc8ihXV/YjVR2olHOIM5KwKa9EGE6aiNnyAdH7ZcQ6ZIhEFuu
LVvmvvCjmSr3Xhz8zTRddi+Z6MtqiVnSSWUFEI4oBm/p1+mjMbQ=
=ZOXV
-----END PGP SIGNATURE-----

--9BKR1twofcV34c05--

--===============4115511929807648185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4115511929807648185==--
