Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 262799FCC67
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Dec 2024 18:21:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA913C78027;
	Thu, 26 Dec 2024 17:21:32 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C41B0C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Dec 2024 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5N+wx0Qk5TqbeXwXzSz+Fa7T6lAtBAss99O2QCq8s3Q=; b=qAkkU0uXstPl9370wu/aPWwF6F
 n7bPhHYuNGdw+aYgEPOqMZ6AUjgUqd41KmjtMYBxSJ1NNoQv5QKIy4f6qG2ZkzraAaL9zVwLBZY4B
 CFhkBjr/xoKQ7gbEHQ6tOCXJ6ohc1T1CSOZOYA5ocqJNarZTb7di/ofgClcbRHAsxi9o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tQrXk-00GQ7T-3M; Thu, 26 Dec 2024 18:21:04 +0100
Date: Thu, 26 Dec 2024 18:21:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX
 programmable swap on qcs615
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

On Thu, Dec 26, 2024 at 10:29:45AM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-25 19:37, Krzysztof Kozlowski wrote:
> > On 25/12/2024 11:04, Yijie Yang wrote:
> > 
> > >   static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   {
> > > -	struct device_node *np = pdev->dev.of_node;
> > > +	struct device_node *np = pdev->dev.of_node, *root;
> > >   	const struct ethqos_emac_driver_data *data;
> > >   	struct plat_stmmacenet_data *plat_dat;
> > >   	struct stmmac_resources stmmac_res;
> > > @@ -810,6 +805,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   	ret = of_get_phy_mode(np, &ethqos->phy_mode);
> > >   	if (ret)
> > >   		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
> > > +
> > > +	root = of_find_node_by_path("/");
> > > +	if (root && of_device_is_compatible(root, "qcom,sa8540p-ride"))
> > 
> > 
> > Nope, your drivers are not supposed to poke root compatibles. Drop and
> > fix your driver to behave correctly for all existing devices.
> > 
> 
> Since this change introduces a new flag in the DTS, we must maintain ABI
> compatibility with the kernel. The new flag is specific to the board, so I
> need to ensure root nodes are matched to allow older boards to continue
> functioning as before. I'm happy to adopt that approach if there are any
> more elegant solutions.

Why is it specific to this board? Does the board have a PHY which is
broken and requires this property? What we are missing are the details
needed to help you get to the correct way to solve the problem you are
facing.

	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
