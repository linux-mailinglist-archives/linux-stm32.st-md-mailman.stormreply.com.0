Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C33C4636200
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 15:40:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C2C2C6506F;
	Wed, 23 Nov 2022 14:40:33 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D143C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 14:40:31 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id j26so5382219qki.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 06:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kz0LuQHYwR1IVYCnxnd6r23v7LzIiHX/ImxeAU/8TJU=;
 b=e4uJ8SZmd27oXyqnenMSBkCujFM8krETeCDV1SNB714vs/5368IIzrdTppiYRYYBeA
 Dedarg1r757+xNiNE94WxWKdW1LpFsBFQGS0n664AtH1M4tFzF/rzF6MEsd7NWeGs84o
 dSyK2JSYTq2cwlALHnwKkGYGqnM+7GVKbCko3twE9b6rdT1gKNDnnPxH4lNx3HDaAZ4Q
 5eigcz6HADLpQ2uQS/rDbGRFxdi4NiPNfEZo1osyLl3Zu+0CN10IRDmNbPU51/J9S3os
 LG9iKBDLnm/L17WTu+R007fedMLxZIS+lLM1juWpNhuTNY9UKTM/bEPRJHWEIbjy6ywz
 OYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kz0LuQHYwR1IVYCnxnd6r23v7LzIiHX/ImxeAU/8TJU=;
 b=zD4pD3isW9VubNzlxjsc46JO++6z0QbovMeeoOD9WWrTKxX5DuONGqwy05JKY7Bjfm
 hP+Nq92VD4M0zn/qTmIfsDroeHBzYRYKAS0DjGmKwYUAgWTl9dHbtojgh/WWlKGamttx
 j6cp2Zulqg506hTTNglBbvrZZxebPlds/9FrqGwY/lYIC6QnYGiOs+O06rDNCeXUEc1O
 CI9OAkE7ai9wDLVPBGRkfai4fUHFeX73Cuy5SBU8BxuhdlzFn5IAHl2GodA+pq0KZNrF
 3oFWC+o8Frl8rcncpNogqLq7RnDyfvDMidSg3vlKCx37CLJsKitrMRQmvc8kt2krkBmX
 IKeg==
X-Gm-Message-State: ANoB5pnrp7m7mM0cC7B6vtoHLhiZ3IAdrUjObLoS62YlmdRwwHKrsctB
 1TcgBFLHf9woAbwjVxBRonBleA==
X-Google-Smtp-Source: AA0mqf6f0MDPV/iuxooMGg51/bf6XxMqtUg/KS/WCIylcctIF7X6pHS1ru7KSKKhkZxwGrIuUW1xEg==
X-Received: by 2002:a37:94c6:0:b0:6fa:2ff9:e9ca with SMTP id
 w189-20020a3794c6000000b006fa2ff9e9camr10506670qkd.29.1669214430309; 
 Wed, 23 Nov 2022 06:40:30 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 m125-20020a378a83000000b006cbc6e1478csm11642208qkd.57.2022.11.23.06.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 06:40:29 -0800 (PST)
Date: Tue, 22 Nov 2022 02:27:50 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Y3x59hNekCDuOFXT@fedora>
References: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: fix the check
 on arr and cmp registers update
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
Content-Type: multipart/mixed; boundary="===============7526227270797646806=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7526227270797646806==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0mgwEUJf1fyfHdJ1"
Content-Disposition: inline


--0mgwEUJf1fyfHdJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:36:09PM +0100, Fabrice Gasnier wrote:
> The ARR (auto reload register) and CMP (compare) registers are
> successively written. The status bits to check the update of these
> registers are polled together with regmap_read_poll_timeout().
> The condition to end the loop may become true, even if one of the register
> isn't correctly updated.
> So ensure both status bits are set before clearing them.
>=20
> Fixes: d8958824cf07 ("iio: counter: Add support for STM32 LPTimer")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-=
lptimer-cnt.c
> index d6b80b6dfc28..8439755559b2 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -69,7 +69,7 @@ static int stm32_lptim_set_enable_state(struct stm32_lp=
tim_cnt *priv,
> =20
>  	/* ensure CMP & ARR registers are properly written */
>  	ret =3D regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
> -				       (val & STM32_LPTIM_CMPOK_ARROK),
> +				       (val & STM32_LPTIM_CMPOK_ARROK) =3D=3D STM32_LPTIM_CMPOK_ARRO=
K,

This is a reasonable fix, but I don't like seeing so much happening in
an argument list -- it's easy to misunderstand what's going on which can
lead to further bugs the future. Pull out this condition to a dedicated
bool variable with a comment explaining why we need the equivalence
check (i.e. to ensure both status bits are set and not just one).

William Breathitt Gray

--0mgwEUJf1fyfHdJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3x59gAKCRC1SFbKvhIj
K6m4AQDYJtNkjZVyUJNcrrWZaOlUfodLz2Yx1BuFjg5YDeGpZAEA7CMFKO+r2JFh
jyelDpd6Evs3sxh1gwWAWDB4cv5E1gk=
=eIOy
-----END PGP SIGNATURE-----

--0mgwEUJf1fyfHdJ1--

--===============7526227270797646806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7526227270797646806==--
