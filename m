Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B7263D9C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:52:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BFDEC3FAE2;
	Thu, 10 Sep 2020 06:52:19 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8EBAC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:52:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 34so3700217pgo.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 23:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8HVyQdaKpELBn7VNHw9qPB9xaKcCk0/TjSkMEDXI+XU=;
 b=RGvikXsH7PQmdWro12mWWIJZZgczqOdGzPx1Fsrhg0tmrKrEu6aX1pAkP+IqekBxp4
 VFgDVofjN5n8wN7IgPSeydNQ5Rj6nNWzH7FcsyJyWenWloVEbd0JuJGN8ENW43dLrqdu
 9kzq9lpMovWAuF6cqX/1bZGyjrX8dHP/+pW3piIec/oZRikpkcdTMQckz/vQxJixAD4P
 Ovg0S+CVoppDh8bmOnUTTAp7KtF70cwmUvZp7BrQWWwNxVDV7kGhNMzS1XobuAS8mTKa
 OUYBp3twW9dbTKZHWyaebXYzH7rnat92knkcm1/EFmSUF7AS/fqycZfDCffMySgebIll
 ft+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8HVyQdaKpELBn7VNHw9qPB9xaKcCk0/TjSkMEDXI+XU=;
 b=EUdgAUBnKjoyhHYJd4yzgxsFJvrVk3lpNoD0KDdXkz8Rx5671Qcj2KO6TeNv2RBVG+
 j89ORwPL3OApwYcMFm5HAJHBIK8Kzse8f5Y03dNxgFL3v5UPSEScjKUaCnl03kF07Aiw
 XDlotNA5H34KFnwqExnySTI0JaEAHAT2qAV04wQNdZL1VOVAGRp6JEA83Gbe0glB3yMn
 2aSi9pMJdcZND56oY2k6R4fXuX3HtIFIc/IaBf1vt6tp22sxn487U/W4GYtOpyy3m28K
 j5Qz4ZbMVhslqYp7GNRfI0iMBiiI0RII97yKZrTlAwimPY8azIK8IzAwG8RDss3JeF8d
 +cbQ==
X-Gm-Message-State: AOAM530uuMUdxl5h7f9qLcoSLITILR8U4AyH/b9t4//E2zU6XnMiSZxB
 DtBdxOlbndcItC8aLX8Azq1QxZMuOBtZfagdvac=
X-Google-Smtp-Source: ABdhPJxi3x7zbWRS3gxWlmSufFWv7vQFuuNmus/yfYwlxgZq1Mixn+9O9VMJfpUd2zAs/br8akx60MpKFIrgwA/100I=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr3303489pgj.74.1599720734482; 
 Wed, 09 Sep 2020 23:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:b10:0:0:0:0 with HTTP; Wed, 9 Sep 2020 23:52:13
 -0700 (PDT)
In-Reply-To: <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
 <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
 <a37c69f2-1f16-2680-2716-0c1b77748d55@axentia.se>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Sep 2020 09:52:13 +0300
Message-ID: <CAHp75Vc4-zkkWtOz8w7pA0Vu1yMAVodhPSLQ1NJH4K+j9XD52g@mail.gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 08/18] iio: adc: stm32: Simplify with
	dev_err_probe()
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
Content-Type: multipart/mixed; boundary="===============6301615408617682005=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6301615408617682005==
Content-Type: multipart/alternative; boundary="0000000000001e64df05aef002a9"

--0000000000001e64df05aef002a9
Content-Type: text/plain; charset="UTF-8"

On Thursday, September 10, 2020, Peter Rosin <peda@axentia.se> wrote:

> Hi!
>
> On 2020-09-09 21:57, Krzysztof Kozlowski wrote:
> > On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
> >>
> >> On Sat, 29 Aug 2020 08:47:16 +0200
> >> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >>> Common pattern of handling deferred probe can be simplified with
> >>> dev_err_probe().  Less code and also it prints the error value.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >>>
> >> I don't have the thread to hand, but this tripped a warning next
> >> and the patch was dropped as a result. See below.
> >
> > Thanks for letting me know. If you mean the warning caused by:
> > https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
> > then the driver-core patch was dropped, not the iio one:
> > https://lore.kernel.org/linux-next/20200909074130.GB561485@
> kroah.com/T/#t
> >
> > So we are good here :)
>
> No, we are definitely not good. See below. That means "See below", and
> not "Please take a guess at what is being talking about".
>



> >>> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct
> device *dev,
> >>>               priv->booster = devm_regulator_get_optional(dev,
> "booster");
> >>>               if (IS_ERR(priv->booster)) {
> >>>                       ret = PTR_ERR(priv->booster);
> >>> -                     if (ret != -ENODEV) {
> >>> -                             if (ret != -EPROBE_DEFER)
> >>> -                                     dev_err(dev, "can't get booster
> %d\n",
> >>> -                                             ret);
> >>> -                             return ret;
> >>> -                     }
> >>> +                     if (ret != -ENODEV)
> >>> +                             dev_err_probe(dev, ret, "can't get
> booster\n");
> >>
> >> This tripped a warning and got the patch dropped because we no longer
> >> return on error.
>
> As Jonathan already said, we no longer return in this hunk. I.e., you have
> clobbered the error path.


Exactly my point why I proposed _must_check in the first place.



-- 
With Best Regards,
Andy Shevchenko

--0000000000001e64df05aef002a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, September 10, 2020, Peter Rosin &lt;<a href=3D"mailto:=
peda@axentia.se">peda@axentia.se</a>&gt; wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi!<br>
<br>
On 2020-09-09 21:57, Krzysztof Kozlowski wrote:<br>
&gt; On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron &lt;<a href=3D"mailto:ji=
c23@kernel.org">jic23@kernel.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 29 Aug 2020 08:47:16 +0200<br>
&gt;&gt; Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org">krzk@ke=
rnel.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Common pattern of handling deferred probe can be simplified wi=
th<br>
&gt;&gt;&gt; dev_err_probe().=C2=A0 Less code and also it prints the error =
value.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@=
kernel.org">krzk@kernel.org</a>&gt;<br>
&gt;&gt;&gt; Reviewed-by: Andy Shevchenko &lt;<a href=3D"mailto:andy.shevch=
enko@gmail.com">andy.shevchenko@gmail.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; I don&#39;t have the thread to hand, but this tripped a warning ne=
xt<br>
&gt;&gt; and the patch was dropped as a result. See below.<br>
&gt; <br>
&gt; Thanks for letting me know. If you mean the warning caused by:<br>
&gt; <a href=3D"https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.=
com/" target=3D"_blank">https://lore.kernel.org/lkml/<wbr>20200909073716.GA=
560912@kroah.<wbr>com/</a><br>
&gt; then the driver-core patch was dropped, not the iio one:<br>
&gt; <a href=3D"https://lore.kernel.org/linux-next/20200909074130.GB561485@=
kroah.com/T/#t" target=3D"_blank">https://lore.kernel.org/linux-<wbr>next/2=
0200909074130.GB561485@<wbr>kroah.com/T/#t</a><br>
&gt; <br>
&gt; So we are good here :)<br>
<br>
No, we are definitely not good. See below. That means &quot;See below&quot;=
, and<br>
not &quot;Please take a guess at what is being talking about&quot;.<br></bl=
ockquote><div>=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;&gt;&gt; @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(=
<wbr>struct device *dev,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt=
;booster =3D devm_regulator_get_optional(<wbr>dev, &quot;booster&quot;);<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_E=
RR(priv-&gt;booster)) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(priv-&gt;booster);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (ret !=3D -ENODEV) {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D -EPROBE_DEFER)<br=
>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
v_err(dev, &quot;can&#39;t get booster %d\n&quot;,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (ret !=3D -ENODEV)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(dev, ret, &quot;=
can&#39;t get booster\n&quot;);<br>
&gt;&gt;<br>
&gt;&gt; This tripped a warning and got the patch dropped because we no lon=
ger<br>
&gt;&gt; return on error.<br>
<br>
As Jonathan already said, we no longer return in this hunk. I.e., you have<=
br>
clobbered the error path.</blockquote><div><br></div><div>Exactly my point =
why I proposed _must_check in the first place.</div><div>=C2=A0</div><br><b=
r>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><br>

--0000000000001e64df05aef002a9--

--===============6301615408617682005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6301615408617682005==--
