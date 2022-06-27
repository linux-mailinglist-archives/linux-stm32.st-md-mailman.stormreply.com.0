Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D355BBA0
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 20:35:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B395EC04003;
	Mon, 27 Jun 2022 18:35:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23403C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 18:35:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA6C61578;
 Mon, 27 Jun 2022 18:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D52C3411D;
 Mon, 27 Jun 2022 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656354918;
 bh=lSduwLf0URPGJXhzE2uMPDSka0BN2NuObX6s6wiVjLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1wgnhWIBSxTWZs7oVLQcgu6ow7j/nvOHPvXzsT1Nn9X7hdwGhqh7NAL8uHaamcIf
 IY07sAxOhUQqndCnsaxA3ScC1kTdg2Yn9hsnKIlxq8rxFKlV7RaY+NRmyVh3m75Tb8
 ZpcqX4hfVCDBy0N1EVQnXiwwX9rIvnnkMDcCS04gZPnAV3H3k5TZVX9FzOMlpLx209
 8O1zovzb/AU8MtbMYOdG7MyCPnmJKw+tFasJC0wEQpVPIKC5aCfVMO84EEc2E/4TTl
 9dxSDJTazopgz1hOdfhMFc0UNVAF149+GJwdJJ2/y5zxk6J7RR9WnMOk8pk02PIKf/
 G0d/RZr8PVXzA==
Date: Mon, 27 Jun 2022 20:35:13 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <20220627183513.GA137875@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, Kees Cook <keescook@chromium.org>,
 intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 virtualization@lists.linux-foundation.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMDg6Mjc6MzdQTSArMDIwMCwgRGFuaWVsIEJvcmttYW5u
IHdyb3RlOgo+IE9uIDYvMjcvMjIgODowNCBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToK
PiA+IFRoZXJlIGlzIGEgcmVndWxhciBuZWVkIGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdh
eSB0byBkZWNsYXJlCj4gPiBoYXZpbmcgYSBkeW5hbWljYWxseSBzaXplZCBzZXQgb2YgdHJhaWxp
bmcgZWxlbWVudHMgaW4gYSBzdHJ1Y3R1cmUuCj4gPiBLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlz
IHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+ID4gY2FzZXMu
IFRoZSBvbGRlciBzdHlsZSBvZiBvbmUtZWxlbWVudCBvciB6ZXJvLWxlbmd0aCBhcnJheXMgc2hv
dWxkCj4gPiBubyBsb25nZXIgYmUgdXNlZFsyXS4KPiA+IAo+ID4gVGhpcyBjb2RlIHdhcyB0cmFu
c2Zvcm1lZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGU6Cj4gPiAobGludXgtNS4xOS1yYzIk
IHNwYXRjaCAtLWpvYnMgJChnZXRjb25mIF9OUFJPQ0VTU09SU19PTkxOKSAtLXNwLWZpbGUgc2Ny
aXB0LmNvY2NpIC0taW5jbHVkZS1oZWFkZXJzIC0tZGlyIC4gPiBvdXRwdXQucGF0Y2gpCj4gPiAK
PiA+IEBACj4gPiBpZGVudGlmaWVyIFMsIG1lbWJlciwgYXJyYXk7Cj4gPiB0eXBlIFQxLCBUMjsK
PiA+IEBACj4gPiAKPiA+IHN0cnVjdCBTIHsKPiA+ICAgIC4uLgo+ID4gICAgVDEgbWVtYmVyOwo+
ID4gICAgVDIgYXJyYXlbCj4gPiAtIDAKPiA+ICAgIF07Cj4gPiB9Owo+ID4gCj4gPiAtZnN0cmlj
dC1mbGV4LWFycmF5cz0zIGlzIGNvbWluZyBhbmQgd2UgbmVlZCB0byBsYW5kIHRoZXNlIGNoYW5n
ZXMKPiA+IHRvIHByZXZlbnQgaXNzdWVzIGxpa2UgdGhlc2UgaW4gdGhlIHNob3J0IGZ1dHVyZToK
PiA+IAo+ID4gLi4vZnMvbWluaXgvZGlyLmM6MzM3OjM6IHdhcm5pbmc6ICdzdHJjcHknIHdpbGwg
YWx3YXlzIG92ZXJmbG93OyBkZXN0aW5hdGlvbiBidWZmZXIgaGFzIHNpemUgMCwKPiA+IGJ1dCB0
aGUgc291cmNlIHN0cmluZyBoYXMgbGVuZ3RoIDIgKGluY2x1ZGluZyBOVUwgYnl0ZSkgWy1XZm9y
dGlmeS1zb3VyY2VdCj4gPiAJCXN0cmNweShkZTMtPm5hbWUsICIuIik7Cj4gPiAJCV4KPiA+IAo+
ID4gU2luY2UgdGhlc2UgYXJlIGFsbCBbMF0gdG8gW10gY2hhbmdlcywgdGhlIHJpc2sgdG8gVUFQ
SSBpcyBuZWFybHkgemVyby4gSWYKPiA+IHRoaXMgYnJlYWtzIGFueXRoaW5nLCB3ZSBjYW4gdXNl
IGEgdW5pb24gd2l0aCBhIG5ldyBtZW1iZXIgbmFtZS4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vZW4u
d2lraXBlZGlhLm9yZy93aWtpL0ZsZXhpYmxlX2FycmF5X21lbWJlcgo+ID4gWzJdIGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuMTYvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVy
by1sZW5ndGgtYW5kLW9uZS1lbGVtZW50LWFycmF5cwo+ID4gCj4gPiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvNzgKPiA+IEJ1aWxkLXRlc3RlZC1ieTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MmI2NzVlYy53S1g2QU9aNmNiRTcxdnRGJTI1bGtwQGlu
dGVsLmNvbS8KPiA+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9h
cnNAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gSGkgYWxsIQo+ID4gCj4gPiBKRllJOiBJJ20gYWRk
aW5nIHRoaXMgdG8gbXkgLW5leHQgdHJlZS4gOikKPiAKPiBGeWksIHRoaXMgYnJlYWtzIEJQRiBD
SToKClRoYW5rcyBmb3IgdGhlIHJlcG9ydCEgSXQgc2VlbXMgdGhlIDAtZGF5IHJvYm90IGRpZG4n
dCBjYXRjaCB0aGF0IG9uZS4KSSdsbCBmaXggaXQgdXAgcmlnaHQgYXdheS4gOikKCi0tCkd1c3Rh
dm8KCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9ydW5zLzcwNzg3
MTkzNzI/Y2hlY2tfc3VpdGVfZm9jdXM9dHJ1ZQo+IAo+ICAgWy4uLl0KPiAgIHByb2dzL21hcF9w
dHJfa2Vybi5jOjMxNDoyNjogZXJyb3I6IGZpZWxkICd0cmllX2tleScgd2l0aCB2YXJpYWJsZSBz
aXplZCB0eXBlICdzdHJ1Y3QgYnBmX2xwbV90cmllX2tleScgbm90IGF0IHRoZSBlbmQgb2YgYSBz
dHJ1Y3Qgb3IgY2xhc3MgaXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxl
LXNpemVkLXR5cGUtbm90LWF0LWVuZF0KPiAgICAgICAgICAgc3RydWN0IGJwZl9scG1fdHJpZV9r
ZXkgdHJpZV9rZXk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAgIDEg
ZXJyb3IgZ2VuZXJhdGVkLgo+ICAgbWFrZTogKioqIFtNYWtlZmlsZTo1MTk6IC90bXAvcnVubmVy
L3dvcmsvYnBmL2JwZi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvbWFwX3B0cl9rZXJuLm9d
IEVycm9yIDEKPiAgIG1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4g
ICBFcnJvcjogUHJvY2VzcyBjb21wbGV0ZWQgd2l0aCBleGl0IGNvZGUgMi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
