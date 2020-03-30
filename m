Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61A197B33
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 13:49:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE85C36B0B;
	Mon, 30 Mar 2020 11:49:33 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E70F0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 11:49:29 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q19so17643774ljp.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3LI716UXF6bfo4VYqoP3VeDTvzHtXiCh3tM1tgh2v+k=;
 b=nsExSjXHqIvgbyHEhZzSlHZ6qD7wnb3b7lQ2UUHlFb5MZvlWcVzdj0RPl6mpt8ALgm
 lr8frOmesionfQ+vaY8rFIX8GvC8Q7ZgFYyxVx1tlnkK8QSOZPHwLZ/2A+Zbwa2KICUA
 g9VnqDbo0OoQPSqFcQsSYwvzTEzLmQlPT6RyfE5yy6S3DEVF/X8MOTnUv1G5iBt/D9M5
 Xuy8PBJUBLjxWgO0vVHF69ZxuHLj13gwdEuSc3LZcVW5XIK3hJkUaWz9lZ54g7h7D+jG
 oSxXr/rvj7FpRtkUM4BALSUJbOlZX1oJH0VblPEPkpwEyAfpIGByujN/jXC47U8bS0cz
 q4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3LI716UXF6bfo4VYqoP3VeDTvzHtXiCh3tM1tgh2v+k=;
 b=misPWNLSjPw/TZzHpD5BkBBPlTBuXuzzNIhO8cUhzHIC47iItKEvdNOJZNtySlNvea
 oZ5zhSGrPhFJkMbUXdEKWVEmRzYndzSMPd5zDZIPgiCwrD5yVdF0pLQZbdwur8Hk8pNO
 uh0uvsEAb/bzvcuQwsrw0RKQIDsb3xt66Gkm2+PRPcW148yvfu+Vy0ydi+r93tmi/vp/
 3cpwH49ziGpNy0bCNdGGqn/MkerKoOLFF6dVBLe/Gk0dp+f7YP/O9ripZ4sFOGPacp7J
 ROnUZzIt/p6CTjfoc67ZQFdLTwjahsMJeVHH6XsaAaOf4H9+3FnOfLYR2JBZ79xHec3T
 ik7w==
X-Gm-Message-State: AGi0PuZkHv2LlWEXVQdyewh7Uyf7mZFUhBvhFLp21ZxwQlM7FZjlV7RW
 /aeB7rPjxwpJVW+RCTehDxdMOJ/M+XHhfjdHcZU=
X-Google-Smtp-Source: APiQypJcW+KgRk6o/Ou48vwV4luc+5i+/EZubfDgsinD6eEi6d3RUluGeVWMrjQtxj/UdvutLn1NA3q5aclTGJP/Ah4=
X-Received: by 2002:a05:651c:30b:: with SMTP id
 a11mr6771326ljp.164.1585568968812; 
 Mon, 30 Mar 2020 04:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
In-Reply-To: <20200330113542.181752-5-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Mar 2020 08:49:19 -0300
Message-ID: <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Martyn Welch <martyn.welch@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, linux-rockchip@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host
	platform driver
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

On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This adds support for the Synopsis DesignWare MIPI DSI v1.01 host
> controller which is embedded in i.MX 6 SoCs.
>
> Based on following patches, but updated/extended to work with existing
> support found in the kernel:
>
> - drm: imx: Support Synopsys DesignWare MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>
> - ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>

This one looks like a devicetree patch, but this patch does not touch
devicetree.

> +       ret = clk_prepare_enable(dsi->pllref_clk);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to enable pllref_clk\n", __func__);
> +               return ret;
> +       }
> +
> +       dsi->mux_sel = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr");
> +       if (IS_ERR(dsi->mux_sel)) {
> +               ret = PTR_ERR(dsi->mux_sel);
> +               dev_err(dev, "%s: Failed to get GPR regmap: %d\n",
> +                       __func__, ret);
> +               return ret;

You should disable the dsi->pllref_clk clock prior to returning the error.

> +       dsi->mipi_dsi = dw_mipi_dsi_probe(pdev, pdata);
> +       if (IS_ERR(dsi->mipi_dsi)) {
> +               ret = PTR_ERR(dsi->mipi_dsi);
> +               dev_dbg(dev, "%s: Unable to probe DW DSI host device: %d\n",
> +                       __func__, ret);
> +               return -ENODEV;

Same here. You should disable the clock. Shouldn't you return 'ret'
here instead of -ENODEV?

> +module_platform_driver(imx_mipi_dsi_driver);
> +
> +MODULE_DESCRIPTION("i.MX6 MIPI DSI host controller driver");
> +MODULE_AUTHOR("Liu Ying <Ying.Liu@freescale.com>");

The freescale.com domain is no longer functional.

Ying Liu's NXP address is victor.liu@nxp.com. You could probably add
your entry as well.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
