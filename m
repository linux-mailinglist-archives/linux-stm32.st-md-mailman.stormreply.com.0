Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CB0732034
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 20:51:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22275C6A60E;
	Thu, 15 Jun 2023 18:51:57 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9514AC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 18:51:56 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bc4651e3838so2093152276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686855115; x=1689447115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oys6po3xV1zflUTK5Q7rHSTxvD+daqTUwms8w9Gkeig=;
 b=TZhkEOVM+6kSP3s5XIj7Ew/F2o0nsoTRE4JNLY0qV8p3htIK+2Ja/WTZsyu+9D9+xV
 R194akxrpQUzn/5KomHtspD+WL7yzirv7m6CrYCpfgMLyk1xYpMjgMt5Rp6VBh+TyEnT
 WFBCKtzWarwwuRgVdhyYdDRR7RFF8M7JOEWsNRLullUntoYJ0xVVsB9eUIilmnpS6PD3
 RZTOxzGP2mmiqCEtKkhYfdT5EVK5/2l0huHhyAnCS47j2BWUUKFzoAfZ7P/B9yiW+oda
 IYwLwOrYuiih0pZqKFC5OudEhmMh+ceJtpvU7nt0RcFWkiHWS/zuzjmvNwouOojEdFAM
 NJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686855115; x=1689447115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oys6po3xV1zflUTK5Q7rHSTxvD+daqTUwms8w9Gkeig=;
 b=IKRwu5YyW8253Gcm8wfh6sOql7doH+m1vuWoXmV61sGgsXssSE+nnC3+CPdLC2xeNV
 YenREpOAhnWXycmZoyWgZcHHyRru+AQ1Vnzd4uMT8opb1NLM0nJIc07u8at8XXkbc+dP
 pIfX4U4bRSAZKf6N4dCJcjNO0FCLmc09Eso8xZ4D6qSlc+pheeJFx4fXdt1xIj6wSXy+
 0/lm0naWuPbCvFAE3NB0pHsZu98UEtw1tcRTRlPkzqtAQolhIP7dr+fsTdXh8osp9QL3
 qXLz93F1xYijMawnV0C6H/LCm0zkHVYhju6lL+vQ8fmRA4H8o6hbclaReYfEqj3+l1yY
 JJIQ==
X-Gm-Message-State: AC+VfDxBdlZIgut1t1YbIDoPlo9gy0tvZMWj6AfHe6V5dKlDEdM4aS8C
 nsuXWGNCA2IPMCCwfpB3ddEakHP+3bDEcAWeVrKaDQ==
X-Google-Smtp-Source: ACHHUZ5MGUqqRHv95slcbK18Ur8RugPXouW0J3O984wR6h8VWSwkh4mWLExlNWIjg1eG8cz9Gob1bzBzu5dXlscM0yI=
X-Received: by 2002:a25:424b:0:b0:ba8:972d:e37e with SMTP id
 p72-20020a25424b000000b00ba8972de37emr5179293yba.14.1686855114258; Thu, 15
 Jun 2023 11:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
 <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
 <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
 <266de9f5-826a-c1bf-be8d-11f5e27c87dc@foss.st.com>
In-Reply-To: <266de9f5-826a-c1bf-be8d-11f5e27c87dc@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jun 2023 20:51:42 +0200
Message-ID: <CACRpkdZLtCwPQsPw_Lp3Ppw2ed6gOo+-82_y2WPVJ_oZUHbLoQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
	stm32mp25-sdmmc2 compatible
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgNToxOeKAr1BNIFlhbm4gR2F1dGllciA8eWFubi5nYXV0
aWVyQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogRW50cnkg
Zm9yIFNUTWljcm9lbGVjdHJvbmljcyB2YXJpYW50IG9mIFBMMTh4Lgo+ID4gICAgICAgICAgICBU
aGlzIGRlZGljYXRlZCBjb21wYXRpYmxlIGlzIHVzZWQgYnkgYm9vdGxvYWRlcnMuCiguLi4pCj4g
PiAgICAgICAgLSBkZXNjcmlwdGlvbjogRW50cnkgZm9yIFNUTWljcm9lbGVjdHJvbmljcyB2YXJp
YW50IG9mIFBMMTh4IGZvcgo+ID4gICAgICAgICAgICBTVE0zMk1QMjUuIFRoaXMgZGVkaWNhdGVk
IGNvbXBhdGlibGUgaXMgdXNlZCBieSBib290bG9hZGVycy4KKC4uLikKPiA+IFNob3VsZCBJIHJl
bW92ZSAob3IgYWRhcHQpIGJvdGggZGVzY3JpcHRpb25zPwo+ID4KPiA+Cj4KPiBBdCB0aGUgdGlt
ZSB0aGUgcGF0Y2ggd2FzIGRvbmUgaXQgd2FzIHJlYWxseSBqdXN0IHVzZWQgYnkgYm9vdGxvYWRl
cnMuCj4gQnV0IGFzIGl0IGlzIG5vdyB1c2VkIGluIHRoZSBkcml2ZXIgZm9yIGRlbGF5IGJsb2Nr
LCBJIHNob3VsZCByZW1vdmUgdGhlCj4gc2Vjb25kIHNlbnRlbmNlLgoKUmVtb3ZlIGJvdGguCgpB
ZnRlciAiVGhpcyBkZWRpY2F0ZWQgY29tcGF0aWJsZSBpcyB1c2VkIGJ5IGJvb3Rsb2FkZXJzIiB0
aGVyZSBpcwphbiBpbXBsaWNpdCAiaW4gdGhlIFNESyBwcm92aWRlZCBieSBTVCBNaWNyb2VsZWN0
cm9uaWNzIiwgYW5kIHRoYXQKaXMgb2Ygbm8gY29uY2VybiBmb3IgRFQgYmluZGluZ3MsIHdoaWNo
IGFyZSAod2VsbCwgaW4gdGhlb3J5KSB1c2VkIGJ5CmUuZy4gQlNEIG9yIG90aGVyIG9wZXJhdGlu
ZyBzeXN0ZW1zIGFuZCB3aG8ga25vd3Mgd2hhdCB0aGV5IHdpbGwKdXNlIGFuZCBub3QsIHdlIGRv
bid0IHB1dCBMaW51eCBzcGVjaWZpY3MgaW4gdGhlcmUsIG5laXRoZXIgQm9vdApsb2FkZXIgc3Bl
Y2lmaWNzIG5vciBTVCBTREsgc3BlY2lmaWNzLgoKQXQgbGVhc3QgdGhhdCBpcyB0aGUgbGl0dGxl
IGJ1cmVhdWNyYXRpYyBhbWJpdGlvbiB3ZSBoYXZlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
