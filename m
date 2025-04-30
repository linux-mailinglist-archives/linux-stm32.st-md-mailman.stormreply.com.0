Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD038AA4403
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 09:31:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BBEBC78F98;
	Wed, 30 Apr 2025 07:31:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E110DC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 07:31:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-225df540edcso7115915ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 00:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745998263; x=1746603063;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f9BcveS9bJ2hUNKExpwZbpno31qDfmJMMPHesU3EtOA=;
 b=YNn4EHd2aQ/Kl48JsNiEN6JpKMj1GEqzkQIiMGUNJB50rKrIQe0vNp6E2pyrRXreDR
 8kW0j5OhcFdnF+7n+YuDR3buLf0CQv1p9m6IPWwSe79NOSaej7fHU6buyihKYgAzz8oA
 LRb7StTP8ybD4oePsQbM8dfhuo9TpuiT8D0CALlY11l+dNOIX/D54UZlEVwW2M4P6Ma3
 BnqIQYOu4sLww31r+uDYlH3yy0ut1zZqhDGz/HdkyZLndvFj1kxzNCmrayA3apLytRCF
 pZusNpSZKAs0m2cU146g0JRC2EWfu/nNroCZk2/ug9eEV/XF7aKGA83J58nHnp/f6p+i
 fE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745998263; x=1746603063;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9BcveS9bJ2hUNKExpwZbpno31qDfmJMMPHesU3EtOA=;
 b=H78ZzONN5kxeZEzLQoaqJjbBiFllwy1Ie/l31yDePjejqYKpD0CMDpAASyoiYhP+0Y
 2Oq5ClR3Jj/+X7XNoLe2/ngxNPkus1Y/zs6clUtvyuUH2m1IO9dLQ7Q9cvx09LYRz6+g
 BSCiGbLVal/NHn0xd1JxcbJQwIpA5HCd6pMFuCd33xPjkOU8spOxfQ4oSXGIVNO+3TNQ
 Y7EKfjGYgQe1IF7TVeth7S1s8jrFKCMRt+nL6ZV7wsfL5Rqs29UGPDmsEKc0D4aBaFTl
 LQwU5tHMtaY2bIYyBjVT7E8cZgAnYGFGgpesJrhmAhHB4ov/0ilkYC2PbN7A5hCl/X1p
 Qf5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW92CzNK8v1MPG/T7G2NBN/wLoIRTXEeCDOthEWC/lsvYaAwftzLxMqSQlfHSBWEKjR5t4QELx3biKPtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyPGmNYfSqJtuAzcMICbMxLF5vjY1fPzDRdLZRGaJ6XhUomGj2r
 yBXsdIx0YjwEUcJYsocgk7SzmRfpIG54QVZurC0Md0MQ/oip88m1FDDMq7WcYA==
X-Gm-Gg: ASbGncuUD0BQB4m/CwrBt5aBIg0xyI6haePJGReo4s1sXQJ6SEvBmQw392AIkgOk74R
 yaJrGEh18U5DQdrVSKPptpFu19EXZF+Ttt/dIYXPzXRmNJQxk8tqmPIm2rJ71nJbdBx7lIPO8uS
 HSPAR2Q6WOBRybPWMfjvmsXize5krojL+LzwQVQKuiQXXc7kibo5T+XlKjE5Z6bqRH0bpDgKE++
 O4Z3Jqp+Molct/YUw3/nYuTKI9XzCR+IdYPMbUQhk8YwY0SXEHxEK1P+aEz+2QLDJIeQKYZGC1q
 a60yZJ7MWiZeqNAQvvcFG5AKhRTxuJu+EizA0SpyxwiIC01xW0kfSJiIS3MKQIg=
X-Google-Smtp-Source: AGHT+IGvuUKCFE89zlztyMs58PdQPaZwbdcUg7B/Z8lPi6W5exJgXq8dwQDiTzUF/X2QftM+XSATqQ==
X-Received: by 2002:a17:903:946:b0:220:e91f:4408 with SMTP id
 d9443c01a7336-22df481a867mr25135935ad.22.1745998263295; 
 Wed, 30 Apr 2025 00:31:03 -0700 (PDT)
Received: from thinkpad ([120.56.197.193]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76fa2sm115884365ad.19.2025.04.30.00.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 00:31:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:00:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423090119.4003700-3-christian.bruel@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 2/9] PCI: stm32: Add PCIe host support
	for STM32MP25
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

T24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMTE6MDE6MTJBTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEFkZCBkcml2ZXIgZm9yIHRoZSBTVE0zMk1QMjUgU29DIFBDSWUgR2VuMSAyLjUg
R1QvcyBhbmQgR2VuMiA1R1Qvcwo+IGNvbnRyb2xsZXIgYmFzZWQgb24gdGhlIERlc2lnbldhcmUg
UENJZSBjb3JlLgo+IAo+IFN1cHBvcnRzIE1TSSB2aWEgR0lDdjJtLCBTaW5nbGUgVmlydHVhbCBD
aGFubmVsLCBTaW5nbGUgRnVuY3Rpb24KPiAKPiBTdXBwb3J0cyBXQUtFIyBHUElPLgo+IAoKTW9z
dGx5IGxvb2tzIGdvb2QuIEp1c3QgYSBjb3VwbGUgb2YgY29tbWVudHMgYmVsb3cuCgo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBCcnVlbCA8Y2hyaXN0aWFuLmJydWVsQGZvc3Muc3QuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnICAgICAgfCAgMTIgKwo+
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9NYWtlZmlsZSAgICAgfCAgIDEgKwo+ICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmMgfCAzNjggKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuaCB8ICAx
NSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzk2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zdG0zMi5oCj4gCgpb
Li4uXQoKPiArc3RhdGljIGludCBzdG0zMl9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gK3sKPiArCXN0cnVjdCBzdG0zMl9wY2llICpzdG0zMl9wY2llOwo+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiArCWludCByZXQ7Cj4gKwo+ICsJc3RtMzJf
cGNpZSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqc3RtMzJfcGNpZSksIEdGUF9LRVJORUwp
Owo+ICsJaWYgKCFzdG0zMl9wY2llKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCXN0bTMy
X3BjaWUtPnBjaS5kZXYgPSBkZXY7Cj4gKwlzdG0zMl9wY2llLT5wY2kub3BzID0gJmR3X3BjaWVf
b3BzOwo+ICsJc3RtMzJfcGNpZS0+cGNpLnBwLm9wcyA9ICZzdG0zMl9wY2llX2hvc3Rfb3BzOwo+
ICsKPiArCXN0bTMyX3BjaWUtPnJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X2NvbXBh
dGlibGUoInN0LHN0bTMybXAyNS1zeXNjZmciKTsKPiArCWlmIChJU19FUlIoc3RtMzJfcGNpZS0+
cmVnbWFwKSkKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RtMzJfcGNp
ZS0+cmVnbWFwKSwKPiArCQkJCSAgICAgIk5vIHN5c2NmZyBzcGVjaWZpZWRcbiIpOwo+ICsKPiAr
CXN0bTMyX3BjaWUtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOwo+ICsJaWYgKElTX0VS
UihzdG0zMl9wY2llLT5jbGspKQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VS
UihzdG0zMl9wY2llLT5jbGspLAo+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBQQ0llIGNsb2Nr
IHNvdXJjZVxuIik7Cj4gKwo+ICsJc3RtMzJfcGNpZS0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9s
X2dldF9leGNsdXNpdmUoZGV2LCBOVUxMKTsKPiArCWlmIChJU19FUlIoc3RtMzJfcGNpZS0+cnN0
KSkKPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RtMzJfcGNpZS0+cnN0
KSwKPiArCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgUENJZSByZXNldFxuIik7Cj4gKwo+ICsJcmV0
ID0gc3RtMzJfcGNpZV9wYXJzZV9wb3J0KHN0bTMyX3BjaWUpOwo+ICsJaWYgKHJldCkKPiArCQly
ZXR1cm4gcmV0Owo+ICsKPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHN0bTMyX3BjaWUp
Owo+ICsKPiArCXJldCA9IHBtX3J1bnRpbWVfc2V0X2FjdGl2ZShkZXYpOwo+ICsJaWYgKHJldCA8
IDApIHsKPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhY3RpdmF0ZSBydW50aW1lIFBNICVk
XG4iLCByZXQpOwoKUGxlYXNlIHVzZSBkZXZfZXJyX3Byb2JlKCkgaGVyZSBhbmQgYmVsb3cuCgo+
ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJcmV0ID0gZGV2bV9wbV9ydW50aW1lX2VuYWJs
ZShkZXYpOwo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBl
bmFibGUgcnVudGltZSBQTSAlZFxuIiwgcmV0KTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsK
PiArCXBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKGRldik7Cj4gKwoKSSBrbm93IHRoYXQgYSBsb3Qg
b2YgdGhlIGNvbnRyb2xsZXIgZHJpdmVycyBkbyB0aGlzIGZvciBubyBvYnZpb3VzIHJlYXNvbi4g
QnV0CmluIHRoaXMgY2FzZSwgSSBiZWxpZXZlIHlvdSB3YW50IHRvIGVuYWJsZSBwb3dlciBkb21h
aW4gb3IgZ2VucGQgYmVmb3JlCnJlZ2lzdGVyaW5nIHRoZSBob3N0IGJyaWRnZS4gSXMgdGhhdCBy
aWdodD8gQW5kIHRoZSBmYWN0IHRoYXQgeW91IGFyZSBub3QKZGVjcmVtZW50aW5nIHRoZSBydW50
aW1lIHVzYWdlIGNvdW50IG1lYW5zLCB5b3Ugd2FudCB0byBrZWVwIGl0IE9OIGFsbCB0aGUgdGlt
ZT8KQmV3YXJlIHRoYXQgeW91ciBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUgY2FsbHMgd291bGQgbmV2
ZXIgZ2V0IGV4ZWN1dGVkLiAKCkFsc28gaW4gYW55IGNhc2UsIHlvdSBuZWVkIHRvIGNhbGwgdGhp
cyBiZWZvcmUgZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgpLgpPdGhlcndpc2UsIFBNIGNvcmUgd2ls
bCBzdXNwZW5kIHRoZSBwYXJlbnQgYW5kIGVuYWJsZSBpdCBkdXJpbmcKcG1fcnVudGltZV9nZXRf
bm9yZXN1bWUoKSwgd2hpY2ggaXMgcmVkdW5kYW50LgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
