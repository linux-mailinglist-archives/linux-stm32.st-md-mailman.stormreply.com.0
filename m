Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5918AED618
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 09:48:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A32CCC32E8F;
	Mon, 30 Jun 2025 07:48:48 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C74CC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 07:48:47 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ae0c571f137so834987466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandelbit.com; s=google; t=1751269727; x=1751874527;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tZ+BSaUYjMYZPFRc5ahI5f+VB6TZxnMY7+aM/BHB0gk=;
 b=N9SoC50NPAp1jCo94OLbnW99DJMsVuzC2FKIaOj80TAxDHFNETZ8+7HUNGmlANS1F0
 pkq+RII4mxh+GTRvEeU00ib/+WSC5n+VgFKpkQ5FGkhszU30/H6k4QqAoYAubEf776UW
 bkiijPMlwKPox0rtAaG6OcLku1idqI5R7HLbCZOEJzaXlQle5RkHyiAWlevjiNgnjiFu
 96CNLT3ZZ0eGpsR46C2XcM6JZtXGP8Knley+iTKen/6uohgTmLMJAdz4ba0HYvw4Q73J
 C9nobVX0RkLX3/sMv1RRIRT3Aqje/FeEoNO5Q8573eyGaHWEVweiCI+dHns3VNd0QA3v
 BsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751269727; x=1751874527;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ+BSaUYjMYZPFRc5ahI5f+VB6TZxnMY7+aM/BHB0gk=;
 b=EgRf9nZ+zmhQk4AmSoMxC3wwaOUv3oANvQCsHJM8q1jCP6qZFfLI4fbECfY64D3Mis
 Yxj1dNko2YEIWf5fvxTm5oedG3vS9ChxHiAd1R57Z7vGbtTqjroT5qeQjbfg2GCxFvBb
 /MQQZGsBR/DRKUPknoCwfLa/6BYbx+OJW8JGOaeLnLF9G3jWoY1xgf1RzMTWcFL95HDj
 21O84ZkNG6msD2eRaYi4AdbQtEjAw8ouke+1Xqeu840sain4paeHYFWRzbqQGtOexw0s
 GAydGezUswRL/VuspIWY7ppfHUfEVUV8qCu9AHblWtEN+CupqdxVZAieeNnPNNdlQZN0
 YOuA==
X-Gm-Message-State: AOJu0YyglaFQ/vte6RCUzGOqfOJBKsLWa9GlDUDNu/3XrMti4TdHKZ/D
 wxGXzrf9ZtOwBk7MAiY3ZCC+Ywp31Fi71eKnh7NBnu1+vWCfmniDmUuX1xIIT+Mexyk=
X-Gm-Gg: ASbGncvBQf2OF5BRb8w1LEClYY/Goqb9yNUy9z20VBRBlwBRtQryJYV2T2WzRUsxV1j
 PRybNarI6uSKv3e2KiqjbhBOb2k7q75Xm8mKTmjAEfJPKc+ep0wHuBywXfpGKw/uiDlaNLnO7j6
 tssUz7fAPaTQNBzXMKoKVh1Xg8Et1+3bfwgXvxcU9JtmNyRVg5dHBXM7DL1iSvERGrXb0jhEzqa
 H8wLRC/rTDsY+6MFwx6BrkhsZBzR0PLRUNiK5OSoayT7E/G6Z6CsqldgcO7aX3yejKPaguAKGdv
 RRRa03/E3jumHfomY5b5X1ilEC15x6MymAdk8fTk/yGxH6/VzIHRN+/WUUdoLQKQDkTR0FaVgt4
 5kwV9EyEhPTsie54za83/pSc/
X-Google-Smtp-Source: AGHT+IFG8mxwherCyB+H+Ce/MDetYKrbqKrvuEJkbWn3WcmopojqghsC9D4gNWRWL3XhXfmKmOCezQ==
X-Received: by 2002:a17:907:8691:b0:ae0:ade2:606b with SMTP id
 a640c23a62f3a-ae34fd8ecebmr1192187566b.19.1751269726337; 
 Mon, 30 Jun 2025 00:48:46 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:f5fc:eb97:a20:8b31?
 ([2001:67c:2fbc:1:f5fc:eb97:a20:8b31])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae35363b1c4sm623062966b.31.2025.06.30.00.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 00:48:45 -0700 (PDT)
Message-ID: <1c6f4024-be8a-4734-a724-f12b85a52ed7@mandelbit.com>
Date: Mon, 30 Jun 2025 09:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, linux-spi@vger.kernel.org
References: <20250628000227.22895-1-antonio@mandelbit.com>
 <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 xsFNBFN3k+ABEADEvXdJZVUfqxGOKByfkExNpKzFzAwHYjhOb3MTlzSLlVKLRIHxe/Etj13I
 X6tcViNYiIiJxmeHAH7FUj/yAISW56lynAEt7OdkGpZf3HGXRQz1Xi0PWuUINa4QW+ipaKmv
 voR4b1wZQ9cZ787KLmu10VF1duHW/IewDx9GUQIzChqQVI3lSHRCo90Z/NQ75ZL/rbR3UHB+
 EWLIh8Lz1cdE47VaVyX6f0yr3Itx0ZuyIWPrctlHwV5bUdA4JnyY3QvJh4yJPYh9I69HZWsj
 qplU2WxEfM6+OlaM9iKOUhVxjpkFXheD57EGdVkuG0YhizVF4p9MKGB42D70pfS3EiYdTaKf
 WzbiFUunOHLJ4hyAi75d4ugxU02DsUjw/0t0kfHtj2V0x1169Hp/NTW1jkqgPWtIsjn+dkde
 dG9mXk5QrvbpihgpcmNbtloSdkRZ02lsxkUzpG8U64X8WK6LuRz7BZ7p5t/WzaR/hCdOiQCG
 RNup2UTNDrZpWxpwadXMnJsyJcVX4BAKaWGsm5IQyXXBUdguHVa7To/JIBlhjlKackKWoBnI
 Ojl8VQhVLcD551iJ61w4aQH6bHxdTjz65MT2OrW/mFZbtIwWSeif6axrYpVCyERIDEKrX5AV
 rOmGEaUGsCd16FueoaM2Hf96BH3SI3/q2w+g058RedLOZVZtyQARAQABzSlBbnRvbmlvIFF1
 YXJ0dWxsaSA8YW50b25pb0BtYW5kZWxiaXQuY29tPsLBrQQTAQgAVwIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUJFZDZMhYhBMq9oSggF8JnIZiFx0jwzLaPWdFMBQJhFSq4GBhoa3Bz
 Oi8va2V5cy5vcGVucGdwLm9yZwAKCRBI8My2j1nRTC6+EACi9cdzbzfIaLxGfn/anoQyiK8r
 FMgjYmWMSMukJMe0OA+v2+/VTX1Zy8fRwhjniFfiypMjtm08spZpLGZpzTQJ2i07jsAZ+0Kv
 ybRYBVovJQJeUmlkusY3H4dgodrK8RJ5XK0ukabQlRCe2gbMja3ec/p1sk26z25O/UclB2ti
 YAKnd/KtD9hoJZsq+sZFvPAhPEeMAxLdhRZRNGib82lU0iiQO+Bbox2+Xnh1+zQypxF6/q7n
 y5KH/Oa3ruCxo57sc+NDkFC2Q+N4IuMbvtJSpL1j6jRc66K9nwZPO4coffgacjwaD4jX2kAp
 saRdxTTr8npc1MkZ4N1Z+vJu6SQWVqKqQ6as03pB/FwLZIiU5Mut5RlDAcqXxFHsium+PKl3
 UDL1CowLL1/2Sl4NVDJAXSVv7BY51j5HiMuSLnI/+99OeLwoD5j4dnxyUXcTu0h3D8VRlYvz
 iqg+XY2sFugOouX5UaM00eR3Iw0xzi8SiWYXl2pfeNOwCsl4fy6RmZsoAc/SoU6/mvk82OgN
 ABHQRWuMOeJabpNyEzA6JISgeIrYWXnn1/KByd+QUIpLJOehSd0o2SSLTHyW4TOq0pJJrz03
 oRIe7kuJi8K2igJrfgWxN45ctdxTaNW1S6X1P5AKTs9DlP81ZiUYV9QkZkSS7gxpwvP7CCKF
 n11s24uF1c44BGhGyuwSCisGAQQBl1UBBQEBB0DIPeCzGpzFfbnob2Usn40WGLsFClyFRq3q
 ZIA9v7XIJAMBCAfCwXwEGAEIACYWIQTKvaEoIBfCZyGYhcdI8My2j1nRTAUCaEbK7AIbDAUJ
 AeEzgAAKCRBI8My2j1nRTDKZD/9nW0hlpokzsIfyekOWdvOsj3fxwTRHLlpyvDYRZ3RoYZRp
 b4v6W7o3WRM5VmJTqueSOJv70VfBbUuEBSIthifY6VWlVPWQFKeJHTQvegTrZSkWBlsPeGvl
 L+Kjj5kHx998B8PqWUrFtFY0QP1St+JWHTYSBhhLYmbL5XgFPz4okbLE0W/QsVImPBvzNBnm
 9VnkU9ixJDklB0DNg2YD31xsuU2nIdvNsevZtevi3xv+uLThLCf4rOmj7zXVb+uSr+YjW/7I
 z/qjv7TnzqXUxD2bQsyPq8tesEM3SKgZrX/3saE/wu0sTgeWH5LyM9IOf7wGRIHj7gimKNAq
 2sCpVNqI/i/djp9qokCs9yHkUcqC76uftsyqiKkqNXMoZReugahQfCPN5o6eefBgy+QMjAeI
 BbpeDMTllESfZ98SxKdU/MDhCSM/5Bf/lFmgfX3zeBvt45ds/8pCGIfpI7VQECaA8pIpAZEB
 hi1wlfVsdZhAdO158EagqtuTOSwvlm9N01FwLjj9nm7jKE2YCyrgrrANC7QlsAO/r0nnqM9o
 Iz6CD01a5JHdc1U66L/QlFXHip3dKeyfCy4XnHL58PShxgEu6SxWYdrgWwmr3XXc6vZ8z7XS
 3WbIEhnAgMQEu73PEZRgt6eVr+Ad175SdKz6bJw3SzJr1qE4FMb/nuTvD9pAtw==
Organization: Mandelbit SRL
In-Reply-To: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix NULL check on
	pointer-to-pointer variable
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

SGkgQ2xlbWVudCwKCk9uIDMwLzA2LzIwMjUgMDk6MzQsIENsZW1lbnQgTEUgR09GRklDIHdyb3Rl
Ogo+IEhpIEFudG9uaW8sCj4gCj4gT24gNi8yOC8yNSAwMjowMiwgQW50b25pbyBRdWFydHVsbGkg
d3JvdGU6Cj4+IEluIHN0bTMyX3NwaV9wcmVwYXJlX3J4X2RtYV9tZG1hX2NoYWluaW5nKCkgYm90
aCByeF9kbWFfZGVzYwo+PiBhbmQgcnhfbWRtYV9kZXNjIGFyZSBwYXNzZWQgYXMgcG9pbnRlci10
by1wb2ludGVyIGFyZ3VtZW50cy4KPj4KPj4gVGhlIGdvYWwgaXMgdG8gcGFzcyBiYWNrIHRvIHRo
ZSBjYWxsZXIgdGhlIHZhbHVlIHJldHVybmVkCj4+IGJ5IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3Nn
KCksIHdoZW4gaXQgaXMgbm90IE5VTEwuCj4+Cj4+IEhvd2V2ZXIsIHRoZSBOVUxMIGNoZWNrIG9u
IHRoZSByZXN1bHQgaXMgZXJyb25lb3VzbHkKPj4gcGVyZm9ybWVkIHdpdGhvdXQgZGVyZWZlcmVu
Y2luZyB0aGUgcG9pbnRlci4KPj4KPj4gQWRkIHRoZSBwcm9wZXIgZGVyZWZlcmVuY2Ugb3BlcmF0
b3IgdG8gYm90aCBjaGVja3MuCj4+Cj4+IEZpeGVzOiBkMTdkZDJmMWQ4YTEgKCJzcGk6IHN0bTMy
OiB1c2UgU1RNMzIgRE1BIHdpdGggU1RNMzIgTURNQSB0byAKPj4gZW5oYW5jZSBERFIgdXNlIikK
Pj4gQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNjQ0NzE1ICgiTnVsbCBwb2ludGVyIGRlcmVmZXJl
bmNlcyAKPj4gKFJFVkVSU0VfSU5VTEwpIikKPj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBRdWFy
dHVsbGkgPGFudG9uaW9AbWFuZGVsYml0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvc3BpL3Nw
aS1zdG0zMi5jIHwgNiArKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0z
Mi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKPj4gaW5kZXggM2QyMGYwOWYxYWU3Li5lOWZh
MTdlNTJmYjAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCj4+ICsrKyBi
L2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCj4+IEBAIC0xNTI5LDcgKzE1MjksNyBAQCBzdGF0aWMg
aW50IAo+PiBzdG0zMl9zcGlfcHJlcGFyZV9yeF9kbWFfbWRtYV9jaGFpbmluZyhzdHJ1Y3Qgc3Rt
MzJfc3BpICpzcGksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIERNQV9QUkVQX0lOVEVSUlVQVCk7Cj4+IMKgwqDCoMKgwqAgc2dfZnJl
ZV90YWJsZSgmZG1hX3NndCk7Cj4+IC3CoMKgwqAgaWYgKCFyeF9kbWFfZGVzYykKPj4gK8KgwqDC
oCBpZiAoISpyeF9kbWFfZGVzYykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+PiDCoMKgwqDCoMKgIC8qIFByZXBhcmUgTURNQSBzbGF2ZV9zZyB0cmFuc2ZlciBNRU1fVE9f
TUVNIChTUkFNPkREUikgKi8KPj4gQEAgLTE1NjMsOCArMTU2Myw4IEBAIHN0YXRpYyBpbnQgCj4+
IHN0bTMyX3NwaV9wcmVwYXJlX3J4X2RtYV9tZG1hX2NoYWluaW5nKHN0cnVjdCBzdG0zMl9zcGkg
KnNwaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgRE1BX1BSRVBfSU5URVJSVVBUKTsKPj4gwqDCoMKgwqDCoCBzZ19mcmVlX3RhYmxlKCZtZG1h
X3NndCk7Cj4+IC3CoMKgwqAgaWYgKCFyeF9tZG1hX2Rlc2MpIHsKPj4gLcKgwqDCoMKgwqDCoMKg
IHJ4X2RtYV9kZXNjID0gTlVMTDsKPj4gK8KgwqDCoCBpZiAoISpyeF9tZG1hX2Rlc2MpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgICpyeF9kbWFfZGVzYyA9IE5VTEw7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVJTlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4gCj4gR29vZCBjYXRjaCBmb3IgYm90
aCBwb2ludGVycyAhCj4gCj4gRm9yIHJlYWRhYmlsaXR5LCBJIHdvdWxkIHN1Z2dlc3QgdG8gZGVm
aW5lIHR3byBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAKPiBwdHIgYXQgdGhlIGJlZ2lubmluZyBv
ZiB0aGUgZnVuY3Rpb24gc3VjaCBhcyA6Cj4gIMKgwqDCoMKgc3RydWN0IGRtYV9hc3luY190eF9k
ZXNjcmlwdG9yICpfbWRtYV9kZXNjID0gKnJ4X21kbWFfZGVzYzsKPiAgwqDCoMKgwqBzdHJ1Y3Qg
ZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKl9kbWFfZGVzYyA9ICpyeF9kbWFfZGVzYzsKPiAKPiBB
bmQgdGhlbiB1c2UgdGhlbSBhbGwgYWxvbmcgdGhlIGZ1bmN0aW9uIGV2ZW4gaW4gdGhlIGFzc2ln
bmF0aW9uLgo+IAoKVGhhbmtzIGZvciB0aGUgY29tbWVudC4KV2lsbCBzZW5kIHYyIQoKUmVnYXJk
cywKCgotLSAKQW50b25pbyBRdWFydHVsbGkKCkNFTyBhbmQgQ28tRm91bmRlcgpNYW5kZWxiaXQg
U3JsCmh0dHBzOi8vd3d3Lm1hbmRlbGJpdC5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
