Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273FB41EC6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF0CC3FAC8;
	Wed,  3 Sep 2025 12:21:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58EA4C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=YUjvm9eofoV1ResAkmWD1i4gWOlEKZtbOKhgLDy60X4=; b=Ah0SU7TeDcUCOSpr1QDkS2w9T6
 X1BI7rrsOnffJ+UGQkLG2e6hIadpm3DWpHV8Jq3DjceYSGhp+RQIIAIlgPUujdcjUNq/pq3se2TlC
 P5ZGujTnFTicaOaeReDJvlWWfKE01m3xQ0exgGklDzV6Ynb/WIcr2BEMNEQfTps034ic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1utmUS-0070oZ-Tc; Wed, 03 Sep 2025 14:21:28 +0200
Date: Wed, 3 Sep 2025 14:21:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] arm64: dts: st: enable ethernet1
 controller on stm32mp257f-dk
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

> +&ethernet1 {
> +	pinctrl-0 = <&eth1_rgmii_pins_b>;
> +	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
> +	pinctrl-names = "default", "sleep";
> +	max-speed = <1000>;

RGMII naturally has a max-speed of 1G, so this line is pointless.

You only use max-speed when you need to restrict the system below what
it would normally use, for example if the PCB is badly designed and
the tracks don't support 1G, but can do 100Mbps

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
