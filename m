Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ACD87409B
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 20:40:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C7D7C6A613;
	Wed,  6 Mar 2024 19:40:22 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9079CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 19:40:20 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-472754e41e7so29809137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 11:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709754019; x=1710358819;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FimmtqSvqEqbFvMuJNijf2tqqdZSK3fWXSJq7n19k98=;
 b=PAMi3jZ2fmvmTXILRFYhUfe8UlhU+vXUAvYVv7ExcZYvfk/6iB2QEN+T4Cqo47BrlX
 /WeBOcqI0T1Ny7RhNcAcnOqxPD3eQAhyMJbUY5OF9eJVbivJ3t/hTu70VDeJau1+CZLE
 /kXaVwXaa5Zy0luqyZiIMXvOncq5R7h6bh130szxYyHXoCVBmgiroyKWUEEguMkjnTB8
 ncakhCw1SEibEE/CXIoQphPZ+rQpf8Va+w7VVx2uAQgwzHOsGzyi9lOnKIbCvMho/BgV
 OpfZPRL8DMX+f7CmeMM+X0UseXuKj+TRGw33B2Zoh2z2+oOZvw4pFVpRtPvENZ9NNReY
 eCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754019; x=1710358819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FimmtqSvqEqbFvMuJNijf2tqqdZSK3fWXSJq7n19k98=;
 b=hg6dK8tVLSIcz72JmG6maDRXVH3Of4+VjCO5rL9wX7IPiepZj1536gYaW8Csfb/yx0
 9+KcjT99bUljick9DjUidmhOeHmfvBiuQR2SqOH7S3WHkkS8XE2mDdqROqdbcPSPta15
 rfNKiNXPTrOEjFYJo3BfbvPny4YWXLgl+GD/4VEVVmmer9FGcJtDevsLp0KFx/A6fZ2O
 HdRYIO+TP8Jcev4f25vM/5dMzf7odbAYtQYHcuJXIewZSDEMWlrXvlizEJ3H1+xbBuP5
 17RUtpyt2jcNJ8BPtPshJKPmX7lSEpkLvUmt5pgPfdNzvamtmCgQFWzybC7KnKZj+bgi
 b83g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/jOs72KRTOUg6xz/aVVdO0Sw+NqhxjFkacithxwtXC/AN7mgH8dVJynRyK/UdQ6n6qDZBjrP0+tvsmQCMM3D+DYnl5YSZuCquiaZyzzhKKg4rzTBi74Fk
X-Gm-Message-State: AOJu0Yyq5MU7I5RaypymGiEyo7MUhQniPrZx5CK94/y24wnAYvnrqJdR
 gJ3wMKsXAq8lEFN3/yzzYMXKon1jXeccKEYBOUT4BqX9MUMoJD2aEUyFrEffCjo=
X-Google-Smtp-Source: AGHT+IFOhv+r/bUzCCGiBr5OHd5VcarVt4eCtbw0P5hHbSyBkgUa/QGZ5B+jCpn573A0lhwZV9TGmw==
X-Received: by 2002:a67:c412:0:b0:472:e292:3933 with SMTP id
 c18-20020a67c412000000b00472e2923933mr4977115vsk.17.1709754019440; 
 Wed, 06 Mar 2024 11:40:19 -0800 (PST)
Received: from ishi ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 38-20020a9f22a9000000b007cb1514c862sm2305766uan.10.2024.03.06.11.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:40:18 -0800 (PST)
Date: Wed, 6 Mar 2024 14:40:17 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZejGoa8J5uReN0fg@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-10-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-10-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 09/11] counter: stm32-timer-cnt: probe
 number of channels from registers
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
Content-Type: multipart/mixed; boundary="===============3218278883052922875=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3218278883052922875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYYl/++2NBOFjIIm"
Content-Disposition: inline


--TYYl/++2NBOFjIIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:38:01PM +0100, Fabrice Gasnier wrote:
> Probe the number of capture compare channels, by writing CCER register bi=
ts
> and read them back. Take care to restore the register original value.
>=20
> This is a precursor patch to support capture channels.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--TYYl/++2NBOFjIIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZejGoQAKCRC1SFbKvhIj
K9rKAP4tIgFMewvSx7gbLKhcLYNMVQevAg9siIMXNnOlzExhTAD/TwMoxemDO0+A
xgY8nsPjYelz/A1209HizxjuPRgMfQo=
=roE/
-----END PGP SIGNATURE-----

--TYYl/++2NBOFjIIm--

--===============3218278883052922875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3218278883052922875==--
