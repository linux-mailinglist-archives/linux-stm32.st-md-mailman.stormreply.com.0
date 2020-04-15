Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933591A9295
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 07:42:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D8EC36B0C;
	Wed, 15 Apr 2020 05:42:01 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E561AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 05:41:58 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id ca21so3073017edb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 22:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GnTx0izeYvyDZyS+vHAcMDpC99flKBZNWxhXwvZUWs=;
 b=KEPo+LrBD6JG5OiN7xAcYh6hPrukV/BNgbEL1a+2r8MVgpBTxIq8FA/gI9H8JJ9LoH
 6Mq0NXEQ3cI8z/rMlKZYfADvYLy2FMPRDl+fonVJjdddjwQoEFixp7aBhE1I9QKEFlXz
 P5Hzays8U8fQUqV1D/ZyudC9NfJ47fX5EpH8PKGquS0bZpkXqgho5uSc1lTDoYZW6pQd
 mUaVTBqcs36WfUBXh8BF5mkbgvJlX4Zah4UF613StqiWTolx2YV/YC5F3OU36R2uAOh+
 EWKo/fTu8fNZ0kigT8DWrhWUC320Xe7lofe/+pVwQkYCIG6cnrio8bbF9V2O5cDkixv9
 SI/w==
X-Gm-Message-State: AGi0PuZ0U9zttYQDn42I2dj2wi+ulipQ/UsU6+ych4noAdjBk4Z7tM3Z
 Z2+UysR3H9BFwB+z/X7JdbuZowG7ibI=
X-Google-Smtp-Source: APiQypJCAqlGf4RLjz8/NFuDOVk4Vr4I8r3n45tX+QwV8I16+2mZ/4qCt5kSchdyKvTnJZnsz07gqg==
X-Received: by 2002:a17:906:9494:: with SMTP id
 t20mr3309312ejx.51.1586929317723; 
 Tue, 14 Apr 2020 22:41:57 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id qo12sm457720ejb.14.2020.04.14.22.41.57
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 22:41:57 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id f13so17531260wrm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 22:41:57 -0700 (PDT)
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr19082552wrw.104.1586929316945; 
 Tue, 14 Apr 2020 22:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414223952.5886-1-f.fainelli@gmail.com>
In-Reply-To: <20200414223952.5886-1-f.fainelli@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 15 Apr 2020 13:41:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65XwJ30_g1qf5a=1LR63BZ=DEq0qG9GQae0YuZfH1C79g@mail.gmail.com>
Message-ID: <CAGb2v65XwJ30_g1qf5a=1LR63BZ=DEq0qG9GQae0YuZfH1C79g@mail.gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, olteanv@gmail.com,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-sunxi: Provide TX
	and RX fifo sizes
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

On Wed, Apr 15, 2020 at 6:40 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> After commit bfcb813203e619a8960a819bf533ad2a108d8105 ("net: dsa:
> configure the MTU for switch ports") my Lamobo R1 platform which uses
> an allwinner,sun7i-a20-gmac compatible Ethernet MAC started to fail
> by rejecting a MTU of 1536. The reason for that is that the DMA
> capabilities are not readable on this version of the IP, and there
> is also no 'tx-fifo-depth' property being provided in Device Tree. The
> property is documented as optional, and is not provided.
>
> Chen-Yu indicated that the FIFO sizes are 4KB for TX and 16KB for RX, so
> provide these values through platform data as an immediate fix until
> various Device Tree sources get updated accordingly.
>
> Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
> Suggested-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
