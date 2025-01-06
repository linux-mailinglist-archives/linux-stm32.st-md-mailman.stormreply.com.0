Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 008B0A0337D
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 00:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0600C78013;
	Mon,  6 Jan 2025 23:48:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DDDDC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 23:48:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E3FB4A41F22;
 Mon,  6 Jan 2025 23:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D870C4CED2;
 Mon,  6 Jan 2025 23:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736207299;
 bh=tk3HDO1RXmeaTn7h2NrgJSeAsieiLy4mYuakR1M3QUM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tW/AKC6rNfoqOpvbWeLnrdjUDMiKmSwl4o1aQoVgYauhNo+xou3nvavqPDWZkDa31
 511k/EZe95NFxJUXku6B0yMdmCeVEOIXh0qwoyiERB6kDx2e1JCB7TGpZghX/npBf1
 8hGUNVt/NvC15uni0XXfzmGIu9o2o5PerRJNlJ5ETOzvEJbVgeW0XzB0sUJ1i7vTFb
 MkXNG35uMqtH3krjS6gLEdfF1sYZT3JHF2weYHaQpoKR636ZElQqJE6DvmgvVsV8Ko
 MMz7fthSGcYAAxscWvzO18NA/vYKsj2Zt6EpOTKEZmlWjlvV6P2yw0gXNQwnBb+4xl
 +2obtLht1PDPw==
Message-ID: <c35f062bd6a9310df7bd5b5e3ac4cd24.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
 <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 15:48:17 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: clock: st,
	stm32mp1-rcc: complete the reference path
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

Quoting Dario Binacchi (2024-12-31 07:01:41)
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
