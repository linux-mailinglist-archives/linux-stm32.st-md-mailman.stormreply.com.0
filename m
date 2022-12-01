Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB74263F02D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 13:09:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66537C65E59;
	Thu,  1 Dec 2022 12:09:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28463C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669896581; x=1701432581;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=c2A3JlbdQzPIBwuXqYqtYZK3Lxugj8gZL6mBVUWZu0s=;
 b=RH9c5fYZhZONoNSmBfCaRc2NiWVBSI/pQrI5+wknRIdVwLNzy45CUipf
 W/zfO/cLx5j/t0FDBqS+lZ0xci4EE76SM6UUk8I3RK49p7s4GbCIRGs89
 p7+nEy1yHSiEhZ06qO+QSvwdb16dktS3XbG089DhdL41n5sX3RY3lYIGo
 foXzdYXPpZ+XytqSl/Ifxl3ISckXMAHt285d0bURAR7sIMOTjA5UdcfhI
 VR8wGjeCE7FADe8Ludv+jMMmon8XMR/cQgoyf0OANhvDDtu374eNTFb2E
 beNaJLzToG0jSGD2uK2qN20m99K8Bq7+Y3eoH4RPptBP8w+5/Vk0pKkvc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313298011"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="313298011"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 04:09:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="595042881"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="595042881"
Received: from akoroglu-mobl.ger.corp.intel.com ([10.251.212.165])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 04:09:35 -0800
Date: Thu, 1 Dec 2022 14:09:32 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
In-Reply-To: <20221201110237.7917-4-cniedermaier@dh-electronics.com>
Message-ID: <2d909d7f-9c6-474-ce15-76a55fdafed3@linux.intel.com>
References: <20221201110237.7917-1-cniedermaier@dh-electronics.com>
 <20221201110237.7917-4-cniedermaier@dh-electronics.com>
MIME-Version: 1.0
Cc: marex@denx.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-serial <linux-serial@vger.kernel.org>, Alexander Dahl <ada@thorsis.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@dh-electronics.com,
 krzysztof.kozlowski+dt@linaro.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V3 4/4] serial: stm32: Add support for
 rs485 RX_DURING_TX output GPIO
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

On Thu, 1 Dec 2022, Christoph Niedermaier wrote:

> If a RX_DURING_TX GPIO is defined by the DT property "rs485-rx-during-tx-gpios"
> this patch switches this GPIO accordingly to the RS485 flag RX_DURING_TX in user
> space. Controlled by this GPIO, now the hardware is responsible for connecting
> or disconnecting RX during TX.
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> ---
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Alexander Dahl <ada@thorsis.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: kernel@dh-electronics.com
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-serial@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Rework of the commit message
> V3: - No changes
> ---
>  drivers/tty/serial/stm32-usart.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index a1490033aa16..0f2cca9054ba 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -226,7 +226,14 @@ static int stm32_usart_config_rs485(struct uart_port *port, struct ktermios *ter
>  
>  	stm32_usart_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
>  
> -	rs485conf->flags |= SER_RS485_RX_DURING_TX;
> +	if (port->rs485_rx_during_tx_gpio) {
> +		if (rs485conf->flags & SER_RS485_RX_DURING_TX)
> +			gpiod_set_value_cansleep(port->rs485_rx_during_tx_gpio, 1);
> +		else
> +			gpiod_set_value_cansleep(port->rs485_rx_during_tx_gpio, 0);

gpiod_set_value_cansleep(port->rs485_rx_during_tx_gpio,
			 !!(rs485conf->flags & SER_RS485_RX_DURING_TX));

And the same comment also for the other patch.

-- 
 i.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
