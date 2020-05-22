Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB141DEAF4
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 16:57:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA93FC36B25;
	Fri, 22 May 2020 14:57:50 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 870F2C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 14:57:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id f3so11672980ioj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4E93R1F4OMg9K2XLuc0UwI5BfmV/kB8DZ8DcAqlj91Q=;
 b=RJh8B/6rHjjbkuji4u+fJ26zGQ2weYdBP8O87V6gBC0R3uO3Cxuxwia4xEC5fiQpVd
 BVao3bcj3EENB6cqKTKGBQu174xQRasXIfU4q+TkCRor9QpUGn/bNvOhtPgxnpksjF4z
 3fsMvYjJfJTHISaJ3cUFiRzeDfD7i3e9PZi6fj0SkJEmzk7TEWtsxWUY/iwJxQpOJ2R4
 T9SYcuC5mIwu3BPDv9d/KbkENTdJY9raVR0/065zsK9r46jPvzUkAxudp8zmyxpkPzW8
 Mh3IcqqBDWoU5MuQNyfGmuqSaUQzuiK4qAbocc1kDDt5QghsG+0LEtcX/A9knBg3T5Ef
 pvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4E93R1F4OMg9K2XLuc0UwI5BfmV/kB8DZ8DcAqlj91Q=;
 b=mnxydDgSAzJyFUwI3TWyBLHBkrPRQEAmo92lTzUR+aJymNJXewPSSvsDkS4xAKtJh7
 CZagbJen9Nf+0uS7ZjejC5AcfQ7Z/SlvyCWuan9w0Lr+O+UZKQT5lfl2pYTPNVT0Lytx
 B5HU58hRAHoKFKlOu/dUULnlETB6v15cwYFfWPbgIy20zqlRAQCAFvEMxSZxrDnbxEJJ
 h/yyxBs8NU+tNU0ZGV1zKDnT4MLKDPM253JH20CukVgzrQ5VIstPjgyKtil5bRbNr9aM
 dOe2O/pIhkvMCNlaRm8RDwooK5sDBnGIoL1khdqeO9fOs5k7rsC/v6OjaMWRJHBfc+LG
 lnBw==
X-Gm-Message-State: AOAM530t/n+EUWGG8LgVQ5aKgCUxE0V8E7utnyoXdiTgeNorufUz3nYJ
 m36I6CR/IYi3LEgqaTea8PmlJ1Eg6ddLw4T2bW4=
X-Google-Smtp-Source: ABdhPJzIBFSsXPwSSCGw73KtvrqDIXMGD/+GjvxVG0mSEkFCp7BWwg4nqAvzm+UoIsx0S8/uDt84GiJO2N2vFmJg7HM=
X-Received: by 2002:a05:6602:2ac9:: with SMTP id
 m9mr3461002iov.68.1590159466755; 
 Fri, 22 May 2020 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
In-Reply-To: <20200522113634.GE5801@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 22 May 2020 22:57:10 +0800
Message-ID: <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
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

hi Mark,

Thanks for reviewing.

On Fri, May 22, 2020 at 7:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:
>
> > 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> > null, we must add dummy data sent out before read data.
> > so, add stm32f4_spi_tx_dummy() to handle this situation.
>
> There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
> that the driver can set if it needs to, no need to open code this in the
> driver.

Yes, after check SPI_CONTROLLER_MUST_TX in drivers/spi/spi.c , it's
indeed to meet
this situation,  i will try it and sumbmit a new patch.

thanks.

best regards

Dillon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
