Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429B165A4A
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2020 10:38:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3CDC36B0B;
	Thu, 20 Feb 2020 09:38:04 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F8AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 09:38:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b17so1251820wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 01:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=91hJOg6mkO0g2GWClGuxRVigkpNiaYP+nKzj4TFaDHY=;
 b=tDOc3ZzhHCw3tQK9vmGLOg1WdfVWzGtbuuzsRJx/BgZ4qvQJdyNACmmIvCTjmpCd09
 lNXL2rbbLhR8eksjg4eCL28QEjCo6L9SPVxihR/YS9Uv1M4Ck9Qs/PjF0aBCzYViwZ4c
 7lqectiY9wU/r7O0Fs7elIkRanR4z9ZLunF6xIZQwKiXgEItBDf36uZLH8iznutginQz
 5tfUIcBQjA1CyfsuZUTtMtf1ACtjYbdfqOaYsnWaePSPGU55A/4cCwLIZ65JSLjkEN1o
 epYoZq365UnpMLy8qi1aWvE5MRJEQ93Le+SZKsSKSa2Fu/BHxACCBir43JeMtHIpPt8A
 ED8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=91hJOg6mkO0g2GWClGuxRVigkpNiaYP+nKzj4TFaDHY=;
 b=bI2js1NKMAkqdaxzJMWr/KtY6B5PSr7GthSl2l2X16QsGT6B0iiFHNmh0k5BwJ/eL2
 TtINTJScxAmGIniX1lTURPtH+wht86lHXKcB7Wf/fwyp8feO+oQ3TKa3wzGKSTFZPDpZ
 XyQaVwUBqpvGbkx8tFcEsjqOcE2tpn4S1KSCoMV4Nb8L0Kre9VKfTtvuku5OsnulK6xH
 d7yQQeAmvfz/gL2MlbyD2QR6XoJ8W/fFK11tPG/etBiYag1NArsDeH2PN2KYgQMGnfwm
 1X8tnhE6WHF0MOFZ5h48iodRoUWdMcj8eg32BPIk9zs11tZ/im3/HEljmWA8SPNQj2oj
 UaIg==
X-Gm-Message-State: APjAAAUK8fycSQr9M6oFyHotnsyTjEsREjTYxdU67sdc2b2RSjMjkdWZ
 qeVSwLDD1C92ukn0b9bmEJREdg==
X-Google-Smtp-Source: APXvYqzoG3nBri3g1BPDtmvxxv+KOfrysBzEib4/n1Zp8hr2ySi6LK5uYqHVZcun9F260Utu4C6kIQ==
X-Received: by 2002:a1c:bdc6:: with SMTP id n189mr3482954wmf.102.1582191481981; 
 Thu, 20 Feb 2020 01:38:01 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:1d8d:74ba:7173:f47f?
 ([2a01:e34:ed2f:f020:1d8d:74ba:7173:f47f])
 by smtp.googlemail.com with ESMTPSA id q124sm3745544wme.2.2020.02.20.01.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 01:38:01 -0800 (PST)
To: Benjamin Gaignard <benjamin.gaignard@st.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, tglx@linutronix.de, fabrice.gasnier@st.com
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-3-benjamin.gaignard@st.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
Date: Thu, 20 Feb 2020 10:38:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217134546.14562-3-benjamin.gaignard@st.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/3] mfd: stm32: Add defines to be used
 for clkevent purpose
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

CkhpIExlZSwKCk9uIDE3LzAyLzIwMjAgMTQ6NDUsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOgo+
IEFkZCBkZWZpbmVzIHRvIGJlIGFibGUgdG8gZW5hYmxlL2NsZWFyIGlycSBhbmQgY29uZmlndXJl
IG9uZSBzaG90IG1vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJl
bmphbWluLmdhaWduYXJkQHN0LmNvbT4KCkFyZSB5b3UgZmluZSBpZiBJIHBpY2sgdGhpcyBwYXRj
aCB3aXRoIHRoZSBzZXJpZXM/Cgo+IC0tLQo+IHZlcnNpb24gNDoKPiAtIG1vdmUgZGVmaW5lcyBp
biBtZmQvc3RtMzItbHB0aW1lci5oCj4gCj4gIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLWxwdGlt
ZXIuaCB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi1scHRpbWVyLmggYi9pbmNsdWRlL2xp
bnV4L21mZC9zdG0zMi1scHRpbWVyLmgKPiBpbmRleCA2MDVmNjIyNjQ4MjUuLjkwYjIwNTUwYzFj
OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi1scHRpbWVyLmgKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi1scHRpbWVyLmgKPiBAQCAtMjcsMTAgKzI3LDE1IEBA
Cj4gICNkZWZpbmUgU1RNMzJfTFBUSU1fQ01QT0sJCUJJVCgzKQo+ICAKPiAgLyogU1RNMzJfTFBU
SU1fSUNSIC0gYml0IGZpZWxkcyAqLwo+ICsjZGVmaW5lIFNUTTMyX0xQVElNX0FSUk1DRgkJQklU
KDEpCj4gICNkZWZpbmUgU1RNMzJfTFBUSU1fQ01QT0tDRl9BUlJPS0NGCUdFTk1BU0soNCwgMykK
PiAgCj4gKy8qIFNUTTMyX0xQVElNX0lFUiAtIGJpdCBmbGllZHMgKi8KPiArI2RlZmluZSBTVE0z
Ml9MUFRJTV9BUlJNSUUJQklUKDEpCj4gKwo+ICAvKiBTVE0zMl9MUFRJTV9DUiAtIGJpdCBmaWVs
ZHMgKi8KPiAgI2RlZmluZSBTVE0zMl9MUFRJTV9DTlRTVFJUCUJJVCgyKQo+ICsjZGVmaW5lIFNU
TTMyX0xQVElNX1NOR1NUUlQJQklUKDEpCj4gICNkZWZpbmUgU1RNMzJfTFBUSU1fRU5BQkxFCUJJ
VCgwKQo+ICAKPiAgLyogU1RNMzJfTFBUSU1fQ0ZHUiAtIGJpdCBmaWVsZHMgKi8KPiAKCgotLSAK
IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
