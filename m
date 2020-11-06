Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640E2A9655
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 13:42:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC30BC3FAD5
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 12:42:36 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D45C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 12:42:35 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id y197so853767qkb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Nov 2020 04:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mmSROBLr7qTyDK5MeM29D+hPI+10Zlk+TD1mvS+sayA=;
 b=fLIkLfFLJao5C5NhVKY9MYO0q9vG2+SyXw6EleHWU0ykhsL5/MGhuN1gY8+T4AtM+r
 bJwVq9gmxCE9AOIY4W1b/4XMcek6fBSKiY+3AlYJujQ65TLY4uKvhDKn6IiY+sl5wzTF
 2K3sDSy58RcC+D8i9pxvIMXh96kBDn4i5SsrNy6TKLRaJJJqxJ4E6OOr5LnLoi2NAPtG
 3inSqyEl1/DMp8+VHeEpP7aN3GKl60xDXaQT8QJsHgbEPK4uIm11u3AiefZMfgGlK5Sy
 PpkjfWJjx1fzE9/Dmwt1BfdLaqiKIf2FGMbyRWlw/BzNePNiDHar2yIVKjJbJbQKAY4F
 gdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mmSROBLr7qTyDK5MeM29D+hPI+10Zlk+TD1mvS+sayA=;
 b=Am5M4oRNsK9O9HtUlRBC8hj0SJKbqLqypm/Ebg9h8xXNRNRsxyAFxniH+d/jg+7q3P
 ZlNqN6hzXQMCCY5Kt5ll+YiFCBz6w94PpT+jp+9/4uthwRTF8pPyMWUWVGbeEzzluhyd
 lUyvl9KMW2iP9mN19xZ1I8Q1vXyBsNjOdexVwD/C5d1EXJU432yBKVaKti/xT3liseN+
 FWm3TUcUuyo8UYDezZKEmQ4NgoeNKURbZkSOfnWp66VsIohV+gzR4mPM+XlcIPpecJEj
 vDCe95gNWhEPFP0THOFValGPPUDVtzHOkP/Y7APLbREpm6ehct/z6Yaius/QSYvN+bOU
 B+yg==
X-Gm-Message-State: AOAM5336KSKeqmN6n9WVjpYZY2Cb2hm/Hxu3oviq1ZDnpzXE5xHyw+pN
 qPQQnKtMu30fnENktGKf8+A=
X-Google-Smtp-Source: ABdhPJz+x7n4rUjf4oIoJdeh6d8gec6X3dn+fZEHdSdzVcqy/djqfsTjZZnpdAHVnrTYcxSoPB/C+g==
X-Received: by 2002:a37:a80b:: with SMTP id r11mr1232848qke.380.1604666554176; 
 Fri, 06 Nov 2020 04:42:34 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id h9sm387832qth.78.2020.11.06.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 04:42:33 -0800 (PST)
Date: Fri, 6 Nov 2020 07:42:17 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201106124217.GA4015@shinobu>
References: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-iio@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] Counter device Interface for reading out input
	capture
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
Content-Type: multipart/mixed; boundary="===============2311685688165470311=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2311685688165470311==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 07:46:14PM +0100, Ahmad Fatoum wrote:
> Hello Benjamin,
> Hello Fabrice,
>=20
> In the stm32-timer-cnt driver I find unused #defines for TIM_CCMR_MASK and
> TIM_CCER_MASK, which to me hint that support for the "input capture mode"=
[1]
> was implemented but removed prior to upstreaming.
>=20
> It doesn't look like the counter device API is yet made to support such
> an input capture mode (latching a counter value on an external event, e.g.
> to timestamp incoming rising edges to measure jitter between pulses).
>=20
> I am still very new to this, so I figured I ask whether you already have
> thoughts (or maybe code to share) on how to best integrate this with the
> counter device API.
>=20
> I've added linux-iio/linux-stm32 to the CC as well, so if someone else
> has an idea how to best do this, please share.
>=20
> [1]: 40.3.7 in RM0436 rev 3
>=20
> Cheers,
> Ahmad
>=20
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Hi Ahmad,

Regarding the Counter subsystem, I'm developing a Counter character
device API that supports timestamps for counter devices:
https://lore.kernel.org/linux-arm-kernel/157d1edf-feec-33b5-7ad5-94f99316ca=
6e@lechnology.com/T/

My aim is to get this functionality picked up for the Linux 5.11 merge
window. I have one more revision at least that should be ready in a
couple weeks -- I'll CC you for that patchset to keep you in the loop;
I force-push periodically to my personal repo when as I develop, so you
can take a look at the current state of this next revision if you're
curious:
https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6

Sincerely,

William Breathitt Gray

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+lRJEACgkQhvpINdm7
VJJo5RAAi1RnWj35dtmsJ5bISyBJFuQsbOFlQ38c5s7gHy6I9/02Yo2kU6JDYB6B
qL2J/FCVaP6FI9ufoWnfKsy2e2Un33gvJ261GL60sfL7UcEUCUKdvFb0iBiDcoFA
CLtNRDqsT0fx/yFNgr7nzRdnBZIjKAzDY7ObEpLBxkFKBSVfjxlIUut2ATetTdmM
j1kvzOrBjzqxxp7WxkysJB7b8lU+S/oXvlW6cwKgcwDu+9guCvzlh2GEQMBHWRsb
6ndxohTkV2rO+JCTrDYJ5SusZq9WPv2s1xbj5w3A1mXxfWlMqYYZdT8TtXBXrmAB
H7aG2D9FPSwztJX4HKSDzFuBZbpiHHpWpYjTfr+enYJibi7pqVJL+isA6HvOPZRa
H8LuudhNtZotEaQNvOqzEumgHf8auWO38OQ1BczmRZdnQPlKGjgoEv20oSsevBli
vJRycnjgrN7uJtcPfafPAMnbEczO5bNczkbHxZOv0nExPtwko806MDRrYwFsE5MO
F1CjeUz4uEQ5lW41RYPwbV4SZSYVXR0Tk93vySY6CVkpuFI4L/qgQ7cdSsuskXmI
6fnVAmNcqYbYWtAkcsoOt9OKvJkXgo4oTkuoJMNVar5jLbl635jcb/mgwFCeTnBG
95tl27AdMquOj9O1kLvYgNHQbW9ZAo8Zt62BZhWGFARIdcHladw=
=3mUG
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

--===============2311685688165470311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2311685688165470311==--
