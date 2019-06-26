Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A356B9D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 16:15:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 292BDC10C8A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 14:15:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99BCEC0C1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2019 14:15:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QE6Sop016102; Wed, 26 Jun 2019 16:14:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=WC3M5mQ7yREfwEdPV7kKxdDvvWYQOrxeml4zeAizf3M=;
 b=M9CdTU8a0eBLpab+3SnE9feWBOzkHJz2OpdgAtiDVRsmMHTMNeiieG0WPOZBMIuYFyCL
 q6/wC7J7y56YYd0k6d3j9YGQeTZJT1C4lJ6NmFjeJfSV5QMi/5BM5kJNHydg3TjkXoCq
 BDmV5tw2+fUgj3bYHtiwLPpKanLNjNJSIshsjY6wckQNSWqkx9rYyZ6eTamZDhi7sORk
 1CEC7Nx8Qqlw9KR3G9NLe5Sj9hmcigDw/v4/KjTNeMTrLSfH4Mqcaxd4yv9SDROw13nF
 4uLWLOMc+f6W+ReEtzGIdSuk/2slqfP0TSWIaM+bQBx9dX3DjDr1xPG9kCTiSRyuxVZ0 Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2ggnvf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Jun 2019 16:14:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB3E038;
 Wed, 26 Jun 2019 14:14:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA4712A63;
 Wed, 26 Jun 2019 14:14:54 +0000 (GMT)
Received: from [10.48.1.93] (10.75.127.51) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 26 Jun
 2019 16:14:53 +0200
To: Wolfram Sang <wsa@the-dreams.de>, Fabrice Gasnier <fabrice.gasnier@st.com>
References: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
 <20190626134535.GN801@ninjato>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <762d7038-62e5-4192-e471-e18194e528f9@st.com>
Date: Wed, 26 Jun 2019 16:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626134535.GN801@ninjato>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_07:, , signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: Add
	I2C_SMBUS_I2C_BLOCK_DATA support
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

Hi

I looks good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thx

On 6/26/19 3:45 PM, Wolfram Sang wrote:
> On Tue, Jun 04, 2019 at 03:20:51PM +0200, Fabrice Gasnier wrote:
>> This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
>> for the stm32f7 SMBUS Controller.
>> Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
>> hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
>> Emulated transfer will fall back calling i2c transfer method where there's
>> already support for DMAs for example.
>> So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
>> emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
>> for such a case.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> 
> Maintainers?
> 
>> ---
>>  drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index 48337be..68a751e 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>>  		cr2 &= ~STM32F7_I2C_CR2_RD_WRN;
>>  		f7_msg->read_write = I2C_SMBUS_READ;
>>  		break;
>> +	case I2C_SMBUS_I2C_BLOCK_DATA:
>> +		/* Rely on emulated i2c transfer (through master_xfer) */
>> +		return -EOPNOTSUPP;
>>  	default:
>>  		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
>>  		return -EOPNOTSUPP;
>> @@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>>  		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>>  		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>>  		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
>> -		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
>> +		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
>> +		I2C_FUNC_SMBUS_I2C_BLOCK;
>>  }
>>  
>>  static struct i2c_algorithm stm32f7_i2c_algo = {
>> -- 
>> 2.7.4
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
