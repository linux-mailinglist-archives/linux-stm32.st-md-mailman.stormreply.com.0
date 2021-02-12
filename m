Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F37319C74
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 11:16:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D481C57B5A;
	Fri, 12 Feb 2021 10:16:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F3C6C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 10:16:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F9CE64E57;
 Fri, 12 Feb 2021 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613124962;
 bh=VFUsungzZqooziKm9KBKtUmrjVmAmKtrpEiMVbY0kQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEF4kCQin2Brrzoz2QDUTScLq3WAuguEp+3tLn2z76Ozg7sqcPfMgRQxH4OJXjYEk
 PJKdwdBgQ8uLwG5eW75qp07CMAuTIZtC5fsnEObU14w8QUi3/6aSwPAiNzVedHEqly
 zeBjzWn0QEqP1MSvL5AKm5k9wLe3T9Q1hHIq4gG/+NpbLC2sux7o/8tTNEWcUBIJkj
 Sc+KS/7hPemmrVYPlqk4EouZgveDMR+C3oDBOkdj0Jmo3oVMEnlAxdqccF7M/m6+59
 ptL3cg+jPCJR4zcDeeLdhyec32rRmI6qIVxnroP13c3yAjv2YHgEo3JNqDm37XBul4
 NCccg+tmFLmAw==
Date: Fri, 12 Feb 2021 11:15:54 +0100
From: Wolfram Sang <wsa@kernel.org>
To: menglong8.dong@gmail.com
Message-ID: <20210212101554.GB8038@ninjato>
References: <20210112085311.7308-1-dong.menglong@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20210112085311.7308-1-dong.menglong@zte.com.cn>
Cc: Menglong Dong <dong.menglong@zte.com.cn>, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: remove redundant error print in
	stm32f7_i2c_probe
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
Content-Type: multipart/mixed; boundary="===============0952262755416325771=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0952262755416325771==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 12:53:11AM -0800, menglong8.dong@gmail.com wrote:
> From: Menglong Dong <dong.menglong@zte.com.cn>
>=20
> Coccinelle reports a redundant error print in stm32f7_i2c_probe.
> As 'platform_get_irq' already prints the error message, error
> print here is redundant and can be removed.
>=20
> Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>

Applied to for-next, thanks!

@maintainers: it would be helpful/faster if I could get an ack from you
beforehand.


--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmVVoACgkQFA3kzBSg
KbYKAw/+PDeUcjlo2xoGrNaTwJoDDUrsWYVwsC+nASaoztdWl9k0lj9jyAJGEd2R
U+iuCErfC/dHQodaeuWzMZU3Agh55DwCDj3//DIlJ6ctt81gAYRqQTBF2DPudX8t
MTsKl/Um6uHVuX3MK97yxtjPS/G41TlCB9ezeVfMyNfdNjmsHgXFySI8VxFdfaS2
QxqSKj1WmNnalBE3ruNAKuNRKEpHyCGz2SOvhldlG789qSIdn92Pod5E6oAbxaEt
O7w5aSeGYANShNGZCZwT7uGYyL5Sw6eKTHuPNJX659KrboDr5d8zOXIhzVBxJMNQ
PqIRmx8aLUVLnXZ0WoZ4G++ehLTTJI6UCMlpJ1CUGfiPKRMZfmd95eZuqeiNg/RN
1z+7bgCJo5PFQmH7hu7qP2xtG2Pm9nyGWx1Xg+JhRiXeX4Cos9x3bGiMYT9Q1Kdb
ujRK53S6KFW1ePYpjMcWze5KENNf2WKgmUusauAToXb1GsHhKQWuQg/JAyANorvQ
vCYIfoLITDQmJr8OATyp+oK1PncvxcPetBgwHOfIOOfKxPDEcafVskvKlfO9MPXg
lZJAnGB5wUdkvdGQrI4GUb4ubywt2CnxB5GoR/mKNDKYZgSl7aq2RDmQgnC0ASQ0
ZHIyh9Jvo2D8cyWFRPIM7FKC4gyz/IIeUuo1Caj9C2/32qMyydw=
=O1pu
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--

--===============0952262755416325771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0952262755416325771==--
