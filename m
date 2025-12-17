Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E3CC6AED
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 10:02:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC13C597BF;
	Wed, 17 Dec 2025 09:02:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B16DCC1A97B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 09:02:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 496236018C;
 Wed, 17 Dec 2025 09:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8E2C19421;
 Wed, 17 Dec 2025 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765962140;
 bh=TqhCN05lIjCwKdoNH7O27Ib5W/fzrsm853qYAbg7qEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mvAWqDTYEQLPIjasUrs0D/Ze97eatlfyL0mi6O0MGmE1SvVn8YHYiQ1hDIZZ4oE8K
 aFHFHT2tvqpmtTdxeiwwsKJeoEVwVelMoe4qdWjAQvcLtXTPchbIZ+ReSJGYbTCzr1
 qqsGRlLlswi0jMZNei2mTasXnvX0lpJbqMF7UmTpaAoqX1N9T1UOPYMMpKw8Gfqhqh
 UjNPCvimUrrUtTiIKv9N5Ccmev+XKHhu1cfOPYdPmfSUBm4ahYUsPiFyqCCGB8H6UA
 JpzEUlNfSO+k+Tl5V8osBsBwXeYIjSzePF5a/zlMumvvZfIBKHX3GrTd0HYyuz9UeN
 OzpkhIbfzPmTw==
Date: Wed, 17 Dec 2025 14:32:02 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aUJxiioKnDVSC34H@sumit-xelite>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
 <aUJh--HGVeJWIilS@sumit-xelite>
 <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-security-module@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Olivia Mackall <olivia@selenic.com>, Michael Chan <michael.chan@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 linux-integrity@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead
 of driver callbacks
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

T24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMDk6MjE6NDFBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8gU3VtaXQsCj4gCj4gT24gV2VkLCBEZWMgMTcsIDIwMjUgYXQgMDE6
MjU6MzlQTSArMDUzMCwgU3VtaXQgR2FyZyB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDE2LCAyMDI1
IGF0IDEyOjA4OjM4UE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIERlYyAxNiwgMjAyNSBhdCAwMTowODozOFBNICswNTMwLCBTdW1pdCBHYXJnIHdyb3RlOgo+
ID4gPiA+IE9uIE1vbiwgRGVjIDE1LCAyMDI1IGF0IDM6MDLigK9QTSBVd2UgS2xlaW5lLUvDtm5p
Zwo+ID4gPiA+IDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+ID4gPiA+
ICAtIFdoeSBkb2VzIG9wdGVlX3Byb2JlKCkgaW4gZHJpdmVycy90ZWUvb3B0ZWUvc21jX2FiaS5j
IHVucmVnaXN0ZXIgYWxsCj4gPiA+ID4gPiAgICBvcHRlZSBkZXZpY2VzIGluIGl0cyBlcnJvciBw
YXRoIChvcHRlZV91bnJlZ2lzdGVyX2RldmljZXMoKSk/Cj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBp
cyBtb3N0bHkgdG8gdGFrZSBjYXJlIG9mIGlmIGFueSBkZXZpY2UgZ290IHJlZ2lzdGVyZWQgYmVm
b3JlIHRoZQo+ID4gPiA+IGZhaWx1cmUgb2NjdXJlZC4gTGV0IG1lIGtub3cgaWYgeW91IGhhdmUg
YSBiZXR0ZXIgd2F5IHRvIGFkZHJlc3MgdGhhdC4KPiA+ID4gCj4gPiA+IFdpdGhvdXQgdW5kZXJz
dGFuZGluZyB0aGUgdGVlIHN0dWZmLCBJJ2Qgc2F5OiBEb24ndCBib3RoZXIgYW5kIG9ubHkgdW5k
bwo+ID4gPiB0aGUgdGhpbmdzIHRoYXQgcHJvYmUgZGlkIGJlZm9yZSB0aGUgZmFpbHVyZS4KPiA+
IAo+ID4gVHJ1ZSwgYnV0IHRoaXMgaXMgc3BlY2lhbCBjYXNlIHdoZXJlIGlmIHRoZXJlIGlzIGFu
eSBsZWZ0b3ZlciBkZXZpY2UKPiA+IHJlZ2lzdGVyZWQgZnJvbSB0aGUgVEVFIGltcGxlbWVudGF0
aW9uIHRoZW4gaXQgaXMgbGlrZWx5IGdvaW5nIHRvIGNhdXNlCj4gPiB0aGUgY29ycmVzcG9uZGlu
ZyBrZXJuZWwgY2xpZW50IGRyaXZlciBjcmFzaC4KPiAKPiBZb3UgYXJlIGF3YXJlIHRoYXQgdGhp
cyBpcyByYWN5PyBTbyBpZiBhIGRyaXZlciBjcmFzaGVzIGUuZy4gYWZ0ZXIKPiB0ZWVkZXZfY2xv
c2VfY29udGV4dCgpIGl0IG1pZ2h0IGhhcHBlbiB0aGF0IGl0IGlzIHJlZ2lzdGVyZWQganVzdCBh
ZnRlcgo+IG9wdGVlX3VucmVnaXN0ZXJfZGV2aWNlcygpIHJldHVybnMuCj4gCgpJIHNlZSB5b3Vy
IHBvaW50IGFib3V0IHRoZSB1bmF2b2lkYWJsZSByYWNlLiBNYXliZSBpdCdzIGJldHRlciB0byBu
b3QKdHJ5IGFueXRoaW5nIGFuZCBsZXQgdGhlIGtlcm5lbCBjbGllbnQgZHJpdmVyIGZhaWwuCgot
U3VtaXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
