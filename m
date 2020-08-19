Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA18A24A67D
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Aug 2020 21:02:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77033C3FAD7;
	Wed, 19 Aug 2020 19:02:37 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 517D5C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 19:02:36 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i26so19001329edv.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Aug 2020 12:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KGGY3D3pTn+rblImU0N+zXuHhPpD8sOvtylyTgiCNHk=;
 b=tkJC9y2HJoapWuYEbGxWKi/Ektbj/A4hzo1IDewLFI2DW/aHNgZzJ4K96BBNp1L2H6
 Tmpo4f7ZmmPg4sTjHl6AtS64I0uTpjNMAPB8JpOy2++JtSTtOZ50cyLhngSjj2jQpkrc
 io0QhDtLwWKbXAim+C4sUe9EL0WGtKsvu+jJMtkw3nWZgWQI1eY9O345JRl3SKW6JPa3
 Uj9LJhmLSEpShuoj1/Paq713P5Xy3LupjUfQAG895+8zJFcEG0w0Z83afCF/3OeXN72w
 0nVIfflNNruBwo/cCjzR9e3J1/q/8/0TEGaEJNiWFwjhcSUjKKfqzDvsc7U5WcHAT/hx
 6nXA==
X-Gm-Message-State: AOAM531kVcNgHAMiamW6hmRwmtXkp4kxE1Nu9E9D1jf5nwu4qP7KQfQP
 QYbw8HFS9nT8miINAeTWOuY=
X-Google-Smtp-Source: ABdhPJykIMcrjaRlsdKqIfVe6NXArnUjcmqPPS3YQOJSQ7mlY5sLLKuYBtT6RLqjt3fPz4B0GXb52Q==
X-Received: by 2002:a05:6402:1504:: with SMTP id
 f4mr26630154edw.163.1597863755505; 
 Wed, 19 Aug 2020 12:02:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id t18sm19193122ejf.38.2020.08.19.12.02.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 12:02:34 -0700 (PDT)
Date: Wed, 19 Aug 2020 21:02:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200819190232.GA18183@kozik-lap>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-1-krzk@kernel.org>
 <159783932455.55025.7979458249415199743.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159783932455.55025.7979458249415199743.b4-ty@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/41] ARM: s3c: Remove unneeded
 machine header includes
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

On Wed, Aug 19, 2020 at 01:15:29PM +0100, Mark Brown wrote:
> On Thu, 6 Aug 2020 20:20:18 +0200, Krzysztof Kozlowski wrote:
> > Not all units use the contents of mach/hardware.h and
> > mach/dma.h.  Remove these includes when not needed.
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/5] ASoC: samsung: h1940: turn into platform driver
>       commit: 2c5c4fdc710c5d3beff78ac5605c5732ebfa8ae5
> [2/5] ASoC: samsung: neo1973: turn into platform driver
>       commit: a65e8a320846b8c69f53a758dc3662e4b42e6a48
> [3/5] ASoC: samsung: rx1950: turn into platform driver
>       commit: a0f3315a2558e22e75873e1184d0c213c2f8315f
> [4/5] ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS
>       commit: 2f1525848844c996990aafd3104bddf0f0cb3a28
> [5/5] ARM: s3c24xx: move iis pinctrl config into boards
>       (no commit info)

Thanks Mark.  Could you provide me with a tag/branch with these to pull
into samsung-soc?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
