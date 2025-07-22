Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A3B0DD93
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 16:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9D47C3F93F;
	Tue, 22 Jul 2025 14:16:48 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3833C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 14:16:47 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e8bd2eaf8ccso5061186276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753193806; x=1753798606;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVf9s+VBrCxFX0/0lHXJexCtjFH2FtKEcOQbNsybb/U=;
 b=Chke+E2PyBzgJz+uUbhSBIBjqnCMB9Mw0+stkyWz/w0H1yxMHw9i8UhWR7siMP4fYV
 LLvOhaceTAEFESAYie4LeYhILsIm6Gy3ekdZEVZfpm5WcCgCB7QEui+BMtjBhZw9f0R6
 jjdzV3sQITFC5uHsS+MTqXQVn1gDwFjtdSKmSv2AnUbgZODlAFpiIBXwbZFTrbk/7+gK
 cIgAZs6K9siTVkhCb43TUoW/CqlSfKZWptbAf5WM7ooS1HBQwdCyT2G/w/GoYKM9PkbY
 mb4mnJXjbiOSi827N9mNrOeeLzLWIRnB0PCZz3aE0xCGIuGixnqtjo+9s9g8XjEwRLxl
 paDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753193806; x=1753798606;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tVf9s+VBrCxFX0/0lHXJexCtjFH2FtKEcOQbNsybb/U=;
 b=dT3/+WfJaAkUe0GxQK1VdgUYb+FouA3xy654uDhb3f0pUC+YbWJnRfxHm5kb4WEL81
 Fz5p9BGKJS3Pf2njjnlVXBMYeh9XaRrwiOdxFdlycFszfWk3Jw3j7+rrCsrri+K0FiBU
 mgv/1MajXks6Fzz1sA5DfscoWqBDFd4DTuV+9zPo2LL68yuAh+o1GnSq9pqTuLx02RvI
 Xsu/7fAw88NetXzuZIACHwINj8xBZPflkxZWxoIDe3FFBiQKyxh3XnyThGV+Gu1SpJ2d
 AKqCSSLkt0dp53akANf5KBbvD4MXXHh3kqXKR9USMm7YSvHwpJB0DCHsbsx+6zUWdB6/
 HS6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlodeyfRkAydhPs0CJ1bcXDRmOBTU5C7vYLHg2orPoTMER8TVvY9BzBsogxFGZDFutgx5+pm1crvHFjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyZ4u+NbkNYiovJvsoYMz15BpXy6gvudLH7CY5VUpQRAcnulRap
 G/YDxlSsEfA3yAFtFby2WX0gPv4mffqEMyqrRLgODVyjXxZlfwngmmSH
X-Gm-Gg: ASbGncu9f07Z0Q9GM+CnjLxqRFUSiiupaCQUX2RRoHbOktS5T53AG1+HfDBOtUFp4aE
 EvrapGmonaMCrZn20WGo9mpxYz4+htYL8NhIQQSPQIFzz8lwnqF26bm5Q92nHJ0xs6SuGyNpWP3
 AlazQhLu5oOXDIcJE0Ik5zRvZ0pKNj8eK1wSoq3aZ2b+87XdreKyKig8pyXXV5ksP/ojG7iCoYd
 l5imHsgesfyAVX9s185wu4Kdgq3AbhyL8NNVLLNRTwskn3uioQMKnDMIQ0L5D6Q8CaCf/D6bJBc
 4BuVTTPRkDlAvwMoZxDrwRfGx3VmOAiEwmcw62T4OZ+4IMuaNXm4fhME6E7FYYfo26IBC04PAw9
 Ma+/WHNzdCng4N7pnVAzE/MkJriDinb3f5Jc2VhoPc2Kyaodq4s+V76m+/V6Ge3GbPi+XQg==
X-Google-Smtp-Source: AGHT+IHP7FxitzXESY9w0S6KZhfv95yINoBxcZiXaQntPpFdLn7KC8PXaCXmQQWqLiwrO+Z+Yy7ijA==
X-Received: by 2002:a05:6902:2210:b0:e8b:b593:b06b with SMTP id
 3f1490d57ef6-e8c5f8acfb2mr24476660276.28.1753193806375; 
 Tue, 22 Jul 2025 07:16:46 -0700 (PDT)
Received: from localhost (23.67.48.34.bc.googleusercontent.com. [34.48.67.23])
 by smtp.gmail.com with UTF8SMTPSA id
 3f1490d57ef6-e8d7cc0b1cesm3206309276.3.2025.07.22.07.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 07:16:45 -0700 (PDT)
Date: Tue, 22 Jul 2025 10:16:44 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <687f9d4cf0b14_2aa7cc29443@willemb.c.googlers.com.notmuch>
In-Reply-To: <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-2-kerneljasonxing@gmail.com>
 <8c9e97e4-3590-49a8-940b-717deac0078d@molgen.mpg.de>
 <CAL+tcoAP7Zk7A4pzK-za+_NMoX11SGR3ubtY6R+aaywoEq_H+g@mail.gmail.com>
Mime-Version: 1.0
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
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

SmFzb24gWGluZyB3cm90ZToKPiBIaSBQYXVsLAo+IAo+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0
IDQ6NTbigK9QTSBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPiB3cm90ZToKPiA+
Cj4gPiBEZWFyIEphc29uLAo+ID4KPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCj4g
Cj4gVGhhbmtzIGZvciB5b3VyIHF1aWNrIHJlc3BvbnNlIGFuZCByZXZpZXcgOikKPiAKPiA+Cj4g
PiBBbSAyMS4wNy4yNSB1bSAxMDozMyBzY2hyaWViIEphc29uIFhpbmc6Cj4gPiA+IEZyb206IEph
c29uIFhpbmcgPGtlcm5lbHhpbmdAdGVuY2VudC5jb20+Cj4gPiA+Cj4gPiA+IFRoZSBpc3N1ZSBj
YW4gaGFwcGVuIHdoZW4gdGhlIGJ1ZGdldCBudW1iZXIgb2YgZGVzY3MgYXJlIGNvbnN1bWVkLiBB
cwo+ID4KPiA+IEluc3RlYWQgb2Yg4oCcVGhlIGlzc3Vl4oCdLCBJ4oCZZCB1c2Ug4oCcQW4gdW5k
ZXJmbG93IOKApuKAnS4KPiAKPiBXaWxsIGNoYW5nZSBpdC4KPiAKPiA+Cj4gPiA+IGxvbmcgYXMg
dGhlIGJ1ZGdldCBpcyBkZWNyZWFzZWQgdG8gemVybywgaXQgd2lsbCBhZ2FpbiBnbyBpbnRvCj4g
PiA+IHdoaWxlIChidWRnZXQtLSA+IDApIHN0YXRlbWVudCBhbmQgZ2V0IGRlY3JlYXNlZCBieSBv
bmUsIHNvIHRoZQo+ID4gPiB1bmRlcmZsb3cgaXNzdWUgY2FuIGhhcHBlbi4gSXQgd2lsbCBsZWFk
IHRvIHJldHVybmluZyB0cnVlIHdoZXJlYXMgdGhlCj4gPiA+IGV4cGVjdGVkIHZhbHVlIHNob3Vs
ZCBiZSBmYWxzZS4KPiA+Cj4gPiBXaGF0IGlzIOKAnGl04oCdPwo+IAo+IEl0IG1lYW5zICd1bmRl
cmZsb3cgb2YgYnVkZ2V0JyBiZWhhdmlvci4KCkEgdGVjaG5pY2FsaXR5LCBidXQgdGhpcyBpcyAo
bmVnYXRpdmUpIG92ZXJmbG93LgoKVW5kZXJmbG93IGlzIGEgY29tcHV0YXRpb24gdGhhdCByZXN1
bHRzIGluIGEgdmFsdWUgdGhhdCBpcyB0b28gc21hbGwKdG8gYmUgcmVwcmVzZW50ZWQgYnkgdGhl
IGdpdmVuIHR5cGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
