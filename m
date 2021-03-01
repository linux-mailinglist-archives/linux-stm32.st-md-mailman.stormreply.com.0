Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A9327C16
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Mar 2021 11:29:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 793E3C56635;
	Mon,  1 Mar 2021 10:29:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5207C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Mar 2021 10:29:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121ARlbj002304; Mon, 1 Mar 2021 11:28:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0iba9ds30bxpbJDZZJN9+EAyGhkT4XykKVq3jr281PQ=;
 b=ev38jqefIMorbnUTPQ6Kefjkh03E84Y5ZK++8Ldi7gYQucan/f6wD08NVT6/CKFLffNS
 nlEkAlj5c9CZPo8MFSJyw7DAIlUpNkeNrFWBuVgWHBPIHz/zk2fWcYYjZ13bECoCu+E+
 KWM4Q3xsLWNT+W9k6G/9atLaLLX9mo9htQ2vOz02pRnkin4PbJjp7DQcAAOGUNtLIfJV
 K9CLvDEAq0S7uCw0asm7s5hR0du+DlkluhSeIQ0abFTlysVIY6b+9HRQ2qJkM6YkJc8k
 K9UTSP9CpNKj37OojLQcG1fKDHi8a1t9Xa1glKCcKcRBgWiKa9Puhc0T0nxt9lg+XFuA Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdxua6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 11:28:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30925100034;
 Mon,  1 Mar 2021 11:28:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B72922671E;
 Mon,  1 Mar 2021 11:28:53 +0100 (CET)
Received: from [10.211.4.172] (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Mar
 2021 11:28:51 +0100
To: Martin Devera <devik@eaxlabs.cz>, <linux-kernel@vger.kernel.org>
References: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
 <20210227164157.30971-1-devik@eaxlabs.cz>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
Date: Mon, 1 Mar 2021 11:28:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210227164157.30971-1-devik@eaxlabs.cz>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_05:2021-02-26,
 2021-03-01 signatures=0
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Le Ray <erwan.leray@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] tty/serial: Add rx-tx-swap OF
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

On 2/27/21 5:41 PM, Martin Devera wrote:
> STM32 F7/H7 usarts supports RX & TX pin swapping.
> Add option to turn it on.
> Tested on STM32MP157.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>
> ---
>  drivers/tty/serial/stm32-usart.c | 3 ++-
>  drivers/tty/serial/stm32-usart.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index b3675cf25a69..3650c8798061 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -758,7 +758,7 @@ static void stm32_usart_set_termios(struct uart_port *port,
>  	cr1 = USART_CR1_TE | USART_CR1_RE;
>  	if (stm32_port->fifoen)
>  		cr1 |= USART_CR1_FIFOEN;
> -	cr2 = 0;
> +	cr2 = stm32_port->swap ? USART_CR2_SWAP : 0;

Hi Martin,

Same could be done in the startup routine, that enables the port for
reception (as described in Documentation/driver-api/serial/driver.rst)

>  	cr3 = readl_relaxed(port->membase + ofs->cr3);
>  	cr3 &= USART_CR3_TXFTIE | USART_CR3_RXFTCFG_MASK | USART_CR3_RXFTIE
>  		| USART_CR3_TXFTCFG_MASK;
> @@ -1078,6 +1078,7 @@ static struct stm32_port *stm32_usart_of_get_port(struct platform_device *pdev)
>  	stm32_ports[id].hw_flow_control =
>  		of_property_read_bool (np, "st,hw-flow-ctrl") /*deprecated*/ ||
>  		of_property_read_bool (np, "uart-has-rtscts");
> +	stm32_ports[id].swap = of_property_read_bool(np, "rx-tx-swap");

The swap option/bit is available starting with stm32f7 (e.g. not on
stm32f4).

This could be added to compatible data, e.g. as done for other
capabilities in stm32-usart.h. E.g you could add a "has_swap" in struct
stm32_usart_config, then use it at probe time:
	if (cfg->has_swap)
		stm32_ports[id].swap = ...;

Thanks for your patch,
Best regards,
Fabrice

>  	stm32_ports[id].port.line = id;
>  	stm32_ports[id].cr1_irq = USART_CR1_RXNEIE;
>  	stm32_ports[id].cr3_irq = 0;
> diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
> index cb4f327c46db..2f054e2dc0ab 100644
> --- a/drivers/tty/serial/stm32-usart.h
> +++ b/drivers/tty/serial/stm32-usart.h
> @@ -271,6 +271,7 @@ struct stm32_port {
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
