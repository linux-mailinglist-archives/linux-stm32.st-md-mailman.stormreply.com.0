Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66684B425
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 13:01:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B570C6907A;
	Tue,  6 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBBEEC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 12:01:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so35633615e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 04:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707220914; x=1707825714;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGty8q/svzrjFLQpyViYm1Qy6DYKcfDBjb0Oj61NnOs=;
 b=HF8mK8lC6CzoTlt+Vw6VH3IU3QmmJZIQqPBcnmMGOW7uHsrxetRX1x+PSPpTDVZgZa
 J+CBLr+yofv3SqqrZ1tgqTJlTWya0E8xnK/vOoonZKLl8fHB/l/6GK9XigWhhNezUjQn
 ZwWZfmtyqlk6lwA3UJgG/JuJrG3cpNElwRz9Wxa5D1VY/EkkEJD+YBl/X9muk2JxRzc/
 WLkIFS9yTcol+Jxt7j250xub1ylSv7XjE1ueKzCjdGzPYuouA4EXNjQL0hxJnRs1VnJ1
 f4E5u9Cf1cGv2uHQ8rY1v0ndO3MtiThGHot8CPikx6c7biGfEZXlZmtfldILzS6IcxeK
 a/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707220914; x=1707825714;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGty8q/svzrjFLQpyViYm1Qy6DYKcfDBjb0Oj61NnOs=;
 b=W7RNTh1ZJOm7uaa3ZLSTJv5JK/2itsRnWrYzBTvjr3opfmMjUp4LAEb0Jxsku3fwiX
 9Tk5UGNJkZ1hh0phZh+gqIJaUZ5n3UCTaXQTlGjwXnbqRH5hp6zbmgXBuatOCb21WIcY
 nH2+xtdPLjRTmxqrzxWrGI4Ge6mbZLYhZ+C1ikvRcqOtnTucy8aOuL/xcSQsnbI2XMrv
 GwSJL0vKY1PaxK0Dv+ihkP75Txj8hmSafcMMuoMlFXyFZfFpl21iJOYXc8hkxe4W7ccD
 Qh5nLclqf+bn4IKvowCezOLoQjLE2Q4VuwVTL9pokoNG/tAymmid9uXhVC6gVav6RXcL
 itog==
X-Gm-Message-State: AOJu0YyMn09FQMPMWl1OSYldBP8aqDYcPL4CB8w8gxOKD9CK6qtOJj7E
 cpDkwvfyzBi+25XzUFFa8hS7qC2iXyLvqME0mZzWfrkQMZ/dbIrK6FVvA5K6/4I=
X-Google-Smtp-Source: AGHT+IGxOhB9hlKMgawCDjNOSppEC0A+Oaeh7M7tW+j+i0QdB/cnHgQtC8JToPAJPqKp7Cm8sef72g==
X-Received: by 2002:a05:600c:348d:b0:40f:e7e4:5795 with SMTP id
 a13-20020a05600c348d00b0040fe7e45795mr879546wmq.31.1707220914166; 
 Tue, 06 Feb 2024 04:01:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWs0jM3vN+JUXZWX2oKEGIs/INN5l1B3dcCcoCtsvmyIc/DrY9VWnjWxLDoiOXer/RPpye90BIqmS0Enxfzns5w18b86qtQ/MJ748VnVKflnkaSM6et8SfUxFmTU6SDOEnBeRwT2W2uA0Z/m9xmd2v7SJEXJHKbdSawTpxmc82P9jvKTdbF5/nHuaS/wJpBFLHkFQjFHxKcxwOuCf4Z7Tle/aYDN/Ts165sIw3CUS2Ic1985DaAkN1dgpX9gYFu//mdmhflLk7XoGFvf8EMwFqqLbiZUY6IwAX+Jw/zMwbk4YHiqQB2+f4gFWjwFbCixxr4jvChXLm4oNwzojNSP3UH82jjPDnX4rXznmIeTCZqyL0aB5QULXMZQbASSUNGrRuRbOhVsfma2aPBHylxr858HyALP+CvIK+Bs7WN6ig36NybQ+L0ZpfjpGNibPyYdhGnRDs6FbP7E1+NzkxTZR17wuxDj/7VVVH6aIVnwJKsIrqcxATsLcnHE0uiHiy5YftQG7qj/ggPpX0S0Xi5D2vlAV9fCh52h9RMJroj0f9/ofJkRF3eO7s5ZeFNRSq3thjG2yXaYT0Qh9VWkCzFQeOM+jP7N5el9an2MeX0cV/2f6zJBzOGFVauASi7K2UnZ35AWMsdzMN/Q5CysIZrxCG5UeNXBeTESYdbL/trrg==
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a05600c34d600b0040e3bdff98asm1847575wmq.23.2024.02.06.04.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 04:01:53 -0800 (PST)
Message-ID: <f4bc2484-0e1f-4e5c-be36-c267539f3efc@linaro.org>
Date: Tue, 6 Feb 2024 13:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20240206-lvds-v5-0-bd16797b0f09@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240206-lvds-v5-0-bd16797b0f09@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/3] Introduce STM32 LVDS driver
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

On 06/02/2024 12:45, Raphael Gallais-Pou wrote:
> This serie introduces a new DRM bridge driver for STM32MP257 platforms
> based on Arm Cortex-35. It also adds an instance in the device-tree and
> handle the inclusion of the driver within the DRM framework. First patch
> adds a new panel compatible in the panel-lvds driver, which is used by
> default on the STM32MP257.
> 
> Changes in v5:
> 	- Fixed path in MAINTAINERS
> 	- Fixed compatible in driver

One patchset per day. Allow people to actually review your code...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
