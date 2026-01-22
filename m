Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI3TMk5KcmnpfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:03:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FE696D4
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:03:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E86D8C87EDF;
	Thu, 22 Jan 2026 16:03:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC36C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKZNUPjuUcl3IiH9k6+6nqxg1HkcAU/xUmRgMsq4Sgk=; b=0XGPstaGKvgp6pakaMES7f0WAJ
 +9zfLPL944OOtUXCK1x7qXcdrXb+t3DXPH37LZqZEgHPihvNeS2zTOyp9jMkIIwGOeAwzkKjw31jn
 sqeFFSUdCVqvcNvGoRD1ua81TO7IinO/BH5Sd4Nz1gbOVY2vkRZ8Pp/0FpFUGzMkm54p9OdeMBtiY
 5RSK1z4FO1Ac3suhOa/iGzR4/mcIaH1XDW/4lPQ2HKy6PxkGXmM6Atzd/X5qP55Kmu1wwlSfacZsG
 YonhOxnvDHzt0VGLVp07pXX6WVdj5ovCebu5eWRnqblzHAmyUlEj3Fu27s7YeD6pXcYkTeQRw71z8
 ToTt42jw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51058)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vix9F-000000000dd-31Mk;
 Thu, 22 Jan 2026 16:03:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vix9A-0000000017C-2p65; Thu, 22 Jan 2026 16:03:00 +0000
Date: Thu, 22 Jan 2026 16:03:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <aXJKNBAifG6qv80M@shell.armlinux.org.uk>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
 <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
 <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
 <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Bo Gan <ganboing@gmail.com>, linmin@eswincomputing.com, robh@kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ganboing@gmail.com,m:linmin@eswincomputing.com,m:robh@kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,eswincomputing.com,st-md-mailman.stormreply.com,lunn.ch,google.com,redhat.com,davemloft.net,lists.infradead.org,einfochips.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 510FE696D4
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:27:34PM +0100, Andrew Lunn wrote:
> > We also intend
> > to upstream complete DTS files for EIC7700 so the bindings can be validated
> > against real hardware.
> 
> I suggest you prioritise this. ARM-SOC is pretty flexible for
> accepting work in progress support for new SoCs. All you really need
> is for the board to boot to a login prompt on a serial port using an
> initramsfs. So the .dtsi and .dts file can be very slim, CPUs, memory
> and UARTs.
> 
> Once you have that merged you can work on the other drivers, their
> bindings, etc.
> 
> As Russell pointed out, at the moment, most of the code you have in
> the kernel is unusable, so it is a candidate for being thrown out.

Indeed, and we've had drivers merged before for platforms that never
made it in, and they just hang around for decades, adding to the
maintainer's burden for no benefit what so ever.

So please, no more drivers for EIC7700 until there is functional
support for the platform, as Andrew states.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
