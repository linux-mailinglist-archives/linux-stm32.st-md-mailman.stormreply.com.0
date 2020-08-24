Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9824F998
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Aug 2020 11:47:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BF0EC32EA7;
	Mon, 24 Aug 2020 09:47:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FCE7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 09:47:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u18so7675151wmc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pp3z6h1D9WsMBTnOwfGB/PDJkTy44cyztqfZIjKmAm8=;
 b=eFuH4kVF1JYQjBjvnqyBBOo1phVc6xcnL6ZHpWjThPe78z8OjJP5I5zI7tQYg8iAid
 RHjPsjvD/ipKjZF0owLfUsrDJxqLqHVoEL3pi4Qvx48T1JqRFiByrdKftUFWGIXr42ht
 uPqm6JccmlIFJRI4opfhh9Oa/3x0Bcmu8PXvSKKh036wXwMcKWqKWA9I/grEAA7QamAx
 HpyUtXPnyFHkV+u+Rs4jqKjN2NyN5LsLL4cas4cmBegZkKsS8c+Q95Rij9DqNKnzKhVB
 Nj5Xuj1zzJSN/HCAY451BTx+YwPdTuykaarYMxpUNal5Q8uDbkrjfxYVyAeJjKsRy1iO
 S5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pp3z6h1D9WsMBTnOwfGB/PDJkTy44cyztqfZIjKmAm8=;
 b=lIP1FYLBzAS7Q5pJ4VXzVzySGCkUxOPXEyvnUEw/KQ8/Jj6njI3KeeRgLcVGJMYJOr
 Oo8zJBbntr61yBIbTRse0cZlpwXZzOZe1S03a7qpipD8Iu2QOtzXxhSwGjkW7tyGEn+d
 6faZ5BTIZCNQKnGBbd0/lqUdbh8CJu67UUCHJ0eAzNOE2TmG3L0J0HvDNBZnlKwVI7Mm
 YAxXE0Cbn3pmpGVAoWrhBDat8OYSrBR0h/jt3CO3a+Be06h+x/6aCa8urcr/9AMAQnjQ
 hvfQqpSs/AG9jl4piSvP2wokOK8ghZdfNKtNE4yzWbTesr0n2rH3rvD1slI24ZaAAXvh
 LpAw==
X-Gm-Message-State: AOAM533C2CpMk796/+zo+iCd2+bCubBR+bhOn5RJUaTiW38SanT5Lwrs
 pl7+weFzC7dvqT9lsY4A0x8XJ4076oBNrN7K
X-Google-Smtp-Source: ABdhPJxKznRV+opTvxcxJMeHGespujGb3mbCxvNcdL2xOo/SM1Gh50l6YfcMQoiYXRnWIhftQjKG2Q==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr4843469wme.8.1598262445236; 
 Mon, 24 Aug 2020 02:47:25 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p8sm23304491wrq.9.2020.08.24.02.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 02:47:24 -0700 (PDT)
To: Ezequiel Garcia <ezequiel@collabora.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <c6f10db1-7f56-a156-36a1-125e764c8c1a@baylibre.com>
 <87lfk3kaj4.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
 <b318069fe873e456f18d07d11f5d165667c9b04a.camel@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e0d0efec-09e0-6bf8-bab7-44accd14fa52@baylibre.com>
Date: Mon, 24 Aug 2020 11:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b318069fe873e456f18d07d11f5d165667c9b04a.camel@collabora.com>
Content-Language: en-US
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v9 00/11] Genericize DW MIPI DSI bridge
 and add i.MX 6 driver
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


On 15/08/2020 15:05, Ezequiel Garcia wrote:
> Hi Neil,
> 
> On Wed, 2020-07-01 at 09:35 +0300, Adrian Ratiu wrote:
>> Hi Neil,
>>
>> On Mon, 29 Jun 2020, Neil Armstrong <narmstrong@baylibre.com> 
>> wrote:
>>> Hi Adrian, 
>>>
>>> On 09/06/2020 19:49, Adrian Ratiu wrote: 
[...]
>>
> 
> It's been a month so I think it's a good idea to go forward
> applying IMX and STM patches (probably with the usual
> rebase dance).
> 
> As for Rockchip...
> 
>> The binding API removal change which directly touches RK can also 
>> be applied separately, but unfortunately I do not have access to a 
>> RK board with a DSI display to test it (or the bridge regmap logic 
>> on RK btw...), I just "eye-balled" the RK code based on the public 
>> docs and it LGTM.
>>
> 
> ... I'll be getting some DSI hardware to help with the pending
> Rockchip issues, so we can tackle Rockchip as well. I'm quite sure
> we'll loop Heiko as well if needed :-)

Sure, Adrian, can you rebase on drm-misc-next so I can apply the IMX and STM patches ?

> 
> Cheers,
> Ezequiel
> 
>>> Neil
>>>
>>>> Big thank you to everyone who has contributed to this up to now,
>>>> Adrian
>>>>
>>>> Adrian Ratiu (11):
>>>>   drm: bridge: dw_mipi_dsi: add initial regmap infrastructure
>>>>   drm: bridge: dw_mipi_dsi: abstract register access using reg_fields
>>>>   drm: bridge: dw_mipi_dsi: add dsi v1.01 support
>>>>   drm: bridge: dw_mipi_dsi: remove bind/unbind API
>>>>   dt-bindings: display: add i.MX6 MIPI DSI host controller doc
>>>>   ARM: dts: imx6qdl: add missing mipi dsi properties
>>>>   drm: imx: Add i.MX 6 MIPI DSI host platform driver
>>>>   drm: stm: dw-mipi-dsi: let the bridge handle the HW version check
>>>>   drm: bridge: dw-mipi-dsi: split low power cfg register into fields
>>>>   drm: bridge: dw-mipi-dsi: fix bad register field offsets
>>>>   Documentation: gpu: todo: Add dw-mipi-dsi consolidation plan
>>>>
>>>>  .../display/imx/fsl,mipi-dsi-imx6.yaml        | 112 +++
>>>>  Documentation/gpu/todo.rst                    |  25 +
>>>>  arch/arm/boot/dts/imx6qdl.dtsi                |   8 +
>>>>  drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
>>>>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 713 ++++++++++++------
>>>>  drivers/gpu/drm/imx/Kconfig                   |   8 +
>>>>  drivers/gpu/drm/imx/Makefile                  |   1 +
>>>>  drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c        | 399 ++++++++++
>>>>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   7 +-
>>>>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  16 +-
>>>>  10 files changed, 1059 insertions(+), 231 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
>>>>  create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c
>>>>
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
