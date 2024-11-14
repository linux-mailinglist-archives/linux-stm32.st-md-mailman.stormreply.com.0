Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF59D4185
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39C26C7A84C;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2448BC78F9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 09:49:24 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5ec1ee25504so159215eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731577763; x=1732182563;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
 b=mbi2VlCNgF/f4hgQgo37YteUmOsgZ0OrkEU2gTeKctspP286XfNnvPWpmdWCSrY85r
 HPUGD1catpxlTh9gxed39eSd6mIJ7B47DkcQyHKoQZn/nqgY+duNNYe93g1INUMYt4g+
 wnzWVu7cmxWkefTeYXdts/WLn6V3bZ8koN3nqxnIG2G21pitZKDETRgyUX582magAxBA
 NuZwZeFMtRPpcbR8Yc/l5x7b8TwfS8Wl9j8MN1mxLeM+DvW8kQZ8d2gpyTcwVzplb4O0
 /UUj7TzFyizsfwNMStINUgncgS0HwO9wXUPgulELnxyn4XO15VTqsOtQ6wRcuBda5f3e
 vVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731577763; x=1732182563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BJ007AyfFSmUh1mOpRxq8pHzHMlQHIiPTiwXlN1yM+4=;
 b=VfbiFWfCTYwq4D5aCnaV90Zr6zgyj+YI7qdEN/GKLZLWfr3MqpFASMHiaIbRKpI0W6
 lQxjPiIqpcOiFiPRgnkfUpqBZSfwbGEECldMIQMUddIvsTmq5dLN1Y4Um/YjSlfWG3jA
 JsHmvdk9X2FXfMi7iBa5kMn0iHz8IV+C1Yrgn2G8yfrjMfmApKngrAjgFSX8Ik8xpzli
 62N7W6XID/YQuPLJlsIXKIQE89ooBB71F/Nlk7FIIjnX7+i7f1DGddyuZpBolEGaslJU
 /annQe1q16LB8nP3FLec5OG43n3Zx8Wlpu6jVdHSaL+lJnk2RFLSAwh0393+bMtEIIIw
 NGbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEnsMc+vGDFfgJtelDd00x05eqcmXgUoD0j++nidDo8qMbirEzUztTEECS2qGbBm0rZcqwFswjNLAjVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3w94xIFKPU5U/lEqYudND20NGNWwwMUqfumvrxk7KWlefmtFq
 1WyxDYWb7FdK30W7M7i/gQPYTVJRZOx3WjvrP7htrkevEWYoF3b8
X-Google-Smtp-Source: AGHT+IElpYeRFs0SFCU7YxvfDnm+J9VKwBd+r6YY8KKPQksjpdgonuoZU+lvxZoNdrIbZVA3+RzO9w==
X-Received: by 2002:a05:6830:631c:b0:718:c2e:a193 with SMTP id
 46e09a7af769-71a6010a842mr6854545a34.10.1731577762840; 
 Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f8b37e01easm713510a12.24.2024.11.14.01.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:49:22 -0800 (PST)
Message-ID: <8e55e276-f2ee-4679-8e0f-ca5afb3653fc@gmail.com>
Date: Thu, 14 Nov 2024 17:49:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-4-a0987203069@gmail.com>
 <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac support for MA35 family
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

Dear Andrew,

Thank you for your reply.

On 11/14/24 10:56, Andrew Lunn wrote:
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay = 0; /* Default value is 0 */
>> +	} else {
>> +		if (arg > 0 && arg <= 2000) {
>> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
>> +		} else {
>> +			tx_delay = 0;
>> +			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
>> +		}
>> +	}
> The device tree binding says that only [0, 2000] are valid. You should
> enforce this here, return -EINVAL of any other value.
>
> 	Andrew

This will be fixed in the next version. And I will correct error messages.

Thanks!

BR,

Joey

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
