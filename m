Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD897D3AB9
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Oct 2023 17:29:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6906AC6B47C;
	Mon, 23 Oct 2023 15:29:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E173C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 15:29:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE13861BC2;
 Mon, 23 Oct 2023 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02557C433C8;
 Mon, 23 Oct 2023 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698074940;
 bh=koKN+16K55fZmX3YR5+oQ5/Z6wG5u6tTuhKR/YAgwAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMW9YWef0k+qWNhCkYpdu20jcBQKZij4pHz2AT5Y6/fA8pgOyblbOuK/Wf73+Ti4y
 wvUWtl/fskmbOoZ2pwKqZjK3BIQ1ISlVTM8MPYunkXKep4V/ANDuQStLRAhnhBH4xp
 zM9R6X6IuM4nXJ49IFyOurdJUK3UGU4NxI3tjsvEd5q43cG8hUR9Ff5IcvrhGJqDBh
 rSSaMjfVvAWcti06SX6QACbFwwh9CVrHq2CqAeuAXvv5GjttnZsPvlVcuDbSBG0NEP
 L7boQ5c2peMom/XVSp9qhfH8n7JHr9VwTWeHluUgx76b3m3YrXvg7xVG4keK6SgAvW
 D4sYJ1bPAOkRw==
Date: Mon, 23 Oct 2023 17:28:57 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZTaROXi2sImFxJZK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231023085015.2557849-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231023085015.2557849-1-alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: add description of atomic
 in struct stm32f7_i2c_dev
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
Content-Type: multipart/mixed; boundary="===============4065641382419278529=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4065641382419278529==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/XZhbe094dlICOwa"
Content-Disposition: inline


--/XZhbe094dlICOwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:50:15AM +0200, Alain Volmat wrote:
> Add missing description of the atomic boolean in struct stm32f7_i2c_dev.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--/XZhbe094dlICOwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2kTkACgkQFA3kzBSg
KbbQFA/9HWl7TYBzNXVk4BftOhgOrCcxgiwQWnOtz8jTOWEufUD1/JYaI1DoDm9v
nTX8YiXNZRRJ9ULbk7ZVkiUOdA9iCOYoamngKglBbEO7J1w0hGzKjKebtqfqBvTT
zHFTV8iTweq1McUXQsbgorPr1HzoeMaG0OVezezIhfWViGuhQWIlmg4OYJIxWniX
Y3cW5LRVRJ8Ud1UZdYfunGK7nKp3++WugSW5hNAis9DLDCzQELLYDc5FLNcCE2mU
0RzF1oh9m8uMw0rBDIW2dTBZ/YPRhKakgbDHfxwpnLv8SvH0kal98k5FT00C+7YQ
DDCH1pGOqyG/n1W1aG96ka1g7tA5c+Zj1+05J/3aVpxbwoXnzS5lslUvh9MDp5ip
bzIKP0AYPooepy3/yXF0rCPcAKF/OT6jVCC726A8kW07dHHJCVGlaNk3HLQdHVPw
bgz+JBuoAYQdPhQ44DChMzaTJBSO7f6zSI5252x6dGczEktXxqAYsqvYthDl0t/m
lffOGChIRdTvazFDibomJ9SE1XTJmV3dvVPJEFwfE31XKtBbztb8/5wh3xZhdaPI
mzi/D4rYQcYP5WpHbTdquLcCplmLtQqYNbYHGz+F3HQq6znh2QrVk9n1ybNceUUI
HkT/oWS9zahwVehqItYmtlDh49C0z5ImoNm5IWMTsHLV3ipaR6s=
=XGSe
-----END PGP SIGNATURE-----

--/XZhbe094dlICOwa--

--===============4065641382419278529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4065641382419278529==--
