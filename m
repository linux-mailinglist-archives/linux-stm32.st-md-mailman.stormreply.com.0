Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mImgM4MhcmmPdQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 14:09:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F956710F
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 14:09:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36D3DC87EDE;
	Thu, 22 Jan 2026 13:09:23 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5133C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=KkhVBB+QgzcCgYyqL44Qur19CLLRdKf0hGWKGZRHDXM=; b=3wbYFeC4l3BuZgViSmTjQ/upiU
 dBWtE6sepWEKwD6lbSg8mRK7p26bIka0HVof7t/10AMQrdbIO5y8JFcbLVA319b37CaMPRi7FeKcT
 TX/GWvVdkBXLRZ1Xb+iIo0rrO9sySy3HvUK95WGYquFBA2tSAjxiRZ21T91QCfGPoXmo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1viuR0-003yGm-Mo; Thu, 22 Jan 2026 14:09:14 +0100
Date: Thu, 22 Jan 2026 14:09:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Message-ID: <96f2c395-82f0-4399-be3b-6b0e3f07f90e@lunn.ch>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-4-eichest@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120203905.23805-4-eichest@gmail.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, andrew+netdev@lunn.ch, edumazet@google.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 francesco.dolcini@toradex.com, kuba@kernel.org, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: dwmac-imx:
 keep preamble before sfd on i.MX8MP
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
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:eichest@gmail.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:stefan.eichenberger@toradex.com,m:festevam@gmail.com,m:s.hauer@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:francesco.dolcini@toradex.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,pengutronix.de,toradex.com,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,lunn.ch:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,toradex.com:email]
X-Rspamd-Queue-Id: 73F956710F
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 09:30:04PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The stmmac implementation used by NXP for the i.MX8MP SoC is subject to
> errata ERR050694. According to this errata, when no preamble byte is
> transferred before the SFD from the PHY to the MAC, the MAC will discard
> the frame.
> 
> Setting the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag instructs PHYs that
> support it to keep the preamble byte before the SFD. This ensures that
> the MAC successfully receives frames.
> 
> As this is an issue in the MAC implementation, only enable the flag for
> the i.MX8MP SoC where the errata applies but not for other SoCs using a
> working stmmac implementation.
> 
> The exact wording of the errata ERR050694 from NXP:
> The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> be no preceding preamble byte. The MAC receiver must successfully
> receive a packet without any preamble(0x55) byte preceding the SFD,
> SMD-S, or SMD-C byte.
> However due to the defect, in configurations where frame preemption is
> enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> byte, the received packet is discarded by the MAC receiver. This is
> because, the start-of-packet detection logic of the MAC receiver
> incorrectly checks for a preamble byte.
> 
> NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> they show two tables one where the preamble is preceding the SFD and one
> where it is not. The text says:
> The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> between transmission at the source GMII and reception at the destination
> GMII. Table 35-3 depicts the case where no preamble bytes are conveyed
> across the GMII. This case may not be possible with a specific PHY, but
> illustrates the minimum preamble with which MAC shall be able to
> operate. Table 35-4 depicts the case where the entire preamble is
> conveyed across the GMII.
> 
> This workaround was tested on a Verdin iMX8MP by enforcing 10 MBit/s:
> ethtool -s end0 speed 10
> Without keeping the preamble, no packet were received. With keeping the
> preamble, everything worked as expected.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
