Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDFB9C495B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 23:54:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB033C78F6D;
	Mon, 11 Nov 2024 22:54:07 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5885C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 22:54:00 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-71808e95ae2so2402763a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731365639; x=1731970439;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3qeQLVqGYO4ALLLE6OpBa6NKUVcn6gN8ZfFj0qfpOGg=;
 b=1jJ8DoaCQPUmJ21b9Xuf2BMxDS/tRJ+xZz+N9/0PxYyTrTAjLPGwh4FE8KsW1wStLj
 Yxl60PoxFPYvjfdLul42sgAZA+I6iS0cag990UFEdsz8sWAYWq+MXVZvf9blYW5JnzxF
 l8QaJpepm5O/LS0QATgzsQ8JGVPMMs0jQlrWTCQtXbYxMh9vKnAx7dxlEoZ3mYqJy6RW
 wLnqDtF766RJIwI9/c5V7a9Df4jy72M4VrlEW8JEyTf2v7rYaOCE+HwlwYzHdwjEsFSS
 6WSKrvNXjf48r/zbHgJXsufLxATZnsEqD41Op9Juny6I/nEI72wSUhuWgt4xkiljU6Et
 I9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731365639; x=1731970439;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3qeQLVqGYO4ALLLE6OpBa6NKUVcn6gN8ZfFj0qfpOGg=;
 b=ibC2FbJGHAfWsDlykI2mUgH15q8PUJG7P7l4MsK4pMxT9mNXmoKfzkl/LygFzmjlb4
 uBryH0BYZUXHKa+Oz0bBuFu8NG9+KkhxnmeW3+tZaDKAP/fUr1QuayeqhBerNHm0gFJd
 MsEcTFJbCy6Jym5+r/z2yXaba2SAPx8praTGijHmhrvXON/Xm/W4wl0GoppLJkY3KNfk
 HL7k9ntk8FYTELHFVtK7XGp5Xqh7N9YTti3/uEAHQIZr3kbRPEhjHOqM6+08w0lJYHbz
 fhdii5rXlXJybDYTaTPQOsXpOHNP5+TOeEwrenfWHFywpd1jQkCeBj8T8R7BNtcoO6C1
 oisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVelbUva6Mx+srfi9AdKzqMDL2kO+ASll1GCkTjbk+kEUKz/mONfWr742iJJndo/JbW5si17KyLzgI/LA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+5NxdeAxoELngDeOV/YdzPCNHziKF2B32kOdm8XmuuopD7F2o
 oCmrtkEpEHpk7OTib8YV7VUyuxkiYfoG1nujWUqKwRkYRWnEQs58YXUmlRESrck=
X-Google-Smtp-Source: AGHT+IFI70O9qWZLYbfZv+s3z1ZWen9vEBjFIao6aaE9nVOytwkkB4ogTBF3q06vdafFfqOS5zD5bg==
X-Received: by 2002:a05:6808:23d2:b0:3e6:4f60:407a with SMTP id
 5614622812f47-3e793ebe322mr7790726b6e.4.1731365639507; 
 Mon, 11 Nov 2024 14:53:59 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e78cc803a2sm2249913b6e.15.2024.11.11.14.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 14:53:58 -0800 (PST)
Message-ID: <f02fc95c-a2ef-494a-afbd-5af78ad1f489@baylibre.com>
Date: Mon, 11 Nov 2024 16:53:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
Cc: tgamblin@baylibre.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 lee@kernel.org, linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4] iio: trigger: stm32-timer-trigger: Add
 check for clk_enable()
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

On 11/11/24 4:23 PM, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
> 
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
