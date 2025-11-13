Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A6C5865F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 16:32:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8F5BC628D4;
	Thu, 13 Nov 2025 15:32:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE780C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 15:32:33 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2984dfae0acso11046035ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763047952; x=1763652752;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
 b=F7r5qlh4yIQVjIKp33EfFR8KzKEMmz/qVkzOHZFdEdy+7sHkIa6usN+lD1p8tMULyg
 8+wn4f7sZjP79ceWlPUwjS8Yl2iUgFMCd2qAr2b8ocOv5rthbMqJ2HHaFpyTLvPxpkx7
 N3a6Trih69DtpmYQC/8ScSCSge+bRBYuJXn+oXgQcHuwFffhbGecwxB6/nsh9jHgbzpp
 g5QUla3fSlu4xxO9RMwjDI8TWs63wE0MaabNf+5HmWJr+xY4cREeBkAPG2aa2ca5SyMY
 USdU6kWmkpnNeWfmotogW0C8+vlhBdMeaSj1fXPQOnHfbhNQE3klJ5sRz860GhpZE9bc
 9IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763047952; x=1763652752;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dc807XTs3vahOFZ04ibLRMSAJaCm4V/IMq6B1/2zPgY=;
 b=QTG+oduWYIkxuB5XIO0DT5HxRGl0BlhWPZ8Jptrnh1nZ7YKUn+R7bZnV8V0J6T92Ou
 buuEtaep6dQMMWniMVHTOsISushb2FjH0H4EwxGs1gmWS2IoRa2OPv/XpalAVQ4LanXr
 2HxPrqmt4iYUiDezE4xTxjqkRgfcVI3T0u9vc6HkCa05u2NYciIjRF2nW8WW2IrxPdkn
 UczcpQMsdHb6UtWKqeiFN68lqMmPWMlCtGOOhbzGzyCn6EvtgNbGW+pAjxVNnFfVITdg
 c/ln9JNDadzNNVC7C7vrTnyetxnDG0kCxyCkFoZm1wWcz674PQE3A5w/nkyNKOCSD8rC
 R9EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNxurG3kRnGG/MDz4EhCX0EPUArhkmDAKv28aTfywkCbYvf00ldLH+EIX7SLRkpNposJ1fL4U2tCqeXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKbH/VVMl9XM2sSJcbreugA7b2aOVMLUT2fNNGG9znDZFAIocS
 vP1KQoObLt+XKsZ0shoZqSDaswQy0h/zOyIKxNLCKLG7aCWsaVeCRhPzNFVGqgCLQZM=
X-Gm-Gg: ASbGnctHGcnhj7LpdfpxZTTpR+uTQgLh2jfDgeK7Z8S0LhzKrvCdmdh4CA9fJpEXiIk
 TcAVa6f9lYhTvakJ65bB8Mx9jh/7FvddvC43NmxyVY2Cpmw8wnggh/mtEqladBotd7WOQ9bPyqX
 T1BUMKZ16evx2A75AJM6WtbV7uRgKOb3BtBUfI7iD4GDgzQmAI/H7w962EqGtz0zqzGH7gH5pZ8
 tLBvMNMOhkuaKNtUiGvD4NiSpobLhXBElrRkAZA5fN1leVR25RT5iRgdQ7EK5ItH8m8ukXzSOrk
 hTAuFWsEHY2LUsKOe61x9R+Y7PrFg2xh03BIH1IayKb1xqQDP+UJYwLrRrfEyf//T0SnD69AZOP
 YtQrW8034Xl+a0sfpo4bv0os5BCm8uSL40UoCJgCRTfjS9bV50J2XpgStyBFy8m4b3L9Z+NnbUj
 fv7CscMRmYm4cl0M5B9+Ei+eE=
X-Google-Smtp-Source: AGHT+IExGtwG81uwzj9JgnEK26nwTkuowQ0TGIoI/B/ng4jHpuOWuk3RVAjeNdIAjjrFddHoISsZ3w==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id
 d9443c01a7336-2984eddf6a5mr85532495ad.43.1763047952195; 
 Thu, 13 Nov 2025 07:32:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aee4:3fd6:a52:8e9a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2bed4fsm29590765ad.75.2025.11.13.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 07:32:31 -0800 (PST)
Date: Thu, 13 Nov 2025 08:32:28 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <aRX6DJoaP4MXG3fN@p14s>
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMTA6NTk6NDJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgOTo0M+KAr0FNIE1hdGhpZXUgUG9pcmllcgo+
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCAxMSBO
b3YgMjAyNSBhdCAxMjo1OSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFR1ZSwgTm92IDExLCAyMDI1IGF0IDEwOjM4OjA1QU0gLTA3MDAsIE1hdGhp
ZXUgUG9pcmllciB3cm90ZToKPiA+ID4gPiBIaSBSb2IsCj4gPiA+ID4KPiA+ID4gPiBQbGVhc2Ug
c2VlIG1heSBjb21tZW50IGZvciBzdF9yZW1vdGVwcm9jLmMKPiA+ID4gPgo+ID4gPiA+IE9uIEZy
aSwgT2N0IDMxLCAyMDI1IGF0IDEyOjU5OjIyUE0gLTA1MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdy
b3RlOgo+ID4gPiA+ID4gVXNlIHRoZSBuZXdseSBhZGRlZCBvZl9yZXNlcnZlZF9tZW1fcmVnaW9u
X3RvX3Jlc291cmNlKCkgYW5kCj4gPiA+ID4gPiBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX2NvdW50
KCkgZnVuY3Rpb25zIHRvIGhhbmRsZSAibWVtb3J5LXJlZ2lvbiIKPiA+ID4gPiA+IHByb3BlcnRp
ZXMuCj4gCj4gWy4uLl0KPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXBy
b2Mvc3RfcmVtb3RlcHJvYy5jIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYwo+
ID4gPiA+ID4gaW5kZXggZTY1NjZhOTgzOWRjLi4wNDMzNDgzNjY5MjYgMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2Mvc3RfcmVtb3RlcHJvYy5jCj4gPiA+ID4gPiArKysg
Yi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RfcmVtb3RlcHJvYy5jCj4gPiA+ID4gPiBAQCAtMTIwLDQw
ICsxMjAsMzcgQEAgc3RhdGljIGludCBzdF9ycHJvY19wYXJzZV9mdyhzdHJ1Y3QgcnByb2MgKnJw
cm9jLCBjb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZ3KQo+ID4gPiA+ID4gICAgIHN0cnVjdCBkZXZp
Y2UgKmRldiA9IHJwcm9jLT5kZXYucGFyZW50Owo+ID4gPiA+ID4gICAgIHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7Cj4gPiA+ID4gPiAgICAgc3RydWN0IHJwcm9jX21lbV9l
bnRyeSAqbWVtOwo+ID4gPiA+ID4gLSAgIHN0cnVjdCByZXNlcnZlZF9tZW0gKnJtZW07Cj4gPiA+
ID4gPiAtICAgc3RydWN0IG9mX3BoYW5kbGVfaXRlcmF0b3IgaXQ7Cj4gPiA+ID4gPiAtICAgaW50
IGluZGV4ID0gMDsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0gICBvZl9waGFuZGxlX2l0ZXJhdG9y
X2luaXQoJml0LCBucCwgIm1lbW9yeS1yZWdpb24iLCBOVUxMLCAwKTsKPiA+ID4gPiA+IC0gICB3
aGlsZSAob2ZfcGhhbmRsZV9pdGVyYXRvcl9uZXh0KCZpdCkgPT0gMCkgewo+ID4gPiA+ID4gLSAg
ICAgICAgICAgcm1lbSA9IG9mX3Jlc2VydmVkX21lbV9sb29rdXAoaXQubm9kZSk7Cj4gPiA+ID4g
PiAtICAgICAgICAgICBpZiAoIXJtZW0pIHsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
b2Zfbm9kZV9wdXQoaXQubm9kZSk7Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgIGRldl9l
cnIoZGV2LCAidW5hYmxlIHRvIGFjcXVpcmUgbWVtb3J5LXJlZ2lvblxuIik7Cj4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gLSAgICAgICAgICAg
fQo+ID4gPiA+ID4gKyAgIGludCBpbmRleCA9IDAsIG1yID0gMDsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsgICB3aGlsZSAoMSkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgc3RydWN0IHJlc291cmNl
IHJlczsKPiA+ID4gPiA+ICsgICAgICAgICAgIGludCByZXQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArICAgICAgICAgICByZXQgPSBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKG5w
LCBtcisrLCAmcmVzKTsKPiA+ID4gPiA+ICsgICAgICAgICAgIGlmIChyZXQpCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9yaWdpbmFs
IGNvZGUgY2FsbHMgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxlKCkgWzFdIGFmdGVyIGl0ZXJhdGlu
ZyB0aHJvdWdoCj4gPiA+ID4gdGhlIG1lbW9yeSByZWdpb24sIHNvbWV0aGluZyB0aGF0IHdvbid0
IGhhcHBlbiB3aXRoIHRoZSBhYm92ZS4KPiA+ID4KPiA+ID4gSW5kZWVkLiBpdCBuZWVkcyB0aGUg
Zm9sbG93aW5nIGluY3JlbWVudGFsIGNoYW5nZS4gSXQgaXMgc2xpZ2h0bHkKPiA+ID4gZGlmZmVy
ZW50IGluIHRoYXQgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxlKCkgaXMgbm90IGNhbGxlZCBpZgo+
ID4gPiAnbWVtb3J5LXJlZ2lvbicgaXMgbWlzc2luZywgYnV0IHRoZSBiaW5kaW5nIHNheXMgdGhh
dCdzIHJlcXVpcmVkLgo+ID4gPgo+ID4gPiA4PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jl
bW90ZXByb2Mvc3RfcmVtb3RlcHJvYy5jIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXBy
b2MuYwo+ID4gPiBpbmRleCAwNDMzNDgzNjY5MjYuLmNiMDljMjQ0ZmRiNSAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYwo+ID4gPiArKysgYi9kcml2
ZXJzL3JlbW90ZXByb2Mvc3RfcmVtb3RlcHJvYy5jCj4gPiA+IEBAIC0xMjAsMTUgKzEyMCwxOSBA
QCBzdGF0aWMgaW50IHN0X3Jwcm9jX3BhcnNlX2Z3KHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0
IHN0cnVjdCBmaXJtd2FyZSAqZncpCj4gPiA+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0g
cnByb2MtPmRldi5wYXJlbnQ7Cj4gPiA+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9
IGRldi0+b2Zfbm9kZTsKPiA+ID4gICAgICAgICBzdHJ1Y3QgcnByb2NfbWVtX2VudHJ5ICptZW07
Cj4gPiA+IC0gICAgICAgaW50IGluZGV4ID0gMCwgbXIgPSAwOwo+ID4gPiArICAgICAgIGludCBp
bmRleCA9IDA7Cj4gPiA+Cj4gPiA+ICAgICAgICAgd2hpbGUgKDEpIHsKPiA+ID4gICAgICAgICAg
ICAgICAgIHN0cnVjdCByZXNvdXJjZSByZXM7Cj4gPiA+ICAgICAgICAgICAgICAgICBpbnQgcmV0
Owo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgcmV0ID0gb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lv
bl90b19yZXNvdXJjZShucCwgbXIrKywgJnJlcyk7Cj4gPiA+IC0gICAgICAgICAgICAgICBpZiAo
cmV0KQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldCA9IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UobnAsIGlu
ZGV4LCAmcmVzKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGluZGV4KQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gKyAgICAg
ICAgICAgICAgIH0KPiA+Cj4gPiBUaGlzIGxvb2tzIGJyaXR0bGUgYW5kIEknbSBub3Qgc3VyZSBp
dCB3b3VsZCB3b3JrLgo+ID4KPiA+IEdvaW5nIGJhY2sgdG8gdGhlIG9yaWdpbmFsIGltcGxlbWVu
dGF0aW9uLCB0aGUgb25seSB0aW1lIHdlIHdhbnQgdG8KPiA+ICJicmVhayIgaXMgd2hlbiBAaW5k
ZXggaXMgZXF1YWwgdG8gdGhlIGFtb3VudCBvZiBtZW1vcnkgcmVnaW9ucyBfYW5kXwo+ID4gcmV0
IGlzIC1FSU5WQUwuICBBbnkgb3RoZXIgY29uZGl0aW9uIHNob3VsZCByZXR1cm4uCj4gCj4gQGlu
ZGV4IGVxdWFsIHRvIG51bWJlciBvZiBlbnRyaWVzIHJldHVybnMgLUVOT0RFViwgc28gdGhhdCBj
b25kaXRpb24KPiBpcyBpbXBvc3NpYmxlLiBXZSBjYW4gc2ltcGx5IGl0IHRvIHRoaXM6Cj4gCj4g
aWYgKHJldCA9PSAtRU5PREVWICYmIGluZGV4KQo+ICAgICBicmVhazsKPiBlbHNlCj4gICAgIHJl
dHVybiByZXQ7CgpUbyBtZSB0aGlzIG5lZWRzIHRvIGJlOgoKZW50cmllcyA9IG9mX3Jlc2VydmVk
X21lbV9yZWdpb25fY291bnQobnApOyAKCi4uLgouLi4KCmlmIChyZXQgPT0gLUVOT0RFViAmJiBp
bmRleCA9PSBlbnRyaWVzKQogICAgICAgIGJyZWFrOwplbHNlCiAgICAgICAgcmV0dXJuIHJldDsK
CkJ1dCB0YWtpbmcgYSBzdGVwIGJhY2ssIGl0IG1pZ2h0IGV2ZW4gYmUgZWFzaWVyIHRvIGdvIGZy
b20gYSB3aGlsZSgpIHRvIGEgZm9yKCksCnRoZSBzYW1lIHdheSB5b3UgZGlkIGluIGlteF9ycHJv
Y19hZGRyX2luaXQoKS4KCj4gCj4gSWYgeW91IHdhbnQgdG8ga2VlcCB0aGUgcHJpb3IgYmVoYXZp
b3Igd2hlbiAnbWVtb3J5LXJlZ2lvbicgaXMKPiBtaXNzaW5nLCB0aGVuICcmJiBpbmRleCcgY2Fu
IGJlIHJlbW92ZWQsIGJ1dCBJIHRoaW5rIHRoYXQgd2FzIHdyb25nCj4gYmVoYXZpb3IuCj4gCj4g
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
