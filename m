Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C857DBB0
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 10:02:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F400DC04005;
	Fri, 22 Jul 2022 08:02:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 746D1C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 08:02:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h9so5462958wrm.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bvEexGq32Q2q4yLSZgYal6lzMRVPSRDwzzKaxMf771o=;
 b=evku2628x8f7AayzAAE1I5iATAY92Nv0ST8sh2IwQ63jYO3pXS+81O5kKMh8cHWdg0
 fEOkQP44gh9YLaDgU6h5fw/TpHvTGXIzsMK0BxkOSokAGiT68uJq0o96IoR2t5yzmWBC
 VONUbj8m7D9BYNUlm3vlO2DdcFlELpkCnzGMPiEONQNVbHIXhqcwWp1+3duanEX8gJ6h
 8jvXFXifWx+fyevCpsJfdidOmZW23cDFW7y1rYjc9Q2kscaK51y6ThurHiBUfZNLTU3E
 6EjzRr7ORduLoY/7B56rQC69Sqo+R8xspanSeOHAS5/6QEKNk7EmzzFvPaYKI6JpEX0Z
 11Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bvEexGq32Q2q4yLSZgYal6lzMRVPSRDwzzKaxMf771o=;
 b=qY/yl3oLazAKylSqnnAjS3vBVCRe0WOAzLsD5gSWbm94/EfII+hNJBiANUXLN+piCI
 H/D/rFAFoX4yPlZxsZDCv7G9TWlxMq4Xks1SIbEuluu+FULUQpgCDGvuRw5NSEs/hfEA
 C11S63L33R2lzhnnuNtuReKzhkmXlQokREQRFBXTfmXO+YRz7jmzUYRSOgiRSe4YSOA7
 nl61d7VXBbcksSJ6YhfuKShupLH4sEkJ39miO9PF6hS0adoFwHbFROhwqmLiZ2i0SFwP
 ystiq+k5NnscId03BNc9Ee/5qSISia8TlpjrXPa5GORb72Tp/pq9uDnkQwHmW0aPwWfo
 A4Lw==
X-Gm-Message-State: AJIora/bvYC6V40RWAPUy470X3bpjhdxABLVYk+tC3fJeLZH+KbJG+ON
 KlMER9qdUxpwAw5shPOGRFW+sA==
X-Google-Smtp-Source: AGRyM1v1LK4VrBLGMhVxuBKsl0VRF2RpAftCZFCp1jKEXOMgOZ9vuAekYBfklMuNr345fGlUFFQQHg==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id
 c16-20020adffb10000000b00207af881eb9mr1575350wrr.238.1658476970912; 
 Fri, 22 Jul 2022 01:02:50 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056000024900b0021d746d4820sm3868746wrz.37.2022.07.22.01.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:02:50 -0700 (PDT)
Date: Fri, 22 Jul 2022 09:02:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YtpZqNm7Cgzz9+ZC@google.com>
References: <20220706211934.567432-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706211934.567432-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32-timers: Move
 fixed string node names under 'properties'
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

T24gV2VkLCAwNiBKdWwgMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEZpeGVkIHN0cmluZyBu
b2RlIG5hbWVzIHNob3VsZCBiZSB1bmRlciAncHJvcGVydGllcycgcmF0aGVyIHRoYW4KPiAncGF0
dGVyblByb3BlcnRpZXMnLiBBZGRpdGlvbmFsbHksIHdpdGhvdXQgYmVnaW5uaW5nIGFuZCBlbmQg
b2YgbGluZQo+IGFuY2hvcnMsIGFueSBwcmVmaXggb3Igc3VmZml4IGlzIGFsbG93ZWQgb24gdGhl
IHNwZWNpZmllZCBub2RlIG5hbWUuCj4gCj4gTW92ZSB0aGUgc3RtMzIgdGltZXJzICdjb3VudGVy
JyBhbmQgJ3RpbWVyJyBub2RlcyB0byB0aGUgJ3Byb3BlcnRpZXMnCj4gc2VjdGlvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4v
YmluZGluZ3MvbWZkL3N0LHN0bTMyLWxwdGltZXIueWFtbCAgICAgICAgfCAyOCArKysrKysrKyst
LS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwgICAgICAg
ICB8IDIwICsrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAyNCBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
