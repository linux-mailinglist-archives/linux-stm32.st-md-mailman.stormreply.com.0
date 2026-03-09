Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHpFLdmormkFHQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:02:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070723782D
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 12:02:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E67E1C8F27F;
	Mon,  9 Mar 2026 11:02:48 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE2CDC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sAkRjP9jYISvdMSyBJJw0ajApQvAkfVgmNZbtMfYkuE=; b=kQnBDvz0laLdm0pWRVN8e4/E3s
 IgESKlZ6AMDuT1IePF3BZzZWkfTma4/fS3zWrngtkKycV66UO8DR32Z8ppv8fNyqJB2NcNvhn0/oA
 b37FxopH4vF7Q8NVEulkxinLjgcyzw6sEVaMb1BnM3FvouqcBdLAoibT5BK39sQNi8URpXjSpHNmJ
 PFh5V5zYBHZKMSKE2tfdnaiq4OQw1KvkuoQNg+Scb/k1AF//X2KqmHkEDJeNaz1l4fBH1e/fAV9Qs
 hER0s+tKnKBpcebWKfkEibAqcTdfrKVvcFI0lO1YB1A22xf72DsEBrDHexqtpnCLr5Oj9q66wM82z
 XPom7/Xg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46846)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vzYNj-000000003dG-0zT3;
 Mon, 09 Mar 2026 11:02:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vzYNg-000000004FS-1Hwk; Mon, 09 Mar 2026 11:02:36 +0000
Date: Mon, 9 Mar 2026 11:02:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aa6ozPBP_OlayFs9@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 0/7] net: stmmac: improve
	PCS support
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
X-Rspamd-Queue-Id: 5070723782D
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
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:vkoul@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.514];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> Resending this as the original RFC now conflicts with net-next.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2, which was posted yesterday:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.

I'm intending to tweak this patch series slightly. First, reordering
the patches, moving patches 4 and 5 to the beginning of the series,
followed by patch 1, 3 and 2.

The first two add support for reading the SGMII status from hardware
which we don't currently use, then we add support for BASE-X and
start using it for 2500BASE-X for qcom-ethqos. This should result in
no change at this point.

Next, I'm intending to add a new patch which sets
plat_dat->mdio_bus_data->default_an_inband = true; which will enable
in-band mode, and thus start using the SGMII link state. This will
be used where the inband caps indicates both the PHY and PCS suport
inband. For 2500BASE-X, because the PCS reports a value of 0x01,
that will switch phylink automatically out of inband mode.

This should mean that phylink will switch to inband mode for SGMII,
and outband for 2500BASE-X, which will eliminate the PCS configuration
change done by qcom-ethqos.

I've also changed the "report PCS configuration changes" as I
suggested, although this should no longer trigger.

I'll post this shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
