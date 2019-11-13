Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB1FB36C
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 16:15:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F4D1C36B0B;
	Wed, 13 Nov 2019 15:15:52 +0000 (UTC)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B55D4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 15:15:50 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id b64so169840vkg.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 07:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tdx64IKqxKujdLSoPw+cjx2+bVR8WBgZkb8xil7EtMM=;
 b=Kiaj0N5S0qYuVlCpJBh03NNDuyWtcNFnOuJsukl9zdoiOeFcx8h4ED9IUaW/x4fITZ
 tYZ0Le24vH3+ac2xQ/6lGGC+9jq9R+JXkAVb5c8k/UtUgtPpEpiU3ULFRARyfY4dFdqg
 tZQdf67Tiwl23gMVa1lI8+BqS//VN6Y3kNX+XkjvoQN1V6JXq6UoiUXJjuRTOqHPXEdM
 jzzP+kAZDU9zY+J/O0raG0KPLhX41af5R0cHcBJUk+o7penJeGbFwOkqh+BP1+OyA5fe
 yr0GyhqxCK9Lej974x047/O+3wkrx097s9AYydjrreC5U2UMB99SKacR5BccrvtPV/iS
 XFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tdx64IKqxKujdLSoPw+cjx2+bVR8WBgZkb8xil7EtMM=;
 b=uPv4rRgayRKzUdZPErcyISyA+1zcLNzaOxPV5pKKE8PSG4S+uTuQMDwSh8uf/KlCNB
 c8/Wf//8zgYr7gnv2nW6nFk1yvkNGISNBeLOGSP9USLR5CMeWg5pQy+mwdGpv9oeXRMf
 1O3bqHLIqoduScP18CzUUC9xzpJbCpZoYQ2jJ/5gfv/pPyF11/Pced/bjwr9vtS7JL2S
 j3Ruyi8Xtk3wywpbZsc44U09fBt8boOlNSd3dka9ia25VCfIi+xSAO6LkkKZ5+NT8C0K
 zmQya+pp1YnwXMiHJ1lJGzxuS93tF9ErNYk/g7+3kkOX13XIrgRBZAuEHzS8ePW7O89R
 QKQQ==
X-Gm-Message-State: APjAAAVa/PkjiLodvGpv1m3IqZriemedrcEujjUB3gJlGW6DYfDSB3ph
 A4ZSkUjOl+mOvLN9EtuX4W7Ro5IiRVigUxNUzI4=
X-Google-Smtp-Source: APXvYqwwACa+02CrVM7lnQq8G9xOFlxb696P1JSOC3QIO3M+yBf6hT1VsVmH1ipJUkNQQy14paArRCJowFOcazun1gI=
X-Received: by 2002:a1f:a1ce:: with SMTP id k197mr1986349vke.28.1573658149379; 
 Wed, 13 Nov 2019 07:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-3-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-3-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 15:15:22 +0000
Message-ID: <CACvgo51TpL1GMwf-QFidsbAQ-GiE6ry+QHwmi9x0Nen9Gg4B1g@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/4] drm: bridge: dw_mipi_dsi: abstract
 register access using reg_fields
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

On Wed, 6 Nov 2019 at 16:31, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> Register existence, address/offsets, field layouts, reserved bits and
> so on differ between MIPI-DSI versions and between SoC vendor boards.
> Despite these differences the hw IP and protocols are mostly the same
> so the generic driver can be made to compensate these differences.
>
> The current Rockchip and STM drivers hardcoded a lot of their common
> definitions in the bridge code because they're based on DSI v1.30 and
> 1.31 which are relatively close, but in order to support older/future
> versions with more diverging layouts like the v1.01 present on imx6,
> we abstract some of the register accesses via the regmap field APIs.
>
> The bridge detects the DSI core version and initializes the required
> regmap register layout, so platform drivers will continue to use the
> regmap as before. Other DSI versions / register layouts can easily be
> added in the future by only changing the bridge code.
>
> An additional benefit of using the reg_field API is that much of the
> bit-shifting and masking boilerplate is removed because it's now
> handled automatically by the regmap subsystem.
>
> Not all register accesses have been converted: only the minimum diff
> between the three host controller versions supported by the current
> vendor platform drivers (rockchip, stm and now imx), more can be added
> in the future as needed.
>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

With the extra const mentioned below the patch is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

> +
> +static struct dw_mipi_dsi_variant dw_mipi_dsi_v130_v131_layout = {
It's a non-const here, while we consider it a const below. I'd add the explicit
const declaration here.

> +#define INIT_FIELD(f) INIT_FIELD_CFG(field_##f, cfg_##f)
> +#define INIT_FIELD_CFG(f, conf)                                                \
> +       do {                                                            \
> +               dsi->f = devm_regmap_field_alloc(dsi->dev, dsi->regs,   \
> +                                                variant->conf);        \
> +               if (IS_ERR(dsi->f))                                     \
> +                       dev_warn(dsi->dev, "Ignoring regmap field " #f "\n"); \
> +       } while (0)
> +
> +static int dw_mipi_dsi_regmap_fields_init(struct dw_mipi_dsi *dsi)
> +{
> +       const struct dw_mipi_dsi_variant *variant = &dw_mipi_dsi_v130_v131_layout;
> +

Having a closer look at the const-ness thing:
devm_regmap_field_alloc() uses a read/write copy of the reg_field struct (5
unsigned ints), even though it only uses them as read-only. A sensible way to
improve is is to pass a "const struct reg_field *" instead.

But that for another day ... might be worth adding a newbie regmap task for, if
you can see where to file that.


-Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
