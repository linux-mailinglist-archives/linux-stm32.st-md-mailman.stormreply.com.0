Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80828337359
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 14:03:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29310C5718B;
	Thu, 11 Mar 2021 13:03:42 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CDFBC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 13:03:41 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id g27so21807103iox.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 05:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Z2pPn/+mgSna0fy0QdjgPCa/QMt444fJT7SataGADQ=;
 b=UHPfISDhXEU6YsOqntLTiQ5sCDD8bmgPFwUp7CSZkbXNhBUh6B5flbCCxHfEFVBRiy
 pQRhPCDQkVXV3kSgz1bFK2Vy4vnYpDe9zmruW23Qj7WoPE8zfgA7RsPE9P/S4xamdvia
 aPq/M1NKdjcbgIe7VIzCW0KUJvGw+Zvb8noaP29KJV/DE7PHM0GkXA2I3QxTZ2fdEqRL
 avp0EM9ykZ0iJHnd9aC3oXj4ZiygjP6QJANBgLCzEoqz1v0QFS26J3yTmVhw5Q8MnKVU
 NK7/f7hLB94oPZy+dXYYhtKvY1MzEQY+ntj6bxw0yMvuueuFGkRsJ7n9okaYTxULOPMV
 nSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Z2pPn/+mgSna0fy0QdjgPCa/QMt444fJT7SataGADQ=;
 b=jM0Ndg3c28lwHk6jwthaR7ZmR7e0px98opVvmEVxJxtrRcgDHIY+krZzOXE0eKeoPo
 spT2oemAlJKEih67eVSx2L/cRtxkozZRai5LaAkw5QHgRPIKIF/pEO3Z8RcnOUtN7voY
 rML196HYaPB0n/UmJi6yPhfdHem472tQqPQTpe1lR3qH5CbT+Qs+G89AE2u4roJ81s4H
 Zw2pUeDJBlusPM5PLNFSsQEIm2Ta379olVmUaJyBZQ9F/93RIZQbrMrVM3Ue5z2RCOHR
 /XbZCrYcLMalDtNtx7EhnWBkthlBQ0/am/j87q+Xjyv0kLf/lAzsPmWnVCULdHoVihfH
 M96A==
X-Gm-Message-State: AOAM533irjMlKTVAJKFGl7zSlz4gZG3LpLz2Jm6kYnCiN929vb8Tx5O8
 zh+iktgpsgUGUi1/C/6SaY1Ng5j6zAACE6mpM/8=
X-Google-Smtp-Source: ABdhPJwRAzuev2BWWFHijQ533wgwWUA060o1bf6cK1DacKsHHNmB8SrdLgXvW2BAJ9HnwSAQZo3ilh337tUjCLwwg1M=
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr3477812jas.10.1615467819949; 
 Thu, 11 Mar 2021 05:03:39 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-6-git-send-email-dillon.minfei@gmail.com>
 <b5f96460-dcdf-f40a-89d7-89def5669d7b@foss.st.com>
 <CAL9mu0+YFC97OBNLH-gip+MFKfdX4rAaxsFB4rMNrgjmhc5=Rw@mail.gmail.com>
 <d2549995-2b46-3f9a-e3d5-0e2bc21465d7@pengutronix.de>
In-Reply-To: <d2549995-2b46-3f9a-e3d5-0e2bc21465d7@pengutronix.de>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 11 Mar 2021 21:03:04 +0800
Message-ID: <CAL9mu0LgE9nfs-e6J5Yuzd+kCJLyhovUz94vc6qQATa9Br42xg@mail.gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 afzal.mohd.ma@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/8] ARM: dts: stm32: introduce
 stm32h7-pinctrl.dtsi to support stm32h75x
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

SGkgQWhtYWQsCgpUaGFua3MgZm9yIGRpc2N1c3NpbmcuCgpPbiBUaHUsIE1hciAxMSwgMjAyMSBh
dCA4OjU1IFBNIEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+
Cj4gSGVsbG8gRGlsbG9uLAo+Cj4gT24gMTEuMDMuMjEgMTM6MjMsIGRpbGxvbiBtaW4gd3JvdGU6
Cj4gPiBGb3Igc3RtMzJoNydzIG5ldyBib2FyZCBzdXBwb3J0ICwgSSBndWVzcyBmb2xsb3dpbmcg
dGhlIHN0bTMyZjcvc3RtMzJmNCdzIHN0eWxlCj4gPiBpcyBhIHJlYXNvbmFibGUgd2F5IHRvIGRv
IGl0LCBidXQgYWRkIGEgbGl0dGxlIG9wdGltaXphdGlvbuOAggo+ID4gd2hpY2ggbWVhbnMgOgo+
ID4gb2xkIHN0cnVjdHVyZQo+ID4gc3RtMzJoNy1waW5jdHJsLmR0c2kgLS0+IHN0bTMyaDc0My1w
aW5jdHJsLmR0c2kgIChyZWZlcmVuY2VkIGJ5Cj4gPiBzdG0zMmg3NDNpLWRpc2NvLCAtZXZhbCkK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfC0tPiBzdG0zMmg3NTAtcGluY3Ry
bC5kdHNpCj4gPiAocmVmZXJlbmNlZCBieSBzdG0zMmg3NTBpLWFydC1waSwgZXRjKQo+ID4gYWRk
IGFydC1waSBvdGhlciBib2FyZCdzIHBpbiBkZWZpbml0aW9uIGluIHN0bTMyaDc1MC1waW5jdHJs
LmR0c2kgd2l0aAo+ID4geHh4X3BpbnNfYSwgeHh4X3BpbnNfYgo+ID4geHh4X3BpbnNfYSB1c2Vk
IGZvciBhcnQtcGksIHh4eF9waW5zX2IgdXNlZCBmb3Igb3RoZXIgYm9hcmRzLgo+ID4KPiA+IGFm
dGVyIG1vcmUgYm9hcmRzIGFkZCBpbiBzdXBwb3J0LCB0aGVyZSB3aWxsIGJlIG1vcmUgeHh4X3Bp
bl9jLCAuLi4uIGRlZmluZWQKPiA+Cj4gPiBhcyB0aGUgcGluIG1hcCBpcyBhY2NvcmRpbmcgdG8g
dGhlIGhhcmR3YXJlIHNjaGVtYXRpYyBkaWFncmFtIGlvIGNvbm5lY3Rpb24uCj4gPiBzbywgd2h5
IG5vdCBtb3ZlIHh4eF9waW5feCB0byBhIGJvYXJkIHNwZWNpZmljIHBsYWNlLiBzdWNoIGFzCj4g
PiBzdG0zMmg3NTBpLWFydC1waS5kdHMKPiA+Cj4gPiBuZXcgc3RydWN0dXJlOgo+ID4gMSwgcmVu
YW1lIHN0bTMyaDc0My1waW5jdHJsLmR0c2kgdG8gc3RtMzJoNy1waW5jdHJsLmR0c2kgKG9ubHkK
PiA+IHByZXNlcnZlIGdwaW9hLi4uaywpCj4gPiAyLCBtb3ZlIHh4eF9waW5zX3ggZnJvbSBzdG0z
Mmg3LXBpbmN0cmwuZHRzaSB0bwo+ID4gc3RtMzJoN3h4LWRpc2NvL2V2YWwvYXJ0LXBpL2V0Yy5k
dHMgKGFzIHRoZXkgZGVwZW5kcyBvbiBoYXJkd2FyZQo+ID4gc2NoZW1hdGljKQo+ID4KPiA+IHN0
bTMyaDctcGluY3RybC5kdHNpIC0tPiBzdG0zMmg3NDNpLWRpc2Nvbi5kdHMKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfC0tPiBzdG0zMmg3NDNpLWV2YWwuZHRzCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwtLT4gc3RtMzJoNzUwaS1hcnQtcGkuZHRzCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwtLT4gc3RtMzJoN3h4eC5kdHMKPiA+
IHdvdWxkIHlvdSBhZ3JlZSB0aGlzID8KPgo+IElmIHRoZSBvcHRpbWl6YXRpb24geW91IGludGVu
ZCBpcyByZWR1Y2luZyBEVEIgc2l6ZSwgeW91IGNhbiBmbGFnCj4gYWxsIHBpbmN0cmwgZ3JvdXBz
IHdpdGggL29taXQtaWYtbm8tcmVmLyB0byBoYXZlIGR0YyB0aHJvdyB0aGVtCj4gYXdheSBpZiB0
aGV5IGFyZSB1bnVzZWQuClRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIGFjdHVhbGx5LCBEVEIgc2l6
ZSBpcyBub3QgbXkgZmlyc3QgY29uc2lkZXJhdGlvbi4KZGlmZmVyZW50IGJvYXJkIHBpbiBjb25m
aWd1cmF0aW9uIHBsYWNlIHRvIG9uZSBkdHNpIGZpbGVzLCBpdCdzIGEgbGl0dGxlIGhhcmQKdG8g
bWFpbnRhaW4gd2hlbiBhIGxvdCBvZiBib2FyZHMgYWRkIGluLgoKPgo+IChCdXQgaW4gZ2VuZXJh
bCwgSSBhbSBpbiBmYXZvciBvZiBoYXZpbmcgYm9hcmQtc3BlY2lmaWMgY29uZmlndXJhdGlvbgo+
ICBpbiB0aGUgYm9hcmQgZHRzKQpZZXMsIHNhbWUgdG8gbWUuCj4KPiBDaGVlcnMsCj4gQWhtYWQK
Pgo+IC0tCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiBTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAg
ICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfAo+IDMxMTM3IEhp
bGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5
MTctMCAgICB8Cj4gQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwg
RmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
