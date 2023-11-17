Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE347EF49B
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E5EC6DD6E;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 687A5C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 06:12:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50a93c5647cso2254768e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 22:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700201519; x=1700806319;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzkIKBP1RSNSjcHa3ooQec7vnsT1BIreWgj3m6bqwkw=;
 b=HMqDd4zQ45HNeZ2v1acar3p6im1zdlewQ3KMknDY4MmdG2TDNPAQfOrzvAbfJxVQMr
 OnYSKMuCFwW2bm7fJBg+5taj6R2L3fm6Jg8+nIuyrfc2cxxl2Zy+FGAY5c5HIZs4BEP9
 k+fh2Ln0LYKAudfN/Rm22QF6b/Ec/9t5Mc2ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700201519; x=1700806319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzkIKBP1RSNSjcHa3ooQec7vnsT1BIreWgj3m6bqwkw=;
 b=tX9vcczO7SUvrZXJftDw2UY1pkTk8E5lGXsvw0/qAow8GSliVWCGgePw48YKOCipw7
 MqrVLNHlVsVF5IqLkttIw2NaQDCQj07FIdl6zA+xBHzQxi/QTSZd6xuLTq/pMdowhJH9
 zxZ2MEtLiJOqd4Wp7XbZUecTXsHuh//ghUA25IpvAMsZxLVwyG1aITQ2yn2owheooKHx
 /Y+tyxKAHVN2dRBNioj/4C79k39J+a3sEmhMwvXveVL6v7F1N3NUyLtfOOPtBiwHtiRV
 eYJBotEkybvbp9S4lfkXs4wsmv0dIQBQV9jUd6eZJijj1QL/el7C7ZpP8vxnzlb7nemO
 5XzQ==
X-Gm-Message-State: AOJu0YyZRWOyYUqmCYrTFWGHAx74wyw1x+yccaNlTs4QeQT1Yd0vpfiK
 uYRFzJO/+wFwP0JHRyR4owQ8kBuYLgjF0hTyEsTaqg==
X-Google-Smtp-Source: AGHT+IFbPm0GAk/S8jZWFqJiaxpI9RRydHhWmQXXbn39qHE7VNrw5ZxXw95aX6hOEaZc2PyZQeXNgpYfKQi/QvJmefo=
X-Received: by 2002:a05:6512:39c9:b0:50a:7640:6a7f with SMTP id
 k9-20020a05651239c900b0050a76406a7fmr15645335lfu.12.1700201519373; Thu, 16
 Nov 2023 22:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-4-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-4-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Nov 2023 14:11:48 +0800
Message-ID: <CAGXv+5GhaF94ZRwrZ_CWg3j6bVYyEqZru9LM7ABDB29-cPhqSQ@mail.gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 17 Nov 2023 14:35:32 +0000
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 3/6] media: verisilicon: Improve constant's
	name
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

T24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTE6NDjigK9QTSBBbmRyemVqIFBpZXRyYXNpZXdpY3oK
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEZvciBWUDggQklUKDE4KSBvZiB0
aGlzIHJlZ2lzdGVyIGlzIGZvciBlbmFibGluZyB0aGUgYm9vbGVhbiBlbmNvZGVyLgoKWWVzLCBi
dXQgZm9yIEguMjY0IGl0IHNlbGVjdHMgdGhlIGVudHJvcHkgY29kaW5nIG1vZGUsIDAgZm9yIENB
VkxDCmFuZCAxIGZvciBDQUJBQy4gWW91IGV2ZW4gYWRkIGl0IGJhY2sgaW4gdGhlIGxhc3QgcGF0
Y2guIEknZCBkbyBpdApoZXJlLCBzbyB5b3UgZGlzYW1iaWd1YXRlIHRoZSBkZWZpbml0aW9uIHdp
dGhpbiBvbmUgcGF0Y2guCgpDaGVuWXUKCgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJh
c2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3JlZ3MuaCAgICB8IDIgKy0KPiAgZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jIHwgMiArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9y
ZWdzLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdz
LmgKPiBpbmRleCA3NzUyZDEyOTFjMGUuLmMxYzY2YzkzNGEyNCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPiBAQCAt
NzAsNyArNzAsNyBAQAo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfRElTQUJMRV9RVUFS
VEVSX1BJWE1WICAgICAgQklUKDIyKQo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfVFJB
TlM4WDhfTU9ERV9FTiAgICAgICAgICAgQklUKDIxKQo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNf
Q1RSTDJfQ0FCQUNfSU5JVF9JREMoeCkgICAgICAgICAgKCh4KSA8PCAxOSkKPiAtI2RlZmluZSAg
ICBIMV9SRUdfRU5DX0NUUkwyX0VOVFJPUFlfQ09ESU5HX01PREUgICAgICAgICAgICAgICAgQklU
KDE4KQo+ICsjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfVlA4X0JPT0xFTkNfRU5BQkxFICAg
ICAgICAgQklUKDE4KQo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfSDI2NF9JTlRFUjRY
NF9NT0RFICAgICAgICAgQklUKDE3KQo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNfQ1RSTDJfSDI2
NF9TVFJFQU1fTU9ERSAgICAgICAgICAgQklUKDE2KQo+ICAjZGVmaW5lICAgIEgxX1JFR19FTkNf
Q1RSTDJfSU5UUkExNlgxNl9NT0RFKHgpICAgICAgICAgKCh4KSkKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jCj4gaW5k
ZXggMDVhYTBkZDljMDljLi4wOGM1MDc5ZmJmZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jCj4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfdnA4X2VuYy5jCj4gQEAgLTEy
MjYsNyArMTIyNiw3IEBAIHN0YXRpYyB2b2lkIGhhbnRyb19oMV92cDhfZW5jX3NldF9wYXJhbXMo
c3RydWN0IGhhbnRyb19kZXYgKnZwdSwgc3RydWN0IGhhbnRyb19jCj4gICAgICAgICByZWcgPSAw
Owo+ICAgICAgICAgaWYgKG1iX3dpZHRoICogbWJfaGVpZ2h0ID4gTUFYX01CX0NPVU5UX1RPX0RJ
U0FCTEVfUVVBUlRFUl9QSVhFTF9NVikKPiAgICAgICAgICAgICAgICAgcmVnID0gSDFfUkVHX0VO
Q19DVFJMMl9ESVNBQkxFX1FVQVJURVJfUElYTVY7Cj4gLSAgICAgICByZWcgfD0gSDFfUkVHX0VO
Q19DVFJMMl9FTlRST1BZX0NPRElOR19NT0RFOwo+ICsgICAgICAgcmVnIHw9IEgxX1JFR19FTkNf
Q1RSTDJfVlA4X0JPT0xFTkNfRU5BQkxFOwo+Cj4gICAgICAgICBpbnRlcl9mYXZvciA9IDEyOCAt
IGN0eC0+dnA4X2VuYy5wcm9iX2ludHJhOwo+ICAgICAgICAgaWYgKGludGVyX2Zhdm9yID49IDAp
Cj4gLS0KPiAyLjI1LjEKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
