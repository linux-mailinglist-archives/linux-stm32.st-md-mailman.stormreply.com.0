Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122B93FA0C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2757DC78F7D;
	Mon, 29 Jul 2024 15:58:24 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA1BFC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 07:59:57 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-70360eeb7d2so2017616a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721635196; x=1722239996;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVLVoBrSBIABdH8HVi5V5EvdQRfT90TgTG6ticvnc8Q=;
 b=OiEWv86G9OF6MVlztw8Lj1OpkCWDBPZHjHH0hQex3c0qv6Nn46jpnG5yZIbVN0+1D6
 fgI2Y4cm0DFJxDrlwACObrRisZF4UzhLr/SaAdKk3y86G8j5nsEuCMmTLbS3PMdQAFOR
 AhFFMUlZJrNgW+vIpKFnukjdobG2jV9nqCN4ub+YVi76FsXK+BXG2JsKsoC5Xj2Q8zq4
 Sf+ohuGs9ivr1ejYVY6SfVuKadxLQdHFgXZ0v/PFE8UGv0O9/FjpdakKuA+yzDDXvQwU
 Pd/e5ga8r+DcYEV/o4ASR/07Zy8tze+dvIKZZ5Q5wlAf61UlJWwcVstOrO3CBLeDy6IL
 MeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635196; x=1722239996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVLVoBrSBIABdH8HVi5V5EvdQRfT90TgTG6ticvnc8Q=;
 b=eAU8abWmTYakPqDqmsCLl96h83vQ8uAcJW9YaipMKxFekV0d7m3EJisIAXpgc1wM1i
 V4lBabUzrOzmP7NhEQQTkfCfRMSPP5tD1w+ER96/9IJEVbFIiuKZHtOFGTtCVubJUM/Q
 zVGgn9i+IDIreN3MTVKy+ZiCPMQY3dYgI01d+AlZPkeIfwpRSI4QFZlbotIyxAQJ6jgn
 tF/u7QbefkPKrdUBRo/7Ks+UskXN3NjgPLZ79QU6Q43x4U9myXZR5/o1FE/bQM8x5zI5
 78sUaRP7fnfkDyPgS3kos9CtEi9VWgdPCnKh90i/KA4CKkXTPKELy1JLiNeOj2H6MIp7
 h8ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPwO2+kXGMHjsnhArqVx6lIBrp46EY9L1MwQu11IH/WW25bd4RA5YO2dPuNDDw0R1C/We+L7pyVMVLH8eR2kd1OBTRbjGNA/jeM0Xqs6zDxAEf++t/kgaq
X-Gm-Message-State: AOJu0Yz3EoItZw50rSLOnjDHYLEnzQ29urocM76KpJvVm5WKqTw8SGHB
 dOcB1Yc5lEUze0Uvzqr6o7/XkJWZEj/+Sg9EgardolyUh0IYng/HmZhLYXMExVG0MMNla8J4kQn
 46Isrdu1fnGuXyCyp54vnh70zH4c=
X-Google-Smtp-Source: AGHT+IFUVAP4yCPxQNkNXhJFNJxMnQsofIn15s5YDS4IN3h0ofNDy5sFWJzr5lQhswyLC0ffiBD77t00NaabnKZvsFI=
X-Received: by 2002:a05:6830:7302:b0:703:5db8:80a with SMTP id
 46e09a7af769-709009042e5mr8949781a34.8.1721635196448; Mon, 22 Jul 2024
 00:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
In-Reply-To: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
From: Yanjun Yang <yangyj.ee@gmail.com>
Date: Mon, 22 Jul 2024 15:59:45 +0800
Message-ID: <CAE8JAfwMqiZxGPm4LK_22iWdCa=BS7SX3gbwhrCTOdx=K4yNzA@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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
Content-Type: multipart/mixed; boundary="===============6064560594178373860=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6064560594178373860==
Content-Type: multipart/alternative; boundary="000000000000513b13061dd16e08"

--000000000000513b13061dd16e08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:47=E2=80=AFPM Philippe CORNU <philippe.cornu@foss=
.st.com>
wrote:

>
>
> On 1/29/24 11:41, Raphael Gallais-Pou wrote:
> >
> > This patch series aims to add several features of the dw-mipi-dsi phy
> > driver that are missing or need to be updated.
> >
> > First patch update a PM macro.
> >
> > Second patch adds runtime PM functionality to the driver.
> >
> > Third patch adds a clock provider generated by the PHY itself.  As
> > explained in the commit log of the second patch, a clock declaration is
> > missing.  Since this clock is parent of 'dsi_k', it leads to an orphan
> > clock.  Most importantly this patch is an anticipation for future
> > versions of the DSI PHY, and its inclusion within the display subsystem
> > and the DRM framework.
> >
> > Last patch fixes a corner effect introduced previously.  Since 'dsi' an=
d
> > 'dsi_k' are gated by the same bit on the same register, both reference
> > work as peripheral clock in the device-tree.
> >


This patch (commit id:185f99b614427360) seems to break the dsi of stm32f469
chip.
I'm not familiar with the drm and the clock framework, maybe it's because
there is no
 "ck_dsi_phy" defined for stm32f469.


>
> > ---
> > Changes in v3-resend:
> >       - Removed last patch as it has been merged
> >
> https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st=
.com/
> >
> > Changes in v3:
> >       - Fix smatch warning (disable dsi->pclk when clk_register fails)
> >
> > Changes in v2:
> >       - Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS instead of old macro
> >         and removed __maybe_used for accordingly
> >       - Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS
> >
> > Raphael Gallais-Pou (3):
> >    drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
> >    drm/stm: dsi: expose DSI PHY internal clock
> >
> > Yannick Fertre (1):
> >    drm/stm: dsi: add pm runtime ops
> >
> >   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++++++++++---=
-
> >   1 file changed, 238 insertions(+), 41 deletions(-)
> >
>
> Hi Rapha=C3=ABl & Yannick,
> Applied on drm-misc-next.
> Many thanks,
> Philippe :-)
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>

--000000000000513b13061dd16e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2024 at 8:47=E2=
=80=AFPM Philippe CORNU &lt;<a href=3D"mailto:philippe.cornu@foss.st.com">p=
hilippe.cornu@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 1/29/24 11:41, Raphael Gallais-Pou wrote:<br>
&gt; <br>
&gt; This patch series aims to add several features of the dw-mipi-dsi phy<=
br>
&gt; driver that are missing or need to be updated.<br>
&gt; <br>
&gt; First patch update a PM macro.<br>
&gt; <br>
&gt; Second patch adds runtime PM functionality to the driver.<br>
&gt; <br>
&gt; Third patch adds a clock provider generated by the PHY itself.=C2=A0 A=
s<br>
&gt; explained in the commit log of the second patch, a clock declaration i=
s<br>
&gt; missing.=C2=A0 Since this clock is parent of &#39;dsi_k&#39;, it leads=
 to an orphan<br>
&gt; clock.=C2=A0 Most importantly this patch is an anticipation for future=
<br>
&gt; versions of the DSI PHY, and its inclusion within the display subsyste=
m<br>
&gt; and the DRM framework.<br>
&gt; <br>
&gt; Last patch fixes a corner effect introduced previously.=C2=A0 Since &#=
39;dsi&#39; and<br>
&gt; &#39;dsi_k&#39; are gated by the same bit on the same register, both r=
eference<br>
&gt; work as peripheral clock in the device-tree.<br>
&gt;</blockquote><div><br></div><div>This patch (commit id:185f99b614427360=
)=C2=A0seems to break the dsi of stm32f469 chip.=C2=A0</div><div>I&#39;m no=
t familiar with the drm and the clock framework, maybe it&#39;s because the=
re is no</div><div>=C2=A0&quot;ck_dsi_phy&quot; defined for stm32f469.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
&gt; ---<br>
&gt; Changes in v3-resend:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Removed last patch as it has been merged<b=
r>
&gt; <a href=3D"https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d=
996aaa@foss.st.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st.com/</a><br>
&gt; <br>
&gt; Changes in v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Fix smatch warning (disable dsi-&gt;pclk w=
hen clk_register fails)<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS=
 instead of old macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and removed __maybe_used for accordin=
gly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_O=
PS<br>
&gt; <br>
&gt; Raphael Gallais-Pou (3):<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: expose DSI PHY internal clock<br>
&gt; <br>
&gt; Yannick Fertre (1):<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: add pm runtime ops<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++=
++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 238 insertions(+), 41 deletions(-)<br>
&gt; <br>
<br>
Hi Rapha=C3=ABl &amp; Yannick,<br>
Applied on drm-misc-next.<br>
Many thanks,<br>
Philippe :-)<br>
_______________________________________________<br>
Linux-stm32 mailing list<br>
<a href=3D"mailto:Linux-stm32@st-md-mailman.stormreply.com" target=3D"_blan=
k">Linux-stm32@st-md-mailman.stormreply.com</a><br>
<a href=3D"https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm3=
2" rel=3D"noreferrer" target=3D"_blank">https://st-md-mailman.stormreply.co=
m/mailman/listinfo/linux-stm32</a><br>
</blockquote></div></div>

--000000000000513b13061dd16e08--

--===============6064560594178373860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6064560594178373860==--
