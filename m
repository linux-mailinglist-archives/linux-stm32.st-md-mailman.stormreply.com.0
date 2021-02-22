Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5732100B
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Feb 2021 05:43:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD80C57B58;
	Mon, 22 Feb 2021 04:43:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EA39C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Feb 2021 04:43:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id c19so7673151pjq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Feb 2021 20:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nKtPFB1xyx73OQfeVTdioOSSM0I1Aror0iPkO5KBpc0=;
 b=Re2HcRKTF4oDMZmpesnJOT49BwGsqOQ5KGgusmwalLvCB7TfEYfXSeo69BzwRE689o
 z58SuWtj9UWQPTrO8Z6Ukn520ek2bdjIgYtTZh+TbOboMuZSsw+36lHU8Ya/QD29l5ki
 0giww37q0kTVuFy3iMPRR99RUBLWtg0PPIl+y96/9d0yXJHhCPfjRnXiJXZjBQw36mkp
 Ok8D7aZp4iitcIBZLJhf+1dLyovaqdm9lQK0Y0yd5hn7JHKWdg4t6aqvUrG3zoic/fqL
 ZQ4UHyytn1+2ls0uNt/rARQjCI9kM74p5UWoxT7ro7xyVwBBaqNf6JyfIprf7vHvg0K1
 YWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nKtPFB1xyx73OQfeVTdioOSSM0I1Aror0iPkO5KBpc0=;
 b=cmY2/JoiydwlzZTfJHBtknK8E1PLDHtlKPPQdOXAm7kfZdE5EBk6TI0oXT0Sb8XNUg
 5At+e90aTz8K+F8AfJBpDDI4rLq7HMVhDcFKEEpNr53R/pEtjpUaUAvr5ERy5fnjmQ8S
 BfHWJvb++J918i1fVUjD1NIqWpPWRxd3brybPFQeVqm241LGLVbN6mhsoXaNv6+/TM9D
 rP/EogwLknD8GMFxmikWWgahaeN1LzGWE27KkxcDyLIJD4M3Fd+fViyhjGwwTtzeiz05
 8lTYkBomcwjNINurkhfEWD11+giZb1P+/OJ+Cnv++iKZr+sVxWBZuF6zmaRm9/Cx+3fL
 TWlg==
X-Gm-Message-State: AOAM531S59ak92cr1j1UaMmN+O8cjnPRtRxtqZymU55LS1iK0es9QbzK
 96j4w7P1a+2PcdDFCtP8q7k=
X-Google-Smtp-Source: ABdhPJx4YWkwy4GkpN7j67wTtgRujttnGXkdr8fmpug5JI4lVDWB4gqo8OpDW5W+tWoXKI3txVZKjw==
X-Received: by 2002:a17:90a:6589:: with SMTP id
 k9mr21210384pjj.100.1613968978881; 
 Sun, 21 Feb 2021 20:42:58 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id js15sm8400296pjb.37.2021.02.21.20.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 20:42:58 -0800 (PST)
Date: Mon, 22 Feb 2021 13:42:51 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YDM2SzQgL+GAHhUV@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <58e7c59bb7c7bb94c8655903308842d9d9e9907a.1613131238.git.vilhelm.gray@gmail.com>
 <d5b53db8-395a-b77e-77fb-49f7fd0da231@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <d5b53db8-395a-b77e-77fb-49f7fd0da231@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 09/22] counter: Return error code on
	invalid modes
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
Content-Type: multipart/mixed; boundary="===============6289351559198622821=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6289351559198622821==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+2x3VvQXXETcoRB"
Content-Disposition: inline


--H+2x3VvQXXETcoRB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 10:43:06AM -0600, David Lechner wrote:
> On 2/12/21 6:13 AM, William Breathitt Gray wrote:
> > Only a select set of modes (function, action, etc.) are valid for a
> > given device configuration. This patch ensures that invalid modes result
> > in a return -EINVAL. Such a situation should never occur in reality, but
> > it's good to define a default switch cases for the sake of making the
> > intent of the code clear.
> >=20
> > Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> > Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > Cc: David Lechner <david@lechnology.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
>=20
> Reviewed-by: David Lechner <david@lechnology.com>
>=20
> (In response to Jonathan's comment, I think this is fine rather than
> adding more churn to change all of the breaks to returns - but will
> keep that in mind for future changes.)

Due to some other updates I'm making to this patchset, I went ahead
already and updated the breaks to returns in the few places where
applicable. The changes to this patch are minor, but being pedantic I'll
hold off on adding your Reviewed-by line until the next revision so you
have the opportunity to formally approve it.

William Breathitt Gray

--H+2x3VvQXXETcoRB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAzNkIACgkQhvpINdm7
VJK9rRAAyu8elp03L+LXeHNMXyjon3ijwzzn9y1RotPVZbIO3A1Ikd8HPRaFB1a2
mveObCiWyOmduF/wqTfzTD0yJ1PlfzyHmqynlw4rqAx5WIc1Tq3vezkl4EoVQCz4
kgaAZrcDNVcRXT2nrmGp7g4LP6hjTlTBD6hYWibN3II8b4iyFO/8VWCJO4U/ipJs
wjPNtbh9Zn6Eak6yIbGRGsaZ3g//Bk4I5AQGzCk2fKnh8i8W9FHgNzVvZ5nf2VFf
VuAplEmvItTnc4Ua1Qc0YzffEzasDbef0/lVaRyq95DsdJCLLoIxfYXiuvx8P25f
O0dR1GkfiFsviq0syAydVjOWvtyEeQZAJbwsuZCVu19ENhNNrk9BGh9WE94vG+Xi
2hFhG1Q6bCDnEQvoqUbBswvdQLtzHRUvfpoo8ZNfwRpjFqsp1bBBebdOO6TKWnH6
+7QvSQF2nEgCT2yxdnv9iu8mrp1wgg8fho+X4uQ+Iqil5lnPu2iG3aud6ooMwWOa
YfMwFdHhEotekumCwqXexOkCWOu8wJHrAPcbm+ojv5NBCsFhHvJ7aq5On9+zF+8g
BDhWcoRhQhfR6v6u2E52S8KdrQyr1x+mq2rbEy6URexMGlbJL7bPuaYNUHI43hfy
pPTwE5lV+R17oNpB0TSDABOVo7Y//VFE3DpwKlsSNx3QYOAhxEE=
=oo0o
-----END PGP SIGNATURE-----

--H+2x3VvQXXETcoRB--

--===============6289351559198622821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6289351559198622821==--
