Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5780A01FCC
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 08:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A3AAC78013;
	Mon,  6 Jan 2025 07:21:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4159BC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 07:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0EB65C5579;
 Mon,  6 Jan 2025 07:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4512C4CED2;
 Mon,  6 Jan 2025 07:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736148078;
 bh=W20Hpo9wQCcQIFLLeltlonfqTa4Q0wWoCnzBw4PzpZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NV8SptgvVpNqK/EG4gHBR8AbU0WvErYoh4ZDYKbFw7HorgAFRo5JrVOtUD9Y5wX/g
 h8aknVp3HmD4PTpqHvTTKtvCrv3lq9Ic9XdlNKxSzXFYN98mHEbVJ2ntgP/xSNaAdn
 ZVLJUt0PfTc9bx52vO4QBhi0DxlaO8xGogQHAUvNUY9CfB5cyp968iHwWO0qmRN8ob
 PgwprwkvEuXzKQs4TnOLXE98rBMR/He0UbODX/rQf5AwduSM+nLo2m4BWkChNitqXG
 NstOB4xKZGYn87CTun8Obv+w/uyCQdmpNt7/eZNAk091mUlYG1ZdGbcQXO+Mk0syXE
 AKPaQYBCGUQiw==
Date: Mon, 6 Jan 2025 08:21:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <53g3kssqc4jdz77iiwxvy6fbwha2ukrjh7s7u3upltmpjtp2y6@2gcbhg7n5kle>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: reset: st,
 stm32-rcc: update reference due to rename
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

On Sun, Jan 05, 2025 at 07:14:14PM +0100, Dario Binacchi wrote:
> With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,

So you introduce broken code to fix it in next patch?

> let's fix it.

Please stop splitting patches in some weird, either non-bisectable
or artificial way. How this can be a separate patch?

It's the second patchset recently doing such incorrect splits.

Please read submitting patches how to organize your patchset.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
