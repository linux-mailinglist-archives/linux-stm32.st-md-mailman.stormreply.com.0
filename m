Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445FB4173A
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 09:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AEA1C3F95F;
	Wed,  3 Sep 2025 07:51:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26989C3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 07:51:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21AB9443C6;
 Wed,  3 Sep 2025 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1756885897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1CocstRRSzAohJcoaTSBgtYSwdX5wTjwztL33/hiTn8=;
 b=Yb+FWuiZlCkgr2nRaszUaQz4ELaVNBGTsxOosPE6Q6tYRI2SXHtayquSFRCfbiBJUrFHLq
 tNZFqqRZ8jmTNiI45G2qnZGjzKLjr6QVWOyIjW3yg5kip6htopHu2w+YZIpmKfYhLTarKZ
 6e8bdKV5SKGu8EbftKNbuPw+yKbrHYR4KJCuPm08jPQpIKCOWCY0F/Fm8bHKxkdFBZyln+
 juU/jrxerJxET4fr7aRgfOZ4woEULhwE3jH96u7HJGQaeZn7qJhcyU9C+YuKwEVmpQblNS
 lvO96WpzRTURd+mAWHaSgRFK8NptcEBOCOAgMSqapLxrqUeYV+xYPQ1rMhCV9Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrthhthhgvfidrghgvrhhlrggthhesrghlthgvrhgrrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [Linux-stm32]  Re: [PATCH v2 2/2] dt-bindings: net: renesas,
	rzn1-gmac: Constrain interrupts
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
Content-Type: multipart/mixed; boundary="===============1256049831336523121=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1256049831336523121==
Content-Type: multipart/signed; boundary="nextPart6217165.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6217165.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tuesday, 2 September 2025 17:40:53 CEST Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml index
> d9a8d586e260..16dd7a2631ab 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -30,6 +30,15 @@ properties:
>        - const: renesas,rzn1-gmac
>        - const: snps,dwmac
> 
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +
>    pcs-handle:
>      description:
>        phandle pointing to a PCS sub-node compatible with


LGTM.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart6217165.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmi3834ACgkQKCYAIARz
eA7RNg//V4dk6mgmH97uD+XYikoAmRYpNxcP1tF4TPEBmM8inft958wcps+BK+oj
rBOtT+EpaiI13HpLUFzOX6TSgY6L0DacsWoAJAbFJr7OuS/MuJjignny1UCNEm9R
ZFFCzMr0E3AlyPQ8WxgksOvop/ZzRKIodKsUMq4u0v6Y7inbV+UVJre1egV+ReDf
YSGjgS4HibKWrUbZCF4HjD8qglzueQ35C6eCpcDBU2+4mTBnVKwH32ZEg2ehJ+Cd
ohKKI9Jtg13/QqWZZsccjzdMNaOqMtRyhs9qFrHk9+ddgoGtD2ANJ2Ka56OQwvb0
Y02hNnji+IPla0tiioZf9ARG/yfV/zH02o4JAEXAbMXpv7ZPRa9ektGDDImYPahL
i7+NyCgDSOA0R6b0m0bToaZyIFf/VWPkoo8Z8AmrgiQo2d6flhfd5ce71GuIPQfC
WfhDHjQYDmB0wonkXg/HcSOc1R2WL/nf33jEVvr2q8lvikohEbYQHi848DEhZX4N
4LcIzz28RC/hiDRhKBhxkHGHjYoBcTsNjeD3Xk0IIqr2bEenInwNPnhFuSzlo1Zc
u616y3AZbqeu0tQHPDeMtBGP4/omxeVR7WalyXS5WdhrOJDsQdWJm5jmoodDCAeQ
1Zogcm8As8XDF5BZ91YvI/W5ojzJ/5gIJ8UcJZxheHO5i4bppU0=
=22P1
-----END PGP SIGNATURE-----

--nextPart6217165.DvuYhMxLoT--




--===============1256049831336523121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1256049831336523121==--



