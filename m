Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246B1DECAF
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 18:00:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48B63C36B25;
	Fri, 22 May 2020 16:00:05 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18F64C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 16:00:02 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id d7so11871749ioq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHIFAWUYDhJ80n0eXg0z7nTHf0/vDwtgn87D1kTvKZw=;
 b=VwHlaoAfnE0jrQI4ME3ZjZ87Fl8fMiI7FOB/65iDK32jeXJ0r6Bf6SnfYRIVEO6k6m
 DzlctHIuvMnhbnvAziB3ubyH4olRzONZWriz82tW84id41d+G0aaZsGJzAQD9SqY6STl
 U+KIXtBjUhXfneehG1qd35VDkYmEVKk7k7U5Q0d9nJw20AfuQV3MvWXVSY1liADEoJS7
 FgJEadNiBp+b7li6e5pXHsRL5ssVBlR672GS1Q9jDnRZiYAnpONVjiZRHjbbr9FFH8d8
 W/7kM258Bwcm/cHTYm/kHaSY9DU3wWohGjofhiEvbcNCowmRsk2+eu46fBFd/xkb9Pl+
 kx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHIFAWUYDhJ80n0eXg0z7nTHf0/vDwtgn87D1kTvKZw=;
 b=g5JCxJnwxW5WRli+bs6JtvGlB9nHI1wVhXiRpgQ3jdSH0sr5yhVoof9Ilbaj6kxYmo
 Km78n6Yb0aaMNDIeQY+LCZmmtPbra8YeMchCKIir9Z8fDPXrMNokoaxBFvnBOPCpk5nd
 f+Tw3c0RX9jSkTTamfkczsxXdyIN/fRbHYtEYF1O6wSwaKFBagagiX3AIF0a9nCmyhuL
 aC/WFsLbXMTkslkjkrs/07B+yJCapgRWVodbqmH1zqAtvLK3rk8TpzusW3H0dXQ+MOUD
 ejMi0wq84Mbfj2T+RBaODSPbadrtVaVwdWlBTf25RwF9S40GyiJb1cpE5x/u3fECo3iB
 8FEw==
X-Gm-Message-State: AOAM532B/KZ6DfeutgHo/jwfsJMtn58Gr+epGbWKl7v7J4gyiYVucI/O
 Ff/97up/4WOKHGlS3LYCX1YkU6qcKK1VBUpWbho=
X-Google-Smtp-Source: ABdhPJzAQJiDrgeJy7rhfX0pAkio1uuxAwG3849yDdBeiLJsJGxodT7NQRbXZ/oKCcFCwEsCtRUE249ryL/Lt2qOMyI=
X-Received: by 2002:a05:6638:631:: with SMTP id
 h17mr2552012jar.137.1590163200792; 
 Fri, 22 May 2020 09:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
In-Reply-To: <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 22 May 2020 23:59:25 +0800
Message-ID: <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
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

On Fri, May 22, 2020 at 10:57 PM dillon min <dillon.minfei@gmail.com> wrote:
>
> hi Mark,
>
> Thanks for reviewing.
>
> On Fri, May 22, 2020 at 7:36 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:
> >
> > > 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> > > null, we must add dummy data sent out before read data.
> > > so, add stm32f4_spi_tx_dummy() to handle this situation.
> >
> > There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
> > that the driver can set if it needs to, no need to open code this in the
> > driver.
>
> Yes, after check SPI_CONTROLLER_MUST_TX in drivers/spi/spi.c , it's
> indeed to meet
> this situation,  i will try it and sumbmit a new patch.
>
> thanks.
>
> best regards
>
> Dillon

Hi Mark,

There might be a conflict with 'SPI_CONTROLLER_MUST_TX' and 'SPI_3WIRE' mode,
i need to know the SPI_3WIRE direction,  currently i get this
information from 'struct spi_device'
and 'struct spi_transfer'
if ((spi_device->mode & SPI_3WIRE) && (spi_transfer->tx_buf == NULL)
&& (spi_transfer->rx_buf != NULL))
    this is a SPI_3WIRE_RX transfer
if ((spi_device->mode & SPI_3WIRE) && (spi_transfer->tx_buf != NULL)
&& (spi_transfer->rx_buf == NULL))
    this is a SPI_3WIRE_TX transfer

but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
the correct spi_3wire direction.
actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
for SPI_SIMPLE_RX mode,
simulate SPI_FULL_DUMPLEX

how do you think?

thanks

best regards

Dillon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
