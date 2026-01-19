Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5495D3B11A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 17:32:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1C20C36B3C;
	Mon, 19 Jan 2026 16:32:21 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B956C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 16:32:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so3919651f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768840340; x=1769445140;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZGRyge8mUxn1upWUm4+fpElZBMmBnwRd/xao08TqzY8=;
 b=LOUGSzZh5+LCu0rEKOf8DD8iVHjjcFK+6e8aK9UFWndWqEgcrNGRCFtXpwlwzjytJz
 e+Ql+QBFa9m4oRJ2OEv2TluVRBrGda0F/sn4i5riJ/dh7crd8d6RZ7KTuJoul4/sIEP5
 PjoCbPTmQliOaXgRSD3QTxn98LXLtQxwcnC2PhXL9dVykecVI7fG64yNL2udQ36UBBUr
 YBHU3F9nAlh8d1rBW736F/TABdlNT3MKXJy6Ux3f/EtWc0Mipxl3Lt9rQUm0s0Qc1y6R
 Vb20d0JHyegrFsMfu6iJk8RLIRLXFW0sXpD9EnpAcG2e1TOW5lurdEJYdNlDWfa0AkGn
 ZFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840340; x=1769445140;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGRyge8mUxn1upWUm4+fpElZBMmBnwRd/xao08TqzY8=;
 b=SG0u42lVfK8YYzjAojzS0UabXVGsHhUiFe8VpC+wYRNxs/kUH2ciZ+Bwl/1HK8Y4MP
 zwMducL2pWTNv/jM5cVP3bPs31/UkJq0wS4BwqQA+d1uy1LYlkVOt/GLwQ0H8kN/tMv6
 7eaFCc3EF1MznFZzJm3KbfHF6coeRxFXgDiFKMLaEm5mxC8RPj9gDlvnixgFGV6WJqSg
 mg1eCQGLVK9Mq2B8sNEFsAMSdNaeKz0FcF0gv9G1khy4x2v3tP9J8oRqQmcIhK/CAYfi
 BTrs2i+DnbIVKRHQRd3j+QD8alcO573YuI6SGvmC2Sie7Db8W9ulpHJUiOvKfOXT4uxH
 uKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIzmVivl4mud7Zk5K3/WDth1HNxPvp4dK/PHcfQEiH3yHF3Ok8YM76PtGMXYay2ty5sYRDiMmSaShDUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+xNjGzOSF95ewgP4mDA3UCjLxK748+XszfiyDhEVRhUfsEiX0
 wHmYy37hVvzEtEjbAqoPd/Zliu3H4Ydfii3jR1d95layhaYgIBLh1qp13DbLvT5K02Q=
X-Gm-Gg: AZuq6aIdiyc+SNOTQrJev5LxPmYGYSLPPzxIxbIHBEtxDY+o449DcAhhwmzus4+ix5W
 pGDp533Ou34/AjjxOSYHBGU7eWMg91hSSAAX1n4KIeFp7rk+ahrUJU3/lHwaMJNBtFRgzHqHQai
 T9kWXxzbJLWcUvKdsIuzqMCOirEZX/EfIMRzQj0s5ZFoFNw8CcvdH1rj5y3kWQCXoJirKRINf3u
 h9TZqvXSHZNGJTT+PiHmIcoNej16PswB9Ntr+9LAEx4Dslj51AdpH4SQcl8+WOvU0aClGvnWXkk
 Q5alHWxClC7wmB+txwda2N3f6rCB2UE2ref3Kc4hmRa6RHrucrQDESPk1MY503ObT+ZaHbfPitp
 kcsvvvn9bciyrfuWjSJEVUAJCcMUafyP3g5J39+LBf6X1eU4teFmLaklVjgwQXhLb5HonNQYXCb
 acityh85PlOpn/h6Dl
X-Received: by 2002:a05:6000:186b:b0:430:f255:14b3 with SMTP id
 ffacd0b85a97d-4356a082ecamr13614502f8f.43.1768840339646; 
 Mon, 19 Jan 2026 08:32:19 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926ffcsm23594664f8f.18.2026.01.19.08.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:32:19 -0800 (PST)
Message-ID: <641fad10-e693-43ae-a278-1bf70d56b6d3@linaro.org>
Date: Mon, 19 Jan 2026 16:32:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
 <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
 <20260119154606.GE2732125@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260119154606.GE2732125@e132581.arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix Kconfig symbols
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



On 19/01/2026 3:46 pm, Leo Yan wrote:
> On Mon, Jan 19, 2026 at 12:35:23PM +0000, James Clark wrote:
> 
> [...]
> 
>>> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>>>    config STM_PROTO_SYS_T
>>>    	tristate "MIPI SyS-T STM framing protocol driver"
>>> -	default CONFIG_STM
>>> +	default STM
>>
>> The help below here says "If you don't know what this is, say N." which
>> makes me wonder if this should be on by default or not?
> 
> STM_PROTO_BASIC is a must have config when enabling STM.  While
> STM_PROTO_SYS_T is not mandatory, but it is useful to build it so that
> users can select the protocol dynamically at runtime.
> 

Should probably change that text to say "If you don't know what this is, 
say Y" then? Otherwise it makes the default-on look like a mistake.

>> Also everything is in an "if STM" block, so "default STM" is a bit
>> redundant. It's not that obvious what the intention was.
> 
> They are two different things.
> 
> "if STM" expresses a dependency (the module depends on STM), while
> "default STM" means the module will be selected by default if STM is
> enabled.
> 

Yeah they're the same, it was just a minor nit that "if STM, depends on 
STM" seemed redundant (and obviously more error prone). "default y" 
would also be the same and not repeat the same thing twice. Don't think 
it matters too much either way.

> Thanks,
> Leo
> 
> P.s. I also tried using the "select" and "imply" syntax to enable the
> protocol configurations.  Based on testing, I did not observe any
> difference compared to using the "default" syntax.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
