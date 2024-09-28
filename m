Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DB99287C
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DBC7C78038;
	Mon,  7 Oct 2024 09:45:23 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52F7C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Sep 2024 21:05:16 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-71b070ff24dso2834765b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Sep 2024 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727557515; x=1728162315;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9i+1khY6cZCPGetGL9p/QuDc4cg82jy9GCe3mjkCw+I=;
 b=ONlBzrSky33mb6McEP7rYI0f0fgCvQSlsq4dYLRE2J2dFZYJuM7gX0+4Fb6PV1WAEz
 PqDHRiO3uy8f/cKbTg/TVQyGkU3VMbY5Jsw9iuEHsyxd+LlhsGCV/F4fMUYp4nv2Hw3w
 /r3Xc73jLVnxPsin2CEyMol7QugIP3HCvxM247SOW/YfLNGD/09ajUvB4J+r0IHzqPhy
 RW/nJTdh3kUZTJsCvPfm2dprU0ffFlrYf4R8yjpQsLDPIFlyzl6dfMgdg3Pv4PeBwqOY
 HagwYYAf7zaMBjHxnslsc7izN5xy83Wa955XGKle3EkApqM9c7IngkyRNMUpKdMYRZR1
 w7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727557515; x=1728162315;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i+1khY6cZCPGetGL9p/QuDc4cg82jy9GCe3mjkCw+I=;
 b=WQbH/6JG6Drf6sJXreplRGkIU1at6Go/E155Z0ThxfhjRIaBBA+MCDiKsSvDT+VVXI
 aG2onqraPvNLy/Ijy7py3/75rhTkcjjE5bUd48E8YqrRuQCJYHbGKv7rTrfmlv+sp+Vg
 GkCfCY73iM+LZXK5hqut74MDZfd61JAKmsLoFU/SjAOe7wb0SNMVIfszgI/8O1MbtMzs
 xuzz846RNsk1oUSecGWq45RmC48Mz5Y3FL5DliE1cF7uvA7UBzDawXnraIqkJB4T+fbc
 /U9oeXcSl4DrytnA6VuQQx3X6xZr0kQumZI3ILKbPeIoEFUEK2vrrUB8e8f27Sw0jjmo
 9OmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk8woh1S2hw6a97QmPB735Ds2r0X9TmGOhYGPHHqET8M6D2jDP44is0k/uUu/iiP5aGgtsiGnsrGwjwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuWR1aGETUPK1izUyknKgDokZQeFyVuN9Qyi/Exrafp3ZT78Zj
 A93OYsIRnP9BaXGiGVP1s/NESuS2mtvJEV6KdVhruDCiW2PRbBFODpkDTQAfJpI=
X-Google-Smtp-Source: AGHT+IFPA8N1lIApwXdlaSl/HNsi0gfOXQ+7UfB2eYS+MdF/mHrjX6Aptdb7GIyUvtzl3aI6WvOevg==
X-Received: by 2002:a05:6a00:22c8:b0:70d:33b3:2d7f with SMTP id
 d2e1a72fcca58-71b260790a9mr10956907b3a.26.1727557515302; 
 Sat, 28 Sep 2024 14:05:15 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b264bb2b8sm3550025b3a.61.2024.09.28.14.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2024 14:05:15 -0700 (PDT)
Date: Sat, 28 Sep 2024 14:05:13 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Message-ID: <ZvhviRUb/CitmhgQ@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
 <ZvYJfrPx75FA1IFC@x1>
 <5076789c-3a35-4349-9733-f5d47528c184@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5076789c-3a35-4349-9733-f5d47528c184@lunn.ch>
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

On Fri, Sep 27, 2024 at 01:58:40PM +0200, Andrew Lunn wrote:
> > I tried to setup an nfs server with a rootfs on my local network. I can
> > mount it okay from my laptop so I think it is working okay. However, it
> > does not seem to work on the lpi4a [3]. It appears the rgmii-id
> > validation fails and the dwmac driver can not open the phy:
> > 
> >  thead-dwmac ffe7060000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >  thead-dwmac ffe7060000.ethernet eth0: validation of rgmii-id with support \
> >              00,00000000,00000000,00006280 and advertisementa \
> > 	     00,00000000,00000000,00006280 failed: -EINVAL
> >  thead-dwmac ffe7060000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -22)
> 
> Given what Emil said, i would suggest flipping the MDIO busses
> around. Put the PHYs on gmac1's MDIO bus, and set the pinmux so that
> its MDIO bus controller is connected to the outside world. Then, when
> gmac1 probes first, its MDIO bus will be probed at the same time, and
> its PHY found.
> 
> 	Andrew

I'm trying to configure the pinmux to have gmac1 control the mdio bus
but it seems I've not done so correctly. I changed pins "GMAC0_MDC" and
"GMAC0_MDIO" to function "gmac1" (see the patch below).

I don't see any errors about the dwmac or phy in the boot log [1] but
ultimately there is no carrier detected and the ethernet interface does
not come up.

Section "3.3.4.103 G3_MUXCFG_007" in the TH1520 System User Manual shows
that bits [19:16] control GMAC0_MDIO_MUX_CFG where value of 2 selects
GMAC1_MDIO. Similarly, bits [15:12] control GMAC0_MDC_MUX_CFG where a
value of 2 also selects GMAC1_MDC.

Emil - do you have any suggestion as to what I might be doing wrong with
the pinmux?

Thanks,
Drew

[1] https://gist.github.com/pdp7/1f9fcd76f26acd5715398d54f65a2e27

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index ca84bc2039ef..f2f6c9d9b590 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -11,6 +11,11 @@ / {
        model = "Sipeed Lichee Module 4A";
        compatible = "sipeed,lichee-module-4a", "thead,th1520";

+       aliases {
+               ethernet0 = &gmac0;
+               ethernet1 = &gmac1;
+       };
+
        memory@0 {
                device_type = "memory";
                reg = <0x0 0x00000000 0x2 0x00000000>;
@@ -55,6 +60,22 @@ &sdio0 {
        status = "okay";
 };

+&gmac0 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&gmac0_pins>;
+       phy-handle = <&phy0>;
+       phy-mode = "rgmii-id";
+       status = "okay";
+};
+
+&gmac1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&gmac1_pins>, <&mdio1_pins>;
+       phy-handle = <&phy1>;
+       phy-mode = "rgmii-id";
+       status = "okay";
+};
+
 &gpio0 {
        gpio-line-names = "", "", "", "", "", "", "", "", "", "",
                          "", "", "", "", "", "", "", "", "", "",
@@ -87,3 +108,101 @@ &gpio3 {
                          "GPIO09",
                          "GPIO10";
 };
+
+&mdio1 {
+       phy0: ethernet-phy@1 {
+               reg = <1>;
+       };
+
+       phy1: ethernet-phy@2 {
+               reg = <2>;
+       };
+};
+
+&padctrl0_apsys {
+       gmac0_pins: gmac0-0 {
+               tx-pins {
+                       pins = "GMAC0_TX_CLK",
+                              "GMAC0_TXEN",
+                              "GMAC0_TXD0",
+                              "GMAC0_TXD1",
+                              "GMAC0_TXD2",
+                              "GMAC0_TXD3";
+                       function = "gmac0";
+                       bias-disable;
+                       drive-strength = <25>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               rx-pins {
+                       pins = "GMAC0_RX_CLK",
+                              "GMAC0_RXDV",
+                              "GMAC0_RXD0",
+                              "GMAC0_RXD1",
+                              "GMAC0_RXD2",
+                              "GMAC0_RXD3";
+                       function = "gmac0";
+                       bias-disable;
+                       drive-strength = <1>;
+                       input-enable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+       };
+
+       gmac1_pins: gmac1-0 {
+               tx-pins {
+                       pins = "GPIO2_18", /* GMAC1_TX_CLK */
+                              "GPIO2_20", /* GMAC1_TXEN */
+                              "GPIO2_21", /* GMAC1_TXD0 */
+                              "GPIO2_22", /* GMAC1_TXD1 */
+                              "GPIO2_23", /* GMAC1_TXD2 */
+                              "GPIO2_24"; /* GMAC1_TXD3 */
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <25>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               rx-pins {
+                       pins = "GPIO2_19", /* GMAC1_RX_CLK */
+                              "GPIO2_25", /* GMAC1_RXDV */
+                              "GPIO2_30", /* GMAC1_RXD0 */
+                              "GPIO2_31", /* GMAC1_RXD1 */
+                              "GPIO3_0",  /* GMAC1_RXD2 */
+                              "GPIO3_1";  /* GMAC1_RXD3 */
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <1>;
+                       input-enable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+       };
+
+       mdio1_pins: mdio1-0 {
+               mdc-pins {
+                       pins = "GMAC0_MDC";
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <13>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               mdio-pins {
+                       pins = "GMAC0_MDIO";
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <13>;
+                       input-enable;
+                       input-schmitt-enable;
+                       slew-rate = <0>;
+               };
+       };
+};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
