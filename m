Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCE86D9879
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 15:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6351C6A61D;
	Thu,  6 Apr 2023 13:45:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFC04C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 13:45:20 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id by26so1525779ejb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680788720;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWxbTxHDU4JcHcqIFGeE5B91rGmVuRWUbY39VK5Io2I=;
 b=I3wPE9fF6ZQvwNt9wFEazeEQhvhd95Td/wzX9oOkgczXc6Zpic0WpzlmuS4PFXYHVc
 Nm2QIvafX0Y4osc6+a4d4+QaMX/iff5y7K8vEtHOmxHtreEQRHzV7y8LzdSkXETnpotL
 LoubqQZoUdju3N9i1moKCGrj9wAgCRW6yapdFIqrPjuBM6aMN1ipgzeXmdP80uY9ApqQ
 tx0amO7DIch7vlJFu30H1Cb08QlBZYiQbC36b3zg9/xQgV12ASiUdmgJD4jnw9RLaCVL
 r6sqlHloP3eo4hlIfcxVSqLfsg+AS1wbTccpxOksyePCinaiCKZaRPTUvwA5/NZ/I5uO
 27CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680788720;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWxbTxHDU4JcHcqIFGeE5B91rGmVuRWUbY39VK5Io2I=;
 b=qzODxnTnVr9eIQf/kDorXDfUGSz9dSE5oZlcHBQKDY3SppxuHMu1Uf0YEUexGc0Abp
 TDGu0xw2weXt4EcFNoBDMMA9Ljwt96eiEmd2iVz2i2LAyBEJqZ7ZqX/5TQw4QQQK0phC
 1adJdpXlDZToUn/x+uLMCzLq9OemYc3yc1/MeDvQHqDDyHNaOrUFDxQG4CQZu1m06Bds
 Sr+QTyWSm3XljWkFvEI/ld9gOFYlo9f1UykSXqrqlMUqk6aZW3M/B8JxALcEYvkztLsu
 8MJDzlEPKYxGNQyo6NcYsYhnR1rdeg+X76uDpWKcYDgU930Ck3WS0yLH3/iifSYSxGPK
 QrOA==
X-Gm-Message-State: AAQBX9e725wdI/YaGtQAdyuig/VTbhue/gFA9/SoCaF1pSLBcefBg/2v
 XVzJ1xetMGRB8pt7F1ntAgg=
X-Google-Smtp-Source: AKy350Zj176tWLpdtEztAu2yD1vTtRpDl6FObu/nSiFFfdgiZ43AZGdmoNkStWa8HKEzgAHBcdayGg==
X-Received: by 2002:a17:906:9441:b0:92b:7e6a:bca0 with SMTP id
 z1-20020a170906944100b0092b7e6abca0mr7077798ejx.14.1680788720378; 
 Thu, 06 Apr 2023 06:45:20 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a170906a20d00b008d044ede804sm826535ejy.163.2023.04.06.06.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:45:19 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:45:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZC7M7rpyEQaI4YJJ@orome>
References: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] pwm: rcar: drop of_match_ptr for
	ID table
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
Content-Type: multipart/mixed; boundary="===============5477972345573353426=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5477972345573353426==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qzk1RDxBtReFCSbK"
Content-Disposition: inline


--qzk1RDxBtReFCSbK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2023 at 02:51:19PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/pwm/pwm-rcar.c:252:34: error: =E2=80=98rcar_pwm_of_table=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Changes since v1:
> 1. Extend commit msg.
> ---
>  drivers/pwm/pwm-rcar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied both patches with an updated commit message clarifying the
exact configuration as pointed out by Uwe.

Thanks,
Thierry

--qzk1RDxBtReFCSbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQuzO4ACgkQ3SOs138+
s6Hudw//cWhnAimBrk1LA2VSwkIOTdBerLAIkizxv+nAArOFPffpfRnvvgECr6CF
W3g9chFQMrZbwrzsni42K8ru2dtugvNutPnefJqJgMB0qIviPcSLCxBgcwj6eZjM
ABf0gqnGeaIBMWn+fh9fjViV37QS3x7vSN8lecIY3fqcs5GHp3chptFSG7f+QPMJ
IwFPM+kxiSqBsyUd2Hg1HsCFv2pHilg4ZSHhN5NdyOM9VAELHgCTinSFrvSPbtQJ
xAWqMIVeQf1m2s1La6Xuj/KwTJ0gtD9NlpPpe4nkickMr08+TAJmcGWSlTiQ56Di
lBGS1FJ7XKwBt5Ksfo44//WgXI09C4rqV+2AGS6A0cdhWNZpANhk0zpt7TshcI0T
mYywBxlzx1x2r150DmADbas6bVmaU1mqoATNQhJwE1t7Uo8s0BSXOqFAu/98Tos7
L/3GLKF/7NuwgTE0C8mj3bgRsR7/o+KlXkUM1dvVEM6cBtsUgkX7AgSVAj2gWVbQ
rE+uiosENCxe756ODJLnqHgmw2hsIn5tGN4ebxl0kp+RCTzDVcfQjtmMbO1zJCVT
W+wFrGT7VLM2uaZ5q1M2uHmWKGzGRgxWGBhAXBll9UoMBa5UPV6lSNLSnwLxLgTn
nxZJ1TmDJfGUW1oTgvoarFDfUvAaaGu4O3KFnynPo0iybuembO0=
=TBNW
-----END PGP SIGNATURE-----

--qzk1RDxBtReFCSbK--

--===============5477972345573353426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5477972345573353426==--
