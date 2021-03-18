Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B442B3403F8
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 11:54:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BEE6C57B7B;
	Thu, 18 Mar 2021 10:54:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7C2C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 10:54:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 304AD64EF6;
 Thu, 18 Mar 2021 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616064888;
 bh=jKNzxVOtluBlw3sWcfi2a8h55RR1kuhcHLwoPXUuXNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DhnnIoJN0lNOxbLTPyMz8PT2FK0UyXjuPbDoNFgyPoo/bEihuxYqr/npgPYt+Eqi4
 BtjFysjtLHWPqewCE9t8v8leKgW/jDWrcQwklfPiZhk0VR9fk+Cx/KfmY7XCxgZWgP
 H1Cdpgi5X8Duts8q2od38N5pdcZNvTG8GoulyQpktFYJszJ+xVEISC0bqR7Bb3ZPZM
 x9XZbOqNVj5LMMvmHUv1+eC/2e+KhHcTokLc0ESH07W2ZkyiHkmYc5uhUctBCImXCC
 7ANbR6wK257lwVjyZVPe5y97khYwXHdBbCg3KiE2MH/G7+QpSu4mUoIBRUTjnI7MKz
 TCV53GjyE8WWw==
Date: Thu, 18 Mar 2021 11:54:46 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20210318105446.GE974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] i2c: stm32f7: add support for DNF
 i2c-digital-filter binding
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
Content-Type: multipart/mixed; boundary="===============3888995021452573487=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3888995021452573487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:42AM +0100, Alain Volmat wrote:
> Add the support for the i2c-digital-filter binding, allowing to enable
> the digital filter via the device-tree and indicate its value in the DT.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMXYACgkQFA3kzBSg
KbZGvg//Qt/rXoaq3I2LSLApIOkG9Zqt6hluxc/ZtzNTzPpac8rf3Pgygn6mFwxK
POSs9/q1k1rwtQnmmypL4fPvZ/SBiyEUSzGURWcx/hPw28P9kGNxVD2TZgsVzCgt
TVr8Gj5CmYFxyuDTnhk2hWloPUkCGxmg30+Mv8WZG6LaxQDNBxizxl5TNh5nj5KX
DOA1rhb8UbM/mV08Ce+2w10Ey5J0rT6xSmjPfFP9yol0+bsf2O5gVddyXWfQoUnf
Zy0IgVfDrZFbm//4ORn10BuWR0pAexwiUw1wjEn5+Kg76jUHkJMLUMUtgDkhmHKt
HlenoBaDSCTV3JdWJTeyq4EMeACCK01/DmavasUM7QqFtFiaGs0MxB+A6+NA/0bk
1joVv8VruYvOeAMEp6sd3IOgU7KKHEkGuWWLHMAgs07NkO1156bbso0S6fBntC1G
NwLEvdw4QhqDZAMMI/CDOzNfdQuLIEx2O4Dg3PKF/S1iuZmOZbRUDzP1YM5KkXLx
eOfug+uTKI38fz1R7xzB/Eu+YTJozPiP+SCqn4O/Ji3BAMUO1CTuat/FBTTLCOxt
n5yeSwtYxuqcu/Q9w3NGdzlgVZPNYa7a+Osm9yuUV1fFJicuYa4iB0huIdeAloEA
w6sMnkcgop193dfRKUDaJicib7c0qUX+wRI9Tl5gyPePhm8fuiU=
=HLHK
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--

--===============3888995021452573487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3888995021452573487==--
