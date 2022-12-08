Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D639B646FDF
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 13:39:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50365C6507A;
	Thu,  8 Dec 2022 12:39:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42B96C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 12:39:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0308A61EEE;
 Thu,  8 Dec 2022 12:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48D8C433D6;
 Thu,  8 Dec 2022 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670503176;
 bh=ZCO8HXCGjtI1DeTCkyD3Kyt5cdYV+cSqhtaQg5OQJo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkY3GiKNZ2XjbKS6CE0sOnsSuBkSTjJN8Yn8HIsVa7CokzLDJM2G/SOP2PwYeRC6G
 ab29c5p81hLdTiZJk61huuvYAypLvJ0SpwekoxbFCV+iy6tvX3JYIyUWdT1+adGuQR
 GkNH+CE1Cr8RupFn5xFMX5KpfYf+SU3X3H0WTigXh7vsURPcJbRL8JOsH1WG9FtRsx
 kzlhYVrl7IdF0oRDH+x1KwmsfHlD4H7heBh0CJavgbPGFwVEkK0Cx2axbl+P42IHNJ
 UIQRgY43pGS02PNluy3+Uv2Jl7vuDVbsH8AY3rYw3Ep+cvwSWhEcizz9iL2o25FS7A
 gsdR1LDUGLmjA==
Date: Thu, 8 Dec 2022 12:39:31 +0000
From: Lee Jones <lee@kernel.org>
To: ye.xingchen@zte.com.cn
Message-ID: <Y5HbA6FofIO9VYPT@google.com>
References: <202211220945587336502@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202211220945587336502@zte.com.cn>
Cc: linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: use
	devm_platform_get_and_ioremap_resource()
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

RG9uJ3QgZm9yZ2V0IHRvIGFkZCB0aGUgZHJpdmVyIHRhZyB0byB0aGUgc3ViamVjdCBsaW5lLgoK
ICBtZmQ6IHN0bTMyLWxwdGltZXI6IC4uLgoKT24gVHVlLCAyMiBOb3YgMjAyMiwgeWUueGluZ2No
ZW5AenRlLmNvbS5jbiB3cm90ZToKCj4gRnJvbTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0
ZS5jb20uY24+Cj4gCj4gQ29udmVydCBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSwgZGV2bV9pb3Jl
bWFwX3Jlc291cmNlKCkgdG8gYSBzaW5nbGUKPiBjYWxsIHRvIGRldm1fcGxhdGZvcm1fZ2V0X2Fu
ZF9pb3JlbWFwX3Jlc291cmNlKCksIGFzIHRoaXMgaXMgZXhhY3RseQo+IHdoYXQgdGhpcyBmdW5j
dGlvbiBkb2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pbmdoYW8gQ2hpIDxjaGkubWluZ2hhb0B6
dGUuY29tLmNuPgo+IFNpZ25lZC1vZmYtYnk6IHllIHhpbmdjaGVuIDx5ZS54aW5nY2hlbkB6dGUu
Y29tLmNuPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9zdG0zMi1scHRpbWVyLmMgfCA0ICstLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKQXBwbGllZCwg
dGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
