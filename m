Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF758FADF
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Aug 2022 12:48:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C96D1C04004;
	Thu, 11 Aug 2022 10:48:45 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4832C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 10:48:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id w19so32819355ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Aug 2022 03:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2psXapoZ13xPQOZjFEvN9Z4DOi1cREWK0pz2T2YJtmo=;
 b=RdsDMTJ+KT8VrOdb82UpTxvYIZ1q9aGS4M/q+hdZHUSt8kHZzUB+wU7VCzuZBqWNPO
 ikS6xQA2OmuSDX/Mu7t/5K4FSgdZc5sp+tZiaJ5O69DHeQzTng4P/bMhVDDg6nBVpkbe
 EIoN9JGAxIc1F2Bk4BM6/WxnscQJptJrrNHBE9YY8E2BewZZRLxJmR+o/hC0y5QkhbQH
 aZdwivJEcXWDSpUqmXjcIMDHbMhIWcxOQ4/UEDdofahGpkO9gpHuPNBjiEDV0gq47a+o
 cITLTXA4Ow2EOWw4l9MFAOsCbG2An7gzon9E+tHX/aaD9r/k93kE4nQdXQroWjeuSEZ6
 3cnw==
X-Gm-Message-State: ACgBeo2BTPA6557kbhh6E1JZxhZE6d5IE9mLw4175iGYwcLjEUD5jbl8
 s/siTr286K9alSVaIghijaQ=
X-Google-Smtp-Source: AA6agR7YlDJTfvAKpbFW/hQM6n5lS76ql3UMmCt24HIKcucEnGQwv4lfDeC9lNHbbPYUxsv5aMUahQ==
X-Received: by 2002:a17:907:2e19:b0:730:acf0:4921 with SMTP id
 ig25-20020a1709072e1900b00730acf04921mr21902909ejc.416.1660214924186; 
 Thu, 11 Aug 2022 03:48:44 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50ee8f000000b0043bc4b28464sm9002313edr.34.2022.08.11.03.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 03:48:43 -0700 (PDT)
Message-ID: <2fd0f4e5-8b5d-4257-4700-71e68cff29f6@kernel.org>
Date: Thu, 11 Aug 2022 12:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Ben Dooks <ben-linux@fluff.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220721212430.453192-1-ben-linux@fluff.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220721212430.453192-1-ben-linux@fluff.org>
Cc: gregkh@linuxfoundation.org, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: make info structs static
 to avoid sparse warnings
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

On 21. 07. 22, 23:24, Ben Dooks wrote:
> The info structs are local only to the stm32-usart.c driver and are
> triggering sparse warnings about being undecalred. Move these into
> the main driver code and make them static to avoid the following
> warnings:
> 
> drivers/tty/serial/stm32-usart.h:42:25: warning: symbol 'stm32f4_info' was not declared. Should it be static?
> drivers/tty/serial/stm32-usart.h:63:25: warning: symbol 'stm32f7_info' was not declared. Should it be static?
> drivers/tty/serial/stm32-usart.h:85:25: warning: symbol 'stm32h7_info' was not declared. Should it be static?

Right, I would go even further. There is no point in having a separate 
header. So could you move the whole content to .c?

> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>   drivers/tty/serial/stm32-usart.c | 69 ++++++++++++++++++++++++++++++++
>   drivers/tty/serial/stm32-usart.h | 68 -------------------------------
>   2 files changed, 69 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
> index 0973b03eeeaa..01f1ab2c18c0 100644
> --- a/drivers/tty/serial/stm32-usart.c
> +++ b/drivers/tty/serial/stm32-usart.c
> @@ -35,6 +35,75 @@
>   #include "serial_mctrl_gpio.h"
>   #include "stm32-usart.h"
>   
> +
> +/* Register offsets */
> +static struct stm32_usart_info stm32f4_info = {
> +	.ofs = {
> +		.isr	= 0x00,
> +		.rdr	= 0x04,
> +		.tdr	= 0x04,
> +		.brr	= 0x08,
> +		.cr1	= 0x0c,
> +		.cr2	= 0x10,
> +		.cr3	= 0x14,
> +		.gtpr	= 0x18,
> +		.rtor	= UNDEF_REG,
> +		.rqr	= UNDEF_REG,
> +		.icr	= UNDEF_REG,
> +	},
> +	.cfg = {
> +		.uart_enable_bit = 13,
> +		.has_7bits_data = false,
> +		.fifosize = 1,
> +	}
> +};
> +
> +static struct stm32_usart_info stm32f7_info = {
> +	.ofs = {
> +		.cr1	= 0x00,
> +		.cr2	= 0x04,
> +		.cr3	= 0x08,
> +		.brr	= 0x0c,
> +		.gtpr	= 0x10,
> +		.rtor	= 0x14,
> +		.rqr	= 0x18,
> +		.isr	= 0x1c,
> +		.icr	= 0x20,
> +		.rdr	= 0x24,
> +		.tdr	= 0x28,
> +	},
> +	.cfg = {
> +		.uart_enable_bit = 0,
> +		.has_7bits_data = true,
> +		.has_swap = true,
> +		.fifosize = 1,
> +	}
> +};
> +
> +static struct stm32_usart_info stm32h7_info = {
> +	.ofs = {
> +		.cr1	= 0x00,
> +		.cr2	= 0x04,
> +		.cr3	= 0x08,
> +		.brr	= 0x0c,
> +		.gtpr	= 0x10,
> +		.rtor	= 0x14,
> +		.rqr	= 0x18,
> +		.isr	= 0x1c,
> +		.icr	= 0x20,
> +		.rdr	= 0x24,
> +		.tdr	= 0x28,
> +	},
> +	.cfg = {
> +		.uart_enable_bit = 0,
> +		.has_7bits_data = true,
> +		.has_swap = true,
> +		.has_wakeup = true,
> +		.has_fifo = true,
> +		.fifosize = 16,
> +	}
> +};
> +
>   static void stm32_usart_stop_tx(struct uart_port *port);
>   static void stm32_usart_transmit_chars(struct uart_port *port);
>   static void __maybe_unused stm32_usart_console_putchar(struct uart_port *port, unsigned char ch);
> diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
> index ee69c203b926..0ec41a732c88 100644
> --- a/drivers/tty/serial/stm32-usart.h
> +++ b/drivers/tty/serial/stm32-usart.h
> @@ -38,74 +38,6 @@ struct stm32_usart_info {
>   
>   #define UNDEF_REG 0xff
>   
> -/* Register offsets */
> -struct stm32_usart_info stm32f4_info = {
> -	.ofs = {
> -		.isr	= 0x00,
> -		.rdr	= 0x04,
> -		.tdr	= 0x04,
> -		.brr	= 0x08,
> -		.cr1	= 0x0c,
> -		.cr2	= 0x10,
> -		.cr3	= 0x14,
> -		.gtpr	= 0x18,
> -		.rtor	= UNDEF_REG,
> -		.rqr	= UNDEF_REG,
> -		.icr	= UNDEF_REG,
> -	},
> -	.cfg = {
> -		.uart_enable_bit = 13,
> -		.has_7bits_data = false,
> -		.fifosize = 1,
> -	}
> -};
> -
> -struct stm32_usart_info stm32f7_info = {
> -	.ofs = {
> -		.cr1	= 0x00,
> -		.cr2	= 0x04,
> -		.cr3	= 0x08,
> -		.brr	= 0x0c,
> -		.gtpr	= 0x10,
> -		.rtor	= 0x14,
> -		.rqr	= 0x18,
> -		.isr	= 0x1c,
> -		.icr	= 0x20,
> -		.rdr	= 0x24,
> -		.tdr	= 0x28,
> -	},
> -	.cfg = {
> -		.uart_enable_bit = 0,
> -		.has_7bits_data = true,
> -		.has_swap = true,
> -		.fifosize = 1,
> -	}
> -};
> -
> -struct stm32_usart_info stm32h7_info = {
> -	.ofs = {
> -		.cr1	= 0x00,
> -		.cr2	= 0x04,
> -		.cr3	= 0x08,
> -		.brr	= 0x0c,
> -		.gtpr	= 0x10,
> -		.rtor	= 0x14,
> -		.rqr	= 0x18,
> -		.isr	= 0x1c,
> -		.icr	= 0x20,
> -		.rdr	= 0x24,
> -		.tdr	= 0x28,
> -	},
> -	.cfg = {
> -		.uart_enable_bit = 0,
> -		.has_7bits_data = true,
> -		.has_swap = true,
> -		.has_wakeup = true,
> -		.has_fifo = true,
> -		.fifosize = 16,
> -	}
> -};
> -
>   /* USART_SR (F4) / USART_ISR (F7) */
>   #define USART_SR_PE		BIT(0)
>   #define USART_SR_FE		BIT(1)

thanks,
-- 
js
suse labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
