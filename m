Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53977AA7AE0
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 22:33:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 091D8C78F7D;
	Fri,  2 May 2025 20:33:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9914C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 20:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22B235C5630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 20:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C658C4AF0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746218005;
 bh=8cRp8SM0LX/HE5Z3KnJSbT0t2IN1vaMmNamccM78RCU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VmZ+vHtBaP8SSohqqvMbuo/9dCNweJUIT1eTA8IbZzfbagwotj1lRz3ma4h4LYlc/
 q5Z65x7TjCE5xFP00y4yDAEFn2clHK+U7B0mCpeXgauBWtaKsZNh54N3Muk290/ffY
 q8LRgtoYCCBdXhGPcTQ4ewx8tCECuchfEETsDJoDqWM4Nk9xIYBAlp1D5IwxtP9tdL
 9YxCmJhxfm2gQ5ASaCUihgOry/tQI4win9t5vyfsK5WqpPzw2Cl8i/qZq1IiUmdCBv
 DWFp6bFBEYsM1EESOO41nOBOwlYINsr9OWIfH4theOH2OXkX41RMIR0l9ecPM/feGB
 dy0cyd6c9JMQg==
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5f63ac6ef0fso1419848a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 13:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWINJjGIRilxuWPygNXfkj97d4E3la/QgGQas3u0GR/L5DeRjbJGWuVfPIUMWs32cVAJ7cpMT5Hug4Ifg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMQa/Ymu+L6036fY31iUnYmONjhk1JP/QH2MkqZr/fnrLoIpHb
 b273PZXjAvtEARYF39lT4C4lp7hsPocZz55PS9/V8Vom9vq5shAX+h+YRKBdJsipYf3orA6HNc2
 b44PlvnIWcqxAYJqokEE97ffvVg==
X-Google-Smtp-Source: AGHT+IFJAjhO8qP9BM2k4YXGFjxF2DDTVd060jMohyR4Ip3XSKyXWvnjjpfR8v4ueb8Q+ILn2MtJ1K5BoJWlIuzn/k0=
X-Received: by 2002:a05:6402:354a:b0:5e5:ba77:6f42 with SMTP id
 4fb4d7f45d1cf-5f919836e4cmr7202023a12.4.1746218003663; Fri, 02 May 2025
 13:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-4-2fbd6ebd3c88@kernel.org>
 <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
In-Reply-To: <938c4876-d284-4f11-a4ac-9f3831d3c14d@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 May 2025 15:33:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
X-Gm-Features: ATxdqUGr4Vb6qq9G8I43FJO0ja1hmdvZAb79PHSBzn0-jffEIRPNg2KLlUCVYFA
Message-ID: <CAL_JsqKhjE-67k2jN3x5qjRYbT4100fDCfkpt7TjESgOi_f8sA@mail.gmail.com>
To: tanmay.shah@amd.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] remoteproc: Use
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCAxMDo0MOKAr0FNIFRhbm1heSBTaGFoIDx0YW5tYXkuc2hh
aEBhbWQuY29tPiB3cm90ZToKPgo+Cj4gSGVsbG8gUm9iLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0
Y2guIFBsZWFzZSBmaW5kIG15IGNvbW1lbnRzIGJlbG93Lgo+Cj4KPiBPbiA0LzIzLzI1IDI6NDIg
UE0sIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gVXNlIHRoZSBuZXdseSBhZGRlZCBvZl9y
ZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgYW5kCj4gPiBvZl9yZXNlcnZlZF9tZW1f
cmVnaW9uX2NvdW50KCkgZnVuY3Rpb25zIHRvIGhhbmRsZSAibWVtb3J5LXJlZ2lvbiIKPiA+IHBy
b3BlcnRpZXMuCj4gPgo+ID4gVGhlIGVycm9yIGhhbmRsaW5nIGlzIGEgYml0IGRpZmZlcmVudCBp
biBzb21lIGNhc2VzLiBPZnRlbgo+ID4gIm1lbW9yeS1yZWdpb24iIGlzIG9wdGlvbmFsLCBzbyBm
YWlsZWQgbG9va3VwIGlzIG5vdCBhbiBlcnJvci4gQnV0IHRoZW4KPiA+IGFuIGVycm9yIGluIG9m
X3Jlc2VydmVkX21lbV9sb29rdXAoKSBpcyB0cmVhdGVkIGFzIGFuIGVycm9yLiBIb3dldmVyLAo+
ID4gdGhhdCBkaXN0aW5jdGlvbiBpcyBub3QgcmVhbGx5IGltcG9ydGFudC4gRWl0aGVyIHRoZSBy
ZWdpb24gaXMgYXZhaWxhYmxlCj4gPiBhbmQgdXNhYmxlIG9yIGl0IGlzIG5vdC4gU28gbm93LCBp
dCBpcyBqdXN0Cj4gPiBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgd2hpY2gg
aXMgY2hlY2tlZCBmb3IgYW4gZXJyb3IuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gdjI6Cj4gPiAgIC0gVXNlIHN0
cnN0YXJ0cyBpbnN0ZWFkIG9mIHN0cmNtcCBmb3IgcmVzb3VyY2UgbmFtZXMgYXMgdGhleSBpbmNs
dWRlCj4gPiAgICAgdGhlIHVuaXQtYWRkcmVzcy4KPiA+ICAgLSBEcm9wIHRoZSB1bml0LWFkZHJl
c3MgZnJvbSByZXNvdXJjZSBuYW1lIGZvciBpbXggYW5kIHN0IGRyaXZlcnMKPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL3JlbW90ZXByb2MvaW14X2RzcF9ycHJvYy5jICAgICAgICB8IDQ1ICsrKysrKysr
LS0tLS0tLS0tLS0tCj4gPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyAgICAgICAg
ICAgIHwgNjggKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIGRyaXZlcnMvcmVt
b3RlcHJvYy9xY29tX3E2djVfYWRzcC5jICAgICAgIHwgMjQgKysrKy0tLS0tLS0KPiA+ICAgZHJp
dmVycy9yZW1vdGVwcm9jL3Fjb21fcTZ2NV9tc3MuYyAgICAgICAgfCA2MCArKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3Fjb21fcTZ2NV9wYXMuYyAg
ICAgICAgfCA2OSArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIGRyaXZlcnMv
cmVtb3RlcHJvYy9xY29tX3E2djVfd2Nzcy5jICAgICAgIHwgMjUgKysrKystLS0tLS0KPiA+ICAg
ZHJpdmVycy9yZW1vdGVwcm9jL3Fjb21fd2Nuc3MuYyAgICAgICAgICAgfCAyMyArKysrLS0tLS0t
LQo+ID4gICBkcml2ZXJzL3JlbW90ZXByb2MvcmNhcl9ycHJvYy5jICAgICAgICAgICB8IDM2ICsr
KysrKystLS0tLS0tLS0KPiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYyAg
ICAgICAgfCA0MSArKysrKysrKystLS0tLS0tLS0KPiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3N0
bTMyX3Jwcm9jLmMgICAgICAgICAgfCA0NCArKysrKysrKystLS0tLS0tLS0tLQo+ID4gICBkcml2
ZXJzL3JlbW90ZXByb2MvdGlfazNfZHNwX3JlbW90ZXByb2MuYyB8IDI4ICsrKysrLS0tLS0tLS0K
PiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3RpX2szX200X3JlbW90ZXByb2MuYyAgfCAyOCArKysr
Ky0tLS0tLS0tCj4gPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy90aV9rM19yNV9yZW1vdGVwcm9jLmMg
IHwgMjggKysrKystLS0tLS0tLQo+ID4gICBkcml2ZXJzL3JlbW90ZXByb2MveGxueF9yNV9yZW1v
dGVwcm9jLmMgICB8IDUxICsrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiAgIDE0IGZpbGVzIGNo
YW5nZWQsIDIyMSBpbnNlcnRpb25zKCspLCAzNDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfZHNwX3Jwcm9jLmMgYi9kcml2ZXJzL3JlbW90
ZXByb2MvaW14X2RzcF9ycHJvYy5jCj4gPiBpbmRleCA5MGNiMWZjMTNlNzEuLmZmZmFlNmZmNGE1
YyAxMDA2NDQKPgo+IFsgLi4uIF0KPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJv
Yy94bG54X3I1X3JlbW90ZXByb2MuYyBiL2RyaXZlcnMvcmVtb3RlcHJvYy94bG54X3I1X3JlbW90
ZXByb2MuYwo+ID4gaW5kZXggNWFlZWRlYWYzYzQxLi5iNzNlOTcwNzRjMDEgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3JlbW90ZXByb2MveGxueF9yNV9yZW1vdGVwcm9jLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvcmVtb3RlcHJvYy94bG54X3I1X3JlbW90ZXByb2MuYwo+ID4gQEAgLTQ2MCw0OSArNDYw
LDQ0IEBAIHN0YXRpYyBpbnQgYWRkX21lbV9yZWdpb25zX2NhcnZlb3V0KHN0cnVjdCBycHJvYyAq
cnByb2MpCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBycHJvY19tZW1fZW50cnkgKnJwcm9jX21l
bTsKPiA+ICAgICAgIHN0cnVjdCB6eW5xbXBfcjVfY29yZSAqcjVfY29yZTsKPiA+IC0gICAgIHN0
cnVjdCBvZl9waGFuZGxlX2l0ZXJhdG9yIGl0Owo+ID4gLSAgICAgc3RydWN0IHJlc2VydmVkX21l
bSAqcm1lbTsKPiA+ICAgICAgIGludCBpID0gMDsKPiA+Cj4gPiAgICAgICByNV9jb3JlID0gcnBy
b2MtPnByaXY7Cj4gPgo+ID4gICAgICAgLyogUmVnaXN0ZXIgYXNzb2NpYXRlZCByZXNlcnZlZCBt
ZW1vcnkgcmVnaW9ucyAqLwo+ID4gLSAgICAgb2ZfcGhhbmRsZV9pdGVyYXRvcl9pbml0KCZpdCwg
cjVfY29yZS0+bnAsICJtZW1vcnktcmVnaW9uIiwgTlVMTCwgMCk7Cj4gPiArICAgICB3aGlsZSAo
MSkgewo+ID4gKyAgICAgICAgICAgICBpbnQgZXJyOwo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3Qg
cmVzb3VyY2UgcmVzOwo+ID4KPiA+IC0gICAgIHdoaWxlIChvZl9waGFuZGxlX2l0ZXJhdG9yX25l
eHQoJml0KSA9PSAwKSB7Cj4gPiAtICAgICAgICAgICAgIHJtZW0gPSBvZl9yZXNlcnZlZF9tZW1f
bG9va3VwKGl0Lm5vZGUpOwo+ID4gLSAgICAgICAgICAgICBpZiAoIXJtZW0pIHsKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChpdC5ub2RlKTsKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKCZycHJvYy0+ZGV2LCAidW5hYmxlIHRvIGFjcXVpcmUgbWVtb3J5LXJl
Z2lvblxuIik7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAt
ICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgZXJyID0gb2ZfcmVzZXJ2ZWRfbWVtX3Jl
Z2lvbl90b19yZXNvdXJjZShyNV9jb3JlLT5ucCwgaSsrLCAmcmVzKTsKPgo+IEhlcmUgaSsrIGlz
IG5vdCBuZWVkZWQgYXMgaXQncyBkb25lIGF0IHRoZSBlbmQgb2YgdGhlIGxvb3AuCj4gVGhpcyBi
dWcgYnJlYWtzIFJQTXNnIGNvbW11bmljYXRpb24gb24genlucW1wIHBsYXRmb3JtLgoKVGhhbmtz
IGZvciBkZWJ1Z2dpbmcgaXQuIEknbGwgZml4IHRoYXQgdXAuCgpSb2IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
