Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3D2B60C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 15:10:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF23C5B67D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 13:10:26 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CFDCC5B67C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 13:10:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n2so9088703pgp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 06:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BEdTvHrM8MBzA6eurnzuHG7AgtE6/R70nIrkLd6SpCU=;
 b=aiXR/CoJXSRV/poSqc6yyZcU6J2tP3cl0uCr45jqH0sYWaPpegMcVF8oxgCupBqRII
 sdx4FLDzZRN1EWMdW5FHZDLcA7Tr6LQQ+KmArrUpYh2nNsVzjULxOXsesvlXr/nFWtnr
 8R+66mTo1qV/4fThj504goty3v0GxwW3SVjN7FZmwin4K0Zh/1FmmXs+Sh6rMKkeQLmm
 kJtVIiV4SYob0kmdlC9AbWpHccnOdI0IKhgwoctAtUNAwl/fErLbQsfn78EUshjorZ8e
 q2o0OROpnJxSHupUDFsKFXRnDxG5u4fayhz55aKf6dLDrml2d6aHxFR7dqa8B6CEGcKF
 6yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BEdTvHrM8MBzA6eurnzuHG7AgtE6/R70nIrkLd6SpCU=;
 b=fwCIBefSHt15DcK/yk2cdHLH/Ir9YcF0BIlRM9xR7AZFrIDyRT5jV1ytgewdd55FKf
 D6i/dM0jTL3bB3Tk7iEkW5S4WYTlrPlsX07X+qj6j4faza46MX9oULAVCnZEF7cIZq+O
 t2zchJxuk/CvObFVA5gKL/4Y9eeXkYLAJTD9aIYMkClo2byaPenNy2LqT1kpQ1xsJQr4
 IvL1H9R8TpuMZuaXRyMzb78uBOsgDJkzTCooWRmojQvzMUyRjo7x3kvp3To1Xdr7myER
 qRc5rFgACT8uYEAvfCyDnyu0nnoLY+3z72gQyFEX8pRP7t+5R4gWp1nyioMcnWHDVNY2
 ErzA==
X-Gm-Message-State: APjAAAWUWZ+uIiMClJvWVkc4J6oAcsXyh8+6w1CVpNC0LKsNLsYk9Xt/
 QuNTTW5+WERu39F/FUoa0/enWB0RUE+ChXNqQjs=
X-Google-Smtp-Source: APXvYqw1+zCfcD9kc248BYpaPRhS/Ruwur2JclU6lfZoyDFrjylKjDXH+uObYS4hiyNyGBSzRXTTglbkPiWWdSgpse8=
X-Received: by 2002:a63:1b65:: with SMTP id
 b37mr125795061pgm.408.1558962623547; 
 Mon, 27 May 2019 06:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190526071324.15307-1-houweitaoo@gmail.com>
 <20190527064303.GG15118@vkoul-mobl>
In-Reply-To: <20190527064303.GG15118@vkoul-mobl>
From: Weitao Hou <houweitaoo@gmail.com>
Date: Mon, 27 May 2019 21:10:12 +0800
Message-ID: <CAK98mP9teTxZn9mMZ_yXSmC7h8gimgN14kX=GT0Q43O58zC-rw@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: use to_platform_device()
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
Content-Type: multipart/mixed; boundary="===============6883573346439451089=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6883573346439451089==
Content-Type: multipart/alternative; boundary="0000000000006512fa0589de452a"

--0000000000006512fa0589de452a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,Vinod
    Need I add the stm32 driver tag and resend v2 patch?

Vinod Koul <vkoul@kernel.org> =E4=BA=8E2019=E5=B9=B45=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=882:43=E5=86=99=E9=81=93=EF=BC=9A

> On 26-05-19, 15:13, Weitao Hou wrote:
> > Use to_platform_device() instead of open-coding it.
>
> Applied after adding stm32 driver tag, thanks
>
> --
> ~Vinod
>

--0000000000006512fa0589de452a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,Vinod<div>=C2=A0 =C2=A0 Need I add the stm32 driver tag=
 and resend v2 patch?</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Vinod Koul &lt;<a href=3D"mailto:vkoul@kernel.or=
g">vkoul@kernel.org</a>&gt; =E4=BA=8E2019=E5=B9=B45=E6=9C=8827=E6=97=A5=E5=
=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=882:43=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 26-05-19, 15:13, Weita=
o Hou wrote:<br>
&gt; Use to_platform_device() instead of open-coding it.<br>
<br>
Applied after adding stm32 driver tag, thanks<br>
<br>
-- <br>
~Vinod<br>
</blockquote></div>

--0000000000006512fa0589de452a--

--===============6883573346439451089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6883573346439451089==--
