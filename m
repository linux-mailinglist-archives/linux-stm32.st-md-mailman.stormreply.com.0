Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E6195D3C9
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 18:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAFAAC71289;
	Fri, 23 Aug 2024 16:54:43 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B108C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 16:54:36 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f3b8eb3df5so22072211fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 09:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724432075; x=1725036875;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zon1U6XI7RDgoBlJOOvO1r9gIw8jdWpzCbK+CHqcbzY=;
 b=l5vMKe2NfnYQXVYXsrh9g0Ic1qeVJfFScCTZI42Cmcj12Ws2G2/+VqMEmei820o4IY
 f+HEV1oSTGoaf/sJ7nNBL95rr40qMKBYnAPvK/W/YkSe1rkFoY74SN4HjX0kZTmH/JQK
 zAbW7m7Av2VwrzqVCEhEmQbEtW1DvOWLHwSWbW/3iCVDhYQ2+Gah+Z1zHoh8XdxtxEW+
 iyJXzC2L0/2pSZpuYSaRLoNtCIR3gmIZCJ5BngTNRZd1ciqJSWHeymif16mDznCDEmRy
 jogTBqo1gFbHyX1UY8LSPTIkdqiq0aFs6gHrBehlaEytCuPLFo+gw2WDdHYgNrP5fUdN
 phew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724432075; x=1725036875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zon1U6XI7RDgoBlJOOvO1r9gIw8jdWpzCbK+CHqcbzY=;
 b=QPKqrA/U8IBOJnfpTRqnIQeptzHGh3VaLqZdBSRs9JXVQDPYjQLkZQs5S7UVIdeIOv
 Du1BlTMsLNKDSuSZj3pQFQ6P7Ux4vQhoZIVj1A/EjSatETsDW32kbBgbqmmgkZKci8De
 UTiBoBPzXiibDWqUpYJ/Y3Hxj5wYHdvbP/X0hNCCMwJwjPQfNAludVTu11ozUHUTMskG
 3dHkav/1IW6S611sND96WIJxEwYAqecRH5Hlt+/8l1rWVP05nDGPWPMXGNdM1+o+8fBa
 i3vRMpXX5EoHfSvCkHrIcvXQCKlWKUXL9lSLREW5vJNuf9Dn5zE/+ejPURZqBA7uk6ot
 HQuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaX3JoAiP+JAidn6y7MRopxY6V5OS7L6dJPJosK8X+UpBAnfdRsJpN3FNWGmRoarZMtyMSgCCGYIRCPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yys4o5XzzPROW0nkeTWJRsdxeextspYhpfUna/pVV4sChpIZqwV
 vLKMwaJ9m6S72E1V/JRuIYiBazBBMCbLByo0u5lWkzZ8Qvhz7ujK2o4EQX4j/Z9yMK2NCHjft1t
 88+i3K228Sl9HSJhb0teBFn44n4g=
X-Google-Smtp-Source: AGHT+IFEzl8US1Mj3j70Ag46lDtaK4hvgcjCEPbcQtWo5rRj98mh3iglrl7HOszxszM05TikzwLuQPgOV0GYu+wm+ic=
X-Received: by 2002:a2e:9d07:0:b0:2f3:f794:b18 with SMTP id
 38308e7fff4ca-2f4f57357bcmr15390471fa.11.1724432075088; Fri, 23 Aug 2024
 09:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-8-frank.li@vivo.com>
In-Reply-To: <20240823072122.2053401-8-frank.li@vivo.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Fri, 23 Aug 2024 18:54:23 +0200
Message-ID: <CAHzn2R39CuQS3WJYs7=2jeg8LvhTrYC8xKmOiTDZKLhmbsLqig@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: andrew@lunn.ch, kees@kernel.org, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v2 7/9] net: ethernet: marvell: mvneta:
	Convert to devm_clk_get_enabled()
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

cHQuLCAyMyBzaWUgMjAyNCBvIDA5OjA3IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPiBu
YXBpc2HFgihhKToKPgo+IENvbnZlcnQgZGV2bV9jbGtfZ2V0KCksIGNsa19wcmVwYXJlX2VuYWJs
ZSgpIHRvIGEgc2luZ2xlCj4gY2FsbCB0byBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpLCBhcyB0aGlz
IGlzIGV4YWN0bHkKPiB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+IFJldmlld2VkLWJ5OiBNYXhpbWUgQ2hl
dmFsbGllciA8bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+Cj4gLS0tCgpSZXZpZXdlZC1i
eTogTWFyY2luIFdvanRhcyA8bWFyY2luLnMud29qdGFzQGdtYWlsLmNvbT4KClRoYW5rcyEKTWFy
Y2luCgoKPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9tdm5ldGFfYm0uYyB8IDE2ICsr
KysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9tdm5ldGFfYm0u
aCB8ICAxIC0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvbXZuZXRh
X2JtLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL212bmV0YV9ibS5jCj4gaW5kZXgg
M2Y0NmEwZmVkMDQ4Li5iZmQxZWQxMmQ5OGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvbWFydmVsbC9tdm5ldGFfYm0uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21h
cnZlbGwvbXZuZXRhX2JtLmMKPiBAQCAtNDExLDYgKzQxMSw3IEBAIHN0YXRpYyBpbnQgbXZuZXRh
X2JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgICAgICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqZG4gPSBwZGV2LT5kZXYub2Zfbm9kZTsKPiAgICAgICAgIHN0cnVj
dCBtdm5ldGFfYm0gKnByaXY7Cj4gKyAgICAgICBzdHJ1Y3QgY2xrICpjbGs7Cj4gICAgICAgICBp
bnQgZXJyOwo+Cj4gICAgICAgICBwcml2ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVv
ZihzdHJ1Y3QgbXZuZXRhX2JtKSwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTQyMSwxNyArNDIyLDE0IEBA
IHN0YXRpYyBpbnQgbXZuZXRhX2JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICBpZiAoSVNfRVJSKHByaXYtPnJlZ19iYXNlKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIFBUUl9FUlIocHJpdi0+cmVnX2Jhc2UpOwo+Cj4gLSAgICAgICBwcml2LT5jbGsgPSBk
ZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gLSAgICAgICBpZiAoSVNfRVJSKHByaXYt
PmNsaykpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHByaXYtPmNsayk7Cj4gLSAg
ICAgICBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+Y2xrKTsKPiAtICAgICAgIGlmIChl
cnIgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsgICAgICAgY2xrID0gZGV2
bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gKyAgICAgICBpZiAoSVNfRVJS
KGNsaykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNsayk7Cj4KPiAgICAgICAg
IGVyciA9IG12bmV0YV9ibV9nZXRfc3JhbShkbiwgcHJpdik7Cj4gICAgICAgICBpZiAoZXJyIDwg
MCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gYWxs
b2NhdGUgaW50ZXJuYWwgbWVtb3J5XG4iKTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfY2xr
Owo+ICsgICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBw
cml2LT5wZGV2ID0gcGRldjsKPiBAQCAtNDUyLDggKzQ1MCw2IEBAIHN0YXRpYyBpbnQgbXZuZXRh
X2JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4KPiAgZXJyX3NyYW06Cj4g
ICAgICAgICBtdm5ldGFfYm1fcHV0X3NyYW0ocHJpdik7Cj4gLWVycl9jbGs6Cj4gLSAgICAgICBj
bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Y2xrKTsKPiAgICAgICAgIHJldHVybiBlcnI7Cj4g
IH0KPgo+IEBAIC00NzMsOCArNDY5LDYgQEAgc3RhdGljIHZvaWQgbXZuZXRhX2JtX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Cj4gICAgICAgICAvKiBEZWN0aXZhdGUgQk0g
dW5pdCAqLwo+ICAgICAgICAgbXZuZXRhX2JtX3dyaXRlKHByaXYsIE1WTkVUQV9CTV9DT01NQU5E
X1JFRywgTVZORVRBX0JNX1NUT1BfTUFTSyk7Cj4gLQo+IC0gICAgICAgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKHByaXYtPmNsayk7Cj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtdm5ldGFfYm1fbWF0Y2hbXSA9IHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvbWFydmVsbC9tdm5ldGFfYm0uaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwv
bXZuZXRhX2JtLmgKPiBpbmRleCBlNDc3ODNjZTc3ZTAuLjM5NmRjZWQ5MTRhYSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL212bmV0YV9ibS5oCj4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9tdm5ldGFfYm0uaAo+IEBAIC05NCw3ICs5NCw2IEBA
IGVudW0gbXZuZXRhX2JtX3R5cGUgewo+Cj4gIHN0cnVjdCBtdm5ldGFfYm0gewo+ICAgICAgICAg
dm9pZCBfX2lvbWVtICpyZWdfYmFzZTsKPiAtICAgICAgIHN0cnVjdCBjbGsgKmNsazsKPiAgICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4KPiAgICAgICAgIHN0cnVjdCBnZW5f
cG9vbCAqYnBwaV9wb29sOwo+IC0tCj4gMi4zOS4wCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
