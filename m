Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F97946546
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 23:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB4ABC7129D;
	Fri,  2 Aug 2024 21:46:09 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E36C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 21:46:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2cfec641429so1582295a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722635161; x=1723239961;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JU9A3+pkHtkV1/Zl7dIEANXrrOXhOpFpmn/8LwuWvI=;
 b=PA2lNsXxDx1PpmbnK426F+wxeCPT6Xt4C0NFGXCeG81qo2Jz0Xbx1Xz4YJ5RwGMeyP
 joIBbg3VD3w4ZhE06tIhPaeiJYyii7NiMSWwsIFTknbdricxhaKOirMKMNNCz1p0AdCg
 WnvXOFT4zFicoWj9jGEdiRqGFdwTFC3VU17MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722635161; x=1723239961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JU9A3+pkHtkV1/Zl7dIEANXrrOXhOpFpmn/8LwuWvI=;
 b=Bz5kS07lVVSbcnlRa8VSE2KLpxkTfJ1AEOODBDqptcHzMTvabDRQphS+XzSh0dGYz4
 PR6kREMMMmRYvYf2Oe0oXf/6qiDZgIeS0lwgtegDS6Mo76MxbLOcjDVZKUytg4HVEO5O
 JFujLu0oaL8nEen3PINaZ0dRneeceGm1aaZdvT7KbuziunhfkPrT4DF8Zgvcgdzp8QPC
 jS+K4tIXVS6vLvaWSDthADeLu2VYmISYFj1SfwZpXOXTHHIMJ2ZgevpVMFT3ppHagLb0
 q/m9nrx/R1KT8TEFOyneyLaWlLgqhre2UJ6wlOJvTXETKWJJ3haFwlzJK5ly6mtLomFv
 kfQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSoemrIWPmOQAvb1l+odjUJIyvWI1Z9KGrDWGfL4AkFzI2ROlXd6piN70z6VIyQMlNRL+y8VZT9Dwmq/Q5mxOfeAxLCQEUEKhlIOmZgb5MC8e2U1E1QNsD
X-Gm-Message-State: AOJu0Yzu9chP6xmXdhaA6IjWgkQ+cNA/R1LNoiPvoyjUqpMGdyLVz4lh
 zcHf0xTKGJTXVPCT/TALs0pxO271aH5Uqk+Oc3BTdYSYPaRoTGniieqjKSFG9pOk1mpeEi+MIi3
 ehnuHURTctGJp289JaU9h4o7KDMxBA0Dah2J/
X-Google-Smtp-Source: AGHT+IF40zRRZ4gCavijc3AcIA9p7ICZ/ZbFiiXFymV9WjpQVTokLcCdEOjlLAeEwbQjG/06LFmkIZxUZud2wsOJD7k=
X-Received: by 2002:a17:90a:6387:b0:2bf:8824:c043 with SMTP id
 98e67ed59e1d1-2cff9413e04mr6094475a91.18.1722635160975; Fri, 02 Aug 2024
 14:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-2-jitendra.vegiraju@broadcom.com>
 <20240802143818.GB2504122@kernel.org>
In-Reply-To: <20240802143818.GB2504122@kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 2 Aug 2024 14:45:50 -0700
Message-ID: <CAMdnO-+JBk9X66rzPqWL+1Bf_0kyqnMN9+ikaTp65CfzVmps=g@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 john.fastabend@gmail.com, ast@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] net: stmmac: Add basic
 dwxgmac4 support to stmmac core
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCA3OjM44oCvQU0gU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDAxLCAyMDI0IGF0IDA4OjE4OjIwUE0gLTA3
MDAsIGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbSB3cm90ZToKPiA+IEZyb206IEppdGVu
ZHJhIFZlZ2lyYWp1IDxqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5jb20+Cj4gPgo+ID4gQWRk
cyBzdXBwb3J0IGZvciBEV0NfeGdtYWMgdmVyc2lvbiA0LjAwYSBpbiBzdG1tYWMgY29yZSBtb2R1
bGUuCj4gPiBUaGlzIHZlcnNpb24gYWRkcyBlbmhhbmNlbWVudHMgdG8gRE1BIGFyY2hpdGVjdHVy
ZSBmb3IgdmlydHVhbGl6YXRpb24KPiA+IHNjYWxhYmlsaXR5LiBUaGlzIGlzIHJlYWxpemVkIGJ5
IGRlY291cGxpbmcgcGh5c2ljYWwgRE1BIGNoYW5uZWxzIChQRE1BKQo+ID4gZnJvbSBWaXJ0dWFs
IERNQSBjaGFubmVscyAoVkRNQSkuIFRoZSAgVkRNQXMgYXJlIHNvZnR3YXJlIGFiYXN0cmFjdGlv
bnMKPiA+IHRoYXQgbWFwIHRvIFBETUFzIGZvciBmcmFtZSB0cmFuc21pc3Npb24gYW5kIHJlY2Vw
dGlvbi4KPiA+Cj4gPiBUaGUgdmlydHVhbGl6YXRpb24gZW5oYW5jZW1lbnRzIGFyZSBjdXJyZW50
bHkgbm90IGJlaW5nIHVzZWQgYW5kIGhlbmNlCj4gPiBhIGZpeGVkIG1hcHBpbmcgb2YgVkRNQSB0
byBQRE1BIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIGluaXQgZnVuY3Rpb25zLgo+ID4gQmVjYXVzZSBv
ZiB0aGUgbmV3IGluaXQgZnVuY3Rpb25zLCBhIG5ldyBpbnN0YW5jZSBvZiBzdHJ1Y3Qgc3RtbWFj
X2RtYV9vcHMKPiA+IGR3eGdtYWM0MDBfZG1hX29wcyBpcyBhZGRlZC4KPiA+IE1vc3Qgb2YgdGhl
IG90aGVyIGRtYSBvcGVyYXRpb24gZnVuY3Rpb25zIGluIGV4aXN0aW5nIGR3eGdhbWMyX2RtYS5j
IGZpbGUKPiA+IGNhbiBiZSByZXVzZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSml0ZW5kcmEg
VmVnaXJhanUgPGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbT4KPgo+IC4uLgo+Cj4gPiAg
c3RtbWFjLSQoQ09ORklHX1NUTU1BQ19TRUxGVEVTVFMpICs9IHN0bW1hY19zZWxmdGVzdHMubwo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3eGdt
YWMyX2RtYS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHd4Z21hYzJf
ZG1hLmMKPgo+IC4uLgo+Cj4gPiBAQCAtNjQxLDMgKzY0MiwzMyBAQCBjb25zdCBzdHJ1Y3Qgc3Rt
bWFjX2RtYV9vcHMgZHd4Z21hYzIxMF9kbWFfb3BzID0gewo+ID4gICAgICAgLmVuYWJsZV9zcGgg
PSBkd3hnbWFjMl9lbmFibGVfc3BoLAo+ID4gICAgICAgLmVuYWJsZV90YnMgPSBkd3hnbWFjMl9l
bmFibGVfdGJzLAo+ID4gIH07Cj4gPiArCj4gPiArY29uc3Qgc3RydWN0IHN0bW1hY19kbWFfb3Bz
IGR3eGdtYWM0MDBfZG1hX29wcyA9IHsKPiA+ICsgICAgIC5yZXNldCA9IGR3eGdtYWMyX2RtYV9y
ZXNldCwKPiA+ICsgICAgIC5pbml0ID0gZHd4Z21hYzRfZG1hX2luaXQsCj4gPiArICAgICAuaW5p
dF9jaGFuID0gZHd4Z21hYzJfZG1hX2luaXRfY2hhbiwKPiA+ICsgICAgIC5pbml0X3J4X2NoYW4g
PSBkd3hnbWFjNF9kbWFfaW5pdF9yeF9jaGFuLAo+ID4gKyAgICAgLmluaXRfdHhfY2hhbiA9IGR3
eGdtYWM0X2RtYV9pbml0X3R4X2NoYW4sCj4gPiArICAgICAuYXhpID0gZHd4Z21hYzJfZG1hX2F4
aSwKPiA+ICsgICAgIC5kdW1wX3JlZ3MgPSBkd3hnbWFjMl9kbWFfZHVtcF9yZWdzLAo+ID4gKyAg
ICAgLmRtYV9yeF9tb2RlID0gZHd4Z21hYzJfZG1hX3J4X21vZGUsCj4gPiArICAgICAuZG1hX3R4
X21vZGUgPSBkd3hnbWFjMl9kbWFfdHhfbW9kZSwKPiA+ICsgICAgIC5lbmFibGVfZG1hX2lycSA9
IGR3eGdtYWMyX2VuYWJsZV9kbWFfaXJxLAo+ID4gKyAgICAgLmRpc2FibGVfZG1hX2lycSA9IGR3
eGdtYWMyX2Rpc2FibGVfZG1hX2lycSwKPiA+ICsgICAgIC5zdGFydF90eCA9IGR3eGdtYWMyX2Rt
YV9zdGFydF90eCwKPiA+ICsgICAgIC5zdG9wX3R4ID0gZHd4Z21hYzJfZG1hX3N0b3BfdHgsCj4g
PiArICAgICAuc3RhcnRfcnggPSBkd3hnbWFjMl9kbWFfc3RhcnRfcngsCj4gPiArICAgICAuc3Rv
cF9yeCA9IGR3eGdtYWMyX2RtYV9zdG9wX3J4LAo+ID4gKyAgICAgLmRtYV9pbnRlcnJ1cHQgPSBk
d3hnbWFjMl9kbWFfaW50ZXJydXB0LAo+ID4gKyAgICAgLmdldF9od19mZWF0dXJlID0gZHd4Z21h
YzJfZ2V0X2h3X2ZlYXR1cmUsCj4gPiArICAgICAucnhfd2F0Y2hkb2cgPSBkd3hnbWFjMl9yeF93
YXRjaGRvZywKPiA+ICsgICAgIC5zZXRfcnhfcmluZ19sZW4gPSBkd3hnbWFjMl9zZXRfcnhfcmlu
Z19sZW4sCj4gPiArICAgICAuc2V0X3R4X3JpbmdfbGVuID0gZHd4Z21hYzJfc2V0X3R4X3Jpbmdf
bGVuLAo+ID4gKyAgICAgLnNldF9yeF90YWlsX3B0ciA9IGR3eGdtYWMyX3NldF9yeF90YWlsX3B0
ciwKPiA+ICsgICAgIC5zZXRfdHhfdGFpbF9wdHIgPSBkd3hnbWFjMl9zZXRfdHhfdGFpbF9wdHIs
Cj4gPiArICAgICAuZW5hYmxlX3RzbyA9IGR3eGdtYWMyX2VuYWJsZV90c28sCj4gPiArICAgICAu
cW1vZGUgPSBkd3hnbWFjMl9xbW9kZSwKPiA+ICsgICAgIC5zZXRfYmZzaXplID0gZHd4Z21hYzJf
c2V0X2Jmc2l6ZSwKPiA+ICsgICAgIC5lbmFibGVfc3BoID0gZHd4Z21hYzJfZW5hYmxlX3NwaCwK
PiA+ICsgICAgIC5lbmFibGVfdGJzID0gZHd4Z21hYzJfZW5hYmxlX3RicywKPiA+ICt9Owo+Cj4g
UGxlYXNlIGFkZCBkd3hnbWFjNDAwX2RtYV9vcHMgdG8gaHdpZi5oIGluIHRoaXMgcGF0Y2ggcmF0
aGVyIHRoYW4gYQo+IHN1YnNlcXVlbnQgb25lIHRvIGF2b2lkIFNwYXJzZSBzdWdnZXN0aW5nIHRo
ZSBzeW1ib2wgc2hvdWxkIGJlIHN0YXRpYy4KVGhhbmtzLCBJIHdpbGwgbWFrZSB0aGUgY2hhbmdl
IGluIHRoZSBuZXh0IHBhdGNoIHJldmlzaW9uLgo+Cj4gLi4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
