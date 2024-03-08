Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE37876A4B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Mar 2024 18:56:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C939C6DD72;
	Fri,  8 Mar 2024 17:56:46 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CED7C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 17:56:44 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-29baaf3c018so980798a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Mar 2024 09:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709920603; x=1710525403;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgXSP3d/pfH7TPIm6gVXNmyWtFVxa9g4fw/sbjv/wQ8=;
 b=OBUWvSsLw6fePnfLqpX6eQRbyUDozdwgYBolojOWjf4EKVwMWFiZzD/rqVZh+exUIn
 eP5pa0k/Noe8axpwAL/MHAyc5AWC107jnKx0k8kb7xCXTLSgWRfwWDEvbZfoBxteec68
 /mMVGbIJxViazncXbU1PJ3u5nBHhDGV3V61cxfIYLFR88CY08DzNR362fBRvYhs8KffU
 t7ftNcZ4fvHl8M3vruAwl8qc2c9N6TN/WQOPSK/c+UOg3FJ2lEf0vxgQ+5R7U0bFytD4
 hG6JMG6HT7QR3OTDIeBSrWinwSUKi+WMEZGL8UjG6ySe9YE1gwnYWIYeqLC1Vj5PPntc
 1bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709920603; x=1710525403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgXSP3d/pfH7TPIm6gVXNmyWtFVxa9g4fw/sbjv/wQ8=;
 b=mN+R84SMs6eGp5sh0pKXxnivmNSyfjEKzmKQ9gSLdTNo3srOx++ygzwma8k1iw9UnG
 r0MZkgIljKXQe1j6ZLrBB2J2iCO9vwIHNUUMf9aBZ8f/9CQwrjoh/8ZzGZASCZq8pjkh
 TPoUqKI2TR4r5NHCcIRYixuPxV6gclLx4DS9ZhPqeFJlJrgo4z3h21eJcBDkfljaVK0t
 tbnBgRri69opk76lCC3yxXMqla+xphWxrYS9Rb7vrQ9v1Ry6LNgUsz4ympALrPJE6JHO
 Uxym+O+gE78fj6ZsEimmBgDpWGYwmpVyQC5Z3JxmogmeDyMjwq6Gqayfsj42mWqGf43s
 Rf3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFTsKp7rwuW0KXtnysfVEpQ9jFyvDmvYu7ZO/VANeOCgOU8B7wWWTu1Kn72yMV0LZUnfoUPIIOzfp6yxXpGOFxGMqi1hWkhjg4bd471Zt8fIegA9TlesJz
X-Gm-Message-State: AOJu0YzrnJ9gpmhF/ZmU7JpYN7Nt0KqpBRDeB6S/s9T2HJjN67Qe7lFR
 ax3uelMoHoJrqrPUglKWI4kMVg3/PGPRJMms4uoOL041xzA7KLWA
X-Google-Smtp-Source: AGHT+IEjLZQEiki14E+8+WuQTj2DOEDO9pnd9LRofgXc5k2m0gMxe8g0kXRmMDI4Og1HNoFRHiM7HQ==
X-Received: by 2002:a17:90a:8d85:b0:29b:6da4:277e with SMTP id
 d5-20020a17090a8d8500b0029b6da4277emr801752pjo.1.1709920602765; 
 Fri, 08 Mar 2024 09:56:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 cx12-20020a17090afd8c00b0029bc28b8cedsm27722pjb.28.2024.03.08.09.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 09:56:42 -0800 (PST)
Message-ID: <9bb24a9b-4c95-49f9-8afb-2fdeeed64198@gmail.com>
Date: Fri, 8 Mar 2024 09:56:39 -0800
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
 <a25d4d76-a49a-4423-8916-5d7d9303b87a@gmail.com>
 <917f5cea-69d2-4ce2-a5a3-184332415fe5@leica-geosystems.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <917f5cea-69d2-4ce2-a5a3-184332415fe5@leica-geosystems.com>
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

T24gMy84LzI0IDA5OjQ4LCBQT1BFU0NVIENhdGFsaW4gd3JvdGU6Cj4gT24gMDcuMDMuMjQgMTk6
NTIsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQg
dGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tCj4+IGYuZmFpbmVsbGlAZ21h
aWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQKPj4gaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gVGhpcyBlbWFpbCBpcyBub3Qg
ZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUKPj4gY2FyZWZ1
bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcg
dG8gdGhpcwo+PiBlbWFpbC4KPj4KPj4KPj4gT24gMy83LzIwMjQgMToxMyBBTSwgUE9QRVNDVSBD
YXRhbGluIHdyb3RlOgo+Pj4gT24gMDYuMDMuMjQgMTg6NDEsIEZsb3JpYW4gRmFpbmVsbGkgd3Jv
dGU6Cj4+Pj4gW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0
ZW4gZ2V0IGVtYWlsIGZyb20KPj4+PiBmLmZhaW5lbGxpQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0Cj4+Pj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0KPj4+Pgo+Pj4+IFRoaXMgZW1haWwgaXMgbm90IGZyb20gSGV4YWdvbuKA
mXMgT2ZmaWNlIDM2NSBpbnN0YW5jZS4gUGxlYXNlIGJlCj4+Pj4gY2FyZWZ1bCB3aGlsZSBjbGlj
a2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcwo+Pj4+
IGVtYWlsLgo+Pj4+Cj4+Pj4KPj4+PiBPbiAzLzYvMjQgMDk6MjQsIENhdGFsaW4gUG9wZXNjdSB3
cm90ZToKPj4+Pj4gQWRkIHN1cHBvcnQgZm9yIFBIWSBXT0wgY2FwYWJpbGl0eSBpbnRvIGR3bWFj
LWlteCBNQUMgZHJpdmVyLgo+Pj4+PiBUaGlzIGlzIHJlcXVpcmVkIHRvIGVuYWJsZSBXT0wgZmVh
dHVyZSBvbiBhIHBsYXRmb3JtIHdoZXJlIE1BQwo+Pj4+PiBXT0wgY2FwYWJpbGl0eSBpcyBub3Qg
c3VmZmljaWVudCBhbmQgV09MIGNhcGFiaWxpdHkgYnVpbHQgaW50bwo+Pj4+PiB0aGUgUEhZIGlz
IGFjdHVhbGx5IG5lZWRlZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBQb3Bl
c2N1IDxjYXRhbGluLnBvcGVzY3VAbGVpY2EtZ2Vvc3lzdGVtcy5jb20+Cj4+Pj4KPj4+PiBOb3Bl
LCB0aGlzIGlzIG5vdCBhYm91dCBob3cgdG8gZG8gdGhpcy4gWW91IHVzZSBhIERldmljZSBUcmVl
IHByb3BlcnR5Cj4+Pj4gYXMgYSBwb2xpY3kgcmF0aGVyIHRoYW4gcHJvcGVybHkgZGVzY3JpYmUg
eW91ciBzeXN0ZW1zIGNhcGFiaWxpdGllcy4KPj4+IEknbSBub3Qgc3VyZSB3aGF0IHBvbGljeSBt
ZWFucyBpbiB0aGF0IGNvbnRleHQuCj4+PiBCVFcsIGR3bWFjLW1lZGlhdGVrIGRvZXMgdGhlIHNh
bWUgd2l0aCBiaW5kaW5nICJtZWRpYXRlayxtYWMtd29sIiB3aGljaAo+Pj4gaXMgYSBjb21taXQg
ZnJvbSAwMy8yMDIyLgo+Pgo+PiBQb2xpY3kgaGVyZSBtZWFucyB5b3Ugd2FudCBhIGNlcnRhaW4g
YmVoYXZpb3IgZnJvbSB0aGUgT1MgdGhhdCBpcwo+PiBjb25zdW1pbmcgdGhlIERldmljZSBUcmVl
LCBhbmQgdGhhdCBiZWhhdmlvciBpcyBlbmNvZGVkIHZpYSBhIERldmljZQo+PiBUcmVlIHByb3Bl
cnR5LiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIGRlc2NyaWJpbmcgaG93IHRoZSBoYXJkd2FyZSB3
b3Jrcwo+PiB3aGljaCBkb2VzIG5vdCBtYWtlIGFueSBwcm92aXNpb25zIGZvciBnZXR0aW5nIGEg
YmVoYXZpb3Igb3V0IG9mIHRoZSBPUy4KPj4KPj4+IEkgdW5kZXJzdGFuZCB0aGlzIHdheSBvZiBk
b2luZyBiZWNhbWUgInVuYWNjZXB0YWJsZSIgc2luY2UgdGhlbiA/Pwo+Pgo+PiBJdCB3YXMgbm90
IGFjY2VwdGFibGUgdGhlbiwgYnV0IHRoZXJlIGlzIG9ubHkgYSBsaW1pdGVkIHJldmlld2VyIHRp
bWUsCj4+IGFuZCBpdCBpcyBlYXN5IHVuZm9ydHVuYXRlbHkgdG8gc25lYWsgdGhyb3VnaCByZXZp
ZXdlcnMuCj4+Cj4+Pj4KPj4+PiBXaGF0IHNvcnQgb2YgV2FrZS1vbi1MQU4gZG8geW91IHdhbnQg
dG8gYmUgZG9uZSBieSB0aGUgUEhZIGV4YWN0bHk/Cj4+Pj4gRG9lcwo+Pj4+IHRoZSBQSFkgaGF2
ZSBwYWNrZXQgbWF0Y2hpbmcgY2FwYWJpbGl0aWVzLCBvciBkbyB5b3Ugd2FudCB0byB3YWtlLXVw
Cj4+Pj4gZnJvbSBhIFBIWSBldmVudCBsaWtlIGxpbmsgdXAvZG93bi9hbnkgaW50ZXJydXB0Pwo+
Pj4KPj4+IFBIWSBpcyBUSSBkcDgzODI2IGFuZCBoYXMgc2VjdXJlIG1hZ2ljIHBhY2tldCBjYXBh
YmlsaXR5LiBGb3IgdGhlIHdha2V1cAo+Pj4gd2UgcmVseSBvbiBhIGV4dGVybmFsIE1DVSB3aGlj
aCBpcyBzaWduYWxlZCB0aHJvdWdoIGEgUEhZJ3MgR1BJTyB3aGljaAo+Pj4gdG9nZ2xlcyBvbmx5
IG9uIG1hZ2ljIHBhY2tldCByZWNlcHRpb24uCj4+PiBXZSB3YW50IHRvIHdha2V1cCBfb25seV8g
b24gbWFnaWMgcGFja2V0IHJlY2VwdGlvbi4KPj4KPj4gVGhlbiB5b3UgbmVlZCB0byByZXByZXNl
bnQgdGhhdCB3YWtlLXVwIEdQSU8gbGluZSBpbiB0aGUgRGV2aWNlIFRyZWUsCj4+IGFzc29jaWF0
ZSBpdCB3aXRoIHRoZSBQSFkncyBEZXZpY2UgVHJlZSBub2RlIGZvciBzdGFydGVycyBhbmQgYWRk
IGluIGEKPj4gJ3dha2V1cC1zb3VyY2UnIHByb3BlcnR5IGluIHRoZSBEZXZpY2UgVHJlZS4KPiBU
aGUgR1BJTyBJIHdhcyByZWZlcnJpbmcgdG8gaXMgYSBQSFkgR1BJTyBub3QgYSBTT0MgR1BJTywg
c28gdGhlcmUncyBubwo+IHdheSB0byBkZXNjcmliZSBpdCBpbnRvIHRoZSBEVC4KCldlbGwsIHRl
Y2huaWNhbGx5IHRoZXJlIGlzLCBpdCdzIGp1c3QgdGhhdCB0aGUgUEhZIGlzIG5vdCByZWdpc3Rl
cmVkIAp3aXRoIExpbnV4IGFzIGEgR1BJTyBjb250cm9sbGVyL3Byb3ZpZGVyLCBub3RoaW5nIHBy
ZXZlbnRzIHlvdSBmcm9tIApkb2luZyB0aGF0LCBidXQgaXQgc3RhcnRzIHJhaXNpbmcgdGhlIGJh
ci4KCj4gVGhlIFBIWSBpcyBjb25uZWN0ZWQgb24gdGhlIFNPQyBNRElPIGJ1cywgc28gdGhlIFNP
QyBwcm9ncmFtcyB0aGUgUEhZLAo+IGJ1dCB0aGUgUEhZIHdha2VzIHVwIHRoZSBleHRlcm5hbCBN
Q1Ugd2hpY2ggaW4gdHVybiB3YWtlcyB1cCB0aGUgU09DLgoKT0ssIGJ1dCB0aGF0IHN0aWxsIG5l
ZWRzIHRvIGJlIGRlc2NyaWJlZCBzb21laG93LCBvdGhlcndpc2UgeW91IGFyZSBqdXN0IApjdXR0
aW5nIGNvcm5lcnMgYW5kIGFzc3VtaW5nIHRoYXQgdGhlIHBpbiBmcm9tIHRoZSBQSFkgdG8gdGhl
IGV4dGVybmFsIApNQ1UgaXMgb25seSBkcml2ZW4gd2hlbiB0aGUgUEhZIGRyaXZlcyBpdCwgaG93
IGFib3V0IG90aGVyIHdha2UtdXAgCnNvdXJjZXMgdG8gdGhlIE1DVT8KCj4gCj4+Cj4+IE5vdyB0
aGUgUEhZIGRyaXZlciBjYW4ga25vdyBhYm91dCB0aGUgZXhpc3RlbmNlIG9mIGEgR1BJTyBhbmQg
aXQgY2FuCj4+IGtub3cgdGhlIFBIWSBpcyBhIHN5c3RlbSB3YWtlLXVwIHNvdXJjZSwgc28gdGhl
IGRyaXZlciBjYW4gY2FsbAo+PiBkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxlKCkuCj4+Cj4+IElu
IHVzZXItc3BhY2UgeW91IGhhdmUgdG8gY29uZmlndXJlIHRoZSBuZXR3b3JrIGludGVyZmFjZSB3
aXRoCj4+IFdBS0VfTUFHSUNTRUNVUkUgd2hpY2ggbmVlZHMgdG8gcHJvcGFnYXRlIHRvIHRoZSBQ
SFkgZHJpdmVyIGZvciBhZGVxdWF0ZQo+PiBjb25maWd1cmF0aW9uLiBTdGlsbCBpbiB1c2VyLXNw
YWNlIHlvdSBuZWVkIHRvIG1ha2UgdGhlIFBIWSBkZXZpY2UKPj4gd2FrZS11cCAqZW5hYmxlZCog
YnkgZG9pbmc6Cj4+Cj4+IGVjaG8gImVuYWJsZSIgPiAvc3lzL2NsYXNzL25ldC9ldGhYL2F0dGFj
aGVkX3BoeWRldi9wb3dlci93YWtldXAKPj4KPj4gSWYgYm90aCBXQUtFX01BR0lDU0VDVVJFIGlz
IGVuYWJsZWQgYW5kIHRoZSBQSFkgZGV2aWNlIGluIHN5c2ZzIHJlcG9ydHMKPj4gdGhhdCBpdCBp
cyB3YWtlLXVwIGVuYWJsZWQgd291bGQgeW91IHdha2UtdXAgZnJvbSB0aGUgUEhZJ3MgR1BJTy4g
WW91cgo+PiBQSFkgZHJpdmVyIG91Z2h0IHRvIGJlIG1vZGlmaWVkIHRvIGNoZWNrIGZvciBib3Ro
Cj4+Cj4+IGRldmljZV93YWtldXBfZW5hYmxlZCgpIGFuZCB3b2xvcHRzIGJlaW5nIG5vbi16ZXJv
IHRvIGNhbGwKPj4gZW5hYmxlX2lycV93YWtlKCkgb24gdGhlIEdQSU8gaW50ZXJydXB0IGxpbmUu
Cj4+Cj4+IFRoYXQncyBob3cgSSB3b3VsZCBnbyBhYm91dCBkb2luZyB0aGlzLCB5ZXMgaXQncyBh
IHRhZCBtb3JlIGNvbXBsaWNhdGVkCj4+IHRoYW4gYWRkaW5nIGFuIGFkLWhvYyBEZXZpY2UgVHJl
ZSBwcm9wZXJ0eSwgYnV0IGl0J3MgbW9yZSBmbGV4aWJsZSBhbmQKPj4gaXQncyB0cmFuc3Bvc2Fi
bGUgdG8gb3RoZXIgY29uZmlndXJhdGlvbnMsIHRvby4gV2hldGhlciB0aGF0IHNvcnQgb2YKPj4g
ZW5jb2RpbmcgbmVlZHMgdG8gYmUgaW4gdGhlIGluZGl2aWR1YWwgUEhZIGRyaXZlcnMgb3Igc29t
ZXdoZXJlIGluIHRoZQo+PiBQSFkgbGlicmFyeSBjYW4gYmUgZGVjaWRlZCBpZiB3ZSBoYXZlIG1v
cmUgdGhhbiBvbmUgc2ltaWxhcgo+PiBjb25maWd1cmF0aW9uIHRvIHN1cHBvcnQuCj4+Cj4gWWVz
LCBpdCdzIG1vcmUgY29tcGxpY2F0ZWQgYW5kIGl0IGRvZXNuJ3QgYXBwbHkgdG8gb3VyIHBsYXRm
b3JtLgo+IEJ1dCwgdGhpcyBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgaW4gdGhlIGVuZCwgdGhlIHBy
b2JsZW0gSSdtIHRyeWluZyB0bwo+IGFkZHJlc3MgaGVyZSBpcyB0byBhbGxvdyBzdG1hYyBmb3Ig
SU1YIHRvIHN1cHBvcnQgUEhZIFdPTC4KPiBTaW5jZSB0aGUgYmluZGluZyBpcyBub3QgYWNjZXB0
YWJsZSwgSSBndWVzcyB0aGUgb25seSBvcHRpb24gaGVyZSBpcyB0bwo+IHJlbW92ZSBmbGFnIFNU
TU1BQ19GTEFHX1VTRV9QSFlfV09MIGZyb20gc3RtYWMgZHJpdmVyIGFuZCByZXBsYWNlIGl0Cj4g
d2l0aCBhIGNhbGwgdG8gcGh5bGlua19ldGh0b29sX2dldF93b2wgdG8gaWRlbnRpZnkgd2hldGhl
ciB0aGUgUEhZIGlzCj4gV09MIGNhcGFibGUgb3Igbm90Lgo+IFRoZW4sIGhvdyBzaG91bGQgd2Ug
YWxsb3cgdGhlIHBsYXRmb3JtIHRvIGNob29zZSBiL3cgTUFDIFdPTCBhbmQgUEhZIFdPTAo+IGlm
IGJvdGggYXJlIHN1cHBvcnRlZCA/CgpXZSBkb24ndCBoYXZlIGEgZ29vZCB3YXkgdG8gY29uZmln
dXJlIHRoYXQgZGVjaXNpb24gY29uc2lzdGVudGx5IGFuZCAKYWNyb3NzICphbGwqIGRldmljZSBk
cml2ZXJzIGN1cnJlbnRseSwgd2hhdCBJIGNhbiB0aGluayBvZiBhcyB0aGUgbGVhc3QgCmJhZCBz
b2x1dGlvbiBpcyB0byBpbnRlcnNlY3QgYmV0d2VlbiB0aGUgUEhZIHN1cHBvcnRlZCBXT0wgbW9k
ZXMsIHRoZSAKTUFDIHN1cHBvcnRlZCBXT0wgbW9kZXMsIGFuZCBjaGVja2luZyB3aGljaCBvZiB0
aG9zZSBpcyBhIHdha2UtdXAgZW5hYmxlIApkZXZpY2UgdmlhIGRldmljZV93YWtldXBfZW5hYmxl
ZCgpIGFuZCB1c2UgdGhhdCBvbmUgd2l0aCBhIHByZWZlcmVuY2UgCmZvciB0aGUgUEhZIHNpbmNl
IHRoYXQgaXMgdGhlIGNsb3Nlc3QgdG8gdGhlIHdpcmUuIEJ1dCB0aGlzIG1pZ2h0IGJlIApnb29k
IGZvciBtZSBhbmQgeW91LCBtYXliZSBub3QgZm9yIG90aGVycy4KCj4gQUZBSUsgZXRodG9vbCBv
bmx5IGtub3dzIGFib3V0IE1BQyBXT0wgY2FwYWJpbGl0eSBzaW5jZSBpdCBpbnRlcnJvZ2F0ZXMK
PiB0aGUgTUFDIGludGVyZmFjZS4gZXRodG9vbCBkb2Vzbid0IGtub3cgYW55dGhpbmcgYWJvdXQg
dGhlIFBIWSwgb3IgZG9lcwo+IGl0ID8/CgpObyB3ZSBkb24ndCwgYW5kIHVudGlsIE1heGltZSdz
IHBhdGNoZXMgYWJvdXQgUEhZIHRvcG9sb2d5IGxhbmQgdXBzdHJlYW06CgpodHRwczovL2x3bi5u
ZXQvQXJ0aWNsZXMvOTYxOTU5LwoKd2UgZG8gbm90IHdhbnQgdG8gaW52ZW50IG1hbnkgZGlmZmVy
ZW50IHdheXMgb2Ygc3BlY2lmeWluZyB3aGljaCBvZiB0aGUgCk1BQyBvciB0aGUgUEhZIHNob3Vs
ZCBiZSB1c2VkIGZvciBXT0wuIEZXSVcsIEkgaGF2ZSBhIHNpbWlsYXIgbmVlZDoKCmh0dHBzOi8v
d3d3LnNwaW5pY3MubmV0L2xpc3RzL25ldGRldi9tc2c3NTExOTYuaHRtbAoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMxMDI2MjI0NTA5LjExMjM1My0xLWZsb3JpYW4uZmFpbmVsbGlA
YnJvYWRjb20uY29tLwotLSAKRmxvcmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
