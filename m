Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E156CE982B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Dec 2025 12:11:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25912C8F26D;
	Tue, 30 Dec 2025 11:11:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E21C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Dec 2025 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=q8mJjZZ+g0Ane4YM5RznnhE0rIh8fOKol1HCX6F0D/o=; b=BPSqJZYsaDZ7VTxZxtC4xtF6us
 nnjomjcgInese737gA0SIxpFBCz7H0JDBXU54soQ8qOVSs5CkVNUP9O+4a+uuggu5w1dTXvExFTl3
 PRjqdtUvdlsZscGftFRaZDTwJ+quhkt62MOip2ShMGaaaVfA1cM/CWjeCEkgxtQBiAic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vaXdU-000rjY-5P; Tue, 30 Dec 2025 12:11:32 +0100
Date: Tue, 30 Dec 2025 12:11:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <8997facb-068b-4088-b996-1c0898dea19a@lunn.ch>
References: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
 <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] Revert "arm: dts: socfpga: use
 reset-name "stmmaceth-ocp" instead of "ahb""
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

On Mon, Dec 29, 2025 at 01:17:19PM -0600, Dinh Nguyen wrote:
> This reverts commit 62a40a0d5634834790f7166ab592be247390d857.
> 
> With the patch "add call to assert/deassert ahb reset line" in place, we can
> safely remove the "stmmaceth-ocp" reset name and just use the standard
> "ahb" reset name.

altr,socfpga-stmmac.yamle says:

  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
  # does not validate against net/snps,dwmac.yaml.

Please add a patch to the series adding stmmaceth-ocp, but mark it as
deprecated, and comment that ahb should be used instead.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
