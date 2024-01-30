Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883184246E
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 13:07:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C484C6C841;
	Tue, 30 Jan 2024 12:07:10 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25E3BC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 12:07:08 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-42aa0f7ea98so14231061cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706616427; x=1707221227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gyBHy6pI3FKKoVKb9OTIKEEMGOtNOKqEi6iRWPGhH/c=;
 b=QRRw9ZaaintsAV7kBTEutp5g9tRLQMbjUBMlxKrxr4BuRGhz72og4fN91zx2ricj5x
 60RqSr0qsKJZtO5YWSJzS6FM5nDP26LigdxvnT3MiagANxk80rMq6fwSHeZmYN19JJ6P
 QdBPVREgX1YpHGT7W/t0RSxz6z2QSwFp26ycOI2tuW6KvCTm57NbIm/HK0Tw8JPuZAqC
 VwcX7ztyXns1Nn4Liqz3qwsxbIaXZ8Qcrnz5RTS7vgDUdNn/fRbiuPvyhdibQuegsDq6
 tHU9KFSFEDHideTyZwV9I8FM4tdzD/VMXnbhZLdo5mO3yX/ZgK5XzPXk9cDTFiDPSc2d
 fSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706616427; x=1707221227;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gyBHy6pI3FKKoVKb9OTIKEEMGOtNOKqEi6iRWPGhH/c=;
 b=jllWM5zWdxIfLnVfI93yTsmhejcNsX52AbUQcmfRX3ZGW1lKx2RSvtEMK3uabUJ7d4
 bwmKYPowLFvS8VT3OuSuop4FK632MnDR0V1j+XREasD/8kGI7lWWyIh+ru+WAzSs+bjM
 2ERby/w3QhPUNhXjfNOKGMNdMyrozJ1R9J/IchU9J1EhnuUanftxw9219HJ9fm++l/5Z
 SpnUoaMEFYLrfF3OA9NoErCW+lXOvVE4m7MUkaF6kTyb8UHFX9frbihB14NN+OLcafwe
 FrFo69Xt8GQGVWAxuovF8UYWchmIOXA9hVgT/bHjM12uYujDCd5tpbvCE3d3EVr75H7Q
 VVWQ==
X-Gm-Message-State: AOJu0YxWEzjpCi2y7Mw78WDX0FoC5rVsrH587JZvvHSe3LTCL/2993kt
 I6lefPiyaBNsYtarDcnhV+WSo2aWBmES1MCIioZMXMYkLzV1lix3mtsfRdmtj/g=
X-Google-Smtp-Source: AGHT+IERY9Zv2jVzCd4DvnU6wA6agETCSIskOYvzOQIUam41P+N4PPuEHCzoFn1GMey31SjNHSsVEg==
X-Received: by 2002:a05:622a:301:b0:42a:6e58:6746 with SMTP id
 q1-20020a05622a030100b0042a6e586746mr9743162qtw.81.1706616427104; 
 Tue, 30 Jan 2024 04:07:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXUH9FEea4MA7CbUeiDaF1BqWKSWk4sK+zCApudPeKt/JpEUuB5eQ6iVRhv/uzJWHZ2JiqOmuf1cjCYY8Ee/idNV0RbW+nfZ8+fxJjeK44CmpwgPqJ4lyDgfXlZBP694HjrWQ67ihmEg8JsEbfMDcq5SgeUVvGbXd7z2OzXcMWxVXn6w5ntZZ6AhN3X4Sx7HCBsZnXaQjrFa7OSDGYBiOdrmUt1PFIK8bBmKP9RDxHQclVqcUeVUD1Ynzp4NxS8uRx7eHyrlJfJk5RtUNalx/Wmhpw3eoMjQkE9cKT0BUGAs8S6nKxdYa9rJD6LY1ltr7e3UXu3c2JzKlM4vTPa98SHCQNyd8WcdpszYTdHJLa41uS9yfm+cbL7IYiwVXl7yu5HCuv/zsjV49DY4G/u4EAnc9jlJ0DzTj6e/d7cYkohWKwK1Y64eIqaK7H+edx/IMIYPUWQYxEZBYcxfr9MwjZaw2yWBPdIuz2LcMDtxJ89SWCcYeJP6VcWWTB07waFuKxB3j9Yj10KNFnBqThmPB6lfdLePVQvZt7GyB+A6WFqNN/ySZ+nD6zTsl6mrWyeRdEFvhuCYZAX4yzakNv4rcSmKwi+G2nj2Ist+d5NM0ZcGCbzJMvJBTFJOWWMTF94l7LCCcfNDmV/nvilBfXym6SGH/432QbEj71DvuFigYvPo/7ivacKoy7cMFh5qmecd3Vs4+BA89dRSFdiY4A98huG0ikX7W33/Y2PTsX9Pf61arXohYfccvP7xgRFRLGxCWZ5b4y3RwMionN/MA==
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 bz9-20020a05622a1e8900b00429d3257dd6sm3274367qtb.45.2024.01.30.04.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 04:07:06 -0800 (PST)
Message-ID: <84f63696-7e5e-4824-b80a-be12a32d90eb@linaro.org>
Date: Tue, 30 Jan 2024 13:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney
 <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
References: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130120306.4120632-1-quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v12 0/3] Ethernet common fault
	IRQ support
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

On 30/01/2024 13:03, Suraj Jaiswal wrote:
> Changes since v12:
> - Update correct sender email
> 
> Changes since v11:
> - Update debug message print

The limit is: one patchset per day.

You just ignored feedback you got...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
