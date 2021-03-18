Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC156340403
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 11:55:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93E37C57B7B;
	Thu, 18 Mar 2021 10:55:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86DC6C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 10:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56BDD64E07;
 Thu, 18 Mar 2021 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616064941;
 bh=DnDnR/amy0tbA1uOOeuAEvRXaySTXCSy8QbqyiVcoFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NbV5iHQfjQjT8vKHPrSs7b0Y4WA2kl9hpA6d2WjiBMnR8aXebHNboo/qZP+7t1//m
 s6PZ2HxgEXNhGB1yZiRcDwsUavh0q4EnWnxWY1Or8cRgcqv6tYeJeekkdKm/Q1s516
 Y/c6oIqCsSoCR+1GAHFDs2P6v8xR8BxaQlIV0irfFxQtvEDlRXn9irIovjgPZuyIyx
 TKGYYm3UtKtYs7FXiKOWV/sPIB46gmaeqBIyN2E+nanPu/5+QMH3U0Yo4xnIA6wuoZ
 /N4B8IsV5KPALvHYLmJyngLdcWhxNSokVcnodwvhrdLb/PtzFqLoVHUpMMf100KoET
 UUvzSHMHTiL0g==
Date: Thu, 18 Mar 2021 11:55:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210318105537.GF974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: enable the analog
 filter for all I2C nodes in stm32mp151
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
Content-Type: multipart/mixed; boundary="===============4245084792804270072=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4245084792804270072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline


--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:43AM +0100, Alain Volmat wrote:
> Enable the analog filter for all I2C nodes of the stm32mp151.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

I usually don't take DTS patches, but they can go in now via arm-soc as
I applied the patches to the driver.


--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMakACgkQFA3kzBSg
KbY7aA/9FQ41fh4wwSbiUTFPrcQMfKbF9cQPBfLGXmFBBGN6/baEyWZUxDWcOfFk
Q+XXFTWInRwTNgsiA0RsXokke2zn8Pq2Bi7Aq2rzmI+sPJMHCSsa4Yvm/rYdFcnR
ckuOqWr+sifZ/y0yaVyH9V7aFbIbTLcs0TQaqEpi+mvFTRCFQZiJLarHEDLYelU6
/s5sVO5AKgWP3PSKn2Xpngt3dldXzT16aj3zB/V5K93JtqqsGfIQ+DFeV4/WUnl8
8cnNRNqQnsXzbw7tsuoBkU1hwZuW2nKWzc0GB2xghHf5mAixBsj2IfPS8ZIUHhF3
ZTNB9u/3Do22tylCYxrZcJi2QgdW48HxWAsblSgYD8Wx9v+WBeQQZRK0c71+y7nZ
DXWt8TkiJpOymkbqpI63Z9Qf+4aY1VgO0aNHQevJoX78kLeo+SrIh6Ok3472lybR
DteS/lkUm4kKHKtJiQPqVOpjkzFIBOHRuCvZgq09TyIz/yKTVw+xkXKPxIhVjzUp
8ihrc0YgfKRzJTu/5sZLTv4lryQHuIy/M20GkoYxzJLRiwE3FW+SV2oxFjiqu8Am
n8WtIQpG7wHtsPFlaXIgKotXIibbNlUxxd2aACYX6//FkDhPbdQBEuajfq810Luc
p/ux85f/vDCzGXFdn/QjTACvCuz84NuTpUKir+d9WW0QQsSC7Oc=
=kVvg
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--

--===============4245084792804270072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4245084792804270072==--
