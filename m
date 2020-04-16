Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27931AB92C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 09:02:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FA1C36B0C;
	Thu, 16 Apr 2020 07:02:36 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96062C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 07:02:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u13so3526964wrp.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UcbV/1U7fcT3mqmBtnCZDKM08tchT85s7YFfnWx+Mb8=;
 b=zS3y8LnlF68g0JllYixN26PbAwCSYY7xSlE8nXjsy7YcsVxDwbGAO2rKjNYL1Vw91a
 cDrmXmEMPfKStjnT6sMkP5P5xZ8usWxZHQ37ENd8X7uF3wahkUpFfF65sbOObwpTipWH
 TwoCG+Z5BXWUk1u0ookteA/VWEm7Wd0Jed1o8tTilBP9B0hvhsJE5Z0KHkyyIpWzxfRH
 doTWrjcELR9xW1KFiQWOEp6uzvD1Nu0DMMHEgI58rgOUMG1xKY+G6wCXfFHBYPbGaMxd
 5TBnIdhsAJvm7fT4SxC6iM6fvjYQgs5DBb/i/3w3d45KPazkLTm3Ew6LM+RzDHcGFe5f
 6/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UcbV/1U7fcT3mqmBtnCZDKM08tchT85s7YFfnWx+Mb8=;
 b=PGzoFPbbJysqDNDfU7mDy00aRh5aM8i4pDUJ+vRyCtc/mcZ/xvMKTlpUzC2J6zTMBO
 nCS9BnG4i4hMoul/NO+Q+M5RiCFOn7b4wzjNHnTp29OQ48xatPNl4TpqPJ6ldxROdYVY
 WYWuuHElXV1NORAyWjj0pk22ZLk6VJ0eoZivpNWP0Bzwoonuxn4DnzFcy1Bu5uXjXsN3
 DXBJ/jvb082JJBf5VJyHcYvYRHmgeHbDEfaib/TJ6NrMZ64tv7LnFsN5byBPjrL0ShxG
 WbsOYBa1r9tbOIjDVVhMLJfby8T77SZrD1LjrkPcetSteDfe8JFEeJ2BwkrRPW613I9j
 Hm1g==
X-Gm-Message-State: AGi0PuZxiIPUJrJVEYgrCx5HxVM7Y0Yf9Rwg5jgaMbzsieJymmWS3Riq
 Ah1EvYLnxhOfZRMDdetno0/YtQ==
X-Google-Smtp-Source: APiQypJ96rWLxKp7VAvSeHK7hZEqilWnmaYg11vV8dBdjgLm8n9pRM8C8e1VgmyHDPezkPAvIIBirQ==
X-Received: by 2002:adf:ed0e:: with SMTP id a14mr32770394wro.400.1587020553212; 
 Thu, 16 Apr 2020 00:02:33 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id j11sm4915082wrr.62.2020.04.16.00.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:02:32 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:03:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200416070323.GO2167633@dell>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-5-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401083909.18886-5-benjamin.gaignard@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 4/6] mfd: stm32: enable regmap fast_io
 for stm32-lptimer
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

T24gV2VkLCAwMSBBcHIgMjAyMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cgo+IEJlY2F1c2Ug
c3RtMzItbHB0aW1lciBuZWVkIHRvIHdyaXRlIGluIHJlZ2lzdGVycyBpbiBpbnRlcnJ1cHQgY29u
dGV4dAo+IGVuYWJsZSByZWdtYXAgZmFzdF9pbyB0byB1c2UgYSBzcGluX2xvY2sgdG8gcHJvdGVj
dCByZWdpc3RlcnMgYWNjZXNzCj4gcmF0aGVyIHRoYW4gYSBtdXRleC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL21mZC9zdG0zMi1scHRpbWVyLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpGb3IgbXkgb3duIHJlZmVyZW5jZToKICBBY2tlZC1mb3ItTUZELWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
