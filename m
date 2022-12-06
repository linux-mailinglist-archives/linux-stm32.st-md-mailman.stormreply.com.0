Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E942A644969
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 17:36:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86AD8C65E6C;
	Tue,  6 Dec 2022 16:36:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8F0DC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 16:36:46 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s5so21011860edc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 08:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cu4l7c7T/KB912u2Bgs9LaIHGYUGD4KvKD2RT7SocLI=;
 b=PMIsbCZcJUnwlcb85e4se4Lhmnkg5/p3CZ/cDZsAukZ3f3i3tmY4g5sANJgykCYirK
 mlvGaIPbXgCyzpAmH06sYNk8vCmaADFoE6zZqQHb8hGg4x0/WHv6Z8hYJ0LBIWS+LTtc
 u+Elv8Ugh2Cba3MU9nJxstXdxBM91J+/NK6gRkjIOK3iiQ+uH5og/9UApeMWkOKnd9cj
 1HfW0ZgVT20uEcispZUyLDadLhenYxpl6mq5JxMXKgftr+gVs0wv+tsc+y54FBjZx7F/
 u//HOUZNxymJ9GIObTMD8FDbnCFX9F/nCVNnq/jzUgW6MoBC+f52FSuv+e3PAFbJwBdU
 tGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu4l7c7T/KB912u2Bgs9LaIHGYUGD4KvKD2RT7SocLI=;
 b=7nmPG8lhEkUkyfq5Fill1PY8nG+lY8bLsehm4SSaPgbgzKmRg3oH3GYFEF/DcZE3lb
 PYU3QfhE9saydFKZ4VeLm68o9lVyn3SiagfO5QGcMOUwF3ycBRWpUnsIIJNito5qp7qs
 LAjaqWvnS6nWrAGZPq+y0E0lAGXcgHNOkFgPcbxs+wbTjlL7LfYTsAFvVTOyJkMlNmR3
 o1IUOfhGJbCgrqE6fxDQBa6WPhw9rQ6uJg5O5rysWBze+oLzrKeslt+oXowmSdrwmuhC
 Y9APvFaqvDB1eHZCmLLmQtOD3u0/9DUFQYY6Dw1rIgZ69yQZsqe5DTV71pa7aZqEYH9V
 Xxqg==
X-Gm-Message-State: ANoB5pnckNwU64qIkPRosjYhl1nqlnQZo4qpt84KQec7pTuCJ5HATSvW
 0OMByj484g0JUbZu8Q7j/gc=
X-Google-Smtp-Source: AA0mqf73SzGZEjm/ohEPWqbfiYGIO3rXn2gObtryTw0s7vUBeNfZ9CzBOpFc3oS8A3V5nkWXr1+saw==
X-Received: by 2002:aa7:d1c5:0:b0:46b:a536:e8d0 with SMTP id
 g5-20020aa7d1c5000000b0046ba536e8d0mr26626675edp.261.1670344606270; 
 Tue, 06 Dec 2022 08:36:46 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a50eb94000000b004589da5e5cesm1168852edr.41.2022.12.06.08.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 08:36:45 -0800 (PST)
Date: Tue, 6 Dec 2022 17:36:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Y49vm34cwgilAA33@orome>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 8/9] media: dt-bindings: nvidia,
 tegra-cec: convert to DT schema
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
Content-Type: multipart/mixed; boundary="===============6069214672046795099=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6069214672046795099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Go2Ynh+Vu1nkhJ/W"
Content-Disposition: inline


--Go2Ynh+Vu1nkhJ/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 04:18:44PM +0100, Krzysztof Kozlowski wrote:
> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,te=
gra-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec=
=2Eyaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> new file mode 100644
> index 000000000000..9a4025ff7fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml

For consistency with other DT bindings on Tegra, it'd be good to name
this nvidia,tegra114-cec.yaml since that's the first generation where
this IP was added. Not a big deal, though.

> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvidia Tegra HDMI CEC

Again, for consistency with other bindings, NVIDIA is the preferred
spelling. It's not a big deal and could be fixed up in a subsequent
patch, there are a few other cases where the alternative spelling has
been used.

The rest looks okay, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--Go2Ynh+Vu1nkhJ/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOPb5sACgkQ3SOs138+
s6GLkQ/+JBbjUjYZFvRHaZqueKhqQcvpNxzAo/fyN5BnZRl/Dr6r9OkfSNoSVuEm
io5uqdiYDfXXvkApiv7BbHeNaXH8BX0PxRZ9J+hsE41zpGVHRHE+dmRlcE+rhY54
/TpkHx0VCMROkD6C1KQShCE4n9CQGRixLL2sHdhIWxmkaC2fLR609+duNNQ4t8Up
ASXC4hJuo1TaO31lGydUoB6S7SeU+iSO71B68Pc0HZ2cFib1ZnsdLPgK1gMJyO9q
ooyvj+IZsPX+YMfId0bMq9owxQRdqZhxSx58LOELQPR/5Ac8Cyfll70L9eZ9uw/8
5PKT6Eb5ilJnjfCDzF/ef8BGMBL1Ko5qoZBAdqE2Pgk01joFuRIclgZBHcujEaMl
ymMSnEla9I8thLrJ+8grukft6H6FcuKDnqsn4jhCoIm8b7tID+jyKCbmaBxb0AmC
VBn13BuYlSv6czihQawg9cfUyjnam/f6t/KksETr1Ne6HzC0qN7ZrxXNjcqFVB48
mrmKcUbT1adE4eq5czWTEExxckY91LIGSBxZVO6JFRp+13qv4HUV6ZfC8bHM+0x+
g8WACmp+9HsfNHLR53X2ASF7UIzPicMXNMw2SHK2Zx8y2/WF1MdWRkYIj9NpfkhD
eIbGX2q9nIG7nsmqzH66uQO59Wqdv40FseT6dQM5KPpNNz9Z8eI=
=2Wsf
-----END PGP SIGNATURE-----

--Go2Ynh+Vu1nkhJ/W--

--===============6069214672046795099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6069214672046795099==--
