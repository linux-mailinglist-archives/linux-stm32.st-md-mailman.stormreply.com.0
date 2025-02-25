Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543EA43903
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 10:15:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14E52C78F6A;
	Tue, 25 Feb 2025 09:15:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2FEBC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740474909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dOhZ4GEiEzNzy8qb84jLXkJZgtOg9xscbP+hl2s5gU=;
 b=RK/HiGb1mb5mMr1Fm8HnCjC5IyY7088J3tZcav3WTBIibBX/b/7g3UIjkO7wNzA4Ben+0H
 y0LZDOoEkBHgDEYrrmNyWJKypOcqk/mCHmcp/JpmtsvjcT7ERS7gDGcWFHYjelggN65Z/0
 Ptnv2Svp9qqQOC6LR4Fbj/Pn0Nuw0K0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-RI35gKXfOLiMilNcurk6ZA-1; Tue, 25 Feb 2025 04:15:07 -0500
X-MC-Unique: RI35gKXfOLiMilNcurk6ZA-1
X-Mimecast-MFC-AGG-ID: RI35gKXfOLiMilNcurk6ZA_1740474906
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43998ec3733so26886105e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 01:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740474906; x=1741079706;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mY0Y8NDtCq9U6kZXa7z7cTNd5hZ8Jf2lYO6g2P04nc=;
 b=KYRETLyEqybsBDAM94r+2cgshHtQLkEntYpfSuOUItKTTSBYEH4qG1tRVZWXr5Kukn
 /M7lc5wauXzpJwsByEBqpmA7Txw/7Us3Dtx2r98S8UvOj4gzlQsE6bH3pVol0RXptyy1
 hcNFDs/66MVPv88k53obrcQioEA2MluB5gmu++eSDubvuvwkujG15soVM8f/aKe8s2FY
 LYEr32qgFwy6PwiT9eu+5IPGl5NbBXA4QUIbpRmirE2j5jwsTh0OCnuX4AYjBybJ27c5
 eDt0Yc8F7gi0exQCMkm8f75sBOi8bg7Q7H+X+/lvg+6UaV0ppwi3wxq7P1bB35TKVUgn
 V98Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVscAwbdH95NnHK1LAKxR2rN5KfiUfKRgw38JDlf/ja4sMLvJJV2OyT9cITyEFXWBWqOQwBdVY4xfPZzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz56m1ndBksvC1t7VXoZQc9RqN0ZdS6cz2k6lfG/fLfcrm/cjzr
 yTvxmhS3dEyhl60F+J7xGqACivtFbwp84fz9wJQUKUkgIptaqFbAhoslQCQuPl13eKKgOUeHGJA
 baMqgESfu+25UF+fenQuqi9djOOUGr2yrAC2rEf9asd8/DuTpaFoKL3VpuFHI8sLjddlUn6nvZ5
 jH6Q==
X-Gm-Gg: ASbGncs6w+xiELwqgAgFU8psh53NryZVRz+weohdSF+7ovwZTvkdX2q+Mo70JUAng0I
 AtDlV8n1za5FEZajpPgFLncLHG7FtwKG9zMtPlBw1F4wxnX235OfYWI9x1JP5qHUKuFVPXQFShd
 Qat0uuXZ6CTzwyX4TVRyQM82yc5njj6KmmAErVyCmbGO5aYllrIwkCNHxLXgQ2E2mMmMHNkdFUY
 +kmcbN/OVLIjR4qSC6WvCfUh1PuPpVcOGDLcraNvXZ6PSzlQd/dfw5zdYytPRE31dvcuT4IuirZ
 3p24K39RSnYN6/W5/1XGZvagvchHBF9TFLCJjK8eQw==
X-Received: by 2002:a05:600c:1546:b0:439:9946:af60 with SMTP id
 5b1f17b1804b1-43ab0f72b03mr17377125e9.25.1740474905745; 
 Tue, 25 Feb 2025 01:15:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv74YgG8Iolf174w9Y9ybHGXlvSToIfrToEGjP2c4/7Rl0aROxWh/UMKakDjj4UqxbgXB2bQ==
X-Received: by 2002:a05:600c:1546:b0:439:9946:af60 with SMTP id
 5b1f17b1804b1-43ab0f72b03mr17376785e9.25.1740474905347; 
 Tue, 25 Feb 2025 01:15:05 -0800 (PST)
Received: from [10.32.64.164] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1532f0asm18718845e9.4.2025.02.25.01.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 01:15:04 -0800 (PST)
Message-ID: <7df6e1846ed6932c789a913c6a10aa8df5e26519.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Yanteng Si <si.yanteng@linux.dev>, Philipp Stanner <phasta@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>, Feiyang Chen
 <chenfeiyang@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing
 Zhang <zhangqing@loongson.cn>
Date: Tue, 25 Feb 2025 10:15:03 +0100
In-Reply-To: <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-4-phasta@kernel.org>
 <437d4fad-6cd4-4f90-a1bb-07193d015cad@linux.dev>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PEaG_zdM1oJPvlGdIbA_Y638HkAobY3i_Ywsde4OLaw_1740474906
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCAyMDI1LTAyLTI1IGF0IDE3OjA2ICswODAwLCBZYW50ZW5nIFNpIHdyb3RlOgo+IAo+
IOWcqCAyLzI0LzI1IDk6NTMgUE0sIFBoaWxpcHAgU3Rhbm5lciDlhpnpgZM6Cj4gPiBsb29uZ3Nv
bl9kd21hY19wcm9iZSgpIGNvbnRhaW5zIGEgbG9vcCB3aGljaCBkb2Vzbid0IGhhdmUgYW4KPiA+
IGVmZmVjdCwKPiA+IGJlY2F1c2UgaXQgdHJpZXMgdG8gY2FsbCBwY2ltX2lvbWFwX3JlZ2lvbnMo
KSB3aXRoIHRoZSBzYW1lCj4gPiBwYXJhbWV0ZXJzCj4gPiBzZXZlcmFsIHRpbWVzLiBUaGUgYnJl
YWsgc3RhdGVtZW50IGF0IHRoZSBsb29wJ3MgZW5kIGZ1cnRoZXJtb3JlCj4gPiBlbnN1cmVzCj4g
PiB0aGF0IHRoZSBsb29wIG9ubHkgcnVucyBvbmNlIGFueXdheXMuCj4gPiAKPiA+IFJlbW92ZSB0
aGUgc3VycGx1cyBsb29wLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIg
PHBoYXN0YUBrZXJuZWwub3JnPgo+IAo+IEl0IHNlZW1zIHRoYXQgdGhlIGZpeC10YWcgaGFzIGJl
ZW4gZm9yZ290dGVuLCBuZXh0IHR3byBwYXRjaGVzIGFzCj4gd2VsbC4KCk5vdCBmb3Jnb3R0ZW4s
IEkganVzdCB0aGluayB0aGF0IHBhdGNoZXMgMi00IGFyZSBjb2RlIGltcHJvdmVtZW50cywgbm90
CmJ1ZyBmaXhlcy4KClRoZSBpc3N1ZSBpbiBwYXRjaCAxIHdvdWxkIGNhdXNlIGFjdHVhbCBtaXNi
ZWhhdmlvciAoYSB1c2VsZXNzIGRlYnVnCmluZm9ybWF0aW9uIHByaW50IGluIGNhc2Ugb2YgYSBy
ZXNvdXJjZSBjb2xsaXNpb24pLCB3aGVyZWFzIDItNCBhcmUKanVzdCB1Z2x5IGNvZGUsIGJ1dCBu
b3QgYWN0dWFsIGJ1Z3M6IHRoZSBsb29wIGFsd2F5cyBqdXN0IHJ1bnMgb25jZTsKYW5kIHVubWFw
cGluZyB0aGUgUENJIHJlc291cmNlcyBtYW51YWxseSBpcyB2YWxpZCwgYnV0IG9idmlvdXNseQp1
bm5lY2Vzc2FyeS4KCkFncmVlZD8KClAuCgo+IAo+IAo+IFJldmlld2VkLWJ5OiBZYW50ZW5nIFNp
IDxzaS55YW50ZW5nQGxpbnV4LmRldj4KPiAKPiBUaGFua3MsCj4gWWFudGVuZwo+IAo+ID4gLS0t
Cj4gPiDCoCBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nv
bi5jIHwgMTEgKysrLS0tLQo+ID4gLS0tLQo+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uLmMKPiA+IGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24uYwo+ID4gaW5kZXggNzNh
NjcxNWE5M2U2Li5lM2NhY2QwODViM2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gPiArKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nvbi5jCj4gPiBAQCAtNTU0LDE0
ICs1NTQsOSBAQCBzdGF0aWMgaW50IGxvb25nc29uX2R3bWFjX3Byb2JlKHN0cnVjdCBwY2lfZGV2
Cj4gPiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQKPiA+IMKgwqAJcGNpX3NldF9t
YXN0ZXIocGRldik7Cj4gPiDCoCAKPiA+IMKgwqAJLyogR2V0IHRoZSBiYXNlIGFkZHJlc3Mgb2Yg
ZGV2aWNlICovCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsK
PiA+IC0JCWlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkpID09IDApCj4gPiAtCQkJY29udGlu
dWU7Cj4gPiAtCQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDApLAo+ID4gRFJJ
VkVSX05BTUUpOwo+ID4gLQkJaWYgKHJldCkKPiA+IC0JCQlnb3RvIGVycl9kaXNhYmxlX2Rldmlj
ZTsKPiA+IC0JCWJyZWFrOwo+ID4gLQl9Cj4gPiArCXJldCA9IHBjaW1faW9tYXBfcmVnaW9ucyhw
ZGV2LCBCSVQoMCksIERSSVZFUl9OQU1FKTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCWdvdG8gZXJy
X2Rpc2FibGVfZGV2aWNlOwo+ID4gwqAgCj4gPiDCoMKgCW1lbXNldCgmcmVzLCAwLCBzaXplb2Yo
cmVzKSk7Cj4gPiDCoMKgCXJlcy5hZGRyID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVswXTsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
