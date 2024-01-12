Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3A82C6EE
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 23:00:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22407C6DD66;
	Fri, 12 Jan 2024 22:00:10 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA9A8C6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 22:00:08 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dbedb1ee3e4so6152011276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 14:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1705096807; x=1705701607;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0hhVOcFdh1HTKD3eGnDrrPjtYobkiYS23JtQg/2eggU=;
 b=NerCq7E0LR2vCz6utk0Q/yeWUWkCbKgVKcmwgv9jhnm2CbtqoDTC52/4TY+xQhOk0S
 p5+B279oObvC2DlbsqrljFUny81bGLeVP10bBcgCvW8fFLAqmulY6PsaSnEHmHHNivA5
 1EHYrpw4HQzFUPLjiD/Y6+CYgQRv1+oC8wJEYnvXnbOrWtRIqX6f9MdRy3/vTh4f8PsY
 7C70ecLTHyfgUY6VYTHm4A6HgxpTsQebXqvHEtcvrQPs0Q9Ojc0bE4B8/hda6UPz8HBA
 GQJw9E2CC8mr0SE2LQXxbd36XocofKYciTJvuP0P173YadBeS9B//r5I9Vi17aGJn+Mq
 fSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705096807; x=1705701607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hhVOcFdh1HTKD3eGnDrrPjtYobkiYS23JtQg/2eggU=;
 b=RJucEM1aHn2ETMwo8AJH1tg93xHmx2VBdpj1YQ7L9PsT/5MbsujEEstqjHCwhbyvrs
 Cgc2ABcBWzjlGhgkMUMRqqERDysIuir7xkZImSm4QrW0i6H6Ir1ApCwLg/1OIdvo6wOe
 iprvfKdJvzfRVRLAZSLj4nWi7L+yctD7Pd/BIw10qILT1EnSRbIiNJw/WkyOJzWvTwXr
 94kNVQku8FZV/AixQsShqrUWErpoZGvSX6aeFN99qBsVptKavR3OZrkqpbEpTuWIqE9x
 LG7Hmvm+MfzwpSxj9HYX7qulleaxAxf40P4yhibFQ2Z7fv3JhInZmggMh/IjnJWvYP5Q
 Ry5Q==
X-Gm-Message-State: AOJu0YxUhhmsp+cdI2OgyxWlgGZo3dxLJ6sV2wFWGW3ECvb12j9TQ53J
 e7hzxbr09e80EtvcBLZWwWVrIJcKXkOdrQ==
X-Google-Smtp-Source: AGHT+IHbrYRi12cOjI23zBiUfiGMMjgGZ1WdMjYT+UYdd79zzlNQgTtNbGfGpkVNdrhDuqR5cHrh/g==
X-Received: by 2002:a05:6902:2182:b0:dbd:5be1:1768 with SMTP id
 dl2-20020a056902218200b00dbd5be11768mr1339723ybb.73.1705096807499; 
 Fri, 12 Jan 2024 14:00:07 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.90])
 by smtp.gmail.com with ESMTPSA id
 en12-20020a05622a540c00b00427e36e21d9sm1688262qtb.64.2024.01.12.14.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 14:00:06 -0800 (PST)
Date: Fri, 12 Jan 2024 17:00:04 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <ZaG2ZDCLP34jcI6Y@dell-precision-5540>
References: <20231002180854.1603452-1-ben.wolsieffer@hefring.com>
 <20231002180854.1603452-2-ben.wolsieffer@hefring.com>
 <883a61872f94c972cc410da84eaf7b97.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <883a61872f94c972cc410da84eaf7b97.sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] clk: stm32: initialize syscon after
 clocks are registered
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

On Sun, Dec 17, 2023 at 03:05:01PM -0800, Stephen Boyd wrote:
> Quoting Ben Wolsieffer (2023-10-02 11:08:53)
> > The stm32-power-config syscon (PWR peripheral) is used in this driver
> > and the STM32 RTC driver to enable write access to backup domain
> > registers. The syscon's clock has a gate controlled by this clock
> > driver, but this clock is currently not registered in the device tree.
> > This only happens to work currently because all relevant clock setup and
> > RTC initialization happens before clk_disabled_unused(). After this
> > point, all syscon register writes are ignored.
> 
> Seems like we should mark those clks as CLK_IGNORE_UNUSED and add a
> comment to that fact.

That seems like a worse solution than specifying the clock dependency in
the device tree.

> 
> > 
> > If we simply add the syscon clock in the device tree, we end up with a
> > circular dependency because the clock has not been registered at the
> > point this driver requests the syscon.
> > 
> > This patch avoids this circular dependency by moving the syscon lookup
> > after the clocks are registered. This does appear to create a possible
> > race condition where someone could attempt to perform an operation on a
> > backup domain clock before the syscon has been initialized. This would
> > result in the operation having no effect because backup domain writes
> > could not be enabled. I'm not sure if this is a problem or if there is
> > a way to avoid it.
> 
> There's no comment in the code that says the regmap must be set there
> instead of earlier. What's to stop someone from tripping over this
> problem later? At the least, please add a comment.

Yeah, I'll fix that. Do you have any thoughts on the race condition I
described? Should I add some kind of locking to block
enable/disable_power_domain_write_protection() until stm32f4_rcc_init()
attempts to initialize the syscon?

Thank you, Ben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
