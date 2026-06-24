Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4DdPNYX7O2qwhQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 17:45:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 242FE6BFC05
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 17:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b=BtxnOHP1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC47BC57B41;
	Wed, 24 Jun 2026 15:45:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D123FC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=4HoG5nibkY73X5+Sim6btQdITTv97/tVHKTgeohtTGg=; b=BtxnOHP1PijdZwZuVcOKI5sK5c
 54MUxwFe6LX9lO9Pmeo0BFQVIa2+yf4XeAstyWjbCgm9jMq8IzD7dil3cUJsGjnBOpScm4R7Ar7Lv
 oyeZYEXG1rjg2PQBNMNnupaLRQ8zvVYxAcnKFMXOhp/Q576eiWf2LxAF45Nuk+DIxkSM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wcPmY-0096vk-Jm; Wed, 24 Jun 2026 17:44:54 +0200
Date: Wed, 24 Jun 2026 17:44:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yanan He <grumpycat921013@gmail.com>
Message-ID: <f526c23f-2ead-4246-bfaf-5bf4fbaec29f@lunn.ch>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-dc42d99f75a7@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-7-dc42d99f75a7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-7-dc42d99f75a7@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 7/7] ARM: dts: rockchip: Add Alientek
	DLRV1126
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:grumpycat921013@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:devicetree@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:david.wu@rock-chips.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sntech.de,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,rock-chips.com,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 242FE6BFC05

> The board consists of a CLRV1126F core module and a DLRV1126 carrier
> board. The core module contains the RV1126 SoC, eMMC and RK809 PMIC,
> while the carrier board provides Ethernet, SD card, AP6212 WiFi and
> Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and audio connectors.
> 
> The board has been tested with Ethernet/NFS boot, eMMC, SD card, SDIO
> WiFi enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and
> RK809 audio card registration.

Ah, here is the networking nodes. But why was it not threaded to the
rest of the series?

> +&gmac {
> +	phy-mode = "rgmii";
> +	clock_in_out = "input";
> +	assigned-clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
> +			  <&cru CLK_GMAC_ETHERNET_OUT>;
> +	assigned-clock-parents = <&cru CLK_GMAC_SRC_M1>,
> +				 <&cru RGMII_MODE_CLK>;
> +	assigned-clock-rates = <125000000>, <0>, <25000000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmiim1_miim &rgmiim1_bus2 &rgmiim1_bus4
> +		     &clk_out_ethernetm1_pins>;
> +	tx_delay = <0x2a>;
> +	rx_delay = <0x1a>;

As i predicted, this is wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Please try removing rx_delay, rx_delay and setting phy-mode to
rgmii-id.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
