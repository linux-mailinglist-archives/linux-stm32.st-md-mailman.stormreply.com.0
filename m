Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F154163D2
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 14:37:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0202FC35E02
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2019 12:37:21 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D5CBC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2019 12:37:19 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t1so689181qtc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 May 2019 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BmUAXf3w3lUWjIG5MCP+ObcqnAZPTJqLAABuKptsGWI=;
 b=utoZSJvfs05uD4OUOqhPincz36/jF7KEYxS1N5u0jbxqxVffPWDOcJDJ5VwviBr9Df
 5mT1MDrRWVjA+fWJbzKQkM3W+IMxJRDuEhQnMEIq6KAGPoZgm9FndS2/ey2HKh6jQ+et
 wQcacxyvEVaqL5dg8yd3/YMTrSJFmkTfjBjF30WdzFQtys1MLz6gS/kVqkt3cdi+UB7/
 SaMy/O1wdfdlTTwmCj/zytMZyL/v022L+gHMmAsfEM+uATZAkzMAqqlYaJbvWNUhSp1v
 ScoLbrIAOLXlKxctfA+tBa/dcmLg0uS4ZIiz4oO11OCIh8AQcw9bj6fdqU11R/Ac4r+3
 prgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BmUAXf3w3lUWjIG5MCP+ObcqnAZPTJqLAABuKptsGWI=;
 b=Ir83CSSWHF3mLs0NQeUBULenNGTxIqpr4eesJ5wzHYUTuy0fLPAi6X/SPHDm/3MFU5
 xcohXaUdMu7mru27budCmoQe50xEVvbahwbaTvyFetvElvMbZOCym2vYSoVKG7mKckmA
 AR28r53+3R7WCs9VmQa+v2Y6rIzo1CAeCnVg9jdUD/TqXP5nOPTWjb9Unq4UiUA1WiEF
 /qSNKAEgHAbjZOd1s+w+tI03quxTOCdQaxsZDGj6vb8yw6/5vdwqTwNjm80dAgka9e+O
 qk3Ao5abYsOiO3QTzKa5kG9ivfaqfwMR4CELjvEIuV11tpjR6QHaSSMRK8Gg9PCoPrni
 iFhg==
X-Gm-Message-State: APjAAAU7pLWsHmFwYsj8RAynkTHoyn0rpahf52BR37MOLstZn8EzHWcP
 Dah/tDihJ3fX4nI2E5eI5vRFODs5e/EhPeqf7MvqNA==
X-Google-Smtp-Source: APXvYqxzEEY3udrVePkgazPG3496eLQSQxbvlpGQHKpnE9guF5wQuzNAbGB400oIN9bMhYCGv0HG/j0mBXlsHJYEl9o=
X-Received: by 2002:aed:306c:: with SMTP id 99mr25711109qte.38.1557232638409; 
 Tue, 07 May 2019 05:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190507101729.GA3420@icarus>
In-Reply-To: <20190507101729.GA3420@icarus>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 7 May 2019 14:37:07 +0200
Message-ID: <CA+M3ks4LhOFTeArnh3d=C02qLJWj_u6tWDDOhD8kZnJPRkXC8w@mail.gmail.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

TGUgbWFyLiA3IG1haSAyMDE5IMOgIDEyOjE5LCBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5Cjx2aWxo
ZWxtLmdyYXlAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIE1heSAwNywgMjAxOSBh
dCAxMToxMjoyNEFNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IFF1YWRyYXR1
cmUgZmVhdHVyZSBpcyBub3cgaG9zdGVkIG9uIGl0IG93biBmcmFtZXdvcmsuCj4gPiBSZW1vdmUg
cXVhZHJhdHVyZSByZWxhdGVkIGNvZGUgZnJvbSBzdG0zMi10cmlnZ2VyIGRyaXZlciB0byBhdm9p
ZAo+ID4gY29kZSBkdXBsaWNhdGlvbiBhbmQgc2ltcGxpZnkgdGhlIEFCSS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+
Cj4gQWx0aG91Z2ggdGhpcyBmdW5jdGlvbmFsaXR5IGlzIG5vdyBwcm92aWRlZCBieSB0aGUgQ291
bnRlciBzdWJzeXN0ZW0sIHdlCj4gc2hvdWxkIGtlZXAgdGhlIElJTyBDb3VudGVyIGludGVyZmFj
ZSBmb3IgdGhpcyBkcml2ZXIgaW50YWN0IHNpbmNlCj4gZXhpc3RpbmcgdXNlciBhcHBsaWNhdGlv
bnMgbWF5IGRlcGVuZCBvbiBpdDsgdGhpcyBpcyB0aGUgc2FtZSByZWFzb24gd2h5Cj4gdGhlIElJ
TyBDb3VudGVyIGNvZGUgaW4gdGhlIDEwNC1RVUFELTggZGV2aWNlIGRyaXZlciB3YXMgbm90IHJl
bW92ZWQKPiBkZXNwaXRlIG1vdmluZyB0byB0aGUgQ291bnRlciBzdWJzeXN0ZW0uCj4KPiBPbmNl
IHVzZXIgYXBwbGljYXRpb25zIGhhdmUgaGFkIGVub3VnaCB0aW1lIHRvIG1pZ3JhdGUgdG8gdGhl
IEdlbmVyaWMKPiBDb3VudGVyIGludGVyZmFjZSwgd2UgY2FuIGNvbnNpZGVyIHJlbW92aW5nIHRo
ZSBkZXByZWNhdGVkIElJTyBDb3VudGVyCj4gaW50ZXJmYWNlLgoKSGkgV2lsbGlhbSwKClRoaXMg
U29DIGlzIG5vdCB5ZXQgaW4gcHJvZHVjdGlvbiBzbyB0aGVpciBpcyBubyBsZWdhY3kgb24gdGhl
IG9sZCBpbnRlcmZhY2UKYW5kIEkgd291bGQgbGlrZSB0byBhdm9pZCB0byBjcmVhdGUgb25lLgoK
QmVuamFtaW4KCj4KPiBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
