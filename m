Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730EC66D82B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 09:28:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23A25C65E45;
	Tue, 17 Jan 2023 08:28:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BFCAC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673944084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+6BYudluJLerY8xv5pVK4MG77+MbXReDqsF/tlVARI=;
 b=fwfdJJFR3u5BbPWm0zZXEsnx5GpNa/hU1fHPntGLa3q+SnHmhIosv4TjMryxzJWBQlAhlR
 Uq07s0YjalUr3vkdrNsXOq2wk2610IjDfd5Q5IRFq2xmLChKAUPXAqaiyNxyvcUx2PUfEx
 yNUTwACHBHPUTM5nA6zbH34quaWySi0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-7h3Sy63NOTCwxo4vL3bYjg-1; Tue, 17 Jan 2023 03:28:03 -0500
X-MC-Unique: 7h3Sy63NOTCwxo4vL3bYjg-1
Received: by mail-qk1-f198.google.com with SMTP id
 ay34-20020a05620a17a200b00704bd9922c4so22251487qkb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 00:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+6BYudluJLerY8xv5pVK4MG77+MbXReDqsF/tlVARI=;
 b=1c1ljr2qLFwiI+KbN5lvM554W3Au5IrYO6XHakXts5AK/nwWZx5NKx0TYdAPko9cpQ
 45YZ1YLYUhflHV81zrCff/9jOQiVGeHLl9vf4iDfQW1oX0UySKWiAmWnVVjiwifWOluq
 ejp+At081dZO5XIGZbY/5veXF+1PuQ9W9H3zUsK6s1aCRyzUJy4aI9UxI+Fg2X0nWw4U
 WOIvswnAJk/QiXU66cLczpu08/GhIfJKbwPdmYPQXb3GkXi0ha318q2QDln5cniq5Kn2
 lroHH4slpS0sIJYVxXCMds9WL0xtytCYD5UisAlOUjS73Gp+AP/md8OgNApLeBCgQ6xr
 BRrw==
X-Gm-Message-State: AFqh2kowNMPM6ES4S6OejWdlESg0kWRSLa3zPfzw+lZ+qRNnpJfjO5BS
 n7R3StxSn+w6y1MgpKRcoHbyLyre3LfWzKaCdxcXLBFfVZuyfvF+5S8NTC3YjdK5nikglSXbayu
 BsfN0mJJAGERL5VrSm+prAclbnwFvpWZx4bf8LoOb
X-Received: by 2002:ac8:718f:0:b0:3b6:35a2:bb04 with SMTP id
 w15-20020ac8718f000000b003b635a2bb04mr2857508qto.7.1673944082570; 
 Tue, 17 Jan 2023 00:28:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/E4Cr9udbp9axgo1/YZ5h66bfn9nqv1hysCj476Ft8Z+EGz88GliVUvugE+ln2/ljJlMqIA==
X-Received: by 2002:ac8:718f:0:b0:3b6:35a2:bb04 with SMTP id
 w15-20020ac8718f000000b003b635a2bb04mr2857480qto.7.1673944082284; 
 Tue, 17 Jan 2023 00:28:02 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-115-179.dyn.eolo.it.
 [146.241.115.179]) by smtp.gmail.com with ESMTPSA id
 bj30-20020a05620a191e00b006bb82221013sm19709741qkb.0.2023.01.17.00.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:28:01 -0800 (PST)
Message-ID: <6ee1798af93cc5b8c46611ecca941ee57481358e.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Clark Wang <xiaoning.wang@nxp.com>, wei.fang@nxp.com,
 shenwei.wang@nxp.com,  davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh+dt@kernel.org,  krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de,  festevam@gmail.com,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, 
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Tue, 17 Jan 2023 09:27:56 +0100
In-Reply-To: <20230113033347.264135-1-xiaoning.wang@nxp.com>
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 0/7] Add eqos and fec support for imx93
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On Fri, 2023-01-13 at 11:33 +0800, Clark Wang wrote:
> This patchset add imx93 support for dwmac-imx glue driver.
> There are some changes of GPR implement.
> And add fec and eqos nodes for imx93 dts.
> 
> Clark Wang (7):
>   net: stmmac: add imx93 platform support
>   dt-bindings: add mx93 description
>   dt-bindings: net: fec: add mx93 description
>   arm64: dts: imx93: add eqos support
>   arm64: dts: imx93: add FEC support
>   arm64: dts: imx93-11x11-evk: enable eqos
>   arm64: dts: imx93-11x11-evk: enable fec function
> 
>  .../devicetree/bindings/net/fsl,fec.yaml      |  1 +
>  .../bindings/net/nxp,dwmac-imx.yaml           |  4 +-
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 78 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 48 ++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 55 +++++++++++--
>  5 files changed, 180 insertions(+), 6 deletions(-)

It's not clear to me if the whole series should go via netdev. I
think/fear such option could cause later conflicts for Linus. Does it
make sense to split this in 2 chunks, and have only the first 3 patches
merged via netdev?

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
