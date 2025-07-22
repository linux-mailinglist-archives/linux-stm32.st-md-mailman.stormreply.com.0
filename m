Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A89B0E0F9
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 17:53:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0697C36B0C;
	Tue, 22 Jul 2025 15:53:42 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 235C8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 15:53:41 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3e2c521efddso3358395ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753199620; x=1753804420;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adr5sYEO4gGv2YXAYDqrl4czLFwxUgDgxoHepLkF+Nw=;
 b=dv+HN0LEzfrnSY+PxlU8mCqguq4VMz3S/Bifiuu2LZIyyzKFDZo+VIh1pBz+9o3kBv
 fxlpJss2HdCfxt4WXsNqEI0GWmjRd4wYcLxgHhUsaTfu5gontl7fSUHpwWbilkAIa9Rt
 0Gd8J1idMHVwJ5FPIv0qGNjr3jTpMoqDT+FHNRnVlsz/hIMb/MJLVD2i8YihPspr0f5E
 /LOq/9a7/cLkgBMHh0dr0Sc7Ua1vVWvuqXr7wkrc6GvpRNH0tBK47XNYSF4upUU8adQw
 s6tk2tuBGVA2eODQJt/rIPH8ZVDgajVDoyDru2W7Ag/BtEbolBsS0HFpC2cGzdNBXgGG
 +ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753199620; x=1753804420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adr5sYEO4gGv2YXAYDqrl4czLFwxUgDgxoHepLkF+Nw=;
 b=F4qVjNIcwuzO9EC1Asm3jqyaqs/C/8D81cImXcLGpxUnDth0w+sxcvuj5pLUqc4L+g
 PuHGAx1L4SVjCEGa83BlaQVVl7U2Lmpc0xiw+/nYcCRFHiR6cdZH3ULAaGw9499K6oCZ
 gqRCF3wG7rmofZyU/JtdfkAca2ep5haNFHQ2cFGJhkzp34109p5obnp+DC6n0sDTAdHQ
 Qy1iRs0rFvslftgc9ztgEjOujDiIkk0KKKa2WOapo8tWKVxU5SL7Yxol/BFKUycrB0bQ
 v0AFzehwK9bjb7YrId/32EnMnDTeJACc/qudK9qo6NR/jVQbDjDk6JBoBIuE6oW45Qng
 iUpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOZsfIJUwcZmXrN+nXrhoba7bYHEPzPNmf6qRwYFJ0m508ndkYCYr+yep19jKUee+YlJFEc6gHuDY6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJnWRkU5ItTNAt2yxbgZmTGv3HEjKVLieKXyRstaJqcLWNlFob
 7mZn3NXtHeZxmivbyL2Bt6mDL3HOInEbdP9gMgquk1X5PZJDU4soajZNHSNxtlKUn8yJb4Iv081
 Syf2aiqejn3b41HXoSz0AS2ARF5/AIQY=
X-Gm-Gg: ASbGncshhrLciotLJAuWBnoFm4LFbhR4hLW4pfDQPra+zVMUftAo4rpePOSayTtJivt
 ikFCGqU9AZAnvBr852AJdI6gArE+Hg1bYeXZHN5gVyGCpAz+Bj3yMvmkNsAPkbQoxwTrxBMaXBv
 g50UgO2DLgCmDNQklG3N8E8uZCD5JjIOKq9vlhIh/D5a9cGe8e/jwMNf5i7Gf8jCcWuYR34yQ4C
 ySRsjbEsGtvrpoU
X-Google-Smtp-Source: AGHT+IEJWm/iCeW2Y4moVUtuGQu6TSWVSa6lw45TSOWwh0m4HIQqc9HfG9s47AeP0XtnyGFnP1g9pMf1aTcA5QyVbwo=
X-Received: by 2002:a92:d110:0:b0:3dd:89b0:8e1b with SMTP id
 e9e14a558f8ab-3e28245d435mr236925025ab.15.1753199619608; Tue, 22 Jul 2025
 08:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
 <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
 <687f9d4cf0b14_2aa7cc29443@willemb.c.googlers.com.notmuch>
In-Reply-To: <687f9d4cf0b14_2aa7cc29443@willemb.c.googlers.com.notmuch>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 22 Jul 2025 23:53:03 +0800
X-Gm-Features: Ac12FXwbckjpwxjxMK_Lfr5hlSRd7HzN5fKFdGn8nikqBlfITUYZXyaXfPGKt0A
Message-ID: <CAL+tcoC5KnTuWKxKcUqFGh-nBSF+X+RWzr=RkkK86+jY1Q20Kw@mail.gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 maciej.fijalkowski@intel.com, hawk@kernel.org, ast@kernel.org,
 magnus.karlsson@intel.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 bjorn@kernel.org, mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next 1/2] stmmac:
 xsk: fix underflow of budget in zerocopy mode
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMTA6MTbigK9QTSBXaWxsZW0gZGUgQnJ1aWpuCjx3aWxs
ZW1kZWJydWlqbi5rZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IEphc29uIFhpbmcgd3JvdGU6
Cj4gPiBIaSBQYXVsLAo+ID4KPiA+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDQ6NTbigK9QTSBQ
YXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPiB3cm90ZToKPiA+ID4KPiA+ID4gRGVh
ciBKYXNvbiwKPiA+ID4KPiA+ID4KPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgo+ID4K
PiA+IFRoYW5rcyBmb3IgeW91ciBxdWljayByZXNwb25zZSBhbmQgcmV2aWV3IDopCj4gPgo+ID4g
Pgo+ID4gPiBBbSAyMS4wNy4yNSB1bSAxMDozMyBzY2hyaWViIEphc29uIFhpbmc6Cj4gPiA+ID4g
RnJvbTogSmFzb24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4KPiA+ID4gPgo+ID4gPiA+
IFRoZSBpc3N1ZSBjYW4gaGFwcGVuIHdoZW4gdGhlIGJ1ZGdldCBudW1iZXIgb2YgZGVzY3MgYXJl
IGNvbnN1bWVkLiBBcwo+ID4gPgo+ID4gPiBJbnN0ZWFkIG9mIOKAnFRoZSBpc3N1ZeKAnSwgSeKA
mWQgdXNlIOKAnEFuIHVuZGVyZmxvdyDigKbigJ0uCj4gPgo+ID4gV2lsbCBjaGFuZ2UgaXQuCj4g
Pgo+ID4gPgo+ID4gPiA+IGxvbmcgYXMgdGhlIGJ1ZGdldCBpcyBkZWNyZWFzZWQgdG8gemVybywg
aXQgd2lsbCBhZ2FpbiBnbyBpbnRvCj4gPiA+ID4gd2hpbGUgKGJ1ZGdldC0tID4gMCkgc3RhdGVt
ZW50IGFuZCBnZXQgZGVjcmVhc2VkIGJ5IG9uZSwgc28gdGhlCj4gPiA+ID4gdW5kZXJmbG93IGlz
c3VlIGNhbiBoYXBwZW4uIEl0IHdpbGwgbGVhZCB0byByZXR1cm5pbmcgdHJ1ZSB3aGVyZWFzIHRo
ZQo+ID4gPiA+IGV4cGVjdGVkIHZhbHVlIHNob3VsZCBiZSBmYWxzZS4KPiA+ID4KPiA+ID4gV2hh
dCBpcyDigJxpdOKAnT8KPiA+Cj4gPiBJdCBtZWFucyAndW5kZXJmbG93IG9mIGJ1ZGdldCcgYmVo
YXZpb3IuCj4KPiBBIHRlY2huaWNhbGl0eSwgYnV0IHRoaXMgaXMgKG5lZ2F0aXZlKSBvdmVyZmxv
dy4KPgo+IFVuZGVyZmxvdyBpcyBhIGNvbXB1dGF0aW9uIHRoYXQgcmVzdWx0cyBpbiBhIHZhbHVl
IHRoYXQgaXMgdG9vIHNtYWxsCj4gdG8gYmUgcmVwcmVzZW50ZWQgYnkgdGhlIGdpdmVuIHR5cGUu
CgpJbnRlcmVzdGluZy4gVGhhbmtzIGZvciBzaGFyaW5nIHRoaXMgd2l0aCBtZTopCgpJIGp1c3Qg
Y2hlY2tlZCB0aGUgd2lraXBlZGlhWzFdIHRoYXQgc2F5cyAiIFVuZGVyZmxvdyBjYW4gaW4gcGFy
dCBiZQpyZWdhcmRlZCBhcyBuZWdhdGl2ZSBvdmVyZmxvdyBvZiB0aGUgZXhwb25lbnQgb2YgdGhl
IGZsb2F0aW5nLXBvaW50CnZhbHVlLiIuIEkgYXNzdW1lIHRoaXMgcnVsZSBjYW4gYWxzbyBiZSBh
cHBsaWVkIGluIHRoaXMgY2FzZT8gSSdtCmhlc2l0YW50IHRvIHNlbmQgdGhlIHYzIHBhdGNoIHRv
bW9ycm93IHdpdGggdGhpcyAnbmVnYXRpdmUgb3ZlcmZsb3cnCnRlcm0gaW5jbHVkZWQuCgpbMV06
IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0FyaXRobWV0aWNfdW5kZXJmbG93CgpUaGFu
a3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
