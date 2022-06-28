Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EECEA55BCBD
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 02:40:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FE5FC04003;
	Tue, 28 Jun 2022 00:40:56 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8411C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 00:40:55 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id k10so8544467qke.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 17:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nrCjPCGAs4MTUiLBt7Ijf/MJPuIyH6lM8yqPhdyhJD8=;
 b=QGfGz2XeyaJLxS6IycR7jteyzbs2f9vu4fQQcftWhoNW5sUtbyuMKwRS5XXshn3Hg2
 yZubOZXW72TGsXoMKBc9lhqncUYMSH0Z6bymz383cNPRRHeF7rKM5RXMNm4Eaw5tsGTg
 BQX0bHWNlf6m2F5J4oWG32dxQT2CTBmnGX6tl+1lipYgts8fc/1uUmHwN5t3zZzoA6Qn
 DTeDwoNVOxWo0hy32OR9hFE/UO0/97qh5eo+5ewqu/iIRVMFQ1AIctopaFBuZOm9BPLs
 HAx/pGMXLvvVO6Cb9sesF2T5smUMb44u7gsx78px69APS8fFzY4PmSgo/WM3D328ZbRr
 X/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nrCjPCGAs4MTUiLBt7Ijf/MJPuIyH6lM8yqPhdyhJD8=;
 b=JGChNkCiBI+BnNP9LO1q2Ac0d4BxHrmEJdnfRC8ksoQEsQaKv62VOkSPb94Dodhhyq
 9Pahcgs3jlFwmaQObJfeiU36oYy71sr3Fg7KlV90CprLc1jq1wRZdWnZOzl2UgrmMVh2
 O7vxcndnkgEdEKHY9p+w/DVTO6XM7BcGAbLdxVMEazxpIiWbs4tHe3ERmpHhx2Vktxte
 l2E+UN9yIIq3ZfFxDZD6j0RkX+UKUSF4UFTW2f4j9kWYjewnAXBjK4YAzgdA0oyniDSd
 hCDPx9lJjbpUekujlBc/ThSqaXyco34qVwb9kq2i00e/gMmAjbTt5Qlkvas2PPEjjVi8
 renQ==
X-Gm-Message-State: AJIora+Pofc/jnt3V9xnM/N5dzS77qslS7eSyg3xKJ/VlAutZ15y5WzR
 5w5IttOto7dmA2s7hAA+mit6OQ==
X-Google-Smtp-Source: AGRyM1vTCFcIzhygOqc0dfz0XQz9dolsiNFu6n34Zw7Kl9e9LRh00tD6U1uaxZUOgaZBY5Ks0qTgkA==
X-Received: by 2002:a05:620a:1450:b0:6af:1999:5f4c with SMTP id
 i16-20020a05620a145000b006af19995f4cmr7538467qkl.301.1656376854703; 
 Mon, 27 Jun 2022 17:40:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 x11-20020a05620a448b00b006a768c699adsm10335849qkp.125.2022.06.27.17.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 17:40:53 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1o5zHg-002iu4-9Z; Mon, 27 Jun 2022 21:40:52 -0300
Date: Mon, 27 Jun 2022 21:40:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <20220628004052.GM23621@ziepe.ca>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 v9fs-developer@lists.sourceforge.net, linux-mips@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
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
SToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20va2VybmVsLXBhdGNoZXMvYnBmL3J1bnMvNzA3ODcx
OTM3Mj9jaGVja19zdWl0ZV9mb2N1cz10cnVlCj4gCj4gICBbLi4uXQo+ICAgcHJvZ3MvbWFwX3B0
cl9rZXJuLmM6MzE0OjI2OiBlcnJvcjogZmllbGQgJ3RyaWVfa2V5JyB3aXRoIHZhcmlhYmxlIHNp
emVkIHR5cGUgJ3N0cnVjdCBicGZfbHBtX3RyaWVfa2V5JyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0
cnVjdCBvciBjbGFzcyBpcyBhIEdOVSBleHRlbnNpb24gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUt
c2l6ZWQtdHlwZS1ub3QtYXQtZW5kXQo+ICAgICAgICAgICBzdHJ1Y3QgYnBmX2xwbV90cmllX2tl
eSB0cmllX2tleTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKVGhpcyB3
aWxsIGJyZWFrIHRoZSByZG1hLWNvcmUgdXNlcnNwYWNlIGFzIHdlbGwsIHdpdGggYSBzaW1pbGFy
CmVycm9yOgoKL3Vzci9iaW4vY2xhbmctMTMgLURWRVJCU19ERUJVRyAtRGlidmVyYnNfRVhQT1JU
UyAtSWluY2x1ZGUgLUkvdXNyL2luY2x1ZGUvbGlibmwzIC1JL3Vzci9pbmNsdWRlL2RybSAtZyAt
TzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9fX3cvMS9zPS4gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25n
IC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC1XZGF0ZS10aW1lIC1EX0ZPUlRJRllf
U09VUkNFPTIgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dy
aXRlLXN0cmluZ3MgLVdmb3JtYXQ9MiAtV2Nhc3QtZnVuY3Rpb24tdHlwZSAtV2Zvcm1hdC1ub25s
aXRlcmFsIC1XZGF0ZS10aW1lIC1XbmVzdGVkLWV4dGVybnMgLVdzaGFkb3cgLVdzdHJpY3QtcHJv
dG90eXBlcyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XZXJyb3IgLVdyZWR1bmRhbnQtZGVjbHMg
LWcgLWZQSUMgICAtc3RkPWdudTExIC1NRCAtTVQgbGliaWJ2ZXJicy9DTWFrZUZpbGVzL2lidmVy
YnMuZGlyL2NtZF9mbG93LmMubyAtTUYgbGliaWJ2ZXJicy9DTWFrZUZpbGVzL2lidmVyYnMuZGly
L2NtZF9mbG93LmMuby5kIC1vIGxpYmlidmVyYnMvQ01ha2VGaWxlcy9pYnZlcmJzLmRpci9jbWRf
Zmxvdy5jLm8gICAtYyAuLi9saWJpYnZlcmJzL2NtZF9mbG93LmMKSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIC4uL2xpYmlidmVyYnMvY21kX2Zsb3cuYzozMzoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlu
Y2x1ZGUvaW5maW5pYmFuZC9jbWRfd3JpdGUuaDozNjoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlu
Y2x1ZGUvaW5maW5pYmFuZC9jbWRfaW9jdGwuaDo0MToKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlu
Y2x1ZGUvaW5maW5pYmFuZC92ZXJicy5oOjQ4OgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVk
ZS9pbmZpbmliYW5kL3ZlcmJzX2FwaS5oOjY2OgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVk
ZS9pbmZpbmliYW5kL2liX3VzZXJfaW9jdGxfdmVyYnMuaDozODoKaW5jbHVkZS9yZG1hL2liX3Vz
ZXJfdmVyYnMuaDo0MzY6MzQ6IGVycm9yOiBmaWVsZCAnYmFzZScgd2l0aCB2YXJpYWJsZSBzaXpl
ZCB0eXBlICdzdHJ1Y3QgaWJfdXZlcmJzX2NyZWF0ZV9jcV9yZXNwJyBub3QgYXQgdGhlIGVuZCBv
ZiBhIHN0cnVjdCBvciBjbGFzcyBpcyBhIEdOVSBleHRlbnNpb24gWy1XZXJyb3IsLVdnbnUtdmFy
aWFibGUtc2l6ZWQtdHlwZS1ub3QtYXQtZW5kXQogICAgICAgIHN0cnVjdCBpYl91dmVyYnNfY3Jl
YXRlX2NxX3Jlc3AgYmFzZTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KaW5jbHVkZS9yZG1hL2liX3VzZXJfdmVyYnMuaDo2NDQ6MzQ6IGVycm9yOiBmaWVsZCAnYmFz
ZScgd2l0aCB2YXJpYWJsZSBzaXplZCB0eXBlICdzdHJ1Y3QgaWJfdXZlcmJzX2NyZWF0ZV9xcF9y
ZXNwJyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0cnVjdCBvciBjbGFzcyBpcyBhIEdOVSBleHRlbnNp
b24gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUtc2l6ZWQtdHlwZS1ub3QtYXQtZW5kXQogICAgICAg
IHN0cnVjdCBpYl91dmVyYnNfY3JlYXRlX3FwX3Jlc3AgYmFzZTsKCldoaWNoIGlzIHdoeSBJIGdh
dmUgdXAgdHJ5aW5nIHRvIGNoYW5nZSB0aGVzZS4uCgpUaG91Z2ggbWF5YmUgd2UgY291bGQganVz
dCBzd2l0Y2ggb2ZmIC1XZ251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90LWF0LWVuZCAgZHVyaW5n
IGNvbmZpZ3VyYXRpb24gPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
