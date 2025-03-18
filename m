Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E8A66FB7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 10:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54A20C7802B;
	Tue, 18 Mar 2025 09:27:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37F8BC78025
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 09:27:13 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso2633342f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742290032; x=1742894832;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C7TGD/sTJc0OtjwahroX9tclP8lTIbogOcbW0Jwqg2g=;
 b=oqt/cnUuVf48hxVLxim8SVO4HTu8UeheETWgF54UXapCCUUpMKS+kfQ41A32wRjJXP
 OQywNiXUaQRkcZxmGGBQIrBVAOPNKWPYtx1dShOw4du8kLw4wyof4Dv0BOZzy40wu/sM
 j1uZAwip+TRuB22y0TZAZOXWJEX6LuIOuDkBq9kMUJMhkM+cJ6TBY8W/JCFyqQYorG8B
 Rvd/MSeZ6uViS5CBVdFptQaPlTfulAa3kq8Sc/CO9PkFzLJRKKlg7G5Bb1Ppy4zQR1D+
 zfOy2BSByuyQyUGZt0hV7T3lW2iptfHkyl9CI67H4koEI113BQ3J6MTLhpPAc7dr6Qqo
 cFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742290032; x=1742894832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7TGD/sTJc0OtjwahroX9tclP8lTIbogOcbW0Jwqg2g=;
 b=oe95UPgyV1fKqewt8llS/pal5muoX157keHHv/vuS6MTphyAxzLkcW1mRcHp3tghOM
 caIMaBr2ErZQOD5TuShz+xZxbfkkin0pbGFVWvXQrSDDfZYv1xqm0wQxz+IJzkiYef9u
 R1Tf+Vd4X8qhACHznj0lrd1Ur5ejXnvZqDfNffEgQ8fqSqNGeJYR+J0JIoq90XuYtckJ
 Csq0gKmqzpom8fUppjcPynLLtMgXuAvoLoJDiQtSgzeBssgPA92TQ2JTBFAITd+reps1
 yAGa7JVW1eaQ2j/t7G7zRIvfsvFgxfX3Mk29oLweIg/c9btvAsITgOtZX3D5WpinA3hq
 sNrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKJUP/p5L+kg5JMBym4JerrKhywhF4Cu4CafqbUdEnM00TlihunytU5rjF0xfL5ECH57rbqKon0XMigQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5/ljYcpOKWwMkud5HT2GnzVpcpLb+WkyDSuOGjTaPJxNAmakX
 dYgfh0WygdydkYvq+0aauUKvNLMdM8+rgfjDxCQU1fUy6zczk1r54UjVFR8yrf4=
X-Gm-Gg: ASbGncsIhHWN343Hb9qyRZVtqIhlaWFFe4X6aeNhy9MDYLzKwIf3GnimD7T7BEVrgsc
 6budQcE/AEBAZv2ml5OWgn76xpR/gUNNmgppUDOjegHGd2ZOw3JYND3JfPrSLZo/2gDhd2bujOk
 4PdU65HqwztcN77FciDpeZHusQD1WCi3jQXq9rnJV/qcuQTmeda4gFUHSxgq0hN4Ord/F5lvcux
 +Bvn1t+iAcu9hiv9wmuM2XNDQbFV4tFBrszr/DZy6hMuFyx80oSL1B6yzIrWYta+vQmdJZk2MmD
 ylKfL2hLGZONgOpPCjptQHnFLjHlqeN6lQg4AD/i3rdGvmsP4/IHyQ==
X-Google-Smtp-Source: AGHT+IH73QS1D5UWCRs0ctMHCS8bma4/x/bL3ofL41GBF2GkxNIuYWlfCICxcIlvecm4Hmc0Weksew==
X-Received: by 2002:a5d:64c3:0:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-3996b935107mr1858488f8f.8.1742290032371; 
 Tue, 18 Mar 2025 02:27:12 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a3dsm17661397f8f.74.2025.03.18.02.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 02:27:11 -0700 (PDT)
Message-ID: <b6c2622a-5c54-4951-be23-7f05599fc10d@linaro.org>
Date: Tue, 18 Mar 2025 09:27:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
 <20250313145456.GR9682@e132581.arm.com>
 <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
 <20250317182957.GL2487211@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250317182957.GL2487211@e132581.arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, lcherian@marvell.com,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/7] coresight: Convert disclaim functions
 to take a struct cs_access
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



On 17/03/2025 6:29 pm, Leo Yan wrote:
> On Mon, Mar 17, 2025 at 11:36:40AM +0000, James Clark wrote:
>>
>>
>> On 13/03/2025 2:54 pm, Leo Yan wrote:
>>> On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:
>>>
>>> [...]
>>>
>>>>    static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>>>>    {
>>>> -       return coresight_read_claim_tags(csdev) != 0;
>>>> +       return coresight_read_claim_tags(&csdev->access) != 0;
>>>>    }
>>>
>>> Likewise other claim functions, can coresight_is_claimed_any() change its
>>> argument type from struct coresight_device to struct csdev_access?
>>
>> I only wanted to change the ones that I had to. I think we should prioritize
>> passing csdev as much as possible in the coresight framework to make
>> everything consistent. Otherwise it's extra churn for no benefit, and if we
>> need something from csdev here in the future we'll have to change this one
>> back again.
> 
> The function coresight_is_claimed_any() has been deleted in a later
> patch.  So this is fine for me.
> 
> In theory, claim tags are low level operations and don't need a
> CoreSight device context, I prefer we can keep them as simple as
> possible.
> 
> With this series, we can see coresight_claim_device() and
> coresight_disclaim_device() are inconsistent for their parameters:
> one is using "struct coresight_device *" and another is
> "struct csdev_access *".  Maybe we just proceed to use csdev_access
> for all claim tag functions?
> 

That's because coresight_claim_device() has logging which requires the 
device name to make it useful. If anything, coresight_disclaim_device() 
should actually take a csdev and then print a better log message. I 
don't think there's a way to make it consistent when there are different 
requirements for each level of operations. The ones with logging need a 
csdev and the lower level ones used on probe need to work with only csa.

> If later we need to use a CoreSight device context when operating
> claim tags, it means we might have different scenarios and we can
> handle that separately.
> 
> Thanks,
> Leo


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
