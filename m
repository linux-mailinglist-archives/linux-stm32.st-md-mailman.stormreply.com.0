Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C5912E36
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 22:02:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 494FCC7128E;
	Fri, 21 Jun 2024 20:02:06 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46679C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 20:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=+4uY3EQUbz0DrVfaPCZ2jsnH9YO74ydeFMqnW6Tj1Qs=; b=cCHqmixMNx4mQ7o42wyenotfxy
 c9qb686CtVOYMbo/OVFYYDOrwJvABI5XTPxGcgzjGxPU6/LlCloNzMZY15Wrve0IFPJIUj+G+P+FY
 pmFH8HDn0UIA0tb4uR+lQr3tmffQwCKdeGfQVwc3w4rNk8RWnGKPuij8cyqhqstS+owE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKkS3-000hIR-QR; Fri, 21 Jun 2024 22:01:39 +0200
Date: Fri, 21 Jun 2024 22:01:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <b5096113-de85-485e-a226-a8112b3d5490@lunn.ch>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
 <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
 <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: Add interconnect support
 in qcom-ethqos driver
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

> > This all looks pretty generic. Any reason why this is just in the
> > Qualcomm device, and not at a higher level so it could be used for all
> > stmmac devices if the needed properties are found in DT?
> > 
> >        Andrew
> ICC is a software framework to access the NOC bus topology of the
> system, all though "axi" and "ahb" buses seem generic but the 
> topologies of these NOC's are specific to the vendors of synopsys chipset hence
> this framework might not be applicable to all the vendors of stmmac driver.

There are however a number of SoCs using synopsys IP. Am i right in
says they could all make use of this? Do we really want them to one by
one copy/paste what you have here to other vendor specific parts of
stmmac?

This code looks in DT. If there are no properties in DT, it does
nothing. So in general it should be safe, right?

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
