Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F415A69C7C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 00:04:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F15EC7803C;
	Wed, 19 Mar 2025 23:04:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBB6AC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 23:04:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7347FA48B4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 22:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910B1C4CEEC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742425482;
 bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uuGe+aOwcgf7kb6tS+eJjVfXHyx1rbvLoZ2NOaP02SzxNs47NRpR2LVVwhgwHQXBH
 NltceS4U3rtwfOvmEq6YnwNECmBc2oMMbb9lU/j4Uom1lYzKvdw4wm1Yy6nW930eJu
 Qj9XsiBQDeLSstZ6bM2e8hq8mcmFfI/UZ91g+PDxaY6TrX2C3SXVc/S9g9siUzR7Xm
 hpdQQZo/klOGL1YJZWIiEqKqUyJrEUGeSc8uY7viKfW1a/4xC4CXnFy1b01yO2/l88
 BlSp4hn6bDt5R1zh7kce8Os/lelWqy7DrU4HRFeFfXCx+Wxz9JKCbO/8BHToR3LrOm
 gULLlNMRPLUag==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e5bc066283so307404a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 16:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Gj8Au5vGSVWdeW2Z6ewIfbGzgq9yDcTMdKb9ilZPc258xPBqVMRW+qqJN97KJYAcnQZ5/GtDgsGZ9A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzePsrstdsqGeREw7LFTOT5fVhUBhGbZAaFz6Zaxd9Wg7ZHi0x9
 HzTWR/tIFQft5OcHZ4Sjg9Jp9La6RkCwFPw+6W+ZZlCjhJ54If/jAJm+AWtePR+V9AO5P8AKEUb
 UdLSw7OJYFB0HQpjG1ou+AprPpw==
X-Google-Smtp-Source: AGHT+IH1Yrc3Y5KhcKuIDvTrQ1KQbSSjJSIP+aKUctEQfy6L4vvWLzhbwAuvXFhDZUh0Wqy+O4jXTvspjUWR7fVZh34=
X-Received: by 2002:a05:6402:d0d:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5eb9eee0416mr908900a12.1.1742425481081; Wed, 19 Mar 2025
 16:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
In-Reply-To: <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Mar 2025 18:04:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
X-Gm-Features: AQ5f1JqOv9zU_NIrquP_FiizlsCH0dJCdTrTRAoIvYNPwVPq8s6b1gdkB9PCxY8
Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
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

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgMTA6MjbigK9BTSBBcm5hdWQgUE9VTElRVUVOCjxhcm5h
dWQucG91bGlxdWVuQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEhlbGxvIFJvYiwKPgo+IE9uIDMv
MTgvMjUgMDA6MjQsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gVXNlIHRoZSBuZXdseSBh
ZGRlZCBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgYW5kCj4gPiBvZl9yZXNl
cnZlZF9tZW1fcmVnaW9uX2NvdW50KCkgZnVuY3Rpb25zIHRvIGhhbmRsZSAibWVtb3J5LXJlZ2lv
biIKPiA+IHByb3BlcnRpZXMuCj4gPgo+ID4gVGhlIGVycm9yIGhhbmRsaW5nIGlzIGEgYml0IGRp
ZmZlcmVudCBpbiBzb21lIGNhc2VzLiBPZnRlbgo+ID4gIm1lbW9yeS1yZWdpb24iIGlzIG9wdGlv
bmFsLCBzbyBmYWlsZWQgbG9va3VwIGlzIG5vdCBhbiBlcnJvci4gQnV0IHRoZW4KPiA+IGFuIGVy
cm9yIGluIG9mX3Jlc2VydmVkX21lbV9sb29rdXAoKSBpcyB0cmVhdGVkIGFzIGFuIGVycm9yLiBI
b3dldmVyLAo+ID4gdGhhdCBkaXN0aW5jdGlvbiBpcyBub3QgcmVhbGx5IGltcG9ydGFudC4gRWl0
aGVyIHRoZSByZWdpb24gaXMgYXZhaWxhYmxlCj4gPiBhbmQgdXNhYmxlIG9yIGl0IGlzIG5vdC4g
U28gbm93LCBpdCBpcyBqdXN0Cj4gPiBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNl
KCkgd2hpY2ggaXMgY2hlY2tlZCBmb3IgYW4gZXJyb3IuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gRm9yIHY2LjE2
Cj4gPgoKWy4uLl0KCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVwcm9jL3N0bTMyX3Jw
cm9jLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2MuYwo+ID4gaW5kZXggYjAyYjM2
YTNmNTE1Li45ZDJiZDg5MDRjNDkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2Mv
c3RtMzJfcnByb2MuYwo+ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0bTMyX3Jwcm9jLmMK
PiA+IEBAIC0yMTMsNTIgKzIxMyw0NiBAQCBzdGF0aWMgaW50IHN0bTMyX3Jwcm9jX3ByZXBhcmUo
c3RydWN0IHJwcm9jICpycHJvYykKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYg
PSBycHJvYy0+ZGV2LnBhcmVudDsKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBk
ZXYtPm9mX25vZGU7Cj4gPiAtICAgICBzdHJ1Y3Qgb2ZfcGhhbmRsZV9pdGVyYXRvciBpdDsKPiA+
ICAgICAgIHN0cnVjdCBycHJvY19tZW1fZW50cnkgKm1lbTsKPiA+IC0gICAgIHN0cnVjdCByZXNl
cnZlZF9tZW0gKnJtZW07Cj4gPiAgICAgICB1NjQgZGE7Cj4gPiAtICAgICBpbnQgaW5kZXggPSAw
Owo+ID4gKyAgICAgaW50IGluZGV4ID0gMCwgbXIgPSAwOwo+ID4KPiA+ICAgICAgIC8qIFJlZ2lz
dGVyIGFzc29jaWF0ZWQgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgKi8KPiA+IC0gICAgIG9mX3Bo
YW5kbGVfaXRlcmF0b3JfaW5pdCgmaXQsIG5wLCAibWVtb3J5LXJlZ2lvbiIsIE5VTEwsIDApOwo+
ID4gLSAgICAgd2hpbGUgKG9mX3BoYW5kbGVfaXRlcmF0b3JfbmV4dCgmaXQpID09IDApIHsKPiA+
IC0gICAgICAgICAgICAgcm1lbSA9IG9mX3Jlc2VydmVkX21lbV9sb29rdXAoaXQubm9kZSk7Cj4g
PiAtICAgICAgICAgICAgIGlmICghcm1lbSkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIG9m
X25vZGVfcHV0KGl0Lm5vZGUpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAidW5hYmxlIHRvIGFjcXVpcmUgbWVtb3J5LXJlZ2lvblxuIik7Cj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+ICsgICAgIHdo
aWxlICgxKSB7Cj4gPiArICAgICAgICAgICAgIHN0cnVjdCByZXNvdXJjZSByZXM7Cj4gPiArICAg
ICAgICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJldCA9IG9mX3Jlc2Vy
dmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UobnAsIG1yKyssICZyZXMpOwo+ID4gKyAgICAgICAg
ICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+
IC0gICAgICAgICAgICAgaWYgKHN0bTMyX3Jwcm9jX3BhX3RvX2RhKHJwcm9jLCBybWVtLT5iYXNl
LCAmZGEpIDwgMCkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGl0Lm5v
ZGUpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAibWVtb3J5IHJlZ2lv
biBub3QgdmFsaWQgJXBhXG4iLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJt
ZW0tPmJhc2UpOwo+ID4gKyAgICAgICAgICAgICBpZiAoc3RtMzJfcnByb2NfcGFfdG9fZGEocnBy
b2MsIHJlcy5zdGFydCwgJmRhKSA8IDApIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIm1lbW9yeSByZWdpb24gbm90IHZhbGlkICVwUlxuIiwgJnJlcyk7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+
Cj4gPiAgICAgICAgICAgICAgIC8qICBObyBuZWVkIHRvIG1hcCB2ZGV2IGJ1ZmZlciAqLwo+ID4g
LSAgICAgICAgICAgICBpZiAoc3RyY21wKGl0Lm5vZGUtPm5hbWUsICJ2ZGV2MGJ1ZmZlciIpKSB7
Cj4gPiArICAgICAgICAgICAgIGlmIChzdHJjbXAocmVzLm5hbWUsICJ2ZGV2MGJ1ZmZlciIpKSB7
Cj4KPiBJIHRlc3RlZCB5b3VyIHBhdGNoZXMKClRoYW5rIHlvdS4KCj4gVGhlIHVwZGF0ZSBpbnRy
b2R1Y2VzIGEgcmVncmVzc2lvbiBoZXJlLiBUaGUgc3RyY21wIGZ1bmN0aW9uIG5ldmVyIHJldHVy
bnMgMC4KPiBJbmRlZWQsIGl0Lm5vZGUtPm5hbWUgc3RvcmVzIHRoZSBtZW1vcnkgcmVnaW9uIGxh
YmVsICJ2ZGV2MGJ1ZmZlciwiIHdoaWxlCj4gcmVzLm5hbWUgc3RvcmVzIHRoZSBtZW1vcnkgcmVn
aW9uIG5hbWUgInZkZXYwYnVmZmVyQDEwMDQyMDAwLiIKPgo+IFNldmVyYWwgcmVtb3RlcHJvYyBk
cml2ZXJzIG1heSBmYWNlIHRoZSBzYW1lIGlzc3VlIGFzIHRoZXkgZW1iZWQgc2ltaWxhciBjb2Rl
LgoKSW5kZWVkLiBJIGNvbmZ1c2VkIG15c2VsZiBiZWNhdXNlIG5vZGUgJ25hbWUnIGlzIHdpdGhv
dXQgdGhlCnVuaXQtYWRkcmVzcywgYnV0IHRoaXMgaXMgdXNpbmcgdGhlIGZ1bGwgbmFtZS4gSSd2
ZSByZXBsYWNlZCB0aGUKc3RyY21wJ3Mgd2l0aCBzdHJzdGFydHMoKSB0byBhZGRyZXNzIHRoaXMu
IEkndmUgdXBkYXRlZCBteSBicmFuY2ggd2l0aAp0aGUgY2hhbmdlcy4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
