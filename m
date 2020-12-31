Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAC2E7EB7
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Dec 2020 09:33:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B6ACC57188;
	Thu, 31 Dec 2020 08:33:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB671C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 08:33:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a6so6822507wmc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Dec 2020 00:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
 b=iPGHGeVR19yf0873nrpSscXEgUi6czdITxFf9XPnoJ9ABQczW4ok8EEnowhMbWE+RU
 83H9Egp/wsOFoyI0KgnI6TUetGDp2RmqGYnfmjcSh8IhiYc/95wOBL3Ze+nAeK+YEmPU
 30BbdPtfxtt8XqILPZFB4+EzKqmZ8y6T2jSUDbll+sIk2xB71at0b4XQHvfZ9E4NMyoY
 1r9+Vu9dT1US1yuzq/3QCdSwye6xV+yiudh/tO4R1ebQ8XkHxsjfPg+eo/2NQK3j+ELL
 PceYAOI3RTem7iJrRtgKxtYJrkRRJ5OG2EOn/dByp+36RCL1pUkuUKVuRZKNc4nkkVJ5
 JtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7CZya83atebnWeu1yHEbLA0a58aDtjoVw0Tiqu5x01A=;
 b=s/0vI5+ipjelb583M7xMwdPBeb/4/Db4mUHQixEFRdktfUhkhwR6ySpLo4VnrXfLC4
 pCN+rxq19WwAx9cilLEU9KgJMPMP0Onkoq5gnA9Rw9qKreX94WfqwVKG7X6akpKY+u8y
 WL1H8tvswDFXq6iS7Q+CmXTpZK0/M8/i3KNqI1gTghPtlYRnbLY/h/Q7Gas21UMhpcqq
 VsNL41naiEL/nE14HqYk4qySxyWHau1eVoGWacMuh3ngNu0IebGAEVcjqLU/f+RyI+jy
 FTorItVdvl65iXXCxCXzSouwGrMiGucigYjCHgxGAkSHNqdlfhdNL16gwTjmJE8cXbxV
 7IwQ==
X-Gm-Message-State: AOAM531zX82j5tLpT35hzIEhHZbSZCaTQ4f7jlfBjUvUwyDw+bUXPg2j
 CveF0QuiWqUTyOWI0kP4KAfChw==
X-Google-Smtp-Source: ABdhPJxgVpv6k0MI/BzifwYgB548pcGt6oqlux6TtaOZNi7+9Ao4+rwMet8Sf7IpouJnC+LD4ubqhA==
X-Received: by 2002:a1c:b407:: with SMTP id d7mr11034773wmf.34.1609403601033; 
 Thu, 31 Dec 2020 00:33:21 -0800 (PST)
Received: from dell ([91.110.221.133])
 by smtp.gmail.com with ESMTPSA id z15sm71074287wrv.67.2020.12.31.00.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 00:33:20 -0800 (PST)
Date: Thu, 31 Dec 2020 08:33:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20201231083317.GB4413@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20201230185439.GC25903@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230185439.GC25903@duo.ucw.cz>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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

T24gV2VkLCAzMCBEZWMgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+IFRo
ZSBub2RlIG5hbWVzIGZvciBkZXZpY2VzIHVzaW5nIHRoZSBwd20tbGVkcyBkcml2ZXIgZm9sbG93
IGEgY2VydGFpbgo+ID4gbmFtaW5nIHNjaGVtZSAobm93KS4gIFBhcmVudCBub2RlIG5hbWUgaXMg
bm90IGVuZm9yY2VkLCBidXQgcmVjb21tZW5kZWQKPiA+IGJ5IERUIHByb2plY3QuCj4gPiAKPiA+
ICAgRFRDICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5l
eGFtcGxlLmR0LnlhbWwKPiA+ICAgQ0hFQ0sgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0LnlhbWwKPiA+IC9ob21lL2FsZXgvYnVpbGQvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5k
dC55YW1sOiBwd21sZWRzOiAncGFuZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhl
czogJ15sZWQoLVswLTlhLWZdKyk/JCcsICdwaW5jdHJsLVswLTldKycKPiA+ICAgICAgICAgRnJv
bSBzY2hlbWE6IC9ob21lL2FsZXgvc3JjL2xpbnV4L2xlZHMvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1wd20ueWFtbAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5kZT4KPiA+IEFja2VkLWJ5OiBKZWZmIExhQnVu
ZHkgPGplZmZAbGFidW5keS5jb20+Cj4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiAKPiBUaGFua3MsIGFwcGxpZWQuCgpTb3JyeSwgd2hhdD8KCkFwcGxpZWQgdG8g
d2hhdCB0cmVlPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
