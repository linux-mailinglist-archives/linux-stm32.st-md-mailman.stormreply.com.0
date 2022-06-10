Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F71545E6D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:18:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0778BC5F1D5;
	Fri, 10 Jun 2022 08:18:05 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4992C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:18:03 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r71so24157634pgr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 01:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uigtUS1xIOK2eGjV8S/JA4dIQjxGCEEjBa8iZpFRUZ8=;
 b=jcTu9+80+nCglm5pyAvgjAKE5LzR50EJFbv+JYa1B9q25eDB5bk0CSketGhE35Fen9
 ksicx1kd+d4kBZIrPusTVNBQYXCnVqvBmWj+qiZEz2oez+3Is9S8xhIAkw+Y3DjMInS4
 x/lB1Rkorsd/7Qsih8Bq8YMuP5QJ4TSIw+iKGT58tfyzOEBRYjpV2aXcEU5yX44JYw23
 AHyrma18BteO8IEC8uKIon1Q930VeyHyEh7w3ycumGsy+ekt9a03/NX/IZApSGdM0kzr
 YUQFpnDnmEslro2DVFlO9KNQCkzFXxpjzpgMsLCRluHPn60fWIosQjkJx84GTfWHPWMP
 dKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uigtUS1xIOK2eGjV8S/JA4dIQjxGCEEjBa8iZpFRUZ8=;
 b=mGQ1DTa+cik7/rvBiDNjVuX3pBcMtQLRxON9lvp8N1VBeHTzp5Z79HYyErOPxHlL5i
 x9kIRmtspg2qHg9gK59vuD4rFj/LbP1k7G2xWfVo2rw42cs6tqo9/Si9LdmRYp3vfS9Q
 n3NUCsbGaUG5ruQie5lR+LJfhPm3A65JF2A6GbEXHHzPp6kKG8io0gF3JEUHvdE2LReE
 hU6GOFKOYMUMvMGKWprr9hS60ud9RS0KrXpRKjwz2a+DwzYqtYuL9Fd0c4gpkhSXV8CW
 bZXM/hyinmxoQBUwj2HP+8EtT7AKN9Z5F5CmBs/fOAGN+8XxJNpP+2BGVsffOKHQvYtT
 ve+A==
X-Gm-Message-State: AOAM533N3uzs7yinMSevAZ4EBgQ2ZtQloumI5E7eFzD8fhblTojYzR4F
 Fyfjl5glhXO/f9P5DUCzwAjD1CPMSbzQerHiQi0KTA==
X-Google-Smtp-Source: ABdhPJx5RVqbDB4bxEL1kVn3ZdTR+qKYAp/7L1lm1uQ+DxI0/H0SJ3MghFQhCMEJKNsJSZwoNGUsaIguSVPleHNXWlo=
X-Received: by 2002:a63:91ca:0:b0:3fc:9077:c7c7 with SMTP id
 l193-20020a6391ca000000b003fc9077c7c7mr39163270pge.201.1654849081218; Fri, 10
 Jun 2022 01:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211218182804.208906-1-antonio.borneo@foss.st.com>
 <20220607213144.427177-1-antonio.borneo@foss.st.com>
In-Reply-To: <20220607213144.427177-1-antonio.borneo@foss.st.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 10 Jun 2022 10:17:49 +0200
Message-ID: <CAG3jFyvt8+Tbbx6rT8R72aNgEk40O+V7GE0ZTc4RdWDcQmhwYg@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND] drm: adv7511: override i2c address
 of cec before accessing it
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

On Tue, 7 Jun 2022 at 23:32, Antonio Borneo <antonio.borneo@foss.st.com> wrote:
>
> Commit 680532c50bca ("drm: adv7511: Add support for
> i2c_new_secondary_device") allows a device tree node to override
> the default addresses of the secondary i2c devices. This is useful
> for solving address conflicts on the i2c bus.
>
> In adv7511_init_cec_regmap() the new i2c address of cec device is
> read from device tree and immediately accessed, well before it is
> written in the proper register to override the default address.
> This can cause an i2c error during probe and a consequent probe
> failure.
>
> Once the new i2c address is read from the device tree, override
> the default address before any attempt to access the cec.
>
> Tested with adv7533 and stm32mp157f.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Fixes: 680532c50bca ("drm: adv7511: Add support for i2c_new_secondary_device")
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
>
> This patch got somehow lost, I'm resending it.
> Added reviewed by Kieran Bingham.
> Rebased on drm-misc-next.
>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..074c2e650cae 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1065,6 +1065,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>                                                 ADV7511_CEC_I2C_ADDR_DEFAULT);
>         if (IS_ERR(adv->i2c_cec))
>                 return PTR_ERR(adv->i2c_cec);
> +
> +       regmap_write(adv->regmap, ADV7511_REG_CEC_I2C_ADDR,
> +                    adv->i2c_cec->addr << 1);
> +
>         i2c_set_clientdata(adv->i2c_cec, adv);
>
>         adv->regmap_cec = devm_regmap_init_i2c(adv->i2c_cec,
> @@ -1271,9 +1275,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>         if (ret)
>                 goto err_i2c_unregister_packet;
>
> -       regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
> -                    adv7511->i2c_cec->addr << 1);
> -
>         INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
>
>         if (i2c->irq) {
>
> base-commit: dfa687bffc8a4a21ed929c7dececf01b8f1f52ee
> --
> 2.36.1
>

Applied to drm-misc-next.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
