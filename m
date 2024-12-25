Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7119FC62C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Dec 2024 18:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 805C5C78F67;
	Wed, 25 Dec 2024 17:49:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBEA5C78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Dec 2024 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7zaH4j7WopmuTe39LdIt9zVEEoEXcU6yeHbphF4jg2w=; b=YJoq34KNP2+1yE2R1bC3Z857m7
 rfpQM73OR8kzfsg3OVDTB601+xgq6RysfZwZduP/8V9OiO+ry/C+UX/EcJX4SWUU2NlAzz4fZ6eka
 GYSliQW+wBPLL91KDsIvnf250jzDQU+RDIJ+mxpPV9G5jipTdWl5MVD5lVdUuOQrfy84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tQVVL-00GA3K-A7; Wed, 25 Dec 2024 18:49:07 +0100
Date: Wed, 25 Dec 2024 18:49:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Support tuning the RX sampling swap
	of the MAC.
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

On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
> The Ethernet MAC requires precise sampling times at Rx, but signals on the
> Rx side after transmission on the board may vary due to different hardware
> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> occasion between the rising edge and falling edge of the clock to meet the
> sampling requirements.

The RGMII specification says that RD[3:0] pins are sampled on the
rising edge for bits 3:0 and falling edge for bits 7:4.

Given this is part of the standard, why would you want to do anything
else?

Is this maybe another symptom of having the RGMII delays messed up?

Anyway, i don't see a need for this property, unless you are working
with a PHY which breaks the RGMII standard, and has its clock
reversed?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
