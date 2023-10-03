Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4127B701B
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 19:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3695DC6B478;
	Tue,  3 Oct 2023 17:42:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBFDAC6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 17:42:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 865D5612E6;
 Tue,  3 Oct 2023 17:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441DCC433C7;
 Tue,  3 Oct 2023 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696354972;
 bh=sr31N4h3bq02A/ddKJ/WDzDhSutvV5w7GfrIuqiakpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M8z/PNZbksvHrABXDOZg64hkD56vVavPYEouOcdhLLy/telDwVu4pXPBuCth5vR+F
 WwJJJkSmXYXh+UwSjtSJPogexkZFSDOCWxjXOMHw8PieAakXbS94fDbBrc7wV8JzUA
 +MP/vxx8BlBf1jYeLKt0iUWP1PVKFdqhFbCJul1SzdESHga31kwDG5EY98VX2PHc4q
 2puaKf4eXJncUKYPej2a8jsBW9uQ0GLVkOSq21wHgXHnx7jYE9fpFHSDzIlAD0nYwu
 rd4B8WQcNOLdwnaY0VwHhU0X5xsuYm7BeJDBypARXd0u86W8GJEzPgofJAQ0ssHYru
 AIqaSck7LuQUQ==
Date: Tue, 3 Oct 2023 19:42:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20231003174246.vdazyls3c7kykd63@zenone.zhora.eu>
References: <20231002084211.1108940-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002084211.1108940-1-alain.volmat@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Fix PEC handling in case of
	SMBUS transfers
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

Hi Alain,

On Mon, Oct 02, 2023 at 10:42:10AM +0200, Alain Volmat wrote:
> The PECBYTE bit allows to generate (in case of write) or
> compute/compare the PEC byte (in case of read).  In case
> of reading a value (performed by first sending a write
> command, then followed by a read command) the PECBYTE should
> only be set before starting the read command and not before
> the first write command.

What is this patch fixing?

Can you please point this detail in the documentation, I haven't
found it[*]

> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

please, don't leave blank lines between tags.

Thanks,
Andi

[*] Hope this is the correct one:
https://www.st.com/resource/en/reference_manual/rm0385-stm32f75xxx-and-stm32f74xxx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 579b30581725..0d3c9a041b56 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1059,9 +1059,10 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  	/* Configure PEC */
>  	if ((flags & I2C_CLIENT_PEC) && f7_msg->size != I2C_SMBUS_QUICK) {
>  		cr1 |= STM32F7_I2C_CR1_PECEN;
> -		cr2 |= STM32F7_I2C_CR2_PECBYTE;
> -		if (!f7_msg->read_write)
> +		if (!f7_msg->read_write) {
> +			cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  			f7_msg->count++;
> +		}
>  	} else {
>  		cr1 &= ~STM32F7_I2C_CR1_PECEN;
>  		cr2 &= ~STM32F7_I2C_CR2_PECBYTE;
> @@ -1149,8 +1150,10 @@ static void stm32f7_i2c_smbus_rep_start(struct stm32f7_i2c_dev *i2c_dev)
>  	f7_msg->stop = true;
>  
>  	/* Add one byte for PEC if needed */
> -	if (cr1 & STM32F7_I2C_CR1_PECEN)
> +	if (cr1 & STM32F7_I2C_CR1_PECEN) {
> +		cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  		f7_msg->count++;
> +	}
>  
>  	/* Set number of bytes to be transferred */
>  	cr2 &= ~(STM32F7_I2C_CR2_NBYTES_MASK);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
