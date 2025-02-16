Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C16A39508
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 09:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ED24C78F95;
	Tue, 18 Feb 2025 08:21:20 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4DCCC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 02:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B83E0A40AD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 02:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DBDC4CEE8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739672511;
 bh=89f6kjxXBtZAaNt6NCCVp/SV2zvdrtocy+P983Rdy88=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A3fylSSvAsnYH15ydUFS+r59N8y3bLbLFqbqACryAQfsbPwavz5g7jM0RcLMdcDtF
 karFTM3aFOEIOi+smeCgIPWJx5TuDvcDft0+zLgshVCZeMvGd3cBnVar18mNGYIewZ
 5giB+H993hrvDHnsuZyZw8GnSLVg6ZsFTAKEMiBZJTpCVLu8gyj0Q2qSfpiDRnJBpu
 tfG+phyvg1zKmmtdze0tdfo5PK+eUswmvvgpuJLrtdv1LLUuDZRpr1VlK6GCKLnXia
 BoQ4PpzouLkGmYqMKQUzrsUg0ZtZ6FAu1ZpKSBhE7o7lDhQ9oBu+pHMTqthW0lOYLu
 vz4QuUvrxcFXA==
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e02eba02e8so1718131a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2025 18:21:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvFGXDzKnmzBvVEh9YJGRI+/h36ETHqAysWbxcCeGZITPTr6ZvYarB0DTKi7VAfuMsZ709tuWr6OvnBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxI2d5Yw8iXWeUnlnTekVng/JN/x9aAkoq+P1pfw84hq2BxFN7C
 udchGnTYzkj7Y2m32H/bthTRvECydfrHnb8SYocelZY5ZmpA9NcMQM/95dJD+epXh75lkzAyy4F
 anuJ8XiKChwRIFU+YsxiRRw7x+T0=
X-Google-Smtp-Source: AGHT+IHv+Clf+CXzjqX5DyVc7sIti2vAtNeryj4NmNK9lHofxSOPkE/OLkVPxMWDbiNC8PccJdCN2jloNFjeFePjtcU=
X-Received: by 2002:a05:6402:27d3:b0:5de:c9d0:673b with SMTP id
 4fb4d7f45d1cf-5e03600514bmr5012067a12.1.1739672510048; Sat, 15 Feb 2025
 18:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20250215164412.2040338-1-eleanor15x@gmail.com>
In-Reply-To: <20250215164412.2040338-1-eleanor15x@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 16 Feb 2025 10:21:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6G47+vitTq1ua1Mse3kyABAoX0FWQRNYkpt2HzGb4E-g@mail.gmail.com>
X-Gm-Features: AWEUYZlrH4zag26LnBQs_GejJWjGU1nYIl_mCem3RB06CTfTw7Cw4lFJKwa6J0E
Message-ID: <CAAhV-H6G47+vitTq1ua1Mse3kyABAoX0FWQRNYkpt2HzGb4E-g@mail.gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
X-Mailman-Approved-At: Tue, 18 Feb 2025 08:21:19 +0000
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 netdev@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, visitorckw@gmail.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Use str_enabled_disabled()
	helper
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

T24gU3VuLCBGZWIgMTYsIDIwMjUgYXQgMTI6NDTigK9BTSBZdS1DaHVuIExpbiA8ZWxlYW5vcjE1
eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXMga2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0ZWQsIHRo
ZSBmb2xsb3dpbmcgd2FybmluZyBvY2N1cnM6Cj4KPiBjb2NjaSB3YXJuaW5nczogKG5ldyBvbmVz
IHByZWZpeGVkIGJ5ID4+KQo+ID4+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjMTAwMF9jb3JlLmM6NTgyOjYtODogb3Bwb3J0dW5pdHkgZm9yIHN0cl9lbmFibGVkX2Rp
c2FibGVkKG9uKQo+Cj4gUmVwbGFjZSB0ZXJuYXJ5IChjb25kaXRpb24gPyAiZW5hYmxlZCIgOiAi
ZGlzYWJsZWQiKSB3aXRoCj4gc3RyX2VuYWJsZWRfZGlzYWJsZWQoKSBmcm9tIHN0cmluZ19jaG9p
Y2VzLmggdG8gaW1wcm92ZSByZWFkYWJpbGl0eSwKPiBtYWludGFpbiB1bmlmb3JtIHN0cmluZyB1
c2FnZSwgYW5kIHJlZHVjZSBiaW5hcnkgc2l6ZSB0aHJvdWdoIGxpbmtlcgo+IGRlZHVwbGljYXRp
b24uCj4KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4g
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwMjExMTYx
Ni54bmViZFN2MS1sa3BAaW50ZWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxl
bGVhbm9yMTV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2Fp
QGxvb25nc29uLmNuPgoKPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMxMDAwX2NvcmUuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMxMDAwX2NvcmUuYwo+IGluZGV4IDk2YmNkYTA4NTZlYy4uM2Vm
ZWU3MGY0NmIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjMTAwMF9jb3JlLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYzEwMDBfY29yZS5jCj4gQEAgLTE2LDYgKzE2LDcgQEAKPiAgI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2V0aHRvb2wuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hvaWNlcy5oPgo+ICAjaW5j
bHVkZSAic3RtbWFjLmgiCj4gICNpbmNsdWRlICJzdG1tYWNfcGNzLmgiCj4gICNpbmNsdWRlICJz
dG1tYWNfcHRwLmgiCj4gQEAgLTYzMyw3ICs2MzQsNyBAQCBpbnQgZHdtYWMxMDAwX3B0cF9lbmFi
bGUoc3RydWN0IHB0cF9jbG9ja19pbmZvICpwdHAsCj4gICAgICAgICAgICAgICAgIH0KPgo+ICAg
ICAgICAgICAgICAgICBuZXRkZXZfZGJnKHByaXYtPmRldiwgIkF1eGlsaWFyeSBTbmFwc2hvdCAl
cy5cbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgb24gPyAiZW5hYmxlZCIgOiAiZGlz
YWJsZWQiKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJfZW5hYmxlZF9kaXNhYmxl
ZChvbikpOwo+ICAgICAgICAgICAgICAgICB3cml0ZWwodGNyX3ZhbCwgcHRwYWRkciArIFBUUF9U
Q1IpOwo+Cj4gICAgICAgICAgICAgICAgIC8qIHdhaXQgZm9yIGF1eHRzIGZpZm8gY2xlYXIgdG8g
ZmluaXNoICovCj4gLS0KPiAyLjQzLjAKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
