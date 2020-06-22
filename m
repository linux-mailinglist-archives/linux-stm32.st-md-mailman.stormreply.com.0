Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C62034CF
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2020 12:30:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB94C36B0C;
	Mon, 22 Jun 2020 10:30:22 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60F61C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 10:30:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so16091693wrs.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
 b=hyTPcZ3p/Vj6NBYTZuHMAibM2O4uw5XyIDy98N/mJFvWAkzmlmsgkmIdoUWbpc0r7k
 98uhYZM80THFf+l8shd3BDY8336XLBaz70LV/2bAqqu305gf8YTAYYdWus/Y+V0+47iu
 Rr0HhXfrQyZGE13X5i5Vz+p3VGGkd4eDwsfkgKGa1dnHotEE8Fqp/ZVTKsKQeY2V4iG0
 xi9713viZTF66cHzHcR8S6hrTHw99znvETu7lqsDPBE37UYcZJ0JmPSdcKPUUSHZlV4x
 ZE2v+946/9xzxcKSOfXLVBxbi/C+rNRFDVDrcILhe0MTGy+7VPon/dfW+RTZ9tkVS8G+
 TsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
 b=RZLR4f83LXZxBw0gg1x8QZqN1dzmPsUSUQOtEF+JhYK3BsQEmkNODAEYUcuuC3RO2D
 iOMYEG0PAPpmKJjuLrjLdh1SgZrCm8dGLrb+U03Dk1RNQ5kXHDNEskbSUl9PbxVRt1mT
 kGixwt3fs2JcxSR03tRRcf0bIgHSySsbXiRe4blB/bR+tUKzCebnIPMtZE6Bed0wPfOH
 38eM6e8bTPWrrIiFX4gCMz5Q8XGFiGQUZWQlA6Fe/pDPNroBCu8yuVuh7/OVnNTUkzjf
 QKPRS/5aO2SbpMTFDLHvaiFmjbwtMLPuSWp5qA7p06PBd2IfZ985IuAHDFT0g8igMViB
 MbLg==
X-Gm-Message-State: AOAM530n6/eNst8lPtG/fKmcKvnjb1eK0H96h7X6LFvextG2l5kqDwJ6
 VllofXjld2RiiP80KRCYEPUB3g==
X-Google-Smtp-Source: ABdhPJzbZyR4CNtd9Ju/EbDUWI2mZigkJb8SK98Z/hYKtkT3onVWzAgyoX8RGlVwB7JFNUi69uXTIQ==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr17702175wrq.140.1592821819859; 
 Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Received: from dell ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id d9sm17210004wre.28.2020.06.22.03.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:30:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200622103017.GS954398@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
Cc: mark.rutland@arm.co, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
 bindings to json-schema
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

T24gVGh1LCAyMCBGZWIgMjAyMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cgo+IENvbnZlcnQg
c3RtZnggYmluZGluZ3MgdG8ganNvbi1zY2hlbWEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1p
biBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtZngueWFtbCAgICAgICAgICB8IDEyNCArKysrKysrKysr
KysrKysrKysrKysKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1m
eC50eHQgICAgfCAgMjggLS0tLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9w
aW5jdHJsLXN0bWZ4LnR4dCAgfCAxMTYgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNo
YW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCAxNDQgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bWZ4Lnlh
bWwKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvc3RtZngudHh0Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0bWZ4LnR4dAoKQXBwbGllZCwgdGhhbmtz
LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
