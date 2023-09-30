Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4F7B5414
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B657C6C834;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE3FCC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 12:11:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-503065c4b25so23145242e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696075878; x=1696680678;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WtnC/PPyPj74Iu0UvHPPAxPUeaSVlrJc75BjIoxyTKw=;
 b=B97YSH6F4ZZRsYJGGXZ9UrCkke03WIEQNXBQpprSmeuZb+4ouwvMsaq/JqbEJrm/yf
 PpCbgZHMMf8Bg3YWpntd+brN8qIktDRJaRXSa5rg+P0TXwrxeSMCuVEjxA52FnYx0vPT
 9/r3JvWmZJJEUPizrbPf/MO48rg9kveODpPsjNYMgpKQv6sTHMmD8wZ9kPTjnSd2OXYQ
 C7d0kYo85158okWWStl+JDJJPsIYyS+Ke3wQVgADa9UWNA9AawPwINThj5WFXTBmPH6W
 obYrvj6//snpkzZU6mvq4ZVoJEKAwoEJeXqHdu0LhvWWpix8sIqK8j2aThV061cwDKqA
 3Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696075878; x=1696680678;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtnC/PPyPj74Iu0UvHPPAxPUeaSVlrJc75BjIoxyTKw=;
 b=Kjnx7dawz/0mFkTgU8Q3+KmV2eLwZaBeMYFpteUhafCGNKy0xnL5Nfjcl4eo/7h85r
 uPCaAoUgWYa4RTp68msDEYa+2MNpbAB9ekvWWOfrcDpP1x0ErXA0b3VFKqrRvX4JPL4h
 XE2ri1+AaHXlDMt1sQFdSBGsCPyFWdcaM3jCHuY79VWMgkmKBgp9SyH7f8UqsW/WRLTp
 3Efrdxu4lzAicBvGhgr2AB5nLk9Yt9wVQk2ioWd3UE9tXGKd4YKFsROPZUop5rujd4uR
 wubkMZ76WCu3hk1xzVh9/vR0umnI/a9xd9iX7i5Dd0WUJ3jc94VI/YG0HUqCACQ0MpqY
 l35g==
X-Gm-Message-State: AOJu0Yzg59OD0A6H6yLiYlGsrHFxNBIU6POyaHZ7NrGaYq9+3fGrI3Ii
 11Vu2rsrnG5jES9uw4Hd3BM=
X-Google-Smtp-Source: AGHT+IGHesckMWtWKsZ4Gjdi7ogmxfGi0Ya7zSMnahJcG3tTdZGHYYgMrSOA2n+sXZuEk6OdWLlAWA==
X-Received: by 2002:a19:2d0b:0:b0:4fb:8f79:631 with SMTP id
 k11-20020a192d0b000000b004fb8f790631mr4892124lfj.46.1696075877588; 
 Sat, 30 Sep 2023 05:11:17 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c298100b0040586360a36sm3291365wmd.17.2023.09.30.05.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 05:11:16 -0700 (PDT)
Message-ID: <65181064.050a0220.7887c.c7ee@mx.google.com>
X-Google-Original-Message-ID: <ZRgQYriLmsH4HiBx@Ansuel-xps.>
Date: Sat, 30 Sep 2023 14:11:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
X-Mailman-Approved-At: Mon, 02 Oct 2023 13:37:12 +0000
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 1/3] net: introduce
	napi_is_scheduled helper
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

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMDE6NTk6NTNQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDE6MTPigK9QTSBDaHJpc3RpYW4gTWFyYW5n
aSA8YW5zdWVsc210aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFdlIGN1cnJlbnRseSBoYXZl
IG5hcGlfaWZfc2NoZWR1bGVkX21hcmtfbWlzc2VkIHRoYXQgY2FuIGJlIHVzZWQgdG8KPiA+IGNo
ZWNrIGlmIG5hcGkgaXMgc2NoZWR1bGVkIGJ1dCB0aGF0IGRvZXMgbW9yZSB0aGluZyB0aGFuIHNp
bXBseSBjaGVja2luZwo+ID4gaXQgYW5kIHJldHVybiBhIGJvb2wuIFNvbWUgZHJpdmVyIGFscmVh
ZHkgaW1wbGVtZW50IGN1c3RvbSBmdW5jdGlvbiB0bwo+ID4gY2hlY2sgaWYgbmFwaSBpcyBzY2hl
ZHVsZWQuCj4gPgo+ID4gRHJvcCB0aGVzZSBjdXN0b20gZnVuY3Rpb24gYW5kIGludHJvZHVjZSBu
YXBpX2lzX3NjaGVkdWxlZCB0aGF0IHNpbXBseQo+ID4gY2hlY2sgaWYgbmFwaSBpcyBzY2hlZHVs
ZWQgYXRvbWljYWxseS4KPiA+Cj4gPiBVcGRhdGUgYW55IGRyaXZlciBhbmQgY29kZSB0aGF0IGlt
cGxlbWVudCBhIHNpbWlsYXIgY2hlY2sgYW5kIGluc3RlYWQKPiA+IHVzZSB0aGlzIG5ldyBoZWxw
ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhA
Z21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdi
My9zZ2UuYyAgfCA4IC0tLS0tLS0tCj4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9y
dHc4OS9jb3JlLmMgfCAyICstCj4gPiAgaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaCAgICAgICAg
ICAgICAgICAgfCA1ICsrKysrCj4gPiAgbmV0L2NvcmUvZGV2LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
aGVsc2lvL2N4Z2IzL3NnZS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9z
Z2UuYwo+ID4gaW5kZXggMmU5YTc0ZmUwOTcwLi43MWZhMmRjMTkwMzQgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2IzL3NnZS5jCj4gPiArKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2IzL3NnZS5jCj4gPiBAQCAtMjUwMSwxNCArMjUw
MSw2IEBAIHN0YXRpYyBpbnQgbmFwaV9yeF9oYW5kbGVyKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFw
aSwgaW50IGJ1ZGdldCkKPiA+ICAgICAgICAgcmV0dXJuIHdvcmtfZG9uZTsKPiA+ICB9Cj4gPgo+
ID4gLS8qCj4gPiAtICogUmV0dXJucyB0cnVlIGlmIHRoZSBkZXZpY2UgaXMgYWxyZWFkeSBzY2hl
ZHVsZWQgZm9yIHBvbGxpbmcuCj4gPiAtICovCj4gPiAtc3RhdGljIGlubGluZSBpbnQgbmFwaV9p
c19zY2hlZHVsZWQoc3RydWN0IG5hcGlfc3RydWN0ICpuYXBpKQo+ID4gLXsKPiA+IC0gICAgICAg
cmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSk7Cj4gPiAtfQo+
ID4gLQo+ID4gIC8qKgo+ID4gICAqICAgICBwcm9jZXNzX3B1cmVfcmVzcG9uc2VzIC0gcHJvY2Vz
cyBwdXJlIHJlc3BvbnNlcyBmcm9tIGEgcmVzcG9uc2UgcXVldWUKPiA+ICAgKiAgICAgQGFkYXA6
IHRoZSBhZGFwdGVyCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRl
ay9ydHc4OS9jb3JlLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvcmUu
Ywo+ID4gaW5kZXggMTMzYmYyODliYWNiLi5iYmY0ZWEzNjM5ZDQgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvcmUuYwo+ID4gKysrIGIvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmMKPiA+IEBAIC0xNzQ0LDcgKzE3NDQs
NyBAQCBzdGF0aWMgdm9pZCBydHc4OV9jb3JlX3J4X3RvX21hYzgwMjExKHN0cnVjdCBydHc4OV9k
ZXYgKnJ0d2RldiwKPiA+ICAgICAgICAgc3RydWN0IG5hcGlfc3RydWN0ICpuYXBpID0gJnJ0d2Rl
di0+bmFwaTsKPiA+Cj4gPiAgICAgICAgIC8qIEluIGxvdyBwb3dlciBtb2RlLCBuYXBpIGlzbid0
IHNjaGVkdWxlZC4gUmVjZWl2ZSBpdCB0byBuZXRpZi4gKi8KPiA+IC0gICAgICAgaWYgKHVubGlr
ZWx5KCF0ZXN0X2JpdChOQVBJX1NUQVRFX1NDSEVELCAmbmFwaS0+c3RhdGUpKSkKPiA+ICsgICAg
ICAgaWYgKHVubGlrZWx5KCFuYXBpX2lzX3NjaGVkdWxlZChuYXBpKSkpCj4gPiAgICAgICAgICAg
ICAgICAgbmFwaSA9IE5VTEw7Cj4gPgo+ID4gICAgICAgICBydHc4OV9jb3JlX2h3X3RvX3NiYW5k
X3JhdGUocnhfc3RhdHVzKTsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L25ldGRldmlj
ZS5oIGIvaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaAo+ID4gaW5kZXggZGIzZDg0MjlkNTBkLi44
ZWFjMDBjZDNiOTIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L25ldGRldmljZS5oCj4g
PiArKysgYi9pbmNsdWRlL2xpbnV4L25ldGRldmljZS5oCj4gPiBAQCAtNDgyLDYgKzQ4MiwxMSBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgbmFwaV9wcmVmZXJfYnVzeV9wb2xsKHN0cnVjdCBuYXBpX3N0
cnVjdCAqbikKPiA+ICAgICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfUFJFRkVSX0JV
U1lfUE9MTCwgJm4tPnN0YXRlKTsKPiA+ICB9Cj4gPgo+IAo+IAo+IEluIHdoaWNoIGNvbnRleHQg
aXMgaXQgc2FmZSB0byBjYWxsIHRoaXMgaGVscGVyID8KPgoKdGVzdF9iaXQgaXMgYXRvbWljIHNv
IGl0IHNob3VsZCBiZSBhbHdheXMgc2FmZS4gQWxzbyB0aGUgaWRlYSBvZiB0aGlzCmNoZWNrIChh
bmQgZnJvbSB3aGF0IEkgY2FuIHNlZSB0aGlzIGFwcGx5IGFsc28gdG8gdGhlIG90aGVyIDIgdXNl
cikgaXMKc29tZWhvdyBiZXN0IGVmZm9ydCwgd2UgY2hlY2sgaWYgaW4gdGhlIGN1cnJlbnQgaXN0
YW50IHRoZXJlIGlzIGEgbmFwaQpzY2hlZHVsZWQgYW5kIHdlIGFjdC4KCj4gSSBmZWFyIHRoYXQg
bWFraW5nIHRoaXMgYXZhaWxhYmxlIHdpbGwgYWRkIG1vcmUgYnVncy4KPiAKPiBGb3IgaW5zdGFu
Y2UgcnNwcV9jaGVja19uYXBpKCkgc2VlbXMgYnVnZ3kgdG8gbWUuCj4gCgpNaGhoIHdoeT8gQW0g
SSBvcGVuaW5nIGEgY2FuIG9mIHdvcm1zPwoKPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgbmFwaV9p
c19zY2hlZHVsZWQoc3RydWN0IG5hcGlfc3RydWN0ICpuKQo+IAo+IGNvbnN0IC4uLgo+IAoKV2ls
bCBjaGFuZ2UgaW4gdjIuIFRoYW5rcyEKCj4gPiArewo+ID4gKyAgICAgICByZXR1cm4gdGVzdF9i
aXQoTkFQSV9TVEFURV9TQ0hFRCwgJm4tPnN0YXRlKTsKPiA+ICt9Cj4gPiArCj4gPiAgYm9vbCBu
YXBpX3NjaGVkdWxlX3ByZXAoc3RydWN0IG5hcGlfc3RydWN0ICpuKTsKPiA+Cj4gPiAgLyoqCj4g
PiBkaWZmIC0tZ2l0IGEvbmV0L2NvcmUvZGV2LmMgYi9uZXQvY29yZS9kZXYuYwo+ID4gaW5kZXgg
Y2MwM2E1NzU4ZDJkLi4zMmJhODAwMmY2NWEgMTAwNjQ0Cj4gPiAtLS0gYS9uZXQvY29yZS9kZXYu
Ywo+ID4gKysrIGIvbmV0L2NvcmUvZGV2LmMKPiA+IEBAIC02NTIzLDcgKzY1MjMsNyBAQCBzdGF0
aWMgaW50IF9fbmFwaV9wb2xsKHN0cnVjdCBuYXBpX3N0cnVjdCAqbiwgYm9vbCAqcmVwb2xsKQo+
ID4gICAgICAgICAgKiBhY2NpZGVudGFsbHkgY2FsbGluZyAtPnBvbGwoKSB3aGVuIE5BUEkgaXMg
bm90IHNjaGVkdWxlZC4KPiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIHdvcmsgPSAwOwo+ID4g
LSAgICAgICBpZiAodGVzdF9iaXQoTkFQSV9TVEFURV9TQ0hFRCwgJm4tPnN0YXRlKSkgewo+ID4g
KyAgICAgICBpZiAobmFwaV9pc19zY2hlZHVsZWQobikpIHsKPiA+ICAgICAgICAgICAgICAgICB3
b3JrID0gbi0+cG9sbChuLCB3ZWlnaHQpOwo+ID4gICAgICAgICAgICAgICAgIHRyYWNlX25hcGlf
cG9sbChuLCB3b3JrLCB3ZWlnaHQpOwo+ID4gICAgICAgICB9Cj4gPiAtLQo+ID4gMi40MC4xCj4g
PgoKLS0gCglBbnN1ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
