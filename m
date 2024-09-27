Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E88B992879
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06D0EC78034;
	Mon,  7 Oct 2024 09:45:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEBF1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 01:25:22 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20b0b5cdb57so15502545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 18:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727400321; x=1728005121;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jCmcLe0SmYgeEcqqhkJU0Qezbgs/J4u3/7L98eJgBA8=;
 b=PVSszYrcWTA3QShas3Pe8tdlvJBRkeiL1nQ6v64Ien7HawsjUJR4Zn2hBIicidV/7e
 40vPIbVemj2QLKhQ4KQFE25tcummICNU7wNKJcGZyGVDpv5wgPim9zshqHYKfvhZROPc
 5jf8xwwj2KKEksGD7MdGXZHy1Nw83Pkya1Vyz5JfOEWFVD5evjTTZ6XJPrPwMOj3dbJs
 IOdJl2ARouFPIWOdvJD+aS6DlBhaz7Z1P73IIXCaDbkkR8yFj4PehHebjv+DC31GFDiY
 F8qrwD/TyjamzggS0PgwjjIGk4Ul2xOsfv/vbmn5eSnKiBChwZDfUaLdcYary1DCw61d
 oPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727400321; x=1728005121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCmcLe0SmYgeEcqqhkJU0Qezbgs/J4u3/7L98eJgBA8=;
 b=rRkifiqiqc0iJR01GYv5cNcixflHVxXltN/xvK5bn4PTxSalayPJNDQErhRUw7GpTN
 THOnweNj9/LAUjAhtYWkpZRAz1jT1SdNtx2kEAIrM8rfi9DE+cGpY9nuDRpmqHUqthZI
 ltHS3zM/1zSv/ka6PwI0Ge3+83WPEc+bJTrRAufRMJceZKZTpFv0NJJf3IvB3AnroYGq
 ABRq+7D/edR8C4ofNahj3TkJ1ckv1L2OlPdIvLosk1cSkgGlxEBzU8QpPCHM/Vywl/1t
 BC6Vkx76pD2rjLhSVx6FMelGpaGTIgNJ5wMMIFcb3fONEbkT952ADz16hdF8Kdx7aE95
 dZ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj2Z9Qndo7goE/NFSLr0LxCYf455kZnoWfzpENiM7Ml7+KLeE2BGDXumPYJ2WS/DxJvqdPdE2LWVmt7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkHxuerwItQSbxyPFOvdDKNshG1UeGcO+PchOhMFwbz7S9suVV
 4NoWRm21XQurV7Fn1OMrYlB5wl1GeQs4Xw+Zy3z3ZC9VWTQCCMavyDJ4RBJziQQ=
X-Google-Smtp-Source: AGHT+IFNIOZRxH8HvJGMbMu1i8sPGpIXAzt+jVyHPQIeV5WglmLr8F5WYqM/TslsbY+ZUY/LOi5w8A==
X-Received: by 2002:a17:903:2a84:b0:205:8a8b:bd2a with SMTP id
 d9443c01a7336-20b19cadb22mr63571405ad.22.1727400321286; 
 Thu, 26 Sep 2024 18:25:21 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e357e8sm4132645ad.187.2024.09.26.18.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 18:25:20 -0700 (PDT)
Date: Thu, 26 Sep 2024 18:25:18 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZvYJfrPx75FA1IFC@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
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

On Thu, Sep 26, 2024 at 09:30:32PM +0200, Andrew Lunn wrote:
> On Thu, Sep 26, 2024 at 12:13:06PM -0700, Drew Fustini wrote:
> > On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > > > +&mdio0 {
> > > > +	phy0: ethernet-phy@1 {
> > > > +		reg = <1>;
> > > > +	};
> > > > +
> > > > +	phy1: ethernet-phy@2 {
> > > > +		reg = <2>;
> > > > +	};
> > > > +};
> > > 
> > > Two PHYs on one bus...
> > 
> > Thanks for pointing this out. I will move phy1 to mdio1.
> 
> ???
> 
> Are you saying the two PHYs are not on the same bus?

Sorry, this is my first time working on an Ethernet driver and I
misunderstood.

Sipeed only shares the schematic of the baseboard for the LPi4a [1].
There are pages for GMAC Ethernet0 and GMAC Ethernet1. Each shows 4 MDIO
differential pairs going into a SG4301G transformer.

I believe that RTL8211F-CG phy chips are on the LM4A SoM board which
contains the TH1520 SoC. Unfortunately, Sipeed does not provide a
schematic of the SoM so its hard for me to inspect how the phy chips are
wired up.

Vendor kernel [2] that Sipeed uses has:

	mdio0 {
		#address-cells = <1>;
		#size-cells = <0>;
		compatible = "snps,dwmac-mdio";

		phy_88E1111_0: ethernet-phy@0 {
			reg = <0x1>;
		};

		phy_88E1111_1: ethernet-phy@1 {
			reg = <0x2>;
		};
	};

so I think that does mean they are on the same MDIO bus.

> 
> > > > +		gmac1: ethernet@ffe7060000 {
> > > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > > +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> > > > +			reg-names = "dwmac", "apb";
> > > > +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > > > +			clock-names = "stmmaceth", "pclk";
> > > > +			snps,pbl = <32>;
> > > > +			snps,fixed-burst;
> > > > +			snps,multicast-filter-bins = <64>;
> > > > +			snps,perfect-filter-entries = <32>;
> > > > +			snps,axi-config = <&stmmac_axi_config>;
> > > > +			status = "disabled";
> > > > +
> > > > +			mdio1: mdio {
> > > > +				compatible = "snps,dwmac-mdio";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +			};
> > > > +		};
> > > > +
> > > > +		gmac0: ethernet@ffe7070000 {
> > > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > > +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> > > > +			reg-names = "dwmac", "apb";
> > > > +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > > 
> > > And the MACs are listed in opposite order. Does gmac1 probe first,
> > > find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
> > > probes successfully, and then sometime later gmac1 then reprobes?
> > > 
> > > I know it is normal to list nodes in address order, but you might be
> > > able to avoid the EPROBE_DEFER if you reverse the order.
> > 
> > The probe order seems to always be the ethernet@ffe7060000 (gmac1) first
> > and then ethernet@ffe7070000 (gmac0). I do not see any probe deferral
> > in the boot log [1].
> 
> > [1] https://gist.github.com/pdp7/02a44b024bdb6be5fe61ac21303ab29a
> 
> So two PHYs are found, so they must be on the same bus.
> 
> It could well be that this MAC driver does not connect to the PHY
> until the interface is opened. That is a good 30 seconds after the
> driver probes in this log message. So there has been plenty of time
> for the PHYs to be found.
> 
> What would be interesting is if you used NFS root. Then the interface
> would be opened much faster, and you might see an EPROBE_DEFER. But
> i'm just speculating. If it works for you, there is no need to do
> more.
> 
>       Andrew

I tried to setup an nfs server with a rootfs on my local network. I can
mount it okay from my laptop so I think it is working okay. However, it
does not seem to work on the lpi4a [3]. It appears the rgmii-id
validation fails and the dwmac driver can not open the phy:

 thead-dwmac ffe7060000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
 thead-dwmac ffe7060000.ethernet eth0: validation of rgmii-id with support \
             00,00000000,00000000,00006280 and advertisementa \
	     00,00000000,00000000,00006280 failed: -EINVAL
 thead-dwmac ffe7060000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -22)

I suppose that this is what you were talking about that NFS will cause
the interface to be opened much faster.

Thanks,
Drew

[1] https://dl.sipeed.com/shareURL/LICHEE/licheepi4a/02_Schematic
[2] https://github.com/revyos/thead-kernel/blob/lpi4a/arch/riscv/boot/dts/thead/th1520-b-product.dts#L758
[3] https://gist.github.com/pdp7/458eb93509548383beabeb21c8ffc43a
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
