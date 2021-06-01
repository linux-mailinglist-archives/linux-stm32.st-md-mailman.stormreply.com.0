Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B292397801
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 18:26:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ACF8C57B74;
	Tue,  1 Jun 2021 16:26:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF19EC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 16:26:41 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q5so4349647wrm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Jun 2021 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3qOQncXWcmTagrRnUN7xPwpRuDjJHMU3NDeiXjxsC04=;
 b=Q4UQpith9NJSzA3Ospei0Bw1mvGVa0w89R29XVu0wKwJvBGcEVnUtMRn8e9xMKE0AK
 2Ap4Q8kWdiQ6iBjPAwFPvOk4vIpQVkbGQpHo0yF34mcg+gbyZxY4Q4TmiTFxKGhdjliu
 gpHMHprjHINFQeXihuzRgGaHRwwJab9S7xk0l9HRhEKybgx20hxnks8hG4P0MjMMgonv
 /Fo607iUYWugl6neBdvC0KuG2IPQDnttRH/iGRaLS3/7cNkkrpwickMj0WLfejmbQOLX
 l/G6ODram+H62iUiXJ25jEtgl1LZnmc0136U8jBZdaxOGtNVRZmeKJiN3Woh1onCPEKF
 HztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3qOQncXWcmTagrRnUN7xPwpRuDjJHMU3NDeiXjxsC04=;
 b=aUJVJ1wr3cV8pglsU0SmGicgWpGL3fi/ntWRlaKZ4xvK6xicEW9B3tyRFjuK/ZxZWy
 SRqqpbuRO5owLityIY+MDbulfubaFX3gf+6VmEiiYMJzAdLqHAdwloP0KXhbiacp8nS6
 L7qQS2kWVb1e5dM+f+DsoFfMjOSnOKShALNObcHs96JJh/jqC3tFnYcdW+ejJW/67BIN
 KphWo6aePSFuyOKpJ45i0yGgC6RiPdbN3bMMc90u+h9r9RIJYSjYG3sfIquTnQMgEQgX
 dcnrFvCSdl6aVXW3a4788oTdu98ykJ2ynyr0+ksERgkXBvnuJB9hut+0rPCmwcKLcE6i
 O5Jw==
X-Gm-Message-State: AOAM533vZSuN2T2/tf9HGDoDAuJXyB+FuilSd7H4iVA47Ac1rMzv+l8P
 5AKHcFJLt+cBJpNvQ77LaGqVJg==
X-Google-Smtp-Source: ABdhPJzz/8Ro1pa/8xroirV4pUUj3sHXXH1wBBHnxdukJhb7RDxwxT+OyE6j+YMnWmfO587jWBJfqw==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr27799191wrf.130.1622564801308; 
 Tue, 01 Jun 2021 09:26:41 -0700 (PDT)
Received: from dell ([91.110.221.249])
 by smtp.gmail.com with ESMTPSA id h15sm10735wmq.1.2021.06.01.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:26:40 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:26:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20210601162638.GF2165650@dell>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-5-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415101037.1465-5-alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/13] dt-bindings: mfd: stm32-timers:
 remove #address/size cells from required properties
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

T24gVGh1LCAxNSBBcHIgMjAyMSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKCj4gYWRkcmVzcy1j
ZWxscyBhbmQgc2l6ZS1jZWxscyBjYW4ndCBiZSBkZWNsYXJlZCBhcyAicmVxdWlyZWQiIHByb3Bl
cnRpZXMKPiBhcyB0aGV5IGFyZSBub3QgbmVlZGVkIGlmIHN1Ym5vZGVzIGRvbid0IGhhdmUgYSAi
cmVnIiBlbnRyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5k
cmUudG9yZ3VlQGZvc3Muc3QuY29tPgoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
