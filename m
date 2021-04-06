Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B446354F1D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 10:56:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51652C57A41;
	Tue,  6 Apr 2021 08:56:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53EDFC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 08:56:08 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j18so13304324wra.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Apr 2021 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k0R/CpFQIO0LutUTt6whAWYDSEEYWanyJgecDTp2qS4=;
 b=OUtsvTywwF0/bDjP4cBmo4dT9qHLCQLOTKohdrUdMDdMtVgNZ88XIn0SLwDK4A4/qG
 EwEU/kFbpjoldb1LlsU7Sqe+FySEhPAaMbHfWEcGqojHKt4e7wg+lkYfX7k+1mdJfOVx
 AjbNMxpoKsRjSZwo0SNnNf4pUy1J3mi5/xwF4b9nJ8LW3P74wuWx4TkCXBTstUnV4lA7
 s0BPsgsPGkujSf2teVKDJ6yAKtQsmGArOMiabQxqM/i+PjKovEJjU6RlXGqdh4zTEWgS
 VM+UO6/Fxg6nQHnz7gGc/T35KZHHmhVOm5MYpNnNbtSejPeRXePMPVHTzDl4t2JCGmVy
 HLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k0R/CpFQIO0LutUTt6whAWYDSEEYWanyJgecDTp2qS4=;
 b=bvruFbjaEKs+myd/oUmxz6WIrZ/2HXW1lxgzJALCQUoP+jRkCcMThdUr2CI/GVaMqd
 Ve6hxjgJFHdN/5ivOGvvrZBzQVjk08NYMc89x5gY9z/Z/opGpbaCjVQ9ELaB4So8Ejep
 mwMARMxls1qhjFgM40KF/v+QxW4vROy/+QtLgpOljtvND8kcqhdT6ZxMkm4LM2U6HiAz
 To9/ja0x7GpCgPYCdO/HcDUBVt1VOgOdfAF/O67yhulRfimYVGsiu1I04T7bvgQ1BRp1
 wz44kqinT7954X1VX5IClZKMCbgKnRoeyK8rRboLmrgQg7+unFduoLaX+8X/1mRph9n3
 ML8w==
X-Gm-Message-State: AOAM532+rcmFPJvC9jyT78t+fAr4Bgck+QAXf1btUzXfxH2SGqjyEHqY
 m0sZDWWc4i/HgNKEq3shwBobnw==
X-Google-Smtp-Source: ABdhPJy5liwwM3Ot+2W70tIkjSPkDW++gyVE8uJhSgWpBItS06FaUlff1OXTLSFd9M921fWjlzp4KQ==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr33668042wrx.236.1617699367868; 
 Tue, 06 Apr 2021 01:56:07 -0700 (PDT)
Received: from dell ([91.110.221.193])
 by smtp.gmail.com with ESMTPSA id u12sm5987318wro.51.2021.04.06.01.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:56:07 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:56:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Drubin <daniel.drubin@intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 dri-devel@lists.freedesktop.org, Henrik Rydberg <rydberg@bitmath.org>,
 Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 Lopez Casado <nlopezcasad@logitech.com>,
 "L. Vinyard, Jr" <rvinyard@cs.nmsu.edu>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 message to <vojtech@ucw.cz>, Michael Haboustak <mike-@cinci.rr.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Vojtech Pavlik <vojtech@suse.cz>, Zhang Lixu <lixu.zhang@intel.com>
Message-ID: <20210406085605.GS2916463@dell>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
Subject: Re: [Linux-stm32] [RESEND 00/25] Rid W=1 warnings from HID
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

T24gRnJpLCAyNiBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiBMZWUgSm9uZXMgKDI1KToKPiAgIEhJRDogaW50
ZWwtaXNoLWhpZDogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAnZXJyJwo+ICAgSElEOiBpc2h0cC1o
aWQtY2xpZW50OiBNb3ZlIHZhcmlhYmxlIHRvIHdoZXJlIGl0J3MgYWN0dWFsbHkgdXNlZAo+ICAg
SElEOiBpbnRlbC1pc2gtaGlkOiBwY2ktaXNoOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQn
Cj4gICBISUQ6IGludGVsLWlzaDogU3VwcGx5IHNvbWUgbWlzc2luZyBwYXJhbSBkZXNjcmlwdGlv
bnMKPiAgIEhJRDogaW50ZWwtaXNoOiBGaXggYSBuYW1pbmcgZGlzcGFyaXR5IGFuZCBhIGZvcm1h
dHRpbmcgZXJyb3IKPiAgIEhJRDogdXNiaGlkOiBSZXBhaXIgYSBmb3JtYXR0aW5nIGlzc3VlIGlu
IGEgc3RydWN0IGRlc2NyaXB0aW9uCj4gICBISUQ6IGludGVsLWlzaC1oaWQ6IEZpeCBhIGxpdHRs
ZSBkb2Mtcm90Cj4gICBISUQ6IHVzYmhpZDogaGlkLXBpZGZmOiBEZW1vdGUgYSBjb3VwbGUga2Vy
bmVsLWRvYyBhYnVzZXMKPiAgIEhJRDogaGlkLWFscHM6IENvcnJlY3Qgc3RydWN0IG1pc25hbWlu
Zwo+ICAgSElEOiBpbnRlbC1pc2gtaGlkOiBGaXggcG90ZW50aWFsIGNvcHkvcGFzdGUgZXJyb3IK
PiAgIEhJRDogaGlkLWNvcmU6IEZpeCBpbmNvcnJlY3QgZnVuY3Rpb24gbmFtZSBpbiBoZWFkZXIK
PiAgIEhJRDogaW50ZWwtaXNoLWhpZDogaXBjOiBDb3JyZWN0IGZ3X3Jlc2V0X3dvcmtfZm4oKSBm
dW5jdGlvbiBuYW1lIGluCj4gICAgIGhlYWRlcgo+ICAgSElEOiBpc2h0cC1oaWQtY2xpZW50OiBG
aXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgcmVwb3J0X2JhZF9wYWNrZXQoKQo+ICAgSElEOiBo
aWQta3llOiBGaXggaW5jb3JyZWN0IGZ1bmN0aW9uIG5hbWUgZm9yIGt5ZV90YWJsZXRfZW5hYmxl
KCkKPiAgIEhJRDogaGlkLXBpY29sY2RfY29yZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0
Jwo+ICAgSElEOiBoaWQtbG9naXRlY2gtaGlkcHA6IEZpeCBjb25mb3JtYW50IGtlcm5lbC1kb2Mg
aGVhZGVyIGFuZCBkZW1vdGUKPiAgICAgYWJ1c2VzCj4gICBISUQ6IGhpZC11Y2xvZ2ljLXJkZXNj
OiBLZXJuZWwtZG9jIGlzIGZvciBmdW5jdGlvbnMgYW5kIHN0cnVjdHMKPiAgIEhJRDogaGlkLXRo
cnVzdG1hc3RlcjogRGVtb3RlIGEgYnVuY2ggb2Yga2VybmVsLWRvYyBhYnVzZXMKPiAgIEhJRDog
aGlkLXVjbG9naWMtcGFyYW1zOiBFbnN1cmUgZnVuY3Rpb24gbmFtZXMgYXJlIHByZXNlbnQgYW5k
IGNvcnJlY3QKPiAgICAgaW4ga2VybmVsLWRvYyBoZWFkZXJzCj4gICBISUQ6IGhpZC1zZW5zb3It
Y3VzdG9tOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdyZXQnCj4gICBISUQ6IHdhY29tX3N5czog
RGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UKPiAgIEhJRDogaGlkLXNlbnNvci1odWI6IFJlbW92ZSB1
bnVzZWQgc3RydWN0IG1lbWJlciAncXVpcmtzJwo+ICAgSElEOiBoaWQtc2Vuc29yLWh1YjogTW92
ZSAnaHNkZXYnIGRlc2NyaXB0aW9uIHRvIGNvcnJlY3Qgc3RydWN0Cj4gICAgIGRlZmluaXRpb24K
PiAgIEhJRDogaW50ZWwtaXNoLWhpZDogaXNodHAtZnctbG9hZGVyOiBGaXggYSBidW5jaCBvZiBm
b3JtYXR0aW5nIGlzc3Vlcwo+ICAgSElEOiBpc2h0cC1oaWQtY2xpZW50OiBGaXggJ3N1Z2dlc3Qt
YXR0cmlidXRlPWZvcm1hdCcgY29tcGlsZXIgd2FybmluZwoKVGhlc2UgaGF2ZSBiZWVuIG9uIHRo
ZSBsaXN0IGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBub3cuCgpJcyB0aGVyZSBhbnl0aGluZyBJIGNh
biBkbyB0byBoZWxwIGV4cGVkaXRlIHRoZWlyIG1lcmdlPwoKSSdtIGNvbmNlcm5lZCBzaW5jZSAt
cmM2IGhhcyBqdXN0IGJlZW4gcmVsZWFzZWQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
