Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D881AC9885
	for <lists+linux-stm32@lfdr.de>; Sat, 31 May 2025 01:56:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F41EEC3F92E;
	Fri, 30 May 2025 23:56:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D70F6C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 23:56:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7424ccbef4eso2157189b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 16:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748649387; x=1749254187;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UbCZyIkZ0m1blK4VZNRnnH4emBisfG3c94TVO1BUVgg=;
 b=SVOdLb1ZM0f5NxXt40Zf945SCieEzuy/jTOHjOJBCNfx3fLCNDtf1W3X8C2W+W8Its
 MjIEtL3sZfGABj+AaGhwUeaanbHA/D1zOOFpTHPZZJZRuMNe0D8qVcV5X1rDsQ2hSjv8
 /9Tw5ymzqOTse6RY/nWoQrEEw1C/FdaDAlRhqUpi3WMcxdD+UBlz/qumt5jXJOgwTVgh
 zVSvRnsy/k8ShoN0HtETVjQJ6gMIMH45VdpPWPqKy8ipx4gsrmgeV6A3k6XE2EfFh+l9
 RXH+eJ/VuBga1OD4c4FPY88G0LVjEcH7xjwAZVBK5jjr/vzrsKE4rdmD6VZ1yQmWhVHg
 SSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748649387; x=1749254187;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbCZyIkZ0m1blK4VZNRnnH4emBisfG3c94TVO1BUVgg=;
 b=mA0Hi9KJ0M1AMJj4RXbm/eIe22HY5DfGzKLPQUWkNL+sPMt3nd7WgiHm0c3cEKvcyA
 O63x8qIGTLZL/IPB0EnGTfJAXjgo3rKmeio8mvbYMIFcS7rBNIXZYdTHN6jAKv5+rYva
 QA//PK5JbADcuBNXSHqFd8ThdZaxrY7axR13y6MRv/wMyTDJ4JDlOO2xYrJ1h1BgTi/O
 o0ybTjWLP93pecIN2lSVrvyideRXc+Dd/xNZveMYu0zql2m3Mhq6O9rUtk1SkVWAD++Y
 pxjpw0BFZjiBZHoaiBf5Vd8+ryCGWg6aox5ozpCi8/R28lVBiF8oyNSIChg5Z6D+ePi4
 7MJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsVO/zA1UBGGIahoYC1ET03/PQeED9aroNiRPs390LtkBteK5zQiNWT3ETueJu0dldu/OWt2TKJcSpvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKWMv+/rxvMJeS1nuBI7ayhQK66vLe8YJrAGUi6cEBPtOlJrg/
 genABRrzJPTOb9qN9sYBLrlFtixHomWEG6skxgmKTY7uSFV595nP/3/C
X-Gm-Gg: ASbGncuZD7HYsDI34CbLvJJQcrawCBW981JIsFXHSm+vgmN62wfTGkUPrNltfmKdS/V
 KP7K0v8bE+vUnhtwHwsUYnH2UIpVqQxo4ByBhesJMqwk05h2/tmyTMKRQaKCs+3Nm9HgzPtN0dW
 12K6TG9Q6TG0ij5nS/JnSSp2RN9ymfaKQ3WPH2zdCLCYzcilOH3eVK7sPu5WfAQTIk3B9ANlFWZ
 B+45LGTDh4kipNuTNp3gx8mFlmI1vCkNYKbpXdnYcCFKmn7iDrZHfRrbKvuEyz+sxse6WN1cM3H
 +NdcjRFay5SwZNDe4gJXWaa/q/C77Rk4PrIbFd0q9ApP0jTxn+rI6fwlvzeNyakU+myV+I+DLZ3
 k8ec=
X-Google-Smtp-Source: AGHT+IFu4j52ek9ISddZry4BH1QLbrMR9o7ktMi7lXXMpOaUy7V4nO7Soh+iiNBWYpP530mVx7wSRA==
X-Received: by 2002:a05:6a00:189c:b0:742:a77b:8c4 with SMTP id
 d2e1a72fcca58-747d181cb44mr632022b3a.3.1748649387295; 
 Fri, 30 May 2025 16:56:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff723csm3581125b3a.164.2025.05.30.16.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 16:56:26 -0700 (PDT)
Message-ID: <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
Date: Fri, 30 May 2025 16:56:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gNS8zMC8yNSAxNjo0NiwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjcs
IDIwMjUgYXQgMjowMuKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4+
Cj4+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDAxOjIxOjIxUE0gLTA2MDAsIEphbWVzIEhpbGxp
YXJkIHdyb3RlOgo+Pj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMToxNOKAr1BNIEFuZHJldyBM
dW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBUdWUsIE1heSAyNywgMjAy
NSBhdCAxMTo1NTo1NEFNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4+Pj4gU29tZSBk
ZXZpY2VzIGxpa2UgdGhlIEFsbHdpbm5lciBINjE2IG5lZWQgdGhlIGFiaWxpdHkgdG8gc2VsZWN0
IGEgcGh5Cj4+Pj4+IGluIGNhc2VzIHdoZXJlIG11bHRpcGxlIFBIWSdzIG1heSBiZSBwcmVzZW50
IGluIGEgZGV2aWNlIHRyZWUgZHVlIHRvCj4+Pj4+IG5lZWRpbmcgdGhlIGFiaWxpdHkgdG8gc3Vw
cG9ydCBtdWx0aXBsZSBTb0MgdmFyaWFudHMgd2l0aCBydW50aW1lCj4+Pj4+IFBIWSBzZWxlY3Rp
b24uCj4+Pj4KPj4+PiBJJ20gbm90IGNvbnZpbmNlZCBhYm91dCB0aGlzIHlldC4gQXMgZmFyIGFz
IGkgc2VlLCBpdCBpcyBkaWZmZXJlbnQKPj4+PiB2YXJpYW50cyBvZiB0aGUgSDYxNi4gVGhleSBz
aG91bGQgaGF2ZSBkaWZmZXJlbnQgY29tcGF0aWJsZXMsIHNpbmNlCj4+Pj4gdGhleSBhcmUgbm90
IGFjdHVhbGx5IGNvbXBhdGlibGUsIGFuZCB5b3Ugc2hvdWxkIGhhdmUgZGlmZmVyZW50IERUCj4+
Pj4gZGVzY3JpcHRpb25zLiBTbyB5b3UgZG9uJ3QgbmVlZCBydW50aW1lIFBIWSBzZWxlY3Rpb24u
Cj4+Pgo+Pj4gRGlmZmVyZW50IGNvbXBhdGlibGVzIGZvciB3aGF0IHNwZWNpZmljYWxseT8gSSBt
ZWFuIHRoZSBQSFkgY29tcGF0aWJsZXMKPj4+IGFyZSBqdXN0IHRoZSBnZW5lcmljICJldGhlcm5l
dC1waHktaWVlZTgwMi4zLWMyMiIgY29tcGF0aWJsZXMuCj4+Cj4+IFlvdSBhdCBsZWFzdCBoYXZl
IGEgZGlmZmVyZW50IE1URCBkZXZpY2VzLCBleHBvcnRpbmcgZGlmZmVyZW50Cj4+IGNsb2Nrcy9Q
V00vUmVzZXQgY29udHJvbGxlcnMuIFRoYXQgc2hvdWxkIGhhdmUgZGlmZmVyZW50IGNvbXBhdGli
bGVzLAo+PiBzaW5jZSB0aGV5IGFyZSBub3QgY29tcGF0aWJsZS4gWW91IHRoZW4gbmVlZCBwaGFu
ZGxlcyB0byB0aGVzZQo+PiBkaWZmZXJlbnQgY2xvY2tzL1BXTS9SZXNldCBjb250cm9sbGVycywg
YW5kIGZvciBvbmUgb2YgdGhlIFBIWXMgeW91Cj4+IG5lZWQgYSBwaGFuZGxlIHRvIHRoZSBJMkMg
YnVzLCBzbyB0aGUgUEhZIGRyaXZlciBjYW4gZG8gdGhlCj4+IGluaXRpYWxpc2F0aW9uLiBTbyBp
IHRoaW5rIGluIHRoZSBlbmQgeW91IGtub3cgd2hhdCBQSFkgeW91IGhhdmUgb24KPj4gdGhlIGJv
YXJkLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIHJ1bnRpbWUgZGV0ZWN0aW9uLgo+IAo+IEht
bSwgdGhpbmtpbmcgYWJvdXQgdGhpcyBhZ2FpbiwgbWF5YmUgaXQgbWFrZXMgc2Vuc2UgdG8ganVz
dAo+IGRvIHRoZSBydW50aW1lIGRldGVjdGlvbiBpbiB0aGUgTUZEIGRyaXZlciBlbnRpcmVseSwg
YXMgaXQgdHVybnMKPiBvdXQgdGhlIEFDMzAwIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlIGlzIGxh
cmdlbHkgYSBzdWJzZXQgb2YgdGhlCj4gQUMyMDAgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UoQUMz
MDAgd291bGQganVzdCBub3QgbmVlZCBhbnkKPiBpMmMgcGFydCBvZiB0aGUgaW5pdGlhbGl6YXRp
b24gc2VxdWVuY2UpLiBTbyBpZiB3ZSB1c2UgdGhlIHNhbWUKPiBNRkQgZHJpdmVyIHdoaWNoIGlu
dGVybmFsbHkgZG9lcyBhdXRvZGV0ZWN0aW9uIHRoZW4gd2UgY2FuCj4gYXZvaWQgdGhlIG5lZWQg
Zm9yIHNlbGVjdGluZyBzZXBhcmF0ZSBQSFkncyBlbnRpcmVseS4gVGhpcyBhdAo+IGxlYXN0IGlz
IGxhcmdlbHkgaG93IHRoZSB2ZW5kb3IgQlNQIGRyaXZlciB3b3JrcyBhdCB0aGUgbW9tZW50Lgo+
IAo+IFdvdWxkIHRoaXMgYXBwcm9hY2ggbWFrZSBzZW5zZT8KClRoaXMgaGFzIGxpa2VseSBiZWVu
IGRpc2N1c3NlZCwgYnV0IGNhbm5vdCB5b3UgbW92ZSB0aGUgZ3V0cyBvZiBwYXRjaCAjMiAKaW50
byB1LWJvb3Qgb3IgdGhlIGJvb3QgbG9hZGVyIGJlaW5nIHVzZWQgYW5kIGhhdmUgaXQgcGF0Y2gg
dGhlIFBIWSAKRGV2aWNlIFRyZWUgbm9kZSdzICJyZWciIHByb3BlcnR5IGFjY29yZGluZ2x5IGJl
Zm9yZSBoYW5kaW5nIG91dCB0aGUgRFRCIAp0byB0aGUga2VybmVsPwoKQW5vdGhlciB3YXkgdG8g
YWRkcmVzcyB3aGF0IHlvdSB3YW50IHRvIGRvIGlzIHRvIHJlbW92ZSB0aGUgInJlZyIgCnByb3Bl
cnR5IGZyb20gdGhlIEV0aGVybmV0IFBIWSBub2RlIGFuZCBqdXN0IGxldCBvZl9tZGlvYnVzX3Jl
Z2lzdGVyKCkgCmF1dG9tYXRpY2FsbHkgc2NhbiwgeW91IGhhdmUgdGhlIGFkdmFudGFnZSBvZiBo
YXZpbmcgdGhlIGFkZHJlc3NlcyAKY29uc2VjdXRpdmUgc28gdGhpcyB3b24ndCBkcmFtYXRpY2Fs
bHkgaW5jcmVhc2UgdGhlIGJvb3QgdGltZS4uLiBJIGRvIAp0aGF0IG9uIHRoZSBib2FyZHMgSSBz
dXBwb3NlIHRoYXQgaGF2ZSBhIHJlbW92YWJsZSBtZXp6YW5pbmUgY2FyZCB0aGF0IAppbmNsdWRl
cyBhIFBIWSBhZGRyZXNzIHdob3NlIGFkZHJlc3MgaXMgZGljdGF0ZWQgYnkgc3RyYXBzIHNvIHdl
IGRvbid0IAp3YW50IHRvIGd1ZXNzLCB3ZSBsZXQgdGhlIGtlcm5lbCBhdXRvIGRldGVjdCBpbnN0
ZWFkLgotLSAKRmxvcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
