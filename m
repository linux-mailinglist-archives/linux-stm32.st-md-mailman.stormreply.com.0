Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FCB8B377D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 14:52:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3206C71293;
	Fri, 26 Apr 2024 12:51:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9046BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 12:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 559AD6206E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 12:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D962C32783
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714135916;
 bh=C7edbZ7NMwTLg39d0mj+uf5rqp23pLUcF27EjZiqoOw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uo+FlEzKuyJ+Dk4AFWz7hPEpdj2h80DNRmcM2eLlbvNHrQeNHWNbL3X05aLtBOHoi
 U2EYj8QjTRPdzmWCX2JUjcYRoeH3AjrS1v02ND6lY/zruUaglTt4zKXFChriaK4n2N
 8JMgydGQ9tWxrYV8+A4QYo4PtuI10Ae0YwldXYkf1kCgTxNd+ggqh2s/CQVStaWuCY
 ANAfjYvtRsIpXbqVgn+GahpWfJbfC2GU4ScgJ8MLIjguPxaB7dU1wcWaKPS18oIDjm
 sCZPVnkETN5iAAn1tGhHh4ajPuCSNf6LAQw+SAa9K4u4QOPiaM7y1NzO6sA4BGYvBU
 FrXwH1QYczXhA==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2dd64d6fe94so23002391fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 05:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKD1wWQ9M9hhpOlk6VDXu0gFxOyGke/wk5RcvdcriSHbkQdApazvg7enSpR6j/W1W8yEKXCsn+DMdPZvprJJHfvuWPFeDrhgdZZZwsWzSP4Gu1Yn84TJHs
X-Gm-Message-State: AOJu0YyAQRcYx/6JxKOmjtGrnurqIyFMP9K7gi78X/ehxlp1y2S0kT+V
 QGFoAUyRDH9LqUt2jaEc+xsasxM3fvE2lQNhFj8mvts0SnERj1g8mnh9SfJp2eUjPq/aiOzhgAv
 4iPHK9SqppOtfg7iFf+zpmvupSA==
X-Google-Smtp-Source: AGHT+IFSFyINrv8wT7arwvyPBnjADNddyOF8lWGUSuwveMOJGkmAYUl4rJj/SaMFmQ+EQyF49+4RKr1pX1bDOgTZScI=
X-Received: by 2002:a05:651c:210b:b0:2d8:4637:4062 with SMTP id
 a11-20020a05651c210b00b002d846374062mr1933367ljq.28.1714135914731; Fri, 26
 Apr 2024 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
 <20240425163035.GA2783061-robh@kernel.org>
 <28aeb8b1-72f1-4dd9-b433-f5b693150475@foss.st.com>
In-Reply-To: <28aeb8b1-72f1-4dd9-b433-f5b693150475@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Apr 2024 07:51:40 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KGd2tumATzhJu0aZDZ0C1k9VGm5_xxTiE1RE2KHs0hA@mail.gmail.com>
Message-ID: <CAL_Jsq+KGd2tumATzhJu0aZDZ0C1k9VGm5_xxTiE1RE2KHs0hA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: st: use a correct pwr compatible
	for stm32mp15
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgNjo0MuKAr0FNIFBhdHJpY2sgREVMQVVOQVkKPHBhdHJp
Y2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA0LzI1LzI0IDE4
OjMwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFRodSwgQXByIDI1LCAyMDI0IGF0IDA5OjQ4
OjMxQU0gKzAyMDAsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4gPj4gVGhpcyBwYXRjaHNldCBy
ZW1vdmVzIHRoZSB1bmV4cGVjdGVkIGNvbW1hIGluIHRoZSBQV1IgY29tcGF0aWJsZQo+ID4+ICJz
dCxzdG0zMm1wMSxwd3ItcmVnIiBhbmQgdXNlcyBhIG5ldyBjb21wYXRpYmxlICJzdCxzdG0zMm1w
MS1wd3ItcmVnIgo+ID4+IGluIFNUTTNNUDE1IGRldmljZSB0cmVlcy4KPiA+IFdoeT8gSSBkb24n
dCBzZWUgYW55IHdhcm5pbmdzIGZyb20gdGhpcy4gWWVzLCB3ZSB3b3VsZG4ndCBuZXcgY2FzZXMK
PiA+IGZvbGxvd2luZyB0aGlzIHBhdHRlcm4sIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRo
IG1haW50YWluaW5nCj4gPiBzdXBwb3J0IGZvciBib3RoIHN0cmluZ3MuIFdlJ3JlIHN0dWNrIHdp
dGggaXQuIEFuZCB0aGUgb25seSB3YXkgdG8KPiA+IG1haW50YWluIGZvcndhcmQgY29tcGF0aWJp
bGl0eSBpczoKPgo+Cj4gWWVzLCBubyB3YXJuaW5nIGJlY2F1c2UgdGhlIGNvbXBhdGlibGUgc3Ry
aW5nIGFyZSBub3QgeWV0IGNoZWNrZWQgYnkgdG9vbHMuCgpXaGF0IGRvIHlvdSBtZWFuPyBUaGVy
ZSdzIGEgc2NoZW1hIGZvciBpdCwgc28gaXQgaXMgY2hlY2tlZC4gSSByYW4gdGhlCnRvb2xzIGFu
ZCB0aGVyZSdzIG5vIHdhcm5pbmcuIElmIHRoZXJlIHdhcyBhIHdhcm5pbmcsIEknZCBmaXggdGhl
CnRvb2xzIGluIHRoaXMgY2FzZS4KCj4gSSBwcm9wb3NlIHRoaXMgcGF0Y2ggdG8gYXZvaWQgdGhl
IHVzYWdlIG9mIHRoaXMgY29tcGF0aWJsZSBmb3Igb3RoZXIgU29DCj4gaW4gU1RNMzJNUDEgZmFt
aWx5Lgo+Cj4KPiBJIHNlZSB0aGUgaW52YWxpZCBjb21wYXRpYmxlIHN0cmluZyB3aGVuIEkgcmV2
aWV3ZWQgdGhlIFUtQm9vdCBwYXRjaCB0bwo+IGFkZCB0aGUgUFdSIG5vZGUgZm9yIFNUTTMyTVAx
MyBmYW1pbHk6Cj4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3Qv
cGF0Y2gvMjAyNDAzMTkwMjQ1MzQuMTAzMjk5LTEtbWFyZXhAZGVueC5kZS8KPgoKUGVyaGFwcyB5
b3Ugc2hvdWxkIGFkZCBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgaW5zdGVhZC4KCj4g
U28gSSBwcmVmZXIgY2hhbmdlIHRoZSBQV1IgYmluZGluZyBiZWZvcmUgdG8gaGF2ZSB0aGUgc2Ft
ZSBwYXRjaCBhcHBsaWVkCj4gb24gTGludXggZGV2aWNlIHRyZWUKPgo+ID4gY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMS1wd3ItcmVnIiwgInN0LHN0bTMybXAxLHB3ci1yZWciOwo+Cj4KPiBZZXMs
IEkgd2lsbCB1cGRhdGUgdGhlIFNvQyBwYXRjaCB3aXRoIHlvdSBwcm9wb3NhbC4KCk5PISBXZSBk
b24ndCB3YW50IHRvIHN1cHBvcnQgdGhhdC4KCldlIGhhdmUgKnRvbnMqIG9mIGV4YW1wbGVzIGlu
IERUIHdoaWNoIGRvbid0IGZvbGxvdyByZWNvbW1lbmRlZApwYXR0ZXJucyBhbmQgd2UncmUgc3R1
Y2sgd2l0aCB0aGVtLiBUaGlzIGlzIG5vIGRpZmZlcmVudC4gV2UgY2FuIGdldAphd2F5IHdpdGgg
Y2hhbmdpbmcgbm9kZSBuYW1lcywgYnV0IHRoYXQncyBhYm91dCBpdC4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
