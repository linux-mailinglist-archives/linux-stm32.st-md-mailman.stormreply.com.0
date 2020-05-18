Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7A1D8900
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 22:18:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F7D3C36B23;
	Mon, 18 May 2020 20:18:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E170C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 20:18:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k13so11259262wrx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BuJAIlJzNVfUnKFpYlKJrQaksovEb6r2MOQ70C3Y5sE=;
 b=SxAWC9wD97Nx9RF3x3Gt/iZfKa8M2cx51v1EjKYupLeGpf+OXQcl28YEfu07NNYBzp
 oG+fZxxrewBemj4QfFHPCIkMV+hJAXiaAzGtFMWoKqaKX9APTvHFWnpqBpvZStJP6MY5
 ZJL49q+YvgR1TsQW6DuEjc0vHci857/8g7zyBbXevlDpKtC16cdZUMFYwaSBtu/Azadr
 hcWfZEHCdEnqumpagVLp+S3vV4xtpbduKy+4NNZEuG21ZOK5ZrWQACre05Eqq834JNCW
 Tr0rVO6giGivX1D6FKN3hG2Y2HP0AELLOVuUdTe7C7HDFMMswLp//vZnCo7l4qyKIsq0
 HEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BuJAIlJzNVfUnKFpYlKJrQaksovEb6r2MOQ70C3Y5sE=;
 b=VhJ4N+aaHOmQ04L80XkVFMSOkBg5fjB69r6hP7IjRNjTacDp5qG0ht62z1kWWgQ9Gp
 X1BE4GZcsxT7C7IIFokJzSbqmR8Jf91PbE8vwqgGQP9Z0IERaIqDnoux0/UAlt52rwys
 fjpE2gJpOLxFtUmxrJOmL9qinYZxA12D+V4g5d6SiLyp923Y1OqLnypVQAFuR7uGiA6E
 wpC1wQQQcsR9l9LJaoOu4Zn8l9dHHIkon8sIm/SoNGSyU2n0T+uFZY2XLN5znKoU2rnf
 rLz2eCBoVakIlBaEa7OTeXraiW2+mC/ugQ4cQKT9czTbiVK/e4vlypcQFiG0ypz0Rrlq
 mxwg==
X-Gm-Message-State: AOAM531m5gzYMSJcv4L7c+hB9tBn7c4IEoxq4BU3slX0IsE4zvmQoKHz
 EoJ0srKvJL7YSgYkwF0XMwPE+Q==
X-Google-Smtp-Source: ABdhPJwPiPMglSYT2/xaOY59iHe2nTbksNb6WmRUz9mJuUv5IbPqRFkca7BsAXDI/I3ojYQVTFNCww==
X-Received: by 2002:adf:806e:: with SMTP id 101mr21994991wrk.225.1589833107923; 
 Mon, 18 May 2020 13:18:27 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8?
 ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
 by smtp.googlemail.com with ESMTPSA id z11sm17107463wrr.32.2020.05.18.13.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 13:18:27 -0700 (PDT)
To: Benjamin Gaignard <benjamin.gaignard@st.com>, fabrice.gasnier@st.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, tglx@linutronix.de
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
 <20200420121620.2099-6-benjamin.gaignard@st.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <9f737934-d92c-9ddf-f6fb-3ee64057ea18@linaro.org>
Date: Mon, 18 May 2020 22:18:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420121620.2099-6-benjamin.gaignard@st.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pascal Paillet <p.paillet@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 5/6] clocksource: Add Low Power STM32
	timers driver
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

T24gMjAvMDQvMjAyMCAxNDoxNiwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gRnJvbTogQmVu
amFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gCj4gSW1wbGVt
ZW50IGNsb2NrIGV2ZW50IGRyaXZlciB1c2luZyBsb3cgcG93ZXIgU1RNMzIgdGltZXJzLgo+IExv
dyBwb3dlciB0aW1lciBjb3VudGVycyBydW5uaW5nIGV2ZW4gd2hlbiBDUFVzIGFyZSBzdG9wcGVk
Lgo+IEl0IGNvdWxkIGJlIHVzZWQgYXMgY2xvY2sgZXZlbnQgYnJvYWRjYXN0ZXIgdG8gd2FrZSB1
cCBDUFVzIGJ1dCBub3QgbGlrZQo+IGEgY2xvY2tzb3VyY2UgYmVjYXVzZSBlYWNoIGl0IHJpc2Ug
YW4gaW50ZXJydXB0IHRoZSBjb3VudGVyIHJlc3RhcnQgZnJvbSAwLgo+IAo+IExvdyBwb3dlciB0
aW1lcnMgaGF2ZSBhIDE2IGJpdHMgY291bnRlciBhbmQgYSBwcmVzY2FsZXIgd2hpY2ggYWxsb3cg
dG8KPiBkaXZpZGUgdGhlIGNsb2NrIHBlciBwb3dlciBvZiAyIHRvIHVwIDEyOCB0byB0YXJnZXQg
YSAzMktIeiByYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5q
YW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFBhc2NhbCBQYWlsbGV0
IDxwLnBhaWxsZXRAc3QuY29tPgoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPgoKWyAuLi4gXQoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBM
aW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8
CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
