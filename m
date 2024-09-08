Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44A9706EB
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Sep 2024 13:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93710C712A2;
	Sun,  8 Sep 2024 11:32:59 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95D63C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Sep 2024 11:32:52 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53662965a05so709231e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Sep 2024 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725795172; x=1726399972;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vr39MxCa3Ig2XJlwouThex9PYkaXy3rMiTg4IK35S54=;
 b=abCMpg89SIbhIa+itXL+9j6R+9AxBY2QIDHN2buZMRP7a6PjAJoPoelE9lXgHDm91e
 nv0UjyiBHtMcz6vwbnYvIYoFj63VOCLvIuT5CG5IAOInIgGXyxZijoFRoFt/WgoRRb3n
 Cci+Ln8FcsohXQ2h64W9ewau6Q/7LuCVdssqH/M7ngXAX+FwzLl/EpqmmeCMZ1LJuaTM
 AqRbpXvnF1eB4RYgXyTkfuGBlVs9KrNhDM6cbuZAkPI45juYNXKtoawHbYL/hHr9ABzd
 pQky7jZD1htW22pvyeLCmC0yFdWqSLnb8NZ+++Z76iKZJ0pWUEhCmzSQdn4NYJlaOipe
 7Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725795172; x=1726399972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vr39MxCa3Ig2XJlwouThex9PYkaXy3rMiTg4IK35S54=;
 b=hJgYjjgaCH99b+IHDE4VCFZmdz+clRc008yk6P4bSAQZIm/DHXFVkQamOHK1PiaoTc
 K+S7Bcjx/uldyT580TejEOPhAowQXhveA/c0wM0eS5bIkqRMLO/E077dUR0s+v0ulnDh
 im0SXvx8TMfq/1PvglPleezBJyzfjYANtnDmaB+P4AI/fJPliQ8DIqPdAF8XhUkGWOiU
 HE1oJbtEfJCtT88veRS87hyh8rMSGw/OnOh32WhpcwcXGlERvHEuUj77+4Qw0oOdvEfD
 dR7qKU5e02DNuTqWE7zYMFVasbyiVhFK6VLc5J3TBTK0W8E6TUMINvs5go/Yfh1ZMO0p
 70sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrfcFAfpUMPiP/t9YbjhCnIx18Z7carQXHNodW8Ss0OZQd0bv7F71I5sl06qi9WupVS75O7LCUoxlBHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2g9KUbMU81y7bCwiO5ot0Hc6/XujXLI052wg3i8kYCz8r5Rex
 2r6Pv+NW71lgqQxos46by8SEfIGhL3O6e+fC41P3SGADlSi3ZwneL0mj6+LW+80=
X-Google-Smtp-Source: AGHT+IHgvbkne/FsPILazfWzkr9nHWvXt2VUPiGpwfZdijLsiNZyLWjCKQoepTDmG6n4QB1XaDqcvA==
X-Received: by 2002:a05:6512:33cb:b0:536:55a3:70ad with SMTP id
 2adb3069b0e04-536587aaa07mr5784554e87.22.1725795171426; 
 Sun, 08 Sep 2024 04:32:51 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:a029:f6b8:fc85:4519])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2597ac96sm191678366b.73.2024.09.08.04.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 04:32:50 -0700 (PDT)
Date: Sun, 8 Sep 2024 13:32:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <wzk5h5knkitt6ocp5dtnyx2vhazei7lgkhpdbft56mbmzbqcxr@jyhwdm65p5dl>
References: <cover.1725635013.git.u.kleine-koenig@baylibre.com>
 <6e4b7ef4-19c7-477c-b753-d4d59ed38e3a@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <6e4b7ef4-19c7-477c-b753-d4d59ed38e3a@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 Kent Gibson <warthog618@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/7] pwm: New abstraction and userspace
	API
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
Content-Type: multipart/mixed; boundary="===============4413686192970889058=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4413686192970889058==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bzw6j5f7wjbafhs"
Content-Disposition: inline


--2bzw6j5f7wjbafhs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Fri, Sep 06, 2024 at 02:06:18PM -0500, David Lechner wrote:
> On 9/6/24 10:42 AM, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > here comes v4 of the series to add support for duty offset in PWM
> > waveforms. For a single PWM output there is no gain, but if you have a
> > chip with two (or more) outputs and both operate with the same period,
> > you can generate an output like:
> >=20
> >                ______         ______         ______         ______
> >    PWM #0  ___/      \_______/      \_______/      \_______/      \____=
___
> >                  __             __             __             __
> >    PWM #1  _____/  \___________/  \___________/  \___________/  \______=
___
> >               ^              ^              ^              ^
> >=20
>=20
> While working on an ADC driver that uses these new waveform APIs, we came
> across a case where we wanted wf->duty_offset_ns >=3D wf->period_length_n=
s,
> which is currently not allowed. [1]
>=20
>                 ______         ______         ______         ______
>     PWM #0  ___/      \_______/      \_______/      \_______/      \_____=
__
>                                __             __             __
>     PWM #1  __________________/  \___________/  \___________/  \_________=
__
>                             ^              ^              ^             =
=20

I restricted to waveforms with .duty_offset_ns < .period_length_ns
because the signal you want is only periodic once PWM #1 begins to
toggle. Given that the pwm subsystem is about periodic signals and has a
wide range of behaviours at the moments the configuration is changed, I
think it's little sensible today to consider reliably implementing
offsets bigger than the period length.

Does your hardware really behave like that?

> We worked around it by setting:
>=20
> 	wf->duty_offset_ns =3D DESIRED_NS % wf->period_length_ns
>=20
> Having PWM #1 trigger too early just causes the first sample data
> read to be invalid data.
>=20
> But even if we allowed wf->duty_offset_ns >=3D wf->period_length_ns,
> this offset wouldn't matter because there currently isn't a way to
> enable two PWM outputs at exactly the same time.

Yup, that's another challenge. Up to now it's even special knowledge
about the used pwm chip that with configuring two pwms with the same
period, the period starts are synced and you don't get:


                   ______         ______         ______         ______
     PWM #0  _____/      \_______/      \_______/      \_______/      \____=
___
                  ^              ^              ^              ^
                 __             __             __             __
     PWM #1  ___/  \___________/  \___________/  \___________/  \___________
              ^              ^              ^              ^             =
=20

> >  - The functions pwm_set_waveform_might_sleep() and
> >    pwm_round_waveform_might_sleep() have an unusual return value
> >    convention: They return 0 on success, 1 if the requested waveform
> >    cannot be implemented without breaking the rounding rules, or a
> >    negative errno if an error occurs.
> >    Fabrice rightfully pointed out this to be surprised by this and
> >    suggested to use at least a define for it.
> >=20
> >    I couldn't find a decision that I'm entirely happy with here. My
> >    conflicts are:
> >=20
> >     - I want a constant that now and in the future only means "cannot be
> >       done due to the rounding rules in the pwm framework". So the
> >       options are:
> >         * Introduce a new ESOMETHING and return -ESOMETHING
> >           I think that's hard to motivate and also myself doubt this
> >           would be sensible. As below, the question for a good name is
> >           unresolved.
> >         * return 1
> >           This is what was done in the earlier revisions and also here.
> >=20
> >     - When keeping the return 1 semantics (and also for a new
> >       ESOMETHING):
> >       I agree that a name instead of a plain 1 would be nice, but I
> >       couldn't come up with a name I liked. Given that this can be
> >       introduced later without breaking anything, I don't consider that
> >       very urgent.
> >       My candidates were PWM_REQUIRES_BROKEN_ROUNDING,
> >       PWM_REQUIRES_FORBIDDEN_ROUNDING and PWM_ERR_ROUNDING.
> >       These are too long or/and imprecise.
> >       If you have a good idea, please tell.
>=20
> To avoid using the return value for status flags, we could introduce
> an optional output parameter. Consumers where best effort is good
> enough can just pass NULL and consumers that care can pass an unsigned
> int to receive the status flag. This could even be a bitmap of multiple
> flags if it would be useful to know which rule(s) could not be met.

Which rule couldn't be met is obvious when you look at the resulting
waveform because the lowlevel driver is supposed to give you the
smallest possible value for the relevant parameter if rounding down
doesn't work.

So if you request

	.period_length_ns =3D 3000
	.duty_length_ns =3D 2
	.duty_offset_ns =3D 10

and your hardware can do 3000 ns period but the smallest duty_length is
10, it is supposed to write

	.period_length_ns =3D 3000
	.duty_length_ns =3D 10
	.duty_offset_ns =3D 10

in the waveform parameter and return 1.

My intuitive reaction is that (another) output parameter is worse than
the return value semantics I came up with. After some more thought I
wonder if the wish to have something PWM specific is the problem, and
just picking one of the available error constants (ERANGE?) is the nice
way out. Alternatively return 0 in this case and let the caller work out
themselves that not all values were rounded down?!

Best regards
Uwe

--2bzw6j5f7wjbafhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbdi14ACgkQj4D7WH0S
/k7qpAf/Y5ssufaf6K1aaX1b8DvdvTR9ZtYP4d2qMkbRPEmh0ttEd77LiJKYAPYv
8+cMq81ISOARc2fARWJUyFOKnLI1mn4AR5L8pPPCx/9MPT/hcTLTDQ4yYian5/6M
3AtSIVl/FK4+dXzYsQP8QIWaFlWA7sH4HVwvh5o2HGAtFFl1vkzu3iYk5adKUYWR
OX0fUsg8YX94x8CqRxdc0xezbg1yBqXJ/oxOrYbv8SArDVuJf9nWEiQiI5DRa3aO
vLCCW0EGjgRiDP3uUF0CxTcrQJPBorId6FQPnqeGyb+NEMXcWz0Elnp9tz5XRuXN
NI2fsiSzpOi4pzYa5f89EbLfFAgIEQ==
=Z0Bq
-----END PGP SIGNATURE-----

--2bzw6j5f7wjbafhs--

--===============4413686192970889058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4413686192970889058==--
