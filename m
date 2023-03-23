Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F24386C606C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 08:11:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD138C6A5E7;
	Thu, 23 Mar 2023 07:11:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95839C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 07:11:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cy23so82367712edb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679555475;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rb5mZbbPjNdQ4g0YhiUoVsLvm1nZGoz4ulw8+49GlEM=;
 b=T3y+SDKCHBip4M86kHfutYQmXd2/1dAWQw2QA29dX73JpEPjrEZvm8O/qz1X3VXBa8
 2lbFF4xnAQ3uMOKAHLL9mWECxHi7owKC/oy47Mh6ojH24Cv7EDZHxDaeTWUL+bfQDk5j
 kEP69TwzYpNsvhG2rM8DtGUVeQ8FiS1mSRDIkVP9l4KphD0wEliq6sQwRkjfFCdDfIc4
 Hf55GRNAcooK9eVx23lvxLY9y5Gp9jpSdNB+AGSMLAcaEYZU2rhwP6f/6cfuzt13SLMF
 nsXR5bWTpoquhNXb2p4ODlfYXRMjJmusXQLxhIc4XXYe1qUGGh3tUXy9IYhyoke8i7dz
 3mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679555475;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rb5mZbbPjNdQ4g0YhiUoVsLvm1nZGoz4ulw8+49GlEM=;
 b=7Qah0IVN4zAHjXI/pN1TJQk6Fpsaa2/NUXyDdzMh3hQywoDND8y6O3J/Yd+m3SIW/M
 W8pAi1tfDMu4f0rC2kttnvJRCjuyKc8uE65OwCzCtyR670RTO2tr9erExFJ14M4VPnhf
 Z8qvo4l2VWptSlqckssMOI/BLwWEnxDrOVm7Vphy8JbNvQtP7+6BpeTss3r9nkuxVR2r
 /qmRxByie6OtujDcTRz+CfAabC9Kp+Ke0iES+0hK9xCGtzPm3qVzdngt6dnugpc78USD
 14slYXULcSpVd7Qfr9pYuIn7D0CkrneaOxrni0an0CCUD8n8bjO0NJfa+aw68b+uVxBZ
 NPoQ==
X-Gm-Message-State: AO0yUKWT7mE1xvSZU+735yYwTUwzhrC2DSO5unApgq4VdhcxbeERsgBs
 tDRubp+0ZpnwmdIkfQtpP6M1qg==
X-Google-Smtp-Source: AK7set81vkHKd3YguUdxWt5fBpX1xbFzL+lC63f5hyyGYF8Q/UvN90mRYMpY2Eocns5dZFPGxcf9LA==
X-Received: by 2002:a17:906:2921:b0:930:fe49:5383 with SMTP id
 v1-20020a170906292100b00930fe495383mr9323227ejd.76.1679555475137; 
 Thu, 23 Mar 2023 00:11:15 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 k10-20020a1709067aca00b009294524ac21sm8236498ejo.60.2023.03.23.00.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 00:11:14 -0700 (PDT)
Message-ID: <5591f9a7-ace8-673c-9738-71efe047dbd5@linaro.org>
Date: Thu, 23 Mar 2023 07:11:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230311111551.251675-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230311111551.251675-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] nvmem: stm32-romem: mark OF related data
	as maybe unused
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS8wMy8yMDIzIDExOjE1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IFRoZSBk
cml2ZXIgY2FuIGJlIGNvbXBpbGUgdGVzdGVkIHdpdGggIUNPTkZJR19PRiBtYWtpbmcgY2VydGFp
biBkYXRhCj4gdW51c2VkOgo+IAo+ICAgIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYzoyNzE6
MzQ6IGVycm9yOiDigJhzdG0zMl9yb21lbV9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNl
ZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+IAo+IFNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0K
CkFwcGxpZWQgdGhhbmtzLAoKLS1zcmluaQo+ICAgZHJpdmVycy9udm1lbS9zdG0zMi1yb21lbS5j
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyBiL2RyaXZlcnMv
bnZtZW0vc3RtMzItcm9tZW0uYwo+IGluZGV4IGJhNzc5ZTI2OTM3YS4uMzhkMGJmNTU3MTI5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYwo+ICsrKyBiL2RyaXZlcnMv
bnZtZW0vc3RtMzItcm9tZW0uYwo+IEBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzdG0zMl9yb21lbV9jZmcgc3RtMzJtcDEzX2JzZWNfY2ZnID0gewo+ICAgCS50YSA9IHRy
dWUsCj4gICB9Owo+ICAgCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMy
X3JvbWVtX29mX21hdGNoW10gPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHN0bTMyX3JvbWVtX29mX21hdGNoW10gX19tYXliZV91bnVzZWQgPSB7Cj4gICAJeyAuY29tcGF0
aWJsZSA9ICJzdCxzdG0zMmY0LW90cCIsIH0sIHsKPiAgIAkJLmNvbXBhdGlibGUgPSAic3Qsc3Rt
MzJtcDE1LWJzZWMiLAo+ICAgCQkuZGF0YSA9ICh2b2lkICopJnN0bTMybXAxNV9ic2VjX2NmZywK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
