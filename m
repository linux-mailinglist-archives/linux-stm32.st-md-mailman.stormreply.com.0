Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C94E0557
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2019 15:42:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA8A4C36B0B;
	Tue, 22 Oct 2019 13:42:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07041C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 13:41:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9MDfKcR013037; Tue, 22 Oct 2019 15:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6OiFUl1fdaeRq1DoqLpiVMazeaoQpnE/nLtSGyzhd/8=;
 b=lpZh7ZFe5rXJeK1A8+nZpUxIAl5J+lyHSBolGt5yILdDdCixYyq0pd75X4DHt5qw4iN6
 Chhy29zxH9wMp5nLYqg5X0Ww9SS4s/n1uZmnzN1jToNgKBMQ+/BqpK+sA7OTfgraKDJ1
 EkESAXyPc64j9G8WxNAC4qz1xjqLBKlsot1KbBJ3kcEffBg6as2XW6HB0aOLkymTtF50
 U1TjOid7B2eWC8OQO/cVGRICKfvuuL+DuXXydzPOFe2BDYCqh4EI1/O5kKBpyouROIyI
 Zzb2YWpKOBD8XLYWe1r2fnugylUGykNsBjGxdiT6XNV5O8/OXyuEz2f7/etuXGkSMu+N Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vqqy17uyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 15:41:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E57310002A;
 Tue, 22 Oct 2019 15:41:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C9BB2AE210;
 Tue, 22 Oct 2019 15:41:50 +0200 (CEST)
Received: from [10.48.1.171] (10.75.127.51) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Oct
 2019 15:41:49 +0200
To: Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
 <robh+dt@kernel.org>
References: <1571144589-3066-1-git-send-email-alain.volmat@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <7092a0d6-2f6a-fa1f-2999-17418b479c5f@st.com>
Date: Tue, 22 Oct 2019 15:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571144589-3066-1-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_03:2019-10-22,2019-10-22 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: rework slave_id
	allocation
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

Hello

Looks good

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx
Regards

On 10/15/19 3:03 PM, Alain Volmat wrote:
> The IP can handle two slave addresses. One address can either be
> 7 bits or 10 bits while the other can only be 7 bits.
> In order to ensure that a 10 bits address can always be allocated
> (assuming there is only one 7 bits address already allocated),
> pick up the 7-bits only address slot in priority when performing a 7-bits
> address allocation.
> 
> Fixes: 60d609f3 ("i2c: i2c-stm32f7: Add slave support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index d36cf08461f7..cfae01b15243 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1265,7 +1265,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
>  	 * slave[0] supports 7-bit and 10-bit slave address
>  	 * slave[1] supports 7-bit slave address only
>  	 */
> -	for (i = 0; i < STM32F7_I2C_MAX_SLAVE; i++) {
> +	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
>  		if (i == 1 && (slave->flags & I2C_CLIENT_PEC))
>  			continue;
>  		if (!i2c_dev->slave[i]) {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
