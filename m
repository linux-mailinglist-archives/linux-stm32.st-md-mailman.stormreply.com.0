Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CAABF934
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 17:27:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7C8EC7A826;
	Wed, 21 May 2025 15:27:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48E83C7A825
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 15:27:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2C5C5A4F0C9;
 Wed, 21 May 2025 15:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24733C4CEEF;
 Wed, 21 May 2025 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747841255;
 bh=5mMVj7zoSNrsqSxpmi4fJbUKy4RL0210P19TixtTxq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2TFrE20fMrmKXZ80cld55DvJ8DdxhLf8F7XawqoKWV6sIPp2pJeewXhZtad0WtZG
 ZOG7t/6paQbeTepTTu79f61Tt5Os0tJVpPPqMoApI00jtUBbMcyUBaBgCwX2oGLpFo
 1MvLGAdheHpx2DVozNxflJzeu03mnfKCnhEaxHplWcYJ0y9WmfxtS8JpQ+S6lPxgCI
 aZMd2HOiB3d0zEMX0x++DkxY947AoU3Z5zAvy3t1ggZMyZBGu2RxV4ZgMO4WJddnu9
 Y56dSdSD7gLDYOIj49w5J7Oq8bob7HRlqGsyQkwHBPNeKRLvm340LPD7l+loHK3Ql9
 wpnT2KJ0XyvdQ==
Date: Wed, 21 May 2025 16:27:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Message-ID: <20250521-lapdog-important-eab513a1f0c0@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes
 for STM32MP25 clock and reset bindings
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
Content-Type: multipart/mixed; boundary="===============6583885900932313112=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6583885900932313112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VmVkhvbJ+txMTgWr"
Content-Disposition: inline


--VmVkhvbJ+txMTgWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
> - drop minItems from access-controllers
> - remove rcc label from example
> - fixes typos
> - remove double '::' from 'See also::'
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VmVkhvbJ+txMTgWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3w4gAKCRB4tDGHoIJi
0pXnAQC8hATk3hUwzGttwspTMjh0lSDX8+wInM4ZNqQ+El50uwD/U1qOZLNLaKRf
GewLL+A/wyRnHVMpEQf/1LcRSOQreQo=
=mwyf
-----END PGP SIGNATURE-----

--VmVkhvbJ+txMTgWr--

--===============6583885900932313112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6583885900932313112==--
