Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6147C056
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 14:03:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 081CFC5E2D4;
	Tue, 21 Dec 2021 13:03:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F01EC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 13:03:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id i31so13913753lfv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 05:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kqXlLV8SePaGC+y3/vdaOf1H0E4thOEsiFPNapXQwSc=;
 b=YyYPK9tu3NmScrecLS1MccIJvkhdJy4nQ05x9Z3bt/8vALw1x+ChKGPtvKCnZY5xvi
 s4WV5IxCq8WSDBv2lm3jUZPwAN3lYjxzCTki+vYHcztUd3Z893htrpRORBgTB/r8ARsS
 K0OKXOBmn41TVqOgRYMdG4ebbv3TOsci2xjntYGbZvUW94hh9kZqEZ53DDRR3Gh6dQrc
 +IZx6HEWuvQGmStWddnzGBtvp2zCJ0nnFIoOvxb2lfRMifH5uwNLatShXB1/xGgqBhdU
 HsfgFm7/neLDbVqqD03e2p+Y3lkxRPxzBzfjifTjzsiWHArWZJeaA4J26WB4c/6kWMOx
 RgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kqXlLV8SePaGC+y3/vdaOf1H0E4thOEsiFPNapXQwSc=;
 b=WKEmernLUYptjjVmuVtidU8b8KRBqaWmZ2ioNcdEw9N885Qwv7GaMkFt2CgwO+eNyh
 +ZGre+IocpUOa4IeBR2/KdvYmMrxUmWC2rtyhOVxGzC7XsYJ5m/+ndXrR0SPmnT+0lMX
 QeGO9Du3t9i/75o9YzDSQbri8mJcP7E2E/MFIo/gVSCatpYpaUkdzcqkTRCioZXbMsPF
 YnHFwKlcRzU6xa4C8ebRJLjUPe+50qOTv6nob6arhBnkP/nJzHvPrWvhLDrGFM6ZfgHk
 dwrrRxpV+9RmF/aZHIJrgV8bA0FT9JVYtmVDrrQvx6IPzzmSS1do/FsV8BFZLDW3Q1bf
 lxOg==
X-Gm-Message-State: AOAM533z+unVi0GUtJ7t+MkBJ4zBlengfD1KWO5VieA5vyQuxxIVvXhk
 5gHJ3jg+aN31Bltzj8ek4lT1FA7c5uWNkDGEYbXZ1A==
X-Google-Smtp-Source: ABdhPJz29OYTxN/YI/nfoGqSbzGzFH8lQFfuOhtkX+emAf6tcx5jyjh7QQeKtEVugrVqanaBliR1j4kwByF6Bzl9MiU=
X-Received: by 2002:a05:6512:3bb:: with SMTP id
 v27mr3010113lfp.71.1640091812018; 
 Tue, 21 Dec 2021 05:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
In-Reply-To: <20211215141727.4901-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Dec 2021 14:02:55 +0100
Message-ID: <CAPDyKFpxionwX-OZwPGbwCmRmqTkWbcf7XQsZyHMh7Ht=smPbQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, u.kleine-koenig@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] mmc: mmci: updates for STM32MP13
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

On Wed, 15 Dec 2021 at 15:18, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> The new STmicroelectronics STM32MP13 SoC embeds a new version
> of the SDMMC peripheral (v2.2).
> It supports SDR104 and HS200 modes.
>
> Yann Gautier (4):
>   mmc: mmci: Add support for sdmmc variant revision v2.2
>   mmc: mmci: increase stm32 sdmmcv2 clock max freq
>   mmc: mmci: stm32: clear DLYB_CR after sending tuning command
>   mmc: mmci: add hs200 support for stm32 sdmmc
>
>  drivers/mmc/host/mmci.c             | 7 ++++++-
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 7 +++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>

Patch 1, 2 and 4, applied for next, thanks!

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
