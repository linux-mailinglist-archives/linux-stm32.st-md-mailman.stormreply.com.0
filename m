Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06EB8E21E
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Sep 2025 19:33:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D5E8C32EB0;
	Sun, 21 Sep 2025 17:33:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26278C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Sep 2025 17:33:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A09F601A3;
 Sun, 21 Sep 2025 17:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE141C4CEE7;
 Sun, 21 Sep 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758476018;
 bh=7YfsV2G99r80KQssVgIJbmMWK30nEvZ43WlPBGSS9xY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Y/aryhQCnJCNYHglVF1skKXdPHR3ip82tNfG7amdGWDwc5a0EVPCtukBDVm9qCIPk
 77ozaj6h5O46It0OOoeoiUTDJCea3+f9qEYA0R9gxNsydHdOe0i54uJIwq+IxgXqNc
 tTAXY32sZKrQQC1juDFSZw7JWcOIDhiIuFGuuoqzMMZzfNbhm/Ad/A5Hriv3n1zX24
 XS8x/Radi9W09C3ksC8zLD0r/Z1fZp1Gi3CAIu53sr9N6CkKa5WF3WS8XZyOPiIyx6
 BZYIEyH3UDyKKZaBbHQl9rsieo2UMmF5/VzrjHdPVCcmpBBenaikmhNLR5n/30f3jg
 1/RlDtyqdwa0A==
MIME-Version: 1.0
In-Reply-To: <20250625-upstream_rcc_mp21-v4-3-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
 <20250625-upstream_rcc_mp21-v4-3-9368a86c8515@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:33:36 -0700
Message-ID: <175847601668.4354.1665490967315325613@lazor>
User-Agent: alot/0.11
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v4 3/3] dt-bindings: stm32:
	cosmetic fixes for STM32MP25 clock and reset bindings
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

Quoting Gabriel Fernandez (2025-06-25 02:07:26)
> - drop minItems from access-controllers
> - remove rcc label from example
> - fixes typos
> - remove double '::' from 'See also::'
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
