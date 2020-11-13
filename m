Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E832B1BF6
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Nov 2020 14:37:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5406DC0692F;
	Fri, 13 Nov 2020 13:37:07 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CFA8C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 13:37:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j7so9957764wrp.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 05:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZXNcKWQV/iEYRYgtaXItr/T7NMzdHwiOF6B3gBdjlXs=;
 b=iEzsfCk1zLQ2MDNk/U8uXqwMw6R8CD2OZcMKYDv9aRltDGLn4y0PDZ9o2zaiCHNXyG
 v2FpDwIpb7Yphd1RxG19LrMGWFChFd7HLfeYB6paIaqzOZ6m5SwW9zv34Dx/Pee8DRee
 B5wVBCcYuwO7gZroB/h5ZZF87gYv+tspvDp6z7ZhbpMwafNnad7Ti/PpVAv11YAKQPNA
 Nc2BVAgQWmAR2kRq416gSnf1Tkng5kY7GLHbtPC2fxXRSDbmEo0pc50hNCXf/zc2gLhh
 sBkNfNNw60BfZIGAK3xN4tsBtf5WiNe2DMlTZRdjnrNYfeaNC1jHf+Bje7bmpzvTsxLK
 0v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZXNcKWQV/iEYRYgtaXItr/T7NMzdHwiOF6B3gBdjlXs=;
 b=BMggVLp8FojXcALfNDZC27ineWM7AWtX2bfIEz5UzPH1D5MLFNVBOCOVDW+TwGshYg
 vGRXoeNnRCOTysT8W8sgfYOxu/YOsHGNLW0wSs16pmGtbAV/ZfJW65WGAarNZXTCrxKB
 rZGc5kRLSS77fbHgQOQv7ep2acokpuYp4Xswph0wpibYtYCWKHTZQhrObHUSv6b2+MyG
 /i59aaNbcweAUZzAwZTrjnb+Zzu8YqVWZ5z9/ePRt0BzTvvq5Ri7rk+jzZtMPMu0coY7
 JUTEIrbyRN4QMuMyJph6dl8mlBIIpAZRfHgQKUZP9jx22jTGQ4xDk5qpFvt8/S+s3XWL
 Gfxw==
X-Gm-Message-State: AOAM533H2WCfaUWIk1dKTxX6mSXPzF7iBjtjhMFY2sR01pH4ti7AyNab
 YIzHCm03SlKXak1BiCA3sxdjog==
X-Google-Smtp-Source: ABdhPJwrsEOkezQK2FB3H3FkJIqCrtELMW+h2nOu6rx156SZy+MuKs9Kw+gq+hQzvwLWmxsMPLt8oA==
X-Received: by 2002:adf:84a5:: with SMTP id 34mr3501915wrg.8.1605274625927;
 Fri, 13 Nov 2020 05:37:05 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id c2sm10395014wmf.47.2020.11.13.05.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:37:05 -0800 (PST)
Date: Fri, 13 Nov 2020 13:37:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201113133701.GJ3718728@dell>
References: <20201113122725.12971-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113122725.12971-1-amelie.delaunay@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/1] mfd: stmfx: fix dev_err_probe call
 in stmfx_chip_init
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

T24gRnJpLCAxMyBOb3YgMjAyMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiByZXQgbWF5IGJl
IDAgc28sIGRldl9lcnJfcHJvYmUgc2hvdWxkIGJlIGNhbGxlZCBvbmx5IHdoZW4gcmV0IGlzIGFu
IGVycm9yCj4gY29kZS4KPiAKPiBGaXhlczogNDFjOWMwNmM0OTFhICgibWZkOiBzdG1meDogU2lt
cGxpZnkgd2l0aCBkZXZfZXJyX3Byb2JlKCkiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxh
dW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiB2MjogYWRkcmVzcyBMZWUncyBj
b21tZW50IGFib3V0IGVycm9yIGhhbmRsaW5nIGFyZWEKPiAtLS0KPiAgZHJpdmVycy9tZmQvc3Rt
ZnguYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
