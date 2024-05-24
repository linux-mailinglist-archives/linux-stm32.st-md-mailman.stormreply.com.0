Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69A8CED0C
	for <lists+linux-stm32@lfdr.de>; Sat, 25 May 2024 01:54:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3FEC6DD6D;
	Fri, 24 May 2024 23:54:58 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74268C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 23:54:50 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e964acff1aso3334961fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716594890; x=1717199690;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C88HQP5ECIo5q+E9ZVdMutmLc/H0bpLfC6cu4zCL6Cc=;
 b=CkrH5+BNV4twrNbDY5OhWlid7AgWSMWnBLt5zX9xDVPXhAdapI8Eky/oxuOKAsdL6v
 Hxde+wd+b1mlcQBk1zlFj1jMqJ5LeZ48nliXYBXJfww6ETpFT2hOmesxaE36c249TpJA
 5stSoR2YhLUVp8zZE0yAtzNuUZhKq9bdHp94gKNyqfcc5KetNp+F+yYg5C/tizjab6qS
 Z0Bt+uWxSs/hOfB6OJ4MREOa96CNh2ufpXmb+AYzK/7c81L0ae1H+v17Rw+xsr30Ko8N
 bNf9rbpg5hrTgKiEnAGT6bP0q3YZRCewfv4KMCS/GaR0ns1IqW4XGKeYePywai36H8Ru
 96LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716594890; x=1717199690;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C88HQP5ECIo5q+E9ZVdMutmLc/H0bpLfC6cu4zCL6Cc=;
 b=qL17xuRYY6zCqB/QmRovZTvdPeJhD8fiKd+qxp+4R42iRFLN7n6ffG86mADCNbmpi/
 E8KO3dm6nxzxQ0x3eObTQTQyQMI0p3LxwYqDUT62EWdn1mljYzuIwbaFNnR0o1YG4aAJ
 T5brpgGircxNKTEvl9YkZUZXUMrXll0ippy/OFHEOnAlPeLKfiiXJr+6AC15+IoxTo3E
 GpDYnpGb51BPQmYhadSicPxd8e4Mci58rn0S61irCTSGGJiXN32u3/IENcqf0S48Gk1Z
 Ttqj2YyIRcCPoI8P3ekJW1qjLingnSOzQw2FzTBdbo7vzu9MbzcMXYfbh3I3uQl80nE3
 i3yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ULCoVEIdUDwRyrq3se+Ml511fWPjOEFG/j/Gu1cE1l4Xq3sYYs2qruTAA8dWK6Xj5vr1jOqfZ3afyb/sLnQkDunOfGd4u8yfEDqAsz84KK6tLi9VWHmK
X-Gm-Message-State: AOJu0Yz16Fs5EFTHwr6beSWCXY1n+ScnfXiM1k8T7PiMsG760b2TSMfK
 SjZiRpJTJUPo/3wL0BeNCgCDkBtzq5rk+85tmVF9zDO0kEwsAXx/
X-Google-Smtp-Source: AGHT+IGPDifZXrabnPpbv6zVtd/c3VSXjEPZ2PEC19yup66VheQQcXkaOsrXspa9CrV/nawuWkBEsA==
X-Received: by 2002:a05:651c:222:b0:2e6:f3af:c6aa with SMTP id
 38308e7fff4ca-2e95b28aeb0mr24028551fa.40.1716594889276; 
 Fri, 24 May 2024 16:54:49 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcd7bbcsm4020781fa.32.2024.05.24.16.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:54:48 -0700 (PDT)
Date: Sat, 25 May 2024 02:54:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <5c5xphkjbadimi3y3wzvv2hhlancxiwdtnikgl6pdv6jbbfmqu@tmfnjuxyygud>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <y2iz5uhcj5xh3dtpg3rnxap4qgvmgavzkf6qd7c2vqysmll3yx@drhs7upgpojz>
 <ZkKghpox1r6ZqtyB@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkKghpox1r6ZqtyB@shell.armlinux.org.uk>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/6] net: stmmac: convert stmmac "pcs"
	to phylink
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

Hi Russell

On Tue, May 14, 2024 at 12:21:42AM +0100, Russell King (Oracle) wrote:
> On Tue, May 14, 2024 at 02:04:00AM +0300, Serge Semin wrote:
> > Hi Russell
> > 
> > I'll give your series a try later on this week on my DW GMAC with the
> > RGMII interface (alas I don't have an SGMII capable device, so can't
> > help with the AN-part testing).
> 
> Thanks!
> 
> > Today I've made a brief glance on it
> > and already noted a few places which may require a fix to make the
> > change working for RGMII (at least the RGSMIIIS IRQ must be got back
> > enabled). After making the patch set working for my device in what
> > form would you prefer me to submit the fixes? As incremental patches
> > in-reply to this thread?
> 
> I think it depends on where the issues are.
> 
> If they are addressing issues that are also present in the existing
> code, then it would make sense to get those patched as the driver
> stands today, because backporting them to stable would be easier.
> 
> If they are for "new" issues, given that this patch series is more
> or less experimental, I would prefer to roll them into these
> patches. As mentioned, when it comes to submitting these patches,
> the way I've split them wouldn't make much sense, but it does
> make sense for where I am with it. Hence, I'll want to resplit
> the series into something better for submission than it currently
> is. If you want to reply to this thread, that is fine.

I've just submitted the fixes for your series
https://lore.kernel.org/netdev/20240524210304.9164-1-fancer.lancer@gmail.com/
which make it working well on my hardware: DW GMAC v3.73 with RGMII
PHY interface connected to the Micrel KSZ9031RNX PHY. (For a lucky
coincident the PHY happen to support the link status sent in-band up
to the MAC.) So as long as the managed="in-band-status" property is
specified the PCS subsystem gets the link-status by means of the
pcs_get_state() callback. The status change is signaled by means of
the RGSMIIIS IRQ.  For that to work the Patch 2 of my series was
required (and of course Patch 1 which prevents the IRQs flood).

I'm sorry for submitting the series only today. First I had to dig
deeper into the way the RGMII In-band/PCS-block of the controller
works. Then I needed some time to study the STMMAC PCS-code and to
debug the problems fixed in my series. So I finished testing your
patchset on this Monday. Then I decided to spend sometime for making
the PCS implementation looking more optimized based on the knowledge I
gained during the debugging. But as it's normal for the STMMAC driver
(which sucks indeed) a few days wasn't enough for that, because due to
the driver being overwhelmed with duty hacks any more-or-less invasive
refactoring may lead to regressions here or there. So I stuck right at
the first step of getting the "snps,ps-speed" and the MAC2MAC mode
well implemented...(

Anyway here is the key points regarding the RGMII In-band and
PCS-interface implemented in the DW GMAC and DW QoS Eth
controllers/drivers:

1. Intermediate PCS for which the plat_stmmacenet_data::mac_interface
field and the "mac-mode" property was introduced isn't the case of the
PCS embedded into the DW GMAC and DW QoS Eth IP-cores by Synopsys.
That was some another PCS likely specific for the Altera SoC FPGA
platform (dwmac-socfpga.c).

2. RGMII: There is no any PCS-block utilized in case of the RGMII PHY
interface (that's why HWFEATURE.PCSSEL flag isn't set). The networking
controller provides a way to pick up the RGMII In-band status
delivered from the attached PHY. The in-band status is updated in the
GMAC_RGSMIIIS (DW GMAC) and in the GMAC_PHYIF_CTRLSTATUS (DW QoS Eth)
registers and signalled via the RGSMIIIS MAC IRQ.

3. SGMII: The interface implementation has a PCS-block so the
HWFEATURE.PCSSEL flag is set. But the auto-negotiation procedure
complies to the SGMII specification: no ability advertisement. SGMII
PHY sends the control information back to the MAC by means of the
tx_config_Reg[15:0] register. MAC either acknowledges the update or
not. The control information retrieved from the PHY is reflected in
the GMAC_RGSMIIIS (DW GMAC) and in the GMAC_PHYIF_CTRLSTATUS (DW QoS
Eth) registers. The only AN-related CSR available for the SGMII
interface are GMAC_AN_CTRL(x) and GMAC_AN_STATUS(x) since no
advertisement implied by the specification.

4. RGMII/SGMII/SMII: Note CSR-wise the tx_config_Reg[15:0] register
mapping is the same for all of these interfaces. It's available in the
GMAC_RGSMIIIS (DW GMAC) and in the GMAC_PHYIF_CTRLSTATUS (DW QoS Eth)
CSRs: in case of the DW GMAC it's GMAC_RGSMIIIS[0:15] bits, but in
case of DW QoS Eth it's GMAC_PHYIF_CTRLSTATUS[16:31]. (This info can
be useful to create a common dwmac_inband_pcs_get_state() method
implementation in the stmmac_pcs.c module.)

5. TBI/RTBI: It has a traditional auto-negotiation procedure fully
complying to the IEEE 802.3z C37 specification with the link abilities
advertisement. RBI/RTBI don't imply any in-band link status detection
so the GMAC_RGSMIIIS (DW GMAC) and in the GMAC_PHYIF_CTRLSTATUS (DW
QoS Eth) CSRs aren't available for these interfaces.

6. RGMII/SGMII/SMII: In order to have the Link Speed
(GMAC_CONTROL.{PS,FES}), Duplex mode (GMAC_CONTROL.DM) and Link
Up/Down bit (GMAC_CONTROL.LUD or GMAC_PHYIF_CTRLSTATUS.LUD)
transferred from MAC to the attached PHY or to another MAC via
tx_config_Reg[15:0], the GMAC_CONTROL.TC (DW GMAC) or
GMAC_PHYIF_CTRLSTATUS.TC (DW QoS Eth) flags must be set. Just a note
seeing the current PCS implementation doesn't do that even in case of
the fixed Port-select speed setup (when snps,ps-speed property is
specified).


Based on the info above I was going to extend your stmmac_pcs.c module
with the inband link status (retrieved via the tx_config_Reg[15:0])
parsing method; create more basic PCS-ops in the framework of the
dwmac1000_core.c and dwmac4_core.c modules, and the common
phylink_pcs_ops in the stmmac_main.c module using those basic PCS-ops.
But as I mentioned before I was stuck on the fixed Port-select speed
implementation. It's activated via the "snps,ps-speed" property. If
it's specified the AN_Control.SGMRAL flag will be set which makes the
SGMII interface working with a fixed speed pre-initialized in the
MAC_CONFIG.{PS,FES} fields. First of all I wasn't sure whether the
MAC2MAC functionality it's utilized for, can be applicable for
non-SGMII interface. Secondly the port speed fixing is performed
behind the phylink back. It's possible to have the speed setting being
updated later in framework of the mac_link_up() callback. So I have
some doubts that the current "snps,ps-speed"-based fixed port speed
implementation is fully correct.

That's the stage at which I decided to stop further researches and
sent my series of fixes to you.

-Serge(y)

> 
> There's still a few netif_carrier_off()/netif_carrier_on()s left
> in the driver even after this patch series, but I think they're in
> more obscure paths, but I will also want to address those as well.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
