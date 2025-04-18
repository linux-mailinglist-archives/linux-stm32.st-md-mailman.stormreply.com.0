Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C6A94028
	for <lists+linux-stm32@lfdr.de>; Sat, 19 Apr 2025 01:05:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DFE4C78F71;
	Fri, 18 Apr 2025 23:05:47 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EDF3C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 23:05:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72bccda48cbso1503328a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017544; x=1745622344;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
 b=vd0RAg4D9z+0bhXK+ghf2+8a5r52t++qbP786R5MqO90yslQ8uQIGxdFamzTGgw9yJ
 qTgnTlDy7NQ2djl3yGoCddHVNSZa1w06th0WZwxMuGcwIcme/mdt+4UEr+2TlQ2qKhCV
 56Oqm4PW9ZsGevTc6ZoMS+LA6Koqj/C/dP85FQuaeHvH1/RaiM5V7kOJGCB0STO3PKvM
 bMQ8iCwziEYGHIu71UYd62QsbIfpd5YTkwVKxod1MU1QqlDNhr8vYlfFuyHiw9JUJpNG
 mrOSvsVj5T1+yizXBal9IePKGzQb9dMjsZQt2IJvyXk+azdi3ZLR6nqK5Wz66ZGNytbw
 YL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745017544; x=1745622344;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
 b=v4LXybnpDyE/oGi4UmS7odw4KoI5k1yhxJVXeqph14meCHR2scK7BRAXz8jikNER1x
 iphKG6h+ThPdrtpRQ1dxxDDwUJycqtDz+BApGRU1q1XYOKt32D0W7zP7ZoyyPHC6LSBQ
 7UYYQBvdSJMqpb6kBcSP9VOy2bB45ms3hoeznJuviI7GAJWy+fmq9OQmRgge2AqWZt85
 U8q7vE68B/4PhJqJdCcwtVUoYk4vFP+raV6mVVpaP1k/itTuHeRT0LHs0oIOHnz1er+j
 85R/lp9ksvu71jack+YQzcaWM6SIUoJ5O4cfLPQ/7JCqdDcg+DNY+Vh6axvoq7pn5kgu
 vUcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXKyDCVYqOMJPKFuDsnH3n0DtfZdk3Iy9kpVh0P75aaIGNSp/TqHHt7HXIkyG9OL2O4A6IZq/nR5gCHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwilFIpB1dmkJkj5V0ROurn3+xaCyGIYZlC0ry2dnm+oBXiLK6D
 32INr1ZWOgtPyAKmXnBVAZo8KV2/cBlZHyH4ia41N2FcEH3+mJMFdlAiX2wPgG4=
X-Gm-Gg: ASbGncvlZEdqKTWIcVWk6jfcLlHKkk3iT/e3/DV3a0+qfDS+0nmhIRN0CQX3B6M9bFn
 tsG4j6kUs/gYSVoPL7D6S41ohCD+Q/yXkRH5RKhRv4ta5tkC8tNqMJbqpnMl8ShUsAp4q5B9fMU
 uSouVcrAx98YZSg3gMShwGZQQVATCkjE6CYkMyg8ynqOoLzWvQBgPFt4LV+ltuCSOoLhe3+zxRB
 6Cf4RY1v+A3Z7xocfexw+h065C6wYnCubz5FFjCCJs6Sx9/tXz06ShxIRk4bHo1sg95SwJn6e9N
 YFbu6741g7Z3viK9DBlnSm7CjTY73PqyYlz6yOLZfchpQxvy2gXHV+KXpnYT0KfKp1wen5SwDeL
 aT/yfRId1ws9SJLSsCQjFWJ7LezSt
X-Google-Smtp-Source: AGHT+IFo3+CGCCjL/MDLKOL98VKpPnk7r+cnqZ8GYDV87Srf78OvwPE2vbzd7+9ZcA062oFaVEN0Pw==
X-Received: by 2002:a05:6830:3693:b0:72b:9316:d596 with SMTP id
 46e09a7af769-730061f15a7mr2627791a34.3.1745017544135; 
 Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279?
 ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7300489c6e7sm502383a34.65.2025.04.18.16.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
Message-ID: <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
Date: Fri, 18 Apr 2025 18:05:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
Cc: linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: prefer aligned_s64 timestamp
	(round 1)
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

On 4/18/25 2:58 PM, David Lechner wrote:
> While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
> I found it very time-consuming to check the correctness of the buffers
> passed to that function when they used an array with extra room at the
> end for a timestamp. And we still managed find a few that were wrongly
> sized or not properly aligned despite several efforts in the past to
> audit these for correctness already.
> 
> Even though these ones look to be correct, it will still be easier for
> future readers of the code if we follow the pattern of using a struct
> with the array and timestamp instead.
> 
> For example, it is much easier to see that:
> 
> struct {
> 	__be32 data[3];
> 	aligned_s64 timestamp;
> } buffer;
> 
After sending [1], I realized that some (perhaps many) of these would actually
be a better candidate for the proposed IIO_DECLARE_BUFFER_WITH_TS macro rather
that converting to the struct style as above.

Case in point: if the driver using that struct allows reading only one channel,
then the offset of the timestamp when doing iio_push_to_buffers_with_ts() would
be 8 bytes, not 16, so the struct would not always be the correct layout.

As long as the driver doesn't access the timestamp member of the struct, it
doesn't really matter, but this could be a bit misleading to anyone who might
unknowing try to use it in the future.

[1]: https://lore.kernel.org/linux-iio/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
