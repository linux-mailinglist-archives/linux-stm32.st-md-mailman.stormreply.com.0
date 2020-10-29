Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAC29EE49
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 15:31:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75B8EC3FAD5;
	Thu, 29 Oct 2020 14:31:14 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE83EC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 14:31:12 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f21so1379289plr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yGfVt0L4ftOqQYvVzpLAMtyqzm24yEPmmaeuYJHdcF4=;
 b=L9Ve7M9gsRbGmqPW4y2GbZH/PW9XpRBJKr8bcNLgo2jmnTrKJveNfyczvv9XTx+HUl
 YLInTPvtZFmjrEtguEph+0OATtBpSK8kwKDRVeByBXdRw0Buz+0hoaCPQT3R16L/79Yo
 j2u3swusX6/w6211/RM5QFW6qgwWkr0uCufzlloq+m9sBQ6S/+YCJgMjBnxeO8POZKcm
 GDWaaJnhiw4daofmYDRX9oZ4ehcZgPyqljtuIP8TlUBc9WWSKvz+hBiKPtri9cR0I/EM
 X0BoWxpLqADftyN/1V/sAG0fokCqb0gmHPn/edQDvwR53UdSASGvA7sXOUjA/L/o9sXm
 RMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yGfVt0L4ftOqQYvVzpLAMtyqzm24yEPmmaeuYJHdcF4=;
 b=KccQOLC01Bqce23OBkqgp5k/EHS4vkRlNth63uQdCmBz/r/vblmFhL8kWl9GRqsvPy
 Yu4eVSF4id/a/woH9cqFP5HT4mBuGCQtf2yeNUV2uRX9xNkrkOQ3bIm7rM8SVzgmXs+T
 Mg+6/hpwVb20SgMrDk/qo4Q9+k5+q+hW3+92Iev5Tdn7ENORO7JuEVsxKGUbA4npGrmy
 tAvod7m3RwwAmUHSYEncJZ+vb/mn+eazt3l+lF6+z2ZfU7cmPcD/BRWjkO3pOrrhgKzg
 +SGZAM0glctT/ZpWE43fJ/XVea39VzgIDaNkwtl9jPFs0C+2fPwE0ZJd+ripaP6jhcjK
 zmnw==
X-Gm-Message-State: AOAM5302efHZgrgWUtaKC87kWZ7a0ZJgrkzkyTrxtulE5C2OxB/3YYDr
 j6E4dy7klMnHSuvysk4P8as=
X-Google-Smtp-Source: ABdhPJx5yXpyzx2qbpNT/+t79uGRA4TnLTSZjBRsP0DnQS9c1W8oAAwcmW263hQYx6j5y/UQ3EDlpA==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id
 s15-20020a170902a50fb02900d60da2aaa7mr4686870plq.42.1603981871290; 
 Thu, 29 Oct 2020 07:31:11 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id p12sm2776972pgm.29.2020.10.29.07.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 07:31:10 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 29 Oct 2020 22:18:57 +0800
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20201029141857.hts77kneb3j7aa67@Rk>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
 <20201029074654.227263-5-coiby.xu@gmail.com>
 <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Alain VOLMAT <alain.volmat@st.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] i2c: stm32: remove unnecessary
	CONFIG_PM_SLEEP
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

Hi Fabrice,

On Thu, Oct 29, 2020 at 12:31:54PM +0100, Fabrice Gasnier wrote:
>On 10/29/20 8:46 AM, Coiby Xu wrote:
>> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-stm32f7.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index f41f51a176a1..95ac9dfdf458 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>
>> -#ifdef CONFIG_PM_SLEEP
>
>Hi Coiby,
>
>This generates warnings when building with W=1 and CONFIG_PM_SLEEP=n.
>Could you please add also "__maybe_unused" for relevant routines below ?
>
>>  static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>             ^
>e.g. insert: __maybe_unused
>

Thank you for the suggestion. I'll add "__maybe_unused" in v2.

>Best regards,
>Fabrice
>>  {
>>  	int ret;
>> @@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
>>
>>  	return 0;
>>  }
>> -#endif
>>
>>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
>>

--
Best regards,
Coiby
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
