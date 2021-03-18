Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B503403F7
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 11:54:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 662E2C57B7B;
	Thu, 18 Mar 2021 10:54:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0410C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 10:54:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86F6B64EF6;
 Thu, 18 Mar 2021 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616064881;
 bh=AaEM6kJP7hYl/Mke2P2Zf6SgSWc43K5KRU+P44kGtJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DEeKQ/L/pCvN40iSreXnykHkgcmRdDfUPUjn3Vrlc/C6rlfy23UyJLLJ2pTEWsMi4
 mqyJxRThSmECucH4YN73BIOjeMKJN6DWWpU5DnrgGl7PHS0aLtAY4mI65lD1iliSv0
 DCbA10pvEcEetKPM0dT4rCmUt5sB8CHK9txeQQZAChD1O+nRQbAVE7vNJsfdcpnmWx
 Vib3QdlK0m24VNW1HFjptkxw1/bIZuykKMiu9jfgHxRmCAG+hpWxGHRrKIaOd/cp7a
 w6RTUeQJf0BHYgYITgmyx0YixukXB6TC5EcSvw0uK2icig0j3de47U/AUc0+fvztoB
 NOdFWZ89ifMAQ==
Date: Thu, 18 Mar 2021 11:54:38 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210318105438.GD974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] i2c: stm32f7: support DT binding
	i2c-analog-filter
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
Content-Type: multipart/mixed; boundary="===============2191788682133097440=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2191788682133097440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:41AM +0100, Alain Volmat wrote:
> Replace driver internally coded enabling/disabling of the
> analog-filter with the DT binding "i2c-analog-filter".
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMW0ACgkQFA3kzBSg
KbYMUhAApnGraRQyJ1+nAaJK6wla8KeEgux9k6DBuHr4IjaugpnvcFRER8pYViNZ
KrJtn0fmcGRv4pGQH/n+pPjsWxWP1rPE0z7aMuYPyXkHgxedAhY6Odu256VYJpwB
0CKsAF+FFegY3SR6tEEFEGQfI4ofDSckfG/MSExbp2y27b78BRaV2gdHkY9FVPwK
OJgrDSrvtD1LtN2Kyqyy/KOmodfzByDkE+VB1zrh6Q5p3yWbplJkNPGTxipTEfSQ
S+JI0YPSrO5p4ksIKwvPsPPL5sVA3GcsweidVvTI/8Fs8DMNY86CtGykWEZTB9QS
kYfiLfP6cB8xBLYR33dH42cwHjGMtusSb/3dYgsi8BH7GzL8uoRyRMVVZz/gndAs
8WeV+9R3LjlpalH2OD46onM75X+ax4p8GUgX5bmU2bcKdFyOxomfrtbn0vmORIsc
VGix7yvYOOGPZ5WSQ2P3lB1HNj2kGq8tEzLwSvY+MI2pa5VwE4AoNi0OmebT13xe
KvTky6rExZlj8PUeKpiHaiWLI0FomYMgnU3OBaEnBm1g0kt1rRfCLL+98zQqbbuA
5MHg68bWeiffWybr9EMHNo5JUPNpDeDG9S0M65HokSNJM3cujRORuYyRClHrAM1O
lFbHsBqkRvy8hYOP1DxobEh3cfcfnpkzt+6OwcPYjnlI5aG4s58=
=+4F8
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--

--===============2191788682133097440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2191788682133097440==--
