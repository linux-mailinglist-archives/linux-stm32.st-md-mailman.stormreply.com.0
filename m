Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A425ABAE
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Sep 2020 15:04:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC503C36B26;
	Wed,  2 Sep 2020 13:04:45 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6541AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Sep 2020 13:04:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BhPKk11Gkz1rrKZ;
 Wed,  2 Sep 2020 15:04:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BhPKk0Hxbz1qvgX;
 Wed,  2 Sep 2020 15:04:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id GQe7Gpx3X-bp; Wed,  2 Sep 2020 15:04:40 +0200 (CEST)
X-Auth-Info: ycOxd00rG+0EuTI4VberXfGnp7F/aHH9Zi9TcMdK1Tw=
Received: from [IPv6:::1] (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  2 Sep 2020 15:04:40 +0200 (CEST)
To: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-serial@vger.kernel.org
References: <20200831171045.205691-1-marex@denx.de>
 <2ed8eeba-4c67-9c9b-5264-72171aab066a@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b84e3ddd-b9bb-6090-89ae-937baa9eb939@denx.de>
Date: Wed, 2 Sep 2020 14:50:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2ed8eeba-4c67-9c9b-5264-72171aab066a@st.com>
Content-Language: en-US
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V3] serial: stm32: Add RS485 RTS GPIO
	control again
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

On 9/2/20 10:08 AM, Fabrice Gasnier wrote:
> On 8/31/20 7:10 PM, Marek Vasut wrote:
>> While the STM32 does support RS485 drive-enable control within the
>> UART IP itself, some systems have the drive-enable line connected
>> to a pin which cannot be pinmuxed as RTS. Add support for toggling
>> the RTS GPIO line using the modem control GPIOs to provide at least
>> some sort of emulation.
>>
>> Fixes: 7df5081cbf5e ("serial: stm32: Add RS485 RTS GPIO control")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexandre Torgue <alexandre.torgue@st.com>
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>> V2: Use mctrl_gpio_set() instead of stm32_set_mctrl()
>> V3: - Actually toggle the RTS line before and after TX
>>     - Undo 7df5081cbf5e ("serial: stm32: Add RS485 RTS GPIO control")
>>       which was previous version of this patch ; I messed up.
>> ---
>>  drivers/tty/serial/stm32-usart.c | 33 ++++++++++++++++++++++++--------
>>  1 file changed, 25 insertions(+), 8 deletions(-)
> 
> 
> Hi Marek,
> 
> This seems sensible. I've few comments on the commit tittle and commit
> message:
> - tittle: this could be named as a "fix" rather than "add... again" ?
> - I may have missed it... Is it a V3 ?

There was a V2 which got applied before I had the chance to send a V3.

> Could explain what is being fixed? Why moving the mctrl_gpio_* calls
> away from the stm32_config_rs485()/set_termios() routines to the
> start_tx/stop_tx ops improves/fixes the RS485 RTS GPIO control (what was
> wrong) ?

Because set_termios is not called every time there is a transfer, but
the DE GPIOs must be toggled every time there is a transfer (to enable
the DE on TX and disable it right after TX).

> Thanks,
> Best regards,
> Fabrice
> 
>>
>> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
>> index 143300a80090..23f7453441ae 100644
>> --- a/drivers/tty/serial/stm32-usart.c
>> +++ b/drivers/tty/serial/stm32-usart.c
>> @@ -129,13 +129,9 @@ static int stm32_config_rs485(struct uart_port *port,
>>  		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
>>  			cr3 &= ~USART_CR3_DEP;
>>  			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
>> -			mctrl_gpio_set(stm32_port->gpios,
>> -					stm32_port->port.mctrl & ~TIOCM_RTS);
>>  		} else {
>>  			cr3 |= USART_CR3_DEP;
>>  			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
>> -			mctrl_gpio_set(stm32_port->gpios,
>> -					stm32_port->port.mctrl | TIOCM_RTS);
>>  		}
>>  
>>  		writel_relaxed(cr3, port->membase + ofs->cr3);
>> @@ -541,17 +537,42 @@ static void stm32_disable_ms(struct uart_port *port)
>>  /* Transmit stop */
>>  static void stm32_stop_tx(struct uart_port *port)
>>  {
>> +	struct stm32_port *stm32_port = to_stm32_port(port);
>> +	struct serial_rs485 *rs485conf = &port->rs485;
>> +
>>  	stm32_tx_interrupt_disable(port);
>> +
>> +	if (rs485conf->flags & SER_RS485_ENABLED) {
>> +		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
>> +			mctrl_gpio_set(stm32_port->gpios,
>> +					stm32_port->port.mctrl & ~TIOCM_RTS);
>> +		} else {
>> +			mctrl_gpio_set(stm32_port->gpios,
>> +					stm32_port->port.mctrl | TIOCM_RTS);
>> +		}
>> +	}
>>  }
>>  
>>  /* There are probably characters waiting to be transmitted. */
>>  static void stm32_start_tx(struct uart_port *port)
>>  {
>> +	struct stm32_port *stm32_port = to_stm32_port(port);
>> +	struct serial_rs485 *rs485conf = &port->rs485;
>>  	struct circ_buf *xmit = &port->state->xmit;
>>  
>>  	if (uart_circ_empty(xmit))
>>  		return;
>>  
>> +	if (rs485conf->flags & SER_RS485_ENABLED) {
>> +		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
>> +			mctrl_gpio_set(stm32_port->gpios,
>> +					stm32_port->port.mctrl | TIOCM_RTS);
>> +		} else {
>> +			mctrl_gpio_set(stm32_port->gpios,
>> +					stm32_port->port.mctrl & ~TIOCM_RTS);
>> +		}
>> +	}
>> +
>>  	stm32_transmit_chars(port);
>>  }
>>  
>> @@ -851,13 +872,9 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
>>  		if (rs485conf->flags & SER_RS485_RTS_ON_SEND) {
>>  			cr3 &= ~USART_CR3_DEP;
>>  			rs485conf->flags &= ~SER_RS485_RTS_AFTER_SEND;
>> -			mctrl_gpio_set(stm32_port->gpios,
>> -					stm32_port->port.mctrl & ~TIOCM_RTS);
>>  		} else {
>>  			cr3 |= USART_CR3_DEP;
>>  			rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
>> -			mctrl_gpio_set(stm32_port->gpios,
>> -					stm32_port->port.mctrl | TIOCM_RTS);
>>  		}
>>  
>>  	} else {
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
