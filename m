Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE886846F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 00:05:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9F8DC6B46B;
	Mon, 26 Feb 2024 23:05:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11570C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 23:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=pYmdkgX1dVrE40bWWH7YizC1+wHj2Ilzj2iousZ5MvQ=; b=biDX9XVZoNS+cu+iILmQSUl1K+
 Qg9ttG/A56qZt0e4lsHbOPZw1aHansTRFWg7u3iBfNdZv0inSyJh+RRvOrrYAm72UhuCMqRUD/KCG
 5Ojfv0AiI7kvUVIbFYnMiYQiIeYZlZGzXUM38f9nmsFFD8fcu/6Cn2Xmyc4O66l8g7+w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rek2P-008lo4-S6; Tue, 27 Feb 2024 00:05:33 +0100
Date: Tue, 27 Feb 2024 00:05:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <89c54319-82d0-4cb3-b3be-ccdf6dcf2742@lunn.ch>
References: <20240222125517.3356-1-quic_sarohasa@quicinc.com>
 <54b8c58a-6288-4ae6-9ed7-aa7b212e63da@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54b8c58a-6288-4ae6-9ed7-aa7b212e63da@linaro.org>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Sneh Shah <quic_snehshah@quicinc.com>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Sarosh Hasan <quic_sarohasa@quicinc.com>, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Update link clock rate only for RGMII
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

> >   static void
> >   ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
> >   {
> > -	switch (speed) {
> > -	case SPEED_1000:
> > -		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> > -		break;
> > +	if (phy_interface_mode_is_rgmii(ethqos->phy_mode)) {
> > +		switch (speed) {
> > +		case SPEED_1000:
> > +			ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> > +			break;
> > -	case SPEED_100:
> > -		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> > -		break;
> > +		case SPEED_100:
> > +			ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
> > +			break;
> > -	case SPEED_10:
> > -		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> > -		break;
> > -	}
> > +		case SPEED_10:
> > +			ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
> > +			break;
> > +		}
> > -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> > +		clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> > +	}
> >   }
> 
> if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> 	return 0;

It is a void function, so no 0, but otherwise this does look less
invasive.

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
