Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31B706F77
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 19:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A48DC6B442;
	Wed, 17 May 2023 17:30:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DD4C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 17:30:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41A6261964;
 Wed, 17 May 2023 17:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60644C433EF;
 Wed, 17 May 2023 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684344606;
 bh=IvTb+46oPYwMB9EGNhmugY6I0xjp6TxZeov/IeB0P8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7Y/VqVfTJBCJa5GLyXgkRD+QqoZ66eahzP2VUe/emQ3Lb7gyz84ytXDPCrb6VBNa
 Eu2KUgIh8bBw58hZ3h3BhwvZXrKFTRbsqHJxraDSQQBkiPFOKaWfgP0RMOhX05xgsX
 tXXWg0LNs+gp/Fru6UyvvkqdB9UTie144m8wJtX8OLj+nAjzsQPXi8EnQKx/PAOzk3
 ct1OJlKAGJeqhR0vUhkRhsvFPmhwWX9jnfBwOIrQng8dhslRbZRj8LndQA39bGwOYI
 l85uzKx10jCNh6VaEbxG+6S/J34yzgZf2VvJ5Zkp/kcuV/tbnkwzt2nOts3J/DjPfu
 zZJr2CdsL7JPw==
Date: Wed, 17 May 2023 18:30:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20230517-bless-sterile-e35305fa70e3@spud>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-3-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230517143542.284029-3-raphael.gallais-pou@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: display: st,
 stm32-dsi: Remove unnecessary fields
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
Content-Type: multipart/mixed; boundary="===============7172727070670436119=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7172727070670436119==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eoRL2ml0lZ9nxAWN"
Content-Disposition: inline


--eoRL2ml0lZ9nxAWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 04:35:41PM +0200, Raphael Gallais-Pou wrote:
> "#address-cells" and "#size-cells" are two properties that are not
> mandatory. For instance, the DSI could refer to a bridge outside the scope
> of the node rather than include a 'panel@0' subnode. By doing so, address
> and size fields become then unnecessary, creating a warning at build time.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--eoRL2ml0lZ9nxAWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGUPGAAKCRB4tDGHoIJi
0sYPAP0bagnXi45xl7G332sbgQz2hLgro/DfudjfE3m/BtEHgAD5AYkXh6KYQ2IP
x0e+PKodvtu48I3DV8dvY4c1iQa69QQ=
=wkP+
-----END PGP SIGNATURE-----

--eoRL2ml0lZ9nxAWN--

--===============7172727070670436119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7172727070670436119==--
