Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E5692F43
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 08:53:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552F2C6A5ED;
	Sat, 11 Feb 2023 07:53:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB173C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 07:53:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j25so7343236wrc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 23:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JdyJlJsLe7UYj3HkIh5IqELvu3xeVrpcZYgePszZnTM=;
 b=GLB3/AzmYk9r6d1M8HG+Xa6zUYiLBVeTfksz30BKXtFLjMOZAJt3SBE6RyR0tbn5MS
 DD4H3wi9V/SDQuDV3tGPPSl8qpypTSQsfCfK9egDFUGuj9TX5Bg/7M3aEj2dHPApTycE
 iVMMPBpYzZd0VtnU+lA9CnOYU9IA+UskmGMUMP/allk6UxbMwLl0hBxkiWxnQmmDhNk0
 Bz8WSmwAI5ueU77V8JEpyzEs5FhACjZuwfsvwtP+cMXV+L1AwI+vifHHRly2zvJG0jsk
 5IC2zBZPyhqDHEfyrpQvPJ1em2+wFTVJbqpatXgKrf7ezzHV/rk2Pm3qw34jJSH51cPz
 XCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JdyJlJsLe7UYj3HkIh5IqELvu3xeVrpcZYgePszZnTM=;
 b=UPomSp792a3yPofykLNbv6mq+r7/4w0RtZPCQB9ywZuOYQX/zOKEYozs+Q4aZCQ8dR
 JUJzGgIT2F/Niq2aa7CpI4vz2IIXy5VbTq+XZj6LZolwANClmASBglYZ7pQvHT0RwiP+
 FOetzxPaRoALg4yVn2WN4Rh2a7uBF2Tlc3/4bazUn/8fzxpl4sximWN7YwODgitVUrDc
 TfR79XSgmuBYldAy3DVahjaOnc4lvhWNh50+ihqVSiy/kRTc20XaMjaO0fY6uBa0n255
 6k4sBaoszU6zOYJUH61i6AKvR12d+pexJxi0t2w31mIm3OSzyQTsKw+R37AO4QXVwUP5
 feaw==
X-Gm-Message-State: AO0yUKW4AzX1hqF09gdrH8uP1zX2mR0KIhVhq4eM0Q7CQmD9NU67o67N
 IgqgyrxdGp34g9svc0oxF6pd+g==
X-Google-Smtp-Source: AK7set8ejeEopWyNZYhHew3TugHJmthNV0eduJzyC9rqBpPCVupmvHmzId1Mb4lViYTHg0iv3ePIXA==
X-Received: by 2002:a05:6000:8:b0:2bf:b5e4:cd63 with SMTP id
 h8-20020a056000000800b002bfb5e4cd63mr15123447wrx.8.1676102003159; 
 Fri, 10 Feb 2023 23:53:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 q4-20020a05600000c400b002c54737e908sm3787502wrx.91.2023.02.10.23.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 23:53:22 -0800 (PST)
Message-ID: <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
Date: Sat, 11 Feb 2023 08:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230211021023.GA13306@ranerica-svr.sc.intel.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

T24gMTEvMDIvMjAyMyAwMzoxMCwgUmljYXJkbyBOZXJpIHdyb3RlOgo+IE9uIE1vbiwgRmViIDA2
LCAyMDIzIGF0IDA0OjM0OjI5UE0gKzAxMDAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBBcyB0
aGUgbmFtZSBzdGF0ZXMgInRoZXJtYWxfY29yZS5oIiBpcyB0aGUgaGVhZGVyIGZpbGUgZm9yIHRo
ZSBjb3JlCj4+IGNvbXBvbmVudHMgb2YgdGhlIHRoZXJtYWwgZnJhbWV3b3JrLgo+Pgo+PiBUb28g
bWFueSBkcml2ZXJzIGFyZSBpbmNsdWRpbmcgaXQuIEhvcGVmdWxseSB0aGUgcmVjZW50IGNsZWFu
dXBzCj4+IGhlbHBlZCB0byBzZWxmIGVuY2Fwc3VsYXRlIHRoZSBjb2RlIGEgYml0IG1vcmUgYW5k
IHByZXZlbnRlZCB0aGUKPj4gZHJpdmVycyB0byBuZWVkIHRoaXMgaGVhZGVyLgo+Pgo+PiBSZW1v
dmUgdGhpcyBpbmNsdXNpb24gaW4gZXZlcnkgcGxhY2Ugd2hlcmUgaXQgaXMgcG9zc2libGUuCj4+
Cj4+IFNvbWUgb3RoZXIgZHJpdmVycyBkaWQgYSBjb25mdXNpb24gd2l0aCB0aGUgY29yZSBoZWFk
ZXIgYW5kIHRoZSBvbmUKPj4gZXhwb3J0ZWQgaW4gbGludXgvdGhlcm1hbC5oLiBUaGV5IGluY2x1
ZGUgdGhlIGZvcm1lciBpbnN0ZWFkIG9mIHRoZQo+PiBsYXR0ZXIuIFRoZSBjaGFuZ2VzIGFsc28g
Zml4IHRoaXMuCj4+Cj4+IFRoZSB0ZWdyYS9zb2N0aGVybSBkcml2ZXIgc3RpbGwgcmVtYWlucyBh
cyBpdCB1c2VzIGFuIGludGVybmFsCj4+IGZ1bmN0aW9uIHdoaWNoIG5lZWQgdG8gYmUgcmVwbGFj
ZWQuCj4+Cj4+IFRoZSBJbnRlbCBIRkkgZHJpdmVyIHVzZXMgdGhlIG5ldGxpbmsgaW50ZXJuYWwg
ZnJhbWV3b3JrIGNvcmUgYW5kCj4+IHNob3VsZCBiZSBjaGFuZ2VkIHRvIHByZXZlbnQgdG8gZGVh
bCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gCj4gSSBkb24ndCBzZWUgYW55IG9mIHRoZSB0aGVybWFs
IG5ldGxpbmsgZnVuY3Rpb25hbGl0eSBleHBvc2VkLiBJcwo+IHRoZXJlIGFueSB3b3JrIGluIHBy
b2dyZXNzPwoKY29tbWl0IGJkMzBjZGZkOWJkNzNiNjhlNDk3N2NlN2M1NTQwYWE3YjE0YzI1Y2QK
QXV0aG9yOiBTcmluaXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4Lmlu
dGVsLmNvbT4KCiAgICAgdGhlcm1hbDogaW50ZWw6IGhmaTogTm90aWZ5IHVzZXIgc3BhY2UgZm9y
IEhGSSBldmVudHMKCgo+IEZXSVcsIEFja2VkLWJ5OiBSaWNhcmRvIE5lcmkgPHJpY2FyZG8ubmVy
aS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MhCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
