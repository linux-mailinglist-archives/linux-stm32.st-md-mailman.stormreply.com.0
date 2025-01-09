Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82024A07590
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 13:20:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8C8C78011;
	Thu,  9 Jan 2025 12:20:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29C12C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 12:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AE8BA41A34;
 Thu,  9 Jan 2025 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED65C4CED2;
 Thu,  9 Jan 2025 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736425210;
 bh=1y+/0y5Mn+3mmY+Rqdubf97qrdL5lDWfwQl+N0okVJU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bBTDpivSMWuijJnQh3u2XfH9P2b2E4ReENVkg276ScYNV8Ss+42DNVlNmjVmLQUr3
 apQ2/amP9GMMjCFtqCT61NPIdITDXPY3uOrt3IiBSUrkpuAmcy0AvW1rEVOc+6oMLA
 ML6onBd5rB0YzWtEyB5mMrqlq8WiKRlUfKdxN3y4+Ll6leBYD0RWQQi4rH3o/LhEJI
 RjkHYtHLgkgOIxn7mk1Zv5WdZ9OkR/GN+tYej1kiYzelwtXhPIVn3q7RGwH5N3NfTl
 5UJfKT0FaCYrZQ6CwtVlUj2LKCfvg1L7TLY0H/xKpSbZ3vOqp+CKpUsu6+e7STHpdg
 6GZHN7Aa/zmTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33DFA3805DB2; Thu,  9 Jan 2025 12:20:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173642523202.1303894.12707902460357622367.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 12:20:32 +0000
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank.Li@nxp.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 robh@kernel.org, opendmb@gmail.com, florian.fainelli@broadcom.com,
 khilman@baylibre.com, briannorris@chromium.org, o.rempel@pengutronix.de,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 kuba@kernel.org, s-vadapalli@ti.com, pabeni@redhat.com, dariobin@libero.it,
 devicetree@vger.kernel.org, conor+dt@kernel.org, grygorii.strashko@ti.com,
 martin.blumenstingl@googlemail.com, rjui@broadcom.com, kvalo@kernel.org,
 linux-can@vger.kernel.org, rogerq@kernel.org, mkl@pengutronix.de,
 linux-amlogic@lists.infradead.org, mailhol.vincent@wanadoo.fr,
 neil.armstrong@linaro.org, sbranden@broadcom.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, christophe.roullier@foss.st.com,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Correct
 indentation and style in DTS example
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  7 Jan 2025 13:56:13 +0100 you wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: Correct indentation and style in DTS example
    https://git.kernel.org/netdev/net-next/c/9d8c354a56e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
