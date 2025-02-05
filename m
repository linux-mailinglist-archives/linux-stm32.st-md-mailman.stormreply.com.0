Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E005CA29704
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 18:16:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46A4FC78F88;
	Wed,  5 Feb 2025 17:16:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22539C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738775775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeSidYCdYJnARtwshAoVNn6AXIZ4ayw7DuR83E+9hlo=;
 b=ejkGPFJiif/LRtUA5EKrAsnn8tsdPUmtc3eWWBda6Gcxe1FnBdSNXZ7AZjlnN4qp/i2JtP
 v4ZHuxVI2LSCBSfyXvy449GMm4cl27XbNGKx9vcAjm/JIumnuR3ssHBXtJb0c7Tka4WioN
 wm5lnmHYo+K9XNl2EwrHCIUz8l69IVA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-BFrRJO8FM_euS_Hn-K_Z2Q-1; Wed, 05 Feb 2025 12:16:13 -0500
X-MC-Unique: BFrRJO8FM_euS_Hn-K_Z2Q-1
X-Mimecast-MFC-AGG-ID: BFrRJO8FM_euS_Hn-K_Z2Q
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f46924f63eso14503517b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Feb 2025 09:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738775773; x=1739380573;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zeSidYCdYJnARtwshAoVNn6AXIZ4ayw7DuR83E+9hlo=;
 b=NReYkZ5CJ1CIYrFn/RNLAIgJHX0nI7n2ATPhHCGPIKVPLzjDwPvBcnF/LxHNpA8nhB
 LMBVGgtvLcHITLPhHgd1eDbcWuLiIGyhwkzf1lbk5Zo172Phy/yQkEe4PFCiyGXY1DUQ
 1doI4DT3gcmxfpSk/+mmP0HJtmERq4MytoO2vMKV4ZW7tSaVwthzaABqk9AnTB1m8Chk
 T4mokASVrgVbE4BzIW1D3fx1rExLIraSqz0lWirttxmEziChNhRx1k5AL9yC8DLq9rFn
 2Qx/uIt3fQgThpTCiJB76lqV2PkqZSZ0mhFZcv+StJiOynWQmAWJb0GioVGYfaAsSOrC
 zMNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqvB8BgpHZ0nQyZkLmR4sp3a9XO9DhR3PTvswCwO3CbQbR0zr3bC13V6Ejj/3+Y+L4OzgsnM3WAq5b+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyna5JD11uY6azZqnKrlkg9VjeDpkZbEkmhsX1+/Vcf/5qnPAFU
 UTGqlpXFBgEDckVtAKX1ezB+isnIkoBFynLMoox2Tyd3NR6aMIYucbOFKjnRaiKOF2m7WyRcRBI
 5zTthbjWzk/JcekbYjtRn6FjwhdLCcBkVVz8hsEjUVYeivZI0EzCYyyPGRj7RedkkPmW07gt4PS
 iCqFo9ni4kSFmoM0yCra6yjeqFn8scEuVkF1eZdqknh6LzBvY617Qi
X-Gm-Gg: ASbGncvwaFgtu3oBCWuX2B9wiy7MbqPKIl0VPgNl84eyN9WX+O0z6TLC3CucZI8a4Ak
 N2/YjEULxWyYY1AOi8fVCqLA353iE7ZicA5ZLvnypgpn3218PcG7a+fRDXjyj
X-Received: by 2002:a05:690c:6c0c:b0:6f9:4195:8195 with SMTP id
 00721157ae682-6f99a60b0cdmr1342097b3.15.1738775773235; 
 Wed, 05 Feb 2025 09:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo2HkXE9/PB8TiTOCOmlpYI4+BLO/SI3ZFeKcGKfVuRa8aoXdOtxFKnY5ClyavR5vDRDWGBJn3fTqfR8+aXmM=
X-Received: by 2002:a05:690c:6c0c:b0:6f9:4195:8195 with SMTP id
 00721157ae682-6f99a60b0cdmr1341537b3.15.1738775772906; Wed, 05 Feb 2025
 09:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <0ae17de1-c6dc-48eb-aed2-b099b2abbea5@suse.de>
In-Reply-To: <0ae17de1-c6dc-48eb-aed2-b099b2abbea5@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 5 Feb 2025 12:16:02 -0500
X-Gm-Features: AWEUYZllqvGkhQf1gMIyypHoBPrhgiNdZ-ww_BiUqVz8q-uL_n50cYGcicLCGMU
Message-ID: <CAN9Xe3S3E_LzU7zF1UCE7fD9OE2bU7BcLy6xQOQk2s7=k+6v=A@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AUSyivfnYxcJyP0UAsWTAPtyFNEkALdUO7BdjxicXmA_1738775773
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 14/14] Documentation: Update the todo
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
Content-Type: multipart/mixed; boundary="===============0471128589453502088=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0471128589453502088==
Content-Type: multipart/alternative; boundary="00000000000049d89e062d68488b"

--00000000000049d89e062d68488b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 7:53=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de>
wrote:

> Hi Maxime
>
>
> Am 29.01.25 um 15:31 schrieb Maxime Ripard:
> > Hi Thomas,
> >
> > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> >> Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> >>> Remove the TODO now that this series addresses
> >>> the changes needed.
> >> While your series is fine, this TODO item is unrelated. It's about
> various
> >> ancient fbdev drivers that do not reserve their memory regions
> correctly. So
> >> please drop patch 14 form the series.
> > Is it? Could we rephrase the entry then? I'm the one that suggested
> > Anusha to work on this, and it's still not clear to me what it means
> > exactly if it's not what she worked on :)
>
> I guess, we could make this more precise.
>
> Some old graphics drivers don't request their memory ranges correctly.
> It's usually a problem with hardware that has exclusive ranges, such as
> the VGA. Vga16fb doesn't request the range as it should. Someone needs
> to audit all those old drivers and fix them.
>
>
This sounds like a good next approach. I will make the documentation more
clear.

Thanks for feedback everyone!

Anusha

> Best regards
> Thomas
>
>
> >
> > Maxime
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>

--00000000000049d89e062d68488b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 31,=
 2025 at 7:53=E2=80=AFAM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerman=
n@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Maxime<br>
<br>
<br>
Am 29.01.25 um 15:31 schrieb Maxime Ripard:<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:<br>
&gt;&gt; Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:<br>
&gt;&gt;&gt; Remove the TODO now that this series addresses<br>
&gt;&gt;&gt; the changes needed.<br>
&gt;&gt; While your series is fine, this TODO item is unrelated. It&#39;s a=
bout various<br>
&gt;&gt; ancient fbdev drivers that do not reserve their memory regions cor=
rectly. So<br>
&gt;&gt; please drop patch 14 form the series.<br>
&gt; Is it? Could we rephrase the entry then? I&#39;m the one that suggeste=
d<br>
&gt; Anusha to work on this, and it&#39;s still not clear to me what it mea=
ns<br>
&gt; exactly if it&#39;s not what she worked on :)<br>
<br>
I guess, we could make this more precise.<br>
<br>
Some old graphics drivers don&#39;t request their memory ranges correctly. =
<br>
It&#39;s usually a problem with hardware that has exclusive ranges, such as=
 <br>
the VGA. Vga16fb doesn&#39;t request the range as it should. Someone needs =
<br>
to audit all those old drivers and fix them.<br>
<br></blockquote><div><br></div><div>This sounds like a good next approach.=
 I will make the documentation more clear.</div><div><br></div><div>Thanks =
for feedback everyone!</div><div><br></div><div>Anusha <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Best regards<br>
Thomas<br>
<br>
<br>
&gt;<br>
&gt; Maxime<br>
<br>
-- <br>
--<br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Frankenstrasse 146, 90461 Nuernberg, Germany<br>
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman<br>
HRB 36809 (AG Nuernberg)<br>
<br>
</blockquote></div></div>

--00000000000049d89e062d68488b--


--===============0471128589453502088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0471128589453502088==--

