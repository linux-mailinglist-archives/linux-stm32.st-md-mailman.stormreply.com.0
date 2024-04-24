Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE78B0165
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 07:58:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 710FFC6DD6D;
	Wed, 24 Apr 2024 05:58:21 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D49C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 05:58:19 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-439b1c72676so218451cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 22:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713938298; x=1714543098;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/W5HSMGzNKRFvroL7XEIB583TE1U/at3BEuUXdJmYE=;
 b=4yc1OKNLAip9cVHb197z2QtJhdg/tSNcvhSmL7vapJT1wYGyHMKJg1YqNV2vGmVWFP
 TogZ3ZwCkUEsRsyHFeBOruk0HnVrus22GLfXWaPfw/BcONTIViMi92e+VrPgvGWMuont
 BV170ON7xaIih064Q1ttPgLIxGwiWOswaV+Xh0/vkvRHGboQToSzsvXqFHqkXbWgEitn
 WsO3POnYmOemaJR1NvI5dooQEmw5GRF+ND+HXdbCZgHCd727p4MOTolxePf+k6gbA7jq
 f/ynekGMSViRM8HVBMvUvmcIu2QZ9b++48C951io1zRtFW8uXEcpkfR7RQFp0GeQwRJm
 V70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713938298; x=1714543098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/W5HSMGzNKRFvroL7XEIB583TE1U/at3BEuUXdJmYE=;
 b=iHvA6eVLuVaVl+ioYXLJ2D6vNN2E7i+nW4XCzmZToldj8vGfIKMt3vlwjCrdrmR2bP
 sOK/XS+hc8AJaKnCuAiNbJf4zqZrvcfY7Sx1Hd9LE3usOnwEjUuG3iptQUgwZoW1Co3F
 k4yVVqNq2Mr2n/BZITnnEZG9HWwVnKvSjEatwvQRDZJ5fsqxcas81L0nilDxBD4BsE9r
 yxwConh449Yl9bX0e3Rewe1xSwymLk+FsWKXk2rtP6gMmcg6tS/0rld1Zad76ZD7JDGA
 SSgEDNsq9TwAHWlgMCw+7TlqCjarYGXc05lhqohnXL7d540s+1ohv5p3Lm6R/U0vk8UC
 ZeXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOJ723y/GY5imSJw8cBnexCpiW6ohrurqNQAOMl5nygznErU2nrWchg4wY26+itlk23vpkfXCQrs2broZyeoZOLUxwVsTKIzgHY/uXoYK8eGwnnaMOqaQl
X-Gm-Message-State: AOJu0Ywyz73PD0aE4BfmM7JfXhS3V6NLhEWI3SWOwjpU0hvOnXaNB++K
 MUq4FRncntaB9J6XToll/CHRvsZZSGf/ioNq6MwCoJ7MzZSyscgQHY6Y11sr6jx/xhxr995Uvbc
 sJVXq+uC8T4HKgSWNXVVw+MBlaUAs3Kns1yGy
X-Google-Smtp-Source: AGHT+IFtH+TdYnY/R2NkKd7EY8OhaQPa4uA2hOiV9IhRrDt+9zqEvKh32061ELbCkTI4QNocIDZCt4lHutO/oQbF8iw=
X-Received: by 2002:ac8:6e81:0:b0:437:c89e:245b with SMTP id
 c1-20020ac86e81000000b00437c89e245bmr130751qtv.15.1713938297863; Tue, 23 Apr
 2024 22:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-7-gatien.chevallier@foss.st.com>
In-Reply-To: <20240105130404.301172-7-gatien.chevallier@foss.st.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 23 Apr 2024 22:57:40 -0700
Message-ID: <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, Rob Herring <robh@kernel.org>, lars@metafoo.de,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 wg@grandegger.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, andi.shyti@kernel.org, alsa-devel@alsa-project.org,
 richardcochran@gmail.com, robh+dt@kernel.org, mkl@pengutronix.de,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, rcsekar@samsung.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 06/13] of: property: fw_devlink: Add
	support for "access-controller"
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

T24gRnJpLCBKYW4gNSwgMjAyNCBhdCA1OjAz4oCvQU0gR2F0aWVuIENoZXZhbGxpZXIKPGdhdGll
bi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEFsbG93cyB0cmFja2luZyBkZXBl
bmRlbmNpZXMgYmV0d2VlbiBkZXZpY2VzIGFuZCB0aGVpciBhY2Nlc3MKPiBjb250cm9sbGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZv
c3Muc3QuY29tPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKUGxl
YXNlIGNjIG1lIG9uIGZ3X2RldmxpbmsgcGF0Y2hlcy4gQWxzbywgdGhpcyBwYXRjaCBpcyBicmVh
a2luZyB0aGUKbm9ybSBiZWxvdy4gUGxlYXNlIHNlbmQgYSBmaXggdXAgcGF0Y2guCgo+IC0tLQo+
IENoYW5nZXMgaW4gVjk6Cj4gICAgICAgICAtIEFkZGVkIFJvYidzIHJldmlldyB0YWcKPgo+IENo
YW5nZXMgaW4gVjY6Cj4gICAgICAgICAtIFJlbmFtZWQgYWNjZXNzLWNvbnRyb2xsZXIgdG8gYWNj
ZXNzLWNvbnRyb2xsZXJzCj4KPiBDaGFuZ2VzIGluIFY1Ogo+ICAgICAgICAgLSBSZW5hbWUgZmVh
dHVyZS1kb21haW4qIHRvIGFjY2Vzcy1jb250cm9sKgo+Cj4gUGF0Y2ggbm90IHByZXNlbnQgaW4g
VjEKPgo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMgYi9k
cml2ZXJzL29mL3Byb3BlcnR5LmMKPiBpbmRleCBhZmRhZWZiZDAzZjYuLjdmNzM3ZWFjOTFiMiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiArKysgYi9kcml2ZXJzL29mL3By
b3BlcnR5LmMKPiBAQCAtMTI2OCw2ICsxMjY4LDcgQEAgREVGSU5FX1NJTVBMRV9QUk9QKGxlZHMs
ICJsZWRzIiwgTlVMTCkKPiAgREVGSU5FX1NJTVBMRV9QUk9QKGJhY2tsaWdodCwgImJhY2tsaWdo
dCIsIE5VTEwpCj4gIERFRklORV9TSU1QTEVfUFJPUChwYW5lbCwgInBhbmVsIiwgTlVMTCkKPiAg
REVGSU5FX1NJTVBMRV9QUk9QKG1zaV9wYXJlbnQsICJtc2ktcGFyZW50IiwgIiNtc2ktY2VsbHMi
KQo+ICtERUZJTkVfU0lNUExFX1BST1AoYWNjZXNzX2NvbnRyb2xsZXJzLCAiYWNjZXNzLWNvbnRy
b2xsZXJzIiwgIiNhY2Nlc3MtY29udHJvbGxlci1jZWxscyIpCj4gIERFRklORV9TVUZGSVhfUFJP
UChyZWd1bGF0b3JzLCAiLXN1cHBseSIsIE5VTEwpCj4gIERFRklORV9TVUZGSVhfUFJPUChncGlv
LCAiLWdwaW8iLCAiI2dwaW8tY2VsbHMiKQo+Cj4gQEAgLTEzNjMsNiArMTM2NCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3VwcGxpZXJfYmluZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGluZ3NbXSA9
IHsKPiAgICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9yZWd1bGF0b3JzLCB9LAo+ICAgICAg
ICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW8sIH0sCj4gICAgICAgICB7IC5wYXJzZV9wcm9w
ID0gcGFyc2VfZ3Bpb3MsIH0sCj4gKyAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfYWNjZXNz
X2NvbnRyb2xsZXJzLCB9LAoKQWxsIHRoZSBzaW1wbGUgcHJvcGVydGllcyBhcmUgbGlzdGVkIGJl
Zm9yZSB0aGUgc3VmZml4IG9uZXMgYXMgdGhlCnN1ZmZpeCBjaGVja3MgYXJlIG1vcmUgZXhwZW5z
aXZlLiBTbywgeW91IHNob3VsZCBoYXZlIGluc2VydGVkIHRoaXMKcmlnaHQgYmVmb3JlIHRoZSBz
dWZmaXggcHJvcGVydGllcy4gQWxzbywgdGhlcmUncyBhIG1lcmdlIGNvbmZsaWN0IGluCmxpbnV4
LW5leHQuIFNvIG1ha2Ugc3VyZSB5b3UgdGFrZSB0aGF0IGludG8gYWNjb3VudCB3aGVuIHNlbmRp
bmcgdGhlCmZpeCB1cCBhbmQgcGlja2luZyB0aGUgb3JkZXIuCgotU2FyYXZhbmEKCj4gICAgICAg
ICB7fQo+ICB9OwoKPgo+IC0tCj4gMi4zNS4zCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
