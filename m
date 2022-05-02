Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418A516C4E
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 10:44:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACC89C628A9;
	Mon,  2 May 2022 08:44:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1355AC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 08:44:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2427ifsc018835;
 Mon, 2 May 2022 10:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sQ244dn7vjmexo5macp2kveUCjJBaKFtvuCJORvE5yE=;
 b=8J2ZHAYL+ICcb/zOET5vN0aEawXv3Q5AXmR2fpiwTVI/qswZgsnIX4jwhL9mb/+yIFAQ
 mYHu4kFkCyAPiCqM4WIfhrbZRnHrTS7tssje/3rUfg3xyIdjeDaKXkXhf80ydrqHla74
 MOHsPUu7gKkvZg0asZ+kGQsJWJhYqQp54beYsBFnus75ttvgtU37xkdBFil3d09fw53o
 hZtHX9d3Dk3/3+ibRD7Mc5EFYMSd2zlEVCSQuxtaow8xmbbjKx3wfLy6GSipTLOkgj4h
 Co31IxtfB4D9d8ZPexXlMFJzfSRgXNOBZUe64lHl7NTQI9KXB2+DGAOx/5rBXa2gvaNF Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0fyud9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 10:44:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27E7F10002A;
 Mon,  2 May 2022 10:44:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 209392138FF;
 Mon,  2 May 2022 10:44:17 +0200 (CEST)
Received: from [10.201.21.169] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 2 May
 2022 10:44:16 +0200
Message-ID: <702dcede-ff97-b074-20bf-7c695f988d40@foss.st.com>
Date: Mon, 2 May 2022 10:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-serial@vger.kernel.org>
References: <20220430162845.244655-1-marex@denx.de>
 <20220430162845.244655-2-marex@denx.de>
From: Erwan LE RAY <erwan.leray@foss.st.com>
In-Reply-To: <20220430162845.244655-2-marex@denx.de>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_03,2022-04-28_01,2022-02-23_01
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] serial: stm32: Use TC interrupt to
 deassert GPIO RTS in RS485 mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek,

On 4/30/22 18:28, Marek Vasut wrote:
> In case the RS485 mode is emulated using GPIO RTS, use the TC interrupt
> to deassert the GPIO RTS, otherwise the GPIO RTS stays asserted after a
> transmission ended and the RS485 cannot work.
> 
Could you please add a cover letter to explain the rational of the first 
patch ? I understood the goal of the first by reading the commit message 
of this second patch.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jean Philippe Romain <jean-philippe.romain@foss.st.com>
> Cc: Valentin Caron <valentin.caron@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-serial@vger.kernel.org
> ---
>   drivers/tty/serial/stm32-usart.c | 42 ++++++++++++++++++++++++++++++--
>   drivers/tty/serial/stm32-usart.h |  1 +
>   2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index 224f359c6051e..764415b8e8f03 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -417,6 +417,14 @@ static void stm32_usart_tx_interrupt_enable(struct uart_port *port)
>   		stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TXEIE);
>   }
>   
> +static void stm32_usart_tc_interrupt_enable(struct uart_port *port)
> +{
> +	struct stm32_port *stm32_port = to_stm32_port(port);
> +	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> +
> +	stm32_usart_set_bits(port, ofs->cr1, USART_CR1_TCIE);
> +}
> +
I don't see the added value of this helper (only 1 instruction used 1 
time), and other Interrupt Enabled bits are already set/unset in others 
functions of this driver.
To keep an homogeneous code in the driver, could you please remove this 
helper and set TCIE directly when you need it ?

>   static void stm32_usart_rx_dma_complete(void *arg)
>   {
>   	struct uart_port *port = arg;
> @@ -442,6 +450,14 @@ static void stm32_usart_tx_interrupt_disable(struct uart_port *port)
>   		stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TXEIE);
>   }
>   
> +static void stm32_usart_tc_interrupt_disable(struct uart_port *port)
> +{
> +	struct stm32_port *stm32_port = to_stm32_port(port);
> +	const struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
> +
> +	stm32_usart_clr_bits(port, ofs->cr1, USART_CR1_TCIE);
> +}
> +
Same comment here.

>   static void stm32_usart_rs485_rts_enable(struct uart_port *port)
>   {
>   	struct stm32_port *stm32_port = to_stm32_port(port);
> @@ -585,6 +601,13 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
>   	u32 isr;
>   	int ret;
>   
> +	if (!stm32_port->hw_flow_control &&
> +	    port->rs485.flags & SER_RS485_ENABLED) {
> +		stm32_port->txdone = false;
> +		stm32_usart_tc_interrupt_disable(port);
> +		stm32_usart_rs485_rts_enable(port);
> +	}
> +
>   	if (port->x_char) {
>   		if (stm32_usart_tx_dma_started(stm32_port) &&
>   		    stm32_usart_tx_dma_enabled(stm32_port))
> @@ -625,8 +648,14 @@ static void stm32_usart_transmit_chars(struct uart_port *port)
>   	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
>   		uart_write_wakeup(port);
>   
> -	if (uart_circ_empty(xmit))
> +	if (uart_circ_empty(xmit)) {
>   		stm32_usart_tx_interrupt_disable(port);
> +		if (!stm32_port->hw_flow_control &&
> +		    port->rs485.flags & SER_RS485_ENABLED) {
> +			stm32_port->txdone = true;
> +			stm32_usart_tc_interrupt_enable(port);
> +		}
> +	}
>   }
>   
>   static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
> @@ -640,6 +669,13 @@ static irqreturn_t stm32_usart_interrupt(int irq, void *ptr)
>   
>   	sr = readl_relaxed(port->membase + ofs->isr);
>   
> +	if (!stm32_port->hw_flow_control &&
> +	    port->rs485.flags & SER_RS485_ENABLED &&
> +	    (sr & USART_SR_TC)) {
> +		stm32_usart_tc_interrupt_disable(port);
> +		stm32_usart_rs485_rts_disable(port);
> +	}
> +
>   	if ((sr & USART_SR_RTOF) && ofs->icr != UNDEF_REG)
>   		writel_relaxed(USART_ICR_RTOCF,
>   			       port->membase + ofs->icr);
> @@ -763,8 +799,10 @@ static void stm32_usart_start_tx(struct uart_port *port)
>   {
>   	struct circ_buf *xmit = &port->state->xmit;
>   
> -	if (uart_circ_empty(xmit) && !port->x_char)
> +	if (uart_circ_empty(xmit) && !port->x_char) {
> +		stm32_usart_rs485_rts_disable(port);
>   		return;
> +	}
>   
>   	stm32_usart_rs485_rts_enable(port);
>   
> diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
> index d734c4a5fd24c..ee69c203b926d 100644
> --- a/drivers/tty/serial/stm32-usart.h
> +++ b/drivers/tty/serial/stm32-usart.h
> @@ -271,6 +271,7 @@ struct stm32_port {
>   	bool hw_flow_control;
>   	bool swap;		 /* swap RX & TX pins */
>   	bool fifoen;
> +	bool txdone;
>   	int rxftcfg;		/* RX FIFO threshold CFG      */
>   	int txftcfg;		/* TX FIFO threshold CFG      */
>   	bool wakeup_src;

Regards, Erwan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
