Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MFgIKv7gWk7NQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 14:44:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EADA0E3
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 14:44:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB813C87EC6;
	Tue,  3 Feb 2026 13:44:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CBBEC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ACroZsqXMIQuB0o6/1PDTEWKLpRas3S4wshE/11BH74=; b=S3cuj6+IUGGz7JH99vQDmKZDwQ
 hmDuTS6+PmQeG/LKCVhnGJCxVERvugUKayj4rgPHPRv/ngKwo6Yv1zDD7AwmTNcLXiNWmAAh1otL6
 v6Sv7tbXkyt0v9ueQFJUcejs2eqjyTQx0V7/82pumEknpOZ+hzMpa+fSecpl/gqSv9SUzLoKbjrAU
 dk3/4vut5ZAQPOAGzQGDTckonZIt2Qjmp7PO8ROyGgDABf0k4IzfrZEfvPsNROEntktYSg4lrlJcq
 gRG+ROCg2aGf8fClskOvysa2J2EZq7ru2/0d5gZnD3+jMyzPu3+xhvoaV+JGaOxrlC3vyawBfK6ZB
 Zv3GxL9g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46718)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vnGhF-00000000585-2kI0;
 Tue, 03 Feb 2026 13:44:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vnGhC-000000004Qa-0ZFP; Tue, 03 Feb 2026 13:43:58 +0000
Date: Tue, 3 Feb 2026 13:43:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Message-ID: <aYH7nTGx474azyk-@shell.armlinux.org.uk>
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
 <E1vmqnM-00000007VD8-1xWo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vmqnM-00000007VD8-1xWo@rmk-PC.armlinux.org.uk>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/10] net: stmmac: rk: remove
 need for ->set_speed() method
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:kuba@kernel.org,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,armlinux.org.uk:url,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 225EADA0E3
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:04:36AM +0000, Russell King (Oracle) wrote:
> As we can detect whether the SoC provides the parameters necessary for
> rk_set_reg_speed(), we don't need to have explicit calls to this.
> Instead, we can move the contents of this function to
> rk_set_clk_tx_rate().
> 
> This remsoves all the .set_speed() implementations that merely go on to
> invoke rk_set_reg_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I notice that the AI review claims there is a problem with this patch,
where rk_set_clk_tx_rate() may return -EINVAL for id=1 on rk3328.

It claims:

  The new code in rk_set_clk_tx_rate() requires either
  gmii_clk_sel_mask for RGMII or rmii_clk_sel_mask/mac_speed_mask
  for RMII. For rk3328 id=1, rk3328_init() sets only clock_grf_reg
  without any clock masks, so the function falls through and returns
  -EINVAL.

It is correct that rk3328_init() doesn't set gmii_clk_sel_mask
nor rmii_clk_sel_mask/mac_speed_mask. However:

static const struct rk_gmac_ops rk3328_ops = {
...
        .clock.rmii_clk_sel_mask = BIT_U16(7),
        .clock.mac_speed_mask = BIT_U16(2),

which sets the default for these masks via:

static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
                                          struct plat_stmmacenet_data *plat,
                                          const struct rk_gmac_ops *ops)
...
        /* Set the default phy_intf_sel and RMII mode register parameters. */
        bsp_priv->gmac_grf_reg = ops->gmac_grf_reg;
        bsp_priv->gmac_phy_intf_sel_mask = ops->gmac_phy_intf_sel_mask;
        bsp_priv->gmac_rmii_mode_mask = ops->gmac_rmii_mode_mask;

        /* Set the default clock control register related parameters */
        bsp_priv->clock_grf_reg = ops->clock_grf_reg;
        bsp_priv->clock = ops->clock;

Thus the AI review is incorrect.

Not setting clock.gmii_clk_sel_mask is fine, because gmac2phy (id=1)
only supports RMII. That was documented in a later patch that, because
of the problem with AI reviews failing, is not part of this smaller
patch set:

	net: stmmac: rk: rk3328: gmac2phy only supports RMII

Given that there are sixteen Rockchip SoCs in this file, describing
in detail every change just in case AI spontaneously decides there's
a problem that doesn't exist doesn't scale.

Note that previous AI review of this very same patch but part of the
full patch series passed without issue:

https://patchwork.kernel.org/project/netdevbpf/patch/E1vkL2s-00000005uta-3W8V@rmk-PC.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
