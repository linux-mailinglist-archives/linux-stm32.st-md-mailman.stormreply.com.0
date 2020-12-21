Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCD2DFC08
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Dec 2020 13:51:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBCB3C56611;
	Mon, 21 Dec 2020 12:51:52 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC27FC5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Dec 2020 12:51:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Czzr61JbYz1rtNH;
 Mon, 21 Dec 2020 13:51:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Czzr60gkWz1qr3y;
 Mon, 21 Dec 2020 13:51:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dtOigQ_gs3-J; Mon, 21 Dec 2020 13:51:48 +0100 (CET)
X-Auth-Info: 0Q2JADJuGAhSUwo3vzdkiMKE122vBn7kd+T9X9e6wfw=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 21 Dec 2020 13:51:48 +0100 (CET)
To: Roman Guskov <rguskov@dh-electronics.com>, linux-spi@vger.kernel.org
References: <20201221123532.27272-1-rguskov@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <524f6c50-b515-1f5e-8237-97e78c9875d8@denx.de>
Date: Mon, 21 Dec 2020 13:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221123532.27272-1-rguskov@dh-electronics.com>
Content-Language: en-US
Cc: broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: FIFO threshold level - fix
	align packet size
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

On 12/21/20 1:35 PM, Roman Guskov wrote:
> if cur_bpw <= 8 and xfer_len < 4 then the value of fthlv will be 1 and
> SPI registers content may have been lost.
> 
> * If SPI data register is accessed as a 16-bit register and DSIZE <= 8bit,
>    better to select FTHLV = 2, 4, 6 etc
> 
> * If SPI data register is accessed as a 32-bit register and DSIZE > 8bit,
>    better to select FTHLV = 2, 4, 6 etc, while if DSIZE <= 8bit,
>    better to select FTHLV = 4, 8, 12 etc
> 
> Signed-off-by: Roman Guskov <rguskov@dh-electronics.com>

I think this should also have the following tag:

Fixes: dcbe0d84dfa5 ("spi: add driver for STM32 SPI controller")

> ---
>   drivers/spi/spi-stm32.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 9d8ceb63f7db..417c40154477 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -494,9 +494,9 @@ static u32 stm32h7_spi_prepare_fthlv(struct stm32_spi *spi, u32 xfer_len)
>   
>   	/* align packet size with data registers access */
>   	if (spi->cur_bpw > 8)
> -		fthlv -= (fthlv % 2); /* multiple of 2 */
> +		fthlv += (fthlv % 2) ? 1 : 0;
>   	else
> -		fthlv -= (fthlv % 4); /* multiple of 4 */
> +		fthlv += (fthlv % 4) ? (4 - (fthlv % 4)) : 0;
>   
>   	if (!fthlv)
>   		fthlv = 1;
> 

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
