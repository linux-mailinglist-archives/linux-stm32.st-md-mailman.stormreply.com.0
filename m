Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321AC9BBB8D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5338C7A852;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5961FC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 19:01:06 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb5638dd57so31605171fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Nov 2024 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730660465; x=1731265265;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sY4A+T6RqHEnnohZAogeCURTdPYG3z7nSaBdYQpTNlM=;
 b=BZvM57WiDzx7xu8WpX4p5s4tWjagzBKTSL/7wExRIYlAYWo1v05Xk/WWU8NxtXZtpS
 JWZqxPPsBaAra+URgyeF58GF+lrGTz7OjDjS0ln7v78Ke5sOy3O+fu6N92yo6+n9rzyG
 7S6aOHc1o3/pHBBqj8CRsgJNqU5qXyhWUeLFao9IfV724XL/OSOqJ6JETahjhK84tz97
 WmotryQTRcYT8NbdGlL6JL1wxs6OmyKSQF17SHmhBoHrLuCu/72IABCkTOC5prj/uTeQ
 fRyBiTBrzksFpzhaa1DUbv5VXRfqhnH3CsC7tkmIhfP/p9/BlNvWXWbSUApfrUvPbVJY
 Rk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730660465; x=1731265265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sY4A+T6RqHEnnohZAogeCURTdPYG3z7nSaBdYQpTNlM=;
 b=b5+kw7eC1c042Qw+c/WrOxWLKyc1VadErhH3DtYQVv9AG0um/8DMq09aVZC2HzWFOO
 KkMV9/RRs72qrOS9342QUKjp9esGC1uSVX9QVk8R+bJBHycLcd2FM8PYWz/IVxu5xYBK
 9QsIzLBtyfiY0n82Gu/EcX0BVM3kWcz9mLVLcUYuMgvDm83CDos24hzUXEj+HzhOLb+L
 jVIq+PDmpi1XU6LktRIQM9DgcyktDNVzMCo8sTa3tRCSrwJXivLfJKqfZK8Bjf4j4XrA
 1OXdtOBbWO6OJXK/X+pPt55InNsrr/JhRX3SrbMzw0l+tXvmbfsF+q6xSi2aWda++fhV
 +EOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv1fNG7YL8Qhw5zBtzB3lJ+ZTg1HNMPY3IcEY47xAXKFrlBsfhN0OUDzQgi00t4OgaCRUYHRF5w4qNLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjUhMc+nQoYwmqvRGECtapcagWi3lczyqWPCjktyLLseUWSahn
 QHR/nf5afWZukTdsWoixbq2vR12yXsST5bCNFCK8cJqiEPqsKG7sRiKd0N0ALg+TPPxS9CjNCn7
 LP4gxKBloSLLAFdc+H/ISSpJlPQ==
X-Google-Smtp-Source: AGHT+IE51hefYOe5xiZP51bcZsQgIVA1y18RQ54UhBWiTXSEaDmaXWZuzRMyPOLYfnY5HJkrGKV6WAz/1UPB2tYCDoM=
X-Received: by 2002:a2e:bc15:0:b0:2fb:6181:8ca1 with SMTP id
 38308e7fff4ca-2fcbdf5f91emr154565771fa.6.1730660465205; Sun, 03 Nov 2024
 11:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
In-Reply-To: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 3 Nov 2024 21:00:54 +0200
Message-ID: <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
To: cathycai0714@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: Tomer Maimon <tmaimon77@gmail.com>, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, Arias Pablo <Pablo_Arias@dell.com>,
 romain.gantois@bootlin.com, zhiguo.niu@unisoc.com, cixi.geng1@unisoc.com,
 cathy.cai@unisoc.com, kuba@kernel.org, pabeni@redhat.com,
 Alexandre Torgue <alexandre.torgue@st.com>, uri.trichter@nuvoton.com,
 xuewen.yan94@gmail.com, wade.shu@unisoc.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Network Development <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Silva,
 L Antonio" <Luis.A.Silva@dell.com>, Murali <murali.somarouthu@dell.com>,
 mcoquelin.stm32@gmail.com, David Miller <davem@davemloft.net>,
 Somarouthu Murali <Murali_Somarouthu@dell.com>
Subject: Re: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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

SGkgYWxsLAoKV2UgcmVjZW50bHkgZW5jb3VudGVyZWQgdGhlIHNhbWUgaW50ZXJydXB0IHN0b3Jt
IGFuZCB0aGUgcm9vdCBjYXVzZQp3YXMgdGhlIHNhbWUgYXMgaGVyZS4KVGhlIHN1Z2dlc3RlZCBw
YXRjaCBzb2x2ZWQgOTklIG9mIHRoZSBpc3N1ZXMsIGJ1dCBpbmRlZWQgYXMgd3JpdHRlbgpiZWxv
dyBvbiByYXJlIGNhc2VzIHRoZSBpc3N1ZSBoYXBwZW5zIGJldHdlZW4gdGhlIGRldl9vcGVuKCkg
YW5kCmNsZWFyX2JpdChTVE1NQUNfRE9XTikgY2FsbHMuCkkgYWxzbyBhZ3JlZSB0aGF0IHN0bW1h
Y19pbnRlcnJ1cHQoKSB1bmNvbmRpdGlvbmFsbHkgaWdub3JlcwppbnRlcnJ1cHRzIHdoZW4gdGhl
IGRyaXZlciBpcyBpbiBTVE1NQUNfRE9XTiBzdGF0ZSBpcyBkYW5nZXJvdXMuCgpUaGUgaXNzdWUg
aGFwcGVuZWQgZm9yIHVzIGluIGxpbnV4IDUuMTAgYnV0IEkgc2VlIHRoYXQgdGhpcyBiZWhhdmlv
dXIKd2Fzbid0IGNoYW5nZWQgYWxzbyBpbiBuZXdlciB2ZXJzaW9ucy4KbWF5YmUgd2Ugc2hvdWxk
IGRpc2FibGUgdGhlIGRldmljZSBpbnRlcnJ1cHRzIGJlZm9yZSBkZXZfY2xvc2UoKSwgYW5kCmVu
YWJsZSBpdCBhZnRlciBkZXZfb3BlbigpLgoKPgo+IEhpIFJvbWFpbiwKPgo+IE9uIFN1biwgTWFy
IDMxLCAyMDI0IGF0IDQ6MzXigK9QTSBSb21haW4gR2FudG9pcwo+IDxyb21haW4uZ2FudG9pc0Bi
b290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8gQ2F0aHksCj4gPgo+ID4gT24gV2VkLCAy
NyBNYXIgMjAyNCwgQ2F0aHkgQ2FpIHdyb3RlOgo+ID4KPiA+ID4gVHggcXVldWUgdGltZSBvdXQg
dGhlbiByZXNldCBhZGFwdGVyLiBXaGVuIHJlc2V0IHRoZSBhZGFwdGVyLCBzdG1tYWMgZHJpdmVy
Cj4gPiA+IHNldHMgdGhlIHN0YXRlIHRvIFNUTU1BQ19ET1dOIGFuZCBjYWxscyBkZXZfY2xvc2Uo
KSBmdW5jdGlvbi4gSWYgYW4gaW50ZXJydXB0Cj4gPiA+IGlzIHRyaWdnZXJlZCBhdCB0aGlzIGlu
c3RhbnQgYWZ0ZXIgc2V0dGluZyBzdGF0ZSB0byBTVE1NQUNfRE9XTiwgYmVmb3JlIHRoZQo+ID4g
PiBkZXZfY2xvc2UoKSBjYWxsLgo+ID4gPgo+ID4gLi4uCj4gPiA+IC0gICAgIHNldF9iaXQoU1RN
TUFDX0RPV04sICZwcml2LT5zdGF0ZSk7Cj4gPiA+ICAgICAgIGRldl9jbG9zZShwcml2LT5kZXYp
Owo+ID4gPiArICAgICBzZXRfYml0KFNUTU1BQ19ET1dOLCAmcHJpdi0+c3RhdGUpOwo+ID4gPiAg
ICAgICBkZXZfb3Blbihwcml2LT5kZXYsIE5VTEwpOwo+ID4gPiAgICAgICBjbGVhcl9iaXQoU1RN
TUFDX0RPV04sICZwcml2LT5zdGF0ZSk7Cj4gPiA+ICAgICAgIGNsZWFyX2JpdChTVE1NQUNfUkVT
RVRJTkcsICZwcml2LT5zdGF0ZSk7Cj4gPgo+ID4gSWYgdGhpcyBJUlEgaXNzdWUgY2FuIGhhcHBl
biB3aGVuZXZlciBTVE1NQUNfRE9XTiBpcyBzZXQgd2hpbGUgdGhlIG5ldCBkZXZpY2UgaXMKPiA+
IG9wZW4sIHRoZW4gaXQgY291bGQgYWxzbyBoYXBwZW4gYmV0d2VlbiB0aGUgZGV2X29wZW4oKSBh
bmQKPiA+IGNsZWFyX2JpdChTVE1NQUNfRE9XTikgY2FsbHMgcmlnaHQ/IFNvIHlvdSdkIGhhdmUg
dG8gY2xlYXIgU1RNTUFDX0RPV04gYmVmb3JlCj4gPiBjYWxsaW5nIGRldl9vcGVuKCkgYnV0IHRo
ZW4gSSBkb24ndCBzZWUgdGhlIHVzZWZ1bG5lc3Mgb2Ygc2V0dGluZyBTVE1NQUNfRE9XTgo+ID4g
YW5kIGNsZWFyaW5nIGl0IGltbWVkaWF0ZWx5LiBNYXliZSBjbG9zaW5nIGFuZCBvcGVuaW5nIHRo
ZSBuZXQgZGV2aWNlIHNob3VsZCBiZQo+ID4gZW5vdWdoPwpJbmRlZWQgd2UgZW5jb3VudGVyIGFu
IGlzc3VlIGJldHdlZW4gdGhlIGRldl9vcGVuKCkgYW5kIGNsZWFyX2JpdChTVE1NQUNfRE9XTiku
Lgo+ID4KPiAgWWVzLiBJdCBjb3VsZCBhbHNvIGhhcHBlbiBiZXR3ZWVuIHRoZSBkZXZfb3Blbigp
IGFuZAo+IGNsZWFyX2JpdChTVE1NQUNfRE9XTikgY2FsbHMuCj4gQWx0aG91Z2ggd2UgZGlkIG5v
dCByZXByb2R1Y2UgdGhpcyBzY2VuYXJpbywgaXQgc2hvdWxkIGhhdmUgaGFwcGVuZWQKPiBpZiB3
ZSBoYWQgaW5jcmVhc2VkCj4gdGhlIG51bWJlciBvZiB0ZXN0IHNhbXBsZXMuIEluIGFkZGl0aW9u
LCBJIGZvdW5kIHRoYXQgb3RoZXIgcGVvcGxlIGhhZAo+IHNpbWlsYXIgcHJvYmxlbXMgYmVmb3Jl
Lgo+IFRoZSBsaW5rIGlzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDIwODE0
MDgyMC4xMDQxMC0xMS1TZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ryb25pY3MucnUvCj4KPiA+Cj4g
PiBNb3Jlb3ZlciwgaXQgc2VlbXMgc3RyYW5nZSB0byBtZSB0aGF0IHN0bW1hY19pbnRlcnJ1cHQo
KSB1bmNvbmRpdGlvbm5hbGx5Cj4gPiBpZ25vcmVzIGludGVycnVwdHMgd2hlbiB0aGUgZHJpdmVy
IGlzIGluIFNUTU1BQ19ET1dOIHN0YXRlLiBUaGlzIHNlZW1zIGxpa2UKPiA+IGRhbmdlcm91cyBi
ZWhhdmlvdXIsIHNpbmNlIGl0IGNvdWxkIGNhdXNlIElSUSBzdG9ybSBpc3N1ZXMgd2hlbmV2ZXIg
c29tZXRoaW5nCj4gPiBpbiB0aGUgZHJpdmVyIHNldHMgdGhpcyBzdGF0ZS4gSSdtIG5vdCB0b28g
ZmFtaWxpYXIgd2l0aCB0aGUgaW50ZXJydXB0IGhhbmRsaW5nCj4gPiBpbiB0aGlzIGRyaXZlciwg
YnV0IG1heWJlIHN0bW1hY19pbnRlcnJ1cHQoKSBjb3VsZCBjbGVhciBpbnRlcnJ1cHRzCj4gPiB1
bmNvbmRpdGlvbm5hbGx5IGluIHRoZSBTVE1NQUNfRE9XTiBzdGF0ZT8KPiA+Cj4gQ2xlYXIgaW50
ZXJydXB0cyB1bmNvbmRpdGlvbmFsbHkgaW4gdGhlIFNUTU1BQ19ET1dOIHN0YXRlIGRpcmVjdGx5
Cj4gY2VydGFpbmx5IHdvbid0IGNhdXNlIHRoaXMgcHJvYmxlbS4KPiBUaGlzIG1heSBiZSB0b28g
cm91Z2gsIG1heWJlIHRoaXMgZGVzaWduIGhhcyBvdGhlciBjb25zaWRlcmF0aW9ucy4KPgpCdXQg
dGhlbiBhZnRlciB0aGUgZGV2X29wZW4oKSB5b3UgbWlnaHQgbWlzcyBpbnRlcnJ1cHQsIG5vPwo+
ID4KPiA+IEJlc3QgUmVnYXJkcywKPiA+Cj4gPiAtLQo+ID4gUm9tYWluIEdhbnRvaXMsIEJvb3Rs
aW4KPiA+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiA+IGh0dHBzOi8v
Ym9vdGxpbi5jb20KPgo+ICBCZXN0IFJlZ2FyZHMsCj4gQ2F0aHkKCgoKLS0gClJlZ2FyZHMsCkF2
aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
