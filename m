Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4FA8D7911
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B7BC78002;
	Sun,  2 Jun 2024 23:25:24 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08D56C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:25:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ea903cd11bso36568251fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717370722; x=1717975522;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eCJ3/UMYS40bUTEzpbEGEN5IgufP139pAuhlqfFxKiA=;
 b=IpROt7DS5tuhMgh2cvH1w+NLY5ccH1/NtqGUchNMQ036YtsY02Z+gZjfLC/MtOhps4
 A9w9EtUo6oCV/1wXVrykIjVSyyyKn1sPqmVi4xXvHcv+NnRJ0ox292p2YW4HNcEErvgX
 VgMfyuTojGdhwZnM1DtPR6DY9VvZNVHRCkq++kISvFe+lPQ6llv2mLL76tNobKWFZdXc
 czEN/BmDO9tr0dLGpVxrnB3bCZwTfTesQ7KC3Pg5ls5NFz8RAl03D4Nigi+TFxXMzCpV
 I0dQYEYvESRaxKIuZKSlo7ZJkyPEDp96AMMjB+1H5WXPfaEbtZAZmM+IEA0vArK1OYq7
 tizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370722; x=1717975522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCJ3/UMYS40bUTEzpbEGEN5IgufP139pAuhlqfFxKiA=;
 b=msfMUjFpkJO6XEjcXGK9I5Qj9S8J2DQ1PQ/qu6Zn5IcM4o6nQQJQJ1xFNl7qoexRXe
 LxISxjyuFWW1WzAqnPoeFI6T0SaC0pleKX+5uKXRycHlwTs7/Z7ofv9pS7NdkJj1+7vG
 Jo0HuhlRlXNwPE1I+Ug1j58TEPePg1CIqEPOgBJOhscezXmGtlmmMp4q1kqNY48KwSv8
 p+cx85k4HTQt1M3rogj0MixXVpPx0XZMaH1j3tikwIXB9iRKXc2Ap8nKDd0vxGas8mxl
 wi0R7OzOv4xVw0MVlymdx3bVlbePU0SvZTpRuKHjd7sTT7qlM3kWv/CGjmNWXpi8Q2He
 6Yag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtE7Wcz8Nde1jbKtdMZRHNtvwauF5kb2kTQdpVV71uuIsLIYePZRUawquCN8GGXj7ubTSiW7uKuLnLP+y7SFVUdRi7O4m+B4qJRS1tmJwXRTm6tbKaYLCD
X-Gm-Message-State: AOJu0YwTmqLg1qZceo3R6Ep5kbr6XVdW4+X37xKLcEX7nrHttEfxZhD6
 ni45B6vTwTmMBkiBISMGgZV/DOS1ZJ7QA7Pn6meyGZABn052nof0
X-Google-Smtp-Source: AGHT+IF5EZAbemMtEV8HkFtTrIyv5z9PPS44uvwmLsCuxSCSXDhHTzTDN8jblZzPazJTWVEkkRPdwQ==
X-Received: by 2002:a2e:3517:0:b0:2e7:16c9:2e0c with SMTP id
 38308e7fff4ca-2ea9512fc2fmr58077251fa.15.1717370721932; 
 Sun, 02 Jun 2024 16:25:21 -0700 (PDT)
Received: from mobilestation ([95.79.124.210])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91b9db52sm10408021fa.26.2024.06.02.16.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:25:21 -0700 (PDT)
Date: Mon, 3 Jun 2024 02:25:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <yk3ohf2cct3mbbk6ajmhnqrzeivimlz3kblayrsyoxsw26ewmg@fpuvru3paq7w>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <20240524210304.9164-2-fancer.lancer@gmail.com>
 <ZlNoLHoHjt3BsFde@shell.armlinux.org.uk>
 <ZlN4tkY8fNM8/D8p@shell.armlinux.org.uk>
 <ukszpirecb3pwnz5bbmy7wl44ujh6t2ewrnodmrye5kjmonsz2@pgf5b2oy5n3p>
 <ZlXmjKtKozXThPFv@shell.armlinux.org.uk>
 <x4snwm24lqebfcu3xqipwnxcexxbxhfijw7ldsukk23tn5k3rc@g3tfmynhvm26>
 <ZlolU6+lUaXQSQID@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlolU6+lUaXQSQID@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Byungho An <bh74.an@samsung.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/3] net: stmmac: Activate
 Inband/PCS flag based on the selected iface
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

Hi Russel

On Fri, May 31, 2024 at 08:30:27PM +0100, Russell King (Oracle) wrote:
> Hi Serge,
> 
> Thanks for the reply. I've attempted to deal with most of these in my
> v2 posting, but maybe not in the best way yet.

I've got your v2 series. I'll have a look at it and test it out later
on the next week, sometime around Wednesday.

> 
> On Fri, May 31, 2024 at 08:13:49PM +0300, Serge Semin wrote:
> > > Does this
> > > mean it is true that these cores will never be used with an external
> > > PCS?
> > 
> > Sorry, I was wrong to suggest the (priv->plat.has_gmac ||
> > priv->plat.has_gmac4)-based statement. Indeed there is a case of having DW
> > QoS Eth and DW XPCS synthesized together with the SGMII/1000Base-X
> > downstream interface. Not sure why it was needed to implement that way
> > seeing DW QoS Eth IP-core supports optional SGMII PHY interface out of
> > box, but AFAICS Intel mGBE is that case. Anyway the correct way to
> > detect the internal PCS support is to check the PCSSEL flag set in the
> > HWFEATURE register (preserved in the stmmac_priv::dma_cap::pcs field).
> 
> We can only wonder why!
> 
> > > Please can you confirm that if an external PCS (e.g. xpcs, lynx PCS)
> > > is being used, the internal PCS will not have been synthesized, and
> > > thus priv->dma_cap.pcs will be false?
> > 
> > Alas I can't confirm that. priv->dma_cap.pcs only indicates the
> > internal PCS availability. External PCS is an independent entity from
> > the DW *MAC IP-core point of view. So the DW GMAC/QoS Eth/XGMAC
> > controllers aren't aware of its existence. It's the low-level platform
> > driver/code responsibility to somehow detect it being available
> > ("pcs-handle" property, plat->mdio_bus_data->has_xpcs flag, etc).
> > 
> > Regarding the internal PCS, as long as the DW GMAC or DW QoS Eth is
> > synthesized with the SGMII/TBI/RTBI PHY interface support
> > priv->dma_cap.pcs will get to be true. Note the device can be
> > synthesized with several PHY interfaces supported. As long as
> > SGMII/TBI/RTBI PHY interface is any of them, the flag will be set
> > irrespective from the PHY interface activated at runtime. 
> 
> I've been debating about this, and given your response, I'm wondering
> whether we should change stmmac_mac_select_pcs() to instead do:
> 
> static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
> 						 phy_interface_t interface)
> {
> 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> 	struct phylink_pcs *pcs;
> 
> 	if (priv->plat->select_pcs) {
> 		pcs = priv->plat->select_pcs(priv, interface);
> 		if (!IS_ERR(pcs))
> 			return pcs;
> 	}
> 
> 	return stmmac_mac_phylink_select_pcs(priv, interface);
> }
> 
> and push the problem of whether to provide a PCS that overrides
> the MAC internal PCS into platform code. That would mean Intel mGBE
> would be able to override with XPCS. rzn1 and socfpga can then do
> their own thing as well.

Well, AFAICS the only device that currently have the DW XPCS
connected to a non DW XGMAC controller is indeed the Intel mGBE with its
DW QoS Eth+DW XPCS weird setup. At the same time the Intel mGBE
controller can also support RGMII interface. Thus there is no internal
SGMII/TBI/RTBI PCS in there.

Qualcomm QoS Eth uses the internal SGMII PCS and by setting up the
STMMAC_FLAG_HAS_INTEGRATED_PCS flag its driver almost completely
disables the STMMAC PCS functionality (except the
stmmac_pcs_ctrl_ane() being called in stmmac_hw_setup()).

So from the perspective of these two devices the PCS selection looks
quiet certain. It's either internal or external one. There is no
device with both of them available.

SoCFPGA... Well, it's another and more complicated story. Based on
what said in a comment in
socfpga_gen5_set_phy_mode()/socfpga_gen10_set_phy_mode() the only
possibility to have some internal interface converted to the external
one is when a "splitter" is available. But IMO the comment is
misleading because the only thing that is then done with the
"splitter" CSR is just the clock divider selection. What is actually
done, if the "splitter" is available or if the SGMII/GMII/MII
_MAC-interface_ is requested, then the internal interface is fixed to
"GMII/MII". It looks weird because based on the "mac-mode" DT-property
semantics it was supposed to indicate the internal interface only. But
EMAC is never tuned to have the SGMII interface (see the values saved
in the "*val" argument of socfpga_set_phy_mode_common()). So all of
that makes me to conclude the next points:

1. "mac-mode" property has never been utilized for the SoG-FPGA GMAC
platform. The plat_stmmacenet_data::mac_interface field has always
defaulted to plat_stmmacenet_data::phy_interface.

2. SoG-FPGA GMAC IP-core itself doesn't support the native/internal
SGMII interface.  It's implemented by means of the so called
"gmii-to-sgmii"-converter, which is the Lynx PCS.

Thus unless I've missed something the SoC-FPGA network controller
structure can be depicted as follows:


                   +---- SYSMGR:PHYSEL
      phy_intf_sel |
+------------------+                     +--------------+ 
|          RMII    |                     |              | Internal Interface
|       +----------+                     |          off +--------------------------+
|          RGMII   | Internal Interface  | SGMII        |                          | External Interface*
| EMAC  +----------+---------------------+              |          +-------+       +--------+-----------
|         GMII/MII |                     | adapter      | GMII/MII | Lynx  | SGMII |        |
|       +----------+                     |           on +----------+       +-------+        |
|                  +--+                  |              |          |  PCS  |                |
+------------------+  |                  +--------------+          +---+---+                |
                      |                                                |                    |
                      |              +------------+                    |                    |
                      +--------------+ Splitter** +--------------------+--------------------+
                                     +-----+------+
                                           |
                                     +-----+------+
                                     | Oscillator |
                                     +------------+

* No idea whether the external interface is represented as a single IO
port or as multiple interface ports handled by the same MAC.

** As I explained above, judging by the SoC-FPGA driver code the
"splitter" is just the reference clock divider responsible for the
clock rate adjustment based on the requested link speed.

Based on the logic depicted on the sketch above, I guess that there is
no internal SGMII/TBI/RTBI PCS in SoC-FPGA GMAC either. The SGMII
interface is implemented by means of the Lynx PCS.

> 
> I'm trying hard not to go down another rabbit hole... I've just
> spotted that socfpga sets mac_interface to PHY_INTERFACE_MODE_SGMII.
> That's another reason for pushing this down into platform drivers -
> if platform drivers are doing weird stuff, then we can contain their
> weirdness in the platform drivers moving it out of the core code.

Oh, that damn "mac-mode" property... First of all as I already
mentioned once AFAICS originally it was introduced for the SoC-FPGA
GMAC, but the property has never been defined in any DT-node so far,
neither in SoC-FPGA nodes nor in the rest of the DW *MAC-based nodes.
Moreover based on my consideration above the SoC-FPGA internal
interface is always determined based on the external one seeing
plat_stmmacenet_data::mac_interface defaults to
plat_stmmacenet_data::phy_interface. Secondly I also have much
certainty that the rest of the glue drivers utilizing
plat_stmmacenet_data::mac_interface field should in fact be using
plat_stmmacenet_data::phy_interface instead. Based on the history of
the mac_interface-related changes it's likely that all of them have
just either been missed during the conversion to utilizing the
phy_interface-field or incorrectly utilized the mac_interface field
instead of phy_interface in the first place.

So to speak before going further it might be worth re-checking once
again the entire history of the "mac-mode" property-related change,
but as an experimental A/B-test patch for net-next it may be a good
idea to either drop the mac_interface field completely, or convert the
driver to forgetting about the internal PCS if the external one is
enabled, or, as a less invasive option, make SoC-FPGA explicitly
setting up the mac_interface field to GMII/MII if it configures the
internal interface to that value. Then, if these changes don't break
any platform (most importantly the SoF-FPGA GMAC case), then we can go
further and carefully convert the rest of the glue-drivers not using
the mac_interface field.

> 
> > You can extend the priv->dma_cap.pcs flag semantics. So it could
> > be indicating three types of the PCS'es:
> > RGMII, SGMII, XPCS (or TBI/RTBI in future).
> 
> If TBI/RTBI gets supported, then this would have to be extended, but I
> get the impression that this isn't popular.

Irrespective from the TBI/RTBI interface support, using the
priv->dma_cap.pcs field for all possible PCS'es shall also improve the
code readability. Currently we have four versions of the PCS fields:
dma_features::pcs
mac_device_info::pcs
mac_device_info::xpcs
mac_device_info::lynx_pcs
which are being checked here and there in the driver...

> 
> > I guess the DW XPCS implementation might be more preferable. From one
> > side DW XPCS SGMII can support up to 2.5Gbps speed, while the DW
> > GMAC/QoS Eth SGMII can work with up to 1Gbps speed only. On the other
> > hand the DW XPCS might be available over the MDIO-bus, which is slower
> > to access than the internal PCS CSRs available in the DW GMAC/QoS Eth
> > CSRs space. So the more performant link speed seems more useful
> > feature over the faster device setup process.
> 
> I think which should be used would depend on how the hardware is wired
> up. This brings us back to platform specifics again, which points
> towards moving the decision making into platform code as per the above.
> 
> > One thing I am not sure about is that there is a real case of having
> > the DW GMAC/QoS Eth synthesized with the native SGMII/TBI/RTBI PHY
> > interface support and being attached to the DW XPCS controller, which
> > would have the SGMII downstream PHY interface. DW XPCS has only the
> > XGMII or GMII/MII upstream interfaces over which the MAC can be
> > attached.
> 
> That gives us another possibility, but needs platforms to be doing
> the right thing. If mac_interface were set to XGMII or GMII/MII, then
> that would exclude the internal MAC PCS.
> 
> > So DW GMAC/QoS Eth and DW XPCS can be connected via the
> > GMII/MII interface only. Regarding Intel mGBE, it likely is having a
> > setup like this:
> > 
> > +------------+          +---------+
> > |            | GMII/MII |         |   SGMII
> > | DW QoS Eth +----------+ DW XPCS +------------
> > |            |          |         | 1000Base-X
> > +------------+          +---------+
> 
> 
> So as an alternative, 
> 
>      mac_interface            phy_interface
> 
>      XGMII/GMII/MII           SGMII/1000Base-X
> MAC ---------------- DW XPCS ------------------
> 
>      INTERNAL                SGMII/TBI/RTBI
> MAC ---------- Internal PCS ----------------
> 
>      INTERNAL                  RGMII
> MAC ---------- Internal "PCS" --------------

+ SoC-FPGA (presumably)

       GMII/MII                  SGMII
  MAC ---------------- Lynx PCS --------------

Please also note, based on the DW GMAC/QoS Eth hardware manual each
internal interface block is connected to MAC by the GMII/MII
interface. So the internal PCS cases more precisely could be
represented as follows:

       GMII                     SGMII (AN)
  MAC ---------- Internal PCS ------------------

       GMII                     TBI/RTBI (AN)
  MAC ---------- Internal PCS ------------------
  
       GMII                      RGMII (In-band)
  MAC ---------- Internal "PCS" ----------------

       GMII                      RevMII
  MAC ----------  RevMII block  ----------------

       GMII                      GMII
  MAC ------------------------------------------

       MII                       SMII (In-band)
  MAC ---------- Internal "PCS" ----------------

       MII                       RMII
  MAC ----------   RMII block   ----------------

       MII                       MII
  MAC ------------------------------------------

There is a special input signal phy_intf_sel[2:0], which tells to MAC
what interface to activate (grep -i the glue drivers for "intf",
"physel", etc).

> 
> One of the problems here, though, is socfpga. It uses mac_interface
> with RGMII*, MII, GMII, SGMII and RMII. I think it's confusing
> mac_interface for phy_interface, but I haven't read through enough
> of it to be certain.
> 
> So that again leads me back to my proposal above for
> stmmac_mac_select_pcs() as the least likely to break proposition -
> at least given how things are at the moment.

Please see my notes above regarding the internal interface
initialization in the SoC-FPGA glue driver. I guess we could at least
try to A/B-test the SoC-FPGA code in the next net-next by setting
mac_interface to GMII/MII when the internal interface is enabled as
GMII/MII in the glue-driver, and converting the rest of the glue
driver to using phy_interface. If nothing breaks, then SoC-FPGA has
never used the "mac-mode" property and we could mark the property as
deprecated and could carefully covert the rest of the STMMAC platform
driver to using the phy_interface field.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
