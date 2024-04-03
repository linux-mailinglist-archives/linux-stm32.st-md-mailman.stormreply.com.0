Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF1896457
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 08:04:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8745C6C83C;
	Wed,  3 Apr 2024 06:04:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A790C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 02:01:15 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5c6bd3100fcso3562360a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 19:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712109674; x=1712714474;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZEDMsVuuuoQ1174prvc6pVoSXIXrvtv4pXkECgOo8mQ=;
 b=fyvfxklZAW9kY9BtZh2wma4vhqJXF2T+nQSI9frHTRvovUtDjSBSOc9Y1Q8xD3Wy9V
 PbZftH8Cd4jBkkwwtJ8IETbgYErgqOThL3592RZu4KBbPhEL457fGUPnNOmiq5N6HpuU
 t92PDhNzYKglAZtdf0c+Utl2DDa/PyWh1nt6DiF0j4phRUmF5vd79kACa+1vfO/r0Ew2
 aJZrcVWwlJsKWick/2AxTh0vc6OHL+2i0K1g0IFZ/tc4pon/j4gwrrL3iK+h/PV3QSDt
 9k28+qAvHAA4FXYsDEHQ1OHNFYXw6ykF5IlRbuB1DoPbPXtiZKMpO12VizMZNqP3ZvZV
 7nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712109674; x=1712714474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEDMsVuuuoQ1174prvc6pVoSXIXrvtv4pXkECgOo8mQ=;
 b=S979QcB6oYnOOFtxM+JAcF4jcC+59WnjFiNlgZf3lZhmM4gPmVunFRLaaQ8EkQyKM4
 FNnVlOR92uP2QKLjWLf+5oiY01LCuVBMAbVOrLcJlAOAyaJ6GjZDAukENBAWloOnR5Gp
 AFPasLvpukH7eJ0UsIvC2wZWQs+SJZJOH+PAC9C8Au2T4qNu/pm8gKEGnf6+6tGu8tBO
 cRRAoyenp9uw+Jm4bSGfjHbwb/dnzgSZRdB8lbmGn4ctpl+Rqm9IAHFAl2XVD3VWO6OD
 clsqNuwR4reUFSGfKb6Iro36GhpoMYKOkp9JizB/stkIi3DXBl4TkL6ZJl97wL3BKAwU
 qVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaUFIWOAxLo3J7neqL+TkVEZZKC9ZgNsUcteLoDP/GzPdKLVMEk0eNbkicRHCmL+U/wNTNQV8Bvg+IBTognTJmyCBbdsgzcLTEAlP9fHcXKJ/WohKz3AV4
X-Gm-Message-State: AOJu0YyQeGVasO139xIqQWo4+szX8Y1f7h+FJT1j/rOdk6pGCnOC2lbb
 r6xysMlvxLXXd28sWNRJqaJOKrg4ZXDfFqsfkttjKYov/RhDEDfqmBG9yopO8aqYc8inFZqvlrE
 xdal0CKxdxVwb/pwNUUc53xMjMao=
X-Google-Smtp-Source: AGHT+IEkuAu1KEHf0qNFo3/DEdx3/SbuyX9NHysxtbJHzqInyoOkwHICDgHTkvCxXHRJIXikQW4riTdj8T+ZtnHQn1c=
X-Received: by 2002:a17:90a:5909:b0:29d:e70f:7240 with SMTP id
 k9-20020a17090a590900b0029de70f7240mr12467666pji.11.1712109673683; Tue, 02
 Apr 2024 19:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240327110142.159851-1-cathy.cai@unisoc.com>
 <d1da7fdb-10f6-7f69-4820-520469c0193c@bootlin.com>
In-Reply-To: <d1da7fdb-10f6-7f69-4820-520469c0193c@bootlin.com>
From: cathy cai <cathycai0714@gmail.com>
Date: Wed, 3 Apr 2024 10:01:02 +0800
Message-ID: <CAG8gwPWFdckcoP5apUxP1E9haiet=XkRXH4LBygMN2awiVMabA@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
X-Mailman-Approved-At: Wed, 03 Apr 2024 06:04:08 +0000
Cc: joabreu@synopsys.com, cixi.geng1@unisoc.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, zhiguo.niu@unisoc.com, xuewen.yan94@gmail.com,
 mcoquelin.stm32@gmail.com, Cathy Cai <cathy.cai@unisoc.com>, kuba@kernel.org,
 wade.shu@unisoc.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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

SGkgUm9tYWluLAoKT24gU3VuLCBNYXIgMzEsIDIwMjQgYXQgNDozNeKAr1BNIFJvbWFpbiBHYW50
b2lzCjxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBDYXRoeSwK
Pgo+IE9uIFdlZCwgMjcgTWFyIDIwMjQsIENhdGh5IENhaSB3cm90ZToKPgo+ID4gVHggcXVldWUg
dGltZSBvdXQgdGhlbiByZXNldCBhZGFwdGVyLiBXaGVuIHJlc2V0IHRoZSBhZGFwdGVyLCBzdG1t
YWMgZHJpdmVyCj4gPiBzZXRzIHRoZSBzdGF0ZSB0byBTVE1NQUNfRE9XTiBhbmQgY2FsbHMgZGV2
X2Nsb3NlKCkgZnVuY3Rpb24uIElmIGFuIGludGVycnVwdAo+ID4gaXMgdHJpZ2dlcmVkIGF0IHRo
aXMgaW5zdGFudCBhZnRlciBzZXR0aW5nIHN0YXRlIHRvIFNUTU1BQ19ET1dOLCBiZWZvcmUgdGhl
Cj4gPiBkZXZfY2xvc2UoKSBjYWxsLgo+ID4KPiAuLi4KPiA+IC0gICAgIHNldF9iaXQoU1RNTUFD
X0RPV04sICZwcml2LT5zdGF0ZSk7Cj4gPiAgICAgICBkZXZfY2xvc2UocHJpdi0+ZGV2KTsKPiA+
ICsgICAgIHNldF9iaXQoU1RNTUFDX0RPV04sICZwcml2LT5zdGF0ZSk7Cj4gPiAgICAgICBkZXZf
b3Blbihwcml2LT5kZXYsIE5VTEwpOwo+ID4gICAgICAgY2xlYXJfYml0KFNUTU1BQ19ET1dOLCAm
cHJpdi0+c3RhdGUpOwo+ID4gICAgICAgY2xlYXJfYml0KFNUTU1BQ19SRVNFVElORywgJnByaXYt
PnN0YXRlKTsKPgo+IElmIHRoaXMgSVJRIGlzc3VlIGNhbiBoYXBwZW4gd2hlbmV2ZXIgU1RNTUFD
X0RPV04gaXMgc2V0IHdoaWxlIHRoZSBuZXQgZGV2aWNlIGlzCj4gb3BlbiwgdGhlbiBpdCBjb3Vs
ZCBhbHNvIGhhcHBlbiBiZXR3ZWVuIHRoZSBkZXZfb3BlbigpIGFuZAo+IGNsZWFyX2JpdChTVE1N
QUNfRE9XTikgY2FsbHMgcmlnaHQ/IFNvIHlvdSdkIGhhdmUgdG8gY2xlYXIgU1RNTUFDX0RPV04g
YmVmb3JlCj4gY2FsbGluZyBkZXZfb3BlbigpIGJ1dCB0aGVuIEkgZG9uJ3Qgc2VlIHRoZSB1c2Vm
dWxuZXNzIG9mIHNldHRpbmcgU1RNTUFDX0RPV04KPiBhbmQgY2xlYXJpbmcgaXQgaW1tZWRpYXRl
bHkuIE1heWJlIGNsb3NpbmcgYW5kIG9wZW5pbmcgdGhlIG5ldCBkZXZpY2Ugc2hvdWxkIGJlCj4g
ZW5vdWdoPwo+CiBZZXMuIEl0IGNvdWxkIGFsc28gaGFwcGVuIGJldHdlZW4gdGhlIGRldl9vcGVu
KCkgYW5kCmNsZWFyX2JpdChTVE1NQUNfRE9XTikgY2FsbHMuCkFsdGhvdWdoIHdlIGRpZCBub3Qg
cmVwcm9kdWNlIHRoaXMgc2NlbmFyaW8sIGl0IHNob3VsZCBoYXZlIGhhcHBlbmVkCmlmIHdlIGhh
ZCBpbmNyZWFzZWQKdGhlIG51bWJlciBvZiB0ZXN0IHNhbXBsZXMuIEluIGFkZGl0aW9uLCBJIGZv
dW5kIHRoYXQgb3RoZXIgcGVvcGxlIGhhZApzaW1pbGFyIHByb2JsZW1zIGJlZm9yZS4KVGhlIGxp
bmsgaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDIwODE0MDgyMC4xMDQxMC0x
MS1TZXJnZXkuU2VtaW5AYmFpa2FsZWxlY3Ryb25pY3MucnUvCgo+Cj4gTW9yZW92ZXIsIGl0IHNl
ZW1zIHN0cmFuZ2UgdG8gbWUgdGhhdCBzdG1tYWNfaW50ZXJydXB0KCkgdW5jb25kaXRpb25uYWxs
eQo+IGlnbm9yZXMgaW50ZXJydXB0cyB3aGVuIHRoZSBkcml2ZXIgaXMgaW4gU1RNTUFDX0RPV04g
c3RhdGUuIFRoaXMgc2VlbXMgbGlrZQo+IGRhbmdlcm91cyBiZWhhdmlvdXIsIHNpbmNlIGl0IGNv
dWxkIGNhdXNlIElSUSBzdG9ybSBpc3N1ZXMgd2hlbmV2ZXIgc29tZXRoaW5nCj4gaW4gdGhlIGRy
aXZlciBzZXRzIHRoaXMgc3RhdGUuIEknbSBub3QgdG9vIGZhbWlsaWFyIHdpdGggdGhlIGludGVy
cnVwdCBoYW5kbGluZwo+IGluIHRoaXMgZHJpdmVyLCBidXQgbWF5YmUgc3RtbWFjX2ludGVycnVw
dCgpIGNvdWxkIGNsZWFyIGludGVycnVwdHMKPiB1bmNvbmRpdGlvbm5hbGx5IGluIHRoZSBTVE1N
QUNfRE9XTiBzdGF0ZT8KPgpDbGVhciBpbnRlcnJ1cHRzIHVuY29uZGl0aW9uYWxseSBpbiB0aGUg
U1RNTUFDX0RPV04gc3RhdGUgZGlyZWN0bHkKY2VydGFpbmx5IHdvbid0IGNhdXNlIHRoaXMgcHJv
YmxlbS4KVGhpcyBtYXkgYmUgdG9vIHJvdWdoLCBtYXliZSB0aGlzIGRlc2lnbiBoYXMgb3RoZXIg
Y29uc2lkZXJhdGlvbnMuCgo+Cj4gQmVzdCBSZWdhcmRzLAo+Cj4gLS0KPiBSb21haW4gR2FudG9p
cywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRw
czovL2Jvb3RsaW4uY29tCgogQmVzdCBSZWdhcmRzLApDYXRoeQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
