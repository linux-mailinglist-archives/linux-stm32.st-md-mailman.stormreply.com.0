Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A009A64CDE
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 12:36:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A6CC78F80;
	Mon, 17 Mar 2025 11:36:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ABD8CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 11:36:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso13210455e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 04:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742211401; x=1742816201;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jN0+M4gX8uMSJYT62hKxDE04ZoXl8RCCMboFMq8K3LM=;
 b=jwT72jtiXEei/UHQ6H2vY8rpEUQpXc/k/KU3QflUvjnE+w9A7+EdFqFsrSrnNZYgdW
 Ns5qzyexEGOMWIzWf4wo+sXcdzsl8UQA3b68ALbvOY/9SMKntuLuWccPoJCfBU6tERjs
 ih9Xd/4DaoQC+kJ2gZF0cXKALjGT0PzfIkzHRgKd0xVv5ZZ2IRJGMrCFzOT6w1gQTbwI
 NlvU/xrGzbfCU2Zf/qIPDnxWqo42hk72tAXmFWMfKhxnH19cSYgnf45sIp0NuWokAqU6
 QW1lB8VEfGqyaRZbL3aU8CabqZ9WXI8dI8ngW8NprjRtUx0qGbqBepGXjUmLk9q2lqcL
 MTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742211401; x=1742816201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jN0+M4gX8uMSJYT62hKxDE04ZoXl8RCCMboFMq8K3LM=;
 b=gT1m6H9t8aJ6C0XBe8WQHRH/xCtgF5gISxMUHBTiepkKr2y8djZbLBdBwojax0MSMW
 PwgLo7+ZuYRLUzca9t5jQb6gYUISQ7QuXajGKv7M0m1EADJNCpduzXPTolpJpn86eCWl
 s4Z8U+pwgX4MUkD3lZLD9ZYjmc8UYWk6y6y0+/MPEaMaI5MEzvJgXHz2VPKOEwLyyOdB
 n9bYUzsUDF4Dt7RwbaGzoOAoyvvGeyAZT0AgUvhpX347inCHyAK+GIYX1gt5FdJE99b2
 A4w2Fgr/w65/EYRFtwgrJ74O+zxw+mKDpjIlXSJgEBMTcb3Qy9oSC6E356k63vh9B/3O
 nXqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW71t5c5/9J+DaJZfWIpFdwNEdADw0LIOvegHDlNOC7A3+oNL4WnVzlsZouyirkkLHxLmB1y35pji7ZKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzess5baMKpVAQ2Q/fyAw6u+fqkGxT/01NDl11MIlh7O0f+kBGX
 YW9wC7/oAJ1Xd5ront7vec5hfmqjV4JmxRpGy/N6fJ87HapCvNT9c9M3tM5ALLI=
X-Gm-Gg: ASbGncuFUQrQbF7bZLgLjDqf4lTctC3ZWwcdvcJHipAfsXB4U6viM/FTRPZRUl68krK
 E1SlQYpTJ7fnQ2kEilZfaL81v1TmU18zR4lY59FYwD+g8uJ766yw0N8EIIRPqhBHiRGzJndEl1a
 g5Nuau6hX1AdfHZM8S2b/h5H+uHY5u27qVSCHC4BGuZFtYiyqDCboxwDwfVgnJ3UWTOob+2uVLX
 rs4of6OeddyRDm2iWXn7HTl7fO7Th9UPsg8CdfriJv6bmusXwDLEFD+cg7pT7kNiJnxDYkFrDEX
 BYm9KqEmV92Bru0lwseGgtAHp0GfThzhSHBPNnBmMUUeBnJ9bxDlPw==
X-Google-Smtp-Source: AGHT+IGpe6gVPMzyOS93xBARTNQJHQXaN3m0Z+9TNyPFS5vYkYlGiqRdgGrs5Bmtix92MgU8E4mTig==
X-Received: by 2002:a05:600c:358c:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-43d1ecc3969mr122779395e9.13.1742211401582; 
 Mon, 17 Mar 2025 04:36:41 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ec14bsm14651972f8f.100.2025.03.17.04.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:36:41 -0700 (PDT)
Message-ID: <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
Date: Mon, 17 Mar 2025 11:36:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
 <20250313145456.GR9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313145456.GR9682@e132581.arm.com>
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



On 13/03/2025 2:54 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:
> 
> [...]
> 
>>   static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>>   {
>> -       return coresight_read_claim_tags(csdev) != 0;
>> +       return coresight_read_claim_tags(&csdev->access) != 0;
>>   }
> 
> Likewise other claim functions, can coresight_is_claimed_any() change its
> argument type from struct coresight_device to struct csdev_access?
> 
> Thanks,
> Leo

I only wanted to change the ones that I had to. I think we should 
prioritize passing csdev as much as possible in the coresight framework 
to make everything consistent. Otherwise it's extra churn for no 
benefit, and if we need something from csdev here in the future we'll 
have to change this one back again.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
