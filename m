Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242FA4527C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 02:57:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2AD6C7A824;
	Wed, 26 Feb 2025 01:57:16 +0000 (UTC)
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1267C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 01:57:15 +0000 (UTC)
Message-ID: <3db2c2fd-5125-4664-83d0-a0706ef2050f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1740535034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AjpPUgwyW35ZlY25/RBMK6h76d3ORQR2twl+cHmmAE=;
 b=vuy8I0AX2kkd1NjVZbGg37cUhDQeJMeKe5nEoM65o5UfhKmbIqzYuU9pBMUWsU4YmLjjI2
 gjcRzkpsMyaCXuTGcI8mbvFGA+9gy8a/YMGgFP3LeKxcEvr+aB1+fNGWNe/JLmacQq47RQ
 FKRd9rCECzhjSHl8Z1zYg+AfqpPSUeM=
Date: Wed, 26 Feb 2025 09:57:03 +0800
MIME-Version: 1.0
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-4-phasta@kernel.org>
 <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
 <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
X-Migadu-Flow: FLOW_OUT
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/4] stmmac: loongson: Remove
	surplus loop
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

CuWcqCAyLzI1LzI1IDU6MTUgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gT24gVHVlLCAy
MDI1LTAyLTI1IGF0IDE3OjA2ICswODAwLCBZYW50ZW5nIFNpIHdyb3RlOgo+PiDlnKggMi8yNC8y
NSA5OjUzIFBNLCBQaGlsaXBwIFN0YW5uZXIg5YaZ6YGTOgo+Pj4gbG9vbmdzb25fZHdtYWNfcHJv
YmUoKSBjb250YWlucyBhIGxvb3Agd2hpY2ggZG9lc24ndCBoYXZlIGFuCj4+PiBlZmZlY3QsCj4+
PiBiZWNhdXNlIGl0IHRyaWVzIHRvIGNhbGwgcGNpbV9pb21hcF9yZWdpb25zKCkgd2l0aCB0aGUg
c2FtZQo+Pj4gcGFyYW1ldGVycwo+Pj4gc2V2ZXJhbCB0aW1lcy4gVGhlIGJyZWFrIHN0YXRlbWVu
dCBhdCB0aGUgbG9vcCdzIGVuZCBmdXJ0aGVybW9yZQo+Pj4gZW5zdXJlcwo+Pj4gdGhhdCB0aGUg
bG9vcCBvbmx5IHJ1bnMgb25jZSBhbnl3YXlzLgo+Pj4KPj4+IFJlbW92ZSB0aGUgc3VycGx1cyBs
b29wLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgU3Rhbm5lciA8cGhhc3RhQGtlcm5l
bC5vcmc+Cj4+IEl0IHNlZW1zIHRoYXQgdGhlIGZpeC10YWcgaGFzIGJlZW4gZm9yZ290dGVuLCBu
ZXh0IHR3byBwYXRjaGVzIGFzCj4+IHdlbGwuCj4gTm90IGZvcmdvdHRlbiwgSSBqdXN0IHRoaW5r
IHRoYXQgcGF0Y2hlcyAyLTQgYXJlIGNvZGUgaW1wcm92ZW1lbnRzLCBub3QKPiBidWcgZml4ZXMu
Cj4KPiBUaGUgaXNzdWUgaW4gcGF0Y2ggMSB3b3VsZCBjYXVzZSBhY3R1YWwgbWlzYmVoYXZpb3Ig
KGEgdXNlbGVzcyBkZWJ1Zwo+IGluZm9ybWF0aW9uIHByaW50IGluIGNhc2Ugb2YgYSByZXNvdXJj
ZSBjb2xsaXNpb24pLCB3aGVyZWFzIDItNCBhcmUKPiBqdXN0IHVnbHkgY29kZSwgYnV0IG5vdCBh
Y3R1YWwgYnVnczogdGhlIGxvb3AgYWx3YXlzIGp1c3QgcnVucyBvbmNlOwo+IGFuZCB1bm1hcHBp
bmcgdGhlIFBDSSByZXNvdXJjZXMgbWFudWFsbHkgaXMgdmFsaWQsIGJ1dCBvYnZpb3VzbHkKPiB1
bm5lY2Vzc2FyeS4KPgo+IEFncmVlZD8KCllvdSBiZXQhCgoKVGhhbmtzLAoKWWFudGVuZwoKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
