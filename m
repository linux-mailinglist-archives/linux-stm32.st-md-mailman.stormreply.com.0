Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCAE9DA380
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 09:03:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE82C78F8D;
	Wed, 27 Nov 2024 08:03:50 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3E03C78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 08:03:42 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7fbd9be84bdso4099867a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 00:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732694621; x=1733299421;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
 b=Un/4LAWyLPrtZnxHdhNTw7LD9B7GdFSCD2O0voFGzW59EAhFGU3tEba5SeaNPjqKls
 jhpqmmnj6DwaRepOypGoGypsLXza9pwIUYLTY8ZSzcHirnvM4e4HWP2DeixwxncN14Vd
 O3S0AX8Onu/V7asecBIyAACBeAJarVdRzeJa5UvND1RZRWyi03H6Oq/SeB7Z0+6JZKYz
 MQe+zG3+3TXMw8sOmQY5gZdIj0JTVfwYliVBlVJI8Km+d8R9IdfULbU2/ON8gKax0yN9
 mbv2M4wF03D6aI+tZ7vDferfkHOfOjVymmT74cVzCKXwZXUV62FdI9+UBHV6l1a8MFvk
 7y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732694621; x=1733299421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
 b=v1ZA85CX7bnYoZK6X50/vE3XwhvWGbMuowSMmW0UtnMR6+ZK+Bk5Mnn/BUdPz2Ddmc
 zZQ36+fWKtAE33o/allpboN2XuNpmxho9sw68E+mpDp4bWsnbsqq+E5x6swpnKdtyNqw
 qgcCSfXNyzicBbvy0j+VwA+1/1nr5/rU6ZxKTyUnH2vxH2VsI3NQ3xMAHipE5CPw3zqF
 kquwvN2wtAtAanLJizJnfOzY9Ceno3gH+B3yks+Cdhg1+3r7yWZgfOCej+tlmKLIauaW
 15up/LH6qskDt7eVBHcv7GVJaKwI6E59JX1XZJUuYQ0XR8jHthNa/6Vp88SutRCyTv0k
 F5fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6DRtzmPoXXpUhvywIytklVHnk0fD7+sm13IuHH7qexNPWSC91r/T2E04IFCLU8sbxZFmkHonEKU7agA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzqajI974HKN6GpSZow/GqngcXgl3QMaZcAa5+kHT87Lmhd+Zo
 1HyVFniUrbJxCaRtDcU3Nq7rBzdwocqMAoSwt40XKaSRk4Ybvqo9
X-Gm-Gg: ASbGncs3ZhZq8JsAA4e/SZTmoWyMUrMCPByvnavRpSCq+zY3+gtnPxXlbAPWOlKegEZ
 7VmnvAAIJcoDBCHBJ49Pz7yFakksnGCkarbnsZtWHBGJM+eTVfkVWXdRrg+f272oqAdQ/vcejw+
 unTU1p5Gpvk/8NqOAJLAINUzo2aKPKYXB6nhmInKKVGUedRzGjnf6bK2MWh5cQLypmKo2Wm3bsd
 b3SORi+lRb3J2IdDmxZFigaWhAGdEqFUgRA5yjnkPFsAwRJykVAxMvZr9lseUiK5inXsU2fTCfZ
 c/DTO9TkaeMpKZJbQxGDpyPNT9ua
X-Google-Smtp-Source: AGHT+IHRo3XtMbkGU/iUkrZZ9kDEO66Pm5yljji2WIQGTrvtOISCN9QXMkeyFyIaUUK12nAZ7FFb4Q==
X-Received: by 2002:a05:6a21:3288:b0:1e0:d380:fe61 with SMTP id
 adf61e73a8af0-1e0e0b9dbf6mr3148053637.45.1732694621422; 
 Wed, 27 Nov 2024 00:03:41 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de531308sm9618017b3a.110.2024.11.27.00.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 00:03:40 -0800 (PST)
Message-ID: <fb61cf82-b14d-4f58-99bb-9677305a0aa6@gmail.com>
Date: Wed, 27 Nov 2024 16:03:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac glue for Nuvoton MA35 family
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

CktyenlzenRvZiBLb3psb3dza2kg5pa8IDExLzI2LzIwMjQgNjoxMCBQTSDlr6vpgZM6Cj4gT24g
MTgvMTEvMjAyNCAwOToyNywgSm9leSBMdSB3cm90ZToKPj4gKwo+PiArc3RhdGljIHN0cnVjdCBu
dnRfcHJpdl9kYXRhICoKPj4gK251dm90b25fZ21hY19zZXR1cChzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LCBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQpCj4+ICt7Cj4+ICsJ
c3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gKwlzdHJ1Y3QgbnZ0X3ByaXZfZGF0
YSAqYnNwX3ByaXY7Cj4+ICsJcGh5X2ludGVyZmFjZV90IHBoeV9tb2RlOwo+PiArCXUzMiB0eF9k
ZWxheSwgcnhfZGVsYXk7Cj4+ICsJdTMyIG1hY2lkLCBhcmcsIHJlZzsKPj4gKwo+PiArCWJzcF9w
cml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpic3BfcHJpdiksIEdGUF9LRVJORUwpOwo+
PiArCWlmICghYnNwX3ByaXYpCj4+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+PiArCj4+
ICsJYnNwX3ByaXYtPnJlZ21hcCA9Cj4+ICsJCXN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5k
bGVfYXJncyhkZXYtPm9mX25vZGUsICJudXZvdG9uLHN5cyIsIDEsICZtYWNpZCk7Cj4+ICsJaWYg
KElTX0VSUihic3BfcHJpdi0+cmVnbWFwKSkgewo+PiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0
byBnZXQgc3lzIHJlZ2lzdGVyXG4iKTsKPiBTeW50YXggaXM6IHJldHVybiBkZXZfZXJyX3Byb2Jl
Ckkgd2lsbCB1c2UgZGV2X2Vycl9wcm9iZSBpbnN0ZWFkLgo+Cj4+ICsJCXJldHVybiBFUlJfUFRS
KC1FTk9ERVYpOwo+PiArCX0KPj4gKwlpZiAobWFjaWQgPiAxKSB7Cj4+ICsJCWRldl9lcnIoZGV2
LCAiSW52YWxpZCBzeXMgYXJndW1lbnRzXG4iKTsKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7Cj4+ICsJfQo+PiArCj4KPgo+IC4uLgo+Ckkgd2lsbCB1c2UgZGV2X2Vycl9wcm9iZSBpbnN0
ZWFkLgo+PiArCj4+ICsJcmV0ID0gc3RtbWFjX2R2cl9wcm9iZSgmcGRldi0+ZGV2LCBwbGF0X2Rh
dCwgJnN0bW1hY19yZXMpOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybiByZXQ7Cj4+ICsKPj4g
KwkvKiBXZSBzdXBwb3J0IFdvTCBieSBtYWdpYyBwYWNrZXQsIG92ZXJyaWRlIHBtdCB0byBtYWtl
IGl0IHdvcmshICovCj4+ICsJcGxhdF9kYXQtPnBtdCA9IDE7Cj4+ICsJZGV2X2luZm8oJnBkZXYt
PmRldiwgIldha2UtVXAgT24gTGFuIHN1cHBvcnRlZFxuIik7Cj4KPiBEcm9wLCBkcml2ZXIgc2hv
dWxkIGJlIHNpbGVudCBvbiBzdWNjZXNzLgpHb3QgaXQuCj4KPj4gKwlkZXZpY2Vfc2V0X3dha2V1
cF9jYXBhYmxlKCZwZGV2LT5kZXYsIDEpOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4KPgo+
IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKClRoYW5rcyEKCkJSLAoKSm9leQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
