Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EADAD9354
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 19:00:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AE32C36B19;
	Fri, 13 Jun 2025 17:00:14 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20F06C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 17:00:13 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-72ecc0eeb8bso1023121a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749834012; x=1750438812;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W4PmbLTdx7bKxmJ58LSBL+52b6YKUjWHxLD3jkqTwUs=;
 b=kWh20rpNa5rSqIAr9B6sjgxacme865dfn0ucVAcosJ1fp47wuQVU872/x+BVpS4LOp
 tVjED2TbaKzoTzNDCYahVCxpLWTkgQXboo8hWBLG0NXS4hFoyTpGLdB6f7Q9Umk2gO7H
 aJAompg0ny7nSEnnNcEZQt6F7jPVIiofBszvO1vF82ZfitHMAtv81SLaOtvB0NWY/U4Q
 YALpXMYskEc/T3X1arA1MQZExXi+Jye9GMqFicT71fX6MHSug6A0ftWgnH5ntaAfXtRn
 0lrTl7mYYQABpVYwXbBJo+7aYdYQDwbjrEoNneHbVwGJ1ZjZMu8mCCopaQ23wBDaPklf
 nOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749834012; x=1750438812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W4PmbLTdx7bKxmJ58LSBL+52b6YKUjWHxLD3jkqTwUs=;
 b=MgjGq5f7V5zTVzVzZElkCAkcYqHJlW1oZSZRkfm7NbSfq8gFXYH7sqA4ctxEV4Uti3
 /TnE6bbOTodbmpWySy1ZKR3iX5Rp52SD+C8jwNisZqDDKURGjD1JrU062/9PuRgWjCak
 QLT8aYed1hqura556358OJPgM98vbDOhAE9sozGY6lLng2c+fSx23if6+Ue1dLmzIUfa
 oVcL07O1/2kf81bT5x8P25wD4UOJAzzDRxlZZuo9Q8IJASVEGHyynI/7l95/9Jwjmyyn
 0qz20uIf8s4eYK6YxkREFGABpTsKke7VmpNqmUlb292ZFkRaAmhJGqeIHIphNsjT02/D
 DIxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWngiBFLgZZeP4fCaeY5H4uzgrziO6kBsIo/Y1pUPIjyUj0AEtE66M/DndikU/LK9OYwc6EHBlZHuPTWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3+79wCBhv5OMZIMrwspqP7TrqmTK2yFprgxMx0oNsKUGE47zg
 Dlfme2Mu2gDPsF9V4fjFgKS787EZ4tO1zkBPXvy6u3qKnSHU0Oty5GmZ8lMwwKKk6X8=
X-Gm-Gg: ASbGncvLEa84oBscHHeX+uQosJ3zANJ5fgXYs3hSuf0zxVjOOAuEp2BUumTxQCMGK06
 7dxP1rxhc/9PggV0rgth9ttA2uxeCTjz4VNhYzVtP5XKJEyu9xUFMi7TOxs84SARucIve9ce8OW
 //j8f5XWXEfILCFueUrvI0mUf3tBdhe9wdls0Gqe1dH6ca2PO86GUvnlP27wXw+WwnTmQdWnL4y
 TpHGlWglG3MxUzafgw9vXzC2B9Plb5IgEVMASiHiwNvyM8yx6KPF+fUMqIEq1DN5LdRVqpYthT+
 oTTg3fUdT/EzDn+2FbtC3+wiFfDlKZWTRb6XdU+mFn3mKyhLKy1Hcbno50RklHqmk0Qwg0Ut8az
 2t6luf4tZZ1T65Gm9eT4sakSE3o6PFrrRi0Ez
X-Google-Smtp-Source: AGHT+IE7h+SZVToKJUAin3fOr868BbMSOLFocQ+et42SsT9JMuC0JS5qAKXXAH1oH1f2QX3S8vjHvg==
X-Received: by 2002:a05:6830:210b:b0:72b:94a4:9143 with SMTP id
 46e09a7af769-73a3626644bmr315551a34.2.1749834011794; 
 Fri, 13 Jun 2025 10:00:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8?
 ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73a284ff5f4sm258694a34.43.2025.06.13.10.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 10:00:11 -0700 (PDT)
Message-ID: <46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
Date: Fri, 13 Jun 2025 12:00:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, jic23@kernel.org
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
 <20250612084627.217341-1-jirislaby@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250612084627.217341-1-jirislaby@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 tglx@linutronix.de, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
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

T24gNi8xMi8yNSAzOjQ2IEFNLCBKaXJpIFNsYWJ5IChTVVNFKSB3cm90ZToKPiBpcnFfZG9tYWlu
X2NyZWF0ZV9zaW1wbGUoKSB0YWtlcyBmd25vZGUgYXMgdGhlIGZpcnN0IGFyZ3VtZW50LiBJdCBj
YW4gYmUKPiBleHRyYWN0ZWQgZnJvbSB0aGUgc3RydWN0IGRldmljZSB1c2luZyBkZXZfZndub2Rl
KCkgaGVscGVyIGluc3RlYWQgb2YKPiB1c2luZyBvZl9ub2RlIHdpdGggb2ZfZndub2RlX2hhbmRs
ZSgpLgo+IAo+IFNvIHVzZSB0aGUgZGV2X2Z3bm9kZSgpIGhlbHBlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+Cj4gQ2M6IEpvbmF0
aGFuIENhbWVyb24gPGppYzIzQGtlcm5lbC5vcmc+Cj4gQ2M6IERhdmlkIExlY2huZXIgPGRsZWNo
bmVyQGJheWxpYnJlLmNvbT4KPiBDYzogIk51bm8gU8OhIiA8bnVuby5zYUBhbmFsb2cuY29tPgo+
IENjOiBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KPiBDYzogTWF4aW1lIENvcXVl
bGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxh
bGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+IENjOiBsaW51eC1paW9Admdlci5rZXJuZWwu
b3JnCj4gCj4gLS0tClJldmlld2VkLWJ5OiBEYXZpZCBMZWNobmVyIDxkbGVjaG5lckBiYXlsaWJy
ZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
