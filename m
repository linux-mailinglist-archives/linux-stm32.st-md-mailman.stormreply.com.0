Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F4B33E0D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 13:31:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2776C36B3E;
	Mon, 25 Aug 2025 11:31:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 098BBC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 11:31:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B01DC40B8D;
 Mon, 25 Aug 2025 11:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE62C4CEED;
 Mon, 25 Aug 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756121473;
 bh=OgbR/W4gItCa2yQLXixaqQP3APnO9bdaKfA3LJBQfCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L/bp8JiSSu+DlgC5Jlw27azJqw5qLfIPDzMWuWAVBFPdKWEEDCulvu0L+jZv6fqfs
 8t/v6LSdy7Eo44fugSbuHh85J3k7JnIBwt4hbQMAAr5kmbgIN+Y1HaadG7wACwCM32
 Uk01Y6fBU95g41Qx4lOb75wliUbj41wOVpN4415IB84qZot8lJoPgwvH1qqse6qsVv
 ZSxCqjrUCOwcZFqTFWpBvo4CZqbQhuJBAAkGHz4Fp+7DlHCIqeE+Tj2g9ES2VT5JWw
 iY8BLMV9Ej4+JIfEV2QrNjEVEdzfAQMicwOeUVuk94uDqkSzX6Bh9HQpcwPQe487Bh
 iv1JIsfuKy/HQ==
Date: Mon, 25 Aug 2025 12:31:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <20250825123100.43d8c4ff@jic23-huawei>
In-Reply-To: <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 03/10] iio: dac: Drop unnecessary -ENOMEM
	messages
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

On Fri, 22 Aug 2025 09:19:51 +0530
Dixit Parmar <dixitparmar19@gmail.com> wrote:

> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  drivers/iio/dac/ad5380.c     | 4 +---
>  drivers/iio/dac/ad5764.c     | 4 +---
>  drivers/iio/dac/ds4424.c     | 4 +---
>  drivers/iio/dac/ti-dac7311.c | 4 +---
>  drivers/iio/dac/vf610_dac.c  | 4 +---
Raced with another series doing a dev_err_probe() conversion and the relevant
lines are gone.

I'll fix up.

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
