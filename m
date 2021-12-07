Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DA46B5B2
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:25:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEF4C5F1E5;
	Tue,  7 Dec 2021 08:25:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41091C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:25:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id u17so20441578wrt.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Dec 2021 00:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4YlEfyGuTmDXWogHreM3HEOr8rkPGxqlzzFFm3Xfiy4=;
 b=ffvAuXb5kJHzfREehTKFvUUH09vCvdNH50SejEzrlyeectHx/A36dFNSykSxtll2xB
 XcKunvxaHKdpsTfe7e1hLc5jkoGWrICZc0xm3PI10gEtrrdVadfC1O1Q34cWmhjf5HAH
 yTvrXDWFKO7k7JK8cRv4ixVGK7xUIkx5qILEqTyCzfV0EH4iMpwxpqiUauXpgyAxcfFK
 J9KN0i6mVXbI2x3AZMYMYwPfQg1OFvsXv7zT9p9yYmfqrIJiasHBBBEGjWUSlONukmut
 HCufQltVSZW+FBKXPoLK82VJGpA68pdJ2gmD0+gXjVobj95BcmZTQ4FcThzeXfg2QC9r
 Axow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4YlEfyGuTmDXWogHreM3HEOr8rkPGxqlzzFFm3Xfiy4=;
 b=y5PL8oNlbwuxvam5+01pZGtxifw4XSqRKdZ8OahOvLFUiA2vDcz7tDhXHp0VMIQqD/
 4uaa45fiuzgLCN5btT6JWTV+eqGjn4qEjU7y+F5xHOG/+oM4RT7FIbHSwkQyXi8Rw3XB
 0KNZW75cekgoIMf7KzxHGQkm3V+Ocx151JARr2v/djYNgVQEQtvSeEPOsf7zS3xFedz5
 pBIDBo6FAfMW6i2z1/GsCZ682AsKSd4B/vmbZeMv0wJ7QXjAiBFYWgGZkgyquVLTvOPb
 9n/56ZVnHCkXBuCGHQSAwGtLXVHRHsLhZgw1wRqNjzD+kvX9rrn9ATTxYHy6DOQmSvU8
 4MTA==
X-Gm-Message-State: AOAM530pvPlLecoj9rRhksg3hAMMAHMutiteGsiB9NfSmkbMMmD5JHPq
 qFyUMUJlY9xK03ab0Le9Hcg=
X-Google-Smtp-Source: ABdhPJwbUL0fTO99+HdWSJwsFoxTmvpq4owS4lYyH4cCQYndpxbqVysByZe3TJgd7AZv1/OnljTdkg==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr49167922wri.322.1638865502795; 
 Tue, 07 Dec 2021 00:25:02 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id o4sm2081738wmq.31.2021.12.07.00.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:25:01 -0800 (PST)
Date: Tue, 7 Dec 2021 09:24:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <Ya8aWrMb805uPGt4@orome.fritz.box>
References: <20211206174133.2296265-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211206174133.2296265-1-robh@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com,
 Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: Add missing 'reg'
	property
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
Content-Type: multipart/mixed; boundary="===============1062312574913485412=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1062312574913485412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j4zidih6AkAbzGvE"
Content-Disposition: inline


--j4zidih6AkAbzGvE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 11:41:33AM -0600, Rob Herring wrote:
> With 'unevaluatedProperties' support implemented, the following warnings
> are generated in the nvmem examples:
>=20
> Documentation/devicetree/bindings/nvmem/st,stm32-romem.example.dt.yaml: e=
fuse@1fff7800: Unevaluated properties are not allowed ('reg' was unexpected)
> Documentation/devicetree/bindings/nvmem/rmem.example.dt.yaml: nvram@10000=
000: Unevaluated properties are not allowed ('reg' was unexpected)
> Documentation/devicetree/bindings/nvmem/brcm,nvram.example.dt.yaml: nvram=
@1eff0000: Unevaluated properties are not allowed ('reg' was unexpected)
>=20
> Add the missing 'reg' property definition.
>=20
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Cc: Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml     | 3 +++
>  Documentation/devicetree/bindings/nvmem/rmem.yaml           | 3 +++
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 3 +++
>  3 files changed, 9 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--j4zidih6AkAbzGvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvGloACgkQ3SOs138+
s6F0Hg//WQA8UyTwQry88qNWR9u3sktX7xIveJPuMNLvE7TLRbNIEHWutUHA4f1w
NuCeBlfpTWWlBC5g5LoGV2khS+TSI/amcdTQ3vvKAYyMy9tGByKfnGv0vXuz8ddM
0Q3opyzR+rp55TRdQoBqDWBWpUojYVeOpdfw9h8e5/H6eR3yVyx+CzpGZWDJWTi5
dyz5U0AX78TQeaWk2oo1lo1PMiG/Mn/hlaZMGm/seqeftGcrVXHPtn+jJcNlgSkK
m+ED7Fl604ryrPG8/HV2+UcgILWskHyVceCf7JEhBDocpLohubTXq53T1IixC+H5
r9uRb/AjzzIfaA+9ku/db2XOa0PkPizzY7DXAQSdBgsFa8TK7QAkX+5IXqqE0YAO
Qs4jf4EEMioMhB7g9as5YBf2jkNOuj/E2NcgEWvw2sybdyfb6QplwXMXAxImL1bH
1Hou+yCHGR6aVeJsXfLVe7ezBp6hF1FNspSOxYC72VmiMpg3kZKSxF9vavonj+CD
WOxjWQ/0wZzPNfv69Xd5PnviaHqY5ggJW6pl9VpZlyQjCiff2IUodDlUIUU3gR5I
C5YvipfJFFf2K4BsTae/Er7EIO2+3HId9swtVilMOwOnMm1S8Oh6aLZZkPHe4Pqg
SuVcQ19Yk0bR+PQ5zhlOIBv4Tn0H4omiRa9LQnRnEXXK5DukdVs=
=YdRa
-----END PGP SIGNATURE-----

--j4zidih6AkAbzGvE--

--===============1062312574913485412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1062312574913485412==--
