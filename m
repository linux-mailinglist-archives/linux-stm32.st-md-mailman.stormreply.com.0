Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EA83E33E
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 21:19:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64EACC6DD70;
	Fri, 26 Jan 2024 20:19:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47A78C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 20:19:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 98107CE3782;
 Fri, 26 Jan 2024 20:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C85C433C7;
 Fri, 26 Jan 2024 20:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706300369;
 bh=awpRcgfVITqJmr4m6h4D7QiLDSW/PQz0VRDDLkPva8Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=itgfnOi4w6ElrBtPlbwuYXt71w4C7FIgEdFIdykJMv2Tu/jW8Ums3HKR64Hl1v48o
 YxQ0t5yC9Lfg3pfiobJ7IlXjPeLofQVmw8PiR2mqxQQKGaip8sPjNNk+od/1Fe2Lyc
 yoJZJ33BUdCEV3fwOZCWHuvrUEDXC6c19kPHOFv8WfLBqDHsj6CwxRZwDo7RMY0Y1/
 qRIeTFzLCrJD9QBQZ47+XsD2UR1gYLLhhStXkMQ6VRaXcMkXb6L9UR7/LZcQO3xl5w
 6MuD9tVdSVx56gTAuwxVJ1h2AeHMLQm2YvlrEMHDnHhv6FAioR2rzf8XeIRqhvgZch
 YlFCZ4monKulQ==
Date: Fri, 26 Jan 2024 12:19:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: rohan.g.thomas@intel.com
Message-ID: <20240126121928.48a44327@kernel.org>
In-Reply-To: <20240126173634.13162-1-rohan.g.thomas@intel.com>
References: <87msss4gtj.fsf@geanix.com>
 <20240126173634.13162-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 robh@kernel.org, netdev@vger.kernel.org, esben@geanix.com,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: Time Based Scheduling
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

On Sat, 27 Jan 2024 01:36:34 +0800 rohan.g.thomas@intel.com wrote:
> > The tricky part here is that the whole devicetree bindings story for the
> > stmmac driver is filled with such configuration choices. As such, it is
> > only natural to add the property you are suggesting here. I completely
> > agree. But you can also argue that it is "wrong", because it does not
> > just describe the hardware, but also a configuration choice.  
> 
> Isn't this requirement of using enhanced tx desc instead of normal tx
> desc to support TBS is specific to Synopsys IP? Switching from
> normal desc to enhanced desc at the time of tc-etf qdisc offload
> cannot be done without traffic disruption, which I don't think is
> acceptable. Since this behavior is IP specific, can we consider
> this as an OS configuration choice?

Why is traffic disruption not acceptable when TBS gets turned on?
User has to install the right qdisc to enable TBS, I presume,
installing qdiscs destroys the old ones which also leads to packet
drops.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
