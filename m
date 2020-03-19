Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D3F18B0EE
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 11:09:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2F1DC36B0B;
	Thu, 19 Mar 2020 10:09:30 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D578C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:09:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r7so4378182wmg.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RUn9UxzNYqDlVvjBdc02JsbNjG/1HKK11KHzgN8DpHk=;
 b=Zy7A3gLvgvG/ej7PLOBuw+h4UHQ5YbbbobNUkbeATbvkfuxaQMOb0vCCzKzXulEcjw
 Bflohb+c02EaGzLqe2kK0BuFaN6SiD4Vh3o5Z5DsCwi/hTTnjafJiooBLOzlmiLonQfq
 VErW8XaIC6T6pTsNu7/AX+kP031rgbcXZ6HgannJPJPKd2wqBCXPu006yPFmo21RUGiN
 L+Uzh/7ygSs1dOedYs1gEKqoqeQMW7ydWG1eRuOmfe3pM3dwE2yYYcQzmxvI3QcPe2f3
 XzwNrVNlGh2T8ZCEksGYeFItDSMGoRFJuF3kAKSgBT79fR1850m+Cy0qSAYAGwYgneQl
 Pkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RUn9UxzNYqDlVvjBdc02JsbNjG/1HKK11KHzgN8DpHk=;
 b=g56N8rNqd78oNpSVSmhQ8xpRBC1eVvduAR7mEGcq1HkuMsug31lCXMs+WUglFvtU5C
 PkonDv60sr6/mhREtt8eq/vlSItbnjimRRLZxMr4NZxzYoPn4ZqSd/87FeNyqYzrJXhc
 kFvhQ8WKsZCOTvM+s8rHgn1Zp+srHD9U/LFXTpGTq2DqMCw7Jt5PVU0goSZh6j4lAkkt
 gFNcSKGH0tAOgMWR6jryTo3YWdp8ZgjTLnTS0nEc6Cea6ckEDSKEEtx4RmfD4LyoD8OH
 IcxCzRaZ+L2uYP7rXdJtuNeIA9/B9Sjc+znAJt0Ne9QGdV+1vDRE6srP8G79X+qnDcAN
 er6w==
X-Gm-Message-State: ANhLgQ2CkSfwxS3PgevHSLMFYPKvTc7niRSBeCk4OO7bSvUehUsnbHq4
 ddiZ2AzU0vMD4qMm6FbRsShIjg==
X-Google-Smtp-Source: ADFU+vvPWW5ImdZ2pav4UsRH9+6PgZUguig9OJgjiIdwzr6ph+GkNIPoA4BMw5D7ED82x6qxdypSqw==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr2829698wmo.106.1584612568933; 
 Thu, 19 Mar 2020 03:09:28 -0700 (PDT)
Received: from dell ([2.27.35.213])
 by smtp.gmail.com with ESMTPSA id h16sm2730355wrr.48.2020.03.19.03.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 03:09:28 -0700 (PDT)
Date: Thu, 19 Mar 2020 10:10:14 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20200319101014.GA5477@dell>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-3-benjamin.gaignard@st.com>
 <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gVGh1LCAyMCBGZWIgMjAyMCwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gMTcvMDIvMjAy
MCAxNDo0NSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gPiBBZGQgZGVmaW5lcyB0byBiZSBh
YmxlIHRvIGVuYWJsZS9jbGVhciBpcnEgYW5kIGNvbmZpZ3VyZSBvbmUgc2hvdCBtb2RlLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
c3QuY29tPgo+IAo+IEFyZSB5b3UgZmluZSBpZiBJIHBpY2sgdGhpcyBwYXRjaCB3aXRoIHRoZSBz
ZXJpZXM/CgpOb3RoaW5nIGhlYXJkIGZyb20geW91IHNpbmNlIEkgQWNrZWQgdGhpcy4KCkFyZSB5
b3Ugc3RpbGwgcGxhbm5pbmcgb24gdGFraW5nIHRoaXMgcGF0Y2g/CgpJZiBzbywgY2FuIHlvdSBh
bHNvIHRha2UgcGF0Y2ggMSBwbGVhc2U/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
