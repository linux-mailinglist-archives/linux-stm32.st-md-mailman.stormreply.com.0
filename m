Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719072DBCC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 09:58:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FDDC6A617;
	Tue, 13 Jun 2023 07:58:57 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD76AC6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 07:58:56 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-789de11638fso292620241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686643135; x=1689235135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsJLNzamcvflvt39bJ653iKfbKKP5ytmbnffadMCPyM=;
 b=NzCmxWBnfmLYJE9eX8SGkh9EhG7MM+9AO4XxEFNdYE36a5jCujth0fxlxzD/WRlvI8
 wwHufGE06Z+3m94N+4rDADqMOC4ANpUJorLdPwiUD00X2QXZznGT46ZEvMM0nF5r7Hri
 9GXJltOAClw2tO8tc9BIcNcAmC/T/tpq50YHo40fVChd+g0FeBMUbytkvo7nId5TBP0R
 1L0PMHqcFc6yCQ9/WNDJ5GubKrmAIjPco7+TvVkVgtJNRwxw658g7/AUVJ8UH0JCOH2P
 tjKwFbEn3WJEakotGAE6Gq3ferV6U8Sae8+CLPLCZsmps1TPLgesfq6pbt4z12KWyPjJ
 ekjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686643135; x=1689235135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsJLNzamcvflvt39bJ653iKfbKKP5ytmbnffadMCPyM=;
 b=VstkM4P7I+VYCXzdqYmYx9c1nkO+FCT/EVD4eERpSOL6JlFi3dwuxRX3S5g1Y+kHEr
 oBQvMKg43crIYL0mPWz4UfXhGpQchefXYW+vRBshhgH0f9QU9CrcA83uxzG//4ZOp45N
 MwTzJi9XqVXmUSxBtwi7Y9n4n+o5XO2FJMqKJgmxF186w2MiqVmRSQdduPjxqy2CC5ed
 HEBvef5M1w+HOn1ljuVFxqcVgCfYypY4jt0C++gh0vJ1IH9c1v77IaLyXZrDNEFkhe4e
 pR2k6F4fnqCesY53OhDBWonz3SrMmGjlyTXdDsSEIYGqZV7e5POP/QjnuWib8tjNs1kl
 efMQ==
X-Gm-Message-State: AC+VfDy/LCIx2tTgWkhEfQcznzIyP087ehYs1IKuRPw1apKXkjTCmz4L
 8AU587ilgLv6Y26xFmnL6R6nUTDnBTtreSClzFhpVg==
X-Google-Smtp-Source: ACHHUZ6UD0q4lBsFYRt1iBzo8nMQl6CBXd1e25IrTyG7lfVFArPC+BBaQLENtHQYb5mOM3DJ18qcoESm5mZWq4y4/aI=
X-Received: by 2002:a67:f610:0:b0:43b:398c:b251 with SMTP id
 k16-20020a67f610000000b0043b398cb251mr6161345vso.5.1686643135653; Tue, 13 Jun
 2023 00:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-14-brgl@bgdev.pl>
 <20230612204042.litbbv23zdb3u5k7@halaney-x13s>
In-Reply-To: <20230612204042.litbbv23zdb3u5k7@halaney-x13s>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Jun 2023 09:58:44 +0200
Message-ID: <CAMRc=MeFnbcpjxNb537t0nb8Gd4ZsGVWZn2j+yHusWjmQQge4w@mail.gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 13/26] net: stmmac: dwmac-qcom-ethqos:
 make the rgmii clock optional
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTA6NDDigK9QTSBBbmRyZXcgSGFsYW5leSA8YWhhbGFu
ZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxMiwgMjAyMyBhdCAxMToyMzo0
MkFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IE9uIHNh
ODc3NXAgdGhlcmUncyBubyBSR01JSSBjbG9jayBzbyBtYWtlIGl0IG9wdGlvbmFsIGluIHRoZSBk
cml2ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYyB8IDIgKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3Mu
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMKPiA+IGluZGV4IDM0MzhiNjIyOTM1MS4uMjUyZGNhNDAwMDcxIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+
ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1l
dGhxb3MuYwo+ID4gQEAgLTY2Myw3ICs2NjMsNyBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPnJnbWlp
X2NvbmZpZ19sb29wYmFja19lbiA9IGRhdGEtPnJnbWlpX2NvbmZpZ19sb29wYmFja19lbjsKPiA+
ICAgICAgIGV0aHFvcy0+aGFzX2VtYWMzID0gZGF0YS0+aGFzX2VtYWMzOwo+ID4KPiA+IC0gICAg
IGV0aHFvcy0+cmdtaWlfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInJnbWlpIik7Cj4gPiArICAg
ICBldGhxb3MtPnJnbWlpX2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25hbChkZXYsICJyZ21paSIp
Owo+Cj4gVGhpcyBtYWtlcyBpdCBvcHRpb25hbCBmb3Igb2xkZXIgcGxhdGZvcm1zIHRvbywgYnV0
IGFzIGZhciBhcyBJIGtub3cgb24KPiB0aG9zZSBwbGF0Zm9ybXMgaXQgaXMgbWFuZGF0b3J5Lgo+
Cj4gVGhpcyBjYW4gYmUgZW5mb3JjZWQgaW4gZHQtYmluZGluZyBjaGVja3MsIGJ1dCBzaG91bGQg
d2UgYWxzbyBlbmZvcmNlCj4gdGhhdCBpbiB0aGUgZHJpdmVyIHN0aWxsPyBIb25lc3RseSBJIGZl
ZWwgbGlrZSB5ZXMsIGJ1dCB0aGVyZSdzIHByb2JhYmx5Cj4gc29tZSBwcmVjZWRlbnQgbWFpbnRh
aW5lcnMgZm9sbG93IG9uIHRoaXMgZnJvbnQgdGhhdCBJIGRvbid0IGtub3cgb2YuCj4KCldoaWxl
IG15IGd1dCBmZWVsaW5nIGlzIHRoYXQgZW5mb3JjaW5nIHRoZSBjbG9jayBsaXN0IG9uIHRoZSBE
VApiaW5kaW5nIGxldmVyIGlzIGVub3VnaCwgd2UgY2FuIGFsc28gZG8gYSBkaWZmZXJlbnQgdGhp
bmc6IHJlbmFtZSB0aGUKY2xvY2sgZnJvbSByZ21paV9jbGsgdG8gbGlua19jbGsgb3Igc29tZXRo
aW5nIHNpbWlsYXIgYW5kIGp1c3QKZGV0ZXJtaW5lIHRoZSBuYW1lIGJhc2VkIG9uIHRoZSBIVyB2
YXJpYW50ICgicmdtaWkiIG9yICJwaHlhdXgiKS4gT3IKZXZlbiBnZXQgdGhlIGNsb2NrIGJ5IGl0
cyBpbmRleD8gdGhpcyB3YXkgd2UgY291bGQgZm9sZCB0aGUgbmV4dCBwYXRjaAppbiB0aGUgc2Vy
aWVzIGludG8gdGhpcyBvbmUgYW5kIHNpbXBsaWZ5IHRoZSBjb2RlLgoKQmFydAoKPgo+ID4gICAg
ICAgaWYgKElTX0VSUihldGhxb3MtPnJnbWlpX2NsaykpIHsKPiA+ICAgICAgICAgICAgICAgcmV0
ID0gUFRSX0VSUihldGhxb3MtPnJnbWlpX2Nsayk7Cj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0
X2NvbmZpZ19kdDsKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
