Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52401A7CFE
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 09:47:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D57AC35E01;
	Wed,  4 Sep 2019 07:47:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A61AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 07:47:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x847bAmM000836; Wed, 4 Sep 2019 09:47:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4UyuBYEhSmaJWCoduBpGAY7jENPHNN3jaF8lnYU4bFY=;
 b=avLB/K+6dY1CH0Jiwo9EBM5miectu4+Tap6y9Zoritd2dLPoZcLD1Dwpl8D9oCB3J2Db
 ULwNIdfpicC7HVHo8X7839kHq/yt7EGMps7uItCDQFhABO5T6SM0VM/HE5tEvjtjdO9p
 /3BU6I0Qkgfc/iYkWYvRFBsws+mOklltKTUGZzlqmiXGGtJUdUrx3RJdOjsFqrfh60Ur
 SDLYlCTnRnBPUaVfoL81ZPNOg83zjEzLqE+B+iUi+5m/csvhwPx/ECXDhLx2k/TxaihG
 uLnV0r/Ixi7nnpAKDgedAU6gZyF0pwLsBMmD914k4waeTETbLoP5koubBxysrtTNg/z4 jQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uqe19r07v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 04 Sep 2019 09:47:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7F74E54;
 Wed,  4 Sep 2019 07:47:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35A4A2BA693;
 Wed,  4 Sep 2019 09:47:09 +0200 (CEST)
Received: from [10.48.1.93] (10.75.127.45) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 09:47:08 +0200
To: Wolfram Sang <wsa@the-dreams.de>, Nishka Dasgupta
 <nishkadg.linux@gmail.com>
References: <20190815055857.1944-1-nishkadg.linux@gmail.com>
 <20190903180552.GI2171@ninjato>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <662b171f-37e2-f58e-3e05-41a52737b1f3@st.com>
Date: Wed, 4 Sep 2019 09:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903180552.GI2171@ninjato>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_01:2019-09-03,2019-09-04 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Make structure
	stm32f7_i2c_algo constant
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

Hi Wolfram

Sorry for the delay.

Acked-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

BR

On 9/3/19 8:05 PM, Wolfram Sang wrote:
> On Thu, Aug 15, 2019 at 11:28:57AM +0530, Nishka Dasgupta wrote:
>> Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
>> when it is assigned to constant field algo of a variable having type
>> i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
>> const as well to protect it from unintended modification.
>> Issue found with Coccinelle.
>>
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
> 
> Are you guys okay with this patch?
> 
>>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 266d1c269b83..d36cf08461f7 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -1809,7 +1809,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>>  		I2C_FUNC_SMBUS_I2C_BLOCK;
>>  }
>>  
>> -static struct i2c_algorithm stm32f7_i2c_algo = {
>> +static const struct i2c_algorithm stm32f7_i2c_algo = {
>>  	.master_xfer = stm32f7_i2c_xfer,
>>  	.smbus_xfer = stm32f7_i2c_smbus_xfer,
>>  	.functionality = stm32f7_i2c_func,
>> -- 
>> 2.19.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
