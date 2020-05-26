Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AC1E1CA6
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 09:58:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F269DC36B23;
	Tue, 26 May 2020 07:58:24 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E9D6C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 07:58:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r15so2028835wmh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dJ7nNUH8waduGIyWxEV016jy3YBm4py1dEFZ4+moc0s=;
 b=A7d9iE7b9Upf36zlLWHFUh7N1P1CY4mQqszhIpb9d5Sl8zevcB1DdmcwQavIqWQbmw
 pX+23S3Y1u3fl+wZ932ldGkO8w6Lrtdl76NH7X0zFC1xB8ALdR3JhznT+pd07/KSSnsf
 hCNw+RSP5VLmcXqsozFu77d+Obd993ZdQ9KthTUkdwwx5xKTcb+n12El7J8g2uHUZw7s
 T/kxf3Nm+HWWBNgPaItR7FgJhTv8WyEaKfpONmcc1Py0NV6pLjU7LcHxvNrlRdSJr7im
 ACQBHGegYS3SNrFf59kTSNyyP10AXgMMR2wvqDAM4Wh2QHgxSgJIYVk/PAfvvrItr5on
 ZwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dJ7nNUH8waduGIyWxEV016jy3YBm4py1dEFZ4+moc0s=;
 b=tuvMQK35XyBK/vlaNYigSs4bxyfvcJddLEvaDXONLVhRanLucehw76TUWSSOT5rUdR
 rs6/NSvmJWCV0lV1e+xh4MTgqlJvg9HUd5B74VgMbO2cHOPXEIEcYCWhZYKfd+9uXPac
 pXAOrae9qigCGvj7hPHgVt07YjmcE66engTq9/nfwkV5CR3F0gJ1ovFoH7tRGk1bBrON
 Ap4lYanseQDGL5su6+yObTUSD0N4sGUX5FfHDMux1RrfzjgPxw5dRqj4FNWF/TMqLMFV
 vsfvdl/3J9g3+JiGO+iufNtIrLWTJVcXbhkOoMyZfBqB94nd9rtNK3PkM16tCfcO3A69
 TFzQ==
X-Gm-Message-State: AOAM533zM58rRIcEutOQ7LRelzB888fZl8mgfXAqIcHuy32hpGYvSz92
 CmjnHVJDcUriRGZDZ7oVpx5GQg==
X-Google-Smtp-Source: ABdhPJy8TQ7mKu5n0oMECEFkFjYc1EBZIzKzt2vRKCSKp3QhxeDkjqVyOGQXnuS+OyFgvG/1kqiDJw==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr176648wme.41.1590479902146; 
 Tue, 26 May 2020 00:58:22 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id j4sm18893746wrx.24.2020.05.26.00.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:58:21 -0700 (PDT)
Date: Tue, 26 May 2020 08:58:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200526075819.GF3628@dell>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
 <20200422090833.9743-3-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422090833.9743-3-amelie.delaunay@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/3] mfd: stmfx: fix stmfx_irq_init error
	path
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

T24gV2VkLCAyMiBBcHIgMjAyMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBJbiBjYXNlIHRo
ZSBpbnRlcnJ1cHQgc2lnbmFsIGNhbid0IGJlIGNvbmZpZ3VyZWQsIElSUSBkb21haW4gbmVlZHMg
dG8gYmUKPiByZW1vdmVkLgo+IAo+IEZpeGVzOiAwNjI1MmFkZTkxNTYgKCJtZmQ6IEFkZCBTVCBN
dWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgpIGNvcmUgZHJpdmVyIikKPiBTaWduZWQtb2Zm
LWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvbWZkL3N0bWZ4LmMgfCA5ICsrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
