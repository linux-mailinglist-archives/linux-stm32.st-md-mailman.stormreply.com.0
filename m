Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AC1BF5CE
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 12:45:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DFD0C36B0E;
	Thu, 30 Apr 2020 10:45:21 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35B1AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 10:45:20 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 188so798975lfa.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tdkwo9vZTx3LO3an4kQbzR/W1YmAF7pZ/KrzeWFzHjc=;
 b=EVbvwZxIS2qk2mnuzeNuVQLXOUhQcqQwRVCfdU/8OYMgK4YpJCpUA3miGG56jYFV6K
 NeQaBbeXyMwJpPZx/aIqSoB8WCb7W9LzqZoVMXzcLSmtfnXC8zua5TqU+m4jDeBnWhnv
 kWEFtvWyPzXPjIhBITqNp+EqLRnQLH9k1ey+xGKtFf88HicU2Qqz8r6kBfCL+AeaBOYa
 6naCFc9YCqxBD1C6RNfDac93pjJasQ2b9um9lHzdmF1GTV6BC0j6f3HA9k9DeNAHCJeV
 GryKEK+ypaqqlx1rvU/0E1MshrIDOUIji2QkHw6AskX1kX04F8J92R58jx3VQ/SLFdgU
 5QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tdkwo9vZTx3LO3an4kQbzR/W1YmAF7pZ/KrzeWFzHjc=;
 b=rYWpzw3rNH1CQoFajHQsQrZhdH42JrzvFcpgVX0r8a7oHWQofrFeWaSDGl6ZE3cdpP
 fpKtcmA7gM84byjtYEZJNF4uRUN/2sR/SARBXWNeTPITKoP6xIb+wubXxeOFLSBjn9OK
 sYFFUFM0USdP92yyaVex8vudm8oYVYIBH07kHAji4/BIVJNDYOt7NhlMY4JgJdoWwylL
 30BZN2YoAjNQzl79XJfKTdXdE0njR5i35ZJPaAb0rvTZmNSJ0SZNWNL5/IfFmxoyiOWA
 YLoMYHx1qpiSg469DwC3pEZpSgOfUIokITPX5r2WprUsjEbUJ4/HlUxl3AlOCVfiRgtR
 Yr9A==
X-Gm-Message-State: AGi0PuZo9FMfO3O8qWNKCjGMoswnIaeaWPuNJ4fvhrc+LasF+174qxma
 JhHNEb+eFK4GiALpVLoMY47DDkq3sYButAR9iNE=
X-Google-Smtp-Source: APiQypL1xv1pRfvDFRzW/qy+X/tRYzROtMWI9P9mfLwUxbVTBKQgK9UyqYqsTNDcfVU77W+1Vti93TT0H2JnZQSb9CQ=
X-Received: by 2002:a19:d55:: with SMTP id 82mr1758897lfn.89.1588243518780;
 Thu, 30 Apr 2020 03:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <1588239840-11582-1-git-send-email-dillon.minfei@gmail.com>
 <20200430103534.GA4633@sirena.org.uk>
In-Reply-To: <20200430103534.GA4633@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 30 Apr 2020 18:45:07 +0800
Message-ID: <CAL9mu0+Suw9YoB80NxMJyL4CF4+06RV4AtYg05jr=-6WvzzBfg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] add SPI_SIMPLEX_RX/SPI_3WIRE_RX
	support for spi-stm32f4
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
Content-Type: multipart/mixed; boundary="===============2281388065196714324=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2281388065196714324==
Content-Type: multipart/alternative; boundary="000000000000c0f7ac05a47fc238"

--000000000000c0f7ac05a47fc238
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Mark Brown

 i will resend all these four to five patchsets to you later after rework
following alexandre's review result.
yes ,patch no 4 depends on patch no 1,2,3
for review efficient and just found you are in charge of spi subsystem  by
get_maintainer.pl, so i just sent you patch no 4, sorry

thanks,
dillon min

Mark Brown <broonie@kernel.org> =E4=BA=8E2020=E5=B9=B44=E6=9C=8830=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:35=E5=86=99=E9=81=93=EF=BC=9A

> On Thu, Apr 30, 2020 at 05:44:00PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > add SPI_SIMPLEX_RX/SPI_3WIRE_RX in spi-stm32f4.c
> > for SPI_SIMPLEX_RX , as we running kernel in sdram, so
> > that the performance is not as good as internal flash,
> > need add send dummy data out while in rx,
> > otherwise will get many overrun errors.
>
> I only have patch 4 here, what's going on with dependencies?
>

--000000000000c0f7ac05a47fc238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi Mark Brown<div><br></div><div>=C2=A0i will resend all t=
hese four to five patchsets to you later after rework following=C2=A0alexan=
dre&#39;s review result.=C2=A0</div><div>yes ,patch no 4 depends on patch n=
o 1,2,3</div><div>for review efficient and just found you are in charge of =
spi subsystem=C2=A0 by <a href=3D"http://get_maintainer.pl">get_maintainer.=
pl</a>, so i just sent you patch no 4, sorry</div><div><br></div><div>thank=
s,</div><div>dillon min</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Mark Brown &lt;<a href=3D"mailto:broonie@kern=
el.org">broonie@kernel.org</a>&gt; =E4=BA=8E2020=E5=B9=B44=E6=9C=8830=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:35=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Apr 30, 202=
0 at 05:44:00PM +0800, <a href=3D"mailto:dillon.minfei@gmail.com" target=3D=
"_blank">dillon.minfei@gmail.com</a> wrote:<br>
&gt; From: dillon min &lt;<a href=3D"mailto:dillon.minfei@gmail.com" target=
=3D"_blank">dillon.minfei@gmail.com</a>&gt;<br>
&gt; <br>
&gt; add SPI_SIMPLEX_RX/SPI_3WIRE_RX in spi-stm32f4.c<br>
&gt; for SPI_SIMPLEX_RX , as we running kernel in sdram, so<br>
&gt; that the performance is not as good as internal flash,<br>
&gt; need add send dummy data out while in rx,<br>
&gt; otherwise will get many overrun errors.<br>
<br>
I only have patch 4 here, what&#39;s going on with dependencies?<br>
</blockquote></div>

--000000000000c0f7ac05a47fc238--

--===============2281388065196714324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2281388065196714324==--
