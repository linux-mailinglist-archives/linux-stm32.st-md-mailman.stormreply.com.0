Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71EA01FD1
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 08:21:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59CDCC78013;
	Mon,  6 Jan 2025 07:21:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA05C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 07:21:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EBFDF5C5579;
 Mon,  6 Jan 2025 07:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B093C4CED2;
 Mon,  6 Jan 2025 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736148109;
 bh=Z0Wk35+tGl/QBB1rWY7uIN47MRruJiSyWdDTUtrLcYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1fGTVcdsjRaZtGGJVvqAgZ6nshb7+HPYRXiogbi3MWDv9UX2F32HRz3ablznrzBe
 6faWiRQll411RYkkh9TfqvzdQDGdvWDELTMEG3vwhhyeK+m2WBRaGbFr8eVXHAAIoz
 ou5CBXaaK8J0X2fukZbfb9jK4vKp8OtHbvp/9Qn4NHA0WEXE1apknZ+wxgn6naAwM9
 FYoONhONDv9GKCRqw3exeSUMA4CZApQb4at4S5vqzvaYn1bVYhGWrK1twIywzoyQ+O
 LPw1/lysTmHBRi3a1u2cgrY5AlDbdq84xIFmbh4G6ghwlJ2UE5L/5Hb+4fcOPXadDJ
 lbw254AeHIu7A==
Date: Mon, 6 Jan 2025 08:21:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ozqeggxydhuiddnxkkftu2xeqxp5omoluada5ra5aecieuwc3n@njhepvhd3y7x>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/6] dt-bindings: clock: stm32fx: update
 reference due to rename
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

On Sun, Jan 05, 2025 at 07:14:15PM +0100, Dario Binacchi wrote:
> With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
> let's fix it.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32fx-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK, you introduce bugs and then immediately fix them just to have some
patch count?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
