Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC5896455
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 08:04:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7956EC6B45B;
	Wed,  3 Apr 2024 06:04:10 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3135BC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 12:11:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29fa10274e5so3200245a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712059897; x=1712664697;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0esGpBpAiPqrK5lCpSaD2HyrDX7pE11OqqX7Q75j3cs=;
 b=mocqYKarBGUA4ZV8BwfjqjCq7wk9n5NclTJNyez0Du9pGpcIwMhSE/HeNtc8tFSNuv
 Ng6cUx6uLevDOgQm10RbUe0/OmTnQJoGMmC8PGDUAE8wBu+ieSrz+GADaSbPWQhR7BhE
 NUE3ouv/Vt5jEeO//2uuzwe/o+z+n+KgVDzrYDbCUKqAUu9uulKeYooU22HEMES1nM4y
 9xIkalFf5l9dspCwyyAOQHnnk9EXtVXacXtdJP19IT2eZh/nSWMZZcIM54v81btec0QB
 DsxSgA6CPXv36L4iO04bIIm10m6bEDf/UubLjFSCgSd8Z4Y+q30S/yn/nOyPxIQjgg0U
 Ah0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712059897; x=1712664697;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0esGpBpAiPqrK5lCpSaD2HyrDX7pE11OqqX7Q75j3cs=;
 b=dIB8Z/xAzjarZZpdrho8K+dYaV9M1k2Vi4gMfWjCEksSrqlRVbkyeXBpoLeNdhMUSw
 aTizJAYQfn1sQ6lYi+YVz9d28YIzA5Lw9+gTe3NG4CJfG8S+CfftO9LNyW4G/3ElK1RB
 /t150nKAAqopT4xZYEHwX9ZyzJ94kohvADR8BAzikEiZ50wUAzQVsQoRI1kQ/SD+JwMz
 HpiEFDEmvvxp8ukyA8t7FkUCJi5wIcHHeJDlIosCyvFdsjytxGKh67z/XptaeFOl0k6R
 aUUegBj/WMxG0e1dyNFPx5xOZYuOqQQJJPXS8KCwPnXiOfnO2PZFeqoc0+qGwXWDTg2u
 eyeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJcqAlcXE805ltubAr28JLAFvrsPFiArD0He8PR/uCA+om/lW5zmrRyPNnizoXZAZ9jdG3rXarq8ptPSg5gjWfMShhS0IFFiBF2V41Km9SWC4WmpSTdon0
X-Gm-Message-State: AOJu0YxCk88LqlQZRMOCl7YJUT9oHHyoE8bBPDU1L0bcOEfA3e4zH0s4
 Up5u26rjmXhF3Jkzm9uUi6K/BC5ykVWi3gP2WS6veGCuRIqnZ0KvcJEYsC5F4vSVS6TeUC4eT0K
 c+XrrKBT3lGO3+/eSMNCuvpjt0Vg=
X-Google-Smtp-Source: AGHT+IFF0DDEIJ7ByRhFLN7gq8pW25dNIQFNfIVp+X2rOY0c5xQpRVSmCHK2TfBGRjtGzons7QvHRSHObqipi80Mi8U=
X-Received: by 2002:a17:90a:aa03:b0:299:3035:aede with SMTP id
 k3-20020a17090aaa0300b002993035aedemr8961192pjq.44.1712059897470; Tue, 02 Apr
 2024 05:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240327110142.159851-1-cathy.cai@unisoc.com>
 <d1da7fdb-10f6-7f69-4820-520469c0193c@bootlin.com>
In-Reply-To: <d1da7fdb-10f6-7f69-4820-520469c0193c@bootlin.com>
From: cathy cai <cathycai0714@gmail.com>
Date: Tue, 2 Apr 2024 20:11:25 +0800
Message-ID: <CAG8gwPWCjL84futbvfM=3iAhJ6VtK7YGYkM=9yKszenSAxQ6kg@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
X-Mailman-Approved-At: Wed, 03 Apr 2024 06:04:08 +0000
Cc: joabreu@synopsys.com, cixi.geng1@unisoc.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, zhiguo.niu@unisoc.com, xuewen.yan94@gmail.com,
 mcoquelin.stm32@gmail.com, Cathy Cai <cathy.cai@unisoc.com>, kuba@kernel.org,
 wade.shu@unisoc.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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
Content-Type: multipart/mixed; boundary="===============7986890282049850409=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7986890282049850409==
Content-Type: multipart/alternative; boundary="00000000000005e7bb06151c02d8"

--00000000000005e7bb06151c02d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Romain,

On Sun, Mar 31, 2024 at 4:35=E2=80=AFPM Romain Gantois <romain.gantois@boot=
lin.com>
wrote:

> Hello Cathy,
>
> On Wed, 27 Mar 2024, Cathy Cai wrote:
>
> > Tx queue time out then reset adapter. When reset the adapter, stmmac
> driver
> > sets the state to STMMAC_DOWN and calls dev_close() function. If an
> interrupt
> > is triggered at this instant after setting state to STMMAC_DOWN, before
> the
> > dev_close() call.
> >
> ...
> > -     set_bit(STMMAC_DOWN, &priv->state);
> >       dev_close(priv->dev);
> > +     set_bit(STMMAC_DOWN, &priv->state);
> >       dev_open(priv->dev, NULL);
> >       clear_bit(STMMAC_DOWN, &priv->state);
> >       clear_bit(STMMAC_RESETING, &priv->state);
>
> If this IRQ issue can happen whenever STMMAC_DOWN is set while the net
> device is
> open, then it could also happen between the dev_open() and
> clear_bit(STMMAC_DOWN) calls right? So you'd have to clear STMMAC_DOWN
> before
> calling dev_open() but then I don't see the usefulness of setting
> STMMAC_DOWN
> and clearing it immediately. Maybe closing and opening the net device
> should be
> enough?
>
>  Yes. It could also happen between the dev_open() and
clear_bit(STMMAC_DOWN) calls.
Although we did not reproduce this scenario, it should have happened if we
had increased
the number of test samples. In addition, I found that other people had
similar problems before.
The link is:
https://lore.kernel.org/all/20210208140820.10410-11-Sergey.Semin@baikalelec=
tronics.ru/

Moreover, it seems strange to me that stmmac_interrupt() unconditionnally
> ignores interrupts when the driver is in STMMAC_DOWN state. This seems
> like
> dangerous behaviour, since it could cause IRQ storm issues whenever
> something
> in the driver sets this state. I'm not too familiar with the interrupt
> handling
> in this driver, but maybe stmmac_interrupt() could clear interrupts
> unconditionnally in the STMMAC_DOWN state?
>
> Clear interrupts unconditionally in the STMMAC_DOWN state directly
certainly won't cause this problem.
This may be too rough, maybe this design has other considerations.

Best Regards,
>
> --
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


 Best Regards,
Cathy

--00000000000005e7bb06151c02d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Romain,</div><div><br></div><div dir=3D"ltr">=
On Sun, Mar 31, 2024 at 4:35=E2=80=AFPM Romain Gantois &lt;<a href=3D"mailt=
o:romain.gantois@bootlin.com">romain.gantois@bootlin.com</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hello Cathy,<br>
<br>
On Wed, 27 Mar 2024, Cathy Cai wrote:<br>
<br>
&gt; Tx queue time out then reset adapter. When reset the adapter, stmmac d=
river<br>
&gt; sets the state to STMMAC_DOWN and calls dev_close() function. If an in=
terrupt<br>
&gt; is triggered at this instant after setting state to STMMAC_DOWN, befor=
e the<br>
&gt; dev_close() call.<br>
&gt; <br>
...<br>
&gt; -=C2=A0 =C2=A0 =C2=A0set_bit(STMMAC_DOWN, &amp;priv-&gt;state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_close(priv-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0set_bit(STMMAC_DOWN, &amp;priv-&gt;state);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_open(priv-&gt;dev, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_bit(STMMAC_DOWN, &amp;priv-&gt;state);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0clear_bit(STMMAC_RESETING, &amp;priv-&gt;sta=
te);<br>
<br>
If this IRQ issue can happen whenever STMMAC_DOWN is set while the net devi=
ce is <br>
open, then it could also happen between the dev_open() and <br>
clear_bit(STMMAC_DOWN) calls right? So you&#39;d have to clear STMMAC_DOWN =
before <br>
calling dev_open() but then I don&#39;t see the usefulness of setting STMMA=
C_DOWN <br>
and clearing it immediately. Maybe closing and opening the net device shoul=
d be <br>
enough?<br>
<br></blockquote><div>=C2=A0Yes. It could also happen between the dev_open(=
) and clear_bit(STMMAC_DOWN) calls.</div><div>Although we did not reproduce=
 this scenario, it should have happened if we had increased</div><div>the n=
umber of test samples. In addition, I found that other people had similar p=
roblems before.</div><div>The link is:</div><a href=3D"https://lore.kernel.=
org/all/20210208140820.10410-11-Sergey.Semin@baikalelectronics.ru/">https:/=
/lore.kernel.org/all/20210208140820.10410-11-Sergey.Semin@baikalelectronics=
.ru/</a><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Moreover, it seems strange to me that stmmac_interrupt() unconditionnally <=
br>
ignores interrupts when the driver is in STMMAC_DOWN state. This seems like=
 <br>
dangerous behaviour, since it could cause IRQ storm issues whenever somethi=
ng <br>
in the driver sets this state. I&#39;m not too familiar with the interrupt =
handling <br>
in this driver, but maybe stmmac_interrupt() could clear interrupts <br>
unconditionnally in the STMMAC_DOWN state?<br>
<br></blockquote>Clear interrupts unconditionally in the STMMAC_DOWN state =
directly certainly won&#39;t cause this problem. <br><div>This may be too r=
ough, maybe this design has other considerations.=C2=A0</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Best Regards,<br>
<br>
-- <br>
Romain Gantois, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>=C2=A0Best Regards,</div>=
Cathy</div></div>

--00000000000005e7bb06151c02d8--

--===============7986890282049850409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7986890282049850409==--
