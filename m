Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8A9496F4
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 19:35:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD74C71290;
	Tue,  6 Aug 2024 17:35:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55FA1C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 17:35:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F2EE4610A1;
 Tue,  6 Aug 2024 17:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBBBC4AF0E;
 Tue,  6 Aug 2024 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722965721;
 bh=sbFiD0UTPz3Xhgo7u+pcibnbth29PoEv4oSZWuoSTH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AraJaUcKzqP3jBmRFw6xv4VnTrnEVv1aMvKj0UsGZVEII5DF5HuwCnr7knf3XnQns
 rGNx6IM+xauv2tAmu3bgXTiYlquGu3Rlgl1Aug6P7gqabxD/ZdnN1xxJewPvM4FjC5
 J7M15LPoteevpcLEvidwur5kSOEmiHcEKRXZAkyxqsOlV1e6syhXlwJ3zMjU20Av48
 LswP5i2igU9+OlMAaDpL0rOMJUrMFDv3RwF/UrbSkMNiqBskdCE5w0geB6Y7r2g+vG
 aOcB8T5te3zffbvfnUKz57/V6bXG786oDFRNVZPrw8GdMQq2QIh2VS6GJBI2HdsQqd
 bq1OZqSiR54pQ==
Date: Tue, 6 Aug 2024 11:35:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Message-ID: <172296571928.1850493.16580227879384063021.robh@kernel.org>
References: <20240802173918.301668-1-detlev.casanova@collabora.com>
 <20240802173918.301668-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802173918.301668-3-detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: net: Add rk3576 dwmac
	bindings
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


On Fri, 02 Aug 2024 13:38:03 -0400, Detlev Casanova wrote:
> Add a rockchip,rk3576-gmac compatible for supporting the 2 gmac
> devices on the rk3576.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
