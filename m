Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774411AB812
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 08:34:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39231C36B0C;
	Thu, 16 Apr 2020 06:34:34 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A1EAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 06:34:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b11so3430170wrs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0zaVLvpq9xyTb6tnL5lflzeTc3OD1xVdDRy9b/kylC4=;
 b=mFdfZi8VBTlwLtP0JTgvvick+7svv6vG9/rG7kqJVdsx7j4WTAwfHqs6HIWFQomHeJ
 QRxfjpa18BSA4VXbHmcIUmuDtse9X/hdmh/XQiyJ7jEfV081PEJ9tosvNZ+odwiT5hxG
 fAuY4M7K7YRoqM3JJSExPdZ/FXUazHY4EY9pPLCpFSHR47L1O64WI4C5aFBHEZ1Bbbzk
 VyRiPRQ9GjOSEu5CKBTWAW/RasKWbr1bdS4jRAqXs0BovImMBsKywoXudzx+lrdfJqOr
 c4YxSwYJ7+crMFX9rHyCdduz7Zz4FRn76B6VprKnWQ/mwxNDcnFGS+A3ZiWZ4x0P/8LK
 xXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0zaVLvpq9xyTb6tnL5lflzeTc3OD1xVdDRy9b/kylC4=;
 b=co3fVWm6oSw2b2F5pq8LuIkSMaqK8HvLCX6vU5QPR48Gw8ZB+RevIwjqL9ro5Hb8Dc
 +CMms+6F7gXSLVOgau8gqncrJ4PRsNX8wJ3b9LcIoQNgHtnHnL67ghfUm2YnA9m1Wigy
 tm+awU2gHRsIq3qp9OWpugvHK7e9gjF26vUSOLZNCDgGYq2++t+inb36HdgeDusIKpUI
 2WuYbxa6uiG9DNQ4mkhuZSHznKvigHAqMUBiYqLJpkTFvo1S0Xv7zlANr65zYrGDN2bA
 JM0Lx5pSveDjXEe1G6tbodYeS8o0CZqp3ETru00pEHcYNzIaNMPNjGGgUuYJlO2G3w2T
 0k9A==
X-Gm-Message-State: AGi0Pua2tDnDoO6jaarFUAqir3P12jGdv0dz5JuMxTvZyq7Sv0wNSoWn
 mNJ6TorlyGjzirxRadCqHcXh+w==
X-Google-Smtp-Source: APiQypJEpTtqeTr9o0OHWVCd4YNULVp1q0q9U2Soz/KtkpNaaDcqmR9MRis2lZmNki6Q0+MIaix0pA==
X-Received: by 2002:a5d:5392:: with SMTP id d18mr12081099wrv.278.1587018870349; 
 Wed, 15 Apr 2020 23:34:30 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id 5sm2419784wmg.34.2020.04.15.23.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 23:34:29 -0700 (PDT)
Date: Thu, 16 Apr 2020 07:35:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200416063519.GN2167633@dell>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401083909.18886-2-benjamin.gaignard@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 1/6] dt-bindings: mfd: Document STM32
 low power timer bindings
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

T24gV2VkLCAwMSBBcHIgMjAyMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cgo+IEFkZCBhIHN1
Ym5vZGUgdG8gU1RNIGxvdyBwb3dlciB0aW1lciBiaW5kaW5ncyB0byBzdXBwb3J0IHRpbWVyIGRy
aXZlcgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWln
bmFyZEBzdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gdmVyc2lvbiA2Ogo+IC0gb25seSB1c2Ugb25lIGludGVycnVwdAo+IAo+IHZlcnNp
b24gNToKPiAtIHRoZSBwcmV2aW91cyBoYXMgYmVlbiBhY2tlZC1ieSBSb2IgYnV0IHNpbmNlIEkg
aGF2ZSBkb2N1bW1lbnRlZAo+ICAgaW50ZXJydXB0cyBhbmQgaW50ZXJydXB0LW5hbWVzIHByb3Bl
cnRpZXMgSSBoYXZlbid0IGFwcGxpZWQgaXQgaGVyZS4KPiAKPiB2ZXJzaW9uIDQ6Cj4gLSBjaGFu
Z2UgY29tcGF0aWJsZSBhbmQgc3Vibm9kZSBuYW1lcwo+IC0gZG9jdW1lbnQgd2FrZXVwLXNvdXJj
ZSBwcm9wZXJ0eQo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0
aW1lci55YW1sICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKykKCkZvciBteSBvd24gcmVmZXJlbmNlOgogIEFja2VkLWZvci1NRkQt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
