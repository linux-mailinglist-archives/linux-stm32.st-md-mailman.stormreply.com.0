Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52595527D85
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 08:22:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2910C0D2BF;
	Mon, 16 May 2022 06:22:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E570C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 20:07:02 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 16so7820697lju.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 13:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oO7C2vw614ul0mQK6BxzOvLBf+YYDu+I4LzerhhwUEU=;
 b=HTV3Wkh2Lp4YrH79XsJ7m0xKncbjKkXKpfJU55vortLtEMUxXdGTLCNroyEEFytiTy
 dB11pDocVgYUwakiYNWnPx9xXCiovqxq1mS8kxFMtFs4y9cavCyv7fkpYSyCbGcgBV0v
 ZMWBp2vvvkseRGrEx1+gl02Ta3LNPqo54W+zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oO7C2vw614ul0mQK6BxzOvLBf+YYDu+I4LzerhhwUEU=;
 b=XvM4+6jE0m2/f0KGMQxtIiki9TJU5CRmAKKE8Ghn/Y/i9fRpxg+m8xiSQ5xehhR/95
 2wXmpKUC7rY0uTh0CFSsvmJhWVqJVsAjYk97lem6VA0vO2mZyuEAD2skAnSafjaFby6a
 w9TaCTcEY1ieeAgMuXDkubPYNBGS1UXKTbHExu9SCl4XEdQ/tGJMYcp5/99LgCThxWva
 kVqLxTOekEREjPH6shZvvKkh5pJR3uLGNAFaro0BByYhUH89T/qToHmt30O3BlR1FWPz
 Ki82Na/MGBmjIWIA327EN7So7lMp6m8yDEBgbJRXmIEabBfb4652at9enbNuco83n/rn
 k4yg==
X-Gm-Message-State: AOAM532VyLuiY677n3qtvE0gMsKosbBL9nGM3z1RqYivNvna3qDNTzmK
 G7+QdCcvwZ/LWlN8rrzN/mRJvXSN+mGzg+F5NPsnslPRO95QVw==
X-Google-Smtp-Source: ABdhPJzJlTnaa7a64N7kMzAJom5twCQHCM6va8kx+fcA1V4vXHNXxciYrh9O2VwNVkpoU2ZmYx1BNMaAtK9QlwkOL7Y=
X-Received: by 2002:a2e:9993:0:b0:250:b5a9:18dc with SMTP id
 w19-20020a2e9993000000b00250b5a918dcmr1023327lji.364.1652386021895; Thu, 12
 May 2022 13:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFRbGnQ1P4q+egG+K=BcZL4bwaAdtp7hQ1nh9TYJyky0j3WDw@mail.gmail.com>
In-Reply-To: <CAOFRbGnQ1P4q+egG+K=BcZL4bwaAdtp7hQ1nh9TYJyky0j3WDw@mail.gmail.com>
From: Ozgur <ozgurk@ieee.org>
Date: Fri, 13 May 2022 00:06:51 +0400
Message-ID: <CAADfD8zu9z1EPwMjc0VG2aGg9kzDfpV6qcMqUCGKa+bPNTsr+g@mail.gmail.com>
To: Test Bot <zgrieee@gmail.com>, peppe.cavallaro@st.com
X-Mailman-Approved-At: Mon, 16 May 2022 06:22:30 +0000
Cc: linux@armlinux.org.uk, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, lkml <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] ERROR: drivers: net: ethernet: stmicro: stmmac:
	stmmac_main.c
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

T24gVGh1LCBNYXkgMTIsIDIwMjIgYXQgMTE6NDkgUE0gVGVzdCBCb3QgPHpncmllZWVAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEhpLAoKSGVsbG8sCgppdHMgYSBib3QgYW5kIHN0aWxsIGluIGJldGEg
YW5kIGxvb2tzIGxpa2Ugc2FtZSB3YXJuaW5nIGFzIGFueSBvdGhlciBmaW5kaW5nLgoKTG9va3Mg
bGlrZSBMaW51cyBlLW1haWwgTGludXMgZXhwbGFpbmVkIHRoaXMgd2FybmluZyBhbmQgaSB3YW50
ZWQgdG8Kc2hhcmUgZS1tYWlsLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUhrLT13
aDVFLXhkYzVQNlNmTi1leTZ6dlZyaTQzclRqMGc4a2pVQldEM2hoRS1qaXdAbWFpbC5nbWFpbC5j
b20vCgpSZWdhcmRzCgo+IEkgYXV0b21hdGljYWxseSB0ZXN0IChSQykga2VybmVsIGFuZCBjYXVn
aHQgRVJST1Igd29yZC4KPiBQbGVhc2UgaWdub3JlLCBpZiBpdHMgdW5pbXBvcnRhbnQuCj4KPiBL
ZXJuZWw6IDUuMTgtcmM2Cj4gQXJjaDogeDg2XzY0IChTTVApCj4gQ29tcGlsZXI6IDcuNS4wIChn
Y2MpCj4gRklsZTogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+Cj4gQ29kZWJhc2UgQmxvY2s6Cj4KPiBzdGF0aWMgaW50IHN0bW1hY19yZXF1ZXN0X2ly
cV9tdWx0aV9tc2koc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPiB7Cj4gICAgICAgICBzdHJ1Y3Qg
c3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihkZXYpOwo+ICAgICAgICAgZW51bSByZXF1
ZXN0X2lycV9lcnIgaXJxX2VycjsKPiAgICAgICAgIGNwdW1hc2tfdCBjcHVfbWFzazsKPiAgICAg
ICAgIGludCBpcnFfaWR4ID0gMDsKPiAgICAgICAgIGNoYXIgKmludF9uYW1lOwo+ICAgICAgICAg
aW50IHJldDsKPiAgICAgICAgIGludCBpOwo+Cj4gICAgICAgICBpbnRfbmFtZSA9IHByaXYtPmlu
dF9uYW1lX21hYzsKPiAgICAgICAgIHNwcmludGYoaW50X25hbWUsICIlczolcyIsIGRldi0+bmFt
ZSwgIm1hYyIpOwo+ICAgICAgICAgcmV0ID0gcmVxdWVzdF9pcnEoZGV2LT5pcnEsIHN0bW1hY19t
YWNfaW50ZXJydXB0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgaW50X25hbWUsIGRl
dik7Cj4KPiAgICAgICAgIGlmICh1bmxpa2VseShyZXQgPCAwKSkgewo+ICAgICAgICAgICAgICAg
ICBuZXRkZXZfZXJyKHByaXYtPmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXM6
IGFsbG9jIG1hYyBNU0kgJWQgKGVycm9yOiAlZClcbiIsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX19mdW5jX18sIGRldi0+aXJxLCByZXQpOwo+ICAgICAgICAgICAgICAgICBpcnFfZXJy
ID0gUkVRX0lSUV9FUlJfTUFDOwo+ICAgICAgICAgICAgICAgICBnb3RvIGlycV9lcnJvcjsKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHByaXYtPndvbF9pcnEgPiAwICYmIHByaXYtPndvbF9p
cnEgIT0gZGV2LT5pcnEpIHsKPiAgICAgICAgICAgICAgICAgaW50X25hbWUgPSBwcml2LT5pbnRf
bmFtZV93b2w7Cj4gICAgICAgICAgICAgICAgIHNwcmludGYoaW50X25hbWUsICIlczolcyIsIGRl
di0+bmFtZSwgIndvbCIpOwo+ICAgICAgICAgICAgICAgICByZXQgPSByZXF1ZXN0X2lycShwcml2
LT53b2xfaXJxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdG1tYWNfbWFj
X2ludGVycnVwdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgaW50X25h
bWUsIGRldik7Cj4KPiAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJldCA8IDApKSB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgbmV0ZGV2X2Vycihwcml2LT5kZXYsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiJXM6IGFsbG9jIHdvbCBNU0kgJWQgKGVycm9yOiAl
ZClcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgcHJp
di0+d29sX2lycSwgcmV0KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfZXJyID0gUkVR
X0lSUV9FUlJfV09MOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gaXJxX2Vycm9yOwo+
ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiBDb21waWxlciAgTG9nOgo+Cj4gZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYzogSW4gZnVuY3Rp
b24KPiDigJhzdG1tYWNfcmVxdWVzdF9pcnFfbXVsdGlfbXNp4oCZOgo+IGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmM6MzU2MjoxOiB3YXJuaW5nOiB0aGUK
PiBmcmFtZSBzaXplIG9mIDEwNDAgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcwo+IFst
V2ZyYW1lLWxhcmdlci10aGFuPV0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
