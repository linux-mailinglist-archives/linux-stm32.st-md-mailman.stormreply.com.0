Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59A944772
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 11:07:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4CFDC71290;
	Thu,  1 Aug 2024 09:07:14 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16428C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 09:07:07 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso888510266b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722503226; x=1723108026;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0ZBoY3AoVccb/INlrM3z9gGvON8IToRFWiibOBUz5W8=;
 b=UiMOoiz3tEP9KSHJh4Me8sOKE+QFpMneckQJzCVUR5AJtyCilugxGWLvX3YU4CiSSw
 rOpG24AqkWQj0QVUIKCKRBUUCWHY663/NbKXtSwMyP+XY/eTFJofJvI17wYUWih/KH0E
 tM6DQplN2L7+rKyb54quaQGfk0+YV3dSepSmKshEE5ybCZQfDcJmeo7sPWOB4Dw5uvoc
 Zy6YW5jG69u06+axv/GSSkML4Gs/6BKo3Av3Wkb7Ay4rNgDPUQ8ZRnEqUcIQO0kOGlfS
 D2Tim/+ebhIN1UlwpHWXGQ6QE1qAi6n96pP5glCF+r8uL/YGdgiX249rgq8UxvXPxiGG
 +t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722503226; x=1723108026;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZBoY3AoVccb/INlrM3z9gGvON8IToRFWiibOBUz5W8=;
 b=Ojn/OqqlKJPkdcPADm7IADI4520FBLje53nmhRrMpa4dHGqcjExUsx/vB9EV37EzoK
 jzuEuC3xmgComdJPaTMPCYfzsEXCk7wwQp8O6RciVC1N0zk0UmHmHu7IrpEJWIN1Cqr3
 ZU7th28TljVJRqhzidzbWUmBzz8Q7ZifQAHZdaYGOJc51TFfOPp6o8QBpcuyehIoQ6Xe
 HHutab33HTTQCVQhKXeTehJjYlBdRC7qoEFQ89jk43ZydZP5bwVudO1nWdrNUoyMWQD7
 BJAwWb+wyzwzfx2HiOA2vJTnp0tSSSxMAoFmqxu22IDusIfK3AOm9ZiW68rFke7FWajd
 65yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrw8eOhPEsCqf+zsDzcar9n6QVopg9lGu3igJCxFYWU6Woq1d9pAJOFAXAzg12bq6YuKy9Goh1cT8WbL4YKgJgz0jZMxcHhkYsVgfInPDYi9bZ3Tsi/wf/
X-Gm-Message-State: AOJu0YyITVTo5LcUCx7xfJ87Dl0Du4MM5gCWGGPgMGfqg47ZBRlUz6Os
 KIeUHhNXDXGrFKQ1DLi3gjFkIPna38QjsAztxWqYNkTzzFeZcJgS
X-Google-Smtp-Source: AGHT+IFkXQXLFJ5X+Na5/W+NzBmIf8q3vSnukCimnlNwYhkXd1AhMX9KBCaqr0DDQZcpDbO7MU+hlA==
X-Received: by 2002:a17:907:2d91:b0:a7d:340e:43a4 with SMTP id
 a640c23a62f3a-a7daf55e504mr102922866b.31.1722503225659; 
 Thu, 01 Aug 2024 02:07:05 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1113:4afb:5fa3:8d9c:6e3d:1966?
 ([2a04:cec0:1113:4afb:5fa3:8d9c:6e3d:1966])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de06sm868138666b.71.2024.08.01.02.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 02:07:05 -0700 (PDT)
Message-ID: <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
Date: Thu, 1 Aug 2024 11:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Yanjun Yang <yangyj.ee@gmail.com>,
 Philippe CORNU <philippe.cornu@foss.st.com>, yannick.fertre@foss.st.com
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
 <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
Content-Language: en-US, fr
In-Reply-To: <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpMZSAyOS8wNy8yMDI0IMOgIDE1OjI4LCBZYW5qdW4gWWFuZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgSnVsIDI2LCAyMDI0IGF0IDA5OjU1OjM1QU0gKzAyMDAsIFBoaWxpcHBlIENPUk5VIHdyb3Rl
Ogo+Pgo+Pgo+PiBPbiA3LzIyLzI0IDEwOjM4LCBZYW5qdW4gWWFuZyB3cm90ZToKPj4+Cj4+PiBU
aGlzIHBhdGNoIChjb21taXQgaWQ6MTg1Zjk5YjYxNDQyNzM2MCkgc2VlbXMgdG8gYnJlYWsgdGhl
IGRzaSBvZgo+Pj4gc3RtMzJmNDY5IGNoaXAuCj4+PiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhl
IGRybSBhbmQgdGhlIGNsb2NrIGZyYW1ld29yaywgbWF5YmUgaXQncwo+Pj4gYmVjYXVzZSB0aGVy
ZSBpcyBubwo+Pj4gICAgImNrX2RzaV9waHkiIGRlZmluZWQgZm9yIHN0bTMyZjQ2OS4KPj4+IFBT
OiAgU29ycnkgZm9yIHJlY2VpdmluZyBtdWx0aXBsZSBjb3BpZXMgb2YgdGhpcyBlbWFpbCwgSSBm
b3Jnb3QgdG8KPj4+IHVzZSBwbGFpbiB0ZXh0IG1vZGUgbGFzdCB0aW1lLgo+Pj4KPj4KPj4gSGks
Cj4+IFRoYW5rIHlvdSBmb3IgbGV0dGluZyB1cyBrbm93IHRoYXQgdGhlcmUgd2FzIHRoaXMgZXJy
b3IuIFdlIHNob3VsZCBoYXZlCj4+IGRldGVjdGVkIHRoaXMgYmVmb3JlIG1lcmdpbmcsIHJlYWxs
eSBzb3JyeSBmb3IgdGhlIHByb2JsZW1zIGNhdXNlZCBieSB0aGlzCj4+IHBhdGNoLiBXZSB3aWxs
IGludmVzdGlnYXRlIHRoZSBpc3N1ZSBhbmQgZ2V0IGJhY2sgdG8geW91IGFzIHNvb24gYXMKPj4g
cG9zc2libGUuIEluIHRoZSBtZWFudGltZSwgSSB0aGluayB5b3UgY2FuIHJldmVydCB0aGlzIHBh
dGNoIGluIHlvdXIgZ2l0Cj4+IHRyZWUuCj4+Cj4+IFBoaWxpcHBlIDotKQo+Pgo+IAo+IEhpLApI
aSwKCkZZSQpEU0kgY2xvY2sgdHJlZSBmb3Igc3RtMzJmNDY5IGNhbiBiZSBmb3VuZCBoZXJlOgpo
dHRwczovL3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vcmVmZXJlbmNlX21hbnVhbC9ybTAzODYtc3Rt
MzJmNDY5eHgtYW5kLXN0bTMyZjQ3OXh4LWFkdmFuY2VkLWFybWJhc2VkLTMyYml0LW1jdXMtc3Rt
aWNyb2VsZWN0cm9uaWNzLnBkZgoKUmVmZXIgdG8gRmlndXJlIDE3OiBEU0kgY2xvY2sgdHJlZS4K
CkFmdGVyIHNvbWUgcmVzZWFyY2ggSSB0aGluayAiY2tfZHNpX3BoeSIgd2FzIGludHJvZHVjZWQg
aW4gc3RtMzJoNyAKcGxhdGZvcm1zLiBUaGVyZSBpcyBhIG11eCB3aGljaCBpbnRlcmZhY2VzIGJl
dHdlZW4gdmFyaW91cyBjbG9ja3MgKGFtb25nIApja19oc2UpIGFuZCB0aGUgYnl0ZSBsYW5lIGNs
b2NrLiBzdG0zMmY0NjkgaGFzIGEgbXVjaCBzaW1wbGVyIGNsb2NrIHRyZWUgCmluIHdoaWNoIHdl
IGRpZCBub3QgYm90aGVyIHRvIGltcGxlbWVudCB0aGlzICJnby1iZXR3ZWVuIiBjbG9jaywgZXZl
biAKdGhvdWdoIHRoZXkgaXMgYW4gZXF1aXZhbGVudCBvZiB0aGUgbXV4LgoKPiBBZnRlciBzb21l
IHRlc3RpbmcsIHRoZSByZWFzb24gYmVoaW5kIG15IHByb2JsZW0gaXMgdGhlIHBhcmVudCdzIG5h
bWUgb2YKPiAnY2xrX2RzaV9waHknIGZvciBzdG0zMmY0IGlzICdjbGstaHNlJyBvdGhlciB0aGFu
ICdja19oc2UnLiAgSSBkb24ndAo+IGtub3cgd2hpY2ggaXMgdGhlIGJldHRlciB3aHkgdG8gZml4
IGl0Ogo+IDEuIENoYW5nZSAiY2tfaHNlIiB0byAiY2xrLWhzZSIgaW4gd2hlcmUgImNsa19kc2lf
cGh5IiBpcyBkZWZpbmVkLgpEb2luZyBzbyB3aWxsIGRlZmluaXRlbHkgYnJlYWsgb3RoZXIgcGxh
dGZvcm1zLgoKPiAyLiBVc2UgInBsbF9pbl9raHogPSBjbGtfZ2V0X3JhdGUoZHNpLT5wbGxyZWZf
Y2xrKSAvIDEwMDAiIGluc3RlYWQgb2YKPiAgICAgInBsbF9pbl9raHogPSAodW5zaWduZWQgaW50
KShwYXJlbnRfcmF0ZSAvIDEwMDApIiB3aGVuIGdldCB0aGUgY2xvY2sKPiAgICAgcmF0ZS4KZHNp
LT5wbGxyZWZfY2xrIHJlZmVycyB0byB0aGUgSFNFIGNsb2NrIGlmIHlvdSB0YWtlIGEgbG9vayBp
biB0aGUgCmRldmljZS10cmVlLiBUaGlzIGlzIHRoZSByZWFzb24gd2h5IHRoaXMgd29yayBvbiB5
b3VyIHNldHVwLiBJIGRvdWJ0IApuZXZlcnRoZWxlc3MgdGhhdCBpdCB3b3VsZG4ndCB3b3JrIG9u
IG90aGVyIHBsYXRmb3Jtcy4gQnV0IHRoaXMgd291bGQgYmUgCmEgc2VtYW50aWMgbm9uc2Vuc2Us
IHNpbmNlIHRoZSBEU0kgYnl0ZSBsYW5lIGNsb2NrIGlzIG5vdCBhbHdheXMgZGVyaXZlZCAKZnJv
bSBIU0UgY2xvY2sgb24gb3RoZXIgcGxhdGZvcm1zLgoKTG9va2luZyBhZ2FpbiBhdCB0aGUgY2xr
LXN0bTMyZjQgZHJpdmVyIGFuZCB0aGUgRFNJIGNsb2NrIHRyZWUgbGlua2VkLCAKd2UgY2FuIG1h
eWJlIGltcGxlbWVudCB0aGUgZGVzaXJlZCBjbG9jayBldmVuIGlmIGl0IGlzIG5vdCByZXByZXNl
bnRlZCAKb24gdGhlIGRpYWdyYW0uCgpFdmVudHVhbGx5IGlmIHRoaXMgc29sdXRpb24gZG9lcyBu
b3Qgd29yayB3ZSB3aWxsIGdvIHRvIHRoZSBzZWNvbmQgCnNvbHV0aW9uIHlvdSBzdWdnZXN0ZWQg
YW5kIHdlIHdpbGwgdGVzdCBpdCBvbiBhbGwgcGxhdGZvcm1zLgoKQFBoaWxpcHBlLCBAWWFubmlj
awpEbyB5b3UgYWdyZWUgd2l0aCB0aGlzIHdvcmtmbG93ID8KClJlZ2FyZHMsClJhcGhhw6tsCgoK
PiAKPiBCb3RoIG1ldGhvZCBjYW4gZml4IG15IHByb2JsZW0uIFRoZSBmaXJzdCBvbmUgbWlnaHQg
YnJlYWsgb3RoZXIKPiBwbGF0Zm9ybXMuIE1heWJlIEkgc2hvdWxkIGNoYW5nZSB0aGUgY2xvY2sg
bmFtZSBvZiAnY2xrLWhzZScuIEhvd2V2ZXIsCj4gSSBjYW4ndCBmaW5kIHRoZSBkZWZpbmF0aW9u
IG9mIHRoaXMgY2xvY2sgbmFtZSBmb3Igc3RtMzJmNC4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
