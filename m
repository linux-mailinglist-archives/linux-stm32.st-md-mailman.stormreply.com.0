Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410A7EF49C
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E744EC6DD70;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3520C6B47B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 06:56:48 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so2196222e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 22:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700204208; x=1700809008;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T66xySD/6BWFxQMYfuVxdprtl5AUvCVORapS2X/UsjA=;
 b=jDjySaEI6/l1MdXVlvBAcG2kl/QyDlimPOZFt9k7WK3yyWr/4KU9f9vwdtXe8LZb14
 uSVrbpfA1jA3+pI2CFZY2LzwRTq0YiQsQJa7XWewMQqNKV915N5nYnRGXekHW8ndAgcE
 iQqOFH3Ucu0/tWQS7fPygjoDt+qQSJwu9BckA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700204208; x=1700809008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T66xySD/6BWFxQMYfuVxdprtl5AUvCVORapS2X/UsjA=;
 b=vibngUzzui7XZc6jUCtqwR0bhr2bQaMqaYtIpyJSP443GflFjKYVkDHZLkrgG5IpCk
 gWHdZ/oUji5+3Ui7SXC6cOnb6oZnZjG6AevMcMUBowT1E/6bHYjcECPEf7Y8OAeuB0z7
 eSiH/TI9ku4DnE7Aju7diyH573H3Crl+WdMjsgUc/Ha3d+QTn+rhlWqdew/VTFiic0JK
 p2hoJvu0bgF8Ue/YJdLKvm9sJ1Fv7+Ea7EY4u0zO8Wuy9fPr7/psMzw6SwyDl/jwKW1j
 oXRwx/oue2yY5O+O6v434SCwk0dtUgSACP+S3rrvtWh6pCHmTkS1l5Tl96+QN/kxSuRk
 nltQ==
X-Gm-Message-State: AOJu0YyYtMLTHxwl7ahYWn/qm8+XUIJott9rn69pce9e7qDw2bBL646V
 FlJLL36DA3OyRbHgYm1n7yCl3yDHLsujyZHjSCtMHw==
X-Google-Smtp-Source: AGHT+IFglSCUhlR+oyIk3/8hEw9b1yf+H4f0nrHpnUuSq77qWRvZSkqp2vLBmJbn9Hw3jSSmXioHPYnOaZeT3dSXuhg=
X-Received: by 2002:ac2:4e0f:0:b0:50a:26b:6ddf with SMTP id
 e15-20020ac24e0f000000b0050a026b6ddfmr16092967lfr.63.1700204207777; Thu, 16
 Nov 2023 22:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-5-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-5-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Nov 2023 14:56:36 +0800
Message-ID: <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [RFC 4/6] media: verisilicon: Update H1 register
	definitions
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
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEFkZCBkZWZpbml0aW9uIG9mIHJl
Z2lzdGVyIGF0IG9mZnNldCAweDAwYy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJh
c2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3JlZ3MuaCB8IDkgKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmggYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPiBpbmRleCBjMWM2NmM5MzRh
MjQuLmVmYjQ2ZGEyM2VhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zl
cmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmgKPiBAQCAtMjMsNiArMjMsMTUgQEAKPiAgI2Rl
ZmluZSAgICAgSDFfUkVHX0FYSV9DVFJMX0lOUFVUX1NXQVAzMiAgICAgICAgICAgICAgIEJJVCgy
KQo+ICAjZGVmaW5lICAgICBIMV9SRUdfQVhJX0NUUkxfT1VUUFVUX1NXQVA4ICAgICAgICAgICAg
ICAgQklUKDEpCj4gICNkZWZpbmUgICAgIEgxX1JFR19BWElfQ1RSTF9JTlBVVF9TV0FQOCAgICAg
ICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICsjZGVmaW5lIEgxX1JFR19ERVZJQ0VfQ1RSTCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMGMKPiArI2RlZmluZSAgICAgSDFfUkVHX0RF
VklDRV9DVFJMX1NDQUxFX09VVFBVVF9TV0FQOCAgICAgIEJJVCgyNykKPiArI2RlZmluZSAgICAg
SDFfUkVHX0RFVklDRV9DVFJMX1NDQUxFX09VVFBVVF9TV0FQMTYgICAgIEJJVCgyNikKPiArI2Rl
ZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX1NDQUxFX09VVFBVVF9TV0FQMzIgICAgIEJJVCgy
NSkKPiArI2RlZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX01WX09VVFBVVF9TV0FQOCAgICAg
ICAgIEJJVCgyNCkKPiArI2RlZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX01WX09VVFBVVF9T
V0FQMTYgICAgICAgICAgICAgICAgQklUKDIzKQo+ICsjZGVmaW5lICAgICBIMV9SRUdfREVWSUNF
X0NUUkxfTVZfT1VUUFVUX1NXQVAzMiAgICAgICAgICAgICAgICBCSVQoMjIpCj4gKyNkZWZpbmUg
ICAgIEgxX1JFR19ERVZJQ0VfQ1RSTF9JTlBVVF9SRUFEXzFNQiAgICAgICAgICBCSVQoMjEpCj4g
KyNkZWZpbmUgICAgIEgxX1JFR19ERVZJQ0VfQ1RSTF9BWElfRFVBTF9DSEFOTkVMICAgICAgICAg
ICAgICAgIEJJVCgyMCkKCkFjY29yZGluZyB0byB0aGUgaS5NWDhNIE1pbmkgcmVmZXJlbmNlIG1h
bnVhbCwgdGhpcyBiaXQgaXMgYSAiZGlzYWJsZSIKY29udHJvbCwgaS5lLiBzZXR0aW5nIHRoaXMg
Yml0IGRpc2FibGVzIGR1YWwgY2hhbm5lbCBBWEkuIEkgdGhpbmsgdGhlCm1hY3JvIHNob3VsZCBl
eHBsaWNpdGx5IHN0YXRlIHRoaXMgaW4gdGhlIG5hbWluZywgc28gc29tZXRoaW5nIGxpa2UKSDFf
UkVHX0RFVklDRV9DVFJMX0RJU0FCTEVfQVhJX0RVQUxfQ0goQU5ORUwpLgoKT3RoZXIgYml0cyBt
YXRjaGVzIHRoZSByZWZlcmVuY2UgbWFudWFsLgoKPiAgI2RlZmluZSBIMV9SRUdfQUREUl9PVVRQ
VVRfU1RSRUFNICAgICAgICAgICAgICAgICAgICAgIDB4MDE0Cj4gICNkZWZpbmUgSDFfUkVHX0FE
RFJfT1VUUFVUX0NUUkwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDE4Cj4gICNk
ZWZpbmUgSDFfUkVHX0FERFJfUkVGX0xVTUEgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAx
Ywo+IC0tCj4gMi4yNS4xCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
