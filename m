Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6A76EED0
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 17:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49A9AC6A603;
	Thu,  3 Aug 2023 15:58:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95CF8C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 12:37:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so5010719e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Aug 2023 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1690979834; x=1691584634; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbOtrbuAbCVZChFvcVrSuATOys/C2fprGpeUD9URBHg=;
 b=QRO9Nxa1SiODUkYydluq+gWpZ7lZ4XtHwTuzFSmZAxcvSEOXaPNKSd0GU9Xf8+SG/+
 5jHKrezoWOdT8A59vVUo/48L1hVgSbYcSBkDf/IjVovPMZp5WW5oSMcl6ULsMEaKFhXI
 5r36JgkUedq4jVrtbcLTjUtCFLZXqEiMQ+hq1Yo9JkCBfArXgXMitEiCxmpI9DJnFMxM
 0KZPyDGh6ei2tbkA2duXrB5Sf7utXuFg8CazYqjnLCU1fY2A6mMAbNcgGMtzrkcvH19+
 BKBu8/hfAxmkDKwoMb5W2JxkPFhuNhhJAet7izdaXPJXFFC/DFb4Iv+NvGOdGtTYQ0U0
 HYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690979834; x=1691584634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbOtrbuAbCVZChFvcVrSuATOys/C2fprGpeUD9URBHg=;
 b=VJMbuwZ5xR2VmjkYQjSVao+e8qOFgk04CkF4/AI7xwIxJ9xpe+0PckyHhc0ZxXBWGW
 gFaKGEqlf+Odjg4HS5nXlC7qwZqL+OsoZm+QW1KwaB1m7LQ1RUFS+wQqUFHwhJmI87LB
 JQK9Thxsfz7iMN0WQMHFxlteP4DClI5Fxv2GzY/r+xo0qev1FoQRafznqy0KsZZ5jJu4
 NMCqlZ29KdWd+YhPL3NaR5o59znvTXLXALuBC4glVo2LWX3zQi/pwguH4oWj/Puvz77I
 MYTubAaz3PPJbGOU/qcqNgPr1KlZW/SQs48sW5CkC5W8PeD9xAz1pdgUawW/Oodm5KSV
 +0bw==
X-Gm-Message-State: ABy/qLYoyqLE9h7dRPJAvThRuwOiRAHvdEbnfwYeRbvK6H3iyf0zBrtO
 3Hs8KAORuZ36Lb7AtSFWcPBxxz1BQZ6JSyRpo8TOEw==
X-Google-Smtp-Source: APBJJlGPcZH9vNmqB+R7XZfYsW3LGvr8Ed/uiifd4Mh50scxNI/J+i41X6mfphDAdRHRWKO0PLYVyMZqq/CNNewyYpg=
X-Received: by 2002:a05:6512:70b:b0:4f8:6833:b13c with SMTP id
 b11-20020a056512070b00b004f86833b13cmr4141389lfs.14.1690979833551; Wed, 02
 Aug 2023 05:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230802120915.25631-1-aboutphysycs@gmail.com>
In-Reply-To: <20230802120915.25631-1-aboutphysycs@gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Wed, 2 Aug 2023 15:37:02 +0300
Message-ID: <CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com>
To: Andrei Coardos <aboutphysycs@gmail.com>
X-Mailman-Approved-At: Thu, 03 Aug 2023 15:58:01 +0000
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-lptimer-trigger:
	remove unneeded platform_set_drvdata()
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCAzOjA54oCvUE0gQW5kcmVpIENvYXJkb3MgPGFib3V0cGh5
c3ljc0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyBmdW5jdGlvbiBjYWxsIHdhcyBmb3VuZCB0
byBiZSB1bm5lY2Vzc2FyeSBhcyB0aGVyZSBpcyBubyBlcXVpdmFsZW50Cj4gcGxhdGZvcm1fZ2V0
X2RydmRhdGEoKSBjYWxsIHRvIGFjY2VzcyB0aGUgcHJpdmF0ZSBkYXRhIG9mIHRoZSBkcml2ZXIu
IEFsc28sCj4gdGhlIHByaXZhdGUgZGF0YSBpcyBkZWZpbmVkIGluIHRoaXMgZHJpdmVyLCBzbyB0
aGVyZSBpcyBubyByaXNrIG9mIGl0IGJlaW5nCj4gYWNjZXNzZWQgb3V0c2lkZSBvZiB0aGlzIGRy
aXZlciBmaWxlLgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleEBzaHJ1
Z2dpZS5ybz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkgQ29hcmRvcyA8YWJvdXRwaHlzeWNzQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRpbWVyLXRyaWdn
ZXIuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRpbWVyLXRyaWdnZXIuYyBiL2RyaXZl
cnMvaWlvL3RyaWdnZXIvc3RtMzItbHB0aW1lci10cmlnZ2VyLmMKPiBpbmRleCAyZTQ0N2EzZjA0
N2QuLmRmMjQxNmUzMzM3NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby90cmlnZ2VyL3N0bTMy
LWxwdGltZXItdHJpZ2dlci5jCj4gKysrIGIvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRp
bWVyLXRyaWdnZXIuYwo+IEBAIC05Miw4ICs5Miw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfbHB0aW1f
dHJpZ2dlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgaWYg
KHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKCnRoaXMgY2FuIGJlY29tZSBub3c6
CgogICAgICAgICAgICByZXR1cm4gc3RtMzJfbHB0aW1fc2V0dXBfdHJpZyhwcml2KTsKCgo+Cj4g
LSAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsKPiAtCj4gICAgICAgICBy
ZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjM0LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
