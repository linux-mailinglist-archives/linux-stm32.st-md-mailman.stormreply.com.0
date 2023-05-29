Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82D714F27
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 20:06:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94320C6A614;
	Mon, 29 May 2023 18:06:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F20FEC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 18:06:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1237616FC;
 Mon, 29 May 2023 18:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B376C433EF;
 Mon, 29 May 2023 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685383583;
 bh=JlOqYA5PNKYDRGnDc492lVyo/u//gPIhjtNje7m6WP8=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=eHny8rGDrvxGzhzs3IUkg3qiVVQ+bYdI7+/J3Q8mu6+t9+5zjQcRYnaBwE7bAhdHK
 /8YW43Ff4vcOJZmtqiauWNxS79q1gV1HQ9dCut0KCvjQQ5uA3zmG2aiQHqXPUM1Qqo
 tjqesHGqrJAOaxutZC9/88kK7qFjLo5gq0UTNneFbBb/ODC9h9tadAh3TJ8jFsKsth
 5Gvah0fhAd9zNFW+OdIBWGateyhwR1lxByoNaPnrYR/Rq0+0jipkN3QToa4xGeXCFT
 UYS/fy/xjOoMVfoIBI5sRWozykV+8xl2MdCkxtr8A8oof4eDejweRTCYWUyvvGmrjR
 vgC6cVNulgGxw==
Date: Mon, 29 May 2023 19:06:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230529-dictation-subtract-54f4c0a97cef@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-9-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230529162034.20481-9-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/11] dt-bindings: stm32: document
	stm32mp257f-ev1 board
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
Content-Type: multipart/mixed; boundary="===============1841250659761093129=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1841250659761093129==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmDZkNNWuAgDypap"
Content-Disposition: inline


--wmDZkNNWuAgDypap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:31PM +0200, Alexandre Torgue wrote:
> Add new entry for stm32mp257f-ev1 board.
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--wmDZkNNWuAgDypap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpmQAKCRB4tDGHoIJi
0tdXAQDJKRZXXiz4bnG/DxWM1ywcpxVOAEoI19A5hBLfTLrDawD9HjJvOwtVe0Kz
tHW42t+uehGwmJ07RO7JcQywVXt0aAQ=
=/XQj
-----END PGP SIGNATURE-----

--wmDZkNNWuAgDypap--

--===============1841250659761093129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1841250659761093129==--
