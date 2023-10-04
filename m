Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CC7B7618
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 03:06:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F972C6B478;
	Wed,  4 Oct 2023 01:06:06 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 233EFC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 01:06:05 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-452b4fd977eso825256137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 18:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696381564; x=1696986364;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FD7N4+ki8yTbIdFjxebxQX9Pl+69rX6n0uIJQxEwL/U=;
 b=YHV1TGBQFbsVBjwOx9a3T8LGO7z0iEPISXZsWExDQFJOGnzcLVxi3ZtrlTWyg+EmXN
 xNMy/UEQWPL0XVZjxoXnKB+60sKAsz1j5Bj8behd79IVpiwT8slBCocw/1LI+0y7rJ/n
 hocXXi+u3pRggidCbinaAChd2cpye3qrtPTWtJa9wHIvWtqGyaiQWUb++Sd0PBpf4oxK
 l+B/jUPby7OHkfH57Z6EUoLv+7xkg9POK2qW/zkZ1+3qqtq+tNrQXz04HWD3N0G/YDvX
 eAHv56vGkBY7kwx1bwfqjMadjJAYJOlZ7uBwUCylmydu84qyw1ZY9yALIw6KZVbLwJfP
 FEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696381564; x=1696986364;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FD7N4+ki8yTbIdFjxebxQX9Pl+69rX6n0uIJQxEwL/U=;
 b=B3JSZc/1MDOFFkcgCBreg8KSYlbg9cnseKhQGIAEkzSizbzxyrNh0fl8jo3ika8nKR
 NOOz+NntQ2BhAo6ptA5LqDLuClA1Dx2i2Y9MUW5qfHa56wKBNyTWGXaq+w49DYrrjNwe
 hK3DKMBUFEqluQubfj6vBix9KerJGfgCY3Uq9w9byHIiYXmwT+8ZmbT0dsWCqgvzFh42
 2R+Ylw9VO7dNP8HHB5Wg5OCv20hsXeilIHpuf66Tv/GpD0PauoEDmn1cnzVfC8Z+CCfa
 usAETUYdqbDDnn10E6fccQas9+YbknGnysryVuMR0HafOqzJF7mfdg5rWr27K+El7IoJ
 tJrw==
X-Gm-Message-State: AOJu0Yw4ipI1hDNoGMInW7PsgLSWRikE+8ZJ3vV8EbGZytsnlsDJUOih
 fwQGJk9JUcUkaxmCyoZIuDQ/lw==
X-Google-Smtp-Source: AGHT+IGYmIVwKRybktecfaCThlChpL8Li43s8SGPeblCnhS/dSopbmKh5eEzTeCOe+/o6Pgb7hDS5g==
X-Received: by 2002:a67:f65a:0:b0:44d:3f96:6c61 with SMTP id
 u26-20020a67f65a000000b0044d3f966c61mr895407vso.30.1696381563938; 
 Tue, 03 Oct 2023 18:06:03 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 h1-20020ab04701000000b007aba00406a4sm369973uac.7.2023.10.03.18.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:06:03 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:06:00 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZRy6eCSE7PhTTyvN@fedora>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-4-fabrice.gasnier@foss.st.com>
 <ZQdOcDQR6qONmmnR@fedora>
 <7aa66ac8-eceb-2f6e-960b-2c4dac9f595e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <7aa66ac8-eceb-2f6e-960b-2c4dac9f595e@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/8] tools/counter: add a flexible watch
	events tool
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
Content-Type: multipart/mixed; boundary="===============5812359609123100650=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5812359609123100650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jZtSijHBWetMsQRX"
Content-Disposition: inline


--jZtSijHBWetMsQRX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 05:37:34PM +0200, Fabrice Gasnier wrote:
> On 9/17/23 21:07, William Breathitt Gray wrote:
> > On Tue, Aug 29, 2023 at 03:40:24PM +0200, Fabrice Gasnier wrote:
> >> This adds a new counter tool to be able to test various watch events.
> >> A flexible watch array can be populated from command line, each field
> >> may be tuned with a dedicated command line argument.
> >> Each argument can be repeated several times: each time it gets repeate=
d,
> >> a corresponding new watch element is allocated.
> >>
> >> It also comes with a simple default watch (to monitor overflows), used
> >> when no watch parameters are provided.
> >>
> >> The print_usage() routine proposes another example, from the command l=
ine,
> >> which generates a 2 elements watch array, to monitor:
> >> - overflow events
> >> - capture events, on channel 3, that reads read captured data by
> >>   specifying the component id (capture3_component_id being 7 here).
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Fabrice,

Sorry for the delay, I'm currently working through my backlog. I see you
have already submitted a version 2 of this patchset, so I'll continue my
review there but I do want to make some direct replys here below as
well.

> > This is a new tool, so would you add a MAINTAINERS entry for the
> > counter_watch_events.c file?
>=20
> I haven't thought about it.
> I can add a MAINTAINERS entry, yes!
> Who would you suggest ?

Typically the author of the initial patch will also maintain what they
are introducing, but an alternative person is acceptable to serve as
maintainer if that's the plan that's agreed upon. I assume you're
introducing this tool because you're using it internally at ST for
testing, so I suppose the intention is not to get this merged upstream
just to abandon it (i.e. you intend to keep using and improving it). Is
the plan for you to maintain this utility, or is someone else at ST
interested in it?

> >> +	}
> >> +
> >> +	/* fallback to number */
> >=20
> > I'm not sure it makes sense to support numbers. Although it's true that
> > the component type, component scope, and event type are passed as __u8
> > values, users are expected to treat those values are opaque and pass
> > them via the respective enum constants. Since we don't guarantee that
> > the specific enum constant values will remain consistent between kernel
> > versions, I don't think it's a good idea to give to users that sort of
> > implication by allowing them to use raw numbers for configuration
> > selection.
>=20
> Ack, I can remove this.
>=20
> I'm a bit surprised by this statement. I may be wrong... I'd expect a
> userland binary to be compatible when updating to a newer kernel: e.g.
> user API (ABI?) definitions to be stable (including enum constants) ?

I was wrong in my previous reply. You're absolutely correct[^1] that
userspace ABI must be consistent ("Breaking user programs simply isn't
acceptable"[^2]) so the specific values must remain the same between
kernel versions.

Regardless, I don't think raw numbers provide much benefit for the
use-case of this particular utility; users are testing watch
configurations for a particular device, not the specific constant values
in the data structures. So in the end I still think the raw numbers
code path should be removed.

[^1] Well technically Linux kernel ABI README documentation file
     (Documentation/ABI/README) states that backwards compatibility for
     stable interfaces is only guaranteed for at least 2 years, but in
     practice we strive to never change the user-facing ABI.
[^2] https://yarchive.net/comp/linux/gcc_vs_kernel_stability.html

William Breathitt Gray

--jZtSijHBWetMsQRX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZRy6eAAKCRC1SFbKvhIj
K9STAP95tTRE+0GzRVXB8MfYNUgv5OwuwuDTLlkR6iV5UAPp3gEA1+ZCNsosBzzF
Lbr/PCTCJRifx7T+S4h36fLilUjYaAE=
=C8xr
-----END PGP SIGNATURE-----

--jZtSijHBWetMsQRX--

--===============5812359609123100650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5812359609123100650==--
