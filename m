Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJqPKVwNzWnhZgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 14:19:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773137A59E
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Apr 2026 14:19:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8E7CC5A4C5;
	Wed,  1 Apr 2026 12:19:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BDDCC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2026 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=pcxQWoLJn9G0dptO93Z+OY78wD/jANP0+W3nIgxkSVw=; b=qNEW2nQKRTDZc2S5ljnvrwFD2S
 ynwfBvwdcAUg9wB9O2BQNo3gsYQBmZWC8+uiTL/bKTKBxga2nWKqXPIxb022Mtqb1OBj0ktBqfItp
 9zPLZJy1ZZlSRAZ2HEbzBs6x5maVTqWMfCM3b+e0uhiaUzx8BfBnLQxfqUtlE2lYy8eY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1w7uXf-00ELhN-8m; Wed, 01 Apr 2026 14:19:27 +0200
Date: Wed, 1 Apr 2026 14:19:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <420f910f-523d-4a74-a255-2fe48909283a@lunn.ch>
References: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aczHVF04LIGq_lYO@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: TSO
	fixes/cleanups
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[lunn.ch:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 3773137A59E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> I'm moving the setup of the GSO features, cleaning those up, and
> adding a warning if platform glue requests this to be enabled but the
> hardware has no support. Hopefully this will never trigger if everyone
> got the STMMAC_FLAG_TSO_EN flag correct.

Is this:

  snps,tso:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      Enables the TSO feature otherwise it will be managed by MAC HW capability
      register.

I would not be too surprised if there is cargo cult copy/paste going
on and some do get it wrong.

arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi:			snps,tso;
arch/arm64/boot/dts/toshiba/tmpv7708.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3576.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3576.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3568.dtsi:		snps,tso;
arch/arm64/boot/dts/rockchip/rk3528.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk3528.dtsi:			snps,tso;
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi:		snps,tso;
arch/arm64/boot/dts/qcom/qcs404.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/lemans.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/lemans.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sm8150.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/sc8280xp.dtsi:			snps,tso;
arch/arm64/boot/dts/qcom/monaco.dtsi:			snps,tso;
arch/arm64/boot/dts/st/stm32mp253.dtsi:		snps,tso;
arch/arm64/boot/dts/st/stm32mp233.dtsi:		snps,tso;
arch/arm64/boot/dts/st/stm32mp231.dtsi:				snps,tso;
arch/arm64/boot/dts/st/stm32mp251.dtsi:				snps,tso;
arch/riscv/boot/dts/sophgo/sg2042.dtsi:			snps,tso;
arch/riscv/boot/dts/sophgo/sg2044.dtsi:			snps,tso;
arch/riscv/boot/dts/starfive/jh7110.dtsi:			snps,tso;
arch/riscv/boot/dts/starfive/jh7110.dtsi:			snps,tso;
arch/arm/boot/dts/axis/artpec6.dtsi:			snps,tso;
arch/arm/boot/dts/rockchip/rv1126.dtsi:		snps,tso;
arch/arm/boot/dts/st/stm32mp131.dtsi:				snps,tso;
arch/arm/boot/dts/st/stm32mp133.dtsi:		snps,tso;
arch/arm/boot/dts/st/stm32mp151.dtsi:				snps,tso;

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
