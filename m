Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CC816385
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 00:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2280C6DD6F;
	Sun, 17 Dec 2023 23:53:26 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD8DEC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 23:53:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3AEDACE0B2A;
 Sun, 17 Dec 2023 23:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C22EC433C8;
 Sun, 17 Dec 2023 23:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702857203;
 bh=sgxwfsweJRuqYU5fL/zEBQhjR1M4/d2P7ekPhOvmAVg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mVZTe05uw2KFjrFpifEAM1LxSmxnYK+vbZD/uS7DWtUoiGA7SAkoOey0hyKbrWJAx
 iw70oHJ1r6RXVeY+ekY6R67wnHxq9qGVkplD5bz929CKQXpnha9JKNxL02yJDRmH9G
 SiB+2QEKPiuVVbC0ZaLzQ3D9ZPEiquXt29XYg1oCpKSsoTRlRJOEuh+Ylz2Vbj8Tyz
 2nD+KFU0yvIkUojXRLN4tx4gJsMxWsNwNxLr6iujuD+JEM5AH5ghKrP1kRp00H1eOM
 PWf433SWcUeMDkTFpgwS6RiLPigIKPhQkzoX8iBm2GHZLonPI08jcwgJJJ/qzQH50A
 q9hwwAGw6/hoA==
Message-ID: <67c89fcb076df1ba5332c8840eb01dfc.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231208143700.354785-2-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
 <20231208143700.354785-2-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:53:20 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 1/5] clk: stm32mp1: move stm32mp1 clock
	driver into stm32 directory
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

Quoting gabriel.fernandez@foss.st.com (2023-12-08 06:36:56)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Move all STM32MP clock drivers into same directory (stm32).
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
