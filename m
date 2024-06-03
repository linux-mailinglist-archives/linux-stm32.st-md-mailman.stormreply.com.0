Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD78FA397
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 23:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F209C6B47E;
	Mon,  3 Jun 2024 21:36:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38E96C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 21:36:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 295ADCE0F6D;
 Mon,  3 Jun 2024 21:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC78C2BD10;
 Mon,  3 Jun 2024 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717450614;
 bh=0TacpChjWF6BZ+mwmy7iO27gmbgjpFbCq69+FboeDeU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MVozPV++vnGOvooQjEWhNJ+/rWZiL2MiN1OXLujIYp80JiyZwaGwEOLRgyL6Yzezf
 P5ly0bbePi2wWKvK/SVlhX1WsqG0awWZ99EMpwH30a6WLJArmpgjp//DZ1asJMEt3p
 RyeU08K2ie+UbyC0d1FFERIsz/0NG8XRaE5fTysK77iPOprVvVbyRbwTdL5QSi76A+
 H18ipg2ty6FqmEgQ3hTAgCFQcKfwcFQCgUU73bngsAzi9NaPUHwFQR8ICQBiN/92OW
 JM1TTCKD0X9YF1urWtKB23swqBN6lMyymHlIzbVvryPNXwo6c4qFjIu9L804SKgfUU
 d+m6TzWEKhF4g==
Message-ID: <0193c984c16103e4fb517c5791642673.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240529131310.260954-3-gabriel.fernandez@foss.st.com>
References: <20240529131310.260954-1-gabriel.fernandez@foss.st.com>
 <20240529131310.260954-3-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.or6g>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Date: Mon, 03 Jun 2024 14:36:52 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 2/3] clk: stm32mp25: add
	security clocks
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

Quoting gabriel.fernandez@foss.st.com (2024-05-29 06:13:09)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Add ck_icn_p_iwdg1, ck_icn_p_pka, ck_icn_p_rng, ck_icn_p_saes,
> ck_icn_p_serc clocks.
> They could be configured for non secured world.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
