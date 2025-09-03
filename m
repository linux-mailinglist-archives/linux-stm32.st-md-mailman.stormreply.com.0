Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E8B41EDD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81611C3FAC8;
	Wed,  3 Sep 2025 12:24:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB4EC3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=t//bbBNUhyP65PWrZQ0g45yV9ZKC744g1ycgqE51bxY=; b=eNGAaE32uD/yOcNkA2MH0sZQKM
 QdlR5ObodgGOWF42Wempybp9Bh5NvzclfnZcrCQEA0gdwAX/EQcfShJQXkOs5yObVgyd+l8JVRK69
 Z0G4jeRv29z2gi4+fIc+1J2UA+HK7B3Vgb1B00v6gvjxLE5K9WxTae0Ko5Dh2LlZaeT0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1utmXB-0070qQ-Kb; Wed, 03 Sep 2025 14:24:17 +0200
Date: Wed, 3 Sep 2025 14:24:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <faa673a3-d68c-4b7f-a2b6-1f5bf40aabfb@lunn.ch>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903-mp2_ethernet-v1-3-4105b0ad2344@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: st: enable ethernet1
 controller on stm32mp257f-ev1
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

> +		phy1_eth1: ethernet-phy@4 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			reset-gpios =  <&gpioj 9 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			reg = <4>;

The DT coding style would suggest reg comes after compatible.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
