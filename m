Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC291B1AA
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 23:48:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B14DC71280;
	Thu, 27 Jun 2024 21:48:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7C3AC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719524918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHcfOWsEcITl9bu0E1Ymw7ooI8Hv1gK+grR8ONGP2Xs=;
 b=NovRjL8KSBmnTu5HhjklLKd1he2yKwvuZicpIt9EWvgU1HMYtRpK/BsNqyJ8k0HL7joz1l
 TYc6ezDaVBOoyQaIWpDsu9Puuklwk22/AKcjSOMJErM5/NDDw9TdlFwEO1Xu98iYaMshjX
 uIIb8tYY7F3NGq8gmtVSJEMztngrjBI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-vW7pi5cDPJO5dsrvlKDWHg-1; Thu, 27 Jun 2024 17:48:37 -0400
X-MC-Unique: vW7pi5cDPJO5dsrvlKDWHg-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-48f55dc45b1so4481576137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719524917; x=1720129717;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CHcfOWsEcITl9bu0E1Ymw7ooI8Hv1gK+grR8ONGP2Xs=;
 b=NxHgS6AnxtuD18HZRhblAbqyomsQ7RmP2AdIjtVZlGv8y7VcAWRZqGaVqtIh//4G+A
 WAXhotnvNxFnSWBu40pBv8BkbW04chsqSvEQvXkXcKfDRl0iZu4r9RS05gu1vJDxSotu
 MJOXrgt8sH0X0syGeLO8d2/SuphULHaD8e7Jo8zfuSvUkp/UWYBFhDu0ut96MaOdQNuF
 4rFY/6klhSkVyldnqEm0ynOOQr1raZEnbf9Dh5pApuuzbIYvN0e8Hn5QU8Jwxlzm9ZhE
 G4nWXL009Y2kkv3HTjJPAfhssDVJa/M1mL0DPoNPhSXi0Qy4IR+D7wlArT5/K7RAm4PH
 6P6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5eXn7ByPAKXl7gzwtM1wDwxWr3DLGThYjHfsM3+afzS1AyLEG6Y2XBWr6RiwAXHwfA4s9iTCMQ77GG6yThpjYfz0R0l778Ud6+iZdSMtMzRzDBeEI+5OH
X-Gm-Message-State: AOJu0YzGQINvaZLmJXeWuBXXco6WnUbEE6ezBZuMOJ9VovnX/7AsQh3k
 Dos+m2omn+9X9EkpAvHQLq0JEQ63vBXJOa+DAtnULWgypXyRcpWe+OFF999aoldhE4LKxS/aTIj
 KTG+IAVsFSFhGFkJZZvHqQqzHjjbw6Xg4OwKQYaWewbBvpLYvNZsdUKvk2Ycp7KXUoMjUPeWmgA
 /FzA==
X-Received: by 2002:a05:6102:2acf:b0:48f:8e88:583d with SMTP id
 ada2fe7eead31-48f8e886086mr4055817137.26.1719524917136; 
 Thu, 27 Jun 2024 14:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5z22EvNhwn2zPZtn6j+WLbwXAvrBCWXFpiuWOMgt/1osDgKWNuZFANeop8KLzzBv36NnwMw==
X-Received: by 2002:a05:6102:2acf:b0:48f:8e88:583d with SMTP id
 ada2fe7eead31-48f8e886086mr4055788137.26.1719524916653; 
 Thu, 27 Jun 2024 14:48:36 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e5746f5sm2378616d6.52.2024.06.27.14.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 14:48:36 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:48:33 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <4zaewv4watlf7v3phu3qnjtutdnez6a2gqkymrfln5bsu2pq6x@sclwhdzmhu5p>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
 <CAMRc=MfznDaaNcfvRBg1wpiOkyTE=Ks-_nx=aCY1MR5-50Ka+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=MfznDaaNcfvRBg1wpiOkyTE=Ks-_nx=aCY1MR5-50Ka+A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgMDg6MzU6MTZQTSBHTVQsIEJhcnRvc3ogR29sYXN6ZXdz
a2kgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgNzowN+KAr1BNIEFuZHJldyBIYWxh
bmV5IDxhaGFsYW5leUByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBBbHRob3VnaCwgdGhpcyBp
c24ndCB0aWVkIHRvIF9qdXN0XyAyNTAwYmFzZXggaGVyZS4gSWYgSSBib290IHRoZQo+ID4gc2E4
Nzc1cC1yaWRlIChyMiB2ZXJzaW9uLCB3aXRoIGEgbWFydmVsbCA4OGVhMTUxMiBwaHkgYXR0YWNo
ZWQgdmlhCj4gPiBzZ21paSwgbm90IGluZGljYXRpbmcgMjUwMGJhc2V4KSB3b3VsZG4ndCBhbGwg
dGhpcyBnZXQgZXhlcmNpc2VkPyBSaWdodAo+ID4gbm93IHRoZSBkZXZpY2V0cmVlIGRvZXNuJ3Qg
aW5kaWNhdGUgaW5iYW5kIHNpZ25hbGxpbmcsIGJ1dCBJIHRyaWVkIHRoYXQKPiA+IG92ZXIgaGVy
ZSB3aXRoIFJ1c3NlbGwncyBjbGVhbiB1cCBhIHdlZWsgb3IgdHdvIGFnbyBhbmQgdGhpbmdzIGF0
IGxlYXN0Cj4gPiBjYW1lIHVwIG9rICh3aGljaCBtYWRlIG1lIHRoaW5rIGFsbCB0aGUgSU5URUdS
QVRFRF9QQ1Mgc3R1ZmYgd2Fzbid0IG5lZWRlZCwKPiA+IGFuZCBJJ20gbm90IHRvdGFsbHkgcG9z
aXRpdmUgbXkgdGVzdCBwcm92ZWQgaW5iYW5kIHNpZ25hbGxpbmcgd29ya2VkLAo+ID4gYnV0IEkg
dGhvdWdodCBpdCBkaWQuLi4pOgo+ID4KPiAKPiBBbSBJIGdldHRpbmcgdGhpcyByaWdodD8gWW91
IGFkZGVkIGBtYW5hZ2VkID0gImluLWJhbmQtc3RhdHVzIicgdG8KPiBSZXYyIERUUyBhbmQgaXQg
c3RpbGwgd29ya2VkPwoKPiAKPiA+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYv
enpldm1obXd4cmhzNXlmdjVzcnZjanhydWUyZDd3dTd2anFtbW95ZDVtcDZrZ3VyNTRAanZtdXY3
Ynh4aHF0Lwo+ID4KPiA+IGJhc2VkIG9uIFJ1c3NlbGwncyBjb21tZW50cywgSSBmZWVsIGlmIEkg
d2FzIHRvIHVzZSBoaXMgc2VyaWVzIG92ZXIKPiA+IHRoZXJlLCBhZGQgJ21hbmFnZWQgPSAiaW4t
YmFuZC1zdGF0dXMiJyB0byB0aGUgZHRzLCBhbmQgdGhlbiBhcHBseSB0aGlzCj4gPiBzZXJpZXMs
IHRoZSBsaW5rIHdvdWxkIG5vdCBjb21lIHVwIGFueW1vcmUuCj4gPgoKVGhpcyB3b3JrcyBvbiBy
ZXYyL3JldjEgKG5vIHdheSB0byB0ZWxsIHdoaWNoIG9uZSBpdCBhY3R1YWxseSBpcywgc2hvdWxk
bid0IG1hdHRlciksCmhlcmUncyBhIGJyYW5jaCBJIGp1c3Qgd2hpcHBlZCB1cCB0byByZXBsaWNh
dGUgdGhlIHNldHVwIEkgaGFkIHdoZW4KbWFraW5nIHRoZSBjb21tZW50cyBpbiBhYm92ZSBsaW5r
OgoKICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9haGFsYW5leS9rZXJuZWwtYXV0b21vdGl2ZS05Ly0v
Y29tbWl0cy9ydXNzZWxsLWNsZWFudXBzLWFuZC1pbmJhbmQKClRoZSBsYXN0IGNvbW1pdCBoYXMg
c29tZSBkbWVzZy9ldGh0b29sIG91dHB1dCBldGMgdG8gc2hvdyB0aGluZ3MKd29ya2luZy4gSSBy
ZXZlcnRlZCByZWNlbnQgY2hhbmdlcyB0byBzdG1tYWMganVzdCB0byBhcHBseSBjbGVhbmx5LgoK
SSB0cmllZCB0aGUgcGF0Y2hlcyBTZXJnZSBhZGRlZCBvbiB0b3Agb2YgdGhhdCBzZXJpZXMsIGJ1
dCB0aGF0IHdhcyBjYXVzaW5nCnRoZSBsaW5rIHRvIGN5Y2xlIHVwL2Rvd24sIHNvIEkgZHJvcHBl
ZCB0aG9zZSBhbmQgd2VudCBiYWNrIHRvIGp1c3QKUnVzc2VsbCdzIHBhdGNoZXMgdG8gcmVjcmVh
dGUgdGhlIHNldHVwIEkgaGFkIHdoZW4gbGVhdmluZyB0aGUgY29tbWVudC4KSSBuZWVkIHRvIHRy
eSB3aXRoIFNlcmdlJ3Mgc3R1ZmYgYWdhaW4gd2hlbiBJIGZpbmQgYSBtb21lbnQgYW5kIHNlZSBp
ZiBJCmNhbiB3b3JrIG91dCB3aHkgdGhlIGxpbmsgc3RhcnRzIGdvaW5nIHVwL2Rvd24gd2l0aCB0
aG9zZSArIHNvbWUKY29tcGlsZXIgZml4dXBzIGFuZCByZW1vdmluZyBJTlRFR1JBVEVEX1BDUyBm
bGFncy4gRm9yIHdoYXQgaXRzIHdvcnRoLApoZXJlJ3MgdGhlIGJyYW5jaCwgbG9ncyBhcmUgaW4g
dGhlIGxhc3QgY29tbWl0OgoKICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9haGFsYW5leS9rZXJuZWwt
YXV0b21vdGl2ZS05Ly0vY29tbWl0cy9ydXNzZWxsLXBsdXMtc2VyZ2UtcGx1cy1pbmJhbmQtbGlu
ay1jeWNsZXMKCgpXaXRob3V0IFJ1c3NlbGwncyBwYXRjaGVzIHRoZSBsaW5rIGRvZXNuJ3QgY29t
ZSB1cCBhZnRlciBzd2l0Y2hpbmcgdG8KJ21hbmFnZWQgPSAiaW4tYmFuZC1zdGF0dXMiJyBvdGhl
cndpc2UgSSdkIGxvb2sgaW50byBzd2l0Y2hpbmcgdGhlIGR0cyB0bwppbmJhbmQgc2lnbmFsbGlu
ZyBub3cgaW5zdGVhZCBvZiBhZnRlciB0aG9zZSBjbGVhbnVwcyBsYW5kLgoKPiAKPiBCZWNhdXNl
IEkgY2FuIGNvbmZpcm0gdGhhdCBpdCBkb2Vzbid0IG9uIFJldiAzLiA6KAo+IAo+IFNvIHRvIGV4
cGxhaW4gbXlzZWxmOiBJIHRyaWVkIHRvIGZvbGxvdyBBbmRyZXcgTHVubidzIHN1Z2dlc3Rpb24g
YWJvdXQKPiB1bmlmeWluZyB0aGlzIGFuZCB0aGUgZXhpc3RpbmcgZXRocW9zX3NldF9mdW5jX2Ns
a19lbigpIGJpdHMgYXMgdGhleQo+IHNlZW0gdG8gYWRkcmVzcyBhIHNpbWlsYXIgaXNzdWUuCj4g
Cj4gSSdtIHdvcmtpbmcgd2l0aCBsaW1pdGVkIGluZm9ybWF0aW9uIGhlcmUgYXMgd2VsbCByZWdh
cmRpbmcgdGhpcyBpc3N1ZQo+IHNvIEkgZmlndXJlZCB0aGlzIGNvdWxkIHdvcmsgYnV0IHlvdSdy
ZSByaWdodCAtIGlmIHdlIGV2ZXIgbmVlZAo+IGluLWJhbmQgc2lnbmFsbGluZywgdGhlbiBpdCB3
b24ndCB3b3JrLiBJdCdzIGxhdGUgaGVyZSBzbyBsZXQgbWUgZ2V0Cj4gYmFjayB0byBpdCB0b21v
cnJvdy4KCk5vIHdvcnJpZXMsIEkgdW5kZXJzdGFuZCBob3cgdGhpcyBnb2VzLCBzdG1tYWMgaXMg
dHJpY2t5IGFuZCBnZXR0aW5nCmluZm9ybWF0aW9uL2RvY3VtZW50YXRpb24gYW5kIHVuZGVyc3Rh
bmRpbmcgaXQgY2FuIGJlIHRvdWdoLiBJIGFwcHJlY2lhdGUgeW91IHRyeWluZwp0byBnZXQgdGhp
cyBzcXVhcmVkIGF3YXkuCgo+IAo+ID4gVG90YWwgc2lkZSBub3RlLCBidXQgSSdtIHdvbmRlcmlu
ZyBpZiB0aGUgc2E4Nzc1cC1yaWRlIGR0cyBzaG91bGQKPiA+IHNwZWNpZnkgJ21hbmFnZWQgPSAi
aW4tYmFuZC1zdGF0dXMiJy4KPiA+Cj4gCj4gSSdsbCBjaGVjayB0aGlzIGF0IHRoZSBzb3VyY2Uu
Cj4gCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
