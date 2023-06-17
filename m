Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719F73434B
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jun 2023 21:24:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3FB6C6A610;
	Sat, 17 Jun 2023 19:24:27 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09001C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 19:24:26 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-78f32e233a0so682098241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687029866; x=1689621866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAVqTNFm1Ko/hSDeJVRLXQ4E4KG1rIEAdrc8bWfuH9M=;
 b=lVG2S5Xx6tFg0dg4z6KHuNJpv5zw9bfbJORZYuLnU4hzhlKRIQMYa9+jW4VwKMjoaO
 qVXcYgejWNww7bCA45NVLUicUCOag7vOWx4axAvC3r0pbruDxES/YNnjXI+QwZwW1mTv
 SyH7G8xa0wD/g0OuGWAkTmKwifbZPSjh5IRffYshgeUS6lM7tjjCo3SAYf8O+aYKxVvL
 VWyQ4j75TLZdCGdAUClkkdPqJkoHzx5InuSk/W/qrJa5VCwGhmGMI9uxpmnqryyjnbMr
 +v2lv4iKCLbN3Y/76bFeU+uf6QlEzv4E0yMkRS1fPH3BRxvk/4aWxSrJrRQQHYBoHFmX
 cQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687029866; x=1689621866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAVqTNFm1Ko/hSDeJVRLXQ4E4KG1rIEAdrc8bWfuH9M=;
 b=JLN9gylEQdBoP0ByfzXuVxsfdEmXa7zdIjKTpQv/YfyCzo6QkB7M6v4RyyaNaE4OCr
 EoSXnXLN8pdMBw7K1w9W5XVmO6A4LA+ECT0rCGpU3cQYhngk0g5eXY5GHJmMR6UVcfa0
 olQnn/7LaXfNIBEHbExXG2N/moYM5hY81yJAgfBnCTtmDt9uHReVh/7t0h0S3FTUiyfI
 8CIYlTGZjG/3eq1FutMb/8qKyhWvsVhr9o/HIQbid6ExVPgdNbqCtVBYZ7wn45zFIT+e
 WO2UrdKRMkRl6/QvGCyK50XfdrRgJHNveplcdwTjh2VYTozhDyJRh1pGUBjIvnBkhmd8
 2Z+A==
X-Gm-Message-State: AC+VfDyQYSa5EXBotwoa1nR8ISfLQUPzKbjPn6DE5wX8SSQYDZ9Wm4Sk
 jto6GQzTmhj8QNe7QYP9COGNch8aPNdWFT/QQNf/bA==
X-Google-Smtp-Source: ACHHUZ6T2y5qSbWChreVWtXuHv0D3Y2Yra3f3svS/wTGHSpGOvnjNQZNnXYhK2mtJC9tcD4ulS5TUIribjNZnkuC8nQ=
X-Received: by 2002:a67:fbd8:0:b0:43f:57c5:3eca with SMTP id
 o24-20020a67fbd8000000b0043f57c53ecamr824940vsr.35.1687029865896; Sat, 17 Jun
 2023 12:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230615121419.175862-1-brgl@bgdev.pl>
 <20230617001644.4e093326@kernel.org>
In-Reply-To: <20230617001644.4e093326@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Jun 2023 21:24:15 +0200
Message-ID: <CAMRc=Mcr=40aoXVcu2NDzz9C+GTPF-3WkyS=GEd-sQJTA9RftA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 00/23] arm64: qcom: sa8775p-ride:
 enable the first ethernet port
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

T24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgOToxNuKAr0FNIEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAxNSBKdW4gMjAyMyAxNDoxMzo1NiArMDIwMCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IFRoZXJlIGFyZSB0aHJlZSBl
dGhlcm5ldCBwb3J0cyBvbiBzYTg3NzVwLXJpZGUuIFRoaXMgc2VyaWVzIGNvbnRhaW5zIGNoYW5n
ZXMKPiA+IHJlcXVpcmVkIHRvIGVuYWJsZSBvbmUgb2YgdGhlIHR3byAxR2IgcG9ydHMgKHRoZSB0
aGlyZCBvbmUgaXMgMTBHYikuIFdlIG5lZWQKPiA+IHRvIGFkZCBhIG5ldyBkcml2ZXIgZm9yIHRo
ZSBpbnRlcm5hbCBTZXJEZXMgUEhZLCBpbnRyb2R1Y2Ugc2V2ZXJhbCBleHRlbnNpb25zCj4gPiB0
byB0aGUgTUFDIGRyaXZlciAod2hpbGUgYXQgaXQ6IHR3ZWFrIGNvZGluZyBzdHlsZSBhIGJpdCBl
dGMuKSBhbmQgZmluYWxseQo+ID4gYWRkIHRoZSByZWxldmFudCBEVCBub2Rlcy4KPgo+IERpZCBJ
IGFscmVhZHkgYXNrIHlvdSBob3cgZG8geW91IGVudmlzaW9uIHRoaXMgZ2V0dGluZyBtZXJnZWQ/
Cj4gWW91IGhhdmUgcGF0Y2hlcyBoZXJlIGZvciBhdCBsZWFzdCAzIGRpZmZlcmVudCB0cmVlcyBp
dCBzZWVtcy4KPiBDYW4geW91IHBvc3QgdGhlIHN0bW1hYyBkcml2ZXIgY2hhbmdlcyArIGJpbmRp
bmdzIGFzIGEgc2VwYXJhdGUgc2VyaWVzPwo+CgpTdXJlLCBub3cgdGhhdCBiaW5kaW5ncyBnb3Qg
cmV2aWV3ZWQsIEkgd2lsbCByZXNlbmQgdGhlIHBhdGNoZXMKc2VwYXJhdGVseS4gVGhlbSBnb2lu
ZyB0aHJvdWdoIGRpZmZlcmVudCB0cmVlcyB3b24ndCBicmVhayB0aGUgYnVpbGQuCgo+ID4gIGRy
aXZlcnMvcGh5L3F1YWxjb21tL3BoeS1xY29tLXNnbWlpLWV0aC5jICAgICB8IDQ1MSArKysrKysr
KysrKysrKysrKysKPgo+IE5vb2IgcXVlc3Rpb24gLSB3aGF0J3MgdGhlIGRpc3RpbmN0aW9uIGJl
dHdlZW4gZHJpdmVycy9waHkgYW5kCj4gZHJpdmVycy9uZXQvcGh5IChvciBhY3R1YWxseSBwZXJo
YXBzIGRyaXZlcnMvbmV0L3BjcyBpbiB0aGlzIGNhc2UpPwoKTm90IHN1cmUsIGJ1dCBpdCBzZWVt
cyB0aGF0IG1vc3QgZHJpdmVycyBpbiB0aGUgbGF0dGVyIGFyZSBNRElPIHdoaWxlCnRob3NlIGlu
IGRyaXZlcnMvcGh5IGFyZSBhbGwga2luZHMgb2YgUEhZcyAoVVNCLCBVRlMsIGV0Yy4pLgoKQmFy
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
