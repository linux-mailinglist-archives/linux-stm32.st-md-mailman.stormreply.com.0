Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F7992878
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE23C78032;
	Mon,  7 Oct 2024 09:45:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6A74C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 19:13:09 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20b0b2528d8so14483565ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727377988; x=1727982788;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y4WZTo6nI26Bhfdln9Gf7wFMawvUlUInYNk7SP122zU=;
 b=TUGyTG76odwYsxkibkjp7/LWh4DXjkQePAa6SqcXKIZsok8rQPKH+aUaM1gfB/uW6x
 V0OVJOkGpPcyO/4kmGEfoV6+GSN7hcPQzsexRiUgTsw+gMrhc7f0RvAA+gPkAcYGf/6R
 t7szQYfgzM1xDGOBDf5CLIrnML+WYFQ/ySzOUgqwdifKNCIxOAGO9l+bFHQGpxw7gBKP
 LxCxhXBTyIgzaEA8WVuGlvi0qcBdXchY0kA63KhF0bsRxuTeowdHYDf0aqyPX7oPFDRb
 0ZIhrZ+ala05c1j7tcU4oBTK7AeaY792iwD6qu3cqWRJBRf3HmygljhfAURQ9mQIQWh4
 jlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727377988; x=1727982788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4WZTo6nI26Bhfdln9Gf7wFMawvUlUInYNk7SP122zU=;
 b=VvP7AG9GdRddFagiwr7F8SzUFJhcT/48vNa6bOjd1upaKBzXb6vNSyuCu++YOzjJnA
 oaw6rh49+fpUy1P7BHjkprXCCi2YLXrzoGBDKCFykVgwprlMpmd9JMJvAL14HeXAF/MK
 Fatt/izl2cL/7Sc/AwJrjNsBHVAvxCyKHMJqh1lfitJwqCTsBy7IleJA1+BejeY6XV9D
 TznaskQTjlRhB47bw3HjX879TiK2A9RE38LdFVfqc5DDEKUkI5bPB7YOrk4pLNP8AQBc
 wF6VwWK1JZorsvshFVw8smH14SWxuSAkzBUJLlKsM27a0yYk9DA4PBgmKf0/hNh/LBhE
 MXaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJnjJM5938y487473ziUjr1c+ITCcO5bDHZN09nEsLg3AU7a9QSsyzKyOanrS7PfIrhIzSt8GaApDvUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEU5q0J7zqHgmQQrRUZv7Bn0DkkwHM4rAdAjysCPAHhYrrTE+b
 o/i/jTbd2a6R/JISDHeMvdtoaCz/iwBEg/TBDTpBxCrmjcnni6B6LqpIytqHC9E=
X-Google-Smtp-Source: AGHT+IEMklrWdPx+X7c21DcecTVJ7lxpddUaIsHWWZy+aOWGUu3YS5G/It5NPJNOcBI2+VtqDMCCmw==
X-Received: by 2002:a17:903:41ca:b0:206:9ab3:2ebc with SMTP id
 d9443c01a7336-20b37b7c063mr8647165ad.47.1727377988323; 
 Thu, 26 Sep 2024 12:13:08 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e543dasm1740175ad.258.2024.09.26.12.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 12:13:08 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:13:06 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZvWyQo+2mwsC1HS6@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
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
Subject: Re: [Linux-stm32] [PATCH v2 3/3] riscv: dts: thead: Add TH1520
	ethernet nodes
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

On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > +&mdio0 {
> > +	phy0: ethernet-phy@1 {
> > +		reg = <1>;
> > +	};
> > +
> > +	phy1: ethernet-phy@2 {
> > +		reg = <2>;
> > +	};
> > +};
> 
> Two PHYs on one bus...

Thanks for pointing this out. I will move phy1 to mdio1.

> 
> > +		gmac1: ethernet@ffe7060000 {
> > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> > +			reg-names = "dwmac", "apb";
> > +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > +			clock-names = "stmmaceth", "pclk";
> > +			snps,pbl = <32>;
> > +			snps,fixed-burst;
> > +			snps,multicast-filter-bins = <64>;
> > +			snps,perfect-filter-entries = <32>;
> > +			snps,axi-config = <&stmmac_axi_config>;
> > +			status = "disabled";
> > +
> > +			mdio1: mdio {
> > +				compatible = "snps,dwmac-mdio";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +		};
> > +
> > +		gmac0: ethernet@ffe7070000 {
> > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> > +			reg-names = "dwmac", "apb";
> > +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> 
> And the MACs are listed in opposite order. Does gmac1 probe first,
> find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
> probes successfully, and then sometime later gmac1 then reprobes?
> 
> I know it is normal to list nodes in address order, but you might be
> able to avoid the EPROBE_DEFER if you reverse the order.

The probe order seems to always be the ethernet@ffe7060000 (gmac1) first
and then ethernet@ffe7070000 (gmac0). I do not see any probe deferral
in the boot log [1].

Thanks,
Drew

[1] https://gist.github.com/pdp7/02a44b024bdb6be5fe61ac21303ab29a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
