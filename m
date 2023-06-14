Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FD73023B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 16:47:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE1F6C6A617;
	Wed, 14 Jun 2023 14:47:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49F06C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 14:47:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18C3D6431D;
 Wed, 14 Jun 2023 14:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB20DC433C9;
 Wed, 14 Jun 2023 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686754059;
 bh=YBvoPI/IEVtbY5FNxrgQvaHMUweYY58AfZfxW/FUfzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3LNvXuGGMNQtEoM1FFIbIMA86EOKQwXEt+3tALeKxbJwddDvByyh87z716lOdEGC
 ay6V6UsAWKdIpfQeOHUTj6uRCRuxoBSQ/ETGAidKLmmAZaEKJNYu7cWBppubt22OZZ
 qs7CsgD6eYxPn/6tp8A8zc/IMx9Wwqni4eq6r2HIflQzfEAn2bw6+gBVmE50N1J2VT
 xdtONfXgAZr/MN4pOsv/pIk3cO5LxiMXaxi73cLALIFbTrJFx3D++N+lWZ75xNd4yO
 zo3zVf4keiHIC1Lp+4V1UkRY9UGYRsboF0z0HH6nx3D0gBBtowUDJNQ1wU4JmuqIAX
 iiI/VHltBNFtQ==
Date: Wed, 14 Jun 2023 07:51:00 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230614145100.xgkme7or7k2i552d@ripper>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-25-brgl@bgdev.pl>
 <0a57a9ad-67ab-cf1a-9bb7-c645de833450@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a57a9ad-67ab-cf1a-9bb7-c645de833450@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 24/26] arm64: dts: qcom: sa8775p-ride:
 enable the SerDes PHY
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

On Tue, Jun 13, 2023 at 09:02:23PM +0200, Konrad Dybcio wrote:
> 
> 
> On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Enable the internal PHY on sa8775p-ride.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> ---
> 
> Bjorn, Krzysztof.. I was thinking whether we should even be disabling
> such hardware by default..
> 

I'm in favor of keeping the configuration as generic/common/simple as
possible. So I like your suggestion.

Regards,
Bjorn

> Things that reside on the SoC and have no external dependencies could
> be left enabled:
> 
> pros:
> - less fluff
> - we'd probably very quickly fix the missing PM calls
> - possibly less fw_devlink woes if we fail to get rid of references to
>   the disabled component?
> 
> cons:
> - boot times
> - slightly more memory usage
> 
> Konrad
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> > index ab767cfa51ff..7754788ea775 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> > @@ -355,6 +355,10 @@ &qupv3_id_2 {
> >  	status = "okay";
> >  };
> >  
> > +&serdes_phy {
> > +	status = "okay";
> > +};
> > +
> >  &sleep_clk {
> >  	clock-frequency = <32764>;
> >  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
