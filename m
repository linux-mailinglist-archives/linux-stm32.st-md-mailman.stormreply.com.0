Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D769770C0B1
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 16:09:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78889C6A61A;
	Mon, 22 May 2023 14:09:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB53C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 14:09:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso38238435e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684764557; x=1687356557;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WexhjTh9EgipPESTAcIjs8YMKr9plgty6KmA22728Fs=;
 b=VDb8SOZPw6Zet5F7yalYSYV9wdMDyhck+Db1K6DyCn8tQuiYEH+dC4Kdp5H8wLCI3c
 8X+b/oZTRESTmVQTUnzCNP6U4m7j0cPoPKS3RU/r/v6i093TPa5a9N74fUVR/GxkpxDf
 1R/FE3giFkmmxiaIPYoVg17UtL2sCbFjeiaGoMfOPoIFbEF0AhGvhtkyl34bq6TPX5Rk
 H7jrKxUtYm7NDE+dPNw9OvckuKBNEeVCl+ZYev1n2S4MH8BeCpEiopDy/UkG31idWrqm
 6dzH+c3NNcGB5cpJuXN1/BnJJYPaMYd5ocRBBm5HKnZI+QTw1X2jbY/zrOthHLWtCPJr
 iFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684764557; x=1687356557;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WexhjTh9EgipPESTAcIjs8YMKr9plgty6KmA22728Fs=;
 b=FLPyDqJwtmN7Qk04mr7nvA3hck51TgHmK8Q0KZyFraKx5gqIIdDGYzNlNnOP8Tk5zj
 ymhHC5hv7ro70O7T4hjxujtvxygWgE/L247HOL0Mzj0MBHNK+OrSlpMzqhx2MC10a6Hw
 UVuuMdmpxntvtTMivxyMXPrEP9T85tRe+QHVKylSyAbQ/ItJuGgHGw80rEoUL3Yd2vuN
 LkaK7SeTyTdu6oGZwIIBfyuOpr4Hkmah2ajW6D3HpF3Z6+Gk/Y1k/d2rVYbA0NoH2Bvu
 BoyPi5lUmGA8AYswT7sxAlajEDSmPgPorfNy5NaO0vhVHbKuzsirWwWPt1I33wOOV9BV
 zWMA==
X-Gm-Message-State: AC+VfDzjPqk40N5eb8ohS4XbAMP4Gp1m5HjZOvLTQIh6dv+c5QZpMMAL
 tAoTgUjPo5cJigvrjRkuK1g=
X-Google-Smtp-Source: ACHHUZ73Fy76JqxgxOq6PygIGGHMHrrwk/atOHcAPHzEai7lV3H36Khz2+J59mn/1eAm5zPigReK7w==
X-Received: by 2002:a1c:c903:0:b0:3eb:42fc:fb30 with SMTP id
 f3-20020a1cc903000000b003eb42fcfb30mr7876135wmb.32.1684764556512; 
 Mon, 22 May 2023 07:09:16 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1cf209000000b003f3e50eb606sm8483308wmc.13.2023.05.22.07.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:09:16 -0700 (PDT)
To: Min-Hua Chen <minhuadotchen@gmail.com>, kuba@kernel.org
References: <20230519152715.7d1c3a49@kernel.org>
 <20230520015527.215952-1-minhuadotchen@gmail.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <9e6b813a-bc1a-6a39-904d-5c45f983cd23@gmail.com>
Date: Mon, 22 May 2023 15:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20230520015527.215952-1-minhuadotchen@gmail.com>
Content-Language: en-GB
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and
 p->des1 with __le32 type values
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

On 20/05/2023 02:55, Min-Hua Chen wrote:
>> On Fri, 19 May 2023 19:50:28 +0800 Min-Hua Chen wrote:
>>> -		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
>>> +		if (p->des0 == cpu_to_le32(0xffffffff) &&
>>> +		    p->des1 == cpu_to_le32(0xffffffff))
>>
>> Can you try to fix the sparse tool instead? I believe it already
>> ignores such errors for the constant of 0, maybe it can be taught 
>> to ignore all "isomorphic" values?
>>
> 
> I downloaded the source code of sparse and I'm afraid that I cannot make
> 0xFFFFFFFF ignored easily. I've tried ~0 instead of 0xFFFFFF,
> but it did not work with current sparse.
> 
> 0 is a special case mentioned in [1].

I believe you can do something like
    if ((p->des0 == ~(__le32)0) && (p->des1 == ~(__le32)0))
 and sparse will accept that, because the cast is allowed under the
 special case.
HTH,
-ed
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
