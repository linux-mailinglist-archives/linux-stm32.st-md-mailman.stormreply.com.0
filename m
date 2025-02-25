Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E0A43974
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:29:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0731AC78F6A;
	Tue, 25 Feb 2025 09:29:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C222C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 793DD6122F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5904C4CEEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740475755;
 bh=5QI9uHnbKrXRYGECovSmXyJvXB7auSAuhh+3htNO7DE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nuV7oYqOqcFYUbXxbNP3rUkXVAa8592p3HxdihLdC5kXmWBKKZR3WqKQQendCNaV/
 oENz2v5D7A9JKyUOf1uodJmLm1dwCSf8wP9Z8AP/kNQM8sDn99CZQi/ZJHDXpPb4Xb
 d3PsLgO8xvfl7+lTWEKmbzenhWL8/jbbFC1E00x79diKhjTnwZcyo/4ktVzkaBvZ/j
 OMGrPyQUPqBO+cQUWzk+7fFfEfSclBkWkxYrXRneYbAli5NQXMgr0v5DJ6YHwiQglV
 QNPmFR5o+111CjBJYMXitgSeAeKXxONTPS5aQt0+JCNGA5357tdKC38UIqcBMLjBoR
 GEGMFWKIGIpXg==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so244836366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 01:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfsHIDIEBixJjSsa0Fs0X77bo7WRisDdhtuxCzymxoZlMWzqN5cQgohrMC4s7GgHupp5F+QXg1cTy9lQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwClcSgsonly1irFSZuZmOfiWBkL2wf6AKOJhGNe1In2nMWEiQ/
 Ft3uBj91cOKwjsB2YPs3sJdjJuMHyA/K1ZPNz8PzGc8Ue+mgaMbanBvhKkUjPew1zGxZNfR699k
 cYjiaTXla3kDsp7cM3NDigDfBThU=
X-Google-Smtp-Source: AGHT+IEOq0At6zPT+OpiunH+4BSketgcPR98DlixUCXVccfuLEsVE/TVTjLEJE+pZxuYrZTPiI+ADoAS4DNWkmoERiQ=
X-Received: by 2002:a17:907:9406:b0:aaf:c259:7f6 with SMTP id
 a640c23a62f3a-abc09d35ecfmr1620078166b.45.1740475754321; Tue, 25 Feb 2025
 01:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-4-phasta@kernel.org>
In-Reply-To: <20250224135321.36603-4-phasta@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Feb 2025 17:29:01 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Eu3VNO615wMdMT2bbeSurACwyR9uJmSGHErdyVu950Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpaEC4JuCS1MMY9EZYHmlHgtkdETZGtwE5y_2Q9kz7yTyHXXJLQzlO9aME
Message-ID: <CAAhV-H4Eu3VNO615wMdMT2bbeSurACwyR9uJmSGHErdyVu950Q@mail.gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] stmmac: loongson: Remove
	surplus loop
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

T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgOTo1M+KAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cGhhc3Rh
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gbG9vbmdzb25fZHdtYWNfcHJvYmUoKSBjb250YWlucyBh
IGxvb3Agd2hpY2ggZG9lc24ndCBoYXZlIGFuIGVmZmVjdCwKPiBiZWNhdXNlIGl0IHRyaWVzIHRv
IGNhbGwgcGNpbV9pb21hcF9yZWdpb25zKCkgd2l0aCB0aGUgc2FtZSBwYXJhbWV0ZXJzCj4gc2V2
ZXJhbCB0aW1lcy4gVGhlIGJyZWFrIHN0YXRlbWVudCBhdCB0aGUgbG9vcCdzIGVuZCBmdXJ0aGVy
bW9yZSBlbnN1cmVzCj4gdGhhdCB0aGUgbG9vcCBvbmx5IHJ1bnMgb25jZSBhbnl3YXlzLgo+Cj4g
UmVtb3ZlIHRoZSBzdXJwbHVzIGxvb3AuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5u
ZXIgPHBoYXN0YUBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogSHVhY2FpIENoZW4gPGNoZW5odWFj
YWlAbG9vbmdzb24uY24+Cgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1sb29uZ3Nvbi5jIHwgMTEgKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+IGluZGV4IDczYTY3
MTVhOTNlNi4uZTNjYWNkMDg1YjNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gQEAgLTU1NCwxNCArNTU0LDkg
QEAgc3RhdGljIGludCBsb29uZ3Nvbl9kd21hY19wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQKPiAgICAgICAgIHBjaV9zZXRfbWFzdGVyKHBkZXYp
Owo+Cj4gICAgICAgICAvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPiAtICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiAtICAgICAgICAg
ICAgICAgaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgaSkgPT0gMCkKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiAtICAgICAgICAgICAgICAgcmV0ID0gcGNpbV9pb21hcF9y
ZWdpb25zKHBkZXYsIEJJVCgwKSwgRFJJVkVSX05BTUUpOwo+IC0gICAgICAgICAgICAgICBpZiAo
cmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Rpc2FibGVfZGV2aWNlOwo+
IC0gICAgICAgICAgICAgICBicmVhazsKPiAtICAgICAgIH0KPiArICAgICAgIHJldCA9IHBjaW1f
aW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQoMCksIERSSVZFUl9OQU1FKTsKPiArICAgICAgIGlmIChy
ZXQpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2Rpc2FibGVfZGV2aWNlOwo+Cj4gICAgICAg
ICBtZW1zZXQoJnJlcywgMCwgc2l6ZW9mKHJlcykpOwo+ICAgICAgICAgcmVzLmFkZHIgPSBwY2lt
X2lvbWFwX3RhYmxlKHBkZXYpWzBdOwo+IC0tCj4gMi40OC4xCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
