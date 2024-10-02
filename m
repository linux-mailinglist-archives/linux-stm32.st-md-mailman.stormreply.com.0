Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA498E2A3
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 20:35:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A454C78022;
	Wed,  2 Oct 2024 18:35:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E793BC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 18:35:33 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37ce14ab7eeso100348f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Oct 2024 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727894133; x=1728498933;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mED0YUDg6ybFD4UVoBw4zqqhlZ7Qyev/U4YEla4InU0=;
 b=SmTytlSdH7t3jR+HRCQGWfkKo9bRZx/+gPYDJS56sqlJa+niQN7lFKPY0MbcPEEeJJ
 2ky8VAFJZ4Wuf81WZU5o4l6NNGJkz6Wl0Ayyspnvt1uEDcEUC+4iWoLtxHClB1HQsNpo
 lr7tdkEQbUxu1tVWPot7Vztov0Ue759h3UC97evPEBbHRUp1be+injk8KRFTmPRT9+Jm
 xfh74/LSWbWJwhSpwkzwsTHzW5wEjPUEiN7DFrw6ZolSVITQyhxrj3i4z0Rq8RaCheXv
 vqcBhBtj+E1PIRi7ReYJ78lI7QfHwDMuM0lrl4Gv0erPaTMTvO7mWAKADTGZamp2yQbL
 FMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727894133; x=1728498933;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mED0YUDg6ybFD4UVoBw4zqqhlZ7Qyev/U4YEla4InU0=;
 b=NXJD/T9tSGCczkRqTZeKy/6cEVnrCgTx998EtGr4aDfHhKOrKrHK3IbraHxjF3Ll2t
 fTJvAuQCGI0U1BapwSyO1kNeOyfnOxF5Tif47LgpSwKkcqKtxr/fjRkYKoYR77u2MF84
 F0OXBsm0C3/17MyoZ0lM02Q3cDicuZYpuE5dmt9eHzkPoMnnqYVfFQ93o1kCBEJ8tpEI
 EnyM3se7IQOTNuaCjl2KYwJjUy5UyE4ODUyH5dvaB6MGD0MqBTNdK/C9PWRr3wYMR8WA
 9dS7HYzpNdPWlEE2MzVFTjVcoBnrkIXZ2uY3QotJzWtECy+x6ona/5kFNfg9oFqt1ZkR
 EmBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmuh7dNP1xBJy0zypK+f0Y7bZa1XJMKnzNI6U5X/QhvsCXqEc8MdHmmGwQz5Sov6G/TrQzHFL5nr0FTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynpS+aFpt6a+rr33CVey/w3dDrL8WJFbU1s+V8sUxlSCBDxMX1
 ztSF8w30YjRyF/9ZEJj4TbGYPs/G5hoRav03nQgC0qJrEJudb5xv
X-Google-Smtp-Source: AGHT+IHIuA+cnJos2nrvsIxzTDux8f98ipwTTinJw7yI+Z3bzwU2f3+6jkM/OeMsVH0sd28t02VIhQ==
X-Received: by 2002:a5d:4f10:0:b0:374:c8b7:63ec with SMTP id
 ffacd0b85a97d-37cfb8cf2a7mr3444408f8f.21.1727894133008; 
 Wed, 02 Oct 2024 11:35:33 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd564d2e8sm14714913f8f.18.2024.10.02.11.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 11:35:32 -0700 (PDT)
Date: Wed, 2 Oct 2024 21:35:30 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <tb2o2dhxcg7lykl743no3zkkjnqwuce56ls5ihrwreowigivwv@2mol7uc2qvto>
References: <20240930110205.44278-1-minda.chen@starfivetech.com>
 <20241002065801.595db51a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002065801.595db51a@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Minda Chen <minda.chen@starfivetech.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac4: Add ip
 payload error statistics
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

SGkgSmFrdWIKCk9uIFdlZCwgT2N0IDAyLCAyMDI0IGF0IDA2OjU4OjAxQU0gR01ULCBKYWt1YiBL
aWNpbnNraSB3cm90ZToKPiBPbiBNb24sIDMwIFNlcCAyMDI0IDE5OjAyOjA1ICswODAwIE1pbmRh
IENoZW4gd3JvdGU6Cj4gPiBBZGQgZHdtYWM0IGlwIHBheWxvYWQgZXJyb3Igc3RhdGlzdGljcywg
YW5kIHJlbmFtZSBkaXNjcmlwdGVyIGJpdCBtYWNybwo+IAo+IGRlc2NyaXB0b3IKPiAgICAgICAg
IF4KPiAKPiA+IGJlY2F1c2UgbGF0ZXN0IHZlcnNpb24gZGVzY3JpcHRvciBJUENFIGJpdCBjbGFp
bXMgaXAgY2hlY2tzdW0gZXJyb3Igb3IKPiA+IGw0IHNlZ21lbnQgbGVuZ3RoIGVycm9yLgo+IAoK
PiBXaGF0IGlzIGFuIEw0IHNlZ21lbnQgbGVuZ3RoIGVycm9yIG9uIFJ4Pwo+IFNlZW1zIHRvIG1l
IHRoYXQgcmV1c2luZyBpcF9wYXlsb2FkX2VyciBoZXJlIHdpbGwgYmUgY29uZnVzaW5nCgpGcm9t
IHRoZSBjdXJyZW50ICJpcF9wYXlsb2FkX2VyciIgZmllbGQgc2VtYW50aWNzLCBNaW5kYSBpcyBj
b3JyZWN0IHRvCnVzZSBpdCBmb3IgdGhlIFJ4IElQLXBheWxvYWQgZXJyb3Igc3RhdGlzdGljcy4g
SGVyZSBpcyB0aGUgZGVmaW5pdGlvbgpvZiB0aGUgSVBDRSBmbGFnIChwYXJ0IG9mIHRoZSBSREVT
NCBkZXNjcmlwdG9yIGZpZWxkKSBjaXRlZCBmcm9tIHRoZQpTeW5vcHN5cyBEVyBRb1MgRXRoIHY1
IEhXLW1hbnVhbDoKCkJpdCAgTmFtZSAgRGVzY3JpcHRpb24KIDcgICBJUENFICBJUCBQYXlsb2Fk
IEVycm9yCiAgICAgICAgICAgV2hlbiB0aGlzIGJpdCBpcyBzZXQsIGl0IGluZGljYXRlcyBlaXRo
ZXIgb2YgdGhlIGZvbGxvd2luZzoKICAgICAgICAgICDilqAgVGhlIDE2LWJpdCBJUCBwYXlsb2Fk
IGNoZWNrc3VtICh0aGF0IGlzLCB0aGUgVENQLCBVRFAsIG9yIElDTVAgY2hlY2tzdW0pIGNhbGN1
bGF0ZWQgYnkgdGhlCiAgICAgICAgICAgICBNQUMgZG9lcyBub3QgbWF0Y2ggdGhlIGNvcnJlc3Bv
bmRpbmcgY2hlY2tzdW0gZmllbGQgaW4gdGhlIHJlY2VpdmVkIHNlZ21lbnQuCiAgICAgICAgICAg
4pagIFRoZSBUQ1AsIFVEUCwgb3IgSUNNUCBzZWdtZW50IGxlbmd0aCBkb2VzIG5vdCBtYXRjaCB0
aGUgcGF5bG9hZCBsZW5ndGggdmFsdWUgaW4gdGhlIElQIEhlYWRlcgogICAgICAgICAgICAgZmll
bGQuCiAgICAgICAgICAg4pagIFRoZSBUQ1AsIFVEUCwgb3IgSUNNUCBzZWdtZW50IGxlbmd0aCBp
cyBsZXNzIHRoYW4gbWluaW11bSBhbGxvd2VkIHNlZ21lbnQgbGVuZ3RoIGZvciBUQ1AsCiAgICAg
ICAgICAgICBVRFAsIG9yIElDTVAuCgpJdCBhbG1vc3Qgd29yZC1ieS13b3JkIG1hdGNoZXMgdG8g
d2hhdCBpcyBkZWZpbmVkIGZvciB0aGUKRVJERVM0X0lQX1BBWUxPQURfRVJSIGZsYWcgKHBhcnQg
b2YgdGhlIEV4dGVuZGVkIFJERVM0IGRlc2NyaXB0b3IKZmllbGQpIGluIERXIEdNQUMgdjMueCBI
Vy1tYW51YWwgZm9yIHdoaWNoIHRoZQpzdG1tYWNfc3RhdHM6OmlwX3BheWxvYWRfZXJyIGZpZWxk
IGhhcyBiZWVuIGFkZGVkIGluIHRoZSBmaXJzdCBwbGFjZS4KTm90ZSB0aGUgbmFtZSBvZiB0aGUg
ZmxhZyBpbiB0aGUgZGVzY3JpcHRvciBtYXRjaGVzIHRvIHdoYXQgaXMgZGVjbGFyZWQgaW4KdGhl
IHN0bW1hY19zdGF0cyBzdHJ1Y3R1cmUuCgpTbyBiYXNlZCBvbiB0aGF0IEkgZG9uJ3Qgc2VlIGFu
eSBwcm9ibGVtIHdpdGggdGhlIHBhdGNoIGV4Y2VwdCBzb21lCm1pbm9yIHBhdGNoLWxvZyBpc3N1
ZXMgSSBtZW50aW9uZWQgaW4gYW5vdGhlciBtZXNzYWdlLgoKLVNlcmdlKHkpCgo+IC0tIAo+IHB3
LWJvdDogY3IKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
