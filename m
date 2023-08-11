Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358A784736
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 444F7C6DD61;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A81EFC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 16:59:56 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-583a89cccf6so26369757b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691773195; x=1692377995;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=untyu5cPkqSeocr0e7g2AJW7Kz0HzBWNtTUvQZTy5oo=;
 b=5DP5lJFUvhDAbakc42v4F6JhqNfEhtf5706jOwb2pothaFWwWgrdshBhcnAIMtavPr
 y5Z9j14rSov3qH87AxlPd7GF6WPMskGlusDvru9TglXcqpt8Wy/1UoOFApBCg5egEzjg
 Fc6eRoyOMA7Dv4Eouq/dhZLubCTc68v2UhlSzNuLZNSP0RxAGJIP1+p6BHawezq7QUbQ
 mvkR3HSw/Qq+7ZYbVXt8cj2poIsnXH0GoFIB683vBnd6CJemFeGqHL5xMmtiXsV2V1RJ
 9A8WC6whP4mbbnGt6z2O+9Kfe3he3HqXcp0Q3LYsoOrNrgQILYMHKp2t1f8Q4/Ufdxs9
 agIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691773195; x=1692377995;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=untyu5cPkqSeocr0e7g2AJW7Kz0HzBWNtTUvQZTy5oo=;
 b=NT5MDx61lf72Tsaics38qhm3QDsFcp5uUCSewMuSVkvvQbDU+kqs/1fENBvJDaAois
 hJj62odbJGdENz4jc0eLmMoDkxadqZ8bxEeLOKvgM3B+UZGJwyRYP6NCXIBW6OZrhmyh
 UzKjJ9+/mdPy++A4hKb9LwKmi2i0fv/Cx+YJhTQZbElXqzw1ep2TJ5CP/W96SSD4Si7V
 dQE/oN41jzAyeTCFEvAHdhDKnQ8vfCXgrJ/zetbQeYpuWQUCJAAXU1pXxw8Qd3D3+oVl
 N7EBxvZGT1yaRm8Qk1skg+TM+qZb+3xd9iTM7DEjuTrmuqo5pSj4++L0o7NOeZX3QnfH
 MpHQ==
X-Gm-Message-State: AOJu0YxrBoxxQPMPCDlX146JsZ6OKZ7dQQksCJGatWRDgx8Z8L4sdPic
 v09sRGUdg9VaaB19AOmVzLnbacE=
X-Google-Smtp-Source: AGHT+IFdOZHUUKKXlMAzPVp6EEK112wR0UOVV5jhW02Fden7yGUp6sTA53QQzugnAjHIrOqphKo442I=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:4f43:0:b0:d3f:ccc:2053 with SMTP id
 d64-20020a254f43000000b00d3f0ccc2053mr37037ybb.7.1691773195549; Fri, 11 Aug
 2023 09:59:55 -0700 (PDT)
Date: Fri, 11 Aug 2023 09:59:54 -0700
In-Reply-To: <tencent_9C20DA1AB80A0564315EF2A91CBF7A8C260A@qq.com>
Mime-Version: 1.0
References: <ZNUnxJ26/4QfvoC+@google.com>
 <tencent_9C20DA1AB80A0564315EF2A91CBF7A8C260A@qq.com>
Message-ID: <ZNZpCqw7YiN7H3mU@google.com>
From: Stanislav Fomichev <sdf@google.com>
To: Rong Tao <rtoax@foxmail.com>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: yonghong.song@linux.dev, chantr4@gmail.com, ast@kernel.org, song@kernel.org,
 rongtao@cestc.cn, linux-kselftest@vger.kernel.org, deso@posteo.net,
 xukuohai@huawei.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, iii@linux.ibm.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 jolsa@kernel.org, zwisler@google.com, rostedt@goodmis.org, kpsingh@kernel.org,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next] selftests/bpf: trace_helpers.c:
 optimize kallsyms cache
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

On 08/11, Rong Tao wrote:
> Thanks for your advise, you are right, i just submit v2 [0].
> 
> I just found that, because of the modified patch, your email address was not
> obtained through scripts/get_maintainer.pl, so the v2 [0] email was not sent
> to you, sorry.

No worries, as long as it reaches the list I'll get to it :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
