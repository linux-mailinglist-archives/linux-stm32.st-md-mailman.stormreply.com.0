Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E42287076
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 10:09:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE9A8C32EA8;
	Thu,  8 Oct 2020 08:09:14 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 471F4C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 08:09:13 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7D1C01C0BA3; Thu,  8 Oct 2020 10:09:11 +0200 (CEST)
Date: Thu, 8 Oct 2020 10:09:09 +0200
From: Pavel Machek <pavel@ucw.cz>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20201008080909.GA31561@amd>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 4/5] docs: counter: Document character
	device interface
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
Content-Type: multipart/mixed; boundary="===============4905702576831998744=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4905702576831998744==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> +        int main(void)
> +        {
> +                struct pollfd pfd =3D { .events =3D POLLIN };
> +                struct counter_event event_data[2];
> +
> +                pfd.fd =3D open("/dev/counter0", O_RDWR);
> +
> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1);
> +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
> +
> +                for (;;) {
> +                        poll(&pfd, 1, -1);

Why do poll, when you are doing blocking read?

> +                        read(pfd.fd, event_data,  sizeof(event_data));

Does your new chrdev always guarantee returning complete buffer?

If so, should it behave like that?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9+ySUACgkQMOfwapXb+vKILgCdGWcMSFTNlT8BzJiXCxl8XH94
G+kAn1mYy8F8mA++sLAit6PznfuXTwgX
=pq8O
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

--===============4905702576831998744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4905702576831998744==--
