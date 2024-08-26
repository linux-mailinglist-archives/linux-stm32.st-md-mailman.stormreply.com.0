Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B495F850
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 19:41:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 259DAC7801A;
	Mon, 26 Aug 2024 17:41:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03034C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 17:41:31 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-714302e7285so3860127b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 10:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724694090; x=1725298890;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gk6yec5dWuUP0cgrAQJG6vAUBJ9aHrLwI2uJ5n3Lhmk=;
 b=MRkPLmqEYQjzdDolIn9O0q5n3YA7Z5C7a9tCfIw4QlganRZmPfv9rQcFWE0eJvCwO2
 K6Yun58g2Ub+gkwxO7qJ0PU52lpsM3eIKsp2Mt9LQZpryNcmZtyhHE6YAzIcEsyJ7Bq/
 +dW2m7BGUL3UN/vHPAeYHVEkLLe9MJYFBFNo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724694090; x=1725298890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gk6yec5dWuUP0cgrAQJG6vAUBJ9aHrLwI2uJ5n3Lhmk=;
 b=Jqea3Uguzo+pyDZRT5YVA8cYgNQU67O5Ksg7ZhNZZW69c10B8MdZnUH0c/dhcYwEP5
 sbsu3Aei2LANKgfXEqHgfWPK9iE1VVOmRagdocw/QAkN66F+TAtT0+pyjmYAKwltBANY
 o96VgpQ1+hJTexzzLB41u3DOTTVVOGl8JgIvqWDQaAlThs+x2xzlhu3wwcWY+L8rlMXP
 HWz8mG1LZnSf0SzEPr/qcW8f+GTeEMUmTcKLFe82w+/IXcVyv1xy3NLa/ACcfacPISr6
 /65xqW7SfGs34VQEa4fKpKRl6oEQcc+rhdeXx73XyDQYptyt/sLKwlOm+2lbpowUACMs
 fKHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCvDHArUOsvZAy9ghOXjoBGnSe/h2bDeSccE9UEN9ZijSUF44g3cezpyHWL+jBaaaxLRLXjzFI6p7hvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxp+bD0d9f61FhUtbEftya1pbrF06QCFxIDm4Nx+kcwHcaI2zLo
 P/vVSU4gt0X+Hxgi0s+4X+WOTEP1DQxmbVIbKrGR4mECLgzAvttMD73ky1x2sKWo6v6iK1Vvgx4
 HVWKcUnI4TJi3qsVvxm2eABMWvEf6CpovG5Ox
X-Google-Smtp-Source: AGHT+IGUoZte0p19xwWBeSiInV7PcfaUqsGgBPlQ2VYY7m0wFFR9zVxHRono64Qiy0v2wUCnm32xn+uUvVhnGv9x41o=
X-Received: by 2002:a05:6a00:1a8e:b0:710:4d08:e094 with SMTP id
 d2e1a72fcca58-7144573cd07mr11456889b3a.2.1724694090361; Mon, 26 Aug 2024
 10:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-3-jitendra.vegiraju@broadcom.com>
 <0de48667-fe8e-4cd8-a84a-e3e5407c7263@marvell.com>
In-Reply-To: <0de48667-fe8e-4cd8-a84a-e3e5407c7263@marvell.com>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 26 Aug 2024 10:41:18 -0700
Message-ID: <CAMdnO-JSPEkJZLMPL8BLy1DKFUtU4aC_JpaXfs=g5YJFBu4_RQ@mail.gmail.com>
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 2/5] net: stmmac: Add basic dw25gmac
 support to stmmac core
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

SGkgQW1pdCwKCk9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDEwOjE34oCvQU0gQW1pdCBTaW5naCBU
b21hcgo8YW1pdHNpbmdodEBtYXJ2ZWxsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+ID4gVGhlIEJD
TTg5NTh4IHVzZXMgZWFybHkgYWRhcHRvciB2ZXJzaW9uIG9mIERXQ194Z21hYyB2ZXJzaW9uIDQu
MDBhIGZvcgo+ID4gZXRoZXJuZXQgTUFDLiBUaGUgRFcyNUdNQUMgaW50cm9kdWNlZCBpbiB0aGlz
IHZlcnNpb24gYWRkcyBuZXcgRE1BCj4gPiBhcmNoaXRlY3R1cmUgY2FsbGVkIEh5cGVyLURNQSAo
SERNQSkgZm9yIHZpcnR1YWxpemF0aW9uIHNjYWxhYmlsaXR5Lgo+ID4gVGhpcyBpcyByZWFsaXpl
ZCBieSBkZWNvdXBsaW5nIHBoeXNpY2FsIERNQSBjaGFubmVscyhQRE1BKSBmcm9tIHBvdGVudGlh
bGx5Cj4gPiBsYXJnZSBudW1iZXIgb2YgdmlydHVhbCBETUEgY2hhbm5lbHMgKFZETUEpLiBUaGUg
VkRNQXMgYXJlIHNvZnR3YXJlCj4gPiBhYmFzdHJhY3Rpb25zIHRoYXQgbWFwIHRvIFBETUFzIGZv
ciBmcmFtZSB0cmFuc21pc3Npb24gYW5kIHJlY2VwdGlvbi4KPiBZb3Ugc2hvdWxkIGVpdGhlciBy
dW4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QgLS1jb2Rlc3BlbGwKPiAtLXBhdGNo
IG9yIHVzZSA6c2V0IHNwZWxsIGluIHZpIHRvIGNoZWNrIGZvciBzcGVsbGluZyBtaXN0YWtlcwoK
VGhhbmsgeW91LCBJIHdpbGwgZG8gdGhhdCBuZXh0IHRpbWUuCgo+ID4gK3N0YXRpYyB1MzIgZGVj
b2RlX3ZkbWFfY291bnQodTMyIHJlZ3ZhbCkKPiA+ICt7Cj4gPiArICAgICAvKiBjb21wcmVzc2Vk
IGVuY29kaW5nIGZvciB2ZG1hIGNvdW50Cj4gPiArICAgICAgKiByZWd2YWw6IFZETUEgY291bnQK
PiA+ICsgICAgICAqIDAtMTUgIDogMSAtIDE2Cj4gPiArICAgICAgKiAxNi0xOSA6IDIwLCAyNCwg
MjgsIDMyCj4gPiArICAgICAgKiAyMC0yMyA6IDQwLCA0OCwgNTYsIDY0Cj4gPiArICAgICAgKiAy
NC0yNyA6IDgwLCA5NiwgMTEyLCAxMjgKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgaWYgKHJlZ3Zh
bCA8IDE2KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmVndmFsICsgMTsKPiA+ICsgICAgIHJl
dHVybiAoNCA8PCAoKHJlZ3ZhbCAtIDE2KSAvIDQpKSAqICgocmVndmFsICUgNCkgKyA1KTsKPiBJ
cyB0aGVyZSBhIHBvdGVudGlhbCBmb3IgcmVndmFsIHRvIGJlIG91dCBvZiBib3VuZHMgKHJlZ3Zh
bCA+IDI3KSAgdGhhdAo+IG5lZWRlZCB0byBiZSBoYW5kbGVkIHByb3Blcmx5PwoKVGhlIElQIGNv
cmUgZG9jdW1lbnRhdGlvbiB3ZSBoYXZlIG9ubHkgZGVmaW5lcyBzdXBwb3J0IHVwdG8gMTI4IFZE
TUFzLgpUaGUgc2FtZSBmb3JtdWxhIHNob3VsZCBmb3IgaGlnaGVyIHZhbHVlcyAoYm91bmQgYnkg
Yml0bWFzaykuCgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3MjVnbWFjLmggYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
dzI1Z21hYy5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li5jN2ZkZjY2MjRmZWEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3MjVnbWFjLmgKPiA+IEBAIC0wLDAgKzEsOTAgQEAKPiA+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiArLyogQ29w
eXJpZ2h0IChjKSAyMDI0IEJyb2FkY29tIENvcnBvcmF0aW9uCj4gPiArICogRFcyNUdNQUMgZGVm
aW5pdGlvbnMuCj4gPiArICovCj4gPiArCj4gPiArI2RlZmluZSBYWFZHTUFDX0FERFJfT0ZGU0VU
ICAgICAgICAgIEdFTk1BU0soMTQsIDgpCj4gPiArI2RlZmluZSBYWFZHTUFDX0FVVE9fSU5DUiAg
ICAgICAgICAgIEdFTk1BU0soNSwgNCkKPiA+ICsjZGVmaW5lIFhYVkdNQUNfQ01EX1RZUEUgICAg
ICAgICAgICAgICAgICAgICBCSVQoMSkKPiA+ICsjZGVmaW5lIFhYVkdNQUNfT0IgICAgICAgICAg
ICAgICAgICAgQklUKDApCj4gPiArI2RlZmluZSBYWFZHTUFDX0RNQV9DSF9JTkRfREFUQSAgICAg
ICAgICAgICAgMFgwMDAwMzA4NAo+IG5pdDogbG93ZXIgY2FzZSBwbGVhc2UsIDB4MDAwMDMwODQu
CgpUaGFua3MsIHdpbGwgZml4IGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
