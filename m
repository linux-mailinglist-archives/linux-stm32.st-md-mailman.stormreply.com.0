Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CAA1249A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 14:17:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 419F7C78F80;
	Wed, 15 Jan 2025 13:17:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92469C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 13:00:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385d851e7c3so296648f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 05:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736946017; x=1737550817;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6SLQpzwmxyFpdnS0Qhwyf7oPOCOoHDHPhYDyk3jPItc=;
 b=USiKd6TCv83bn3hXOI6+GXQF1wgbqz6hvGRr4Yd/W2hPFHF2Sfmly/dUqPAqSZKE/3
 mOYVoGyuRL8EoZwEEJX6cqmBWn2fPK3XU1W17WE0mFEluSw34+kpgYedqk/YT1IHoy+6
 K1wwYQk+VWgLviZ90A/dSk5ySwaL/OxLGUB5iX5Tp0z/4Jyl8xBc6rEjEps8H9geatFP
 vrWLsI1Ygc7MgxyP6MDE0OtDBEmdaDGmyRGlVdXcvAB1MLxpXEFnIUzoyiRkJH63KAXn
 Y2NWeTCpf+uI1FUd4OyfFBInZDsWl3J6ep5D4L4y7Y1kbRFC0jwEHI+keRAYrRnTurRp
 9BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736946017; x=1737550817;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SLQpzwmxyFpdnS0Qhwyf7oPOCOoHDHPhYDyk3jPItc=;
 b=Y2Yi+QpNrsRbJnpUnIhF8pCzafGGKyCJ0W7kfmAiJlaYMpKMFtuqrIjeDOc/nNiXhD
 qKCyKkZgRX0t1DzvSbli/O3S+x06oil/G2nrJofCjG44aOfUptUwdCLjC2kqHZxeiOvc
 sqcUs672SCMk3ew55SE6i01KREXRGCwqSWWj4iSC4iKBupWu8SzLpTkJvKIW7Rt84FNH
 1ybvDou45E3O5w2Ua22AWPYAH6xkQuvPF2JXQKynwe04PeyphZSz5R/g7TiXbWaFE/zh
 686hc35mI6ExgMRn/qHT9Xrb/VVkUprji8GH7VGL7WWuiH9Bnnr//UJ3ZSvrXwDKYMFk
 dLDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2jiPcJ7Jdwc/brqDgorqhmwCjoV5lP34jzmzs08a/RjWqa7R1sGkcMCVwdD7zNmnlrSB8f7A1uBEimA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPvaWxCq3X2UFWpkPz7hUxJ9D91IJVLuIzG6d0VQcp81uKsaVT
 QDIVt+z0iYgK60cPyyzaq5iu85cupkD7qJXk7So3L9KfuU5qctr3ztaq7cQxY/Q=
X-Gm-Gg: ASbGncv6RVFeQzDbALXf2i0Ye+p7f63RjZBt4St47KJep3/VLyjaQ9eaoiPmhKtkiun
 FE2W/M4F6I10AdbMSk94GbENH6mnRs7R2lIWuPOJSCqyqYa/TrX64laVCYtRT5jvtAeLtM6mod7
 WpMXCJqHbB6VTg13HmTyAz4Ggng3cmAkI5k02e6TYR+V7R4D3f36kmNL3willwkAXHSnRD0mC1W
 pMRecm/30+i/x1WXqcmrI1VLussGkHuu1iiuCPWG56mCOI/jkIW1/1FEIjKT7K72TNQbsZZzSn5
X-Google-Smtp-Source: AGHT+IHGXsmacyZvTLB1+zaeUtblvRQoTtrVI7XUlTrmBMIq4H1j0GTh8m9KEp0KmLuowI3RDVUF4g==
X-Received: by 2002:a5d:648f:0:b0:385:fd31:ca24 with SMTP id
 ffacd0b85a97d-38a873105d7mr10755610f8f.12.1736946016850; 
 Wed, 15 Jan 2025 05:00:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38d008sm18004245f8f.59.2025.01.15.05.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 05:00:16 -0800 (PST)
Message-ID: <110c9b58-9ac1-4a24-84da-4dfc722f1ea4@linaro.org>
Date: Wed, 15 Jan 2025 14:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 15 Jan 2025 13:17:09 +0000
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nandor Han <nandor.han@ge.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] gpio: Use str_enable_disable-like
	helpers
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

T24gMTUvMDEvMjAyNSAxMjo1MSwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBUdWUsIEphbiAx
NCwgMjAyNSBhdCA4OjE04oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+IAo+PiBSZXBsYWNlIHRlcm5hcnkgKGNvbmRpdGlv
biA/ICJlbmFibGUiIDogImRpc2FibGUiKSBzeW50YXggd2l0aCBoZWxwZXJzCj4+IGZyb20gc3Ry
aW5nX2Nob2ljZXMuaCBiZWNhdXNlOgo+PiAxLiBTaW1wbGUgZnVuY3Rpb24gY2FsbCB3aXRoIG9u
ZSBhcmd1bWVudCBpcyBlYXNpZXIgdG8gcmVhZC4gIFRlcm5hcnkKPj4gICAgb3BlcmF0b3IgaGFz
IHRocmVlIGFyZ3VtZW50cyBhbmQgd2l0aCB3cmFwcGluZyBtaWdodCBsZWFkIHRvIHF1aXRlCj4+
ICAgIGxvbmcgY29kZS4KPj4gMi4gSXMgc2xpZ2h0bHkgc2hvcnRlciB0aHVzIGFsc28gZWFzaWVy
IHRvIHJlYWQuCj4+IDMuIEl0IGJyaW5ncyB1bmlmb3JtaXR5IGluIHRoZSB0ZXh0IC0gc2FtZSBz
dHJpbmcuCj4+IDQuIEFsbG93cyBkZWR1cGluZyBieSB0aGUgbGlua2VyLCB3aGljaCByZXN1bHRz
IGluIGEgc21hbGxlciBiaW5hcnkKPj4gICAgZmlsZS4KPj4KPj4gUmV2aWV3ZWQtYnk6IEZsb3Jp
YW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Cj4gCj4gRm9yIGEgd2hpbGUgSSB3YXMgY3JpdGljYWwgYWJvdXQgdGhlIHN0cmluZyBoZWxwZXJz
IGJ1dCBzaW5jZSBib3RoIEFuZHkKPiBhbmQgS3J6eXN6dG9mIGxpa2UgdGhlbSwgSSB3aWxsIGNv
bnNpZGVyIG15c2VsZiBjb252aW5jZWQgYW5kIHN0YXJ0IHRvCj4gbGlrZSB0aGVtIGluc3RlYWQu
CgpJdCBpcyBwcmV0dHkgc3ViamVjdGl2ZSwgc28gSSBhbHNvIGZpbmQgcmVhc29uYWJsZSBub3Qg
dG8gYWNjZXB0IHRoZW0gdG8KeW91ciBzdWJzeXN0ZW0uIFRvIG1lIHRoZXkgYnJpbmcgbW9yZSBi
ZW5lZml0cyBpbiBjb21wbGljYXRlZCBjYXNlcyBsaWtlOgoJKGRhdGFfaW4gXiBpbl9wb2wpICYg
bXNrICA/ICJoaSIgOiAibG8iLAoKb3IgZnJvbSBwaW5jdHIgKG5vdGUgdGhlIGxpbmUgYnJlYWsp
OgoKCQkJc2VxX3B1dHMocywgcGluLT5vdXRwdXRfdmFsdWUgPwoJCQkJICJoaWdoIiA6ICJsb3ci
KTsKCkFueXdheSwgdGhhbmtzIGZvciByZXZpZXchCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
