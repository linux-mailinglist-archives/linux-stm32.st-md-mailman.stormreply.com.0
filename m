Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52645AAD920
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 09:55:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2545C78F9F;
	Wed,  7 May 2025 07:55:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BA17CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 07:55:28 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso7047370f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746604528; x=1747209328;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
 b=ZVtfBsv3aOgX2HKhqpdQU9eLlPS2p6T5Lnv1tpPRznjKIOOwLJsnBz5FrMVvaFohgA
 VSPNiZvJLxYP/yQj0klqx+UH8Xhp279Rhii7bQMLcLH/drTc8Q8YFi+rnPMf+XBHmcc3
 7+BysPgkgHiN2Ja//BvV3iGWbUug/SCoiBfuRd2SaYuDhhB1COnx/4oqNCg98hXENd69
 9SnDwEyniBFVT2Gzw1DYpXpbpOwQxRAXQTx6M79UuufRLrU9snREtT9N8Z84vuAV3nX6
 P/+s7wpqvzGRxCtN3I9pxFb46zFZDVU9IHl520r6AkOl/CpL3PJIfInLkaxrk535rh48
 dL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746604528; x=1747209328;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBL3qIVf81e3PhkRqu3EdoePuATSbIziAx1f5bGu5+Q=;
 b=p3LxmOpNzi3ClTSEAIornXYAYKaA0ZogrY614GhrkA/xi+cJpTvB2rTLfezBAMW5U+
 MMJF2C6l32t4SlUXb6Ljrcdf1K3e6MecxAS/d4yu+/0yZlPG49VgCvzVTqP2P3rqOtIB
 lrUww+iBDMqt+LrFpkK5xnrmZ3fC6MVAqLQeoQBqzRKvdH8a8OVaz23K3RxXpdTOMLNt
 BrwNWZ+voORf+HKqiyzmst3b356JlxgIdDt8Yktm1giYXGI7m7AhyoNxu9kbK9FVjHtr
 Fme5JQRhEeqzKakaIIamXOiuV0DeoxLKXQ6FlX3Fr/hnUJALjTr3pN4VPLxIFL0w3j9b
 F4/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrQiLK88mSju8NnTGR0CBNIftL1I0S9qG07s2moHHHhb7fPd6dvHvJHdx76CVfqAuUcNSrMkzNf53Jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRlNSvnG/QQvcRJzNlJ8RA5lqgOdQ6mAN+2Sy9Fw4dvtRUKZPo
 nrIaxDdM+flPufI6AcaYnhCMmUZkIcYR/jecWFNyBR/qLxIQH92EwCh3Ajx4/yc=
X-Gm-Gg: ASbGncukM95BgoDnyEvvNPD8PUul3TsEJoqBeWwTryR7XpHRrvA1dTV2Jk7ExbOP8sV
 YG78pM6TWAMjneah9aakUXtrhfKONNMzDCdiblIIIgUxdfdgcNU9khvOSkN2s0jzFpd81d1X6kd
 txXwfPrpe1ZN9UNQ1itBALGxRFzANYwUiONRGSACnwps4jzB+qwKJnuZQQeOp9tzjO0SVfrtT0z
 nApAuIrKiQD0YR0d80kFoJO3zsVqspfWXXILyg2iTLuj3ZklvC1gUcrAMlFo58NKZGtsKqU6pN5
 s/+7tCxcfji3bBd4Y6O9sXuVSwlw3QeH4cNKqzoqm9XNOBhwaWaTuB4YFLWHQ+WBxd/gKV9uzhY
 ZBBI=
X-Google-Smtp-Source: AGHT+IHSub+w3i180SBYtmH4xnfpAxz/7R8NINsxJdekQwKRKRmtdqdbqRAvzeMDt6WyEG1Omh+Khw==
X-Received: by 2002:a5d:47c7:0:b0:3a0:a3f3:5034 with SMTP id
 ffacd0b85a97d-3a0b49d26bemr2060932f8f.34.1746604527781; 
 Wed, 07 May 2025 00:55:27 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0ad54f105sm4491875f8f.85.2025.05.07.00.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 00:55:27 -0700 (PDT)
Date: Wed, 7 May 2025 09:55:25 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <aBsR7W15mPQiTjCc@mai.linaro.org>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429125133.1574167-4-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 lee@kernel.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 3/7] clocksource: stm32-lptimer: add
 support for stm32mp25
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMDI6NTE6MjlQTSArMDIwMCwgRmFicmljZSBHYXNuaWVy
IHdyb3RlOgo+IE9uIHN0bTMybXAyNSwgRElFUiAoZm9ybWVyIElFUikgbXVzdCBvbmx5IGJlIG1v
ZGlmaWVkIHdoZW4gdGhlIGxwdGltZXIKPiBpcyBlbmFibGVkLiBPbiBlYXJsaWVyIFNvQ3MsIGl0
IG11c3QgYmUgb25seSBiZSBtb2RpZmllZCB3aGVuIGl0IGlzCj4gZGlzYWJsZWQuIFRoZXJlJ3Mg
YWxzbyBhIG5ldyBESUVST0sgZmxhZywgdG8gZW5zdXJlIHJlZ2lzdGVyIGFjY2Vzcwo+IGhhcyBj
b21wbGV0ZWQuCj4gQWRkIGEgbmV3ICJzZXRfZXZ0IiByb3V0aW5lIHRvIGJlIHVzZWQgb24gc3Rt
MzJtcDI1LCBjYWxsZWQgZGVwZW5kaW5nCj4gb24gdGhlIHZlcnNpb24gcmVnaXN0ZXIsIHJlYWQg
YnkgdGhlIE1GRCBjb3JlIChMUFRJTV9WRVJSKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+IC0tLQo+IENo
YW5nZXMgaW4gVjY6Cj4gLSBGaXhlZCB3YXJuaW5nIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJv
Ym90IGluCj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwNDI2
MTQ1Ni5hQ0FUQm9ZTi1sa3BAaW50ZWwuY29tLwo+ICAgdXNlIEZJRUxEX0dFVCgpIG1hY3JvCj4g
Q2hhbmdlcyBpbiBWNToKPiAtIEFkZGVkIGEgZGVsYXkgYWZ0ZXIgdGltZXIgZW5hYmxlLCBpdCBu
ZWVkcyB0d28gY2xvY2sgY3ljbGVzLgo+IENoYW5nZXMgaW4gVjQ6Cj4gLSBEYW5pZWwgc3VnZ2Vz
dHMgdG8gZW5jYXBzdWxhdGUgSUVSIHdyaXRlIGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbgo+ICAg
dGhhdCBtYW5hZ2VzIHRoZSBlbmFibGluZy9kaXNhYmxpbmcgb2YgdGhlIExQIHRpbWVyLiBJbiBh
ZGRpdGlvbiwKPiAgIERJRVJPSyBhbmQgQVJST0sgZmxhZ3MgY2hlY2tzIGhhdmUgYmVlbiBhZGRl
ZC4gU28gYWRvcHQgYSBuZXcgcm91dGluZQo+ICAgdG8gc2V0IHRoZSBldmVudCBpbnRvIEFSUiBy
ZWdpc3RlciBhbmQgZW5hYmxlIHRoZSBpbnRlcnJ1cHQuCj4gQ2hhbmdlcyBpbiBWMjoKPiAtIHJl
bHkgb24gZmFsbGJhY2sgY29tcGF0aWJsZSBhcyBubyBzcGVjaWZpYyAuZGF0YSBpcyBhc3NvY2lh
dGVkIHRvIHRoZQo+ICAgZHJpdmVyLiBVc2UgdmVyc2lvbiBkYXRhIGZyb20gTUZEIGNvcmUuCj4g
LSBBZGRlZCBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVyIGFjY2VzcyB1cGRhdGUgaW4gKG1pc3Nl
ZCBpbiBWMSkKPiAtLS0KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9A
bGluYXJvLm9yZz4KLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
