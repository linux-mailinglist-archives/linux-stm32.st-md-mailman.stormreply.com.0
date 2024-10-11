Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F719995EC
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2024 02:01:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 796C2C71290;
	Fri, 11 Oct 2024 00:01:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144EFC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 00:01:26 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539908f238fso1822315e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 17:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728604885; x=1729209685;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QR7eQHErdNfHLZS6BtpfLJOhVgMy01okWLFsgrPJ2+w=;
 b=j684nSM61dCllvDyZDwsdyYcyL9QoYWh01iNIQUX0zjPRz0llsAicinbYddJsu48FD
 uUzhnwpPJ25ktDJpPeaUubpcDwnw72V0aBd+yZmEfxbnq/yPlupFBeBFeRGv1tZcvY89
 qblxaiuDnHPK1UD57233qfg+E2O9V7D07+KMxRUq21Vo7J2343CDWlcHpI8cLPMkzc9/
 83DEiYEaDSKZOt4nvXeRqvgv1+Xr7JEF5iWgsAbsyyCw9Q4Av7+5oxHJeusyY91TX4Z7
 jclAmyAK7pbGTs2xTRyvH2SPudt+kWln35hXrOL8B8kP5HMPn+3TcsD69pw8NSF8O1Xe
 M4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728604885; x=1729209685;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QR7eQHErdNfHLZS6BtpfLJOhVgMy01okWLFsgrPJ2+w=;
 b=pcAWTw1LAoARLsQMIesKLq/GaaUdNaymH43pgJdJV41+JghMJYZmTuywS1yGU1gUcP
 5GPNvPxiFIHDLnfqqhBpkNf3ahYZS7S2c783luW0hd992tycUK2L40n1M+w/uTE/nZAG
 3g1jqcXpy/HPyVSsEowBIbuX7UipmLIMuLndbA/9+wx/t82ZEVcONYp/YNzL9bpE2XtK
 sH4Yrf/KuVD1nK8qcEzby7ADBp65sGbQYWtkDBu12dbdmlTmMGqKq9ariCrmjy9LTRYJ
 sqFbkzE6Q0IywpK5SwD2InwwR32Z0NlhaDdut5KSEn0bAt9KvBeXMnwQU6ckWQRBkYsI
 B86w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/kc99S39x7e5kZQYGnW2tO6u91pu9mElPE70aM74VaphP5B8My346gIk0jCIv5BzypAH4zi4FdlYarA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfzGj5/k+vqsuR33YLKYas8WCK2wV+dMuXlCDsdvjN5HUm/EZB
 gNo0bo2RCY9K85yV9nBfiT6SPcxuFbYLXQiYKeepqddxTqL1InuY
X-Google-Smtp-Source: AGHT+IE4cooIMQfC+OmH1uy5ckkJ9Tp1lCSmPVvSLo7PeJxTYUKT/COn7zRsZE/36GgHwgQ8ylic2w==
X-Received: by 2002:ac2:4c43:0:b0:536:7cfb:6998 with SMTP id
 2adb3069b0e04-539da4e1f18mr271377e87.35.1728604884838; 
 Thu, 10 Oct 2024 17:01:24 -0700 (PDT)
Received: from mobilestation ([85.249.18.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8d7fadsm424885e87.169.2024.10.10.17.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 17:01:23 -0700 (PDT)
Date: Fri, 11 Oct 2024 03:01:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <wufpbnsa7w4bk57drsjywnbz2di63yfn7qrmkxfmdh57zuoaeh@6j4xgyonjy6l>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <20240904054815.1341712-3-jitendra.vegiraju@broadcom.com>
 <mhfssgiv7unjlpve45rznyzr72llvchcwzk4f7obnvp5edijqc@ilmxqr5gaktb>
 <CAMdnO-+CcCAezDXLwTe7fEZPQH6_B1zLD2g1J6uWiKi12vOxzg@mail.gmail.com>
 <CAMdnO-JZ2crBaOEtvgMupQs7nTZ8r0_7TTQdX3B3n6F_owAMZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-JZ2crBaOEtvgMupQs7nTZ8r0_7TTQdX3B3n6F_owAMZA@mail.gmail.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/5] net: stmmac: Add basic
 dw25gmac support in stmmac core
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

SGkgSml0ZW5kcmEKCk9uIEZyaSwgT2N0IDA0LCAyMDI0IGF0IDA5OjA1OjM2QU0gR01ULCBKaXRl
bmRyYSBWZWdpcmFqdSB3cm90ZToKPiBIaSBTZXJnZSwKPiAKPiBPbiBNb24sIFNlcCAxNiwgMjAy
NCBhdCA0OjMy4oCvUE0gSml0ZW5kcmEgVmVnaXJhanUKPiA8aml0ZW5kcmEudmVnaXJhanVAYnJv
YWRjb20uY29tPiB3cm90ZToKPiA+Cj4gLi4uCj4gCj4gV2hlbiB5b3UgZ2V0IGEgY2hhbmNlLCBJ
IHdvdWxkIGxpa2UgdG8gZ2V0IHlvdXIgaW5wdXQgb24gdGhlIGFwcHJvYWNoIHdlIG5lZWQKPiB0
byB0YWtlIHRvIGluY3JlbWVudGFsbHkgYWRkIGR3MjVnbWFjIHN1cHBvcnQuCj4gCj4gSW4gdGhl
IGxhc3QgY29udmVyc2F0aW9uIHRoZXJlIHdlcmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBhcm91bmQg
dGhlIGNhc2Ugb2YKPiBpbml0aWFsaXppbmcgdW51c2VkIFZETUEgY2hhbm5lbHMgYW5kIHJlbGF0
ZWQgY29tYmluYXRpb24gc2NlbmFyaW9zLgo+IAo+IFRoZSBoZG1hIG1hcHBpbmcgcHJvdmlkZXMg
ZmxleGliaWxpdHkgZm9yIHZpcnR1YWxpemF0aW9uLiBIb3dldmVyLCBvdXIKPiBTb0MgZGV2aWNl
IGNhbm5vdCB1c2UgYWxsIFZETUFzIHdpdGggb25lIFBDSSBmdW5jdGlvbi4gVGhlIFZETUFzIGFy
ZQo+IHBhcnRpdGlvbmVkIGZvciBTUklPViB1c2UgaW4gdGhlIGZpcm13YXJlLiBUaGlzIFNvQyBk
ZWZhdWx0cyB0byA4IGZ1bmN0aW9ucwo+IHdpdGggNCBWRE1BIGNoYW5uZWxzIGVhY2guIFRoZSBp
bml0aWFsIGVmZm9ydCBpcyB0byBzdXBwb3J0IG9uZSBQQ0kgcGh5c2ljYWwKPiBmdW5jdGlvbiB3
aXRoIDQgVkRNQSBjaGFubmVscy4KPiBBbHNvLCBjdXJyZW50bHkgdGhlIHN0bW1hYyBkcml2ZXIg
aGFzIGluZmVycmVkIG9uZS10by1vbmUgcmVsYXRpb24gYmV0d2Vlbgo+IG5ldGlmIGNoYW5uZWxz
IGFuZCBwaHlzaWNhbCBETUFzLiBJdCB3b3VsZCBiZSBhIGNvbXBsZXggY2hhbmdlIHRvIHN1cHBv
cnQKPiBlYWNoIFZETUEgYXMgaXRzIG93biBuZXRpZiBjaGFubmVsIGFuZCBtYXBwaW5nIGZld2Vy
IHBoeXNpY2FsIERNQXMuCj4gSGVuY2UsIGZvciBpbml0aWFsIHN1Ym1pc3Npb24gb25lLXRvLW9u
ZSBtYXBwaW5nIGlzIGFzc3VtZWQuCj4gCj4gQXMgeW91IG1lbnRpb25lZCwgYSBzdGF0aWMgb25l
LXRvLW9uZSBtYXBwaW5nIG9mIFZETUEtVEMtUERNQSBkb2Vzbid0Cj4gcmVxdWlyZSB0aGUgYWRk
aXRpb25hbCBjb21wbGV4aXR5IG9mIG1hbmFnaW5nIHRoZXNlIG1hcHBpbmdzIGFzIHByb3Bvc2Vk
Cj4gaW4gdGhlIGN1cnJlbnQgcGF0Y2ggc2VyaWVzIHdpdGggKnN0cnVjdCBzdG1tYWNfaGRtYV9j
ZmcqLgo+IAo+IFRvIGludHJvZHVjZSBkdzI1Z21hYyBpbmNyZW1lbnRhbGx5LCBJIGFtIHRoaW5r
aW5nIG9mIHR3byBhcHByb2FjaGVzLAo+ICAgMS4gVGFrZSB0aGUgY3VycmVudCBwYXRjaCBzZXJp
ZXMgZm9yd2FyZCB1c2luZyAqc3RydWN0IHN0bW1hY19oZG1hX2NmZyosCj4gICAgICBrZWVwaW5n
IHRoZSB1bnVzZWQgVkRNQXMgaW4gZGVmYXVsdCBzdGF0ZS4gV2UgbmVlZCB0byBmaXggdGhlCj4g
aW5pdGlhbGl6YXRpb24KPiAgICAgIGxvb3BzIHRvIG9ubHkgaW5pdGlhbGl6ZSB0aGUgVkRNQSBh
bmQgUERNQXMgYmVpbmcgdXNlZC4KCj4gICAyLiBTaW1wbGlmeSB0aGUgaW5pdGlhbCBwYXRjaCBi
eSByZW1vdmluZyAqc3RydWN0IGhkbWFfY2ZnKiBmcm9tIHRoZSBwYXRjaAo+ICAgICAgc2VyaWVz
IGFuZCBzdGlsbCB1c2Ugc3RhdGljIFZETUEtVEMtUERNQSBtYXBwaW5nLgo+IFBsZWFzZSBzaGFy
ZSB5b3VyIHRob3VnaHRzLgo+IElmIGl0IGhlbHBzLCBJIGNhbiBzZW5kIHBhdGNoIHNlcmllcyB3
aXRoIG9wdGlvbiAyIGFib3ZlIGFmdGVyCj4gYWRkcmVzc2luZyBhbGwgb3RoZXIKPiByZXZpZXcg
Y29tbWVudHMuCgpJTU8gYXBwcm9hY2ggMiBzZWVtcyBtb3JlIHByZWZlcmFibGUuIFBsZWFzZSBm
aW5kIG15IGNvbW1lbnRzIHRvIHlvdXIKcHJldmlvdXMgZW1haWwgaW4gdGhpcyB0aHJlYWQ6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi9zbjVlcGRsNGpkd2o0dDZtbzU1dzRwb3o2dmtk
Y3V6Y2VlenNtcGI3NDQ3aG1hajJvdEBnbWx4c3Q3Z2RjaXgvCgo+IAo+IEFwcHJlY2lhdGUgeW91
ciBndWlkYW5jZSEKCkFsd2F5cyB3ZWxjb21lLiBUaGFuayB5b3UgZm9yIHN1Ym1pdHRpbmcgdGhl
IHBhdGNoZXMgYW5kIHlvdXIgcGF0aWVuY2UKdG8gcHJvY2VlZCB3aXRoIHRoZSByZXZpZXcgcHJv
Y2Vzcy4KCi1TZXJnZSh5KQoKPiAtSml0ZW5kcmEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
