Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6F320F4B
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Feb 2021 03:07:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36375C57B58;
	Mon, 22 Feb 2021 02:07:00 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B40F8C5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Feb 2021 02:06:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 75so9291499pgf.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Feb 2021 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xhNLe44uyMs5LsbL1fgroHtE+9CupcOCuWpPW2Az258=;
 b=KynMqR0wo5FgwY+V9XdF2O+8jfUZgqyYNukNNB1c+p9SUIFRkLGKZsTbGh4IPPWkhL
 b5VntJ6Uhc0omSr64yZaUVhPPX/3wEnLu5/CavIeuPXM6JZS9vx7XLPx8OEdMy1o81EZ
 YeoF4hUH9vAmRWxy0b22RGH3jnfZ7AgIfv+fnYSexdB621syQKOKCiY/FD84oeJN4w7O
 rySwOIQHqT2a1lnqi9un8lfJG4RqOfhE6KvWLPUDgAIiIaVg6tYZ3t/hFi2/5gvYcyYA
 0p3qs6k8iG8+j4gsy6WMdnchkPrFt0Yzdo4jBIflH+bVbFvEZB/PQlf2gIexkPmRz6cy
 Dd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xhNLe44uyMs5LsbL1fgroHtE+9CupcOCuWpPW2Az258=;
 b=BHdPhBl56c5rAA5/inCZ+AGeY2m2VrsQ9frMnl3WBKh536uUvpMSybfXxCv93NlVGN
 teBBos/048KeCcl8Hu09NLpzV3Mx/2h0d4m99xXGC+fDL89/B830Ba7DpN6zOzSu3WPU
 FjWFR7HaM9zN9SEBG4y/D24oaqO8cHjpY2aaOXFsJy+PKzrIe2akpYA8V+aBr21Oejok
 EbyKvGcnC1bxEPtqmyzJfbD6z1xMm7HgCCkdEQanuclB4OmkP23eDiNWsDwbjPUyOOgh
 0zJvmkmPAdlurJgqT6hyEOcGuHXpbcIGwZSBrH+ZyLqKuzhF354PIBCONb03PtR546CP
 fnAw==
X-Gm-Message-State: AOAM531GO6ZliOLHqjChsYwzVBiL2yq4TkopN98K3YrK8mtdJDXvhu7z
 NwLDpOEZszOpm7hDVLVtTdc=
X-Google-Smtp-Source: ABdhPJxpMtqDfZcoaUP4OMF63Yuj9xoqMlPgDRHHMencsT4VGb5ipoLyD9samLQ2h1eZjqZlhH/0pQ==
X-Received: by 2002:a62:1c0a:0:b029:1ed:3472:36c0 with SMTP id
 c10-20020a621c0a0000b02901ed347236c0mr13700373pfc.64.1613959616130; 
 Sun, 21 Feb 2021 18:06:56 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id c22sm15165633pfl.169.2021.02.21.18.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 18:06:55 -0800 (PST)
Date: Mon, 22 Feb 2021 11:06:49 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YDMRuTfazBev7fon@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <2be0c071e7730ea16b8faa1efcd3d0d908e7f9db.1613131238.git.vilhelm.gray@gmail.com>
 <8e7daaad-e824-a823-1465-327cbc90ab23@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <8e7daaad-e824-a823-1465-327cbc90ab23@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 03/22] counter: 104-quad-8: Return
 error when invalid mode during ceiling_write
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
Content-Type: multipart/mixed; boundary="===============4101244151030543818=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4101244151030543818==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/YbOQ52TSX5QvpA5"
Content-Disposition: inline


--/YbOQ52TSX5QvpA5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 10:30:03AM -0600, David Lechner wrote:
> On 2/12/21 6:13 AM, William Breathitt Gray wrote:
> > The 104-QUAD-8 only has two count modes where a ceiling value makes
> > sense: Range Limit and Modulo-N. Outside of these two modes, setting a
> > ceiling value is an invalid operation -- so let's report it as such by
> > returning -EINVAL.
> >=20
> > Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic in=
terface")
> > Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >   drivers/counter/104-quad-8.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> > index 9691f8612be8..f0608b21196a 100644
> > --- a/drivers/counter/104-quad-8.c
> > +++ b/drivers/counter/104-quad-8.c
> > @@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct c=
ounter_device *counter,
> >   	switch (priv->count_mode[count->id]) {
> >   	case 1:
> >   	case 3:
> > +		mutex_unlock(&priv->lock);
> >   		quad8_preset_register_set(priv, count->id, ceiling);
> > -		break;
> > +		return len;
> >   	}
> >  =20
> >   	mutex_unlock(&priv->lock);
> >  =20
> > -	return len;
> > +	return -EINVAL;
> >   }
> >  =20
> >   static ssize_t quad8_count_preset_enable_read(struct counter_device *=
counter,
> >=20
>=20
> What happens if the register is written to when in the wrong mode?
>=20
> If it doesn't hurt anything, I would suggest always writing the register
> instead so that users don't have to know worry about the fact that the mo=
de
> has to be set first.

Unfortunately this register is used for two different functions: as a
ceiling limit and as a preset value. When we're in the preset mode, the
value of this register will be used to set the counter value when an
interrupt occurs; whereas in ceiling mode, this value is used as the
upper counting limit for the counter. We should only set this value when
in the correct mode, lest we end clobbering the value for the other mode
(e.g. user sets ceiling value, but driver unexpectantly changes the
preset value).

William Breathitt Gray

--/YbOQ52TSX5QvpA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAzEbkACgkQhvpINdm7
VJL1CxAA42q+QCnTGNHPlJqhKTHAXIJHaKfmrLkcN2wDB/ceG4KPrs0Gr+Cpuw5B
wF9WlOmZCM8IAS1oC/flSZ0Uaziurx573EsBHCOYeHn1Tu0ITD2UyaqOYdFAmRKJ
PR5p6BdZqiZUeBa21fdMNg30vvkRyS94JcML889YF7KkDcsOHAld8virOD3dabhB
S5Kw/8eXSR05ajgnlLnlgy6BzjzgKWXVNqRWZBQHbDN0JeI6m7vxRMhcIWe4V5QQ
EK0pt1Hl6AsyxRqShZxKcknVRJ1Q2rbhnDIc8N7cxn+HolEBtEtxibh8GDMr4Vyq
xfCtZCnX6fUrp99L/boKOnnXTyPeJBhzpSXsD8+L0vWlHoPM7fxXxJrlj+X4JB0/
VpX/Uc4ub+EGQmidRim6znDBRiHWHcbk8Mirn2fU53ZYf5fwnGb9gxw+5z6WzEFA
RxrQCW8OySzNReQQNUELfxqKFpK2QIl+ox/R0yasDgAry3d55wcMD9kziKIiyi+W
QIbQfSLgI8IjteB8lIRmESQmBVs/FybUCULwElDI5/cta1gYRVBRm506b4Adwcx0
abgc8VK2A/0EySUKYpme61aQikIwyFJxBl7I1zpeY+ZleHqVTQhxsDWFieCMHvvH
GY0CUSAR58XdUskJjxj/N0PqmLHHbaxALhuCsL1nZET2to+WSQ8=
=3uyq
-----END PGP SIGNATURE-----

--/YbOQ52TSX5QvpA5--

--===============4101244151030543818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4101244151030543818==--
