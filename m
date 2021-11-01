Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B43441B03
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Nov 2021 13:13:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 387E9C5A4FF;
	Mon,  1 Nov 2021 12:13:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4E48C5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Nov 2021 12:13:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s13so20704486wrb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Nov 2021 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pz3A5N3I8y1fwIAFwuqkVwsnZQS1wS7neAtkz1GBL4A=;
 b=Gl6KBHBzdzXWw/gNX0hXmokxv66bIEbaEsr0k7CyVEJUBhcxkc47cDhG5xwRwwddPV
 k+hk3CpNAdRqJJSGTw25TQzVH2aVa1TDFQbJUUB78FQ0tZrX4rCQFtqBb5ZFF8MKjDaz
 ZlI4NkWVSal7xfE0K8kGeON9SuIHEzOVCvkwUyA+60y2EGBQJVxamnYOMPYeR+cvcdXd
 SnKL0AWgrQ1nBrRA1b2cjookP6XwqQd3FPKaNvnxcFP20RD2yCLz4fiRgC3bRjLXPo3J
 JhltuGUpEcbsZSpAkrgsxO6a16htSLraYTJ/ndRWFzqlQ8YFJ25U3Ek10Ph2/qTwhB2H
 DgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pz3A5N3I8y1fwIAFwuqkVwsnZQS1wS7neAtkz1GBL4A=;
 b=omw28WpI3AbnzezXVq/ZwTo5FKZg8ZnHdI3zN3Lsvasxpawol+m3GRJN3i1ROMf5tX
 GCPVD2cF2F2Cl44m/57TqHotpUplkRakzuKlHXHSwTiC1cSEedFCHAeqbVl+H6iLv0al
 zA0OERyJ1xe6XVPzz8A7PxFZilp1KMo1qN7DoVXJLoZIrWeeAEqDrx4BGugQ/T4+PCsa
 jk4dfnikvbx8X5VDuauyrwkfOHfvtfPK7y4AUx4BUOdvSrsnmH1NiJdjy/kAAPKs+apj
 8Gzdd9AVj/1r12WUg9bcgVBuLahMVBYSCwSWlXbHXZNA6ffbxlR8hzBYX4qw4cg5vUUR
 u2yw==
X-Gm-Message-State: AOAM532TXxfNoAV4/QHNs20sm7AR6a305EZBCaJ74roBJZzg5fFz21aa
 7oJia/xZWYs2EB3FDc2UsHMH3w==
X-Google-Smtp-Source: ABdhPJxVmUs0wVK3uKMWzroM9WV0UXXMqlPS6Ijhq9FGK/6yInjHF9WXv94m0AplS0MrrDsfnC0Dhg==
X-Received: by 2002:a5d:5504:: with SMTP id b4mr27927061wrv.307.1635768806159; 
 Mon, 01 Nov 2021 05:13:26 -0700 (PDT)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id s13sm16282744wmc.47.2021.11.01.05.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:13:25 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:13:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YX/Z47ztw8d4uMuQ@google.com>
References: <20211027082155.206449-1-francesco.dolcini@toradex.com>
 <20211101094844.GA4549@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211101094844.GA4549@francesco-nb.int.toradex.com>
Cc: marcel.ziswiler@toradex.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling
	sub-functions
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

T24gTW9uLCAwMSBOb3YgMjAyMSwgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6Cgo+IE9uIFdlZCwg
T2N0IDI3LCAyMDIxIGF0IDEwOjIxOjU1QU0gKzAyMDAsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3Rl
Ogo+ID4gRnJvbTogT2xla3NhbmRyIFN1dm9yb3YgPG9sZWtzYW5kci5zdXZvcm92QHRvcmFkZXgu
Y29tPgo+ID4gCj4gPiBBZGQgc3VwcG9ydCBvZiBzdWItZnVuY3Rpb25zIGRpc2FibGluZy4gSXQg
YWxsb3dzIG9uZSB0byBkZWZpbmUKPiA+IGFuIHN0bXBlIHN1Yi1mdW5jdGlvbiBkZXZpY2UgaW4g
ZGV2aWNldHJlZSwgYnV0IGtlZXAgaXQgZGlzYWJsZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBTdXZvcm92IDxvbGVrc2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4KPiA+IENj
OiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAZm91bmRyaWVzLmlvPgo+ID4g
U2lnbmVkLW9mZi1ieTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFk
ZXguY29tPgo+IAo+IEhlbGxvIExlZSwKPiBhbnkgY2hhbmNlIHlvdSBjb3VsZCB0YWtlIHRoaXMg
b25lIGxpbmUgcGF0Y2ggZm9yIHRoaXMgbWVyZ2Ugd2luZG93PwoKRm9yIGEgcGF0Y2ggc2VudCAw
LjUgd2Vla3MgYmVmb3JlIHRoZSBtZXJnZS13aW5kb3c/ICBOb3BlLiA6KQoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBM
aW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
