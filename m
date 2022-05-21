Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA752F841
	for <lists+linux-stm32@lfdr.de>; Sat, 21 May 2022 06:14:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE5EC03FEB;
	Sat, 21 May 2022 04:14:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D4DC03FD1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 04:14:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA6D760109;
 Sat, 21 May 2022 04:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43926C385A5;
 Sat, 21 May 2022 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653106487;
 bh=7gM14UvdWAoUM3vw+F70R7QTBfcPO+x3EXyC2ksiP5Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=H7qk/Ipgntr4U5EYaEa7XRNb4Of6ZBLxywWEQnHa1IfWDXEIt3SXD8GOEAdTcjRwD
 Ox/E3yTX77qLt1NTywtdGcq3IQJ1ZTcBVUjfI4SCVm7xnWiOkntglcA+pmGrwJRENx
 2K4I93WFtEum6dngyCADKlzLR5oDtzakknb/0EOdXraGxkPXz6VbJaSq7FGSQyMj6B
 Zt4ubXp7Cfyrig5oc5dhcESk3q7fwaq6RrkdV70z7oernbvYWHMscoaT3c7l583vRr
 QExx+RT3e2Jw6Zu/0B28RPcYLz7seM6phnCq+nwFysCH8witjVh07ekVlWfzRpnl3d
 4NQ+ZFopRwQlg==
MIME-Version: 1.0
In-Reply-To: <20220516070600.7692-2-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com>
 <20220516070600.7692-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 May 2022 21:14:45 -0700
User-Agent: alot/0.10
Message-Id: <20220521041447.43926C385A5@smtp.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 01/14] dt-bindings: rcc: stm32: add new
	compatible for STM32MP13 SoC
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

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:47)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> New compatible to manage clock and reset of STM32MP13 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
