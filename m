Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B79FF6DC
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2025 09:26:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B83EC78032;
	Thu,  2 Jan 2025 08:26:08 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D42B3C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2025 08:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D575DA40F02;
 Thu,  2 Jan 2025 08:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E9EC4CED0;
 Thu,  2 Jan 2025 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735806365;
 bh=a/jkkhb22rDc0sD75YrgckrNRNFXB+uJYJPu/qpNb34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJIduz3j/Mgsc+RQLc2lRQPnBT3B2RDVJm/v94aXsLOaj5plXcXia+0kQ+H0BoGo+
 g9MA7qg0yRsm5cX4rTyksx67XUKH80Tr17YM9IWqKUKyAkJdR3HYgy2+7vnQnAqO1w
 tobC0mH2jpwTUCT+Afehy+yopQeNNPqHXbPzGvY4d6/kLLWzVWFfYun/LJ1rr7kwKn
 UgI3PIeztxP9Il6HKi5qfFRzwGFSTl7vYpr+VVh6eLA3kF9I3wV7M4OOmNZ3oup/xu
 k05ZAmB1jN4UhvOsAe33F4RKoWOHWYYqLga/nYDdYgIA0K3G1UI8bGISk2LlvS9COX
 3Dwxc0Ntoor8g==
Date: Thu, 2 Jan 2025 09:26:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <gtisijd2uxatrfu6yppkv4zeddilmsxjoqiaugxqregfyqgbed@4dryamubwyqx>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
 <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-2-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 31, 2024 at 04:01:41PM +0100, Dario Binacchi wrote:
> All other paths referenced in the file follow a scheme starting from the
> Linux root. The patch adjusts the single file that deviated from this
> scheme, making it consistent with the others.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
