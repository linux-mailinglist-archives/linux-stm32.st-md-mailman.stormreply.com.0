Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEB723CA0B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 12:54:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ED32C36B3A;
	Wed,  5 Aug 2020 10:54:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EEE7C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 10:54:21 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E99452173E;
 Wed,  5 Aug 2020 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596624860;
 bh=itzMvNq8nfgP8VKXOJXPOoZfq8+Pd5YP4oo6JUWZy/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=daILxyCwv0M7mQeyhNXxvi03DAUtga5jJtqn9dQXwRgrXBcNva8DPZDusD/aFamB8
 Au9mHe9ABAS9MqqceMBsO7YPBu1LumIOWL9uh+TWE/OO/RKyxryVA4IqaKwGaUH9uK
 2Cbco3etFIjw9O/v4cujAsyuMP3cTEND8YVamfgM=
Date: Wed, 5 Aug 2020 11:53:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200805105357.GD5556@sirena.org.uk>
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-10-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1596610933-32599-10-git-send-email-alain.volmat@st.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/18] spi: stm32h7: fix race condition at
	end of transfer
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
Content-Type: multipart/mixed; boundary="===============3065428385354370456=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3065428385354370456==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 09:02:04AM +0200, Alain Volmat wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
>=20
> The caller of stm32_spi_transfer_one(), spi_transfer_one_message(),
> is waiting for us to call spi_finalize_current_transfer() and will
> eventually schedule a new transfer, if available.
> We should guarantee that the spi controller is really available
> before calling spi_finalize_current_transfer().
>=20
> Move the call to spi_finalize_current_transfer() _after_ the call
> to stm32_spi_disable().

This seems like a bug fix and should therefore be at the start of the
series so it can be sent to mainline without the new development work.

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8qj8UACgkQJNaLcl1U
h9BPMwf/SVAa/tykTrFSDmtKpWBCSoTEQyhwBfjKuq+rQf3+01Akz63PIPooThf4
4hcsMCzyVNfFiNhOCvCyeK5ccZ3iJ6ZX+CBzIp82qadb35VN1MNxMVwHPy2kshTW
8S+oKpDXRIFEiuKmDTBW22swtHCy8m01Ng4gQXvQPBhdjIpff4sl/kAMBxPRUFBS
TjkRi39WPFNwmRWRBrAxa99mmyOt0+83zOs0jjLRRJADsfoIaDdkISbFGJ517Wh1
10XUqNK0kNJC8hqj6rK7jgkgQeMW3vAQaimhlJzFbnjVOgtiW74zF03RPmxM1w6V
R+0IRfA+AzMkXP1gTek7e+vjuBraaQ==
=4szv
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--

--===============3065428385354370456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3065428385354370456==--
