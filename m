Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85238992876
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB54EC7802E;
	Mon,  7 Oct 2024 09:45:22 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F472C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:38:19 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2068a7c9286so13360345ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727375898; x=1727980698;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5wX3yfYV/mjWNT23soPJLCRyd+y00sgy5yMqJgQHE9o=;
 b=LQ1aC7jiYfDp5Lpd8DIa/GRGeCouKu2w408C7wMm7HsB4G2kjuy9jF5DaTZb0+l8ai
 dF4PLunGBawNG0BO0C/WB/m8CezN+OF1V57mddoIXUF3H42rUS8DYbmwG0CmEp1yfd4Z
 EYmLBhEYmYRqO1dVnQiu7NtOXfviCKFWJ1Cxf+CjezUS/3QP73ONrls1pV4xjZlTIn82
 tzJ2GmdlEx881OYFdlXUoqOxF5qYguM4aHWj/2coTRZ+OgsjTYLPP7p4tzrXnL5c9VrH
 HmhhjL2T2ayhI4a6ixM7nhBNhMBebn/oiM0hHik5CVo5yTeRhJL5mHiLU3oM9fyKgMQZ
 ewWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727375898; x=1727980698;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wX3yfYV/mjWNT23soPJLCRyd+y00sgy5yMqJgQHE9o=;
 b=XpNNLYquVxihTE6YG4+0X7HHnpWsD793HCYxNrYy413X+uIhzAabWlnbOfJq3FhBMj
 tspUcf7tq5vkrg1o+E18z7xMob0OVERT40yKQaPDIX7y3Rw9CX/3Se/G5h8gHB+137xX
 xHLshzEULHvd8QYjIvpKuNrAZzl0GLSQX7S7sXtwqekcORweILhJwrA9sSQynBhIRjC3
 YghIq8rRkFpYukiaDbShVtpFkuFl38qfh7tylVV/3mHfEdyx1YgNyJs0gZL9GAYA8/4X
 YCVCuHmpX/dfYS9vB8u6koQ+8DfBt9y8c6dGAr2Eyc4hJHjXT/w5M+vxAVxxr7iGl1Hp
 Jtrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx0CwuqqgDpjPL1i8bJ6SQFfTRJmTBImzQrJDpWhItwCiuwUYmxb/vWkVPGXaT4KNZ65j4UdIXcLB0fg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLlPBzw8ezIFzNeIJ84Bxa4imdqWOxLB1/2s32qS/AOeeZ37QU
 3eCY+sByvtL+FLmYet/1aEvau7cRAO1fT3qFwQ4pLe6EyLKhtgufRhJrtc7VJQs=
X-Google-Smtp-Source: AGHT+IEKfxNMgvf/9cfNHDk1L1k3ZzFqoQULZZZyf4LyzYdJuned7eyrWwn9WXqk+pz1avbSzydFmg==
X-Received: by 2002:a17:903:24a:b0:205:8407:6321 with SMTP id
 d9443c01a7336-20b36cdcc32mr8316565ad.9.1727375897777; 
 Thu, 26 Sep 2024 11:38:17 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37da2195sm1594075ad.104.2024.09.26.11.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 11:38:17 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:38:15 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZvWqF9DU+6i9O1VB@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:45:20 +0000
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Add the dwmac driver support for
	T-HEAD TH1520 SoC
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

On Thu, Sep 26, 2024 at 08:23:12PM +0200, Andrew Lunn wrote:
> > Regarding rx and tx internal delays, that same section in the manual
> > doesn't specify what unit is represented by the delay_ctrl bit field in
> > GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
> > a max value of 31 seems too small to represent picoseconds. The vendor
> > kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
> > doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
> > rx and tx delay properties so that is what I've now done in this series.
> > Note: the hardware default value of 0 for delay_ctrl works okay for the
> > TH1520 hardware that I have.
> 
> I assume you are talking about RGMII delays here?
> 
> Do you have a board which needs to set these delays? In general, linux
> has the PHY provide the 2ns delay. You only need the MAC to add the
> delays if a PHY is being used which cannot add the needed
> delays. Occasionally you need to fine tune the delay, and the MAC
> delays can then be interesting. But since you have no idea what the
> units are, i would prefer to simply hard code it to 0, unless is it
> really needed.
> 
> 	Andrew

Yes, this is for the RGMII delays. None of the TH1520 boards that I have
seem to need this. The hardware reset value is 0 which seems to work
okay.

I'll remove these custom properties in the next revision.

Thanks,
Drew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
