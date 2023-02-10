Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D4692BA1
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 00:47:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B3A1C6A5ED;
	Fri, 10 Feb 2023 23:47:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 394C6C6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 23:47:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFCF961EE1;
 Fri, 10 Feb 2023 23:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCCCC4339E;
 Fri, 10 Feb 2023 23:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676072857;
 bh=FTEJ1LeeYmmFvhz4itASSDMXhG4c75kxu1g9nTybyEo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=L7DIZ4KD9qqjN1g23JsevfTcOnKNm12ThzT1YOuPrKMVpFzn+CgybLz3VhRIfzBI2
 zXVIPqWgDLtlkXH4dCIHT/ikZedLiUg/QnEUMLgpUry2Zzxk2ZVcaOIKzKpOqcV5QM
 jCnrPFnUppdLk9OlrPKugWlWbBuQnXUuP/ciIwoLcyH1ZjmvaIr+iBLAbO4duawUuA
 Vm2v6vzKZoofPClCTYFJnLqF0r4+I+rZHV77HJPSC2+m4yU3Pr0CWmfkK4Gq+N504W
 B4uKPFBwWVchzip71CL2SMe1M8TSabH/voSo/bH4F5D7T/80bJlyVVBRFBWxpwdu/t
 +B5HF6A0DbE5Q==
Message-ID: <22ae4fe886dfac25f805df659a11d522.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230209091659.1409-11-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-11-avolmat@me.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alain Volmat <avolmat@me.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amit Kucheria <amitk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 David S . Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Paolo Abeni <pabeni@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rafael J . Wysocki <rafael@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Zhang Rui <rui.zhang@intel.com>
Date: Fri, 10 Feb 2023 15:47:35 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: Re: [Linux-stm32] [PATCH 10/11] dt-bindings: clock: remove stih416
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

Quoting Alain Volmat (2023-02-09 01:16:58)
> Remove the stih416 clock dt-bindings since this platform is no
> more supported.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
