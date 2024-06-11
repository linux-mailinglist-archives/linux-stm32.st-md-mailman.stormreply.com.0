Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890D903B53
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 14:03:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E0EFC712A3;
	Tue, 11 Jun 2024 12:03:24 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00CB4C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718107378; x=1718712178; i=markus.elfring@web.de;
 bh=v4MG0q9MnuPY4++cJH4EjME8ABWNsolzfGyYD+ZIsYU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=v4UzXkw7bizGPdAA35we5ZahpMfu+ZtwZNGftCytLLW7WsytaCSWwTVnydrGfkf1
 oK/ZgNXHm3vpMwOwPNJaTR1ozrYCotWRwmkEjkvwqSxaKtXnFCdvWl7BWkUzIqFCS
 gIZagFE4szymyPe2/f4PTzw8l/ZSBWTr6Javsc6tAMAUPJBNgae9OxCZAV80jPYbh
 NaigegF64eXlcvvhNoh0riYBNQAcs9DfWfqcn5GNVlVHnCuc6XKWXtoPFQveEsvl2
 ywNmQI4Yqagr0EUDQODHk9pq5lLKLP27RCYJ1ytTAQJG7IzSDUY5u0ZSF4xH3Od3g
 ph0NW7vK707lcLT9gQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mc1ZT-1sq3Jt0QsJ-00jIxb; Tue, 11
 Jun 2024 14:02:58 +0200
Message-ID: <32303d99-c5ba-4fec-8981-9b9966dc3291@web.de>
Date: Tue, 11 Jun 2024 14:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kamlesh Gurudasani <kamlesh@ti.com>, devicetree@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Tero Kristo <kristo@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20240524-mcrc64-upstream-v3-4-24b94d8e8578@ti.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240524-mcrc64-upstream-v3-4-24b94d8e8578@ti.com>
X-Provags-ID: V03:K1:TJ+M3A+ZwHBv8zbRqkd8DEM7qjVhITuWZRUhZtq7FNJIWGkAGBW
 3CoM26cD78kPrZKl9pVWI0m31RFhWOtge/YrCgXqxxV5jOYOmntQo7ZymX+uPbr1E54hC4g
 2xYdC00lN417YXdoybmTuYwz5Fszf18GbPLT86PKnchC2KQ7FeKSSpyNPzVqFKprfp7WCKK
 iS3XbhLEABKTBCzWlaBZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YogUS1Yz1Ys=;phEEUBQ3iH6xYdFv8skbZzBR14h
 X+6Sz3DaRZye53CTBaNq5iAc3w2zfBrL0OMLLDI7LbCNNbCdBr/D4WTeCEoTtVjJ6Xg3Cz636
 yXCpyBv1pv97bbuTZMENguGkw8NMIl0r1j3svqVgPM9Ga5wOd+gLLqhscwaPD0vi2gyTrWBqj
 w2ONOFtEUdjQx7Vj3gpWrxfNDbqVklHCu5zaZX5b9OKbpKyRI5JIx0rJ5JNGRYqhC4qidhpTb
 zQj2fIl/nIJd7l9KmtF4gvONU3TndNcRrwkGf0Vof27i6MienOPKxS4ds+a7nZ73MBIyXb/R2
 1w391fKmFkSuaRPjaYn8Lt1xC0NRVXS8w7j3nYT2DvEf8Yp+7i7PcE3/zYwBXBfQOo2RvKFyT
 3s7OHuqCJygN0ECVZ57Aiat6FL2evaSmaAvpl46VGhruRblcmRIvwNMdmo3hCz3SRlQf3VDnP
 aO59pXvfXJvR2DbVUWPtCaCKbyww/Fi/lRfMS/J0rKEOxOz8qJ6gzaErPnBn1VZHDJUdi2KVG
 wDHqn9Y8MKbM3GHjUv289hSAXlWFLdkND2BnKcFdoMYLAo7T2L2vVeSOgK0SYgh+cPtTrCL9u
 Pg/A2En23qftgKq6bluP9KC1QKm3Zbj4g3azip3R2avn8d51eaMrR3S/9jhOiDvhPFctnQAD3
 Yy3WkRkUk6KgmJAIMH+PDeZpLRObzXy+N5DUqgnXbaZwNVRh30u+GjhvAODjj10La3DRLkxOq
 6qN1/0vPgbsSgGmnPVzYQtiL1+WEjnexyZ+u6mBa5/KDVF9MA+AzYPfIbS7+erBP0mYnvA4zG
 Eez1Dz4hRxH5b4QSa6kObgEBkhBJI0lV9uv4wEB1k1EmY=
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 4/6] crypto: ti - add driver for MCRC64
	engine
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

4oCmCj4gKysrIGIvZHJpdmVycy9jcnlwdG8vdGkvbWNyYzY0LmMK4oCmCj4gK3N0YXRpYyBpbnQg
bWNyYzY0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sK4oCmCj4gKwlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXZfZGF0YSk7Cj4gKwo+ICsJc3Bpbl9sb2NrKCZt
Y3JjNjRfZGV2X2xpc3QubG9jayk7Cj4gKwlsaXN0X2FkZCgmZGV2X2RhdGEtPmxpc3QsICZtY3Jj
NjRfZGV2X2xpc3QuZGV2X2xpc3QpOwo+ICsJc3Bpbl91bmxvY2soJm1jcmM2NF9kZXZfbGlzdC5s
b2NrKTsKPiArCj4gKwltdXRleF9sb2NrKCZyZWZjbnRfbG9jayk7Cj4gKwlpZiAoIXJlZmNudCkg
ewo+ICsJCXJldCA9IGNyeXB0b19yZWdpc3Rlcl9zaGFzaGVzKGFsZ3MsIEFSUkFZX1NJWkUoYWxn
cykpOwrigKYKPiArCX0KPiArCXJlZmNudCsrOwo+ICsJbXV0ZXhfdW5sb2NrKCZyZWZjbnRfbG9j
ayk7CuKApgoKV291bGQgeW91IGJlY29tZSBpbnRlcmVzdGVkIHRvIGFwcGx5IGxvY2sgZ3VhcmRz
PwpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMC1yYzIvc291cmNlL2luY2x1
ZGUvbGludXgvY2xlYW51cC5oI0wxMjQKClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
