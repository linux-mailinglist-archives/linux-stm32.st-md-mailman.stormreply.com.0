Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 309409FC625
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Dec 2024 18:38:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF368C78F67;
	Wed, 25 Dec 2024 17:38:28 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 497FBC78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Dec 2024 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=hvdB94uGuCDDuV6epOSyj5t+hu3BSU5GxftGA2HKkN8=; b=y6TFPv/QFV/2euxYDzjACJ+lfX
 4wWj+d17x+R3uO/CWPu8+vtFsTxKvShez12pG1jdB21OCavTShkwZXyQthYMLlbiDGC+7Aexi1Eg9
 9tEZGKslGYt3d1grb29EkB88MckIVtr9vvUGXOuMnoWHS3oJ1/88JIGPMy18515DCvJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tQVKb-00G9ut-QF; Wed, 25 Dec 2024 18:38:01 +0100
Date: Wed, 25 Dec 2024 18:38:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
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
Subject: Re: [Linux-stm32] [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable
 RX programmable swap on qcs615-ride
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

On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
> The timing of sampling at the RX side for qcs615-ride needs adjustment.
> It varies from board to board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -206,6 +206,7 @@ &ethernet {
>  	phy-handle = <&rgmii_phy>;
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
> +	qcom,rx-prog-swap;

I notice this board still has messed up rgmii delays, using phy-mode =
"rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
delays? Is the sample point logic before or after the rgmii delay
logic in the MAC clock pipeline?

I think i also questioned max-speed = <1000>. Has this
arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
