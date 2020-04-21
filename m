Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA21B26ED
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 14:58:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BCC4C36B0C;
	Tue, 21 Apr 2020 12:58:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 064ADC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:58:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LCwL95026707; Tue, 21 Apr 2020 14:58:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=r+b9cQQQrzKV/Yu/DP7Ku0tDYpN9ESE+SznlYMlhwgw=;
 b=Fu+lvdF4U3XYsVidOxO3j2M8xLSzItNtcVvf9Al/9WJ326PFov+lXG33XJ285ATCBha0
 2EHUZ3E/hVtWXm8JyXq6q+Q9oS09FgYNXXB8Va9Pxa/XTpoOWF67wU086+GFGRGYM4C/
 IB3mQ40lYY6p8NNKpY0H8yt9rnV5ybsVqkCrM+WfFhC3sH5dw4unGYADPFeCf4vQEJl3
 BpaaaZNdlpHgKBx8Ol1iisn1JuMd6lABDeDdCjLTuy3K8XP0RsjNoE2lvzUu20gWh1cv
 8JK6RTN5Ohb4AAAPUjNiRDZSnWNL6N2U1QVM/sxniQoelqSMdZgCmswYDAabioQIonPL EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregg2wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 14:58:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31A3410002A;
 Tue, 21 Apr 2020 14:58:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BAFA2B188F;
 Tue, 21 Apr 2020 14:58:36 +0200 (CEST)
Received: from [10.211.6.179] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 14:58:34 +0200
To: <mani@kernel.org>
References: <20200420170204.24541-1-mani@kernel.org>
 <20200420170204.24541-3-mani@kernel.org>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <035edfe7-1799-51c1-58aa-2498e5991aee@st.com>
Date: Tue, 21 Apr 2020 14:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200420170204.24541-3-mani@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] tty: serial: Add modem control
 gpio support for STM32 UART
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

On 4/20/20 7:02 PM, mani@kernel.org wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> STM32 UART controllers have the built in modem control support using
> dedicated gpios which can be enabled using 'st,hw-flow-ctrl' flag in DT.
> But there might be cases where the board design need to use different
> gpios for modem control.
> 
> For supporting such cases, this commit adds modem control gpio support
> to STM32 UART controller using mctrl_gpio driver.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/tty/serial/Kconfig       |  1 +
>  drivers/tty/serial/stm32-usart.c | 53 ++++++++++++++++++++++++++++++--
>  drivers/tty/serial/stm32-usart.h |  1 +
>  3 files changed, 53 insertions(+), 2 deletions(-)

Hi Mani,

You can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice

> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 0aea76cd67ff..e7a6f2130684 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -1462,6 +1462,7 @@ config SERIAL_STM32
>  	tristate "STMicroelectronics STM32 serial port support"
>  	select SERIAL_CORE
>  	depends on ARCH_STM32 || COMPILE_TEST
> +	select SERIAL_MCTRL_GPIO if GPIOLIB
>  	help
>  	  This driver is for the on-chip Serial Controller on
>  	  STMicroelectronics STM32 MCUs.
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index 5e93e8d40f59..17c2f3276888 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -31,6 +31,7 @@
>  #include <linux/tty_flip.h>
>  #include <linux/tty.h>
>  
> +#include "serial_mctrl_gpio.h"
>  #include "stm32-usart.h"
>  
>  static void stm32_stop_tx(struct uart_port *port);
> @@ -510,12 +511,29 @@ static void stm32_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  		stm32_set_bits(port, ofs->cr3, USART_CR3_RTSE);
>  	else
>  		stm32_clr_bits(port, ofs->cr3, USART_CR3_RTSE);
> +
> +	mctrl_gpio_set(stm32_port->gpios, mctrl);
>  }
>  
>  static unsigned int stm32_get_mctrl(struct uart_port *port)
>  {
> +	struct stm32_port *stm32_port = to_stm32_port(port);
> +	unsigned int ret;
> +
>  	/* This routine is used to get signals of: DCD, DSR, RI, and CTS */
> -	return TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
> +	ret = TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
> +
> +	return mctrl_gpio_get(stm32_port->gpios, &ret);
> +}
> +
> +static void stm32_enable_ms(struct uart_port *port)
> +{
> +	mctrl_gpio_enable_ms(to_stm32_port(port)->gpios);
> +}
> +
> +static void stm32_disable_ms(struct uart_port *port)
> +{
> +	mctrl_gpio_disable_ms(to_stm32_port(port)->gpios);
>  }
>  
>  /* Transmit stop */
> @@ -626,6 +644,9 @@ static void stm32_shutdown(struct uart_port *port)
>  	u32 val, isr;
>  	int ret;
>  
> +	/* Disable modem control interrupts */
> +	stm32_disable_ms(port);
> +
>  	val = USART_CR1_TXEIE | USART_CR1_TE;
>  	val |= stm32_port->cr1_irq | USART_CR1_RE;
>  	val |= BIT(cfg->uart_enable_bit);
> @@ -764,6 +785,12 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
>  		cr3 |= USART_CR3_CTSE | USART_CR3_RTSE;
>  	}
>  
> +	/* Handle modem control interrupts */
> +	if (UART_ENABLE_MS(port, termios->c_cflag))
> +		stm32_enable_ms(port);
> +	else
> +		stm32_disable_ms(port);
> +
>  	usartdiv = DIV_ROUND_CLOSEST(port->uartclk, baud);
>  
>  	/*
> @@ -898,6 +925,7 @@ static const struct uart_ops stm32_uart_ops = {
>  	.throttle	= stm32_throttle,
>  	.unthrottle	= stm32_unthrottle,
>  	.stop_rx	= stm32_stop_rx,
> +	.enable_ms	= stm32_enable_ms,
>  	.break_ctl	= stm32_break_ctl,
>  	.startup	= stm32_startup,
>  	.shutdown	= stm32_shutdown,
> @@ -960,10 +988,31 @@ static int stm32_init_port(struct stm32_port *stm32port,
>  
>  	stm32port->port.uartclk = clk_get_rate(stm32port->clk);
>  	if (!stm32port->port.uartclk) {
> -		clk_disable_unprepare(stm32port->clk);
>  		ret = -EINVAL;
> +		goto err_clk;
> +	}
> +
> +	stm32port->gpios = mctrl_gpio_init(&stm32port->port, 0);
> +	if (IS_ERR(stm32port->gpios)) {
> +		ret = PTR_ERR(stm32port->gpios);
> +		goto err_clk;
>  	}
>  
> +	/* Both CTS/RTS gpios and "st,hw-flow-ctrl" should not be specified */
> +	if (stm32port->hw_flow_control) {
> +		if (mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_CTS) ||
> +		    mctrl_gpio_to_gpiod(stm32port->gpios, UART_GPIO_RTS)) {
> +			dev_err(&pdev->dev, "Conflicting RTS/CTS config\n");
> +			ret = -EINVAL;
> +			goto err_clk;
> +		}
> +	}
> +
> +	return ret;
> +
> +err_clk:
> +	clk_disable_unprepare(stm32port->clk);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
> index db8bf0d4982d..d4c916e78d40 100644
> --- a/drivers/tty/serial/stm32-usart.h
> +++ b/drivers/tty/serial/stm32-usart.h
> @@ -274,6 +274,7 @@ struct stm32_port {
>  	bool fifoen;
>  	int wakeirq;
>  	int rdr_mask;		/* receive data register mask */
> +	struct mctrl_gpios *gpios; /* modem control gpios */
>  };
>  
>  static struct stm32_port stm32_ports[STM32_MAX_PORTS];
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
