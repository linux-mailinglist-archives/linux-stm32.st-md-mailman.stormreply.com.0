Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3977AD2C2
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Sep 2023 10:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E68A4C6B462;
	Mon, 25 Sep 2023 08:10:46 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4965CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 19:54:57 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-59c0a7d54bdso33099277b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695412496; x=1696017296;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/q+DLZbwziI1Qsk9b09AGVVAZXUqPJr8h06YV70fmM=;
 b=g9e3wuq32//LZgOmAMbqBZrR5zY3LpnKB3REHlM7ohX5ty7a8uw/wlPU1B3UP0niH9
 EzWAhWowZ2nF6Pp/mExvTaXuSyy/krCBg2l6xrvzyN0XpxGqlMEq5ban+tWUV8wvPCKX
 WmRIwtSdpK4D/hNZAKXi0y1MOSiftxmAl91TxJds7Vfmu5ePdn3hC4wzKV7yYRZWfikw
 94zs7iR04sg4oD2fnYkmORCxLMK7sS25Mga2W4gc9+09syC41QYwjtdccixw1Q/JSJah
 vkZ0ucD9/HxkDAKuILRtkgzrr7KeD5duP1coe4wtnoq0PAYUk8XDZ5PQWsRbaPyJk5Jm
 Eyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695412496; x=1696017296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/q+DLZbwziI1Qsk9b09AGVVAZXUqPJr8h06YV70fmM=;
 b=ZPXNwgXX59ptxP6mCoU1VPjv8OLVA8kWFGAzCN9EiBux7YUxRYjM9UBlvCMHW7q+YT
 sLoxrXK9JfdoxxcJbLoma9gSJjH7JUu5GSlIsgruK/QsITmRsrvxWrxQuNixT1xPYg4F
 vV9AD90U92gb3xURm7Z7ZklMr4q/1gmvImgmGMthVR/kSuf1BAe7X61NDNsZziyYhxUk
 iSJ8gmDKMGlj72TRvVe9E6uI2FxxTGGX7b7hKzAxWxnWt20khNFldBkrpmPj77Bq5Pt7
 4HisPCryXmGVRSXcCy6hrGrSsTBU+8U7z4K0d7iBRyWn76lkiWfJLbzuQL/MXjpj8sHp
 QP5g==
X-Gm-Message-State: AOJu0YxNNdkcpW2QTEQq10muoHy7K5m/rMRze+SvwVucKHeQwqMMLQDd
 Md6XzGAtMuZY/wiYQwpP4zP6CnvgV9bV405k2V8=
X-Google-Smtp-Source: AGHT+IGmLNduTCyf7zJG2o+Xy19zbVZqRLA6xEkRBnq0dCqBoggs9lxH0CgZoFp0qbl4pn8KUuAH7gA/pqlgMsVOOC8=
X-Received: by 2002:a81:a250:0:b0:57a:8456:3401 with SMTP id
 z16-20020a81a250000000b0057a84563401mr766512ywg.29.1695412495973; Fri, 22 Sep
 2023 12:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <20230922111247.497-3-ansuelsmth@gmail.com>
 <13bc074d-30c2-4bbf-8b4c-82f561c844b0@lunn.ch>
 <650d8af4.5d0a0220.5ce38.2c5e@mx.google.com>
In-Reply-To: <650d8af4.5d0a0220.5ce38.2c5e@mx.google.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Fri, 22 Sep 2023 12:54:43 -0700
Message-ID: <CAA93jw5i6T8QE0HuPGRA4hirp84EXk-DALu8WNcCtj5V4GggFg@mail.gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
X-Mailman-Approved-At: Mon, 25 Sep 2023 08:10:46 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Ping-Ke Shih <pkshih@realtek.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Hangbin Liu <liuhangbin@gmail.com>, dave seddon <dave.seddon.ca@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Raju Rangoju <rajur@chelsio.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH 3/3] net: stmmac: increase TX
	coalesce timer to 5ms
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
Content-Type: multipart/mixed; boundary="===============1866605009457990755=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1866605009457990755==
Content-Type: multipart/alternative; boundary="00000000000092059c0605f7fbd3"

--00000000000092059c0605f7fbd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 5:39=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com>
wrote:

> On Fri, Sep 22, 2023 at 02:28:06PM +0200, Andrew Lunn wrote:
> > On Fri, Sep 22, 2023 at 01:12:47PM +0200, Christian Marangi wrote:
> > > Commit 8fce33317023 ("net: stmmac: Rework coalesce timer and fix
> > > multi-queue races") decreased the TX coalesce timer from 40ms to 1ms.
> > >
> > > This caused some performance regression on some target (regression wa=
s
> > > reported at least on ipq806x) in the order of 600mbps dropping from
> > > gigabit handling to only 200mbps.
> > >
> > > The problem was identified in the TX timer getting armed too much tim=
e.
> > > While this was fixed and improved in another commit, performance can =
be
> > > improved even further by increasing the timer delay a bit moving from
> > > 1ms to 5ms.
>

I am always looking for finding ways to improve interrupt service time,
rather than paper over the problem by increasing batchi-ness.

http://www.taht.net/~d/broadcom_aug9_2018.pdf

But also looking for hard data.

I have tried to question other assumptions more modern kernels are making,
in particular I wish more folk would experience with decreasing
the overlarge (IMHO) NAPI default of 64 packets to, say 8 in the mq case,
benefiting from multiple arm cores still equipped with limited cache, as
well as looking at the impact of TLB flushes,
and other deferred multi-core processing... that is looking good on a
modern xeon, but might not be so good on a more limited arm.

Over here there was an enormous test series recently run against a bunch of
older arm64s which appears to indicate that memory bandwidth is a source of
problems:

https://docs.google.com/document/d/1HxIU_TEBI6xG9jRHlr8rzyyxFEN43zMcJXUFlRu=
hiUI/edit

We are looking to add more devices to that testbed.


> > >
> > > The value is a good balance between battery saving by prevending too
> > > much interrupt to be generated and permitting good performance for
> > > internet oriented devices.
> >
> > ethtool has a settings you can use for this:
> >
> >       ethtool -C|--coalesce devname [adaptive-rx on|off] [adaptive-tx
> on|off]
> >               [rx-usecs N] [rx-frames N] [rx-usecs-irq N] [rx-frames-ir=
q
> N]
> >               [tx-usecs N] [tx-frames N] [tx-usecs-irq N] [tx-frames-ir=
q
> N]
> >               [stats-block-usecs N] [pkt-rate-low N] [rx-usecs-low N]
> >               [rx-frames-low N] [tx-usecs-low N] [tx-frames-low N]
> >               [pkt-rate-high N] [rx-usecs-high N] [rx-frames-high N]
> >               [tx-usecs-high N] [tx-frames-high N] [sample-interval N]
> >               [cqe-mode-rx on|off] [cqe-mode-tx on|off]
> [tx-aggr-max-bytes N]
> >               [tx-aggr-max-frames N] [tx-aggr-time-usecs N]
> >
> > If this is not implemented, i suggest you add support for it.
> >
> > Changing the default might cause regressions. Say there is a VoIP
> > application which wants this low latency? It would be safer to allow
> > user space to configure it as wanted.
> >
>
> Yep stmmac already support it. Idea here was to not fallback to use
> ethtool and find a good value.
>
> Just for reference before one commit, the value was set to 40ms and
> nobody ever pointed out regression about VoIP application. Wtih some
> testing I found 5ms a small increase that restore original perf and
> should not cause any regression.
>
> (for reference keeping this to 1ms cause a lost of about 100-200mbps)


Does this driver have BQL also?


> (also the tx timer implementation was created before any napi poll logic
> and before dma interrupt handling was a thing, with the later change I
> expect this timer to be very little used in VoIP scenario or similar
> with continuous traffic as napi will take care of handling packet)
>

I would be pretty interested in a kernel flame graph of the before vs the
after.

>
> Aside from these reason I totally get the concern and totally ok with
> this not getting applied, was just an idea to push for a common value.
>

I try to get people to run much longer and more complicated tests such as
the flent rrul test to see what kind of damage bigger buffers did to
latency, as well as how other problems might show up. Really notable in the
above test series was how badly various devices behaved over time on that
workload. Extremely notable in that test series above was how badly the
jetson performed:

https://github.com/randomizedcoder/cake/blob/2023_09_02/pfifo_fast/jetson.p=
ng

And the nanopi was weird.

https://github.com/randomizedcoder/cake/blob/2023_09_02/pfifo_fast/nanopi-n=
eo3.png


>
> Just preferred to handle this here instead of script+userspace :(
> (the important part is the previous patch)
>
> --
>         Ansuel
>
>

--=20
Oct 30: https://netdevconf.info/0x17/news/the-maestro-and-the-music-bof.htm=
l
Dave T=C3=A4ht CSO, LibreQos

--00000000000092059c0605f7fbd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 22, 2023 at 5:39=
=E2=80=AFAM Christian Marangi &lt;<a href=3D"mailto:ansuelsmth@gmail.com" t=
arget=3D"_blank">ansuelsmth@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Fri, Sep 22, 2023 at 02:28:06PM +02=
00, Andrew Lunn wrote:<br>
&gt; On Fri, Sep 22, 2023 at 01:12:47PM +0200, Christian Marangi wrote:<br>
&gt; &gt; Commit 8fce33317023 (&quot;net: stmmac: Rework coalesce timer and=
 fix<br>
&gt; &gt; multi-queue races&quot;) decreased the TX coalesce timer from 40m=
s to 1ms.<br>
&gt; &gt; <br>
&gt; &gt; This caused some performance regression on some target (regressio=
n was<br>
&gt; &gt; reported at least on ipq806x) in the order of 600mbps dropping fr=
om<br>
&gt; &gt; gigabit handling to only 200mbps.<br>
&gt; &gt; <br>
&gt; &gt; The problem was identified in the TX timer getting armed too much=
 time.<br>
&gt; &gt; While this was fixed and improved in another commit, performance =
can be<br>
&gt; &gt; improved even further by increasing the timer delay a bit moving =
from<br>
&gt; &gt; 1ms to 5ms.<br></blockquote><div><br></div>I am always looking fo=
r finding ways to improve interrupt service time, rather than paper over th=
e problem by increasing batchi-ness.=C2=A0<div><br></div><div><a href=3D"ht=
tp://www.taht.net/~d/broadcom_aug9_2018.pdf" target=3D"_blank">http://www.t=
aht.net/~d/broadcom_aug9_2018.pdf</a><div class=3D"gmail-sendToPdfFiller" s=
tyle=3D"width:40px;display:inline-block;margin-left:10px" title=3D"Open wit=
h pdfFiller"><img style=3D"background: none;"></div></div><div><br></div><d=
iv>But also looking for hard data.</div><div><br></div><div><div>I have tri=
ed to question other assumptions more modern kernels are making, in particu=
lar I wish more folk would experience with decreasing</div><div>the overlar=
ge (IMHO) NAPI default of 64 packets to, say 8 in the mq case, benefiting f=
rom multiple arm cores still equipped with limited cache, as well as lookin=
g at the impact of TLB flushes,</div><div>and other deferred multi-core pro=
cessing... that is looking good on a modern xeon, but might not be so good =
on a more limited arm.=C2=A0</div><div><br></div><div>Over here there was a=
n enormous test series recently run against a bunch of older arm64s which a=
ppears to indicate that memory bandwidth is a source of problems:</div><div=
><br></div><div><a href=3D"https://docs.google.com/document/d/1HxIU_TEBI6xG=
9jRHlr8rzyyxFEN43zMcJXUFlRuhiUI/edit" target=3D"_blank">https://docs.google=
.com/document/d/1HxIU_TEBI6xG9jRHlr8rzyyxFEN43zMcJXUFlRuhiUI/edit</a><br></=
div><div><br></div></div><div>We are looking to add more devices to that te=
stbed.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; &gt; <br>
&gt; &gt; The value is a good balance between battery saving by prevending =
too<br>
&gt; &gt; much interrupt to be generated and permitting good performance fo=
r<br>
&gt; &gt; internet oriented devices.<br>
&gt; <br>
&gt; ethtool has a settings you can use for this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ethtool -C|--coalesce devname [adaptive-rx o=
n|off] [adaptive-tx on|off]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[rx-usecs N] [rx=
-frames N] [rx-usecs-irq N] [rx-frames-irq N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[tx-usecs N] [tx=
-frames N] [tx-usecs-irq N] [tx-frames-irq N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[stats-block-use=
cs N] [pkt-rate-low N] [rx-usecs-low N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[rx-frames-low N=
] [tx-usecs-low N] [tx-frames-low N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[pkt-rate-high N=
] [rx-usecs-high N] [rx-frames-high N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[tx-usecs-high N=
] [tx-frames-high N] [sample-interval N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[cqe-mode-rx on|=
off] [cqe-mode-tx on|off] [tx-aggr-max-bytes N]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[tx-aggr-max-fra=
mes N] [tx-aggr-time-usecs N]<br>
&gt; <br>
&gt; If this is not implemented, i suggest you add support for it.<br>
&gt; <br>
&gt; Changing the default might cause regressions. Say there is a VoIP<br>
&gt; application which wants this low latency? It would be safer to allow<b=
r>
&gt; user space to configure it as wanted.<br>
&gt;<br>
<br>
Yep stmmac already support it. Idea here was to not fallback to use<br>
ethtool and find a good value.<br>
<br>
Just for reference before one commit, the value was set to 40ms and<br>
nobody ever pointed out regression about VoIP application. Wtih some<br>
testing I found 5ms a small increase that restore original perf and<br>
should not cause any regression.<br>
<br>
(for reference keeping this to 1ms cause a lost of about 100-200mbps)</bloc=
kquote><div><br></div><div>Does this driver have BQL also?</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
(also the tx timer implementation was created before any napi poll logic<br=
>
and before dma interrupt handling was a thing, with the later change I<br>
expect this timer to be very little used in VoIP scenario or similar<br>
with continuous traffic as napi will take care of handling packet)<br></blo=
ckquote><div><br></div><div>I would be pretty interested in a kernel flame =
graph of the before vs the after.=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Aside from these reason I totally get the concern and totally ok with<br>
this not getting applied, was just an idea to push for a common value.<br><=
/blockquote><div><br></div><div>I try to get people to run much longer and =
more complicated tests such as the flent rrul test to see what kind of dama=
ge bigger buffers did to latency, as well as how other problems might show =
up. Really notable in the above test series was how badly various devices b=
ehaved over time on that workload. Extremely notable in that test series ab=
ove was how badly the=C2=A0 jetson performed:</div><div><br></div><div><a h=
ref=3D"https://github.com/randomizedcoder/cake/blob/2023_09_02/pfifo_fast/j=
etson.png">https://github.com/randomizedcoder/cake/blob/2023_09_02/pfifo_fa=
st/jetson.png</a></div><div><br></div><div>And the nanopi was weird.</div><=
div><br></div><div><a href=3D"https://github.com/randomizedcoder/cake/blob/=
2023_09_02/pfifo_fast/nanopi-neo3.png">https://github.com/randomizedcoder/c=
ake/blob/2023_09_02/pfifo_fast/nanopi-neo3.png</a></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Just preferred to handle this here instead of script+userspace :(<br>
(the important part is the previous patch)<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ansuel<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Oct 30: <a href=3D"https://netdevconf.info/0x17/news/th=
e-maestro-and-the-music-bof.html" target=3D"_blank">https://netdevconf.info=
/0x17/news/the-maestro-and-the-music-bof.html</a></div><div>Dave T=C3=A4ht =
CSO, LibreQos<br></div></div></div></div>

--00000000000092059c0605f7fbd3--

--===============1866605009457990755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1866605009457990755==--
