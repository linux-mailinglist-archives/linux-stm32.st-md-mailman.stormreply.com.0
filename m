Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31020947929
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 12:14:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3A3CC7128F;
	Mon,  5 Aug 2024 10:14:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DF08C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 10:14:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso15513983e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 03:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722852871; x=1723457671;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KUTXv/4BMVQwGdjDsbktTy1NxZw7vMmfKE8tNFfq/Qo=;
 b=h9IjcoE+3bgt2FNMiRPCVJOEcaTCXstWBQ00a1jpVD/NDfNulGULnaGgNKQpHmRThN
 OYMRF6hmYDR6tox8852XvQYDjJuJ9ZlzZh454NBeqSuLZyRiQDs/fZG3UHNG96ik7sCo
 6N19HDRM2T7k2Doy6FKfZoJ0095ToOnG61awkzkN1k+Bu/3FZ4ZVPX6zcD07GyiIT4wJ
 lWMcbt+x2TJR5NPozUowEUqSHSmvuPtQb1D/iLxFGZxlRjR193xqEpPdudoCoeyxEWRa
 BDmktSI36ZezuJwOVjDUNSR+zWw333OvWGxbUcD4XwcM8EgvH+ZwDJ9FlrVmyjKRxQFE
 sf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722852871; x=1723457671;
 h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUTXv/4BMVQwGdjDsbktTy1NxZw7vMmfKE8tNFfq/Qo=;
 b=GOMwog/HngROh+lYUmJ9x61mgBbna5rWEIv4FlRaSQEjP755Bc6zYBOuarLuHeySg5
 RgxZvyUElzTywxPgyv9o2FIYf63Fc2Wx1SAcYc+ZA+WPuCxSCEA3UiRFGNl8wFPH3y4Z
 pnPjMAuUh1twM7FR/ez7DbbWj7TTlAyWwWoT+pOZz6sCb2PmJR6DDMGyXMUjZRcd2Z4p
 +X/nTe8dwhGsMEOTJvP3xbmh7R1sUeQRXwsu42o8k+2BHmf3uCEUZkBcIvGrU12Mp4a0
 5Mmxyqo2KfMVE0T1if4of2ZRSts8NnSkXu/k/BVS3xeFUh63wU+HOfXN1B7/8tQHpxfw
 2ndg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVe4ujlZdV8/jYlMMrR/N9z1DWI8P7b07koR+Zo13j8dPZOgluP3MD1ixaoe/dzwnCfd2ti43i8HWW5AK7u9U1hksgn8jGYv28wrQ6h+IxaWco7pmoA5wx
X-Gm-Message-State: AOJu0YxIxaFOLidNWPh+HRBiKW0gl9+rUQT9do/D5sQRE7BXEd+Wt3sN
 K0AGmZRooGmQB4fxYyUeyeE+l6VMrjUW28W6IwoR9Oe0AIGNP08rWOTs79AR9ep8Lj2o8OXgxhR
 N9pMYlXgNopPO8QsXDLwWWvv9mNaQ4EafA6HmeQ==
X-Google-Smtp-Source: AGHT+IFsaV3LKwGCMOQn0O4QgIlm4dsCb2VYE13IUfFYBk5I+7bdruiCzlImY6gmpq5Iem9oqay4dFWaow8fEqE5Kl0=
X-Received: by 2002:a05:6512:3ba9:b0:52e:6d71:e8f1 with SMTP id
 2adb3069b0e04-530bb3b434bmr7719818e87.53.1722852871307; Mon, 05 Aug 2024
 03:14:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Aug 2024 03:14:30 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
MIME-Version: 1.0
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
Date: Mon, 5 Aug 2024 03:14:30 -0700
Message-ID: <CAMRc=Mc7tnjWnWDUjeSfva-XuHp_J25sGXjsa78UjsGG69hwag@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC v3 0/14] net: stmmac: convert stmmac
	"pcs" to phylink
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

On Fri, 2 Aug 2024 12:45:21 +0200, "Russell King (Oracle)"
<linux@armlinux.org.uk> said:
> Hi,
>
> This is version 3 of the series switching stmmac to use phylink PCS
> isntead of going behind phylink's back.
>

Sorry for the noise but I had the line wrapping on. Here's the tag once again:

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> #
sa8775p-ride-r3

(The board is a more recent revision of the one Andrew tested this series on)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
