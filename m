Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUtIGVBgTmpBLgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 16:36:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E59E472772E
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 16:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b="Yb OHKqa";
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A11A3C8F271;
	Wed,  8 Jul 2026 14:35:59 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20560C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=3RsIPvZTD5nyIx31RnZBoJDbs5La8Zh1JeU+CoAk0mc=; b=Yb
 OHKqa1T/B64IUbHGnRIp5MUkE/sqUTcfU+fOTp4OdCC8IXPMUblg7xAEbtfI6mPatQsy5wLoEIfw5
 k9FEupjoPV+I/yDDkkQBFzXdcyd2+uZmyhbI8FrJpRIj2U70jU17dy+IY9pmVK3R++4cIYekuR7l7
 ftGjZ2nL0usWUlI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1whTNB-00BKwC-V6; Wed, 08 Jul 2026 16:35:37 +0200
Date: Wed, 8 Jul 2026 16:35:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Message-ID: <6ea11726-8d50-411e-afab-da346e09ab9b@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
 <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 maxime.chevallier@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>, rmk+kernel@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] dt-bindings: net:
 mediatek-dwmac: add support for MT8189 SoC
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:louisalexis.eyraud@collabora.com,m:edumazet@google.com,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:biao.huang@mediatek.com,m:richardcochran@gmail.com,m:rmk+kernel@armlinux.org.uk,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:matthiasbgg@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,collabora.com,st-md-mailman.stormreply.com,kernel.org,bootlin.com,redhat.com,vger.kernel.org,mediatek.com,gmail.com,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
	DKIM_TRACE(0.00)[lunn.ch:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E59E472772E

> On Tue, 2026-07-07 at 14:42 +0200, Andrew Lunn wrote:
> > > +=A0 - if:
> > > +=A0=A0=A0=A0=A0 properties:
> > > +=A0=A0=A0=A0=A0=A0=A0 compatible:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 contains:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - mediatek,mt8189-gmac
> > > +=A0=A0=A0 then:
> > > +=A0=A0=A0=A0=A0 properties:
> > > +=A0=A0=A0=A0=A0=A0=A0 clocks:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - description: MAC Main clock
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - description: PTP clock
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - description: RMII reference cloc=
k provided by MAC
> > =

> > Since this is a MAC, it sounds like it is consuming its own clock?
> =

> In the driver ([1]), this clock is described as being only used and
> needed in RMII when MAC provides the reference clock, and useless
> otherwise (RGMII/MII or RMII when PHY provides the reference clock).

So it sounds like this is a clock output, going to the PHY, as its
reference clock input. So ideally, the PHY should consume this clock,
not the MAC.

> Its use and configuration also depends on the "mediatek,rmii-clk-from-
> mac" vendor property ([2]) presence in devicetree.

This makes it sounds like it is historically wrong, and the patch is
just extending this to the new device.

Do you have a board using RMII? Can you list the clock in the PHY
node, not the MAC, and see if it still works?

Ideally, for a new device, we should not repeat past errors.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
