Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1570C289
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 17:36:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DEA0C6A61A;
	Mon, 22 May 2023 15:36:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 004B3C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 15:36:21 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso1223481b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684769780; x=1687361780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DenES0KQSjrCWYfYQgXjcF0k/ImoCZJgCineCmXx+NE=;
 b=jASfy9rNHOxQwklay2dl4HeJfqhrXM71IqRNK25gCbRc8zhxHX1xrhfX0geOpAgTJq
 XyeDtcJk8UZYGfNrZqN3ijB11s5Bs3QsX5Cv7MfFgQfd+ZVuVwIaAgVpxGwwMRyxMW8F
 oADHQ2s5A/1zr8r6IibKMoSQcwpoNg269LCdwzHdvFaG5qGo2tlwycSFg5f5ru/NQpOb
 /XYub7ZNNyeD3mRl9rob1nesDHRLBnbOA3qJ9aid+EX9zCmLJCpjYAyGpI2FquCdRra0
 24IZnWPrM6RzIpBfsgga0JOYD7LoBkVv2dTgyP9TUXgKVpbUTYOpnXmhYjI8NIO1Gsv3
 Gjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684769780; x=1687361780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DenES0KQSjrCWYfYQgXjcF0k/ImoCZJgCineCmXx+NE=;
 b=U7Hs7vinIrtyaSTt4PiLvVOrFY4L+zArYsv7r6gtmlXd7qB/WySzg4p0JNVEFuJ58r
 bTdgN3DoiKiJHgiUhZC0/XBFmhaUTr5dSz2uu+sopo9u2LJlT3gVoNwHawX9JfMPYXD7
 JTQXrsTCpGiCBSCBX8+REcenkW+ZE7fHzXvfM5EgOoy16l8SvdmYm/sRRiAvDCrmgn6r
 PdQxez1L5MOIG14rYZkboSL08+z8gikBH1Ty47iYQUv7rQAE3oUtM5KpZG4YwctIJlWT
 3p6JumRI9+a4hCZWnBuZFF1/kjQaazk+bL0k6K9gLI9Jl4vi5XVVflcpNNpLX1JJ7gwL
 Qrrg==
X-Gm-Message-State: AC+VfDwGwLD7wSXy85ST8DSTOxzDz1mu2A9PYnNeJ/qcacL17mvyAVmY
 t9oCLLh0vADDFJn2L6rO/rM=
X-Google-Smtp-Source: ACHHUZ5kMw3+1b6tLTszJJvFqHHI3vChTGvGuyKIosGush/AiROF93kKWL+uNb5ZHIVOgEby3Ng5/A==
X-Received: by 2002:a05:6a00:248a:b0:64d:5b4b:8429 with SMTP id
 c10-20020a056a00248a00b0064d5b4b8429mr8042391pfv.18.1684769780446; 
 Mon, 22 May 2023 08:36:20 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-81-153.dynamic-ip.hinet.net.
 [36.228.81.153]) by smtp.gmail.com with ESMTPSA id
 w17-20020aa78591000000b006414c3ba8a3sm4447849pfn.177.2023.05.22.08.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:36:19 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: ecree.xilinx@gmail.com
Date: Mon, 22 May 2023 23:36:15 +0800
Message-Id: <20230522153615.247577-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9e6b813a-bc1a-6a39-904d-5c45f983cd23@gmail.com>
References: <9e6b813a-bc1a-6a39-904d-5c45f983cd23@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, simon.horman@corigine.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, minhuadotchen@gmail.com
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

hi Edward,

>>> On Fri, 19 May 2023 19:50:28 +0800 Min-Hua Chen wrote:
>>>> -		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
>>>> +		if (p->des0 == cpu_to_le32(0xffffffff) &&
>>>> +		    p->des1 == cpu_to_le32(0xffffffff))
>>>
>>> Can you try to fix the sparse tool instead? I believe it already
>>> ignores such errors for the constant of 0, maybe it can be taught 
>>> to ignore all "isomorphic" values?
>>>
>> 
>> I downloaded the source code of sparse and I'm afraid that I cannot make
>> 0xFFFFFFFF ignored easily. I've tried ~0 instead of 0xFFFFFF,
>> but it did not work with current sparse.
>> 
>> 0 is a special case mentioned in [1].
>
>I believe you can do something like
>    if ((p->des0 == ~(__le32)0) && (p->des1 == ~(__le32)0))
> and sparse will accept that, because the cast is allowed under the
> special case.
>HTH,
>-ed

I tested ~(__le32)0 and it worked: sparse accpets this.
Thanks for sharing this.

cheers,
Min-Hua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
