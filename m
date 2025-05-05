Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0085EAA9390
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 14:51:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6043C78F63;
	Mon,  5 May 2025 12:51:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC0CC78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 12:51:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39123ad8a9fso258746f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 May 2025 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746449482; x=1747054282;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
 b=ITT1saBgI3dKdyNM94j/eNoYESO4rMRNQSkv6JZVguYg/twzxAcBXlZC6fLV0TZekN
 H8DOuiwnWaWLF7nWRdx0/y9R7HWiSVzPadDNf99xsos9E0Npjr8ZPaoa+4kMQXgQ90pE
 RFkS5SPQ4mKqJacxxJqbsWXQb/MOsTuIl4UYr6nE5O1ORzYEmc6lpmSlM0Zn9NrtClRx
 gM7dnuKYGb6OgqsRGM+sxt5GoPA9yPG60qMDOdOdc4KHQbdETS6ixTW6fnzKggkAqv40
 znWqB6ASODRKt+E9BUpSG49cyCQe16NqtuNKlWD8LnPYzJTYbsuFCJsVBVy5h5yAa0qj
 IVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746449482; x=1747054282;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
 b=o+pvfeB2vm+S9vZqbo5DzCHxcpFYqXsO1CMAE+b5Bw5S9jXWviCSxUCd15r4usE9zZ
 pinNGdhYYBlkmMh4CQU6zMplglyBCK7fDlGkMV2nenQV8RVRnxceiXfj4E1vGC/FitBV
 e9q3MC2MthC5Om7uCkWl28GBGiFRlWvMvgZHpjQqLDMDFFb2F27zcU63Oc6Y7c/iYj3W
 8VL615132eLAYuS9zeKI8m4aEzZTwMmg+QARjp2xmp/qQDdjtGvKp5o6q/Xrt5/rtnRb
 uhcgE4d3v0qYSpQw9/s4iWyQVErxvbZFDaOc7+X5bNShDz2S1qWGb/Az2svUROJCzS+D
 sHWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVokzJH+RaIDsG7TO9H+TvBG3w8D3G0g47/btAj8txBWHODHEG0TXZOkg6u7A7soETVHsrS83Oz9h1aQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3z6z9NzPk4dcPJQXGgbYLtQixhAH4QC6pihP0LBTVKcrsjbny
 nEQc+Et3nkNVAUEfL/ZgiLzkc/ZNjjvr/eMpV8AdJK3VayCswi6fcLJPilv5q5k=
X-Gm-Gg: ASbGnctgOwx74CiL3+J2T9Ejf89JL/VBAriexqZnHPEWRgpNR+TO8AdKSpvIR/CzbP2
 xOUcs+7FUq8IUxbXWpIgVzm76uFq0uR5jZPS/kLe9DAVgKYtwV6QeH0SwxwHQkyInFMS8vgQlCN
 MNraM4z1jNgeRh55qNUJfyDo0Pqg37u2AtKanbHLVipSZxbuWCUo3AuKQHIGrwetaFPq27Ym1so
 v+vYK2OsbiWn5TgM08MGZ6qeuLra36tTwy1PrJaX0DV3USjeROce2fE5iLHMeCsW99mCfWVzzvv
 4gJQLITOZjMNTHiMvc0TXD2zd6hJg/7KUCgQwXZNmvMVi5WFvjXpgHv/Gxw=
X-Google-Smtp-Source: AGHT+IFh9MqrVoggZusz4VHj0uAdGrHI1bTqOdCSn/SPHpGaUlPhaICa/6fcOPCGmTg/zC8S7KfQeQ==
X-Received: by 2002:a05:6000:1a88:b0:3a0:6c12:237e with SMTP id
 ffacd0b85a97d-3a099af3ac6mr3160293f8f.16.1746449481965; 
 Mon, 05 May 2025 05:51:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0ffbfsm10134616f8f.80.2025.05.05.05.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 05:51:21 -0700 (PDT)
Message-ID: <a53149e6-2273-458f-9fa3-89fec112f4d4@linaro.org>
Date: Mon, 5 May 2025 14:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
 <ec294e4f-274a-45ae-ac10-464ae4ae6f66@kernel.org>
 <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 0/3] Add STM32MP25 SPI NOR support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDUvMDUvMjAyNSAxNDoxNSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDUv
NC8yNSAxODoxNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMDQvMDUvMjAyNSAx
NTo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+Cj4+PiBPbiBNb24sIDI4IEFwciAy
MDI1IDEwOjU4OjI5ICswMjAwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+Pj4gVGhpcyBzZXJp
ZXMgYWRkcyBTUEkgTk9SIHN1cHBvcnQgZm9yIFNUTTMyTVAyNSBTb0NzIGZyb20gU1RNaWNyb2Vs
ZWN0cm9uaWNzLgo+Pj4+Cj4+Pj4gT24gU1RNMzJNUDI1IFNvQ3MgZmFtaWx5LCBhbiBPY3RvIE1l
bW9yeSBNYW5hZ2VyIGJsb2NrIG1hbmFnZXMgdGhlIG11eGluZywKPj4+PiB0aGUgbWVtb3J5IGFy
ZWEgc3BsaXQsIHRoZSBjaGlwIHNlbGVjdCBvdmVycmlkZSBhbmQgdGhlIHRpbWUgY29uc3RyYWlu
dAo+Pj4+IGJldHdlZW4gaXRzIDIgT2N0byBTUEkgY2hpbGRyZW4uCj4+Pj4KPj4+PiBEdWUgdG8g
dGhlc2UgZGVwZWRlbmNpZXMsIHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3I6Cj4+Pj4gICAt
IE9jdG8gTWVtb3J5IE1hbmFnZXIgZHJpdmVyLgo+Pj4+ICAgLSBPY3RvIFNQSSBkcml2ZXIuCj4+
Pj4gICAtIHlhbWwgc2NoZW1hIGZvciBPY3RvIE1lbW9yeSBNYW5hZ2VyIGFuZCBPY3RvIFNQSSBk
cml2ZXJzLgo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Cj4+PiBBcHBsaWVkLCB0aGFua3MhCj4+Pgo+Pj4g
WzEvM10gZHQtYmluZGluZ3M6IG1lbW9yeS1jb250cm9sbGVyczogQWRkIFNUTTMyIE9jdG8gTWVt
b3J5IE1hbmFnZXIgY29udHJvbGxlcgo+Pj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9r
cnprL2xpbnV4LW1lbS1jdHJsL2MvNDNlYjFiMjg4MDcyNjQxYjdkZThmNWQ1YzE1YmRlNjllNmU4
NTg5YQo+Pgo+PiBBbmQgZHJvcHBlZCBldmVyeXRoaW5nIC0gaXQgaXMgZnVsbCBvZiB3YXJuaW5n
cy4KPiAKPiBIaSBLcnp5c3p0b2YsCj4gCj4gV2hhdCBhcmUgdGhlIHdhcm5pbmdzIHlvdSBlbmNv
dW50ZXJlZCA/Cj4gCj4gT24gbXkgc2lkZSwgaSBkb3VibGUgY2hlY2sgYW5kIGZvdW5kIG5vdGhp
bmcgd3JvbmcgbmVpdGhlciBvbiBiaW5kaW5ncyBzaWRlIG5vciBvbiBzb3VyY2UgY29kZSBzaWRl
Ogo+IAo+IEkgcHJldmlvdXNseSBjaGVja2VkIHRoYXQgZXZlcnl0aGluZyB3YXMgdXAgdG8gZGF0
ZSA6IAoKc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg6MTE3OjU6IGVycm9yOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yCuKAmHN0bTMyX2ZpcmV3YWxsX2dldF9maXJld2FsbOKAmSBbLVdlcnJvcj1t
aXNzaW5nLXByb3RvdHlwZXNdCiAgMTE3IHwgaW50IHN0bTMyX2ZpcmV3YWxsX2dldF9maXJld2Fs
bChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QKc3RtMzJfZmlyZXdhbGwgKmZpcmV3YWxs
LAoKYW5kIHNldmVyYWwgb3RoZXIgbGlrZSB0aGF0LgoKU2VlOgpodHRwczovL2tyemsuZXUvIy9i
dWlsZGVycy8zOC9idWlsZHMvOTE1Cmh0dHBzOi8va3J6ay5ldS8jL2J1aWxkZXJzLzQwL2J1aWxk
cy85MDAKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
