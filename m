Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2431DF3DE
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2020 03:35:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17118C36B25;
	Sat, 23 May 2020 01:35:47 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FBAEC36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2020 01:35:44 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id 17so12682937ilj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 18:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S1QSAzJLA557HDI9geZdFtza2j2ttaAmC0/pNbF94RQ=;
 b=A992b6KQ0XxvQBvr4hpSCBAiJVOy3bCMOJRZbTEgNVsjziHkOX1YLkNL2W7JgGf5kB
 6dkdnQIBW/+Lh4TZr5VZ9W9jlKsQLHFUNaXvbtKPXiXkE2z25chDOo+YqkADBuJdDhZ/
 tHUB4rgSKsyEN1xbge2cNw65A0heIWhKbJcDMDvUkNC/9rydOmAqGX3PUZ8I2z0U7Y/V
 5Cr+kLr+aMh+DQj7mplWOIOBhISwulzYr6G01tL+aSEMoNt7Tw1DQ0rbXyQBcNzZ99L6
 aTZi5JpRzKVrsOLiFDG26hTNg0/+eB2eYUciggM6rhuzsRwMg4KgAEsT2EqkXuw9fJM0
 UHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S1QSAzJLA557HDI9geZdFtza2j2ttaAmC0/pNbF94RQ=;
 b=aFxm1/uAEzjS0r1NQbDJEyDjrynuaOIDyuf++5bQNKY0sZS+yOhxAss8nALa9gfb06
 4k0ISbjafFgQ+Qdm3ncyCkn9Gd4kN8LQ8DAuV+xftUXtWLZElNBVH2q/Anyq4aO3KRJK
 8bqL3B1H2NTDRimEgHiQmiQUw4nOJERs6UfSFfnzRCB3CgQHrIhT04PYgDPf2I8H/U7v
 V3mQHiFqUE4y30KU6o+muLdcpOrfiJUO4bQ215HAh3nQT4yV5nZUdMeeiwkljWfw/5c5
 9PS0Kbnf3CuDNOKbQ1wIVMsKL/SQ//D8hxu1+IUY0oeVK8P8j9wnr+yFDH719UsSLbUJ
 ZKuA==
X-Gm-Message-State: AOAM532nb+CLm2Br4X8A5jmBWRgtofQMA4nJaeR6+ZjwQwUgUhkovTed
 JYJM+XWce0wiAGP/BHSFb2fIoX2CLS71jFKAolQ=
X-Google-Smtp-Source: ABdhPJyFMcan15/IQgBUd7V654mVVCiDvmI/KPlV1LTFmOXrmNhn289+5jn0LkISjmGIfWZTCLlEXoFxdgoJGQtXdZU=
X-Received: by 2002:a92:dc85:: with SMTP id c5mr15557198iln.270.1590197742955; 
 Fri, 22 May 2020 18:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
 <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
 <20200522162901.GP5801@sirena.org.uk>
In-Reply-To: <20200522162901.GP5801@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Sat, 23 May 2020 09:35:06 +0800
Message-ID: <CAL9mu0+E5R0mDUW3f+aKpfE_457VimS-ow2z_xVOmCfCAMnKuA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, p.zabel@pengutronix.de,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX',
 'SPI_3WIRE_RX' support for stm32f4
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

On Sat, May 23, 2020 at 12:29 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 11:59:25PM +0800, dillon min wrote:
>
> > but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
> > the correct spi_3wire direction.
> > actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
> > for SPI_SIMPLE_RX mode,
> > simulate SPI_FULL_DUMPLEX
>
> Oh, that's annoying.  I think the fix here is in the core, it should
> ignore MUST_TX and MUST_RX in 3WIRE mode since they clearly make no
> sense there.

How about add below changes to spi-core

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8994545..bfd465c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1022,7 +1022,8 @@ static int spi_map_msg(struct spi_controller
*ctlr, struct spi_message *msg)
        void *tmp;
        unsigned int max_tx, max_rx;

-       if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
+       if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) &&
+               !(msg->spi->mode & SPI_3WIRE)) {
                max_tx = 0;
                max_rx = 0;

for my board, lcd panel ilitek ill9341 use 3wire mode, gyro l3gd20 use
simplex rx mode.
it's has benefits to l3gd20, no impact to ili9341.

if it's fine to spi-core, i will include it to my next submits.

thanks

best regards.

Dillon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
