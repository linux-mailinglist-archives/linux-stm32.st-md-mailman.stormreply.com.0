Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00941A5620F
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 08:54:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2AA7C78F89;
	Fri,  7 Mar 2025 07:54:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9348C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 07:54:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso1203192f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 23:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741334043; x=1741938843;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jivBZbbpeUpC37vr59Lus7C69ZvI+/qcef+nWtlt/Z8=;
 b=GmFMPrWjutHK7Qo/89BEEvjUBhgmM7bhDP1smgdqBwxL/iUaVfNAN4bh2OAGVZQhQC
 yRiEDkSywsDNn/7WP+ElQ4IyKZVrpyxq3WK2qJrFXlcopaQr9ZvNY9qpv+XY5ZDjPc1p
 UydW6TxQ1hff4RhgeuOKcESNr2LF1mHPfa0X+lJwgxCL++qJ63Y9EZg9pq6+mTaPW9tB
 laUo9hhSV55Jb+MB2tEm+pdaMZ0QyQ2PJO4ll9DwIu85tX0i4xJhz7QFMMxaSKGhk6Lw
 8RkgXNgXNeq/bvqddWYTWQciGQrlwRKYi9IyNURi8mGtLoNDpN26MaSMQSOmarFtugqL
 tPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741334043; x=1741938843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jivBZbbpeUpC37vr59Lus7C69ZvI+/qcef+nWtlt/Z8=;
 b=Izzp71s95W54msIZwk1V0ACAjpccFwaRTI00Iu6Tapku9PTU4SO/8Bl56dRJ2ThbKV
 kzPD7uhe9k91QHmmkdjWf/3+Anx4cIgSI/IAylwz+ofKW0LV5fVGwWutyNed5k3Y9s9X
 mK6+d71tpACaM5cJHCfDagbs8oVLDvoilnrKmkSx+xROvnFgjC35W2TpeXT1kW7m8VZB
 lZe6U0Qp/sV52mZsTPd9XDuDMPxVtdA/9Go7RCk4jtyj6ZOplYj3yM3CzvJJr1ljHde/
 FCwbhL5KvwkMFdHWYrijLsLWvUKGkflnl5dK42BFf76JzM95lfIgT4aMaQJvJn0hzXKI
 wfwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc1y6uSKLS0szevwNdOiwFC7fq+GnKgnQK6rVTccIOY9gsudkjnRJmrY0PH/aipSs1jTasey44FWKAeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3TxexjTOQ3C8+k8A9pzDOEw9ZEqQhoteBsj3gmXJd6epXVA+o
 VSvXTdiZKLMECaZyLUP3RvbjjkkmG6lzQoKNnh8gdwAq5ZkkuBk7ft4r3ri9h5E=
X-Gm-Gg: ASbGncuBPVbmgZYBpExrYdWePaHds9b+b8EGu2gvCB0BHlgQqwlIVsSPSzrCl++UEA9
 mW3Ir3IvoAHEch4fLm7hbjhrYZKWPfdi5BxZtmDSEA4bX/YJgXXhw/qyZi3+7iBmm2XVI7toV3o
 L5WUbYDTYDFXL4XPL1Nl059yGEWw87gYp4t8xdfddAg3Lg/se5dvOQf1d4DBbhA5rUhCfd35oXI
 rAz9dXuqhDSSFB+y/8GLuQKRJt+qW0H5L/wp8tEn13EKXxjl6sm4ROOpkZ+TOJyR0eoRA7b5DEY
 kywxxwbLFEf50XUyFvAHGrlMd4JNB4vdtUzd7tasum2sgGcQ3JMN1DY29BPiZDzLD+ifLufNMeP
 Q6ff7Yido
X-Google-Smtp-Source: AGHT+IF84dx46mQjSLVGU2fwl0MIMB+9teoe3MWhOKYeBMQn9a4+JteyS3aCEq/ZWOCktwprXzRy4w==
X-Received: by 2002:a05:6000:1884:b0:390:df83:1f5d with SMTP id
 ffacd0b85a97d-39132dbb4efmr1337542f8f.35.1741334043195; 
 Thu, 06 Mar 2025 23:54:03 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfddcsm4579617f8f.35.2025.03.06.23.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 23:54:02 -0800 (PST)
Message-ID: <b651acf3-ae10-4f70-a879-3b5d6ff39b02@linaro.org>
Date: Fri, 7 Mar 2025 08:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, tglx@linutronix.de
References: <20250306102501.2980153-1-fabrice.gasnier@foss.st.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250306102501.2980153-1-fabrice.gasnier@foss.st.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] clocksource: stm32-lptimer: use wakeup
 capable instead of init wakeup
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDYvMDMvMjAyNSAxMToyNSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IEZyb206IEFsZXhh
bmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gCj4gIndha2V1cC1z
b3VyY2UiIHByb3BlcnR5IGRlc2NyaWJlcyBhIGRldmljZSB3aGljaCBoYXMgd2FrZXVwIGNhcGFi
aWxpdHkKPiBidXQgc2hvdWxkIG5vdCBmb3JjZSB0aGlzIGRldmljZSBhcyBhIHdha2V1cCBzb3Vy
Y2UuCj4gCj4gRml4ZXM6IDQ4YjQxYzVlMmRlNiAoImNsb2Nrc291cmNlOiBBZGQgTG93IFBvd2Vy
IFNUTTMyIHRpbWVycyBkcml2ZXIiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3Nz
LnN0LmNvbT4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8u
b3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpG
b2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFj
ZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRw
Oi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
