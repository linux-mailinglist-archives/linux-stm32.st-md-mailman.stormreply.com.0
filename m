Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40F239C1F
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Aug 2020 23:11:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCC8C36B3A;
	Sun,  2 Aug 2020 21:11:48 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DF28C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Aug 2020 21:11:46 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o22so26670755qtt.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Aug 2020 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fb/5Z4B9XTfuOtDzpHUsVEiu68aR/8vaP+1Ul+5zysY=;
 b=A/40hBU26L6V8L9Q9KC9iqoc+cuwy+OeTq6dxy+WtYDAgzmFhIOILnphkvgPpsmI15
 CMOr74ofUFFqh2JwgrbhUe2SJlwBxN+il7sjtV9TOd2/0+agZ+DUK/vn4DOsVD15GVRF
 1U/WHc6SI9XHVvVZq/UTkf67ANDtINQvYqewjRmYdnx1vs9zugBK4LNQXyHI/ATiZZ3E
 P1ghMB2RnKSu/fsYiPEj4/Bd9X/Iq/VMeERH2QzXxqpxzWudnafHWmMjV3+8raxQySBw
 oiHfkKafR0RJJpZz5XKgqQ/SbwG17N+Q6irN+ohboHPFmy0dqrDPcH9GylHU37+F6++p
 0EiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fb/5Z4B9XTfuOtDzpHUsVEiu68aR/8vaP+1Ul+5zysY=;
 b=shG4cNXzmZPx+8Mqm8cyzyty7IpjAZawxo5Tkvv6o5QIhZ+FoiT9+DDmvQc2Rq70Hj
 cPgSgWmW7FKeqgqA9AhhdMBBCs+VKK4VW5vL1OP8UTEeBud5oBpalZqad/naMr2Y3ZXt
 a0+X9pTzOmnbYmMkg479156Rr92EfGdf7IFwPjykI8UzWxz9DF4xIE4DDlSIM6yrT+zE
 xsq0uHuuSgLsfGOgzNRIz29+bRbojD1YNiIKXw97uNNU+L5crqkc4SYfnmonzD/6KBUl
 bPlbymfG3lJyspP5cZ9XXoDzfb4Kwyx8LmnlYepiejXyOYfua8IOxCWKoo7pehLNr33m
 0/nA==
X-Gm-Message-State: AOAM531oSK6PexcUQODEVUPNKHEpeOGBz9pf3E5te2fOrM5qzDlgfglM
 kasTRqqHCKT3AfFUE+vEAXM=
X-Google-Smtp-Source: ABdhPJxJoXweorg+JFUfS6GWb438JSRsl1RcLLbLR+eW5jhNlDZUf5HAuHFcCAZNWdq1qNGO/6FrqQ==
X-Received: by 2002:ac8:24d:: with SMTP id o13mr13596339qtg.154.1596402705134; 
 Sun, 02 Aug 2020 14:11:45 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id q68sm17443130qke.123.2020.08.02.14.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 14:11:44 -0700 (PDT)
Date: Sun, 2 Aug 2020 17:11:42 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200802211142.GB606173@shinobu>
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <08b3ac7349a59ba7fa5cd438bbe78360842ccd11.1595358237.git.vilhelm.gray@gmail.com>
 <415ee9ad-255e-cee7-22a6-ffa977999691@lechnology.com>
 <a287770b-c263-f1db-bcc4-d901d3ff3c7c@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <a287770b-c263-f1db-bcc4-d901d3ff3c7c@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 3/5] counter: Add character device
	interface
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
Content-Type: multipart/mixed; boundary="===============5066391260852536226=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5066391260852536226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 05:49:37PM -0500, David Lechner wrote:
> On 7/28/20 7:20 PM, David Lechner wrote:
> > On 7/21/20 2:35 PM, William Breathitt Gray wrote:
> >> This patch introduces a character device interface for the Counter
> >> subsystem. Device data is exposed through standard character device re=
ad
> >> operations. Device data is gathered when a Counter event is pushed by
> >> the respective Counter device driver. Configuration is handled via ioc=
tl
> >> operations on the respective Counter character device node.
> >=20
> > This sounds similar to triggers and buffers in the iio subsystem. And
> > I can see how it might be useful in some cases. But I think it would not
> > give the desired results when performance is important.
> >=20
>=20
> By the way, I really appreciate the work you have done here. When reviewi=
ng
> code, it is easy to point out what is wrong or we don't like and to not
> mention all the parts that are good. And there is a lot of really good wo=
rk
> here already.
>=20
> I've been working on this all week to try out some of my suggestions and
> I'm not getting very far. This is a very difficult problem to solve!
>=20
> I just wanted to mention this since I responded to this patch series
> already but I am still learning and trying things. So I may have more/
> different feedback in the future and I may decide some of my suggestions
> are not so good. :-)
>=20
> And one more thing, there was a nice talk at the Embedded Linux
> Conference last month about lessons learned from designing a userspace
> API for the GPIO subsystem [1]. Unfortunately, there is no video yet,
> but the slides might have some helpful ideas about mistakes to avoid.
>=20
> [1]: https://elinux.org/ELC_2020_Presentations

Thanks! I appreciate the words of encouragement. :-)

This is a big endeavor so I'm expecting a lot of mistakes and changes
along the way. Since we're designing a new userspace interface as well,
I want to make sure it's correct before we commit it, because when it's
finally introduced we're basically stuck with it. So I'm happy when
mistakes are found because it saves me from having to live with those
later after the interface is live.

I'll respond to your PATCH 3/5 review later this week or coming weekend
when I get the chance.

Thanks again,

William Breathitt Gray

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8nLA0ACgkQhvpINdm7
VJInMhAAqVGmbjhms6aBJfCZ+LH6WB9U1RvePeF1nw9cH70V1Wiw0/OLYGMYm1YX
zuhQrO8cc20cSWVQgrdl2m6ykbhShMGK1BzJiMW+ehYVdUZWOygKrNJRxxzGyo2m
DLHJox16JauHPhwZhxCx+ZDmzDbC0P99H16CsGYccxlFkbGb4MZgOtG1xtw/wM3h
1ctob4WXoRdwZcHzFAsDZoLjrdkSPcArMDcLeNcThdcsex33WPT+Toexlo6ILnPi
aWalbYwymW7jybV6OsN9T+ENN+6gIPGIHcJlLvL26slXgvrxfZXL4gHY0yOgsmew
1b63J9MfIFNrZOYT4kXR1iMPCloeTqLzwbNuNI+rPjzIVLAiAEUp6WruCsEY37l0
+wcq+L38ZnC1fWqP3DdnsYhTFbU0cuqbDhQpyvLMCV0kRCKcd8ifoe4BcUdhcHRe
edgLdRPmqu/rp9EpNPQ1UFWcmQ1brSXWH5J4nWlx1Ay31Fqu6lgJvGfIq/LphT5Q
kJ+uPq4sUFnttPYwolNcnRHjXPTdn8/a4KdrNm7k1uGXek2NgQhy6gBkR68Ii4hX
dpD/Os7d5WP3AZY7sVsIpJ2vDR37+s1s/MOWoFz5z9cLsItiErt9EgNclNagwXzS
0KHohQrPWLr5MTPzG7ELJpfZVks8ej5AlY9TONpIcqahGvWuWMo=
=g0cP
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--

--===============5066391260852536226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5066391260852536226==--
