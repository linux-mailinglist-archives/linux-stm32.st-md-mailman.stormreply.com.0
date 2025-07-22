Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC6B0E6F0
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 01:08:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9A74C36B0D;
	Tue, 22 Jul 2025 23:08:05 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D45BBC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 23:08:04 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-87c54a2985fso105018739f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753225683; x=1753830483;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mMoaMx1flIcD7eXqi/UL8Muxe2kEAD+s71uJxVYy2s=;
 b=GE9zawkHCtHb1cKj2R4j9plcroiSapy5zIc5/3enQcC8dPKOQjmHKKEwE3OYpLVp0N
 h3PqOpXI1S29Hyv5Fn2chj17iK+NWDNgH9dhtrGzUHYZd0awPDSXRsMW03Bhln3z1usb
 aUboEu02+/vQncMQ8DvYN16GGU0IVE1KZz/1++3EpI08mt5nNys0s9+R7iCSroOLGTaq
 pagQ6v86rMeVLH1u5w5Db3DzQdA/tVgHAI+KMK9ZH6ZeoizqJKbRgfPEVkzz+QwICndf
 cb8no9Z5MRugV9f49Xu+s1+Po+Vc+++4F9mqbEyl/STQgaRHGpPv1pwB9ecHP08qkrG2
 GHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753225683; x=1753830483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mMoaMx1flIcD7eXqi/UL8Muxe2kEAD+s71uJxVYy2s=;
 b=CWQFUJkV5pmAol003T9K52Jkk2d+1dz5xkNkafT9d0iWqtdz5gJdwOyQg183QBvzE5
 kEGupCBKXFDWymToteLVGdx+22MfbU4CkMA46VAMYU9FlzUOFot2CgLfzU5l88RdJmZs
 yeKRpfRyG/VpsALz80wZ+j6fMgTbJUL+8de66RUZ8Avrjc2sCpvvsERsFUy3m9ORi1Oh
 EqqtJTZ064BxnmkFK5OngJltH4CYKyWF7oS4WbWFxLWZCQceEOzR9Wyp8FCTd92E62MQ
 dxp17R6Z1z7MlSoW10DgaIATOIVQQSqDt/1Sc0xWHaQposf1SXiOvzvAJc7VUR57Dqpe
 44GQ==
X-Gm-Message-State: AOJu0YwN9ScFnh3vFRtcvQt6OnHIJa7T6hYiI7V4kjTwLugBocHYP3s4
 2DqWDwYo+el0btQzj9Dj3oUJZ2urCKpVwupFkJCnRMV8xFG1xAulb/SBVx+3mvvSFyuJwzyV28N
 1yw+TvZIjHhgEfvcJpEYGQbAYPMkO58c=
X-Gm-Gg: ASbGncsypFPhQTPZqOdznTVZwSjPORzbWLDzYHk59g2FHgEPPVUqWq6KX4COxwDeOwS
 qCHAmQ97PrHlw7ulKTh3D86NKkHbWCg9CP4soFrwRqe9bSyADJVw1iTL303aILgY0B5LaB+QxZy
 qhw4lpaNfoOHQdomaw4l7Sru67D/+di118NY6v6BEA7lpN85uSu0HeOn91X+mm09j+iR+R1pHmp
 ulsseew4mFsO/VtQg==
X-Google-Smtp-Source: AGHT+IExMlR5MelabTRsOc2tClv7n4gVBPnDMaSvf1Cqj6owFiytP1LId1+eNzapFTXoQP/Io+nkVOuNBDaBzXzB1Gk=
X-Received: by 2002:a05:6e02:3499:b0:3e2:c345:17f2 with SMTP id
 e9e14a558f8ab-3e32fc7fa36mr18089175ab.3.1753225683585; Tue, 22 Jul 2025
 16:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250722135057.85386-1-kerneljasonxing@gmail.com>
In-Reply-To: <20250722135057.85386-1-kerneljasonxing@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 23 Jul 2025 07:07:27 +0800
X-Gm-Features: Ac12FXza06BuAb0W28VQl1NaN6Z6Y25KJi_4nA0fzQz21BHQq_5MVFnMh8KihHA
Message-ID: <CAL+tcoAnB+8ZLPyWQ3XsvWTa=JO1yCKWvrKVp+2WCP=kGpfSPg@mail.gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org, 
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com, 
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org, 
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-stm32@st-md-mailman.stormreply.com,
 Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] xsk: fix underflow issues in
	zerocopy xmit
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgOTo1MeKAr1BNIEphc29uIFhpbmcgPGtlcm5lbGphc29u
eGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0
ZW5jZW50LmNvbT4KPgo+IEZpeCB0d28gdW5kZXJmbG93IGlzc3VlcyBhcm91bmQge3N0bW1hY194
ZHB8aWdifV94bWl0X3pjKCkuCj4KPiBKYXNvbiBYaW5nICgyKToKPiAgIHN0bW1hYzogeHNrOiBm
aXggdW5kZXJmbG93IG9mIGJ1ZGdldCBpbiB6ZXJvY29weSBtb2RlCj4gICBpZ2I6IHhzazogc29s
dmUgdW5kZXJmbG93IG9mIG5iX3BrdHMgaW4gemVyb2NvcHkgbW9kZQoKV2lsbGVtIGhhcyBwb2lu
dGVkIG91dCBpdCdzIHRlY2huaWNhbGx5IG5vdCB1bmRlcmZsb3cgYnV0IHRoZSBuZWdhdGl2ZQpv
dmVyZmxvd1sxXS4gU28gSSBkZWNpZGVkIHRvIHNlbmQgYSBWMyBwYXRjaCB3aXRoIHRoaXMgbW9k
aWZpZWQuCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC82ODdmOWQ0Y2YwYjE0XzJh
YTdjYzI5NDQzQHdpbGxlbWIuYy5nb29nbGVycy5jb20ubm90bXVjaC8KClRoYW5rcywKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
