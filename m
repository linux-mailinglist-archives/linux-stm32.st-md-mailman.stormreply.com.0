Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4B355D04
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 22:40:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE7DBC5719D;
	Tue,  6 Apr 2021 20:40:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34851C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 20:40:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E9D2613D5;
 Tue,  6 Apr 2021 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617741635;
 bh=mG4Sq6u56QNXfpw3dVHzq62pilnO6S5/eAOnL1VMX1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caCcFWEcn2I+GxktQMG6/FyIjsTJhqgLqScicq823GZwOFrE+JiiZvzKACfcqq2Ng
 NOHimrjuXvSb7YF5iyxj1UcJX1AUpJVWS48vBKwgpLc6Sug5MonaPcb7zCldIy0SjD
 0cQVYYQf5yHcLkjAG6wEm3aZ+Nv609er0lAZXlPM1pL42ZUM75i5fM6qm0caJYEu+d
 Tl5R26v5ZHxkKcKiN3p7XAv7tpigunIOPosMsmGf7X6cwd/ka0voULZPqg6y2QISzB
 ngbU7hTIs0uDhCbiyhmA8hSXQhjYDMh3QZi5p3PHDu95LJk1e+lctAmVJgc8On2oRI
 3dDEARaMIeQHw==
Date: Tue, 6 Apr 2021 22:40:32 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210406204032.GD3804@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1615550007-10927-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1615550007-10927-1-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: avoid ifdef CONFIG_PM_SLEEP
 for pm callbacks
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
Content-Type: multipart/mixed; boundary="===============1007043009324137065=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1007043009324137065==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline


--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 12:53:27PM +0100, Alain Volmat wrote:
> Avoid CONFIG_PM preprocessor check for pm suspend/resume
> callbacks and identify the functions with __maybe_unused.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsx0AACgkQFA3kzBSg
KbYk2w//Z5MirYVJZV8DrTODuuAzI1fK4ZXG90hIec7fd6TDmWAM5JffkO3rf7Kp
Ktm+O2CIMALirCT4QZ5EHjYG7NOuCfaVLpFks0vCuT5kNQT48r+XAjG3Hx4MnXrR
i1QvuzGzRWSCMqwts+t3lU7p5SWXmcTeLNQH9PBiKC+qdtRgdygFsfNStSOy82xg
wOqEVqgsftdHotews3tCaj/CzGNZlhHnK7LorQ4IWI5q88/36Pjq/rpMx0aa5lAY
VyX7uCEag5F2KVZeIK4HA35zRtiZgigZM5qpi2xJFQ3SyMeXtV66GY5CJbceSG04
MzuxE72Z6CwgKF9BKSDI+09vY/hzZz9X9BIKKnVRdGt8AnPgB+owV4i5c9YFs+7W
oWOChNwTlVIxnfonWubIWmBI0kG+9ah3N05dS3X8Zqh80Q2koNHOc8QodnnzItDe
3yCP8lGVx44jFJVxst/rCOxgwN7R0mpr/GGMVZMIjHPEkBAIM7juyZCShp5c9D3i
9HQKUIEjF+s0jvSlMlO6WOK0FOSd1Y+hwqCMRvIkfQkuymhu24OT9xDURhbDTI5d
B/TjT8tPILyBhf+0U3LN34BiYXOnYvdOsJFpUtR6VHKI3a9z0/d6+Hl6cDbOAG2h
qzRR+wf3AAdFbfjhz1i0tYQwtPnnWmDNZTqOz+QIns32NrDsq6E=
=GpI0
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--

--===============1007043009324137065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1007043009324137065==--
