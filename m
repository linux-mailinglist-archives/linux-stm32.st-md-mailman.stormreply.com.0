Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI+IHleud2ngkAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 19:11:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B48BEB1
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 19:11:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9FE3C87EDB;
	Mon, 26 Jan 2026 18:11:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A48F4C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vicu6lpUE90FAgN2xtfuOumDUR1Qg4VnW5GWRXk4y9o=; b=NrPEk1J1La77hJglDtJdiD8za9
 IGx3mDMOahM9R9I2Epz3BcUKZV0mEwhrhJowvHeWenHhHLJRQmcsbU5jlB66JkVEvQS2Co5khEXlF
 asdrMDH6hVzJxOHU2z65VzC4+izMIh1i573mzJbt9dxmqTpS+HtuGU2tgNpoX+XId54JueRF3XNIF
 LpV/dq8Ej88/zNas8S35JPhVSeA8skdIZWOdx3nPPsnkHPXiP97M1UY8xNnAHJVZi6ipsJJ1MHpZF
 PAlyizJyryjDuVP54qj98ob9nRsfq+XB3t4GOkzjGe85CZRYRnTbfos0P7CnvrtLmXfVuSo8b1zma
 Zh7SYR1Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36042)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vkR3c-000000005Co-0yVO;
 Mon, 26 Jan 2026 18:11:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vkR3X-00000000595-3RUR; Mon, 26 Jan 2026 18:11:19 +0000
Date: Mon, 26 Jan 2026 18:11:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH net-next] net: stmmac: Preserve
 bootloader MAC address across unconditional reset
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:biju.das.jz@bp.renesas.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:prabhakarcsengg@gmail.com,m:geert@glider.be,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,glider.be,bp.renesas.com,renesas.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,renesas.com:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 103B48BEB1
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
> asserts a reset in probe when a reset controller is present. This reset
> clears the MAC address registers, so a valid address programmed by the
> bootloader gets lost and the driver falls back to a random address.
> 
> Read the MAC address from the hardware registers before resetting the
> hardware. Keep the existing address selection logic when no valid
> address is found, and program the selected address back into the MAC
> after probe so it remains consistent in hardware.
> 
> Export stmmac_bus_clks_config() so the early read path can enable the
> bus clocks before accessing the MAC registers.

I don't think this is a good idea. stmmac_bus_clks_config() is specific
to using platform devices, but the core stmmac driver also supports
PCI that doesn't use stmmac_bus_clks_config().

stmmac_bus_clks_config() handles:

 - plat_dat->stmmac_clk
 - plat_dat->pclk
 - any clock handled by the plat_dat->clks_config() method

For platform devices, stmmac_probe_config_dt() gets these two clocks
from DT, and prepares and enables them both. So, by the time the
probe function is called, these clocks are already running.

For those handled by the platform glue, the glues that populate
this function:

eic7700: eic7700_clks_config() - this is called from the init/exit
handlers. Will be invoked to enable the clocks by stmmac_dvr_probe().

imx: imx_dwmac_clks_config() - called by imx_dwmac_probe() to enable
clocks prior to stmmac_dvr_probe() being invoked.

mediaktek: mediatek_dwmac_clks_config() - called by
mediatek_dwmac_probe() to enable clocks prior to stmmac_dvr_probe()
being invoked.

qcom-ethqos: ethqos_clks_config() - called by qcom_ethqos_probe() to
enable clocks prior to stmmac_dvr_probe() being invoked.

So, I can confidently say that all clocks should be running by the
time __stmmac_dvr_probe() is called, and thus there should be no
requirement to call stmmac_bus_clks_config() in this code.


The next problem: you place this code to read registers from stmmac
before:

	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);

Sadly, the binding documentation is too vague to pin down what this
is, as dwmac can have AHB master (which generates bus cycles for
accessing memory) and AHB slave (which would be the target for
register accesses) interfaces.

The problem here is that if some platform glue has wired this reset
such that it resets the AHB slave side, that will prevent register
access, and thus your attempt to read the MAC across all devices
will fail.


The next question that comes up is that we have a perfectly good way
that's been around for years to pass a MAC address from the boot
loader into the kernel for any network interface. I notice that it
isn't mentioned in the DT bindings, presumably to prevent people
from adding it to their in-kernel DT files.

	mac-address =
	local-mac-address =

The old documentation in ethernet.txt was:

- mac-address: array of 6 bytes, specifies the MAC address that was last used by
  the boot program; should be used in cases where the MAC address assigned to
  the device by the boot program is different from the "local-mac-address"
  property;
- local-mac-address: array of 6 bytes, specifies the MAC address that was
  assigned to the network device;

Given that these are interfaces between the boot loader and the kernel,
they can't be deprecated, as platforms will rely upon these properties
to pass the MAC address from the boot loader to the kernel. For example
on one of my systems:

$ vdir /sys/class/net/eth0/of_node/
total 0
-r--r--r-- 1 root root  4 Jan 26 18:08 gop-port-id
-r--r--r-- 1 root root 50 Jan 26 18:08 interrupt-names
-r--r--r-- 1 root root 80 Jan 26 18:08 interrupts
-r--r--r-- 1 root root  6 Jan 26 18:08 local-mac-address
-r--r--r-- 1 root root 14 Jan 26 18:08 name
-r--r--r-- 1 root root  4 Jan 26 18:08 phy
-r--r--r-- 1 root root 10 Jan 26 18:08 phy-mode
-r--r--r-- 1 root root  8 Jan 26 18:08 phys
-r--r--r-- 1 root root  4 Jan 26 18:08 port-id
-r--r--r-- 1 root root  4 Jan 26 18:08 reg
-r--r--r-- 1 root root  5 Jan 26 18:08 status

where "local-mac-address" states the MAC address to be used for eth0,
as specified by the boot loader.

I don't think stmmac needs this extra complication provided platforms
make use of mechanisms that already exist... and I feel it's time to
start saying no to platform specific quirks that can be handled by
those mechanisms.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
