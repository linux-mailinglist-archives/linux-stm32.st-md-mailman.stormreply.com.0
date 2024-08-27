Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5796053F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 11:12:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15C69C6DD9A;
	Tue, 27 Aug 2024 09:12:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 944A3C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 09:12:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42819654737so44657705e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724749943; x=1725354743;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PZl2vCFO1281eoFnU2BPuzcAFcsLYdAlE5TlB6KUs7A=;
 b=R222JYI4SakUM5ydi9hwkbrwf3RSo2fgpmjrc7KIDXOQ71UHgfY6XZ9jxvBdxyHmLt
 aVjRQe5Eb7Xk6m4zi/sHr7c6GzJ9PRIXai8/ZrTplrRGS5OITPHQgSC3b6htlzIdYJr2
 9UtJ/pLNyhjqLlD6ss9dJ/blyyDL6qhffIZ9es9XjqRF4awmbfAeM+4YZ3aabhwW3SGS
 9dxCwjQVJMdqCTz+0UW8purh2UaXBWtfZhccDEbng+Q9jA0Mx9BuxZcy2Zb2ET+f+1c9
 CzgXPEdDscm3u9Ruci1cGxkZQKc5NP8L1R7rH2/EjklBSOKh4/jNCboyLFkz0p8vLNq3
 w7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724749943; x=1725354743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZl2vCFO1281eoFnU2BPuzcAFcsLYdAlE5TlB6KUs7A=;
 b=aUEvX83LCKAewmJ/Ud0GzHrFA067Cwje2WzeiWEKuf7QTBPYxrOX/8VlNohNJpsCMV
 jJmyY6Ah/szSrNLAqorhj9HXsVSueVr0v/uRe379BCjdMe2rNwf+AYijiHotdmoCmpxN
 neBYtHSpudA0QTDQZkEzugkhFFqdSDc8zL57XnHv2Ma5uvXLywLiK3gMjdVtZNn/3oIi
 vOMB/tP1QDOFED9me6Az8WAt+Jq9d/21gMHQtWcnnTdhPJo1j3vVPkHQmDs7rlxAERlP
 LCo6ljRcGemS0T46IDYLCb8ZZrtp/PJM9oF9yQQP6GEDWUpPEnija+1OSTyrCO5AOu8P
 ubvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE5AEoytGrS6SIsvsnjvTJ6Nm4qAOaqPkdY+GUzV5BKaBieTZDImVUWYt14iYHQkEzUPBMUeeezp4Saw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxAjMGIYApKoS4EdNrea+bijZiSRbTjNpkDhCHyNvpEzNgsqC7
 PuOBJELNBWUNGu4bxWlQrBkTyECrJ83PGrBlfC3YS79tq4qln17h
X-Google-Smtp-Source: AGHT+IFrH1pE6tC+TQJPd5XlVKe0OED8mLEGfHKVZm18+ThOAIlLOC9xj1SU4ZgwBYz9RdlGvzKzUA==
X-Received: by 2002:a7b:c40a:0:b0:428:e820:37ae with SMTP id
 5b1f17b1804b1-42b8a0516b1mr69014115e9.1.1724749942211; 
 Tue, 27 Aug 2024 02:12:22 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5158485sm178380545e9.13.2024.08.27.02.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:12:21 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:12:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <qqdysgpkbfwfnelu6epeb2gwqgdo7xgc6x3yhkuahlaswy5lyo@gh5vfwnigbpa>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <641cf75c-3b6f-4913-ab49-5d0ee821780e@kernel.org>
MIME-Version: 1.0
In-Reply-To: <641cf75c-3b6f-4913-ab49-5d0ee821780e@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/13] memory: simplify with
 scoped/cleanup.h for device nodes
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
Content-Type: multipart/mixed; boundary="===============0575890909125193690=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0575890909125193690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n64k4hkfi6aufqrw"
Content-Disposition: inline


--n64k4hkfi6aufqrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 01:41:54PM GMT, Krzysztof Kozlowski wrote:
> On 16/08/2024 12:54, Krzysztof Kozlowski wrote:
> > Changes in v2:
> > - Add tags
> > - Wrap lines before of_parse_phandle() (Jonathan)
> > - Few new patches (see individual changelogs)
> > - Link to v1: https://lore.kernel.org/r/20240812-cleanup-h-of-node-put-=
memory-v1-0-5065a8f361d2@linaro.org
> >=20
> > Make code a bit simpler and smaller by using cleanup.h when handling
> > device nodes.
> >=20
> > Best regards,
>=20
> Rebased (some changes around ti-aemif) and applied.

Oh heh... nevermind those Acked-bys that I just sent out then. =3D)

Thierry

--n64k4hkfi6aufqrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNmHMACgkQ3SOs138+
s6EojA//YW130a8HBrEqedkHaXwnQAIP7qPmM2Evewmi9wcBVZNgz1GVGpjhOQUX
XBXltrFkOsbOYojaRZKrXcl2bmgvuEAwrq0qaYqC4YWST4KyMKuXj8W/3QEroxBF
a76eC9KwmBUawTg3hrMk+b8kryDem56xMx66AxPPpCXxL89JayAjAe0AahXquHNI
b+Jow1N6uapZMudoQugWsMC/huRcJ+/BA4FAJgi5QgLV3IovkipCnqgTlnRFGuLs
FViWpdSAAmCuAxsjBzbQTRc0LnfwrEQPOwuJDiJ6E3OpA6cg5pAgN5ahJqZLdagt
pT7UNzdwG1LnwVa6lg12rMeIENhhQpUUoRkKRGl9kuUYWPr4idTPQLFsB/5Q36BI
sNSLCXzzxSk5c+9Zxr+k13Yf5DLjp+sgdBdUeFOwQQnqLjhvgnpULlsiXBZNC4A5
NTLropv5Bh0pBaKaolxtjQ190QNDrtmCA1ZhF+mf9MkDE+ZdAK/XnTIIdfDDD6Hd
l90kYTSvscD9W2WqzO7f2UqmZABIAyvqZ/j49JKFQLhiOi4iYp4KQzWdQgDKaFyW
+GBloBNtOQflVimd5yt3LeXffkm8jfrGYY4U+yRTmcHgWKrT5tikjO5t7YwrpJjX
8ttg2+qAQ1m9vldrAVju+MoF+9gQEJZGxtJy+a6xgjshhPU5zhc=
=V649
-----END PGP SIGNATURE-----

--n64k4hkfi6aufqrw--

--===============0575890909125193690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0575890909125193690==--
