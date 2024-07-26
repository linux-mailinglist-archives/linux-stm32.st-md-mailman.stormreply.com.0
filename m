Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67293D013
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 11:07:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF10C78018;
	Fri, 26 Jul 2024 09:07:12 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F270FC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 09:07:05 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a7ac449a0e6so126927466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 02:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721984825; x=1722589625;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
 b=Ld7gAh/gD5gMvy1Hdofezp3ymHy4YUMvWNdjhbCyG5zJgVIbwOFjVAY+e2vEQMp5Ol
 GDlMXQC0Dych3bsHH2dX03MQIH0AMLC6aOZU0BUgOJ2mPs8yvK8KiZ5r5+Hta3OX64NN
 r9m7hDXrxnducX/kIthqLkYSbU8EqWQulyEmKRu98cO5PPwGTQAO9d1MGGB06p34fnz0
 6AsPWo/Oj0cNBJ+hsMZTLa/pkDSGda0iiFyADqJi8yS8lCSdlBO/vxzw5zVd5evf0K1b
 OH3CfEE85owSy2++pd9gZZmbrhU/46nf/+xo9L0BgHH/7phssDpaiQspjrnZML35kbfp
 wmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721984825; x=1722589625;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bw4/r9lMITSTEkd5cCo5TIRQmnIQ1OcJpAvLpq+BYEA=;
 b=CsqBGuuZP+isuBafhMdcy5YgPZjbDmT0je1p/zmv6JnbwHvf8RRTf3zddUHudD0x30
 UxuJh+ad4qgTBgDQKcww0Hql0V0hugu4aApnnCAeAtWakx+HXwrCXBCmqfEmJU2qjw2E
 /NMfR5D5ZLBzfwPQlGFBK+LJnhWQl7VkFZ7B1N2d3/hUct8SrcuZD7CWNsUzt6gWVLXN
 3gd9IIpjVTif7pD+GHuesFlYm6QkYafJzNtomtVZhFjyWd83kPJyH7DZW1ywOlZ0nXTT
 Uw4Ndv+Glm5pdC1Yvp8gXL0zfLHxieshpiCtoGqB7iSQLYv3ZE9m/QMDHbeLiApr4a4I
 c1xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkf5C2ZsKjOogaf4Wo/fSRpZCpaZQbgKH+imvVBL8fBFyI3bxcc57xU4R58y80LDh+s5wkq9PY0RIdPRmnDzQNYR8e7g8puBthLTDkxIJaRdj9HbJ/e8FO
X-Gm-Message-State: AOJu0Yx5zrus9AOz8Yx3BfXgIl2/V331CI1ZazeAA7n7D6Vqk4OSB+YK
 xYOX3RdNgvxp+5tr7p1G0/tjHd0tUh+ToldONb7kIQpRzMyNd9gA
X-Google-Smtp-Source: AGHT+IEoQEUmgZstEOUR1vOkfuzEkJVmKeDZecSqcjIA/p+1ZM4shsAPY8qdln85IyZ6agB6BRD0ow==
X-Received: by 2002:a17:907:940d:b0:a7a:b977:4c9b with SMTP id
 a640c23a62f3a-a7acb4d1951mr323675366b.27.1721984825149; 
 Fri, 26 Jul 2024 02:07:05 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at.
 [84.115.213.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4ddb4sm152965066b.69.2024.07.26.02.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 02:07:04 -0700 (PDT)
Message-ID: <1819d604-a879-40a1-8127-5c9265eb8af9@gmail.com>
Date: Fri, 26 Jul 2024 11:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
 <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Lu <kevin-lu@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Baojun Xu <baojun.xu@ti.com>, linux-media@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Tim Harvey <tharvey@gateworks.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] ASoC: constify
	snd_soc_component_driver struct
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

On 26/07/2024 10:13, Charles Keepax wrote:
> On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
>> The instances of the `snd_soc_component_driver` struct are not modified
>> after their declaration, and they are only passed to
>> `devm_snd_soc_register_component()`, which expects a constant
>> `snd_soc_component_driver`.
>>
>> Move all instances of `snd_soc_component_driver` to read-only sections
>> by declaring them const.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  sound/soc/codecs/cs43130.c           | 2 +-
> 
>> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
>> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>>  	.probe			= cs43130_probe,
>>  	.controls		= cs43130_snd_controls,
>>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),
> 
> This won't work for cs43130, whilst what the driver does is
> clearly slightly sketch it directly modifies this struct before
> registering it with ASoC. That would need fixed first before this
> change can be made.
> 
> Thanks,
> Charles

Hi Charles,

thanks a lot for pointing this out, somehow I failed to compile cs43130
and sti-sas, which are the only two cases in the kernel that do modify
snd_soc_component_driver after the declaration. The rest don't do that
and I just double checked that they compile cleanly.

Those two cases where modifications are required rely on values that are
not known until they are probed. I think it makes then sense that they
are left as they are, so I will drop both drivers for v2.

Best regards,
Javier Carrasco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
