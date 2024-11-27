Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A298D9DA373
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 09:02:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50D0DC78F8D;
	Wed, 27 Nov 2024 08:02:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D177C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 08:02:03 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2124ccf03edso65225235ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732694521; x=1733299321;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
 b=KjweIx4NptxBoTqC7wW/AJzE7SDR9kPVhoeL59Q3IwAmDlx4ao5oGd6sJ6qPR2JHO/
 mU9bhV4WeFjqgZG3DHsCr2GUffjxh7yotgD8cqhnHdUiOblZEPdpRjsy/Anq26HYWfYe
 SF9ICO0eDxiWQh8bP/WOXZTlVCb0ioJx/WqeRJ8ISGwU9WtixNkHrGJ5qm+eoiz7Na1G
 Lx2yLumM+2LnaMt0wZOQBAZjpfYOSVhJkFBVnbbI0rzwVljrtafD28FFc4XSbOFxUaYC
 qfe9WaRPoiJYTt/nUGqYQYW6YwKe5+Up+rIOZ22po/kB6mXARMvzOzG4O2Ic6hBemrLT
 b9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732694521; x=1733299321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bew/I5xXVZXMcMLGcr2bk1V3h79V/rlhudJAubnILnI=;
 b=B4W74zULOH9QrsnXBQmAj5KyGoFqDMnBQ2kk9ku1vldXKy91ap4rZBLppOPDvTjOg6
 dTP9n0epVLCQqueQS0Vf+vlyatsY3rXKv5MwzkHjvSSRCzweW4V17UBVKgwytmSvHgL+
 HX5MnqztxDVWxJbsPWbYt9Arq+5b2+vyrCHlPdyvJ98nu+sFZ2ruGYBTcCieOa9qW+QW
 2PeapQe8hlwwezAk7B29Fq20qu96MBqQ2wy33oh6rhrh3A2zo/gQyBzZFthvs6LyS/ZP
 nQ888P+QAZhZQjBdCo92o7HQlpjrF7mchEMlMIdK0hSpqOepR0sRijaLfmqcF5F8MF4+
 dfEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4zmg7lRivyCGyIZXA8BYSu6IMTlfbwvFiQ0hqjb+s+eNTYxoSWp33XneLcE8NN+Gh5vyb21efFpEdrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyjryV2R2D4SfHFQLZXIZpvVqUgwSivzn0AeeGzcyc5F75FTSD
 SuWl7iuwFFaaIfnFsKMZqRaiH2bpG8cJ9vKu638/hc2G60bNM9/q
X-Gm-Gg: ASbGnctNJl/FpZ9qR7tXw4kPoUlFL71QIuZLz9Z3a7s8Rp/QjE/tEnLdr1qLGoEPWrg
 +TbLF1bdFLTuFH8eJCFukt5gzI+52O4LE070kk2wNIprq5z+fCItCXrDI3Bqc3RxjupU7q+xzZ/
 kjcInAYILNoEXUr40vY9o50NM5bl5WmxkM6XxbsesvS8GyFSnxuSU+5stlVlvRZ9heLaiBSktp5
 TzKekvd33WmI5hpmTmSiV7S8/hhNNKKnoo6tmZT86CRXo481b2E/ruaSWK2m0fjYan/nG09KJzn
 5yfos+xf5AcZA+8uBTmbe3SbUZsT
X-Google-Smtp-Source: AGHT+IGtUIoISB0+clpN9PkK/2UFXTIykn3qm+m0cLDTT9iuNBtfEZ70ZERWyU6+cs55GUUZXZV4kQ==
X-Received: by 2002:a17:903:2b08:b0:211:e812:3948 with SMTP id
 d9443c01a7336-21500fedf8amr32131585ad.0.1732694521468; 
 Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129db8c783sm96580615ad.25.2024.11.27.00.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 00:02:01 -0800 (PST)
Message-ID: <6efc512e-b153-4f2c-8b38-4443024475ee@gmail.com>
Date: Wed, 27 Nov 2024 16:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-3-a0987203069@gmail.com>
 <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a220d407-de40-4398-a837-de11e01d2381@kernel.org>
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] arm64: dts: nuvoton: Add Ethernet
	nodes
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

RGVhciBLcnp5c3p0b2YsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpLcnp5c3p0b2YgS296
bG93c2tpIOaWvCAxMS8yNi8yMDI0IDY6MDggUE0g5a+r6YGTOgo+IE9uIDE4LzExLzIwMjQgMDk6
MjcsIEpvZXkgTHUgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL251
dm90b24vbWEzNWQxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL251dm90b24vbWEzNWQxLmR0
c2kKPj4gaW5kZXggZTUxYjk4ZjViZGNlLi4yZTAwNzEzMjkzMDkgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbnV2b3Rvbi9tYTM1ZDEuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL251dm90b24vbWEzNWQxLmR0c2kKPj4gQEAgLTM3OSw1ICszNzksNTcgQEAgdWFy
dDE2OiBzZXJpYWxANDA4ODAwMDAgewo+PiAgIAkJCWNsb2NrcyA9IDwmY2xrIFVBUlQxNl9HQVRF
PjsKPj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgIAkJfTsKPj4gKwo+PiArCQlnbWFj
MDogZXRoZXJuZXRANDAxMjAwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG1hMzVk
MS1kd21hYyI7Cj4+ICsJCQlyZWcgPSA8MHgwIDB4NDAxMjAwMDAgMHgwIDB4MTAwMDA+Owo+PiAr
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIzIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+PiArCQkJ
aW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7Cj4+ICsJCQljbG9ja3MgPSA8JmNsayBFTUFDMF9H
QVRFPiwgPCZjbGsgRVBMTF9ESVY4PjsKPj4gKwkJCWNsb2NrLW5hbWVzID0gInN0bW1hY2V0aCIs
ICJwdHBfcmVmIjsKPj4gKwo+PiArCQkJbnV2b3RvbixzeXMgPSA8JnN5cyAwPjsKPj4gKwkJCXJl
c2V0cyA9IDwmc3lzIE1BMzVEMV9SRVNFVF9HTUFDMD47Cj4+ICsJCQlyZXNldC1uYW1lcyA9ICJz
dG1tYWNldGgiOwo+PiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiBTdGF0dXMgaXMgYWx3YXlz
LCBhbHdheXMgdGhlIGxhc3QgcHJvcGVydHkuIFBsZWFzZSByZWFkIGFuZCBmb2xsb3cgRFRTCj4g
Y29kaW5nIHN0eWxlLgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKR290IGl0LiBJIHdp
bGwgZml4IHRoZXNlLgoKVGhhbmtzIQoKQlIsCgpKb2V5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
