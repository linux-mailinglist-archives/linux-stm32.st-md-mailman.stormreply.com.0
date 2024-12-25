Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7D9FC604
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Dec 2024 17:18:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53912C78F67;
	Wed, 25 Dec 2024 16:18:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DE71C78F66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Dec 2024 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=01kBf3ZtYZAZFdW30J7jiQp5pkxNM+rlULdLXVbsmjE=; b=54rP/aYGBYh8A8aCGPa5oma5ks
 W1mmnUrePT7UYznxMeofwh5KUQe+EKmTZbiP73w3lOAyCBboknBoPgwAV0zk/vis8auWd9+HRTJdH
 ZrI8szYrO5oHeVcSuKJ5bjwxM4ShRpkibJg9KzL0/hj8iVg++6QGMhrmppBDJ2aHywOc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tQU57-00G958-AA; Wed, 25 Dec 2024 17:17:57 +0100
Date: Wed, 25 Dec 2024 17:17:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Message-ID: <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: qcom,
 ethqos: Drop fallback compatible for qcom, qcs615-ethqos
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

On Wed, Dec 25, 2024 at 04:58:20PM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
> > On 24/12/2024 04:07, Yijie Yang wrote:
> > > The core version of EMAC on qcs615 has minor differences compared to that
> > > on sm8150. During the bring-up routine, the loopback bit needs to be set,
> > > and the Power-On Reset (POR) status of the registers isn't entirely
> > > consistent with sm8150 either.
> > > Therefore, it should be treated as a separate entity rather than a
> > > fallback option.
> > 
> > ... and explanation of ABI impact? You were asked about this last time,
> > so this is supposed to end up here.
> 
> I actually replied to this query last time, but maybe it wasn't clear.
> Firstly, no one is using Ethernet on this platform yet. Secondly, the
> previous fallback to sm8150 is incorrect and causes packet loss. Instead, it
> should fall back to qcs404.

One of the purposes of the commit message is to answer questions
reviews might have. You were even asked this question, so that should
of been a clue to include the answer in the commit message.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
