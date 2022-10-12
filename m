Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9888C5FC6C8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 15:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FCC3C640F9;
	Wed, 12 Oct 2022 13:54:52 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93C1CC640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 13:54:51 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso2134309pjk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
 b=UozGTu6YyIYkQQoEJ9mpP/ZP9EXBHkczxk9/ST0nwoYD5CXIifS1ksxnJ1z/XlD8Iv
 DnXdQDc3QD5BBRt/elc/g3MpiMLgBMvz47ICmyWRQUwskodG72pwSD0FvOfnFwxR4gNT
 0Nv0c1ZEd9a//beEgotrvzkxpjlIn11dOn3z2tb/KyektIxRp3AMw9k8NLnKlAlJMfAZ
 ZW00APC6mm2Rgc0I9F6MtW+FIkz4pX/PUfBY7jV2tV/BJmcb7sxvPImZbSg5MEvkpS1A
 VQqSmx00wjuq8wBY7o0koQO6OL1C+JRHOCj4nWqmVRt4CML82YQgP9dT0rzT4hrO952e
 5MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
 b=5t40NLuia886Rzi2/KlNTfloS7pyUyOsZnO4QZpymhvoiN26bhFt76t1XZX8dCS4tf
 MPK4j/SR16efI/qR6tBSA4oafq82Tei94iBmRFBdjWqLlSrEvtD/13nTabL7bPpRcXkQ
 8P79yOA/XdiTi3V6Yw2SXvjvgutacO9ZjZznCxE6LPLuzLdluaj6IlAockOWDIrrsWNB
 JtQQyKEEEZwBnajcpIOPmhMOqsA8HG4/PN9/VWG9uWGH/Q2LMF84leUXfhBCG+bvaeaQ
 2v5w4jp062xl5+TLEeXFP9RhV1J6LrrelYcUB6NDhCM8ZjryzDNBCZNc7gFVYE9DtiY8
 rFPQ==
X-Gm-Message-State: ACrzQf3hFY+IVDtL8NF5BdcVDftDby9QjyAGuzjcgaVF9pev3ZVtCn64
 MDuhxdTKwZ4KR8kBPF8rFF8=
X-Google-Smtp-Source: AMsMyM4GsOvqLbKi8bnipwZei9bul2eCxZ/xzZEAA7xagdE0qfFC/6Wvyu2i9hoIPRYsb/0vz6gCvA==
X-Received: by 2002:a17:90a:f2c3:b0:20b:b75f:2f9e with SMTP id
 gt3-20020a17090af2c300b0020bb75f2f9emr5408380pjb.43.1665582890145; 
 Wed, 12 Oct 2022 06:54:50 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
 by smtp.gmail.com with ESMTPSA id
 s20-20020aa78bd4000000b00562f6df42f1sm8959924pfd.152.2022.10.12.06.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 06:54:49 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:54:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <Y0bHH06cbngWk4mH@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol> <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, patches@opensource.cirrus.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/36] gpiolib: cdev: Add missed
	header(s)
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

On Wed, Oct 12, 2022 at 04:30:05PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > -#include <linux/gpio.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio.h>
> 
> > But moving the gpio subsystem header after the gpio/driver is not
> > alphabetical ('.' precedes '/') and it read better and made more sense
> > to me the way it was.
> 
> Okay, I will move it back.
> 
> ...
> 
> > > +#include <linux/seq_file.h>
> > 
> > I wasn't aware that we use anything from seq_file.
> > What am I missing?
> 
> 
> Eventually I can answer to your question: the commit 0ae3109a8391
> ("gpiolib: cdev: add fdinfo output for line request file descriptors")
> is what you are missing.
> 
> That said, we need this patch.
> 

Ah, yes - totally forgot that one is in flight.
That makes sense then.

With the gpio headers retaining their original order:

Rewiewed-by: Kent Gibson <warthog618@gmail.com>

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
