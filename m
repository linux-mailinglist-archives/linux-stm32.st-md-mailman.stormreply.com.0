Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2432A876
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 18:44:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5C7FC56638;
	Tue,  2 Mar 2021 17:44:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F5F4C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 17:44:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Hg4EI029636; Tue, 2 Mar 2021 18:44:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AIIENbd8XJBrwtDccNfZiND92r0txJ7IKAeeaDH+8kI=;
 b=5Vsnol/QyAmRTbkR4R1MWGIcRcMhwWpMHQU0fmxI3BpiLWmEquYeXsFYnVPKU9DVZdXx
 vX0cK+SJNkxmo+49VbOd94g3Eiqrbd40r9tIvXbjIDLkZ+31aCm/r0QV1WWxFL2hmcHJ
 fkkHRru9Tv6HYJ2R6GqjxbrauEk1mC7Ih51buEJesoVejqQ4aU9HzPnXfTqkSnlCPi2x
 QkUhDO22Ch9dT674YCIHMffwTl76t57ZKvUaAuP0y1MH2CjLT7ds2RAltxi2DeuTQlfp
 fYQ8v5NhIo9x9LSw5NI66nkpJhxYtMtNmzdSDgdckUFtvZQUPoRUFkL3AZeEwHOkZ9Nd nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdy3p9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 18:44:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B3E810002A;
 Tue,  2 Mar 2021 18:44:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD6BD21FE91;
 Tue,  2 Mar 2021 18:44:27 +0100 (CET)
Received: from [10.211.13.170] (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Mar
 2021 18:44:26 +0100
To: Martin Devera <devik@eaxlabs.cz>, <linux-kernel@vger.kernel.org>
References: <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
 <20210302131558.19375-1-devik@eaxlabs.cz>
 <20210302131558.19375-2-devik@eaxlabs.cz>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <aeefa74e-fa19-6c31-5240-0f14fca89298@foss.st.com>
Date: Tue, 2 Mar 2021 18:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302131558.19375-2-devik@eaxlabs.cz>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] tty/serial: Add rx-tx-swap OF
 option to stm32-usart
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

On 3/2/21 2:15 PM, Martin Devera wrote:
> STM32 F7/H7 usarts supports RX & TX pin swapping.
> Add option to turn it on.
> Tested on STM32MP157.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> ---
>  drivers/tty/serial/stm32-usart.c | 11 ++++++++++-
>  drivers/tty/serial/stm32-usart.h |  5 +++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index b3675cf25a69..d390f7da1441 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -644,6 +644,12 @@ static int stm32_usart_startup(struct uart_port *port)
>  	if (ret)
>  		return ret;
>  
> +	if (stm32_port->swap) {
> +		val = readl_relaxed(port->membase + ofs->cr2);
> +		val |= USART_CR2_SWAP;
> +		writel_relaxed(val, port->membase + ofs->cr2);
> +	}
> +
>  	/* RX FIFO Flush */
>  	if (ofs->rqr != UNDEF_REG)
>  		stm32_usart_set_bits(port, ofs->rqr, USART_RQR_RXFRQ);
> @@ -758,7 +764,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
>  	cr1 = USART_CR1_TE | USART_CR1_RE;
>  	if (stm32_port->fifoen)
>  		cr1 |= USART_CR1_FIFOEN;
> -	cr2 = 0;
> +	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;
>  	cr3 = readl_relaxed(port->membase + ofs->cr3);
>  	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
>  		| USART_CR3_TXFTCFG_MASK;
> @@ -1006,6 +1012,9 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
>  			return stm32port->wakeirq ? : -ENODEV;
>  	}
>  
> +	stm32port->swap = stm32port->info->cfg.has_swap &&
> +		of_property_read_bool(pdev->dev.of_node, "rx-tx-swap");
> +
>  	stm32port->fifoen = stm32port->info->cfg.has_fifo;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
> index cb4f327c46db..bd18dd1c1bcd 100644
> --- a/drivers/tty/serial/stm32-usart.h
> +++ b/drivers/tty/serial/stm32-usart.h
> @@ -25,6 +25,7 @@ struct stm32_usart_offsets {
>  struct stm32_usart_config {
>  	u8 uart_enable_bit; /* USART_CR1_UE */
>  	bool has_7bits_data;
> +	bool has_swap;
>  	bool has_wakeup;
>  	bool has_fifo;
>  	int fifosize;
> @@ -55,6 +56,7 @@ struct stm32_usart_info stm32f4_info = {
>  	.cfg = {
>  		.uart_enable_bit = 13,
>  		.has_7bits_data = false,
> +		.has_swap = false,

Hi Martin,

Only one minor comment from me here. No need to add a false (zero)
initialization in this struct. I'm not sure why this is the case for the
has_7bits_data here...

With that fixed, you can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks for your patch,
Best Regards,
Fabrice

>  		.fifosize = 1,
>  	}
>  };
> @@ -76,6 +78,7 @@ struct stm32_usart_info stm32f7_info = {
>  	.cfg = {
>  		.uart_enable_bit = 0,
>  		.has_7bits_data = true,
> +		.has_swap = true,
>  		.fifosize = 1,
>  	}
>  };
> @@ -97,6 +100,7 @@ struct stm32_usart_info stm32h7_info = {
>  	.cfg = {
>  		.uart_enable_bit = 0,
>  		.has_7bits_data = true,
> +		.has_swap = true,
>  		.has_wakeup = true,
>  		.has_fifo = true,
>  		.fifosize = 16,
> @@ -271,6 +275,7 @@ struct stm32_port {
>  	int last_res;
>  	bool tx_dma_busy;	 /* dma tx busy               */
>  	bool hw_flow_control;
> +	bool swap;		 /* swap RX & TX pins */
>  	bool fifoen;
>  	int wakeirq;
>  	int rdr_mask;		/* receive data register mask */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
