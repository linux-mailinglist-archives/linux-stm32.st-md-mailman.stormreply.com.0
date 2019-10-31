Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57CEB5D1
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2019 18:09:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2C55C36B0B;
	Thu, 31 Oct 2019 17:09:35 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 293DBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 17:09:33 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g7so1715658vsm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbJu3UVGxb/D3O3Jaajy2yYceop1LdG6jIZpC2UGdME=;
 b=sILgo0ExuXrqJv9wUbE2Tumq0ELe9CBQDKkU77dnmj/RuVa26/zmecu0GpbeZGTHBM
 ePVf1uFkrSYmYYbtLs705cqb8LfV8HUlHunhiFQbAbOik3oQEtW7EJPpasqgTvjQ2TM0
 LIrREjmrFrRvjpBgBmRubuP6d0oRUxDI8Hc32Y4qIlmCaBj2B/JSC+PHwtXGcKgLiWus
 DEKo5bKI89SVAivdVDnQ+wCLFKmAm9oWYDSxKRXcB3/y3uZeqC/7CvcgrGjxfvkSWxoG
 TG6wKMt7wZHp7DAHNEHqrk4ygoaC3HxA8z/wUcmHdZrBvMtS821UR9VsV2r3le3tgedY
 vrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbJu3UVGxb/D3O3Jaajy2yYceop1LdG6jIZpC2UGdME=;
 b=OyBlcfjgiSG5bKn+c5v8gXeTMuD3vGF8u1pplRs2aniAtluzBoJU5aC/bs/IvZECAw
 k9lzhr9+QmnAeC/pfw2b5nlpMnZZ7iHakT1p+fGanuOwywFcvPdOR3x1Q3s6DXHRRP4Z
 245vTtUNCMF7gEYbgV3X0x2n+dQqTSI9ZB0cNDNM8oIdu/M63rMj6EOsP33U9xgDZZPv
 KSqI8+V2UTYINf7zMvSK8m8pSE8LAZ/7HwIc7gYf5NVl11u+7fxrydB2zPGLTLreCWOM
 aK6xdravVNiEStAAdFuWqzbU5mkF5dzs8rKSZJnnL7Ohxy86Kup3AGyaVebpC9Pfq9Yt
 jJYw==
X-Gm-Message-State: APjAAAUV5v96B3oJaRNCfdNhqlzy7PqUrBC39hO5LYdAvjvU2ki3xhrD
 YGyhwV/zGv4aSyw+WpIGJqqPyATakNcb6yi7dBQ=
X-Google-Smtp-Source: APXvYqyLkkWgJ7ICTVfMGBOcq4S2OAn5nYpk6VJZW0O94lgZM/BCKp35+LK16Ms8/t5Z7RoL2Vj7T2VyJxX2Oc575EY=
X-Received: by 2002:a67:77d4:: with SMTP id s203mr3435400vsc.118.1572541771757; 
 Thu, 31 Oct 2019 10:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191031142633.12460-1-adrian.ratiu@collabora.com>
In-Reply-To: <20191031142633.12460-1-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 31 Oct 2019 17:07:36 +0000
Message-ID: <CACvgo50NmofJrCvADOTxJqJqKEWDsy8qD-1B6R356vFMcmdbWA@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/4] Genericize DW MIPI DSI bridge and add
	i.MX 6 driver
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

Hi Adrian,

On Thu, 31 Oct 2019 at 14:26, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> Having a generic Synopsis DesignWare MIPI-DSI host controller bridge
> driver is a very good idea, however the current implementation has
> hardcoded quite a lot of the register layouts used by the two supported
> SoC vendors, STM and Rockchip, which use IP cores v1.30 and v1.31.
>
> This makes it hard to support other SoC vendors like the FSL/NXP i.MX 6
> which use older v1.01 cores or future versions because, based on history,
> layout changes should also be expected in new DSI versions / SoCs.
>
> This patch series converts the bridge and platform drivers to access
> registers via generic regmap APIs and allows each platform driver to
> configure its register layout via struct reg_fields, then adds support
> for the host controller found on i.MX 6.
>
Have you considered keeping the difference internal to the dw-mipi-dsi driver?
Say having the iMX6 module "request" the v1.01 regmap from the bridge
driver, while rockchip/others doing the equivalent.

>  .../bindings/display/imx/mipi-dsi.txt         |  56 ++
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 518 +++++++++---------
>  drivers/gpu/drm/imx/Kconfig                   |   7 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dw_mipi_dsi-imx.c         | 502 +++++++++++++++++
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 154 +++++-
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         | 160 +++++-
>  include/drm/bridge/dw_mipi_dsi.h              |  60 +-
>  8 files changed, 1185 insertions(+), 273 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/mipi-dsi.txt
>  create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx.c
>

This should make the delta a lot smaller, avoiding the unnecessary
copy of register fields and regmap.
Plus plugging future users will be dead trivial.

-Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
