Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E3AD8A13
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 13:12:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51E6AC36B36;
	Fri, 13 Jun 2025 11:12:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C457FC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 11:12:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F25544A96D;
 Fri, 13 Jun 2025 11:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE8AC4CEF1;
 Fri, 13 Jun 2025 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749813156;
 bh=3JSffdcKG1BEdfLxDkvCLXE5WcpkgQe1rrYaCHuFNrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4kKdw9SM2bno1fEAUiCi6mw5ZmG2oOwM9TdgZeIyT1IQbX7X77HcJ1LYqfuskboa
 JGRT3GgKJU7HfdKVHhEwM6RbZVBVlK/P5c4ZU4IqGpHDoM9jVWM/ytqZuhOEoKayrO
 xTsq76VB+ZzyRppRpOMFJJN6JOHbjdwagkrEFx3Ng0/lhqAyAceklyVmJaQug8641Q
 JSHHo90KaBC05xuTm1/zTU/9LwbDwYf8mzg7yZYfDEuuM89nlEVvUy9Ws3qrTN5xaj
 +W1kJlaU5hXI6P9GIWNe9FGwWwkVeh7uwqDhoiXxU9TaeL0RzbPSSxvPd6dZscVPeL
 2OG33FATjlbqg==
Date: Fri, 13 Jun 2025 12:12:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <f38ea320-8eaa-4eea-85c1-63d44c8d359a@sirena.org.uk>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-14-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20250612-byeword-update-v1-14-f4afb8f6313f@collabora.com>
X-Cookie: Use extra care when cleaning on stairs.
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yury Norov <yury.norov@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 linux-sound@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Qin Jian <qinjian@cqplus1.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Justin Stitt <justinstitt@google.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 14/20] ASoC: rockchip: i2s-tdm: switch to
 HWORD_UPDATE_CONST macro
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
Content-Type: multipart/mixed; boundary="===============7440618258289467371=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7440618258289467371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoywhozqJ8iTP5HR"
Content-Disposition: inline


--EoywhozqJ8iTP5HR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:56:16PM +0200, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
>=20
> Replace the implementation of this driver's HIWORD_UPDATE macro with an
> instance of HWORD_UPDATE_CONST. The const variant is chosen here because
> some of the header defines are then used in initializers.

Acked-by: Mark Brown <broonie@kernel.org>

--EoywhozqJ8iTP5HR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMB5YACgkQJNaLcl1U
h9Bobgf/dsPkAlIpLO/GS4oVRLlRiPIWa/agIoUuXFfDugqesR7MdX12gZHAzJ9s
BnznMlPSuOjDnlFPdVpRCgVr4iPfs88ixFAuy/SjKEjvV8VYAUBEs1sg2JykJyMZ
SkQ69/Iii/uButuWqecqljEHZvL7j67axT7KsEimeZ1zynLexrz7vtE6t4P8p+YE
7qrc1oKA5kjXrIug8enyLvuLzI75M7MfzuRaooCPej44mc4bjqpuH6zXCxPzAWt9
0LEzYDn7kdMZ5Yn0Vp35b8uKRqPdQs1heacEsmiHmKPfvnY/klYg1G9M71t9OVpm
EE2sy3C4QrYbYl73/UBH9Z7zoN/X2A==
=9PDr
-----END PGP SIGNATURE-----

--EoywhozqJ8iTP5HR--

--===============7440618258289467371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7440618258289467371==--
