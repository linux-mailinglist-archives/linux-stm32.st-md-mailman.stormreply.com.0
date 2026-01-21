Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO6dIGqlcGlyYgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 11:07:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C354EFB
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 11:07:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A285EC36B3C;
	Wed, 21 Jan 2026 10:07:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D7E3C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 10:07:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 58D65C21A86;
 Wed, 21 Jan 2026 10:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72CB76070A;
 Wed, 21 Jan 2026 10:07:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D899119B1101; Wed, 21 Jan 2026 11:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768990055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=sQcfSLIQGBQsyjDnlCFvh7UQyWLEbwU5EueHUcH9sWA=;
 b=cdHtpclFrIFKL047AiJevVG8jQQrWHfZbb4no2Bv6z5dPsRZsE0CEK23fh3AE5y0HPok3D
 D/eI4p59v38c6efDuSIJIRY8IKGbJB0YRZdH+EMy25iTseXVRLBhyC9wYKquKynO6ZpvQy
 /CatnEXVrfrObq8bfS7zOTHQgZyekyK0j0aSnC9zfauuoZM586L4eZZRU7nmkcUmldLhKT
 stHSWqARk03rZJcCQu1kYgNmQSXkikdNnuPOgYUaO/GA+80I1u24U+U0DIShI6/K0FBQ/U
 fXIFfREGMFDnYFLYfZTLV7ASMHW1b3L09vnwDrsUCpnhNTk7jy8BOfPLmrobfQ==
Message-ID: <af8c2609-59ca-4573-af4b-b08563a5a0bb@bootlin.com>
Date: Wed, 21 Jan 2026 11:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, francesco.dolcini@toradex.com
References: <20260120203905.23805-1-eichest@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: dwmac:
 enforce preamble before SFD for i.MX8MP
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com,pengutronix.de,armlinux.org.uk,st-md-mailman.stormreply.com,toradex.com];
	FORGED_RECIPIENTS(0.00)[m:eichest@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:francesco.dolcini@toradex.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 1D4C354EFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Stefan,

On 20/01/2026 21:30, Stefan Eichenberger wrote:
> This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
> that allows a MAC driver to request to keep the preamble bytes before
> the start frame delimiter (SFD) when receiving frames from the PHY.
> 
> This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
> (ERR050694), which causes it to drop frames without a preamble.
> 
> The Micrel KSZ9131 PHY supports keeping the preamble before SFD by
> setting an undocumented flag, that was confirmed by NXP and Micrel. This
> new feature has been added to the Micrel PHY driver for the KSZ9131 PHY.
> 
> Changes since v2:
> - Instead of using phy_register_fixup add a new phy_device::dev_flags
>   flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD so that a MAC can request to keep
>   the preamble before SFD if needed (Russell)
> - Link to v2: https://lore.kernel.org/all/20260105100245.19317-1-eichest@gmail.com/
> 
> Changes since v1:
> - Use phy_register_fixup_for_uid() instead of adding a new device tree
>   property
> - I will send the conversion of the micrel.txt binding as a separate
>   patch series
> - Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/
> 
> Stefan Eichenberger (3):
>   net: phy: add a new phy_device flag to keep preamble before sfd
>   net: phy: micrel: add option to keep the preamble before sfd for
>     KSZ9131
>   net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
>  drivers/net/phy/micrel.c                          | 14 +++++++++++++-
>  include/linux/phy.h                               |  5 +++--
>  include/linux/stmmac.h                            |  1 +
>  5 files changed, 29 insertions(+), 5 deletions(-)
> 

Thank you for that. The code looks fine to me. I've tested in on a custom baord
I have that happens to have an iMX8MP and a KSZ9131, it fixes the issue for
10M links ! Thank you :)

For the series,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
