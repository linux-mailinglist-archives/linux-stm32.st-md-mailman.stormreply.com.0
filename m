Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F594F536
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 18:48:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284E8C6DD72;
	Mon, 12 Aug 2024 16:48:48 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92FECC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 16:48:40 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f15dd0b489so58923171fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723481320; x=1724086120;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d0Mc13VmIzmDkfrvk6qFfmda4hNl8iLGAAY/xH4Lu4s=;
 b=Shl3TFS+wuO+577zF9ELfALnXJ4CNiNqPRHh+Isi4otAW+xL15sbvc5aOFx7omdjdJ
 9WcYy/fWk2Pwyfgt37CVypxqBmnKUX4Vq4wmoHZV3TuCJ4o9PbslkV00UmT+J2Q9nyDl
 7BPMlbdCxZQwV+ucor+ktcHf9tdMG95C3kj/tuTa5tashsFJXpIE9+F2dqbvmHFLUrH9
 BXk1LiTD17C+gvFEj3WSGbigrGXG7BcBBSxvIWH78k1LcP3XMNL1Hglj6o7SiIjeizX5
 1/J4vEGVtpPGgTyEkUlcJi1sz/R/xxgdCewBD9mkYDQihVGRe759FQkYG+HdkbNevQES
 59Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723481320; x=1724086120;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0Mc13VmIzmDkfrvk6qFfmda4hNl8iLGAAY/xH4Lu4s=;
 b=DRxur9rAx6mvbN3xvvyy1AFI7QFQMu74InmX36veKQyQKfx0A+vXM8a84A2ReDlKOe
 oTpTkwwQ2MroIxdH4pbG2Cy1/nhG7yJIJtmnB4JQbkwC6GJEQLmI9d/84Mu6sBetRJAJ
 UrEbI9IjhQyk9BmObEprv3c2EOwtq1UyEdOE3tDBJOSH3y+R1ZqPTF3NoB8Vyb8h8Bd4
 3+IepGhnPuz5hw1AThsfkLUkdDx0Yc+Ice2wwpCDBM4hFDoCNMtFIffDtCxQ3Wnfnk6X
 4jykelo9QgsdNzV+/zuvXYW/R28gQab9hahewCJ7ma3mHyTuvjDBpMSt2yeaIfxo5vfL
 qnMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqXOV3Mwn8jkVfhXbrH2wpyAIDb2XOsjHUe03Oyl0o8wKsQKJJFnrbcKoG0DXAH7v47J+99atXmsC7FxT5Ml3iU837kJsnbU218bsviPr2qKkuXwDvylKI
X-Gm-Message-State: AOJu0YztnjQ7l589qQEh7gFKmFFiNLUfAiCYA7z7yq8BntkBRdwzlhZX
 zuJSBekIx8X5EOPVts3pTh13hdVm+L5yNaLOlXaxBlab0y9UbnoR
X-Google-Smtp-Source: AGHT+IEICykI0/E1vi+tUfDtsUozOTdpRc0zNaRVqt1sAvFqECffwJNfcDvjzrD9yXF+YFsjMTJWoQ==
X-Received: by 2002:a2e:701:0:b0:2ef:2a2a:aaa1 with SMTP id
 38308e7fff4ca-2f2b715a77fmr5687541fa.29.1723481319281; 
 Mon, 12 Aug 2024 09:48:39 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291ddb5e9sm8942461fa.6.2024.08.12.09.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 09:48:38 -0700 (PDT)
Date: Mon, 12 Aug 2024 19:48:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <tcneleue5kvsn4ygf2mrrt6gpz5f47zz6sp2wveav5wr5glbhi@7thgrb44kt3m>
References: <20240809192150.32756-1-fancer.lancer@gmail.com>
 <32bevr5jxmmm3ynnj3idpk3wdyaddoynyb7hv5tro3n7tsswwd@bbly52u3mzmn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32bevr5jxmmm3ynnj3idpk3wdyaddoynyb7hv5tro3n7tsswwd@bbly52u3mzmn>
Cc: Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix false "invalid port
	speed" warning
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

Hi Andrew

On Fri, Aug 09, 2024 at 03:41:04PM -0500, Andrew Halaney wrote:
> On Fri, Aug 09, 2024 at 10:21:39PM GMT, Serge Semin wrote:
> > If the internal SGMII/TBI/RTBI PCS is available in a DW GMAC or DW QoS Eth
> > instance and there is no "snps,ps-speed" property specified (or the
> > plat_stmmacenet_data::mac_port_sel_speed field is left zero), then the
> > next warning will be printed to the system log:
> > 
> > > [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
> > 
> > By the original intention the "snps,ps-speed" property was supposed to be
> > utilized on the platforms with the MAC2MAC link setup to fix the link
> > speed with the specified value. But since it's possible to have a device
> > with the DW *MAC with the SGMII/TBI/RTBI interface attached to a PHY, then
> > the property is actually optional (which is also confirmed by the DW MAC
> > DT-bindings). Thus it's absolutely normal to have the
> > plat_stmmacenet_data::mac_port_sel_speed field zero initialized indicating
> > that there is no need in the MAC-speed fixing and the denoted warning is
> > false.
> 

> Can you help me understand what snps,ps-speed actually does? Its turned
> into a bool and pushed down into srgmi_ral right now:
> 
> 	/**
> 	 * dwmac_ctrl_ane - To program the AN Control Register.
> 	 * @ioaddr: IO registers pointer
> 	 * @reg: Base address of the AN Control Register.
> 	 * @ane: to enable the auto-negotiation
> 	 * @srgmi_ral: to manage MAC-2-MAC SGMII connections.
> 	 * @loopback: to cause the PHY to loopback tx data into rx path.
> 	 * Description: this is the main function to configure the AN control register
> 	 * and init the ANE, select loopback (usually for debugging purpose) and
> 	 * configure SGMII RAL.
> 	 */
> 	static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
> 					  bool srgmi_ral, bool loopback)
> 	{
> 		u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
> 
> 		/* Enable and restart the Auto-Negotiation */
> 		if (ane)
> 			value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
> 		else
> 			value &= ~GMAC_AN_CTRL_ANE;
> 
> 		/* In case of MAC-2-MAC connection, block is configured to operate
> 		 * according to MAC conf register.
> 		 */
> 		if (srgmi_ral)
> 			value |= GMAC_AN_CTRL_SGMRAL;
> 
> 		if (loopback)
> 			value |= GMAC_AN_CTRL_ELE;
> 
> 		writel(value, ioaddr + GMAC_AN_CTRL(reg));
> 	}
> 
> 

In addition to the method above there are three more places related to
the SGMRAL flag (SGMII Rate Adaptation Layer Control flag) setting up:

2. drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
stmmac_probe_config_dt():
  of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);

Description: Retrieve the fixed speed of the MAC-2-MAC SGMII
connection from DT-file.

3. drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:
stmmac_hw_setup():
   if (priv->hw->pcs) {
	int speed = priv->plat->mac_port_sel_speed;

	if ((speed == SPEED_10) || (speed == SPEED_100) ||
	    (speed == SPEED_1000)) {
		priv->hw->ps = speed;
	} else {
		dev_warn(priv->device, "invalid port speed\n");
		priv->hw->ps = 0;
	}
   }

Description: Parse the speed specified via the "snps,ps-speed"
property to make sure it's of one of the permitted values. Note it's
executed only if the priv->hw->pcs flag is set which due to the
current stmmac_check_pcs_mode() implementation is only possible if
the DW GMAC/QoS Eth supports the SGMII PHY interface.

4. drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:
   drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:
dwmac*_core_init():
   if (hw->ps) {
	value |= GMAC_CONTROL_TE;

	value &= ~hw->link.speed_mask;
	switch (hw->ps) {
	case SPEED_1000:
		value |= hw->link.speed1000;
		break;
	case SPEED_100:
		value |= hw->link.speed100;
		break;
	case SPEED_10:
		value |= hw->link.speed10;
		break;
	}
   }

Description: Pre-initialize the MAC speed with the value retrieved from
the "snps,ps-speed" property. The speed is then fixed in the SGMII
Rate adaptation Layer by setting up the SGMIRAL flag performed in the
dwmac_ctrl_ane() method you cited. 
Note the same register fields (MAC_CONTROL.{PS,FES}) are touched in
the stmmac_mac_link_up() method in the framework of the MAC-link up
procedure (phylink_mac_ops::mac_link_up). But AFAICS the procedure is
done too late, and after the SGMIRAL flag is set in the framework of
the stmmac_open()->stmmac_hw_setup()->dwmac_ctrl_ane() call. That's
probably why the MAC2MAC mode developer needed the speed being
pre-initialized earlier in the dwmac*_core_init() functions.


To sum up the MAC-2-MAC mode implementation can be described as
follows:
1. The platform firmware defines the fixed link speed by means of the
"snps,ps-speed" property (or by pre-initializing the
plat_stmmacenet_data::mac_port_sel_speed field in the glue driver).
2. If the SGMII PHY interface is supported by the DW GMAC/QoS Eth
controller, the speed will be fixed right at the network interface
open() procedure execution by subsequently calling the
stmmac_core_init() and stmmac_pcs_ctrl_ane() methods.

Please note I can't immediately tell of how that functionality gets to
live with the phylink-based link setup procedure, in the framework of
which the link speed is also setup in stmmac_mac_link_up(). Alas I
don't have any SGMII-based device to test it out. But I guess that it
lives well until the pre-initialized in the "snps,ps-speed"
speed matches to the speed negotiated between the connected PHYs. If
the speeds don't match, then I can't tell for sure what would happen
without a hardware at hands.

> What is that bit doing exactly?

Here is what the DW MAC databook says about the bit:

"SGMII RAL Control

When set, this bit forces the SGMII RAL block to operate in the speed
configured in the MAC Configuration register's Speed and Port Select
bits. This is useful when the SGMII interface is used in a direct
MAC-MAC connection (without a PHY) and any MAC must reconfigure the
speed.

When reset, the SGMII RAL block operates according to the link speed
status received on the SGMII (from the PHY)."

Shortly speaking the flag enables the SGMII Rate adaptation layer
(SGMII RAL) to stop selecting the speed based on the info retrieved
from the PHY and instead to fix the speed with the value specified in
the MAC_CTRL_REG register.

> The only user upstream I see is
> sa8775p-ride variants, but they're all using a phy right now (not
> fixed-link aka MAC2MAC iiuc)... so I should probably remove it from
> there too.

Right, there is only a single user of that property in the kernel. But
I don't know what was the actual reason of having the "snps,ps-speed"
specified in that case. From one side it seems contradicting to the
original MAC-2-MAC semantics since the phy-handle property is also
specified in the ethernet controller DT-node, but from another side it
might have been caused by some HW-related problem so there was a need
to fix the speed. It would be better to ask Bartosz Golaszewski about
that since it was him who submitted the patch adding the sa8775p-ride
Ethernet DT-nodes.

> 

> I feel like that property really (if I'm following right) should be just
> taken from a proper fixed-link devicetree description? i.e. we already
> specify a speed in that case. Maybe this predates that (or reinvents it)
> and should be marked as deprecated in the dt-bindings.

Exactly my thoughts of the way it should have been implemented in the
first place. The fixed-linked semantics was exactly suitable for the
MAC-2-MAC HW-setup since both of them implies the link-speed being
fixed to a single value with no PHY-node required.

Note if the respective code conversion is planned to be done then I
guess it would be better to do after the Russell' series
https://lore.kernel.org/netdev/ZrCoQZKo74zvKMhT@shell.armlinux.org.uk/
is merged in, since the changes are related.

> 
> But I'm struggling to understand what the bit is really doing based
> on the original commit that added it, so I don't know if my logic is
> solid. i.e., what's different in the phy case vs mac2mac with this
> particular bit?

Please see my notes above for more details about the SGMRAL bit
semantics. Shortly speaking The difference is basically in the way the
link-speed is established:
- If the SGMRAL bit is set the MAC' SGMII RAL will operate with the
  speed specified in the Speed and Port Select bits of the
  MAC_CTRL_REG register.
- If the SGMRAL bit is reset the SGMII RAL will operate according to
  the link speed status received on SGMII (from the PHY).

> 
> Thanks for your never ending patience about my questions wrt the
> hardware and this driver.

Always welcome. I'm glad to be helpful, especially after I myself
have spent endless time deciphering down the STMMAC' driver guts and
studying the hardware design of the Synopsys Ethernet MACs.

-Serge(y)

> 
> - Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
