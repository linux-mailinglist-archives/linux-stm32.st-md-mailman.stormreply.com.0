Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28A875669
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 19:53:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B698C6DD72;
	Thu,  7 Mar 2024 18:53:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383FEC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Mar 2024 18:52:58 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1dbae7b8ff2so10529825ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Mar 2024 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709837577; x=1710442377;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQQbLvgd4v+h8o0thODyrb8/bjQo/5KA5hZsJKz+3js=;
 b=ZDj/9/05tuC9Jrb63Nqb7tl5GlHwngWjEH1YvxqGlwC79pP8aT5JZfm9unqF95XThj
 wBr8Pl4gc8l9w1PIBNw3wrBlwerItmnkR+7rVMweaaNT/pBbAnGnoJIacDuGmy+QrKn0
 TxkLo5zwDcehj2DVCKkASfYI9PXyD/2AECIHHMKi6ivQwopPEPCK18ZSv6yk3knwEVZc
 7tfWus1kvAvDQESuzZHj16mSRqfj230E/kOebyAItUxgs/VS7WqUbcfqV6CqPrst9Wpr
 e/HJvpPOxsYnYYzhqIT1CgTw4HU8kU1WmwdZsdfKSQdjLKQKAtDaolikbmZLgiTXqgrj
 vZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709837577; x=1710442377;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQQbLvgd4v+h8o0thODyrb8/bjQo/5KA5hZsJKz+3js=;
 b=DQ1HbicqHcmM3Yr5RuJHCEwTZNclvlfFmxAZFOylD+k+UXSRItFudddgm8orIYsWk8
 kthI+2URdJzSEt9aC8PtPOvTt/Loe30czrDGn5fv8AkpA//wfL2xjAx08viz8/XLrvEJ
 CnxsGA1K5syYTKRtYxHjHG8wR1F3eHCyy7T0EshGQD5xIKD/owYhWxzToegiW/lMNKIs
 byFd4Y/6vQ+E3C5r1r843uU4wDY1dEaly36Xi9edMmYC/u9a3e6iD2djg9KmR8ZmafTj
 bgD+dMjjqbOKd4G4B6CH02E+dNvFjmx6tziDsuYqJWR/ibWTQiI0Q/fdGb+S8E91Y05c
 Qxvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbIvWkcCNkb0gp7Wm9Yk9iFVbzIjo8SiY2nzZawLQOhxAfZW/c9jq4NetaIm3QySp6Yxy8Dq2udATTao9P9MdjQzuXkVulzD+txtNUR/Y51vdJTiU747hB
X-Gm-Message-State: AOJu0YwD6yLgVxxD3o3hdB63OVxa4OaD/ARnxrnDTD4oeH6DwzsdWM92
 Snc1Or/8NmbNW6pd9j3i/ump0o4R9KQ4KwwIo3Yw3xJtmysneMfG
X-Google-Smtp-Source: AGHT+IHilBvCxdXn41263FwRkBDdMvd1VAR4rFaj12NiHdSFgglCEdzYUDfHPeuKZHjeIbrP8grRZQ==
X-Received: by 2002:a17:902:db05:b0:1dd:46ca:18a1 with SMTP id
 m5-20020a170902db0500b001dd46ca18a1mr3650307plx.34.1709837576535; 
 Thu, 07 Mar 2024 10:52:56 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170902f0ca00b001dd635551f1sm385706pla.255.2024.03.07.10.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 10:52:56 -0800 (PST)
Message-ID: <a25d4d76-a49a-4423-8916-5d7d9303b87a@gmail.com>
Date: Thu, 7 Mar 2024 10:52:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
 <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
 <bbe3e611-a310-41f5-a037-4b7d5e914b94@gmail.com>
 <ddd2f984-e5e7-4708-a013-bfd668794466@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <ddd2f984-e5e7-4708-a013-bfd668794466@leica-geosystems.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-imx: add
 support for PHY WOL
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

CgpPbiAzLzcvMjAyNCAxOjEzIEFNLCBQT1BFU0NVIENhdGFsaW4gd3JvdGU6Cj4gT24gMDYuMDMu
MjQgMTg6NDEsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+IFtTb21lIHBlb3BsZSB3aG8gcmVj
ZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tCj4+IGYuZmFpbmVs
bGlAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQKPj4gaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gVGhpcyBlbWFpbCBp
cyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUKPj4g
Y2FyZWZ1bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVw
bHlpbmcgdG8gdGhpcwo+PiBlbWFpbC4KPj4KPj4KPj4gT24gMy82LzI0IDA5OjI0LCBDYXRhbGlu
IFBvcGVzY3Ugd3JvdGU6Cj4+PiBBZGQgc3VwcG9ydCBmb3IgUEhZIFdPTCBjYXBhYmlsaXR5IGlu
dG8gZHdtYWMtaW14IE1BQyBkcml2ZXIuCj4+PiBUaGlzIGlzIHJlcXVpcmVkIHRvIGVuYWJsZSBX
T0wgZmVhdHVyZSBvbiBhIHBsYXRmb3JtIHdoZXJlIE1BQwo+Pj4gV09MIGNhcGFiaWxpdHkgaXMg
bm90IHN1ZmZpY2llbnQgYW5kIFdPTCBjYXBhYmlsaXR5IGJ1aWx0IGludG8KPj4+IHRoZSBQSFkg
aXMgYWN0dWFsbHkgbmVlZGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENhdGFsaW4gUG9wZXNj
dSA8Y2F0YWxpbi5wb3Blc2N1QGxlaWNhLWdlb3N5c3RlbXMuY29tPgo+Pgo+PiBOb3BlLCB0aGlz
IGlzIG5vdCBhYm91dCBob3cgdG8gZG8gdGhpcy4gWW91IHVzZSBhIERldmljZSBUcmVlIHByb3Bl
cnR5Cj4+IGFzIGEgcG9saWN5IHJhdGhlciB0aGFuIHByb3Blcmx5IGRlc2NyaWJlIHlvdXIgc3lz
dGVtcyBjYXBhYmlsaXRpZXMuCj4gSSdtIG5vdCBzdXJlIHdoYXQgcG9saWN5IG1lYW5zIGluIHRo
YXQgY29udGV4dC4KPiBCVFcsIGR3bWFjLW1lZGlhdGVrIGRvZXMgdGhlIHNhbWUgd2l0aCBiaW5k
aW5nICJtZWRpYXRlayxtYWMtd29sIiB3aGljaAo+IGlzIGEgY29tbWl0IGZyb20gMDMvMjAyMi4K
ClBvbGljeSBoZXJlIG1lYW5zIHlvdSB3YW50IGEgY2VydGFpbiBiZWhhdmlvciBmcm9tIHRoZSBP
UyB0aGF0IGlzIApjb25zdW1pbmcgdGhlIERldmljZSBUcmVlLCBhbmQgdGhhdCBiZWhhdmlvciBp
cyBlbmNvZGVkIHZpYSBhIERldmljZSAKVHJlZSBwcm9wZXJ0eS4gVGhpcyBpcyBkaWZmZXJlbnQg
ZnJvbSBkZXNjcmliaW5nIGhvdyB0aGUgaGFyZHdhcmUgd29ya3MgCndoaWNoIGRvZXMgbm90IG1h
a2UgYW55IHByb3Zpc2lvbnMgZm9yIGdldHRpbmcgYSBiZWhhdmlvciBvdXQgb2YgdGhlIE9TLgoK
PiBJIHVuZGVyc3RhbmQgdGhpcyB3YXkgb2YgZG9pbmcgYmVjYW1lICJ1bmFjY2VwdGFibGUiIHNp
bmNlIHRoZW4gPz8KCkl0IHdhcyBub3QgYWNjZXB0YWJsZSB0aGVuLCBidXQgdGhlcmUgaXMgb25s
eSBhIGxpbWl0ZWQgcmV2aWV3ZXIgdGltZSwgCmFuZCBpdCBpcyBlYXN5IHVuZm9ydHVuYXRlbHkg
dG8gc25lYWsgdGhyb3VnaCByZXZpZXdlcnMuCgo+Pgo+PiBXaGF0IHNvcnQgb2YgV2FrZS1vbi1M
QU4gZG8geW91IHdhbnQgdG8gYmUgZG9uZSBieSB0aGUgUEhZIGV4YWN0bHk/IERvZXMKPj4gdGhl
IFBIWSBoYXZlIHBhY2tldCBtYXRjaGluZyBjYXBhYmlsaXRpZXMsIG9yIGRvIHlvdSB3YW50IHRv
IHdha2UtdXAKPj4gZnJvbSBhIFBIWSBldmVudCBsaWtlIGxpbmsgdXAvZG93bi9hbnkgaW50ZXJy
dXB0Pwo+IAo+IFBIWSBpcyBUSSBkcDgzODI2IGFuZCBoYXMgc2VjdXJlIG1hZ2ljIHBhY2tldCBj
YXBhYmlsaXR5LiBGb3IgdGhlIHdha2V1cAo+IHdlIHJlbHkgb24gYSBleHRlcm5hbCBNQ1Ugd2hp
Y2ggaXMgc2lnbmFsZWQgdGhyb3VnaCBhIFBIWSdzIEdQSU8gd2hpY2gKPiB0b2dnbGVzIG9ubHkg
b24gbWFnaWMgcGFja2V0IHJlY2VwdGlvbi4KPiBXZSB3YW50IHRvIHdha2V1cCBfb25seV8gb24g
bWFnaWMgcGFja2V0IHJlY2VwdGlvbi4KClRoZW4geW91IG5lZWQgdG8gcmVwcmVzZW50IHRoYXQg
d2FrZS11cCBHUElPIGxpbmUgaW4gdGhlIERldmljZSBUcmVlLCAKYXNzb2NpYXRlIGl0IHdpdGgg
dGhlIFBIWSdzIERldmljZSBUcmVlIG5vZGUgZm9yIHN0YXJ0ZXJzIGFuZCBhZGQgaW4gYSAKJ3dh
a2V1cC1zb3VyY2UnIHByb3BlcnR5IGluIHRoZSBEZXZpY2UgVHJlZS4KCk5vdyB0aGUgUEhZIGRy
aXZlciBjYW4ga25vdyBhYm91dCB0aGUgZXhpc3RlbmNlIG9mIGEgR1BJTyBhbmQgaXQgY2FuIApr
bm93IHRoZSBQSFkgaXMgYSBzeXN0ZW0gd2FrZS11cCBzb3VyY2UsIHNvIHRoZSBkcml2ZXIgY2Fu
IGNhbGwgCmRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoKS4KCkluIHVzZXItc3BhY2UgeW91IGhh
dmUgdG8gY29uZmlndXJlIHRoZSBuZXR3b3JrIGludGVyZmFjZSB3aXRoIApXQUtFX01BR0lDU0VD
VVJFIHdoaWNoIG5lZWRzIHRvIHByb3BhZ2F0ZSB0byB0aGUgUEhZIGRyaXZlciBmb3IgYWRlcXVh
dGUgCmNvbmZpZ3VyYXRpb24uIFN0aWxsIGluIHVzZXItc3BhY2UgeW91IG5lZWQgdG8gbWFrZSB0
aGUgUEhZIGRldmljZSAKd2FrZS11cCAqZW5hYmxlZCogYnkgZG9pbmc6CgplY2hvICJlbmFibGUi
ID4gL3N5cy9jbGFzcy9uZXQvZXRoWC9hdHRhY2hlZF9waHlkZXYvcG93ZXIvd2FrZXVwCgpJZiBi
b3RoIFdBS0VfTUFHSUNTRUNVUkUgaXMgZW5hYmxlZCBhbmQgdGhlIFBIWSBkZXZpY2UgaW4gc3lz
ZnMgcmVwb3J0cyAKdGhhdCBpdCBpcyB3YWtlLXVwIGVuYWJsZWQgd291bGQgeW91IHdha2UtdXAg
ZnJvbSB0aGUgUEhZJ3MgR1BJTy4gWW91ciAKUEhZIGRyaXZlciBvdWdodCB0byBiZSBtb2RpZmll
ZCB0byBjaGVjayBmb3IgYm90aAoKZGV2aWNlX3dha2V1cF9lbmFibGVkKCkgYW5kIHdvbG9wdHMg
YmVpbmcgbm9uLXplcm8gdG8gY2FsbCAKZW5hYmxlX2lycV93YWtlKCkgb24gdGhlIEdQSU8gaW50
ZXJydXB0IGxpbmUuCgpUaGF0J3MgaG93IEkgd291bGQgZ28gYWJvdXQgZG9pbmcgdGhpcywgeWVz
IGl0J3MgYSB0YWQgbW9yZSBjb21wbGljYXRlZCAKdGhhbiBhZGRpbmcgYW4gYWQtaG9jIERldmlj
ZSBUcmVlIHByb3BlcnR5LCBidXQgaXQncyBtb3JlIGZsZXhpYmxlIGFuZCAKaXQncyB0cmFuc3Bv
c2FibGUgdG8gb3RoZXIgY29uZmlndXJhdGlvbnMsIHRvby4gV2hldGhlciB0aGF0IHNvcnQgb2Yg
CmVuY29kaW5nIG5lZWRzIHRvIGJlIGluIHRoZSBpbmRpdmlkdWFsIFBIWSBkcml2ZXJzIG9yIHNv
bWV3aGVyZSBpbiB0aGUgClBIWSBsaWJyYXJ5IGNhbiBiZSBkZWNpZGVkIGlmIHdlIGhhdmUgbW9y
ZSB0aGFuIG9uZSBzaW1pbGFyIApjb25maWd1cmF0aW9uIHRvIHN1cHBvcnQuCgo+IAo+Pgo+PiBJ
ZiB0aGUgZm9ybWVyLCB0aGVuIHlvdSB3b3VsZCBuZWVkIHRvIGludGVycm9nYXRlIHRoZSBQSFkg
ZHJpdmVyIHZpYQo+PiBwaHlfZXRodG9vbF9nZXRfd29sKCkgdG8gZmlndXJlIG91dCB3aGF0IFdh
a2Utb24tTEFOIG1vZGVzIGl0IGlzIGNhcGFibGUKPj4gb2Ygc3VwcG9ydGluZyBhbmQgdGhlbiBt
YWtlIGEgZGVjaXNpb24gd2hldGhlciB0byBwcmlvcml0aXplIFdha2Utb24tTEFOCj4+IGZyb20g
dGhlIFBIWSBvciB0aGUgTUFDLCBvciBtYXliZSBvbmx5IHRoZSBQSFkgY2FuIGFjdHVhbGx5IHdh
a2UtdXAgdGhlCj4+IHN5c3RlbSBpbiB5b3VyIGNhc2UuCj4+Cj4gc3RtbWFjIGFscmVhZHkgY2Fs
bHMgcGh5X2V0aHRvb2xfZ2V0X3dvbC9waHlfZXRodG9vbF9zZXRfd29sIHRocm91Z2gKPiBwaHls
aW5rX2V0aHRvb2xfZ2V0X3dvbC9waHlsaW5rX2V0aHRvb2xfc2V0X3dvbC4gQnV0IG5lZWRzIGZs
YWcKPiBTVE1NQUNfRkxBR19VU0VfUEhZX1dPTCB0byBiZSBzZXQuIE90aGVyd2lzZSwgaXQgd2ls
bCBvbmx5IHdvcmsgd2l0aCBNQUMKPiBXT0wgd2hpY2ggd2UgZG9uJ3Qgd2FudC4gV2l0aCB0aGUg
bmV3IGJpbmRpbmcgd2UganVzdCBhbGxvdyB0aGUgTUFDCj4gZHJpdmVyIHRvIGNhbGwgdGhlIFBI
WSBmb3IgdGhlIFdPTCBjYXBhYmlsaXR5LiBUaGlzIGRvZXNuJ3QgZm9yY2UgV09MIHRvCj4gZW5h
YmxlZCBvciBkaXNhYmxlZCwgYXMgaXQgaXMgc3RpbGwgdXAgdG8gZXRodG9vbCB0byBjb25maWd1
cmUgaXQuCj4+IElmIHRoZSBsYXR0ZXIsIHRoZW4geW91IG5lZWQgdG8gYWRkIHN1cHBvcnQgZm9y
IFdBS0VfUEhZIHRvIHRoZSBzdG1tYWMKPj4gZHJpdmVyLgo+IE5vLCB3ZSBkb24ndCB3YW50IFdB
S0VfUEhZLCB3ZSB3YW50IFdBS0VfTUFHSUMvV0FLRV9NQUdJQ1NFQ1VSRSB3aGljaAo+IHN0bW1h
YyBkcml2ZXIgYWxyZWFkeSBzdXBwb3J0cy4KCkRvZXMgbm90IG1hdHRlciwgaXQgc2hvdWxkIGJl
IHVwIHRvIHVzZXItc3BhY2UgdG8gaW50ZXJzZWN0IGJldHdlZW4gd2hhdCAKdGhlIFBIWSBpcyBj
YXBhYmxlIG9mIHdha2luZyB5b3UgZnJvbSwgYW5kIHdoYXQgdGhlIGludGVudCBpcy4KLS0gCkZs
b3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
