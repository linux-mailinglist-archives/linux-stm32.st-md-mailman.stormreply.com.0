Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60172A08213
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 22:18:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBAC4C78011;
	Thu,  9 Jan 2025 21:18:23 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D95E3C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 21:18:16 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e549dd7201cso2433009276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736457496; x=1737062296;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
 b=ASZPc2TYW+ywicO+t7Q73TlHYpGQ0DLaIXh0P709pIA1bQ2u9P6Wj/HNKCY0ylw/ad
 C1wB1OgHNKO9JItQjHYSnuGWa5V16UZAeazW4yY4oMWCRZnWQEM0Gqyn2jkg1iUB9/oA
 xhdSxkOm63Swqwt3JijVlAIcQbr/BzK8gNKdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457496; x=1737062296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
 b=XOXzCDO2Cbaz2kSqAh3pXHYIMYNLmP9VYByTTdzylB58eUi3TkZNP46MVUr2mPaW3d
 5DGPGDu/e4IRFVNxfE2WmjqYr+QHW8axPq1L7v6a+9h6TjebFmJXvfa/+iFDSfwJviJZ
 +kZkFFKsjWHjfkJGHMxb7G9SxzJLY1YHxnwguMPDXliEsX0obV+HzKm9f07V3yDB6X/t
 E4NPyXglmm7PqPqgL5nEsnfCZ1Iyr0Hic2/0vK0J+MzFVwDhjFNYNrtq7Td2Arxx8a8Y
 0XHNj2zae8lwm9lBYqfLpMRV4ak1ofv9ZNSfj0bGXTOMCPYefuBiE4dfGWnKSK+ur9Ix
 ACfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfQQccnAgOH/Z8UorVJ6k9Y83h6WbQGon6RdPvzsPqkfdvsQPpofkdrnO3Aa/xihx8BRJ4/oXRiKB3gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxaqrkUtxn6o4BdLTtm2pAAW1BzojC240QReUEu/rHDSI6aCxB
 GF1ltJKSu7c1eQ1RyTZHR4TEYlG5unNNgv9x7LjXD1Z/veSiufKz8U2M6Uq84LZnnOjoIhKMi/M
 HWxs1IKiPBdY13mvpNe9wiUFBmJSO97I05HriEw==
X-Gm-Gg: ASbGncvN2QLXPot4Y3WbMga248wjvdowpof/hEHVYIkkRIyDrP6edj25pHLX6NH4PK9
 utr7a9vSs4Vrrkv76Y2TyL5Y8/iavCVQbFw==
X-Google-Smtp-Source: AGHT+IEitao6xkL4KuruOiZLl8pzkE0Tr8U9XGdZMOjjPpiCZSWKdvOna0N9OTnQBhhi7O+5g4P8CEDUT7rp7zQGK3E=
X-Received: by 2002:a05:6902:10ce:b0:e4a:9ef8:804b with SMTP id
 3f1490d57ef6-e54ee138dfcmr7114871276.19.1736457495749; Thu, 09 Jan 2025
 13:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
 <20250108234807.GA1247672-robh@kernel.org>
In-Reply-To: <20250108234807.GA1247672-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 9 Jan 2025 22:18:05 +0100
X-Gm-Features: AbW1kvaz0srWd9-CXkLWbJC4L5aCPg18CSB1xlYjDSOC4DOcE56GKg2Kqa2-Of4
Message-ID: <CABGWkvpgGNitRfe+qxT9faZ=Oa5+OzbE06dr-0O+w31JOmOQfw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] dt-bindings: clock: st,
 stm32-rcc: support spread spectrum clocking
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

SGVsbG8gUm9iLAoKT24gVGh1LCBKYW4gOSwgMjAyNSBhdCAxMjo0OOKAr0FNIFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBKYW4gMDUsIDIwMjUgYXQgMDc6
MTQ6MTZQTSArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBUaGUgYWRkaXRpb24gb2Yg
RFQgYmluZGluZ3MgZm9yIGVuYWJsaW5nIGFuZCB0dW5pbmcgc3ByZWFkIHNwZWN0cnVtCj4gPiBj
bG9ja2luZyBnZW5lcmF0aW9uIGlzIGF2YWlsYWJsZSBvbmx5IGZvciB0aGUgbWFpbiBQTEwuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPgo+ID4gIC4uLi9iaW5kaW5ncy9jbG9jay9zdCxz
dG0zMi1yY2MueWFtbCAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzItcmNjLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzItcmNjLnlhbWwKPiA+
IGluZGV4IGFlOWU1YjI2ZDg3Ni4uYzM0NWQzZmYzZmM0IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMyLXJjYy55YW1sCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzItcmNj
LnlhbWwKPiA+IEBAIC03Nyw2ICs3NywyNiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIFBoYW5k
bGUgdG8gc3lzdGVtIGNvbmZpZ3VyYXRpb24gY29udHJvbGxlci4gSXQgY2FuIGJlIHVzZWQgdG8g
Y29udHJvbCB0aGUKPiA+ICAgICAgICBwb3dlciBkb21haW4gY2lyY3VpdHJ5Lgo+ID4KPiA+ICsg
IHN0LHNzYy1tb2RmcmVxLWh6Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBUaGUg
bW9kdWxhdGlvbiBmcmVxdWVuY3kgZm9yIG1haW4gUExMIChpbiBIeikKPgo+IE5vIGNvbnN0cmFp
bnRzPwoKVGhleSB2YXJ5IGRlcGVuZGluZyBvbiB0aGUgSFNFIGNsb2NrIGZyZXF1ZW5jeSB1c2Vk
LgoKPgo+ID4gKwo+ID4gKyAgc3Qsc3NjLW1vZGRlcHRoLXBlcm15cmlhZDoKPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlc2Ny
aXB0aW9uOgo+ID4gKyAgICAgIFRoZSBtb2R1bGF0aW9uIHJhdGUgZm9yIG1haW4gUExMIChpbiBw
ZXJteXJpYWQsIGkuZS4gMC4wMSUpCj4gPiArICAgIG1pbmltdW06IDI1Cj4gPiArICAgIG1heGlt
dW06IDIwMAo+ID4gKwo+ID4gKyAgc3Qsc3NjLW1vZG1ldGhvZDoKPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvbm9uLXVuaXF1ZS1zdHJpbmctYXJyYXkKPiA+
ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhlIG1vZHVsYXRpb24gdGVjaG5pcXVlcyBm
b3IgbWFpbiBQTEwuCj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIGVudW06Cj4gPiArICAgICAg
ICAtIGNlbnRlci1zcHJlYWQKPiA+ICsgICAgICAgIC0gZG93bi1zcHJlYWQKPgo+IFdoYXQncyB0
aGUgZGVmYXVsdD8gSWYgdGhlcmUncyBvbmx5IDIgcG9zc2liaWxpdGllcywgdGhlbiB5b3UgY2Fu
IHVzZSBhCj4gYm9vbGVhbiBpbnN0ZWFkLiBUaG91Z2ggSSBhc3N1bWUgeW91IHdhbnQgdG8gc3Vw
cG9ydCBzcHJlYWQtc3BlY3RydW0KPiBkaXNhYmxlZC4KCkdlbmVyYWxseSwgdGhlcmUgY2FuIGFs
c28gYmUgbW9yZSB0aGFuIHR3byBvcHRpb25zLiBGb3IgZXhhbXBsZSwgaW4KdGhlIGNhc2Ugb2Yg
dGhlIGlteDhtIHBsYXRmb3JtLCB0aGVyZSBhcmUgdGhyZWUgcG9zc2liaWxpdGllczoKLSBkb3du
LXNwcmVhZAotIGNlbnRlci1zcHJlYWQKLSB1cC1zcHJlYWQKSW4gb3VyIGNhc2UsIHVzaW5nIGEg
Ym9vbGVhbiB3b3VsZCBoaWRlIG9uZSBvZiB0aGUgdHdvIHBpZWNlcyBvZiBpbmZvcm1hdGlvbiwK
bWVhbmluZyB0aGF0IGlmIEknbSBub3QgdXNpbmcgY2VudGVyLXNwcmVhZCwgd2hhdCBhbSBJIHVz
aW5nPwoKSU1ITywgSSB3b3VsZCBrZWVwIHRoZSBzdHJpbmcgdHlwZSwgY2hhbmdpbmcgaXQgZnJv
bQpvbi11bmlxdWUtc3RyaW5nLWFycmF5IHRvIHN0cmluZy4KCj4KPiBBcmUgdGhlcmUgZGVwZW5k
ZW5jaWVzIGJldHdlZW4gdGhlc2UgcHJvcGVydGllcz8KClRoZSB2YWx1ZXMgbW9kZGVwdGggYW5k
IG1vZGZyZXEgYXJlIHVzZWQgdG8gY2FsY3VsYXRlLCBhY2NvcmRpbmcgdG8gc3BlY2lmaWMKcmVs
YXRpb25zaGlwcywgdHdvIHZhbHVlcyBNT0RQRVIgYW5kIElOQ1NURVAsIHdoaWNoIGFyZSBiaXQg
ZmllbGRzIG9mCmEgc3VpdGFibGUKcmVnaXN0ZXIgZm9yIG1hbmFnaW5nIHRoZSBTU0NHLiBUaGVy
ZSBpcyBhIGNvbnN0cmFpbnQgYmV0d2VlbiB0aGVzZSB0d28gdmFsdWVzLApuYW1lbHkgdGhhdCBN
T0RQRVIgKiBJTkNTVEVQIDwgMzI3NjguIFRoaXMgY29uc3RyYWludCB3aWxsIGJlIG1hbmFnZWQK
YXQgdGhlIGRyaXZlciBsZXZlbC4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KPgo+ID4gKwo+
ID4gIHJlcXVpcmVkOgo+ID4gICAgLSBjb21wYXRpYmxlCj4gPiAgICAtIHJlZwo+ID4gQEAgLTk3
LDYgKzExNywxMCBAQCBhbGxPZjoKPiA+ICAgICAgICAgICAgY29uc3Q6IDEKPiA+ICAgICAgICAg
ICAgZGVzY3JpcHRpb246IHwKPiA+ICAgICAgICAgICAgICBUaGUgY2xvY2sgaW5kZXggZm9yIHRo
ZSBzcGVjaWZpZWQgdHlwZS4KPiA+ICsgICAgICAgIHN0LHNzYy1tb2RmcmVxLWh6OiBmYWxzZQo+
ID4gKyAgICAgICAgc3Qsc3NjLW1vZGRlcHRoLXBlcm15cmlhZDogZmFsc2UKPiA+ICsgICAgICAg
IHN0LHNzYy1tb2RtZXRob2Q6IGZhbHNlCj4gPiArCj4gPiAgICAgIGVsc2U6Cj4gPiAgICAgICAg
cHJvcGVydGllczoKPiA+ICAgICAgICAgICcjY2xvY2stY2VsbHMnOgo+ID4gQEAgLTExOCw2ICsx
NDIsOSBAQCBleGFtcGxlczoKPiA+ICAgICAgICAgIHJlZyA9IDwweDQwMDIzODAwIDB4NDAwPjsK
PiA+ICAgICAgICAgIGNsb2NrcyA9IDwmY2xrX2hzZT4sIDwmY2xrX2kyc19ja2luPjsKPiA+ICAg
ICAgICAgIHN0LHN5c2NmZyA9IDwmcHdyY2ZnPjsKPiA+ICsgICAgICAgIHN0LHNzYy1tb2RmcmVx
LWh6ID0gPDEwMDAwPjsKPiA+ICsgICAgICAgIHN0LHNzYy1tb2RkZXB0aC1wZXJteXJpYWQgPSA8
MjAwPjsKPiA+ICsgICAgICAgIHN0LHNzYy1tb2RtZXRob2QgPSAiY2VudGVyLXNwcmVhZCI7Cj4g
PiAgICAgIH07Cj4gPgo+ID4gICAgLSB8Cj4gPiAtLQo+ID4gMi40My4wCj4gPgoKCgotLSAKCkRh
cmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBU
cmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0
aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
