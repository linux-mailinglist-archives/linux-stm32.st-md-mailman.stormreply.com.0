Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922C45C91C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Nov 2021 16:45:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14EF5C597BE;
	Wed, 24 Nov 2021 15:45:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A12CAC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 15:45:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r8so4969943wra.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gCMiGATfuKFNvhjai5hA/48G/fLNoKNdO6OP8Yup/4M=;
 b=CkVbdCaWAb6m0dMBGC8Z5BlM58LWgarAQ32uX/q68uQ2I7F/F79VZTOtG4VdFtGYH6
 EJhU5vuiztCdt0BeO5KBNWOXooV71TSgaKa1F+HQpc0gWJLXW1IIdxJ3N5o5hH+b9jxo
 vo6pyuonFjbHgwbaVEYKXh1di5e2iEcDl3trvUEmitnxkAMNIz6HlFQ9dQZf7p4qKfH1
 Ja3ycs8GWgi1l55P0Y5N085pVrbzUENtRW3sfCoSSR6CpvmlF80TpPkD63+5wnHyNYkp
 umEgbcqeaBj22ptswj7tffLKUIZMvmRw4P5w6SFR9JBQEQzhxHDFWh+XL6x6rW5yHnIQ
 hYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gCMiGATfuKFNvhjai5hA/48G/fLNoKNdO6OP8Yup/4M=;
 b=HB7zXCbwaFYpM31O0oMG60x3378JEHqE26TlAPJ5DzbcQ1Xod6ONKcW4rxzMFRfFj5
 H8cdJ6OvJiaHulyZ5Pobkc3sVV8PbjqusZWbQoNrji48kZFtXB92cF84z+Sg4N6xaQ9M
 YQpK/3E9Bagd+aH8UTc9+nYezIrLvYxbje2xuAPQUBkzXC8aE0BUP29pncC3NfWZx87r
 ObWbiln/r9mfi66sRuYWB08dOR+4QyXGnE21fl5kOPx2YlGr5J+8Nvq9GalETRT4th1O
 J0QVvZ5x9Vh3Ob511sOjWS9DcDB0IN9bCw1lpOWKGEOY1coNtWgPzsC75tIpXyMT8csm
 GrJQ==
X-Gm-Message-State: AOAM531pN8+tKVlAwv+7y5KT7cjcWy+TbKTNABB+GWyNFEpZBfbRTjgd
 XaxVcNI3v0SZ1oZnEXqG4cbzGg==
X-Google-Smtp-Source: ABdhPJxKP1EIe2YzDKu+gyYM9Ufj1TC/VyWllVX+bm0/ENSsvPRD/xHmWkwLeOOlgh8S00FJaVOL1A==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr20439457wrn.145.1637768736246; 
 Wed, 24 Nov 2021 07:45:36 -0800 (PST)
Received: from google.com ([2.31.167.61])
 by smtp.gmail.com with ESMTPSA id o4sm219343wry.80.2021.11.24.07.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 07:45:35 -0800 (PST)
Date: Wed, 24 Nov 2021 15:45:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <YZ5eGRC7XhrbgsN7@google.com>
References: <20211027082155.206449-1-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027082155.206449-1-francesco.dolcini@toradex.com>
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

T24gV2VkLCAyNyBPY3QgMjAyMSwgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6Cgo+IEZyb206IE9s
ZWtzYW5kciBTdXZvcm92IDxvbGVrc2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4KPiAKPiBBZGQg
c3VwcG9ydCBvZiBzdWItZnVuY3Rpb25zIGRpc2FibGluZy4gSXQgYWxsb3dzIG9uZSB0byBkZWZp
bmUKPiBhbiBzdG1wZSBzdWItZnVuY3Rpb24gZGV2aWNlIGluIGRldmljZXRyZWUsIGJ1dCBrZWVw
IGl0IGRpc2FibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBTdXZvcm92IDxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4KPiBDYzogT2xla3NhbmRyIFN1dm9yb3YgPG9sZWtz
YW5kci5zdXZvcm92QGZvdW5kcmllcy5pbz4KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY2VzY28gRG9s
Y2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4gLS0tCj4gSGVsbG8sCj4gdGhl
IG1haW4gcmVhc29uIGZvciB0aGlzIHBhdGNoIGlzIHRvIGFsbG93IGVuYWJsaW5nL2Rpc2FibGlu
ZyBzdWItZnVjdGlvbnMKPiB1c2luZyBEVFMgb3ZlcmxheSB0byBlbmFibGUgbW9yZSBmbGV4aWJp
bGl0eSBvbiBTb00vQ2FycmllciBib2FyZHMKPiBjb21iaW5hdGlvbnMuCj4gLS0tCj4gIGRyaXZl
cnMvbWZkL3N0bXBlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pav
XQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vi
b29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
