Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B469A7F72C4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 12:32:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE07C6B47C;
	Fri, 24 Nov 2023 11:32:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF127C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 11:32:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso2596098a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700825529; x=1701430329;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cSaAUVCAyV7IkbTSiS9YL3nuCvDk5Vl44sWMwMK07H0=;
 b=IglETrcIpYsiBIkt+mjZzCTD0F5NDz1boBQ4rjkPyMW486hx5Fc1W8G+2s1dAQmkvb
 AwHYUXMqB20Wx7vn5qYRCgLaUntbBdx8TcDwOuCLXil7TT74x1ouLlmRc8R0M9ridGsU
 BMdDkqcXhBYp1Cw6iFK38cfOftIBYgknKO7OCICAVSPQ/qaOip9FPW6KhzdRvsIpdH0Z
 hy2IY043EJuDnkvDGtKfoyB0v4iHTtVCLqoIFLqaKF1VXgxlVyTYpDTHdhUX3kIPKMbJ
 +nR6/DE6eC6NOxjHl2AF0Jhps8D+z9kw2KoloJ5Z2qgBGpoZuJApHN8aljnuvGxvmNBl
 YgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700825529; x=1701430329;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSaAUVCAyV7IkbTSiS9YL3nuCvDk5Vl44sWMwMK07H0=;
 b=ZLbl02GFn+RIXCF1xkFHMKJPs9+WFnWAd47hIuVuXHAZHYQ8qprfVwRWz5AMA0OBGb
 qn9h1R+aegG9S60xVmgNeYtcapejY2yJo5Vrzxhrkuxx4IHcS7MHKWt6wtbIHcVEpQZT
 U5ft6/+RZ+jO9xMyoPcFsxdSGpVo9bE7WtlbAohvXG4VLKJi9e/klsxuGprODU9wtgu7
 XLmp+l7gDyYYoo5+ywj+xf43rKk7fCqPImBB9v3T64M11mdqox4KmMquNqSjEtWBQKM/
 br3XlsfSs5o4ci+aH/fzjM9TTZ4z3Inz/Lo4bA2IUvsswNwgzGnP4mIfZlzsDW/Dotx0
 1NMw==
X-Gm-Message-State: AOJu0YxlqN8TnFwrszEbm6rc1PhAyjUVURuu9kLylO07Dsx5BRqjrOCS
 Anqn2W7LOVXvwWUsUwVRIjNHiQ==
X-Google-Smtp-Source: AGHT+IFyGCvDe9Tm4rK43gYX2+FeU+sbtYYnvG0W3/zzLXNl9Zf+L9DVCHB9NI3xJNBshwKN3Fp2mA==
X-Received: by 2002:a05:6402:b6c:b0:54b:333:1bbb with SMTP id
 cb12-20020a0564020b6c00b0054b03331bbbmr751829edb.21.1700825529204; 
 Fri, 24 Nov 2023 03:32:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056402004100b00548b96a52besm1667452edu.78.2023.11.24.03.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:32:08 -0800 (PST)
Message-ID: <24be4abf-b146-4a60-a24b-a9646a7fe8ee@linaro.org>
Date: Fri, 24 Nov 2023 12:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20231124094905.58425-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdaE-Gejf3YXxAEGV9aJakqK77ZvYYFAtUHmVFMxaPDE1Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CACRpkdaE-Gejf3YXxAEGV9aJakqK77ZvYYFAtUHmVFMxaPDE1Q@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: minor whitespace cleanup
	around '='
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

T24gMjQvMTEvMjAyMyAxMToyNCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBGcmksIE5vdiAy
NCwgMjAyMyBhdCAxMDo0OeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA8a3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPj4gVGhlIERUUyBjb2RlIGNvZGluZyBzdHls
ZSBleHBlY3RzIGV4YWN0bHkgb25lIHNwYWNlIGJlZm9yZSBhbmQgYWZ0ZXIgJz0nCj4+IHNpZ24u
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3ps
b3dza2lAbGluYXJvLm9yZz4KPiAKPiBUaGlzIHNob3dzIGEgcHJvYmxlbSB3aXRoIGhvdyB0aGUg
U1QtRXJpY3Nzb24gcGxhdGZvcm1zIHdlcmUgZ3JvdXBlZAo+IHRvZ2V0aGVyIHdpdGggdGhlIFNU
IHBsYXRmb3JtcywgbGVhZGluZyBwZW9wbGUgdG8gYmVsaWV2ZSB0aGV5IGFyZSBtYWludGFpbmVk
Cj4gdG9nZXRoZXIgYnkgdGhlIHNhbWUgbWFpbnRhaW5lcnMsIHdoaWxlIHRoZXkgYXJlIG5vdC4K
PiAKPiBJIG1pZ2h0IGhhdmUgdG8gc3BsaXQgb3V0IHRoZSBTVEUgcGxhdGZvcm1zIHNvIHdlIGRv
bid0IGdldCB0aGlzIGtpbmQgb2YKPiBwcm9ibGVtcy4KPiAKPiBDYW4geW91IHNwbGl0IHRoZSBz
dGUtKiBwcmVmaXhlZCBmaWxlcyBjaGFuZ2VzIGludG8gYSBzZXBhcmF0ZSBwYXRjaCB0aGF0Cj4g
SSBjYW4gYXBwbHk/CgpTdXJlLCBJIGNhbiBzcGxpdCBpdC4gVGhpcyBjaGFuZ2UgaXMgYWxzbyBr
aW5kIG9mIHRyaXZpYWwsIHNvIEkgd2FudGVkCnRvIGdyb3VwIGFzIG11Y2ggYXMgcG9zc2libGUs
IGJ1dCBpbmRlZWQgbWVyZ2luZyBnZXRzIHRyaWNraWVyIGluIHN1Y2ggY2FzZS4KCkJlc3QgcmVn
YXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
