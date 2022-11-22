Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D900636260
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 15:52:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F52AC6506F;
	Wed, 23 Nov 2022 14:52:07 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B502C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 14:52:05 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id g10so12539726qkl.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 06:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=knbxmQVIOU2Pd66Dq2acA052ZEHkRF2txPVugpmQJls=;
 b=vgoCKFZRKLg5X6KRRSHGgXpYEh2IpY5j6Jj0EMht5qtQ5vVTuqIdbNTURoY0AF/5w3
 UG4cMxe7+vdo7xqYJkf0wioum7PckU4FwTl2NM4DiiKgXdx7FnMC4v9HUQFX5HhpeP4f
 ioRAEFIoHR95thd4TYiEIm3w41NCD3rn69jUjdDuL3QUc6WPJ+TMpVp1CfAHmLz6tkbw
 jTKsJ8BYK53PPoLsQEtvfiR6S+b4KvrxJufS3BUv8ynKpLJd/r197eXTqmcNp2mSHqLw
 8kZrNl4pn4Q96xALlgZmACcrrISzshdRfuyDoktiEl/wr6ZepBXVza/Dl0sywh0Ofvtx
 178A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knbxmQVIOU2Pd66Dq2acA052ZEHkRF2txPVugpmQJls=;
 b=kcwCzfzi/Xcp52vBAr6vT6L6Ug6qgfmwfUMdcZMotSZbaMz0W5tj6n6OteQshDFDUj
 /oFxjSyeenMt+xbEC3Hjr3ddRut6ivTn9WOEiHlNBOQk3XaBYL+uY3lXX6xQWzUAAkU7
 7Dtr6Cc+cj2wSwVu4JwN+tcItGJ0Rj8A/E5ppcE7p/JaeUtQPs3Q/pg+soa1XqkdbvNB
 Hwe7E2wQ1Pexgsd+gWJEHkwnrLSOhVW4L5tpuIv1Q1ipRQ1jhdOe6z1k5HqMAmq2kIa5
 iimE2Bt/++fE2r1Ffa8NsJd8E7qHsNe2gHsAL3AR/pYk0UhTRqdhGOP7h2921PC2G8YX
 SfVA==
X-Gm-Message-State: ANoB5pna/+eytaj/d3VLAdLD4KUyXbbSKFUDd/Ia3d76vsn62ZmFPHyr
 hgewN4twMCG28+s1rlL1/AcdbQ==
X-Google-Smtp-Source: AA0mqf50nMaGK0F/5gySpgXWH3AhQK7OFs7Gu6ckRt9Fe7BUaW8hnqeaWOrFbDNOi68j5pTlArM48Q==
X-Received: by 2002:a37:2f44:0:b0:6fa:fc92:13fd with SMTP id
 v65-20020a372f44000000b006fafc9213fdmr25224598qkh.183.1669215123957; 
 Wed, 23 Nov 2022 06:52:03 -0800 (PST)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05620a248b00b006fb3884e10bsm12520572qkn.24.2022.11.23.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 06:52:03 -0800 (PST)
Date: Tue, 22 Nov 2022 02:33:52 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Y3x7YIBDT3xTeqtk@fedora>
References: <20221123133609.465614-1-fabrice.gasnier@foss.st.com>
 <Y3x59hNekCDuOFXT@fedora>
MIME-Version: 1.0
In-Reply-To: <Y3x59hNekCDuOFXT@fedora>
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
Content-Type: multipart/mixed; boundary="===============1794203696641850846=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1794203696641850846==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzBUpj5aqWF9hSSN"
Content-Disposition: inline


--pzBUpj5aqWF9hSSN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 02:27:50AM -0500, William Breathitt Gray wrote:
> On Wed, Nov 23, 2022 at 02:36:09PM +0100, Fabrice Gasnier wrote:
> > The ARR (auto reload register) and CMP (compare) registers are
> > successively written. The status bits to check the update of these
> > registers are polled together with regmap_read_poll_timeout().
> > The condition to end the loop may become true, even if one of the regis=
ter
> > isn't correctly updated.
> > So ensure both status bits are set before clearing them.
> >=20
> > Fixes: d8958824cf07 ("iio: counter: Add support for STM32 LPTimer")
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> >  drivers/counter/stm32-lptimer-cnt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm3=
2-lptimer-cnt.c
> > index d6b80b6dfc28..8439755559b2 100644
> > --- a/drivers/counter/stm32-lptimer-cnt.c
> > +++ b/drivers/counter/stm32-lptimer-cnt.c
> > @@ -69,7 +69,7 @@ static int stm32_lptim_set_enable_state(struct stm32_=
lptim_cnt *priv,
> > =20
> >  	/* ensure CMP & ARR registers are properly written */
> >  	ret =3D regmap_read_poll_timeout(priv->regmap, STM32_LPTIM_ISR, val,
> > -				       (val & STM32_LPTIM_CMPOK_ARROK),
> > +				       (val & STM32_LPTIM_CMPOK_ARROK) =3D=3D STM32_LPTIM_CMPOK_AR=
ROK,
>=20
> This is a reasonable fix, but I don't like seeing so much happening in
> an argument list -- it's easy to misunderstand what's going on which can
> lead to further bugs the future. Pull out this condition to a dedicated
> bool variable with a comment explaining why we need the equivalence
> check (i.e. to ensure both status bits are set and not just one).
>=20
> William Breathitt Gray

Alternatively, you could pull out just (val & STM32_LPTIM_CMPOK_ARROK)
to a separate variable and keep the equivalence condition inline if you
think it'll be clearer that way.

William Breathitt Gray

--pzBUpj5aqWF9hSSN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY3x7YAAKCRC1SFbKvhIj
K9w1AP98ZG3DrAmGPMHuLe6esFEn0tC6ND7mWOexsyUahUYdawD/R2NVJxw+1mLI
RQk8aAe4SpweKg5EY0hASmH+yqpo4A0=
=2pWS
-----END PGP SIGNATURE-----

--pzBUpj5aqWF9hSSN--

--===============1794203696641850846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1794203696641850846==--
