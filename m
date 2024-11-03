Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419E9BBB8E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F11F2C7A854;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4FA2C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 22:09:41 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-71e4e481692so3462662b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Nov 2024 14:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730671780; x=1731276580;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/rHJELaF04JBRi0aLmrWuxoS3tWtyUhwmRJRrDNiPz8=;
 b=GdpmBpzkdYSZ+IiNWJyj58kE2rnFj0sOlgK7DXRA65cRvHYPhmfcvPgS+70eX+7jRr
 zoZDz2HWTv+dZykJi8zJklTzE6dy06dE61NPWF+FFtBkpIaC0cKXtu3kAu7LwyMTEwLj
 D+e1kI2tqzrNCUQ4tsWx80JbjcSXYAmJt7nnELnO92qsbYPTOx1aoH18gryS+yMUAuNN
 VaT2CNSfmTu9wMXLi86dk0l/vk4aNHlhXuDV2FoPYVeR6e08E8lNcVCnoAYZxotsyLLI
 CwBPEGgOJZKjILN6gh6nyE2qYtJdBvj4KCiPI2erHbAGLMSD9kwFi2aNIqiDMXx4NCGT
 AN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730671780; x=1731276580;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rHJELaF04JBRi0aLmrWuxoS3tWtyUhwmRJRrDNiPz8=;
 b=EiiprZxzvTWFtcD+c6GOZrpsWt1ENUHQ/SfkR7DnsfhnNLzX7dAGlt5STlscn45TPi
 18XPSWqCyC0Ho+PfMxBpKHXWJJews506NkZAGG6nYNnD4feDKdbfv7aoQ0SSIJ3Y8x/E
 FgiHqPb24ojoBk2rGL1Mihk16DLrNp6uynvHQoI7L+lVw3W+lWK6liTcbWYGSrl1olqL
 93ZwCR3DxOtKOAAtCYvIc/6/JNNCzJK+z2smG+eVyXJS7/pxyvHWldG/QEl3IkcOH9ro
 /JRgtzbGguy41xkpwxnps3v7fGNwhE8iR264GKrgnkRb2uqiSx966f6jcC+wIUOpcDp+
 Z7fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlLJWprZ6t8CBMPSm9oRC56H8xvuHD+Lp0wjNknSiEiosadswhyLFOFQoX4aSl1TA7/proR8J31sut/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBWSo5gRRpsHNJvwh3p88QhTrI3rNdFxm7o7MmvVgpHzoqaWrb
 tAzuvpWx0mCCVtcLNDnP3rcJtE+GpReUi9OFy9Wo+PTd1u/mTOQl
X-Google-Smtp-Source: AGHT+IFKyJJZHHJG1xrvYibWpBIs/FS0N3kdjWrsxFMjWgEPFe5BpYTq3ei0lG/0AXdt3oOlAP3xDg==
X-Received: by 2002:a05:6a20:e605:b0:1d9:dfd:93c0 with SMTP id
 adf61e73a8af0-1dba556fdc2mr13977660637.49.1730671780063; 
 Sun, 03 Nov 2024 14:09:40 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc1ba033sm6074536b3a.34.2024.11.03.14.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 14:09:38 -0800 (PST)
Date: Sun, 3 Nov 2024 14:09:37 -0800
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Zyf0oVGk6FiVrPsB@x1>
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
 <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/2] Add the dwmac driver
 support for T-HEAD TH1520 SoC
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

On Sun, Nov 03, 2024 at 07:12:24PM +0100, Andrew Lunn wrote:
> On Sun, Nov 03, 2024 at 08:57:58AM -0800, Drew Fustini wrote:
> > This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> > RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> > 
> > The gigabit ethernet on these boards does need pinctrl support to mux
> > the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> > related dts patches are in linux-next. However, they are not yet in
> > net-next/main.
> > 
> > Therefore, I am dropping the dts patch for v5 as it will not build on
> > net-next/main due to the lack of the padctrl0_apsys pin controller node
> > in next-next/main version th1520.dtsi.
> 
> You should send the .dts patch to the Maintainer responsible for
> merging all the RISC-V DT patches, maybe via a sub Maintainer. All the
> different parts will then meet up in linux-next.
> 
> 	Andrew

I am the maintainer for arch/riscv/boot/dts/thead. I'm planning to apply
the dts patch to my for-next branch once this series with the binding
and driver are applied to net-next.

Thanks,
Drew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
