Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C663B4C50DC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 22:46:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ABDCC5F1F2;
	Fri, 25 Feb 2022 21:46:00 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED220C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 21:45:58 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id p14so13280107ejf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 13:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WUC7V+O3XAxmaqtMnQJOVveRn6Cuhyncuw6K66dwUqc=;
 b=J6IYE5vlhK+ylp2TLN0MIkJ7VkoKkzaDVW51e4oXPuRffwekpuI3j0SuhJhjDH4jsn
 89fRNsbZdw3Ot4NJQOumfJyErzdw8HPeBfQE/mJCJeoh5WXAFkjbXgnNNnaVdtOatA91
 MKxUDHPxaLo87a8hRWH+1IBRcx87385sFXAJ90X4+CPG4kgBOhuck4jmH1kkGcpxIU5o
 c56KIutfl9wIRasS7xNDicqvtFS1gBoFF65niO4E9QkdwceCFfY0r/dC6kZnoM5kPmCc
 TU/0E5jmqWIKBXK4Rs1vcla+Ma5rfVAfZQBmOQwRDzWKLv/E8MhUaI5OHCvYuSII83ga
 5f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WUC7V+O3XAxmaqtMnQJOVveRn6Cuhyncuw6K66dwUqc=;
 b=2eLFlEy7gZjD/8OIA//4hXKJrtV1vCBYw+OUpxOKI+EaK6Sj3c3woY8bo6k1OLV26s
 hi+I771Jg024KjYjz+q2SPdeh+cIdZesNz4pAM9ohrKLlqVg6icVSI8HMlVmfXHK2qb8
 v61wjmU2WfkceZsfBVO1MK4EyfGZxPrQS5K6Zv6hTLzZ0o3D27JENoUUDcw/WMrVacdk
 Dn/Z8Jv97RHUDKw+SWugjlQjuJNRAZUcS61aLoxo3nhtTYnO+TvYqrQCOMLIeJtfPYDv
 DgjY1qKmFSzaFwODo8yWVykENBUmpdLGL8yy/hODtac8Hq/KWaH10kXtR1/Quvt6HOjQ
 8zNw==
X-Gm-Message-State: AOAM532D8e7X9+AyCmFzkLknqEXIzq3En91zzrdg8Ml2zsp5mMbFUjLS
 1tPqnsABNaRxL9DAysGZIckrUjCMGPNg4g==
X-Google-Smtp-Source: ABdhPJwzHWtu2wcaSjUJUo74H7f7+j3BpIDWEyIIyY+Gn8nTEclUvyyXX2GyZNjkO0R+fazX83syow==
X-Received: by 2002:a17:906:3bcb:b0:6cf:cf86:28d7 with SMTP id
 v11-20020a1709063bcb00b006cfcf8628d7mr7652814ejf.274.1645825558357; 
 Fri, 25 Feb 2022 13:45:58 -0800 (PST)
Received: from [192.168.2.121] (p578f0c28.dip0.t-ipconnect.de. [87.143.12.40])
 by smtp.gmail.com with ESMTPSA id
 h3-20020aa7cdc3000000b00410b90f3ffesm1892707edw.56.2022.02.25.13.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:45:57 -0800 (PST)
Message-ID: <15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com>
Date: Fri, 25 Feb 2022 22:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
 <ab97c2a5-7705-eae8-9bc2-908e7a9cb709@gmail.com>
 <670ee336-9ad4-401e-e3b2-02531e975e51@foss.st.com>
From: Philipp Rossak <embed3d@gmail.com>
In-Reply-To: <670ee336-9ad4-401e-e3b2-02531e975e51@foss.st.com>
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v9 00/11] Restructure the rpmsg_char
 driver and introduce rpmsg_ctrl driver
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

Hi Arnaud,

On 24.02.22 09:29, Arnaud POULIQUEN wrote:
> Hi Philipp,
> 
> On 2/23/22 22:28, Philipp Rossak wrote:
>> Hi Arnaud,
>>
>> thanks for working on this! I'm currently testing/using this patch
>> series on my imx7d project because it adds the capability that the
>> remote processor can register it's endpoints dynamically (as mentioned
>> in the objectives).
> 
> Thanks for your feedback on this work!
> Don't hesitate to add your tested-by, this help maintainers for the reviews.
> 
I will do this.
>>
>> After a few tests, debugging, and checking the openamp specification [1]
>> I think that you missed the second ns_announcement that should be sent
>> from linux master to the slave after it created the channel/endpoint.
>> Without this second announcement the remote processor is not able to
>> send messages to the linux master because it doesn't know the
>> destination address until it receives a message from the linux master.
> 
> Yes I detected this issues, it is not related to the series
> but to the remoteproc_virtio backend.
> 
> As you mentioned, after the ns announcement from Linux, the remote processor
> send first messages. But the Linux virtio does not do the match between the
> local channel created and the remote endpoint.
> 

I'm not sure if we talk about the same. I'm basically talking about the 
dynamic binding, not dynamic endpoint creation.
I think I already found the issue. I will try to get a bit more into detail.

1. Linux: starts co-processor via remoteproc
2. co-processor: boots and reaches the point where it creates the 
endpoint like it is done in this ST example[1].
Be aware the src address is RPMSG_ADDR_ANY
3. co-processor: reaches the point where it sends the ns_announcement to 
linux ns endpoint
4. linux: receives the ns announcment, creates the channel, bindes the 
endpoint and checks here [2] if the source address is not RPMSG_ADDR_ANY 
and in this case it is not sending a ns_announcement (that's the issue 
when we use dynamic endpoints)
5. linux: according the openamp spec [3] it should now send the 
ns_announcement to the co-processor (slave)
6. co-processor: should receive the ns announcement and binds now the 
endpoint
7. co-processor: can now send messages to linux

This is basically what I'm expecting.


Do you think this is a bug or is the dynamic endpoint binding not 
handled? This line is there since ever [4] ...

Any other thoughts about this?

> This is a feature that is missing in the rpmsg virtio, and perhaps in rpmsg protocol
> itself (a ns annoucement ack message or something similar).
> 
> 
> A fix for the remoteproc virtio is available here:
> https://github.com/arnopo/meta-st-stm32mp-oss/commit/3e57fe73bd19c9bb835ac5a118e50727758b0b96
> 
> Don't hesitate to give me feedback on the fix, if you test it.

I added it to my branch and till now I don't see any side effects
> 
> I plan to propose the fix after this series.
> 
> Thanks,
> Arnaud
> 
>>
>> Cheers,
>> Philipp
>>

Cheers,
Philipp

[1]: 
https://github.com/STMicroelectronics/STM32CubeMP1/blob/master/Projects/STM32MP157C-DK2/Applications/OpenAMP/OpenAMP_raw/Src/openamp.c#L242

[2]: 
https://elixir.bootlin.com/linux/v5.17-rc5/source/drivers/rpmsg/virtio_rpmsg_bus.c#L425

[3]: 
https://github.com/OpenAMP/open-amp/blob/main/docs/img/coprocessor-rpmsg-ns.png

[4]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bcabbccabffe7326f046f25737ba1084f463c65c
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
