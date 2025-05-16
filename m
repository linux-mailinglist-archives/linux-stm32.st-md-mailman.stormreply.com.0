Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42BAB9746
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 10:16:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9184C78F7D;
	Fri, 16 May 2025 08:16:37 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68F86C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 08:16:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5f624291db6so2804840a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747383396; x=1747988196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
 b=BkCgDCYhx+4pcZhyZaXSAf/1IkElXt1axTYamOKTVQ86VKMrd7rXG7vjHMiJhcvl5o
 PLH0Mvl4w3ikkxRRMHB42m3LRls1FPQfr0eFeXLXPW7VJu+1MwVHYUcpEff7B6hIbzot
 Mt2vQhXrOjRUa0OB972nZlU+YyTRUaLQAqsRC3HDPGjgF+RDv2OvvzLmgh0U/WYt/pj6
 Kproyh9q4mCMEBh2bAZCxQQjrHMJTm+e9BtosHyPCt470HsW9M8DPRDa3l62gcq+HHVn
 vbAqDNkUP4I7lEqCY4SjA8W0iyUS/eTt7Md/oyTnbKyd1THKiBmlyq1FvtRAUVZBc1U9
 WnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747383396; x=1747988196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5uMs6FkdhW0yuPSJiF5IsCQmeoDxyXFi4ZKMZV6l28=;
 b=j9hX4MbEzsoRJKKpnq5BhVAZQ34wmEWkslJJse76RnfYlKmibG5edan+jfjRtYFAFP
 kq6Y6qPceG5s1WnMWXCFGSm1XRfYhU0OCNBRT7UybDQM5vAaK4gePkja6W1oHPk41ofs
 SeBIV/0Gw73PpZ1zcieRmN1BP8clHb03Xh11DkVeAIx6Vw9j/TpnnATRY4kalrRtrgI0
 IRDUhFPrzgK8lXtN7+37F0F4BRDRZFhRqIpTdaIDeMW0AE/OlC3fYU6DSJ8PUgFzSXL+
 ZqN02lV+IuMe4sRGr1ubCTQ2d+qiF8U+yLqTinN9I+g2OFn620z9cVYnAGuaKZZOvefF
 hOgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ADrvM7qRghgTqWed56lErlHwtzsnLTu+pk4txKagUtJXZa6jR7fE0jr5EA2UQ8SQKSxLZ9jCVk/WQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoX4aIk9EExPVKwGSSeB7RbKw71HYFZ9UAyt4ho9I6vIQMULac
 v9KyyTgfnLPRZBx3VBeCwGKavGxdu3oFrbyRpgKLyno6fajjLwVXxv4d7NuMVQ==
X-Gm-Gg: ASbGncuLXHxahhfDHZrrvSDPSYyFB19e8+rJoOK3ijxvCBRC6MaBG6n01gUfRYR+Wkt
 GT1G5owV316+ll5R4dhN1fYU/cto0aORyZ5mYJ4DhFo/eCPWS1U36S0ii6o0jfjnB1/3sYrHPfl
 hzriPI9rZ6ERoo8F1SQJ+PMEx+uDNVHxTFFmSkG1D6aa7WX22OyYRaxyqETbq9eFgzi6S2Rflca
 IUbhPsn1IDLI72OF7HjrjRq8u6Qyw7WucRjnZEhXI9kM0LtHn92S/lLRFApbxHpvXBJuBLC53qc
 8RneE5b+zWdPDWIOLZNDwDRPAqGk/bKJvevLeqKW1cDlh677/zUOHOoeN0FT
X-Google-Smtp-Source: AGHT+IGUyQ4WvvI8Y54HOBmPIQUwWgTnB7hUofnygJIB5iOp5HSMPI4dclX6JAUQZWevtotWc6mVOA==
X-Received: by 2002:a17:907:9811:b0:ad2:3371:55cd with SMTP id
 a640c23a62f3a-ad52d46ae67mr221922866b.5.1747383395358; 
 Fri, 16 May 2025 01:16:35 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1c90sm1016490a12.12.2025.05.16.01.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:16:34 -0700 (PDT)
Message-ID: <e53f54ad-df31-4b1e-a2a5-2d14a138c9eb@gmail.com>
Date: Fri, 16 May 2025 10:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250508143818.2574558-1-goran.radni@gmail.com>
 <20250508143818.2574558-5-goran.radni@gmail.com>
 <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <8e25c2e3-fbc6-4d60-8362-2b0fb3066821@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

SGkgQWxleAoKdGhhdCBpcyBncmVhdC4gVGhhbmsgWW91IQoKQmVzdCByZWdhcmRzCkdvcmFuCgpB
bGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIEdvcmFuCj4gCj4gT24gNS84LzI1IDE2OjM4LCBH
b3JhbiBSYcSRZW5vdmnEhyB3cm90ZToKPj4gQWRkIHN1cHBvcnQgZm9yIFVsdHJhdHJvbmlrJ3Mg
c3RtMzJtcDE1N2MgZmx5IGJvYXJkLiBUaGlzIGJvYXJkIGVtYmVkcwo+PiBhIFNUTTMyTVAxNTdj
IFNPQyBhbmQgMUdCIG9mIEREUjMuIFNldmVyYWwgY29ubmVjdGlvbnMgYXJlIGF2YWlsYWJsZSBv
bgo+PiB0aGlzIGJvYXJkczogMipVU0IyLjAsIDEqVVNCMi4wIE1pbmlVU0IsIERlYnVnIFVBUlQs
IDEqVUFSVCwgMSpVU0FSVCwKPj4gU0RjYXJkLCBSSjQ1LCAuLi4KPj4KPj4gVGhpcyBwYXRjaCBl
bmFibGVzIGJhc2ljIHN1cHBvcnQgZm9yIGEga2VybmVsIGJvb3QgLSBTRC1jYXJkIG9yIGVNTUMu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdvcmFuIFJhxJFlbm92acSHIDxnb3Jhbi5yYWRuaUBnbWFp
bC5jb20+Cj4+Cj4gCj4gU2VyaWVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4KPiAKPiByZWdhcmRz
Cj4gYWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
