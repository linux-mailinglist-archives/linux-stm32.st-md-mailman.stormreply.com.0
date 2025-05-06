Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4554AAD0EA
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 00:24:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C5B6C78F8B;
	Tue,  6 May 2025 22:24:55 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB9CBC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 22:24:53 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6f535b11824so12513956d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746570293; x=1747175093;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
 b=AOgqRBhPTF3A3XinI2luqJQFrIqeCsGWivRw2buOo2cIBrs0HCCO269C2BrWdE2/Sv
 1XUFC8yesYoBwOmXYKEy9wzh9RoOHrQB3yk2JLuB5B1cQnEGmrcbqzjg4QDYAHES8TjY
 pXUFazrMF0dDJKnnmCzzSIb/eIQrjrzbilAVdnRrcaq/ERje7094z7zXgSOBOwJnvRE/
 HtDqjWtPczhXNTyRo8Q0YR3eQ0ufBnlJ0yaNBPPGxPvokrufAMNsPT7ruH3pS5E5E+xp
 nNQbV3q/ZzVJDfH6Un/nKzQ5eHpHondc4v273KWL/KNOVWamlCTxElp8RvXKpmn9Tnn1
 OYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746570293; x=1747175093;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6PuN11kmLGkE9CdpXY3LsP08NiwndWR9cFcKMuKbeQ=;
 b=Xfl/XKk0Rxcp1y9lFZ4AYDiBZ07MsporfpeEFg1mcp1S5HDmqI8aY96ZAxtQNIHEQ0
 mZWK1cdmMauOSpvmzZ8elNC6WJtc5fsHTdt1vrmmXZ52QJQoAGJZ4rMjyGiA8c9RYAzk
 WZK3pNgFM4iCNxVaBZrydk7x/ui1uplpfkOdYGbg0HoV62P8anZlPcBgF8+jUb0420go
 0uZ9qrvG+K0M5al4hJC0QZEy1vtHfffmk+B9aY8rQpGfKf1RndIh+hMpYhAUF+hA9OhR
 sVQoQHTMic3Ix29mGcQgpsnhYVx0JtJViL/JiD9A+raNXh6qQFdPbfiw7IFVTit6uw+t
 wMFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyz+jEafsbkEknIY5L2UE+rR7zPXZSNanIKn8mIifFb8wJQ/GcyiCBF+HT1Gvin8Ax4T4tzGHkPVv04w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6cgUyXBMRihBzREop+YL27DW+Ac3JqR0ygR3qIxAQTU5ZftoU
 RllazPAER1KwFVwlUoJ2nGxMHA5hbhO6BlHF8RkVVeU4CufRzakF
X-Gm-Gg: ASbGncsCQd3Pq+lQTmD1n9qzb1LYvdqRnMrjflkrvRpdOhhlmduws8UGYGUekqt2Ars
 gzwMZbv8jBoL1Y+Dx/Z65v9yHYmYJEAWbRwTgbrkyN6RGH11YJafsgdk1fqqANnm3Y2x64Ix14W
 5W4kSup0Rvpy4sQpnynKk/vCCQIfTb6UqVuUJBYhD2zvGuphBGqwbDUcxDPfcuW/asaKJh3bkWv
 apaEGXdpA8YiTczUQ/1BQL61HqH9cPE36CvUir9BeiFzTivhLEWlUcMNGGca09Thc4cpIu1eFKG
 8knequh1MHCxLWkK
X-Google-Smtp-Source: AGHT+IE/HcOkUaQ1OjeZ76XLCIoAMcLQ4gb8y3bZBjcdCFJTsGZuHVr3Qr8wRx0H5mUFdFynUfAxQQ==
X-Received: by 2002:ad4:5b87:0:b0:6f5:3e46:63f9 with SMTP id
 6a1803df08f44-6f5429afe88mr16025426d6.7.1746570292605; 
 Tue, 06 May 2025 15:24:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f5427b07e6sm3118126d6.106.2025.05.06.15.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 15:24:52 -0700 (PDT)
Date: Wed, 7 May 2025 06:24:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
Cc: Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] riscv: sophgo: Add ethernet
 support for SG2042
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

On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > tx clock. Add device id for it.
> > 
> > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > does not expose this device.
> 
> Do you have a patch for this EVB board? Ideally there should be a user
> added at the same time as support for a device.
> 
> 	Andrew

Yes, I have one for this device. And Han Gao told me that he will send
the board patch for the evb board. So I only send the driver.
And the fragment for the evb board is likes below, I think it is kind
of trivial:

&gmac0 {
	phy-handle = <&phy0>;
	phy-mode = "rgmii-txid";
	status = "okay";

	mdio {
		phy0: phy@0 {
			compatible = "ethernet-phy-ieee802.3-c22";
			reg = <0>;
			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
			reset-assert-us = <100000>;
			reset-deassert-us = <100000>;
		};
	};
};
 
Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
