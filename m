Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOI4OKSF/GmOQwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 14:29:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A34E82FA
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 14:29:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8AB9C8F283;
	Thu,  7 May 2026 12:29:23 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 660B8C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=LmEIVv5Hxh+mKmeuHsN7vP/fAMiciYkPlIj13WZ+oiE=; b=MY/2xBVpjxX2ZXH6RhO3LIF2+N
 x4csJK/N/xl92PKhwsmp0UjPRbRm/Rrtz4SozNtBf6AqtO5BJoH769H2UhBcDCNP470yRW+O/UVsa
 pyds4D5Cno6Z40QB5+xOuQhW+Sr4uB2BZ2Pl5t32AxN2j3/AVfxPOL/DF5VxOthAVWf0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wKxqo-001oGr-6c; Thu, 07 May 2026 14:29:10 +0200
Date: Thu, 7 May 2026 14:29:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Message-ID: <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507083136.175-1-lizhi2@eswincomputing.com>
Cc: edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
 ningyu@eswincomputing.com, maxime.chevallier@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net v1 1/2] dt-bindings: ethernet: eswin:
 refine delay model and HSP register description
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
X-Rspamd-Queue-Id: 6E4A34E82FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[google.com,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,bootlin.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,gmail.com,davemloft.net];
	NEURAL_SPAM(0.00)[0.222];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[lunn.ch:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

>      ethernet@50400000 {
>          compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
>          reg = <0x50400000 0x10000>;
> -        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> -                <&d0_clock 193>;
> -        clock-names = "axi", "cfg", "stmmaceth", "tx";
>          interrupt-parent = <&plic>;
>          interrupts = <61>;
>          interrupt-names = "macirq";
> -        phy-mode = "rgmii-id";
> -        phy-handle = <&phy0>;
> +        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 193>;
> +        clock-names = "axi", "cfg", "stmmaceth", "tx";

Please don't move the clocks around, since they have nothing to do
with RGMII delays.


>          resets = <&reset 95>;
>          reset-names = "stmmaceth";
> -        rx-internal-delay-ps = <200>;
> -        tx-internal-delay-ps = <200>;
> -        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
> -        snps,axi-config = <&stmmac_axi_setup>;
> +        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
> +        phy-handle = <&phy0>;
> +        phy-mode = "rgmii-id";
>          snps,aal;
>          snps,fixed-burst;
>          snps,tso;
> -        stmmac_axi_setup: stmmac-axi-config {
> +        snps,axi-config = <&stmmac_axi_setup_gmac0>;
> +
> +        stmmac_axi_setup_gmac0: stmmac-axi-config {

And what do these changes have to do with RGMII delays?

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
